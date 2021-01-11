<?php

define("LETTER_STATUS_PENDING", 0);
define("LETTER_STATUS_ACCEPTED", 1);
define("LETTER_STATUS_REJECTED", 2);


class Letters extends CI_Model {

    function __construct(){
        parent::__construct();
        $this->load->model('Mail');
        $this->load->model('ImageUploader');
        $this->load->library('session');
        $this->load->model('Chats');
        $this->load->model('Session');
        $this->load->model('Seeker');
        $this->load->model('Job');
        $this->load->model('Notifications');
    }
    
    private function getLetterModelKeys() {
        return [
            "letter_id",
            "letter_job",
            "letter_seeker",
            "letter_startdate",
            "letter_salary",
            "letter_message",
            "letter_type",
            "letter_status",
            "status",
            "created_at",
            "modified_at"
        ];
    }    
    
    function addLetter($object) {
        //insert letter to the letter table
        $keys = $this->getLetterModelKeys();
        foreach ($keys as $key) {
            if(key_exists($key, $object)) {
                $this->db->set($key, $object[$key]);
            }
        }
        $this->db->insert("tbl_letter");
        $id = $this->db->insert_id();
        //set job seeker status as completed
        //when job seeker is set as completed, then seeker will not be shown in the job seeker list in stages
        $this->db->where("action_job", $object["letter_job"])
                ->where("action_seeker", $object["letter_seeker"])
                ->set("action_status", JOB_SEEKER_COMPLETED)
                ->update("tbl_job_seekeraction");
        $object["letter_id"]  = $id;
//        $this->setSeekerTitle($object["seeker_id"]);
        $job = $this->db->query("select * from tbl_job where job_id = ". $object["letter_job"])->row();
        $companyuser = $this->db->query("select * from tbl_company_user a inner join tbl_company b on "
                    . "a.companyuser_company = b.company_id where a.companyuser_id = " . $job->job_companyuser)->row();
        if($object["letter_type"]==1){
            $noti_type=NOTIFICATION_TYPE_OFFER_LETTER_RECEIVED;            
        }
        else{
            $noti_type=NOTIFICATION_TYPE_REJECTION_LETTER_RECEIVED;            
        }
        $noti_title="Letter";
        $message =$companyuser->company_name." has sent you a letter ";
        $notification = [
                "notification_type" => $noti_type,
                "notification_seeker" => $object["letter_seeker"],
                "notification_companyuser" => $job->job_companyuser,
                "notification_job" => $job->job_id,
                "notification_read" => 0,
                "notification_message" => $message,
                "notification_title" => $noti_title,
                "notification_letter"=>$id,
                "seeker_id"=>$object["letter_seeker"]
                ];
        $notiId = $this->Notifications->createNotification($notification, $companyuser->fcmtoken)["notification_id"];
        $notiObject = [
                "notification_id"=> $notiId,
                "seeker_id"=> $object["letter_seeker"]
        ];
        $noti = $this->Notifications->getNotification($notiObject);
        return [KEY_RESULT=>RES_SUCCESS, KEY_RES_MESSAGE=>"Added Successfully", "notification"=>$noti["notification"]];      
              //return [KEY_RESULT=>RES_SUCCESS, "letter"=>$object)];
        
    }    
    
    public function changeLetterStatus($object) {

        //check if view is confirmed
        $rows = $this->db->where("letter_id", $object["letter_id"]) 
                ->get("tbl_letter")->num_rows();
        if($rows > 0) {
            $letter = $this->db->query("select * from tbl_letter where letter_id = ". $object["letter_id"])->row();
            $this->db->query("update tbl_letter set letter_status =". $object["letter_status"]."  where letter_id = ". $object["letter_id"]);
            $job = $this->db->query("select * from tbl_job where job_id = ". $letter->letter_job)->row();
            $seeker = $this->db->where("seeker_id", $letter->letter_seeker)->get("tbl_seeker")->row();
            $companyuser = $this->db->query("select * from tbl_company_user a inner join tbl_company b on "
                    . "a.companyuser_company = b.company_id where a.companyuser_id = " . $job->job_companyuser)->row();
            if($object["letter_status"]==LETTER_STATUS_ACCEPTED)
            {
                $noti_type=NOTIFICATION_TYPE_OFFER_LETTER_ACCEPTED;
                $noti_title="Be-Reached";
                $message ="Congratulations! ".$seeker->seeker_firstname ." ".$seeker->seeker_surname. " has accepted your offer for '".$job->job_title."'";                
            }
            elseif($object["letter_status"]==LETTER_STATUS_REJECTED)
            {
                $noti_type=NOTIFICATION_TYPE_OFFER_LETTER_REJECTED;
                $noti_title="Be-Reached";
                $message ="Unfortunately, ".$seeker->seeker_firstname ." ".$seeker->seeker_surname. " has rejected your offer for '".$job->job_title."'";                
            }
            if($object["letter_status"]==LETTER_STATUS_ACCEPTED)
            {
                //notification for seeker
                $notification1 = [
                    "notification_type" => NOTIFICATION_TYPE_SEEKER_OFFER_ACCEPTED,
                    "notification_seeker" => $letter->letter_seeker,
                    "notification_companyuser" => $job->job_companyuser,
                    "notification_job" => $job->job_id,
                    "notification_read" => 0,
                    "notification_message" => "Congratulation on your new job!",
                    "notification_title" => "Be-reached",
                    "notification_letter"=>$object["letter_id"],
                    "seeker_id"=>$seeker->seeker_id
                    ];
                $notiId1 = $this->Notifications->createNotification($notification1, $seeker->fcmtoken)["notification_id"];
            }
            //notification for company
            $notification = [
                "notification_type" => $noti_type,
                "notification_seeker" => $letter->letter_seeker,
                "notification_companyuser" => $job->job_companyuser,
                "notification_job" => $job->job_id,
                "notification_read" => 0,
                "notification_message" => $message,
                "notification_title" => $noti_title,
                "notification_letter"=>$object["letter_id"],
                "companyuser_id"=>$job->job_companyuser
                ];
            $notiId = $this->Notifications->createNotification($notification, $companyUser->fcmtoken)["notification_id"];
            $notiObject = [
                "notification_id"=> $notiId,
                "companyuser_id"=> $job->job_companyuser
                ];
            $noti = $this->Notifications->getNotification($notiObject);
            return [KEY_RESULT=>RES_SUCCESS, KEY_RES_MESSAGE=>$message, "notification"=>$noti["notification"]];      
       
       // return [KEY_RESULT=>RES_SUCCESS];
        }
        else
        { 
            return [KEY_RESULT=>RES_FAIL];                                
	}
        
    }
    
    function getLetters($object) 
    {
        if(isset($object["letter_seeker"]))
        {
    //$object[seeker_id] = $object["letter_seeker];
      
            $letters =  $this->db->query("select a.*, b.job_title as letter_jobtitle, "
                    . "b.job_employmenttype as letter_emptype, b.job_location as letter_location, "
                    . "b.company_name as letter_companyname from tbl_letter a inner join jobs_view b "
                    . "on a.letter_job = b.job_id where a.letter_seeker = " . $object["letter_seeker"])->result_array();
//              var_dump($letters);
            
            return [KEY_RESULT=>RES_SUCCESS, "letters"=> $letters];
        }
        else if(isset($object["seeker_id"]))
        {
    //  return $object["seeker_id"];
            $letters =  $this->db->query("select a.*, b.job_title as letter_jobtitle, "
                    . "b.job_employmenttype as letter_emptype, b.job_location as letter_location, "
                    . "b.company_name as letter_companyname from tbl_letter a inner join jobs_view b "
                    . "on a.letter_job = b.job_id where a.letter_seeker = " . $object["seeker_id"])->result_array();
            return [KEY_RESULT=>RES_SUCCESS, "letters"=>$letters];            
        }
    }
    
    function updateLetter($object) {
        $keys = $this->getLetterModelKeys();
        foreach ($keys as $key) {
            if(key_exists($key, $object)) {
                if($key != "letter_id") {
                    $this->db->set($key, $object[$key]);
                }
            }
        }
        $this->db->where("letter_id", $object["letter_id"]);
        $this->db->update("tbl_letter");
        return [KEY_RESULT=>RES_SUCCESS, KEY_RES_MESSAGE=>"Letter updated successfully"];
    }
    
    function deleteLetter($object) {
        
        $this->db->where("letter_id", $object["letter_id"]);
        $this->db->where("letter_type", 2);
        $this->db->set("status", 0);
        $this->db->update("tbl_letter");
        return [KEY_RESULT=>RES_SUCCESS];
    }
    
}