<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

define ("SCHEDULE_STATUS_PENDING", 0);
define ("SCHEDULE_STATUS_COMPLETED", 1);
//define ("SCHEDULE_STATUS_PROCESSING", 1);
define ("SCHEDULE_STATUS_STOPPED", 2);


class Chats extends CI_Model {
    
    function __construct(){
        parent::__construct();
        $this->load->model('Notifications');
    }
    
    
    
    function createChat($object) {
        
        //check chat already exists
        $chats = $this->db->where("chat_job", $object["chat_job"])
                ->where("chat_seeker", $object["chat_seeker"])
                //->where("chat_room", $object["chat_room"])
                ->get("tbl_chat")->result();
        if(sizeof($chats) > 0) {
            return [KEY_RESULT=>RES_SUCCESS, "chat_id"=>$chats[0]->chat_id];
        }
        
        //add new chat if chat does not exist
        $this->db->set("chat_job", $object["chat_job"])
                ->set("chat_seeker", $object["chat_seeker"])
                ->set("chat_room", $object["chat_room"])
                ->set("chat_createdat", time())
                ->insert("tbl_chat");
        $chatId = $this->db->insert_id();
        //update user status from the seeker companyuser action table
        
        $actions = $this->db->where("action_companyuser", $object["companyuser_id"])
                ->where("action_job", $object["chat_job"])
                ->where("action_seeker", $object["chat_seeker"])
                ->get("tbl_seeker_companyaction")->result();
        
        if(sizeof($actions) > 0){
            $this->db->where("action_companyuser", $object["companyuser_id"])
                ->where("action_job", $object["chat_job"])
                ->where("action_seeker", $object["chat_seeker"])
                ->set("action_timestamp", time())
                ->set("action_status", SEEKER_JOB_COMPANY_ACTION_REACH);
            $this->db->update("tbl_seeker_companyaction");
        }
        else {
            $this->db->set("action_companyuser", $object["companyuser_id"])
                ->set("action_job", $object["chat_job"])
                ->set("action_seeker", $object["chat_seeker"])
                ->set("action_timestamp", time())
                ->set("action_status", SEEKER_JOB_COMPANY_ACTION_REACH);
            $this->db->insert("tbl_seeker_companyaction");
        }
        //udpate job status from job seeker action table
        
        $actions = $this->db->where("action_seeker", $object["chat_seeker"])
                ->where("action_job", $object["chat_job"])
                ->get("tbl_job_seekeraction")->result();
        if(sizeof($actions) > 0){
            $this->db->where("action_seeker", $object["chat_seeker"])
                    ->where("action_job", $object["chat_job"])
                    ->set("action_status", JOB_SEEKER_REACHED)
                    ->set("action_timestamp", time())
                    ->update("tbl_job_seekeraction");
        }
        else {
            $this->db->set("action_seeker", $object["chat_seeker"])
                    ->set("action_job", $object["chat_job"])
                    ->set("action_status", JOB_SEEKER_REACHED)
                    ->set("action_timestamp", time())
                    ->insert("tbl_job_seekeraction");
        }
                
        //send notification to seeker
        $noti = Array();
        //get job object
        $job = $this->db->query("select * from jobs_view where job_id = ".$object["chat_job"])->row();
        //get seeker object
        $seeker = $this->db->where("seeker_id", $object["chat_seeker"])
                ->get("tbl_seeker")->row();
        $noti["notification_type"] = NOTIFICATION_TYPE_JOB_REACHED;
        $noti["notification_seeker"] = $object["chat_seeker"];
        $noti["notification_companyuser"] = $object["companyuser_id"];
        $noti["notification_job"] = $object["chat_job"];
        $noti["notification_read"] = 0;
        $noti["notification_message"] = "Congratulations! ".$job -> company_name." hired you ".$job->job_title;
        $noti["notification_title"] = "New Job Reach Alert";
        $noti["notification_chat"] = $chatId;
        $noti["seeker_id"] = $seeker->seeker_id;
        
        //send noti to seeker
        $this->Notifications->createNotification($noti, $seeker->fcmtoken)["notification_id"];
        
        //create noti to company user
        $companyuser = $this->db->where("companyuser_id", $object["companyuser_id"])
                ->get("tbl_company_user")->row();
        $noti = Array();
        if(key_exists("action_status", $object)) {
            $noti["notification_type"] = NOTIFICATION_TYPE_SEEKER_IMPORTED;
            $noti["notification_seeker"] = $object["chat_seeker"];
            $noti["notification_companyuser"] = $object["companyuser_id"];
            $noti["notification_job"] = $object["chat_job"];
            $noti["notification_read"] = 0;
            $noti["notification_message"] = $seeker -> seeker_firstname. " " . $seeker -> seeker_surname 
                    . " has been imported for '".$job->job_title."'";
            $noti["notification_title"] = "Imported";
            $noti["notification_chat"] = $chatId;
            $noti["companyuser_id"] = $companyuser->companyuser_id;
        }
        else {
            $noti["notification_type"] = NOTIFICATION_TYPE_CHAT_CREATED;
            $noti["notification_seeker"] = $object["chat_seeker"];
            $noti["notification_companyuser"] = $object["companyuser_id"];
            $noti["notification_job"] = $object["chat_job"];
            $noti["notification_read"] = 0;
            $noti["notification_message"] = "You have reached ". $seeker -> seeker_firstname. " " . $seeker -> seeker_surname; 
            $noti["notification_title"] = "Reached";
            $noti["notification_chat"] = $chatId;
            $noti["companyuser_id"] = $companyuser->companyuser_id;
        }
        $notiId = $this->Notifications->createNotification($noti, $companyuser->fcmtoken)["notification_id"];
        $notification = $this->Notifications->getNotification([
            "companyuser_id"=>$companyuser->companyuser_id, 
            "notification_id"=>$notiId
            ]);
        return [KEY_RESULT=>RES_SUCCESS, "chat_id"=>$chatId, "notification"=>$notification["notification"]];        
        
    }
    
    function getChats($object) {
        if(key_exists("seeker_id", $object)) {
            $query = "select * from tbl_chat a inner join tbl_job b on a.chat_job = b.job_id "
                    . "inner join tbl_company_user c on b.job_companyuser = c.companyuser_id "
                    . "inner join tbl_company d on c.companyuser_company = d.company_id "
                    /*. "inner join tbl_job_seekeraction g on a.chat_seeker = g.action_seeker and a.chat_job = g.action_job "
                    . "and g.action_status = " . JOB_SEEKER_REACHED . " "*/
                    . "left join tbl_job_stages e on a.chat_job = e.job_stage_job and a.stageNumber = e.job_stage_number "
                    . "left join tbl_schedule f on f.schedule_job_stage = e.job_stage_id  and f.schedule_seeker = a.chat_seeker "
                    . "where a.chat_seeker = ".$object["seeker_id"];
        }
        else if (key_exists("companyuser_id", $object)) {
            $query = "select * from tbl_chat a inner join tbl_job b on a.chat_job = b.job_id "
                    . "inner join tbl_seeker d on a.chat_seeker = d.seeker_id "
                    . "inner join tbl_company_user c on b.job_companyuser = c.companyuser_id "
                    /*. "inner join tbl_job_seekeraction g on d.seeker_id = g.action_seeker and a.chat_job = g.action_job "
                    . "and g.action_status = " . JOB_SEEKER_REACHED . " "*/
                    . "left join tbl_job_stages e on a.chat_job = e.job_stage_job and a.stageNumber = e.job_stage_number "
                    . "left join tbl_schedule f on f.schedule_job_stage = e.job_stage_id  and f.schedule_seeker = a.chat_seeker "
                    . "where c.companyuser_id = ".$object["companyuser_id"];
        }
        $chats = $this->db->query($query)->result();
        return [KEY_RESULT=>RES_SUCCESS, "chats" => $chats];
    }
    
    function createSchedule($object) {
        //check stage existance
        
        $stages = $this->db->query("select * from tbl_job_stages where job_stage_job = "
                . $object["schedule_job"]." and job_stage_number = "
                . $object["schedule_number"])->result();
        if(sizeof($stages) > 0) {
            $stage_id = $stages[0]->job_stage_id;
        }
        else {
            $this->db->set("job_stage_job", $object["schedule_job"])
                    ->set("job_stage_stage", $object["schedule_stage"])
                    ->set("job_stage_number", $object["schedule_number"])
                    ->insert("tbl_job_stages");
            $stage_id = $this->db->insert_id();
        }
        
        //check schedule existance
        
        $schedules = $this->db->where("schedule_job_stage", $stage_id)
                ->where("schedule_seeker", $object["schedule_seeker"])
                ->get("tbl_schedule")->result();
        if(sizeof($schedules) > 0) {
            return [KEY_RESULT=>RES_FAIL, KEY_RES_MESSAGE=>"Schedule already exists"];
        }
        else {
            $this->db->set("schedule_job_stage", $stage_id)
                    ->set("schedule_seeker", $object["schedule_seeker"])
                    ->set("schedule_enddate", $object["schedule_enddate"])
                    ->set("schedule_startdate", $object["schedule_startdate"])
                    ->insert("tbl_schedule");
            $schedule_id = $this->db->insert_id();
            $seeker = $this->db->where("seeker_id", $object["schedule_seeker"])
                ->get("tbl_seeker")->row();
            $companyuser = $this->db->query("select * from tbl_company_user a inner join tbl_company b on "
                    . "a.companyuser_company = b.company_id where a.companyuser_id = " . $object["companyuser_id"])->row();
            
            $job = $this->db->query("select * from jobs_view where job_id = ".$object["schedule_job"])->row();
            $chat=$this->db->query("select * from tbl_chat where chat_seeker = " . $seeker->seeker_id . " and chat_job = ". $job->job_id)->row();
        
            //send seeker the schedule creation alert           
            date_default_timezone_set($seeker->timezone);
            $timeString = date("D j M h:i A", $object["schedule_startdate"]);
            $noti = Array();
            $noti["notification_type"] = NOTIFICATION_TYPE_SCHEDULE_SEEKER_CREATED;
            $noti["notification_seeker"] = $object["schedule_seeker"];
            $noti["notification_companyuser"] = $object["companyuser_id"];
            $noti["notification_job"] = $object["schedule_job"];
            $noti["notification_read"] = 0;
            $noti["notification_message"] = $companyuser->company_name. " created a schedule: ". $timeString . ".";
            $noti["notification_title"] = "Schedule!";
            $noti["notification_schedule"] = $schedule_id;
            $noti["notification_chat"] = $chat->chat_id;
            $noti["seeker_id"] = $seeker->seeker_id;
            $notiId = $this->Notifications->createNotification($noti, $seeker->fcmtoken)["notification_id"];
            
            //create notification for schedule creation alert
            $noti = Array();
                  
            date_default_timezone_set($companyuser->timezone);
            $timeString = date("D j M h:i A", $object["schedule_startdate"]);
            $noti["notification_type"] = NOTIFICATION_TYPE_CREATE_SCHEDULE;
            $noti["notification_seeker"] = $object["schedule_seeker"];
            $noti["notification_companyuser"] = $object["companyuser_id"];
            $noti["notification_job"] = $object["schedule_job"];
            $noti["notification_read"] = 0;
            $noti["notification_message"] = "You created a schedule: ".$timeString." for ". $seeker -> seeker_firstname. " " . $seeker -> seeker_surname;
            $noti["notification_title"] = "Schedule Set";
            $noti["notification_schedule"] = $schedule_id;
             $noti["notification_chat"] = $chat->chat_id;
             $noti["companyuser_id"] = $companyuser->companyuser_id;
            $notiId = $this->Notifications->createNotification($noti, $companyuser->fcmtoken)["notification_id"];
            $notification = $this->Notifications->getNotification([
                "companyuser_id"=>$companyuser->companyuser_id, 
                "notification_id"=>$notiId
                ])["notification"];
            
            //create notification for stage creation alert
            $noti = Array();
            $noti["notification_type"] = NOTIFICATION_TYPE_STAGE_CREATED;
            $noti["notification_seeker"] = $object["schedule_seeker"];
            $noti["notification_companyuser"] = $object["companyuser_id"];
            $noti["notification_job"] = $object["schedule_job"];
            $noti["notification_read"] = 0;
            $noti["notification_message"] = "You created a stage for ". $seeker -> seeker_firstname. " " . $seeker -> seeker_surname 
                    . " in job ". $job->job_title;
            $noti["notification_title"] = "Stage has been updated";
            $noti["notification_schedule"] = $schedule_id;
                $noti["notification_chat"] = $chat->chat_id;
                $noti["companyuser_id"] = $companyuser->companyuser_id;
            $notiId = $this->Notifications->createNotification($noti, $companyuser->fcmtoken)["notification_id"];
            $notification1 = $this->Notifications->getNotification([
                "companyuser_id"=>$companyuser->companyuser_id, 
                "notification_id"=>$notiId
                ])["notification"];
           
            return [KEY_RESULT=>RES_SUCCESS, "schedule_id"=>$schedule_id, "notification"=>$notification, "notification1"=>$notification1];
        }        
    }
    
    function getSchedules($object) {
        if(key_exists("seeker_id", $object)) {
            $schedules = $this->db->query("select * from tbl_schedule a "
                    . "inner join tbl_job_stages b on a.schedule_job_stage = b.job_stage_id "
                    . "where (a.schedule_status is null or a.schedule_status = 0) and a.schedule_seeker = "
                    . $object["seeker_id"]. " order by a.schedule_startdate")->result();
        }
        else if(key_exists("companyuser_id", $object)) {
            $schedules = $this->db->query("select * from tbl_schedule a "
                    . "inner join tbl_job_stages b on a.schedule_job_stage = b.job_stage_id "
                    . "inner join tbl_job c on b.job_stage_job = c.job_id "
                    . "where (a.schedule_status is null or a.schedule_status = 0) and c.job_companyuser = "
                    . $object["companyuser_id"]. " order by a.schedule_startdate")->result();
        }
        return [KEY_RESULT=>RES_SUCCESS, "schedules"=>$schedules];
    }
    
    function stopSchedule($object) {
            $this->db->where("schedule_id", $object["schedule_id"])
                ->set("schedule_status", 2)
                ->update("tbl_schedule");
        
        $seeker = $this->db->query("select * from tbl_seeker a "
                . "inner join tbl_schedule b on a.seeker_id = b.schedule_seeker "
                . "where schedule_id = ". $object["schedule_id"])->row();
                
             //   var_dump($seeker)
             // this job variable contains schedule data
        $job = $this->db->query("select * from tbl_schedule a "
                . "inner join tbl_job_stages b on a.schedule_job_stage = b.job_stage_id "
                . "inner join jobs_view c on b.job_stage_job = c.job_id "
                . "where a.schedule_id = ". $object["schedule_id"])->row();
                
$jobview = $this->db->query("select * from jobs_view where job_id = ".$job->job_id)->row();
      
$chat=$this->db->query("select * from tbl_chat where chat_seeker = " . $seeker->seeker_id . " and chat_job = ". $job->job_id)->row();
        
        
        //date_default_timezone_set($seeker->timezone);
        
        //$timeString = date("D j M h:i A", $object["schedule_startdate"]);
        $noti = Array();
        $noti["notification_type"] = NOTIFICATION_TYPE_STAGE_STOPPED;
        $noti["notification_seeker"] = $seeker->seeker_id;
        $noti["notification_companyuser"] = $object["companyuser_id"];
        $noti["notification_job"] = $job->job_id;
        $noti["notification_read"] = 0;
        $noti["notification_message"] = $job->company_name . " stopped you at the current Stage for job ".$jobview->job_title;
        $noti["notification_title"] = "Reschedule Set";
        $noti["notification_schedule"] = $object["schedule_id"];
         $noti["notification_chat"] = $chat->chat_id;
         $noti["seeker_id"] = $seeker->seeker_id;
        $this->Notifications->createNotification($noti, $seeker->fcmtoken);
        
        //User x have been stopped in the hiring process for job position x
        
        //date_default_timezone_set($job->timezone);
     //   $timeString = date("D j M h:i A", $object["schedule_startdate"]);
        $noti = Array();
        $noti["notification_type"] = NOTIFICATION_TYPE_STAGE_STOPPED;
        $noti["notification_seeker"] = $seeker->seeker_id;
        $noti["notification_companyuser"] = $object["companyuser_id"];
        $noti["notification_job"] = $job->job_id;
        $noti["notification_read"] = 0;
        $noti["notification_message"] = "You stopped ".$seeker->seeker_firstname." for job ".$jobview->job_title;
        $noti["notification_title"] = "Reschedule Set";
        $noti["notification_schedule"] = $object["schedule_id"];
        $noti["notification_chat"] = $chat->chat_id;
        $noti["companyuser_id"] = $job->companyuser_id;
        $notiId = $this->Notifications->createNotification($noti, $job->fcmtoken)["notification_id"];
        $notification = $this->Notifications->getNotification(["companyuser_id"=>$job->companyuser_id, 
            "notification_id"=>$notiId])["notification"];
        return [KEY_RESULT=>RES_SUCCESS, "notification"=>$notification];
    }
      function updateSchedule($object) {
              $this->db->where("schedule_id", $object["schedule_id"])
        
                ->set("schedule_startdate", $object["schedule_startdate"])
                ->set("schedule_enddate", $object["schedule_enddate"])
                ->update("tbl_schedule");
       
        $seeker = $this->db->query("select * from tbl_seeker a "
                . "inner join tbl_schedule b on a.seeker_id = b.schedule_seeker "
                . "where schedule_id = ". $object["schedule_id"])->row();
                
       //      var_dump($seeker);
        $job = $this->db->query("select * from tbl_schedule a "
                . "inner join tbl_job_stages b on a.schedule_job_stage = b.job_stage_id "
                . "inner join jobs_view c on b.job_stage_job = c.job_id "
                . "where a.schedule_id = ". $object["schedule_id"])->row();
        $chat=$this->db->query("select * from tbl_chat where chat_seeker = " . $seeker->seeker_id . " and chat_job = ". $job->job_id)->row();

        if(isset($seeker->timezone) && !empty($seeker->timezone))
        date_default_timezone_set($seeker->timezone);
        else
        date_default_timezone_set('UTC');
        $timeString = date("D j M h:i A", $object["schedule_startdate"]);
        $noti = Array();
        $noti["notification_type"] = NOTIFICATION_TYPE_UPDATE_SEEKER_SCHEDULE;
        $noti["notification_seeker"] = $seeker->seeker_id;
        $noti["notification_companyuser"] = $object["companyuser_id"];
        $noti["notification_job"] = $job->job_id;
        $noti["notification_read"] = 0;
        $noti["notification_message"] = $job->company_name . " rescheduled: ". $timeString 
                . " for you";
        $noti["notification_title"] = "Reschedule Set";
        $noti["notification_chat"] = $chat->chat_id;
        $noti["notification_schedule"] = $object["schedule_id"];
        $noti["seeker_id"] = $seeker->seeker_id;
        $ncheck = $this->Notifications->createNotification($noti, $seeker->fcmtoken);
        
    if(isset($job->timezone) && !empty($job->timezone))
        date_default_timezone_set($seeker->timezone);
        else
        date_default_timezone_set('UTC');
        
        $timeString = date("D j M h:i A", $object["schedule_startdate"]);
        $noti = Array();
        $noti["notification_type"] = NOTIFICATION_TYPE_UPDATE_SCHEDULE;
        $noti["notification_seeker"] = $seeker->seeker_id;
        $noti["notification_companyuser"] = $object["companyuser_id"];
        $noti["notification_job"] = $job->job_id;
        $noti["notification_read"] = 0;
        $noti["notification_message"] = "You rescheduled: ". $timeString 
                . " for ".$seeker->seeker_firstname. " " . $seeker->seeker_surname;
        $noti["notification_title"] = "Reschedule Set";
        $noti["notification_schedule"] = $object["schedule_id"];
        $noti["notification_chat"] = $chat->chat_id;
        $noti["companyuser_id"] = $job->companyuser_id;
        $notiId = $this->Notifications->createNotification($noti, $job->fcmtoken)["notification_id"];
         
        $notification = $this->Notifications->getNotification(["companyuser_id"=>$job->companyuser_id, 
            "notification_id"=>$notiId])["notification"];
        
        return [KEY_RESULT=>RES_SUCCESS, "notification"=>$notification];
    }
    
    function advanceStage($object) {
        $this->db->where("schedule_id", $object["schedule_id"])
                ->set("schedule_review", $object["schedule_review"])
                ->set("schedule_rating", $object["schedule_rating"])
                ->set("schedule_status", 1)
                ->update("tbl_schedule");
        $seeker = $this->db->query("select * from tbl_seeker a "
                . "inner join tbl_schedule b on a.seeker_id = b.schedule_seeker "
                . "where schedule_id = ". $object["schedule_id"])->row();
        if(!isset($seeker) or empty($seeker))
        {
            return [KEY_RESULT=>RES_SUCCESS, "message"=>"Seeker not found for this schedule"];
        }
        
        
        $job = $this->db->query("select * from tbl_schedule a "
                . "inner join tbl_job_stages b on a.schedule_job_stage = b.job_stage_id "                
                . "inner join enum_stages d on d.stage_id = b.job_stage_stage "               
                . "inner join jobs_view c on b.job_stage_job = c.job_id "
                . "where a.schedule_id = ". $object["schedule_id"])->row();
        //set stage
        if(!isset($job) or empty($job))
        {
            return [KEY_RESULT=>RES_SUCCESS, "message"=>"Job not found for this schedule"];
        }
        $chat=$this->db->query("select * from tbl_chat where chat_seeker = " . $seeker->seeker_id . " and chat_job = ". $job->job_id)->row();
        $this->db->query("update tbl_chat set stageNumber = ". ($job->job_stage_number + 1)
                . " where chat_seeker = " . $seeker->seeker_id . " and chat_job = ". $job->job_id);
        if($job->job_stage_number < strlen($job->job_stages) - 1) {
            $message = "You have been advanced to ".$job->stage_description. " for ".$job->job_title;
        }
        else {
            $message = "You have successfully completed all stages for ".$job->job_title;
        }
                
        $noti = Array();
        $noti["notification_type"] = NOTIFICATION_TYPE_STAGE_SEEKER_ADVANCED;
        $noti["notification_seeker"] = $seeker->seeker_id;
        $noti["notification_companyuser"] = $job->companyuser_id;
        $noti["notification_job"] = $job->job_id;
        $noti["notification_read"] = 0;
        $noti["notification_message"] = $message;
        $noti["notification_title"] = "Advanced candidate";
        $noti["notification_schedule"] = $object["schedule_id"];
        $noti["notification_chat"] = $chat->chat_id;
        $noti["seeker_id"] = $seeker->seeker_id;
        $this->Notifications->createNotification($noti, $seeker->fcmtoken);
        
        if($job->job_stage_number < strlen($job->job_stages) - 1) {
            $message = $seeker->seeker_firstname. " ".
                $seeker->seeker_surname. " has advanced to ".$job->stage_description.
                " for ".$job->job_title;
        }
        else {
            $message = $seeker->seeker_firstname. " ".
                $seeker->seeker_surname. " has successfully completed all stages for ".$job->job_title;
        }
        $noti = Array();
        $noti["notification_type"] = NOTIFICATION_TYPE_STAGE_ADVANCED;
        $noti["notification_seeker"] = $seeker->seeker_id;
        $noti["notification_companyuser"] = $job->companyuser_id;
        $noti["notification_job"] = $job->job_id;
        $noti["notification_read"] = 0;
        $noti["notification_message"] = $message;
        $noti["notification_title"] = "Advanced candidate";
        $noti["notification_schedule"] = $object["schedule_id"];
        $noti["notification_chat"] = $chat->chat_id;
        $noti["companyuser_id"] = $job->companyuser_id;
        $notiId = $this->Notifications->createNotification($noti, $job->fcmtoken)["notification_id"];
        $notification = $this->Notifications->getNotification(["companyuser_id"=>$job->companyuser_id, 
            "notification_id"=>$notiId])["notification"];
        
        //set notifications as read
        //Notifications related with stages and schedules created with schedule should be set as read
        //They do not have meaning when stage is advanced.
        $this->db->query("update tbl_notification set notification_read = 1 where notification_job = "
                .$job->job_id." and ((notification_type > 10 and notification_type < 16) or notification_type = 18) "
                . "and notification_seeker = ". $seeker->seeker_id);
        //stage create notificaiton type is 11 and schedule update notification type is 15
        return [KEY_RESULT=>RES_SUCCESS, "notification"=>$notification];
    }
    
    function stopStage($object) {
        $this->db->where("schedule_id", $object["schedule_id"])
                ->set("schedule_review", $object["schedule_review"])
                ->set("schedule_rating", $object["schedule_rating"])
                ->set("schedule_status", 2)
                ->update("tbl_schedule");
        $seeker = $this->db->query("select * from tbl_seeker a "
                . "inner join tbl_schedule b on a.seeker_id = b.schedule_seeker "
                . "where schedule_id = ". $object["schedule_id"])->row();
        $job = $this->db->query("select * from tbl_schedule a "
                . "inner join tbl_job_stages b on a.schedule_job_stage = b.job_stage_id "                
                . "inner join enum_stages d on d.stage_id = b.job_stage_stage "               
                . "inner join jobs_view c on b.job_stage_job = c.job_id "
                . "where a.schedule_id = ". $object["schedule_id"])->row();
        $chat=$this->db->query("select * from tbl_chat where chat_seeker = " . $seeker->seeker_id . " and chat_job = ". $job->job_id)->row();
        //set stage
        
       /* $this->db->query("update tbl_chat set stageNumber = ". ($job->job_stage_number + 1)
                . " where chat_seeker = " . $seeker->seeker_id . " and chat_job = ". $job->job_id);
        if($job->job_stage_number < strlen($job->job_stages) - 1) {
            $message = "You have been advanced to ".$job->stage_description. " for ".$job->job_title;
        }
        else {
            $message = "You have successfully completed all stages for ".$job->job_title;
        }*/
        $message="You have been stopped for hiring process for ".$job->job_title;
                
        $noti = Array();
        $noti["notification_type"] = NOTIFICATION_TYPE_STAGE_STOPPED;
        $noti["notification_seeker"] = $seeker->seeker_id;
        $noti["notification_companyuser"] = $job->companyuser_id;
        $noti["notification_job"] = $job->job_id;
        $noti["notification_read"] = 0;
        $noti["notification_message"] = $message;
        $noti["notification_title"] = "Stopped Hiring";
        $noti["notification_schedule"] = $object["schedule_id"];
        $noti["notification_chat"] = $chat->chat_id;
        $noti["seeker_id"] = $seeker->seeker_id;
        $this->Notifications->createNotification($noti, $seeker->fcmtoken);
        
        /*if($job->job_stage_number < strlen($job->job_stages) - 1) {
            $message = $seeker->seeker_firstname. " ".
                $seeker->seeker_surname. " has advanced to ".$job->stage_description.
                " for ".$job->job_title;
        }
        else {
            $message = $seeker->seeker_firstname. " ".
                $seeker->seeker_surname. " has successfully completed all stages for ".$job->job_title;
        }*/
        $message = $seeker->seeker_firstname. " ".
                $seeker->seeker_surname. " has been stopped from hiring process for ".$job->job_title;
        $noti = Array();
        $noti["notification_type"] = NOTIFICATION_TYPE_COMPANY_STAGE_STOPPED;
        $noti["notification_seeker"] = $seeker->seeker_id;
        $noti["notification_companyuser"] = $job->companyuser_id;
        $noti["notification_job"] = $job->job_id;
        $noti["notification_read"] = 0;
        $noti["notification_message"] = $message;
        $noti["notification_title"] = "Stopped candidate";
        $noti["notification_schedule"] = $object["schedule_id"];
        $noti["notification_chat"] = $chat->chat_id;
        $noti["companyuser_id"] = $job->companyuser_id;
        $notiId = $this->Notifications->createNotification($noti, $job->fcmtoken)["notification_id"];
        $notification = $this->Notifications->getNotification(["companyuser_id"=>$job->companyuser_id, 
            "notification_id"=>$notiId])["notification"];
        return [KEY_RESULT=>RES_SUCCESS, "notification"=>$notification];
    }
    
    function deleteSchedule($object) {
        
                $schedule_id = $object["schedule_id"];
                $schedule=$this->db->where("schedule_id", $object["schedule_id"])->get("tbl_schedule")->row();
                //var_dump($schedule);die;
                $stage = $this->db->query("select * from tbl_job_stages where job_stage_id = ".$schedule->schedule_job_stage)->row();
            $seeker = $this->db->where("seeker_id", $schedule->schedule_seeker)
                ->get("tbl_seeker")->row();
           
            
            $job = $this->db->query("select * from tbl_job where job_id = ".$stage->job_stage_job)->row();
             $companyuser = $this->db->query("select * from tbl_company_user a inner join tbl_company b on "
                    . "a.companyuser_company = b.company_id where a.companyuser_id = " . $job->job_companyuser)->row();
                     //send seeker the schedule deletion alert           
            $chat=$this->db->query("select * from tbl_chat where chat_seeker = " . $seeker->seeker_id . " and chat_job = ". $job->job_id)->row();
        
        date_default_timezone_set($seeker->timezone);
            $timeString = date("D j M h:i A", $schedule->schedule_startdate);
            $noti = Array();
            $noti["notification_type"] = NOTIFICATION_TYPE_SCHEDULE_DELETE;
            $noti["notification_seeker"] = $schedule->schedule_seeker;
            $noti["notification_companyuser"] = $job->job_companyuser;
            $noti["notification_job"] = $stage->job_stage_job;
            $noti["notification_read"] = 0;
            $noti["notification_message"] = $companyuser->company_name. " deleted a schedule, view their message";
            $noti["notification_title"] = "Schedule Deleted";
            $noti["notification_schedule"] = $schedule_id;
            $noti["notification_chat"] = $chat->chat_id;
        $noti["seeker_id"] = $seeker->seeker_id;
            $notiId = $this->Notifications->createNotification($noti, $seeker->fcmtoken)["notification_id"];
            
                //create notification for schedule deletion alert
            $noti = Array();
                  
            date_default_timezone_set($companyuser->timezone);
            $timeString = date("D j M h:i A", $schedule->schedule_startdate);
            $noti["notification_type"] = NOTIFICATION_TYPE_DELETE_SCHEDULE;
            $noti["notification_seeker"] = $schedule->schedule_seeker;
            $noti["notification_companyuser"] = $job->job_companyuser;
            $noti["notification_job"] = $stage->job_stage_job;
            $noti["notification_read"] = 0;
            $noti["notification_message"] = "You deleted a schedule for ". $seeker -> seeker_firstname. " " . $seeker -> seeker_surname;
            $noti["notification_title"] = "Schedule Deleted";
            $noti["notification_schedule"] = $schedule_id;
            $noti["notification_chat"] = $chat->chat_id;
        $noti["companyuser_id"] = $companyuser->companyuser_id;
            $notiId = $this->Notifications->createNotification($noti, $companyuser->fcmtoken)["notification_id"];
            $notification = $this->Notifications->getNotification([
                "companyuser_id"=>$companyuser->companyuser_id, 
                "notification_id"=>$notiId
                ])["notification"];
                $this->db->where("schedule_id", $object["schedule_id"])
                ->delete("tbl_schedule");
        return [KEY_RESULT=>RES_SUCCESS,notification=>$notification];
    }
    
    function sendLetter($object) {
        $letterId = $this->db->set("letter_job", $object["letter_job"])
                ->set("letter_job", $object["letter_job"])
                ->set("letter_job", $object["letter_job"])
                ->set("letter_job", $object["letter_job"])
                ->set("letter_job", $object["letter_job"])
                ->insert("tbl_letter")->insert_id();
    }
    
    function letterAction($object) {
        
    }
    
    function setChatFavorite($object) {
        if(key_exists("companyuser_id", $object)) {
            $this->db->where("chat_id", $object["chat_id"])
                    ->set("companyuser_like", $object["status"])
                    ->update("tbl_chat");
        }
        if(key_exists("seeker_id", $object)) {
            $this->db->where("chat_id", $object["chat_id"])
                    ->set("seeker_like", $object["status"])
                    ->update("tbl_chat");
        }
        return [KEY_RESULT=>RES_SUCCESS];
    }
    
    function deleteChat($object)
    {
        if(key_exists("chat_id",$object))
        {
            $this->db->where("chat_id", $object["chat_id"])
                ->delete("tbl_chat");
        }
    }

    
}
    