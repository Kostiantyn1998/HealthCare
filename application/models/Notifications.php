<?php

//company side notifications

define("NOTIFICATION_TYPE_COMPANYUSER_VERIFICATION", 1);
define("NOTIFICATION_TYPE_SAVE_SEEKER", 3);
define("NOTIFICATION_TYPE_SHORTLIST_SEEKER", 5);
define("NOTIFICATION_TYPE_JOB_CREATED", 7);
define("NOTIFICATION_TYPE_JOB_APPLIED", 9);
define("NOTIFICATION_TYPE_STAGE_CREATED", 11);
define("NOTIFICATION_TYPE_CREATE_SCHEDULE", 13);
define("NOTIFICATION_TYPE_UPDATE_SCHEDULE", 15);
define("NOTIFICATION_TYPE_STAGE_ADVANCED", 17);
define("NOTIFICATION_TYPE_CHAT_CREATED", 19);
define("NOTIFICATION_TYPE_SEEKER_IMPORTED", 21);
define("NOTIFICATION_TYPE_OFFER_LETTER_ACCEPTED", 23);
define("NOTIFICATION_TYPE_OFFER_LETTER_REJECTED", 25);
define("NOTIFICATION_TYPE_DELETE_SCHEDULE", 27);
define("NOTIFICATION_TYPE_COMPANY_STAGE_STOPPED", 29);
define("NOTIFICATION_TYPE_REACH_SEEKER", 31);

//seeker side notifications
define("NOTIFICATION_TYPE_SEEKER_VERIFICATION", 2);
define("NOTIFICATION_TYPE_JOB_REACHED", 10);
define("NOTIFICATION_TYPE_SCHEDULE_SEEKER_CREATED", 12);
define("NOTIFICATION_TYPE_REQUEST_RESCHEDULE", 14);
define("NOTIFICATION_TYPE_SCHEDULE_DELETE", 16);
define("NOTIFICATION_TYPE_STAGE_SEEKER_ADVANCED", 18);
define("NOTIFICATION_TYPE_STAGE_STOPPED", 20);
define("NOTIFICATION_TYPE_UPDATE_SEEKER_SCHEDULE", 22);
define("NOTIFICATION_TYPE_OFFER_LETTER_RECEIVED", 24);
define("NOTIFICATION_TYPE_REJECTION_LETTER_RECEIVED", 26);
define("NOTIFICATION_TYPE_JOB_SAVED", 28);
define("NOTIFICATION_TYPE_SEEKER_OFFER_ACCEPTED", 30);
class Notifications extends CI_Model {
    
    function __construct(){
        parent::__construct();
        $this->load->model("Chats");
    }
    
    
    function getNotificationModelKeys() {
        return [
            "notification_id",
            "notification_type",
            "notification_seeker",    
            "notification_companyuser",
            "notification_job",
            "notification_read",
            "notification_message",
            "notification_title",
            "notification_chat",
            "notification_schedule",
            "notification_letter"
            ];
    }
    
    public function sendPushNotification($token, $title, $content, $unread, $object = NULL){

         $message_content = $content;
         $message_title = $title;

         $url = "https://fcm.googleapis.com/fcm/send";
 //        api_key available in google-services.json

         $api_key = "AIzaSyBnrTZkTD03wYOqpqdgRzHrHOX9HJgQmpw";

         $notification["to"] = $token;
         $notification["priority"] = "high" ;

         $notification['notification'] = array(
                                 "body" => $message_content,
                                 "title" => $message_title,
                                 "sound" => "notisound.mp3",
                                 "badge" => $unread,
                                 "object" => $object
                                 );

         $headers = array(
                         'Content-Type:application/json',
                         'Authorization:key='.$api_key
                         );

         $ch = curl_init();
         curl_setopt($ch, CURLOPT_URL, $url);
         curl_setopt($ch, CURLOPT_POST, true);
         curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
         curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
         curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
         curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
         curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($notification));

         $result = curl_exec($ch);

         if ($result === FALSE) {
             die('FCM Send Error: ' . curl_error($ch));
         }
         curl_close($ch);
         return;
    }
    
    
    public function createNotification($object, $token) {
        foreach ($this->getNotificationModelKeys() as $key) {
            if(key_exists($key, $object)) {
                $this->db->set($key, $object[$key]);
            }
        }
        $this->db->set("notification_timestamp", time());
        $this->db->insert("tbl_notification");
        $notiId = $this->db->insert_id();
        if(key_exists("seeker_id", $object)) {
            $unread = $this->db->query("select * from tbl_notification where "
                    . "notification_read = 0 and notification_seeker = "
                    .$object["notification_seeker"])->num_rows();
            $noti = $this->getNotification(["seeker_id"=> $object["seeker_id"], "notification_id"=>$notiId])["notification"];
            $this->sendPushNotification($token, $object["notification_title"]
                    , $object["notification_message"], $unread, $noti);
            $this->deleteEarlierNotifications($object);
            
        }
        else if(key_exists("companyuser_id", $object)){
            $unread = $this->db->query("select * from tbl_notification where "
                    . "notification_read = 0 and notification_companyuser = "
                    .$object["companyuser_id"])->num_rows();
            $noti = $this->getNotification(["companyuser_id"=> $object["companyuser_id"], "notification_id"=>$notiId])["notification"];
            $this->sendPushNotification($token, $object["notification_title"]
                    , $object["notification_message"], $unread, $noti);
            $this->deleteEarlierNotifications($object);
        }
        return [KEY_RESULT=>RES_SUCCESS, "notification_id"=>$notiId];
    }
    
    function getNotification($object) {
        if(key_exists("seeker_id", $object)) {
            return [KEY_RESULT=>RES_SUCCESS, "notification"=>
                $this->db->query("select * from tbl_notification a "
                        . "left join tbl_company_user b on a.notification_companyuser = b.companyuser_id "
                        . "left join tbl_company c on b.companyuser_company = c.company_id "
                        . "left join tbl_job d on a.notification_job = d.job_id "
                        . "left join tbl_schedule e on a.notification_schedule = e.schedule_id "
                        . "left join tbl_letter f on a.notification_letter=f.letter_id where a.notification_seeker = ".$object["seeker_id"]
                        . " and notification_type % 2 = 0 and a.notification_id = "
                        . $object["notification_id"]. " order by notification_timestamp desc")->row()];
        }
        if(key_exists("companyuser_id", $object)) {
            $x =  [KEY_RESULT=>RES_SUCCESS, "notification"=>
                $this->db->query("select * from tbl_notification a "
                        . "left join tbl_seeker b on a.notification_seeker = b.seeker_id "
                         . "left join tbl_letter c on a.notification_letter = c.letter_id where a.notification_companyuser = "
                        . $object["companyuser_id"]. " and notification_type % 2 = 1 and a.notification_id = "
                        . $object["notification_id"]. "  order by notification_timestamp desc")->row()];
                                    if(empty($x["notification"]) && isset($object["notification_id"]))
                                    $x =  [KEY_RESULT=>RES_SUCCESS, "notification"=>$this->db->query("select * from tbl_notification where notification_id = ".$object["notification_id"])->row()];
                        return $x;
        }
    }

    private function deleteEarlierNotifications($object) {
        
        if(key_exists("seeker_id", $object)) {
            $query = "DELETE FROM tbl_notification WHERE notification_companyuser = " . $object["seeker_id"]
                    . " and notification_id NOT IN (SELECT notification_id  FROM ( "
                    . "SELECT *FROM tbl_notification s1 WHERE (SELECT COUNT(*) FROM tbl_notification "
                    . "s2 WHERE s1.notification_seeker = s2.notification_seeker AND "
                    . "s1.notification_timestamp <= s2.notification_timestamp ) <= 50) foo)";
            $this->db->query($query);
        }
        else if(key_exists("seeker_id", $object)) {
            $query = "DELETE FROM tbl_notification WHERE notification_companyuser = " . $object["companyuser_id"]
                    . " and notification_id NOT IN (SELECT notification_id  FROM ( "
                    . "SELECT *FROM tbl_notification s1 WHERE (SELECT COUNT(*) FROM tbl_notification "
                    . "s2 WHERE s1.notification_companyuser = s2.notification_companyuser AND "
                    . "s1.notification_timestamp <= s2.notification_timestamp ) <= 50) foo)";
            $this->db->query($query);
        }
    }
    
    public function setNotificationRead($object) {
        if(key_exists("notification_id", $object)) {
            $this->db->set("notification_read", 1)->where("notification_id"
                    , $object["notification_id"])->update("tbl_notification");
        }
        else if(key_exists("notification_type", $object)) {
            if(key_exists("companyuser_id", $object)) {
                $this->db->set("notification_read", 1)
                        ->where("notification_type", $object["notification_type"])
                        ->where("notification_companyuser", $object["companyuser_id"])
                        ->update("tbl_notification");
            }
            if(key_exists("seeker_id", $object)) {
                $this->db->set("notification_read", 1)
                        ->where("notification_type", $object["notification_type"])
                        ->where("notification_seeker", $object["seeker_id"])
                        ->update("tbl_notification");
            }
                    
        }
        return [KEY_RESULT=>RES_SUCCESS];        
    }
    
    public function deleteNotification($object) {
        $this->db->where("notification_id", $object["notification_id"])
                ->delete("tbl_notification");
        return [KEY_RESULT=>RES_SUCCESS];        
    }
    
    public function clearAll($object) {
        if(key_exists("seeker_id", $object)) {
            $this->db->where("notification_seeker", $object["seeker_id"])
                ->delete("tbl_notification");
        }
        else if(key_exists("companyuser_id", $object)) {
            $this->db->where("notification_companyuser", $object["companyuser_id"])
                    ->delete("tbl_notification");
        }
        return [KEY_RESULT=>RES_SUCCESS];        
    }
    
    public function getMyNotifications($object) {
        if(key_exists("notification_timestamp", $object)) {
            if(key_exists("seeker_id", $object)) {
                return [KEY_RESULT=>RES_SUCCESS, "notifications"=>
                    $this->db->query("select * from tbl_notification a "
                            . "left join tbl_company_user b on a.notification_companyuser = b.companyuser_id "
                            . "left join tbl_company c on b.companyuser_company = c.company_id "
                            . "left join tbl_job d on a.notification_job = d.job_id "
                            . "where a.notification_seeker = ".$object["seeker_id"]
                            . " and notification_type % 2 = 0 and notification_timestamp > ".$object["notification_timestamp"] 
                            . " order by notification_timestamp desc")->result()];
            }
            if(key_exists("companyuser_id", $object)) {
                return [KEY_RESULT=>RES_SUCCESS, "notifications"=>
                    $this->db->query("select * from tbl_notification a "
                            . "left join tbl_seeker b on a.notification_seeker = b.seeker_id where a.notification_companyuser = "
                            . $object["companyuser_id"]." and notification_type % 2 = 1  and notification_timestamp > ".$object["notification_timestamp"] 
                            . " order by notification_timestamp desc")->result()];
            }
        }
        else {
            if(key_exists("seeker_id", $object)) {
                return [KEY_RESULT=>RES_SUCCESS, "notifications"=>
                    $this->db->query("select * from tbl_notification a "
                            . "left join tbl_company_user b on a.notification_companyuser = b.companyuser_id "
                            . "left join tbl_company c on b.companyuser_company = c.company_id "
                            . "left join tbl_job d on a.notification_job = d.job_id where a.notification_seeker = ".$object["seeker_id"]
                            . " and notification_type % 2 = 0  order by notification_timestamp desc")->result()];
            }
            if(key_exists("companyuser_id", $object)) {
                return [KEY_RESULT=>RES_SUCCESS, "notifications"=>
                    $this->db->query("select * from tbl_notification a "
                            . "left join tbl_seeker b on a.notification_seeker = b.seeker_id "
                            . "where a.notification_companyuser = "
                            . $object["companyuser_id"]. " and notification_type % 2 = 1  order by notification_timestamp desc")->result()];
            }
        }
    }
    
    

    
    
}
