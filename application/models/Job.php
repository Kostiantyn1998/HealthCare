<?php

class Job extends CI_Model {

    function __construct(){
        parent::__construct();
        $this->load->model("Seeker");
    }
    
    private function getJobModelKeys() {
        return [
            "job_id", 
            "job_companyuser",
            "job_location", 
            "job_title",
            "job_level", 
            "job_skills", 
            "job_yearsofexperience", 
            "job_employmenttype", 
            "job_stages", 
            "job_description"
        ];
    }
    private function solveNulls($object)
    {
       // var_dump($object);
        foreach ($object as $key => $value) {
                
                    if($value == null) {
                        $object->$key = "";
                    }
                
                
            }
            return $object;
    }
    
    function createJob($object) {
        $keys = $this->getJobModelKeys();
        foreach ($keys as $key) {
            if(key_exists($key, $object)) {
                $this->db->set($key, $object[$key]);
            }
        }
        $this->db->set("job_createdat", time());
        $this->db->insert("tbl_job");
        $id = $this->db->insert_id();
        
        //remove draft job
        $this->removeJobDraft($object);
        $job = $this->db->where("job_id", $id)->get("jobs_view")->row();
        
        $notification = [
                "notification_type" => NOTIFICATION_TYPE_JOB_CREATED,
                "notification_seeker" => 0,
                "notification_companyuser" => $job->companyuser_id,
                "notification_job" => $job->job_id,
                "notification_read" => 0,
                "notification_message" => "You have created a job '".$job->job_title."'",
                "notification_title" => "Job created",
                "companyuser_id" => $job->companyuser_id
            ];
        
        $notiId = $this->Notifications->createNotification($notification, $job->fcmtoken)["notification_id"];
        $notification = $this->Notifications->getNotification([
            "companyuser_id"=>$job->companyuser_id, 
            "notification_id"=>$notiId
            ]);
        return [KEY_RESULT=>RES_SUCCESS, KEY_RES_MESSAGE=>"New job successfully created", "job_id"=>$id, "job"=>$job,"notification"=>$notification["notification"]];

    }
    
    function saveJobDraft($object) {
        //insert a new item
        $keys = $this->getJobModelKeys();
        foreach ($keys as $key) {
            if(key_exists($key, $object)) {
                $this->db->set($key, $object[$key]);
            }
        }
        $this->db->insert("tbl_job_draft");
        $id = $this->db->insert_id();
        return [KEY_RESULT=>RES_SUCCESS, KEY_RES_MESSAGE=>"New job successfully created", "job_id"=>$id];

    }
    
    function removeJobDraft($object) {
        $this->db->where("job_companyuser", $object["companyuser_id"])->delete("tbl_job_draft");
        return [KEY_RESULT=>RES_SUCCESS];
    }
    
    function getJobDraft($object) {
        $jobs = $this->db->where("job_companyuser", $object["companyuser_id"])->get("tbl_job_draft")->result();
        if(sizeof($jobs)>0) {
            return [KEY_RESULT=>RES_SUCCESS, "job_draft"=>$jobs[0]];
        }
        else {
            return [KEY_RESULT=>RES_FAIL, KEY_RES_MESSAGE=>"No saved job."];
        }
    }
    
    function updateJob($object) {
        $keys = $this->getJobModelKeys();
        foreach ($keys as $key) {
            if(key_exists($key, $object)) {
                if($key != "job_id") {
                    $this->db->set($key, $object[$key]);
                }
            }
        }
        $this->db->where("job_id", $object["job_id"]);
        $this->db->update("tbl_job");
        return [KEY_RESULT=>RES_SUCCESS, KEY_RES_MESSAGE=>"Job Successfully update"];

    }
    
    function getMyJobs($object) {
        if(key_exists("companyuser_id", $object)) {
            $jobArray = Array();
            $result = $this->db->query("select * from tbl_job where job_companyuser = "
                    .$object["companyuser_id"]." order by job_createdat desc")->result_array();
            foreach($result as $job) {
                $object["job_id"] = $job["job_id"];
                $job["interestedSeeker"] = $this -> Seeker -> getInterestedSeeker($object)["seekers"];
                //var_dump($job);
                //schedules are available for reached seekers for the job if seeker is not reached yet, then can not have schedule
                //if seeker is already completed job, then schedule should not be shown in the list
                $job["schedules"] = $this -> Utils -> solveNullsForArray($this->db->query("select * from tbl_schedule a"
                        . " inner join tbl_job_stages b on a.schedule_job_stage = b.job_stage_id"
                        . " inner join tbl_seeker c on a.schedule_seeker = c.seeker_id"
                        . " inner join tbl_job_seekeraction d on b.job_stage_job = d.action_job"
                        . " and d.action_seeker = c.seeker_id and (d.action_status = "
                        . JOB_SEEKER_REACHED . " or d.action_status = " . JOB_SEEKER_COMPLETED  
                        . ") where job_stage_job = " . $job["job_id"]
                        . " and schedule_status < 2 order by c.seeker_id, b.job_stage_number") -> result());
                array_push($jobArray, $job);
            }
        }
        return [KEY_RESULT=>RES_SUCCESS, "jobs"=>$jobArray];
    }
    
    function deleteJob($object) {
        $this->db->where("job_id", $object["job_id"])->delete("tbl_job");
        return [KEY_RESULT=>RES_SUCCESS, KEY_RES_MESSAGE=>"Job deleted successfully"];
    }
    
    //****Seeker Side Job Functions****//
    //
    /*
     * Search job is function to get matched jobs from the job list
     * There are location and industry, job fields and title and some others 
     * if there is not special location or fields, then set the user current preferred settings
     * if there is special location or fields use them to search jobs
     * Important: Users should be not have actioins before.
     */
    
    
    function searchJob($object) {
        
        $user = $this->db->where("seeker_id", $object["seeker_id"])->get("tbl_seeker")->row();
        
        $query = "select a.*, b.*, c.* from jobs_view a inner join enum_industry c on "
                . "a.company_industry = c.industry_id left join tbl_job_seekeraction b on "
                . "a.job_id = b.action_job and b.action_seeker = "
                .$object["seeker_id"]." left join tbl_company_viewed d on d.seeker_id = "
                . $object["seeker_id"]." and a.company_id = d.company_id"
                . " where b.action_status is null";
        
        if(key_exists("location", $object)) {
            $query = $query." and a.job_location like '%".$object["location"]."%'";
        }
        else {
            $query = $query." and a.job_location like '%".$user->preferredlocation."%'";
        }
        
        if(key_exists("job_industry", $object)) {
            $job_industry = $object["job_industry"];
            $query = $query." and (a.job_title like '%".$job_industry
                    ."%' or a.job_description like '%".$job_industry
                    ."%' or a.job_skills like '%".$job_industry
                    ."%' or c.industry_description like '%".$job_industry."%')";
        }
        else {
            $fields = $user->preferredjobfields;
            $query = $query." and (a.job_title like '%".$fields
                    ."%' or a.job_description like '%".$fields
                    ."%' or a.job_skills like '%".$fields
                    ."%' or c.industry_id & ".$user->preferredindustry." = ".$user->preferredindustry.")";
        }
        
        
        $query = $query." order by a.job_createdat desc";
        return [KEY_RESULT=>RES_SUCCESS, KEY_RES_MESSAGE=>"", "jobs"=>$this->db->query($query)->result()];
    }
    
    function seekerAction($object) {
        //check existing relationship
        $existJobs = $this->db->query("select * from tbl_job_seekeraction where action_seeker = "
                .$object["action_seeker"]." and action_job = ". $object["action_job"])->result();
        $this->db->set("action_job", $object["action_job"]);
        $this->db->set("action_seeker", $object["action_seeker"]);
        $this->db->set("action_status", $object["action_status"]);
        $this->db->set("action_timestamp", time());
        if (sizeof($existJobs) > 0) {
            $this->db->where("action_job", $object["action_job"]);
            $this->db->where("action_seeker", $object["action_seeker"]);
            $this->db->update("tbl_job_seekeraction");
        }
        else {
            $this->db->insert("tbl_job_seekeraction");
        }
        $seekers_details=$this->db->query("select * from tbl_seeker ,(select action_seeker from tbl_job_seekeraction"
                . " where action_status = " . $object["action_status"] . " and action_job = " 
                . $object["action_job"].") as t where t.action_seeker=tbl_seeker.seeker_id")->result();
        $count=count($seekers_details);
        $names="";
    
        if($object["action_status"] == JOB_SEEKER_APPLIED) {
            //get company user information
            $seeker = $this->db->query("select * from tbl_seeker where seeker_id = ". $object["action_seeker"])->row();
            $job = $this->db->query("select * from jobs_view where job_id = ". $object["action_job"])->row();
           // $count = $this->db->query("select count(*) as count from tbl_job_seekeraction"
           //         . " where action_status = " . $object["action_status"] . " and action_job = " . $object["action_job"])->row()->count;
           //$count=count($seekers_details);
           if($count >=1 && $count<=3 ) {
                if($count==1){
                $names=$seekers_details[0]->seeker_firstname. " ". $seekers_details[0]->seeker_surname;
                $message = $names." is interested in '".$job->job_title."'";
                }
                if($count==2){
                $names=$seekers_details[0]->seeker_firstname. " ". $seekers_details[0]->seeker_surname." and ".$seekers_details[1]->seeker_firstname. " ". $seekers_details[1]->seeker_surname;
                $message = $names." are interested in '".$job->job_title."'";
                }
                if($count==3){
                $names=$seekers_details[0]->seeker_firstname. " ". $seekers_details[0]->seeker_surname." , ".$seekers_details[1]->seeker_firstname. " ". $seekers_details[1]->seeker_surname." and ".$seekers_details[2]->seeker_firstname. " ". $seekers_details[2]->seeker_surname;
                $message = $names." are interested in '".$job->job_title."'";
                }
            }
            else if($count>3)
            {
                $names=$seekers_details[0]->seeker_firstname. " ". $seekers_details[0]->seeker_surname
                        ." , ".$seekers_details[1]->seeker_firstname. " ". $seekers_details[1]->seeker_surname
                        ." , ".$seekers_details[2]->seeker_firstname. " ". $seekers_details[2]->seeker_surname;
                $message = $names." and ".($count-3)." more users are interested in '".$job->job_title."'";
            }
            
            $notification = [
                "notification_type" => NOTIFICATION_TYPE_JOB_APPLIED,
                "notification_seeker" => $object["action_seeker"],
                "notification_companyuser" => $job->companyuser_id,
                "notification_job" => $job->job_id,
                "notification_read" => 0,
                "notification_message" => $message,
                "notification_title" => "Interested",
                "companyuser_id" => $job->companyuser_id
            ];
            $this->Notifications->createNotification($notification, $job->fcmtoken);
        }
        if($object["action_status"] == JOB_SEEKER_SAVED) {
            //get company user information
            $seeker = $this->db->query("select * from tbl_seeker where seeker_id = ". $object["action_seeker"])->row();
            $job = $this->db->query("select * from jobs_view where job_id = ". $object["action_job"])->row();
            $message = "You have saved the job '".$job->job_title."'";
            
            $notification = [
                "notification_type" => NOTIFICATION_TYPE_JOB_SAVED,
                "notification_seeker" => $object["action_seeker"],
                "notification_companyuser" => $job->companyuser_id,
                "notification_job" => $job->job_id,
                "notification_read" => 0,
                "notification_message" => $message,
                "notification_title" => "Job Saved",
                "seeker_id" => $object["action_seeker"]
            ];
            $this->Notifications->createNotification($notification, $seeker->fcmtoken);
        }
        return [KEY_RESULT=>RES_SUCCESS];        
    }
    
    function undoAction($object) {
        $this->db->query("delete from tbl_job_seekeraction where action_seeker "
                . "= ".$object["seeker_id"]." order by action_timestamp desc limit 1");
        return [KEY_RESULT=>RES_SUCCESS];
    }
    
    function getSavedJobs($object) {
        return [KEY_RESULT=>RES_SUCCESS, "jobs"=>$this->db->query("select a.*, b.* from jobs_view a "
                . "inner join tbl_job_seekeraction b on a.job_id = b.action_job left join tbl_company_viewed d on d.seeker_id = "
                . $object["seeker_id"]." and a.company_id = d.company_id"
                . " where b.action_seeker = ".$object["seeker_id"]." and b.action_status = ".JOB_SEEKER_SAVED
                ." order by action_timestamp desc ")->result()];
    }

    function getJobDetail($object) {
        return [KEY_RESULT=>RES_SUCCESS, "job"=>$this->db->query("select * from tbl_job where job_id = "
                . $object["job_id"])->result()[0]];
    }
    
    function getAppliedJobs($object) {
        return [KEY_RESULT=>RES_SUCCESS, "jobs"=>$this->db->query("select a.*, b.* from jobs_view a "
                . "inner join tbl_job_seekeraction b on a.job_id = b.action_job "
                . " left join tbl_company_viewed d on d.seeker_id = "
                . $object["seeker_id"]." and a.company_id = d.company_id "
                . "where b.action_seeker = ".$object["seeker_id"]." and b.action_status = ".JOB_SEEKER_APPLIED
                ." order by action_timestamp desc ")->result()];
    }
    
    function getReachedJobs($object) {
        return [KEY_RESULT=>RES_SUCCESS, "jobs"=>$this->db->query("select a.*, b.* from jobs_view a "
                . "inner join tbl_job_seekeraction b on a.job_id = b.action_job  "
                . "left join tbl_company_viewed d on d.seeker_id = "
                . $object["seeker_id"]." and a.company_id = d.company_id"
                . " where b.action_seeker = ".$object["seeker_id"]." and b.action_status = ".JOB_SEEKER_REACHED
                ." order by action_timestamp desc ")->result()];
    }
    
    
}