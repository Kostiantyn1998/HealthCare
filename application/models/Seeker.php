<?php

define("SEEKER_JOB_COMPANY_ACTION_IGNORE", 1);
define("SEEKER_JOB_COMPANY_ACTION_SHORTLIST", 3);
define("SEEKER_COMPANY_ACTION_SAVE", 2);
define("SEEKER_JOB_COMPANY_ACTION_REACH", 4);

define("JOB_SEEKER_SAVED", 1);
define("JOB_SEEKER_APPLIED", 2);
define("JOB_SEEKER_IGNORED", 3);
define("JOB_SEEKER_REACHED", 4);
define("JOB_SEEKER_COMPLETED", 5);
define("JOB_SEEKER_ACCEPTED", 6);
define("JOB_SEEKER_REJECTED", 7);
define("JOB_SEEKER_DECLINED", 8);
define("FACEBOOK", "facebook");
define("GOOGLE", "google");
define("LINKEDIN", "linkedin");


class Seeker extends CI_Model {

    function __construct(){
        parent::__construct();
        $this->load->model('Mail');
        $this->load->model('ImageUploader');
        $this->load->library('session');
        $this->load->model('Chats');
        $this->load->model('Session');
        $this->load->model('Job');
        $this->load->model('Letters');
        $this->load->model('Notifications');
    }
    
    private function getUserModelKeys() {
        return [
            "seeker_id", 
            "seeker_email",
            "seeker_profileemail",
            "seeker_phonenumber", 
            "seeker_profileimage",
            "seeker_cvfile",
            "seeker_firstname",
            "seeker_surname",  
            "seeker_age",
            "seeker_address1", 
            "seeker_address2", 
            "seeker_city",
            "seeker_website",
            "PasswordHash", 
            "Iterations", 
            "Salt",
            "fcmtoken",
            "preferredjobfields",
            "preferredlocation",
            "preferredindustry",
            "timezone",
            "language",
            "seeker_facebookid",
            "seeker_linkedinid",
            "seeker_googleid"
            
            
            
        ];
    }
    
    private function getExperienceModelKeys() {
        return 
        [
            "experience_id",
            "experience_jobtitle",
            "experience_company",
            "experience_from",
            "experience_to",
            "experience_location",
            "experience_description",
            "experience_seeker"
        ];
    }
    private function getEducationModelKeys() {
        return 
        [
            "education_id",
            "education_schoolname",
            "education_degree",
            "education_from",
            "education_to",
            "education_fields",
            "education_grade",
            "education_description",
            "education_seeker"
        ];
    }
    private function getAccomplishmentModelKeys() {
        return 
        [
            "accomplishment_id",
            "accomplishment_type",
            "accomplishment_description",
            "accomplishment_language",
            "accomplishment_proficiency",
            "accomplishment_seeker"
        ];
    }
    
    /***** public functions ******/
    
    public function signUp($object) {
        $password = $this->createPassword($object["seeker_password"]);
        return $user = $this->createUser($object, $password);
    }
    //public function
   public  function signUpWithSocials($object)
    {
      $socialid = "";
      
      
       $imageString = "";
            $keys = $this->getUserModelKeys();
            foreach ($keys as $key) {
                if(key_exists($key, $object)) {
                    if($key === "seeker_id") {
                        continue;
                    }
                    if($key === "seeker_password") {
                        continue;
                    }
                    $this->db->set($key, $object[$key]);
                }
                
            }
            
            
            $this->db->set("seeker_profileemail", $object["seeker_email"]);
           // $this->db->set("PasswordHash", $password["hash"]);
            //$this->db->set("Iterations", $password["iterations"]);
            //$this->db->set("Salt", $password["salt"]);
            $this->db->set("seeker_createdat" , time());
            $this->db->insert("tbl_seeker");
            $seeker_id = $this->db->insert_id();
             
             $notification = [
                "notification_type" => NOTIFICATION_TYPE_SEEKER_VERIFICATION,
                "notification_seeker" => $seeker_id,
                "notification_companyuser" => 0,
                "notification_job" => 0,
                "notification_read" => 0,
                "notification_message" => "Welcome to be-reached ".$object["seeker_email"].
                 " Please complete your profile to start swiping!",
                "notification_title" => "Be-reached",
                "seeker_id" => $seeker_id
            ];
            $this->Notifications->createNotification($notification, $object["fcmtoken"]);
            $notiId = $this->Notifications->createNotification($notification, $object["fcmtoken"])["notification_id"];
            $object1 = [
                "companyuser_id"=>$seeker_id,
                "notification_id"=>$notiId
                ];
            $notification = $this->Notifications->getNotification($object1);
        //var_dump($notification);
            return [
                KEY_RESULT=>RES_SUCCESS, 
                "seeker_id"=>$seeker_id,
                "notification"=>$notification["notification"],
                "KEY_RES_MESSAGE"=>"Success"];
        
    }
     public  function signInWithSocial($object)
    {
        
        if(key_exists("social",$object) )  
        {
            
        if($object["social"] == "facebook")
        {
            $users = $this->db->where("seeker_facebookid", $object["seeker_facebookid"])->get("tbl_seeker")->result();  
        }else if($object["social"]== "linkedin")
        {
            $users = $this->db->where("seeker_linkedinid", $object["seeker_linkedinid"])->get("tbl_seeker")->result();  
        }else if($object["social"] == "google")
        {
            $users = $this->db->where("seeker_googleid", $object["seeker_googleid"])->get("tbl_seeker")->result();  
        }else
        {
        return [
                KEY_RESULT=>RES_FAIL,
                KEY_RES_MESSAGE=>"Social Platform Issue"];
        }
        
        
          if(sizeof($users) === 0) {
              
          return  $this->signUpWithSocials($object);
         
        }
        else if(sizeof($users) > 0)
        {
        $user = $users[0];
        
            //  if($comparableHash === $user->PasswordHash) {
            //udpate fcm token
            if(key_exists("timezone", $object)){
                $this->db->set("fcmtoken", $object["fcmtoken"])
                        ->set("timezone", $object["timezone"])
                        ->where("seeker_id", $user->seeker_id)->update("tbl_seeker");
            }
            else {
                $this->db->set("fcmtoken", $object["fcmtoken"])->where("seeker_id", $user->seeker_id)->update("tbl_seeker");
            }
            
            //get user with user id
            
            $userObject = ["seeker_id"=>$user->seeker_id];
            $loggedUser = $this->db->query("select * from tbl_seeker where seeker_id = ".$userObject["seeker_id"])->row();
            $result = Array();
            $result[KEY_RESULT] = RES_SUCCESS;
            $result["user"] = $loggedUser;
            $result[KEY_RES_MESSAGE] = "Login successful!";
            $result["experiences"] = $this->getExperiences($userObject)["experiences"];
            $result["educations"] = $this->getEducations($userObject)["educations"];
            $result["accomplishments"] = $this->getAccomplishments($userObject)["accomplishments"];
            $result["savedJobs"] = $this->Job->getSavedJobs($userObject)["jobs"];
            $result["appliedJobs"] = $this->Job->getAppliedJobs($userObject)["jobs"];
            $result["reachedJobs"] = $this->Job->getReachedJobs($userObject)["jobs"];
            $result["chats"] = $this->Chats->getChats($userObject)["chats"];
            $result["schedules"] = $this->Chats->getSchedules($userObject)["schedules"];
            $result["letters"] = $this->Letters->getLetters($userObject)["letters"];
            $result["notifications"] = $this->Notifications->getMyNotifications($userObject)["notifications"];
            return $result;
        }
        else {
            return [
                KEY_RESULT=>RES_FAIL,
                KEY_RES_MESSAGE=>"Invalid Keys!"];
        }
        }
    
    
    }
    public function signIn($object) {
        
        $isSocial = false;
        if(key_exists("seeker_facebookid", $object)) {
            if(key_exists("seeker_email", $object)) {
                $this->db->where("seeker_email", $object["seeker_email"])
                        ->set("seeker_facebookid", $object["seeker_facebookid"])
                        ->set("seeker_emailverified", "1")->update("tbl_seeker");
            }
            else {
                $users = $this->db->where("seeker_facebookid", $object["seeker_facebookid"])->get("tbl_seeker")->result();
            }
            $isSocial = true;
        }
        else if(key_exists("seeker_linkedinid", $object)) {
            if(key_exists("seeker_email", $object)) {
                $this->db->where("seeker_email", $object["seeker_email"])->set("seeker_linkedinid", $object["seeker_linkedinid"])
                        ->set("seeker_emailverified", "1")->update("tbl_seeker");
            }
            else {
                $users = $this->db->where("seeker_linkedinid", $object["seeker_linkedinid"])->get("tbl_seeker")->result();
            }
            $isSocial = true;
        }
        else if(key_exists("seeker_googleid", $object)) {
            if(key_exists("seeker_email", $object)) {
                $this->db->where("seeker_email", $object["seeker_email"])->set("seeker_googleid", $object["seeker_googleid"])
                        ->set("seeker_emailverified", "1")->update("tbl_seeker");
            }
            else {
                $users = $this->db->where("seeker_googleid", $object["seeker_googleid"])->get("tbl_seeker")->result();
            }
            $isSocial = true;
        }
        
        if(key_exists("seeker_email", $object)) {
            $users = $this->db->where("seeker_email", $object["seeker_email"])->get("tbl_seeker")->result();            
        }
        else if(!$isSocial) {
            return [
                KEY_RESULT=>RES_FAIL,
                KEY_RES_MESSAGE=>"Invalid Parameters"];
        }
        if(sizeof($users) === 0) {
            return [
                KEY_RESULT=>RES_FAIL,
                KEY_RES_MESSAGE=>"Email is not reigstered!"];
        }
        $user = $users[0];        
        $comparableHash = "";
        if(key_exists("seeker_password", $object)) {
            $comparableHash = hash_pbkdf2('sha256', $object["seeker_password"], $user->Salt, $user->Iterations);
        }
        //echo $comparableHash;
        if((key_exists("seeker_password", $object) && $comparableHash === $user->PasswordHash) || $isSocial === true) {
            //udpate fcm token
            if(key_exists("timezone", $object)){
                $this->db->set("fcmtoken", $object["fcmtoken"])
                        ->set("timezone", $object["timezone"])
                        ->where("seeker_id", $user->seeker_id)->update("tbl_seeker");
            }
            else {
                $this->db->set("fcmtoken", $object["fcmtoken"])->where("seeker_id", $user->seeker_id)->update("tbl_seeker");
            }
            
            //get user with user id
            
            $userObject = ["seeker_id"=>$user->seeker_id];
            $loggedUser = $this->db->query("select * from tbl_seeker where seeker_id = ".$userObject["seeker_id"])->row();
            $result = Array();
            $result[KEY_RESULT] = RES_SUCCESS;
            $result["user"] = $loggedUser;
            $result[KEY_RES_MESSAGE] = "Login successful!";
           $result["experiences"] = $this->getExperiences($userObject)["experiences"];
            $result["educations"] = $this->getEducations($userObject)["educations"];
            $result["accomplishments"] = $this->getAccomplishments($userObject)["accomplishments"];
            $result["savedJobs"] = $this->Job->getSavedJobs($userObject)["jobs"];
            $result["appliedJobs"] = $this->Job->getAppliedJobs($userObject)["jobs"];
            $result["reachedJobs"] = $this->Job->getReachedJobs($userObject)["jobs"];
            $result["chats"] = $this->Chats->getChats($userObject)["chats"];
            $result["schedules"] = $this->Chats->getSchedules($userObject)["schedules"];
            $result["letters"] = $this->Letters->getLetters($userObject)["letters"];
            $result["notifications"] = $this->Notifications->getMyNotifications($userObject)["notifications"];
            return $result;
        }
        else {
            return [
                KEY_RESULT=>RES_FAIL,
                KEY_RES_MESSAGE=>"Invalid Password!"];
        }
    }
    
    public function getSeeker($object) {
        if(key_exists("companyuser_id", $object)) {
            $this->addViewCount($object);
        }
        $loggedUser = $this->db->query("select * from tbl_seeker where seeker_id = ".$object["seeker_id"])->row();
        $result = Array();
        $result[KEY_RESULT] = RES_SUCCESS;
        $result["user"] = $loggedUser;
        $result[KEY_RES_MESSAGE] = "User Information Got successfully!";
        $result["experiences"] = $this->getExperiences($object)["experiences"];
        $result["educations"] = $this->getEducations($object)["educations"];
        $result["accomplishments"] = $this->getAccomplishments($object)["accomplishments"];
        //$result["savedJobs"] = $this->Job->getSavedJobs($object)["jobs"];
        //$result["appliedJobs"] = $this->Job->getAppliedJobs($object)["jobs"];
        //$result["reachedJobs"] = $this->Job->getReachedJobs($object)["jobs"];
        
        return $result;
    }
    
    public function addViewCount($object) {
        //check if view is confirmed
        $rows = $this->db->where("companyuser_id", $object["companyuser_id"])
                ->where("seeker_id", $object["seeker_id"])
                ->get("tbl_seeker_viewed")->num_rows();
        if($rows == 0) {
            $this->db->set("companyuser_id", $object["companyuser_id"])
                    ->set("seeker_id", $object["seeker_id"])
                    ->insert("tbl_seeker_viewed");
            $this->db->query("update tbl_seeker set seeker_profileviews = seeker_profileviews + 1 where seeker_id = ". $object["seeker_id"]);
        }
        
        return [KEY_RESULT=>RES_SUCCESS];
        
    }
    public function changeShowMe($object) {
        //check if view is confirmed
        $message = "Server Error";
        if($object['showme']==1)
        {
            $message = "Thanks, Now you will be visible to Employers.";
        }
        else
        {
            $message = "You will successfully hidden yourself on BeReached.";
        }
        $rows = $this->db
                ->where("seeker_id", $object["seeker_id"])
                ->get("tbl_seeker")->num_rows();
        if($rows != 0) {
            
            $this->db->query("update tbl_seeker set showme = ".$object['showme'] ." where seeker_id = ". $object["seeker_id"]);
        return [KEY_RESULT=>RES_SUCCESS ,   KEY_RES_MESSAGE=>$message];
            
        }
        else
        {
            return [KEY_RESULT=>RES_FAIL, KEY_RES_MESSAGE=>$message];
        }
    }
    public function changeSeekerEmail($object) {
        //check if view is confirmed
        $message = "Email has been changed successfully";
        
        $rows = $this->db
                ->where("seeker_email", $object["seeker_newemail"])
                ->get("tbl_seeker")->num_rows();
        if($rows == 0) {
            $message = "Email has been changed successfully";
            $this->db->query("update tbl_seeker set seeker_email = '".$object['seeker_newemail'] ."' where seeker_id = ". $object["seeker_id"]);
        return [KEY_RESULT=>RES_SUCCESS ,   KEY_RES_MESSAGE=>$message];
            
        }
        else
        {
            $message = "Unable to change Email , this email is already in use";
            return [KEY_RESULT=>RES_FAIL, KEY_RES_MESSAGE=>$message];
        }
        
        
        
    }
    public function changeSeekerPassword($object) {
        
        $users = $this->db->where("seeker_id", $object["seeker_id"])->get("tbl_seeker")->result();
        if(sizeof($users) === 0) {
            return [
                KEY_RESULT=>RES_FAIL,
                KEY_RES_MESSAGE=>"Invalid Parameters"];
        }
        $user = $users[0];
        $comparableHash = hash_pbkdf2('sha256', $object["seeker_password"], $user->Salt, $user->Iterations);
        //echo $comparableHash;
        if($comparableHash === $user->PasswordHash) {
        $password = $this->createPassword($object["seeker_newpassword"]);
            $message = "Password has been changed successfully";
            $this->db->query("update tbl_seeker set PasswordHash = '".$password["hash"] ."', Iterations = '".$password["iterations"]."', Salt = '".$password["salt"]."' where seeker_id = ". $object["seeker_id"]);
        //$this->db->set("Iterations", $password["iterations"]);
          //  $this->db->set("Salt", $password["salt"]);
        return [KEY_RESULT=>RES_SUCCESS ,   KEY_RES_MESSAGE=>$message];
        
            
        }
        else
        {
            $message = "Current password is not correct";
         return [KEY_RESULT=>RES_SUCCESS ,   KEY_RES_MESSAGE=>$message];   
        }
        //check if view is confirmed
        
        
    }
    
    public function addRecommendCount($object) {
        //check if recommendation is confirmed
        $rows = $this->db->where("companyuser_id", $object["companyuser_id"])
                ->where("seeker_id", $object["seeker_id"])
                ->get("tbl_seeker_recommended")->num_rows();
        if($rows == 0) {
            $this->db->set("companyuser_id", $object["companyuser_id"])
                    ->set("seeker_id", $object["seeker_id"])
                    ->insert("tbl_seeker_recommended");
            $this->db->query("update tbl_seeker set seeker_recommendations = seeker_recommendations + 1 where seeker_id = ". $object["seeker_id"]);
        }
        
        return [KEY_RESULT=>RES_SUCCESS];
        
    }


    public function logout($object) {
        $this->db->where("seeker_id", $object["seeker_id"])->set("fcmtoken", "")->update("tbl_seeker");
        return [KEY_RESULT=>RES_SUCCESS];
    }
    
    public function forgotPassword($object) {
        return $this->startVerification($object["seeker_email"]);
    }

    
    public function verifyUser($object){
        
        $users = $this->db->query("select * from tbl_seeker where seeker_email = '".$object["seeker_email"]."'")->result();
        if(sizeof($users) > 0) {
            $user = $users[0];
            if(is_null($user->ActivationPin)) {
                
                return [
                    KEY_RESULT=>RES_SUCCESS,
                    KEY_RES_MESSAGE=>"Your account has already activated",
                    "user"=>$user];
            }
            else {
                if($user->ActivationPin === $object["pin"]) {
                    $this->db->set("ActivationPin", NULL)->where("seeker_id", $user->seeker_id)->update("tbl_seeker");
                    $object["seeker_id"] = $user->seeker_id;
                    //update user status
                    $users = $this->db->where("seeker_id", $object["seeker_id"])->get("tbl_seeker")->result();
                    $user = $users[0];
                    $object["user_status"] = $user->user_status;
                    $this->db->set("user_status", $this->checkUserStatus($object))
                            ->where("seeker_id", $user->seeker_id)
                            ->update("tbl_seeker");
                    $users = $this->db->where("seeker_id", $user->seeker_id)->get("tbl_seeker")->result();
                    return [  
                        KEY_RESULT=>RES_SUCCESS,
                        KEY_RES_MESSAGE=>"Your account has been activated successfully",
                        "user"=>$users[0]];
                }
                else {
                    return [
                        KEY_RESULT=>RES_FAIL,
                        KEY_RES_MESSAGE=>"Invalid pin code! Please check pin code again!"
                        ];
                }
            }
            
        }
        return [
            KEY_RESULT=>RES_FAIL,
            KEY_RES_MESSAGE=>"Your email is not registered yet!"];
    }
    
    public function resendVerifyCode($object) {
        $users = $this->db->where("seeker_email", $object["seeker_email"])->get("tbl_seeker")->result();
        if(sizeof($users) === 0) {
            return [
                KEY_RESULT=>RES_FAIL,
                KEY_RES_MESSAGE=>"Email is not registered yet!"];
        }
        return $this->startVerification($object["seeker_email"]);//$this->setVerificationDetails($users[0]->user_email, $users[0]->ActivationCode, $users[0]->ActivationPin);
    }

    public function updateProfile($object) {
       
        $status = $this->checkUserAvailable($object);
        if ($status == RES_SUCCESS) {
            $keys = $this->getUserModelKeys();

            //set values for key
            foreach ($keys as $key) {
                if(key_exists($key, $object)) {
                    if($key != "seeker_id" && $key != "seeker_email" && $key != "seeker_password") {
                        $this->db->set($key, $object[$key]);
                    }
                }
            }        

            //update user password fields            
            if(key_exists("seeker_password", $object)) {

                $password = $this->createPassword($object["seeker_password"]);            
                $this->db->set("PasswordHash", $password["hash"]);
                $this->db->set("Iterations", $password["iterations"]);
                $this->db->set("Salt", $password["salt"]);
                $this->db->update("tbl_seeker");
                //get user object
                return [
                        KEY_RESULT=>RES_SUCCESS,
                        KEY_RES_MESSAGE=>"New password saved"];
            }
            //filter for user id
            $this->db->where("seeker_id", $object["seeker_id"]);            
            $this->db->update("tbl_seeker");
            //get user object
            return [
                    KEY_RESULT=>RES_SUCCESS,
                    KEY_RES_MESSAGE=>"Profile updated successfully"];
        }
        else {
            return [
                    KEY_RESULT=>RES_FAIL,
                    KEY_RES_MESSAGE=>$status];
        }
    }
    
    
    public function updateProfileImage($object) {
        $users = $this->db->where("seeker_id", $object["seeker_id"])->get("tbl_seeker")->result();
        if(sizeof($users) > 0) {
            $user = $users[0];
            $imageUrls = $this->ImageUploader->uploadImage($object);
            if($imageUrls[KEY_RESULT] === RES_SUCCESS) {
                $imageString = $imageUrls["image_url"];
                $this->db->set("seeker_profileimage", $imageString)->where("seeker_id", $object["seeker_id"])->update("tbl_seeker");
                return [KEY_RESULT=>RES_SUCCESS, KEY_RES_MESSAGE=>"Image uploaded successfully!", "seeker_profileimage"=>$imageString];
            }
            else {
                return $imageUrls;
            }
        }
    }
    
    public function updateCVImage($object) {
        $users = $this->db->where("seeker_id", $object["seeker_id"])->get("tbl_seeker")->result();
        if(sizeof($users) > 0) {
            $user = $users[0];
            $imageUrls = $this->ImageUploader->uploadImage($object);
            if($imageUrls[KEY_RESULT] === RES_SUCCESS) {
                $imageString = $imageUrls["image_url"];
                $this->db->set("seeker_cvfile", $imageString)->where("seeker_id", $object["seeker_id"])->update("tbl_seeker");
                return [KEY_RESULT=>RES_SUCCESS, KEY_RES_MESSAGE=>"Image uploaded successfully!", "seeker_cvfile"=>$imageString];
            }
            else {
                return $imageUrls;
            }
        }
    }
      

    /******* private functions *******/
    
    private function createPassword($password){
        $salt = $this->Session->generateRandomString(32);
        $iterations = rand(1000,9999);
        
        $passHash = hash_pbkdf2('sha256', $password, $salt, $iterations);
        return [
            "salt" => $salt,
            "hash" => $passHash,
            "iterations" => $iterations
        ];
    }
   
    
    private function createUser($object, $password)
    {
        $available = $this->checkUserAvailable($object);
        if($available == RES_SUCCESS) {
            
            $imageString = "";
            $keys = $this->getUserModelKeys();
            foreach ($keys as $key) {
                if(key_exists($key, $object)) {
                    if($key === "seeker_id") {
                        continue;
                    }
                    if($key === "seeker_password") {
                        continue;
                    }
                    $this->db->set($key, $object[$key]);
                }
            }
            $this->db->set("seeker_profileemail", $object["seeker_email"]);
            $this->db->set("PasswordHash", $password["hash"]);
            $this->db->set("Iterations", $password["iterations"]);
            $this->db->set("Salt", $password["salt"]);
            $this->db->set("seeker_createdat" , time());
            $this->db->insert("tbl_seeker");
            $seeker_id = $this->db->insert_id();
            //send notification for account verification
            $notification = [
                "notification_type" => NOTIFICATION_TYPE_SEEKER_VERIFICATION,
                "notification_seeker" => $seeker_id,
                "notification_companyuser" => 0,
                "notification_job" => 0,
                "notification_read" => 0,
                "notification_message" => "Welcome to be-reached ".$object["seeker_firstname"]." ".$object["surname"].
                 " Please complete your profile to start swiping!",
                "notification_title" => "Be-reached",
                "seeker_id" => $seeker_id
            ];
            $this->Notifications->createNotification($notification, $object["fcmtoken"]);
            $notiId = $this->Notifications->createNotification($notification, $object["fcmtoken"])["notification_id"];
            $object1 = [
                "companyuser_id"=>$seeker_id,
                "notification_id"=>$notiId
                ];
            $notification = $this->Notifications->getNotification($object1);
            return [
                KEY_RESULT=>RES_SUCCESS, 
                "seeker_id"=>$seeker_id,
                "notification"=>$notification["notification"],
                KEY_RES_MESSAGE=>NotifyVerification];
        }
        else {
            return [
                KEY_RESULT=>RES_FAIL,
                KEY_RES_MESSAGE=>$available];
        }
    }
    
    
    private function startVerification($email){
        $activationCode = md5(random_bytes(32));
        $pin = rand(100000, 999999);
        return $this->setVerificationDetails($email, $activationCode, $pin);
    }
    
    private function setVerificationDetails($email, $activationCode, $pin)
    {
        $this->db->query("update tbl_seeker SET ActivationCode = '".$activationCode."', ActivationPin = '".$pin."' where seeker_email = '".$email."'");
        $mail = Mail::setUpMail();        
        $mail->addAddress($email);
        $mail->isHTML(FALSE);
        $mail->Subject = "Verify code";
        $mail->Body = "Hi, Please verify your account using the following PIN code: " . $pin;

        if (! $mail->send()) {
            //echo "ERROR!" . $mail->ErrorInfo;
            return [
                KEY_RESULT=>RES_FAIL,
                KEY_RES_MESSAGE=>"Verification failed!"];
        }

        return [
            KEY_RESULT=>RES_SUCCESS, 
            KEY_RES_MESSAGE=>"Verification code successfully sent! Please check your email!",
            "pin"=>$pin];
    }
    
    private function checkUserAvailable($object) {
        if(key_exists("seeker_id", $object)) {
            $query = "";
            if (key_exists("seeker_email", $object)) {
                $query = "seeker_email = '".$object["seeker_email"]."'";
            }
            if (key_exists("seeker_phonenumber", $object)) {
                if(strlen($query) > 0) {
                    $query = $query." or seeker_phonenumber = '".$object["seeker_phonenumber"]."'";
                }
                else {
                    $query = "seeker_phonenumber = '".$object["seeker_phonenumber"]."'";
                }
            }
            
            if(strlen($query) > 0) {
                $users = $this->db->query("select * from tbl_seeker where seeker_id <> '".
                        $object["seeker_id"]."' and (".$query.")")->result();
            }
            else {
                return RES_SUCCESS;
            }
        }
        else {
            $users = $this->db->where("seeker_email", $object["seeker_email"])
                    ->or_where("seeker_phonenumber", $object["seeker_phonenumber"])
                    ->get("tbl_seeker")->result();
        }
        if(sizeof($users)>0) {
            $result = "";
            $user = $users[0];
            
            if (key_exists("seeker_email", $object)) {
                if($user->seeker_email == $object["seeker_email"]) {
                    $result = "Email";
                }
            }
            if (key_exists("seeker_phonenumber", $object)) {
                if($user->seeker_phonenumber == $object["seeker_phonenumber"]) {
                    if(strlen($result) > 0) {
                        $result = $result.", Phone number";
                    }
                    else {
                        $result = "Phone number";
                    }
                }
            }
            if (key_exists("seeker_mobilenumber", $object)) {
                if($user->seeker_mobilenumber == $object["seeker_mobilenumber"]) {
                
                    if(strlen($result) > 0) {
                        $result = $result.", Mobile number";
                    }
                    else {
                        $result = "Mobile number";
                    }
                }                
            }
            return $result." already exists!";
        }
        return RES_SUCCESS;
    }
    
    function addExperience($object) {
        
        $keys = $this->getExperienceModelKeys();
        foreach ($keys as $key) {
            if(key_exists($key, $object)) {
                $this->db->set($key, $object[$key]);
            }
        }
        $this->db->insert("tbl_seeker_experience");
        $id = $this->db->insert_id();
        $this->setSeekerTitle($object["seeker_id"]);
        return [KEY_RESULT=>RES_SUCCESS, "experience_id"=>$id, "seeker_title"=>$this->setSeekerTitle($object["seeker_id"])];
        
    }
    
    
    function updateExperience($object) {
        
        $keys = $this->getExperienceModelKeys();
        foreach ($keys as $key) {
            if(key_exists($key, $object)) {
                if($key != "experience_id") {
                    $this->db->set($key, $object[$key]);
                }
            }
        }
        $this->db->where("experience_id", $object["experience_id"]);
        $this->db->update("tbl_seeker_experience");
        $this->setSeekerTitle($object["seeker_id"]);
        return [KEY_RESULT=>RES_SUCCESS, KEY_RES_MESSAGE=>"Experience updated successfully", "seeker_title"=>$this->setSeekerTitle($object["seeker_id"])];
        
    }    
    
    function deleteExperience($object) {
        $this->db->where("experience_id", $object["experience_id"]);
        $this->db->delete("tbl_seeker_experience");
        return [KEY_RESULT=>RES_SUCCESS, "seeker_title"=>$this->setSeekerTitle($object["seeker_id"])];
    }
    
    function getExperiences($object) {
        return [KEY_RESULT=>RES_SUCCESS, "experiences"=>$this->db->
                where("experience_seeker", $object["seeker_id"])->get("tbl_seeker_experience")->result()];
    }
    
    function addEducation($object) {
        $keys = $this->getEducationModelKeys();
        foreach ($keys as $key) {
            if(key_exists($key, $object)) {
                $this->db->set($key, $object[$key]);
            }
        }
        $this->db->insert("tbl_seeker_education");
        $id = $this->db->insert_id();
        return [KEY_RESULT=>RES_SUCCESS, "education_id"=>$id, "seeker_title"=>$this->setSeekerTitle($object["seeker_id"])];
    }
    
    function updateEducation($object) {
        $keys = $this->getEducationModelKeys();
        foreach ($keys as $key) {
            if(key_exists($key, $object)) {
                if($key != "education_id") {
                    $this->db->set($key, $object[$key]);
                }
            }
        }
        $this->db->where("education_id", $object["education_id"]);
        $this->db->update("tbl_seeker_education");
        return [KEY_RESULT=>RES_SUCCESS, KEY_RES_MESSAGE=>"Education updated successfully", "seeker_title"=>$this->setSeekerTitle($object["seeker_id"])];
    }
    
    function deleteEducation($object) {
        $this->db->where("education_id", $object["education_id"]);
        $this->db->delete("tbl_seeker_education");
        return [KEY_RESULT=>RES_SUCCESS, "seeker_title"=>$this->setSeekerTitle($object["seeker_id"])];
    }
    
    function getEducations($object) {
        return [KEY_RESULT=>RES_SUCCESS, "educations"=>$this->db->
                query("select * from tbl_seeker_education a inner join enum_educationdegree b on "
                        . "a.education_degree = b.degree_id where a.education_seeker = ".$object["seeker_id"])->result()];
    }
    
    private function setSeekerTitle($seekerId) {
        $experiences = $this->getExperiences(["seeker_id"=>$seekerId])["experiences"];
        $educations = $this->getEducations(["seeker_id"=>$seekerId])["educations"];
        $title = "";
        if(sizeof($experiences) > 0) {
            for ($i = 0; $i < sizeof($experiences) ; $i++) {
                $experience = $experiences[$i];
                if ($experience -> experience_to == "Present") {
                    $title = $experience -> experience_jobtitle." at ".$experience->experience_company;
                    break;
                }
            }
        }
        if(sizeof($educations) > 0) {
            $toTime = 0;
            for ($i = 0; $i < sizeof($educations) ; $i++) {
                $education = $educations[$i];
                $timeArray = explode("/", $education->education_to);
                
                if ($timeArray[2] * 10000 + $timeArray[1] * 100 + $timeArray[0] > $toTime) {
                    $lastEducation = $education;
                    $toTime = $timeArray[2] * 10000 + $timeArray[1] * 100 + $timeArray[0];
                }
            }
            if(strlen($title) == 0) {
                $title = "Seeking job\n".$lastEducation->degree_description." of ".$lastEducation->education_schoolname;
            }
            else {
                $title = $title."\n".$lastEducation->degree_description." of ".$lastEducation->education_schoolname;
            }
        }
        if(strlen($title) == 0) {
            $title = "Seeking job";
        }
        $this->db->where("seeker_id", $seekerId)->set("seeker_title", $title)->update("tbl_seeker");
        return $title;
    }
    
    function addAccomplishment($object) {
        $keys = $this->getAccomplishmentModelKeys();
        foreach ($keys as $key) {
            if(key_exists($key, $object)) {
                $this->db->set($key, $object[$key]);
            }
        }
        $this->db->insert("tbl_seeker_accomplishment");
        $id = $this->db->insert_id();
        return [KEY_RESULT=>RES_SUCCESS, "accomplishment_id"=>$id];
    }
    
    function updateAccomplishment($object) {
        $keys = $this->getAccomplishmentModelKeys();
        foreach ($keys as $key) {
            if(key_exists($key, $object)) {
                if($key != "education_id") {
                    $this->db->set($key, $object[$key]);
                }
            }
        }
        $this->db->where("accomplishment_id", $object["accomplishment_id"]);
        $this->db->update("tbl_seeker_accomplishment");
        return [KEY_RESULT=>RES_SUCCESS, KEY_RES_MESSAGE=>"Accomplishment updated successfully"];
    }
    
    function deleteAccomplishment($object) {
        $this->db->where("accomplishment_id", $object["accomplishment_id"]);
        $this->db->delete("tbl_seeker_accomplishment");
        return [KEY_RESULT=>RES_SUCCESS];
    }
    
    
    function getAccomplishments($object) {
        return [KEY_RESULT=>RES_SUCCESS, "accomplishments"=>$this->db->
                where("accomplishment_seeker", $object["seeker_id"])->get("tbl_seeker_accomplishment")->result()];
    }
    
    function searchSeeker($object) {
        if(key_exists("location", $object)) {
            $location = $object["location"];
            $jobIndustry = $object["job_industry"];
            $query = "select * from tbl_seeker a left join tbl_seeker_companyaction b on "
                    . "a.seeker_id = b.action_seeker and b.action_status = ".SEEKER_COMPANY_ACTION_SAVE
                    ." and b.action_companyuser = ".$object["companyuser_id"]
                    . " left join enum_industry c on a.preferredindustry = c.industry_id where "
                    . "b.action_status is null and (seeker_address1 like '%".$location."%' or "
                    . "seeker_address2 like '%".$location."%' or seeker_city like '%".$location."%'"
                    . " or preferredlocation like '%".$location."%')"
                    . " and (preferredjobfields like '%".$jobIndustry."%' "
                    . "or c.industry_description like '%".$jobIndustry."%')";
        }
        else {
            $companyUser = $this->db->where("companyuser_id", $object["companyuser_id"])->get("tbl_company_user")->row();
            $location = $companyUser->preferredlocation;
            $industry = $companyUser->preferredindustry;
            $jobFields = $companyUser->preferredjobfields;
            $query = "select * from tbl_seeker a left join tbl_seeker_companyaction b on "
                    . "a.seeker_id = b.action_seeker and b.action_status = ".SEEKER_COMPANY_ACTION_SAVE
                    ." and b.action_companyuser = ".$object["companyuser_id"]." where "
                    . "b.action_status is null and (seeker_address1 like '%".$location."%' or "
                    . "seeker_address2 like '%".$location."%' or seeker_city like '%".$location."%'"
                    . " or preferredlocation like '%".$location."%')"
                    . " and preferredjobfields like '%".$jobFields."%'";
            if($industry > 0) {
                $query = $query." and (preferredindustry = ".$industry." or preferredindustry = 0)";
            }
        }
        $users = $this->db->query($query)->result();
        return [KEY_RESULT=>RES_SUCCESS, KEY_RES_MESSAGE=>"", "seekers"=>$users];
    }
    
    function getInterestedSeeker($object) {
        /*if($object["job_id"] == 0) {
            $users = $this->db->query("select * from (select distinct(c.action_seeker) from tbl_job a "
                    ."inner join tbl_company_user b on a.job_companyuser = b.companyuser_id "
                    ."inner join tbl_job_seekeraction c on c.action_job = a.job_id where b.companyuser_id = ".$object["companyuser_id"].") a "
                    ."inner join tbl_seeker b on a.action_seeker = b.seeker_id left join tbl_seeker_companyaction c on "
                    ."b.seeker_id = c.action_seeker and c.action_companyuser = 1 where c.action_status is null")->result();
        }
        else {*/
        $users = $this->db->query("select a.*, b.action_job, c.action_status from tbl_seeker a "
                . "inner join tbl_job_seekeraction b on a.seeker_id = b.action_seeker and "
                . "b.action_status = ".JOB_SEEKER_APPLIED." and b.action_job = ".$object["job_id"]." "
                . "left join tbl_seeker_companyaction c on a.seeker_id = c.action_seeker "
                . "and c.action_job = b.action_job where c.action_status is null or "
                . "c.action_status = ".SEEKER_JOB_COMPANY_ACTION_IGNORE
                . " order by c.action_status ")->result();
        
        return [KEY_RESULT=>RES_SUCCESS, KEY_RES_MESSAGE=>"", "seekers"=>$users]; 
    }
    
    function getShortListedSeeker($object) {
        if(key_exists("job_id", $object)) {
            $query = "select * from tbl_seeker a inner join tbl_seeker_companyaction "
                    . "b on a.seeker_id = b.action_seeker and b.action_status = " . SEEKER_JOB_COMPANY_ACTION_SHORTLIST
                    . " and b.action_job = ".$object["job_id"]
                    . " and b.action_companyuser = ".$object["companyuser_id"];
        }
        else {
            $query = "select * from tbl_seeker a inner join tbl_seeker_companyaction "
                    . "b on a.seeker_id = b.action_seeker and b.action_status = " . SEEKER_JOB_COMPANY_ACTION_SHORTLIST                    
                    . " and b.action_companyuser = " .$object["companyuser_id"] 
                    . " order by b.action_job";
        }
        $users = $this->db->query($query)->result();
        return [KEY_RESULT=>RES_SUCCESS, KEY_RES_MESSAGE=>"", "seekers"=>$users];  
    }
            
    
    
    function setSeeker($object) {
        
        $status = $object["action_status"];
            //check existing relationship
        $existSeekers = $this->db->query("select * from tbl_seeker_companyaction where action_seeker = "
                .$object["action_seeker"]." and action_companyuser = ". $object["action_companyuser"]
                ." and action_job = ". $object["action_job"])->result();
        $this->db->set("action_companyuser", $object["action_companyuser"]);
        $this->db->set("action_seeker", $object["action_seeker"]);
        $this->db->set("action_status", $status);
        $this->db->set("action_job", $object["action_job"]);
        $this->db->set("action_timestamp", time());
        if (sizeof($existSeekers) > 0) {
            $this->db->where("action_companyuser", $object["action_companyuser"]);
            $this->db->where("action_job", $object["action_job"]);
            $this->db->where("action_seeker", $object["action_seeker"]);
            $this->db->update("tbl_seeker_companyaction");
        }
        else {
            $this->db->insert("tbl_seeker_companyaction");
        }
        $object["seeker_id"] = $object["action_seeker"];
        
        $seeker = $this->db->where("seeker_id", $object["action_seeker"])->get("tbl_seeker")->row();
        $companyUser = $this->db->where("companyuser_id", $object["companyuser_id"])->get("tbl_company_user")->row();
        
        if($status == SEEKER_JOB_COMPANY_ACTION_IGNORE ) {
            $message = "Job Seeker ignored";
        }
        else if ($status == SEEKER_COMPANY_ACTION_SAVE) {
            $message = "Job Seeker saved";
            $this->addRecommendCount($object);
            $seekers_details=$this->db->query("select * from tbl_seeker ,(select action_seeker from tbl_seeker_companyaction"
                    . " where action_status = " . $status . " and action_job = " . $object["action_job"].") as t where t.action_seeker=tbl_seeker.seeker_id")->result();
            $count=count($seekers_details);
            $names="";
            //$count = $this->db->query("select count(*) as count from tbl_seeker_companyaction "
            //        . " where action_status = " . $status)->row()->count;
            
            /*if($count >= 2) {
                $message = "Saved Profiles are now 2 including ". $seeker->seeker_firstname. " ". $seeker->seeker_surname;
            }
            else {
                $message = $seeker->seeker_firstname. " ". $seeker->seeker_surname. " is in save profiles.";
            }*/
            if($count >=1 && $count<=3 ) {
                if($count==1){
                $names=$seekers_details[0]->seeker_firstname. " ". $seekers_details[0]->seeker_surname;
                }
                if($count==2){
                $names=$seekers_details[0]->seeker_firstname. " ". $seekers_details[0]->seeker_surname." and ".$seekers_details[1]->seeker_firstname. " ". $seekers_details[1]->seeker_surname;
                }
                if($count==3){
                $names=$seekers_details[0]->seeker_firstname. " ". $seekers_details[0]->seeker_surname." , ".$seekers_details[1]->seeker_firstname. " ". $seekers_details[1]->seeker_surname." and ".$seekers_details[2]->seeker_firstname. " ". $seekers_details[2]->seeker_surname;
                }
            }
        else if($count>3)
        {
            $names=$seekers_details[0]->seeker_firstname. " ". $seekers_details[0]->seeker_surname." , ".$seekers_details[1]->seeker_firstname. " ". $seekers_details[1]->seeker_surname." , ".$seekers_details[2]->seeker_firstname. " ". $seekers_details[2]->seeker_surname;
        }       
                 $message = "Saved profiles are now ".$count." including ".$names;
    
            
            $notification = [
                "notification_type" => NOTIFICATION_TYPE_SAVE_SEEKER,
                "notification_seeker" => $object["action_seeker"],
                "notification_companyuser" => $object["companyuser_id"],
                "notification_job" => 0,
                "notification_read" => 0,
                "notification_message" => $message,
                "notification_title" => "Saved",
                "companyuser_id" => $object["companyuser_id"]
            ];
            $notiId = $this->Notifications->createNotification($notification, $companyUser->fcmtoken)["notification_id"];
            $notiObject = [
                "notification_id"=> $notiId,
                "companyuser_id"=> $object["companyuser_id"]
                ];
            $noti = $this->Notifications->getNotification($notiObject);
            return [KEY_RESULT=>RES_SUCCESS, KEY_RES_MESSAGE=>$message, "notification"=>$noti["notification"]];      
        }
        else if ($status == SEEKER_JOB_COMPANY_ACTION_SHORTLIST) {
            $message = "Job Seeker shortlisted";
            $this->addRecommendCount($object);            
            $job = $this->db->query("select * from tbl_job where job_id = ". $object["action_job"])->row();
            $seekers_details=$this->db->query("select * from tbl_seeker ,(select action_seeker from tbl_seeker_companyaction"
                    . " where action_status = " . $status . " and action_job = " . $object["action_job"].") as t where t.action_seeker=tbl_seeker.seeker_id")->result();
            $count=count($seekers_details);
            $names="";
            //$count = $this->db->query("select count(*) as count from tbl_seeker_companyaction "
           //         . " where action_status = " . $status . " and action_job = " . $object["action_job"])->row()->count;
            
            /*if($count == 2) {
                $message = $seeker->seeker_firstname. " ". $seeker->seeker_surname. 
                        " and 1 user are shortlisted in '".$job->job_title."'";
            }
            else if ($count > 2){
                $count -= 1;
                $message = $seeker->seeker_firstname. " ". $seeker->seeker_surname. 
                        " and " . $count . " users are shortlisted in '" . $job->job_title."'";
            }
            else {
                $message = $seeker->seeker_firstname. " ". $seeker->seeker_surname. 
                        " is shortlisted in '".$job->job_title."'";
            }*/
            if($count >=1 && $count<=3 ) {
                if($count==1){
                $names=$seekers_details[0]->seeker_firstname. " ". $seekers_details[0]->seeker_surname;
                $message = $names." is shortlisted in '".$job->job_title."'";
                }
                if($count==2){
                $names=$seekers_details[0]->seeker_firstname. " ". $seekers_details[0]->seeker_surname." and ".$seekers_details[1]->seeker_firstname. " ". $seekers_details[1]->seeker_surname;
                $message = $names." are shortlisted in '".$job->job_title."'";
                }
                if($count==3){
                $names=$seekers_details[0]->seeker_firstname. " ". $seekers_details[0]->seeker_surname." , ".$seekers_details[1]->seeker_firstname. " ". $seekers_details[1]->seeker_surname." and ".$seekers_details[2]->seeker_firstname. " ". $seekers_details[2]->seeker_surname;
                $message = $names." are shortlisted in '".$job->job_title."'";
                }
            }
        else if($count>3)
        {
            $names=$seekers_details[0]->seeker_firstname. " ". $seekers_details[0]->seeker_surname." , ".$seekers_details[1]->seeker_firstname. " ". $seekers_details[1]->seeker_surname." , ".$seekers_details[2]->seeker_firstname. " ". $seekers_details[2]->seeker_surname;
                
                 $message = $names." and ".($count-3)." more users are shortlisted in '".$job->job_title."'";
    }
            
            $notification = [
                "notification_type" => NOTIFICATION_TYPE_SHORTLIST_SEEKER,
                "notification_seeker" => $object["action_seeker"],
                "notification_companyuser" => $object["companyuser_id"],
                "notification_job" => $object["action_job"],
                "notification_read" => 0,
                "notification_message" => $message,
                "notification_title" => "Shortlisted",
                "companyuser_id" => $object["companyuser_id"]
            ];
            $notiId = $this->Notifications->createNotification($notification, $companyUser->fcmtoken)["notification_id"];
            $notiObject = [
                "notification_id"=> $notiId,
                "companyuser_id"=> $object["companyuser_id"]
                ];
            $noti = $this->Notifications->getNotification($notiObject);
            return [KEY_RESULT=>RES_SUCCESS, KEY_RES_MESSAGE=>$message, "notification"=>$noti["notification"]];   
        }
        else if ($status == SEEKER_JOB_COMPANY_ACTION_REACH) {
            $job = $this->db->query("select * from tbl_job where job_id = ". $object["action_job"])->row();
            $message = "You have reached ".$seeker->seeker_firstname. " ". $seeker->seeker_surname." for '".$job->job_title."'";
            $notification = [
                "notification_type" => NOTIFICATION_TYPE_REACH_SEEKER,
                "notification_seeker" => $object["action_seeker"],
                "notification_companyuser" => $object["companyuser_id"],
                "notification_job" => $object["action_job"],
                "notification_read" => 0,
                "notification_message" => $message,
                "notification_title" => "Reached",
                "companyuser_id" => $object["companyuser_id"]
            ];
            $notiId = $this->Notifications->createNotification($notification, $companyUser->fcmtoken)["notification_id"];
            $notiObject = [
                "notification_id"=> $notiId,
                "companyuser_id"=> $object["companyuser_id"]
                ];
            $noti = $this->Notifications->getNotification($notiObject);
            return [KEY_RESULT=>RES_SUCCESS, KEY_RES_MESSAGE=>$message, "notification"=>$noti["notification"]]; 
        }
        else {
            $message = "Job Seeker Deleted";
        }
        return [KEY_RESULT=>RES_SUCCESS, KEY_RES_MESSAGE=>$message];      
    }
    
    function getSavedSeekers($object) {
        
        return [KEY_RESULT=>RES_SUCCESS, "seekers"=>$this->db->query("select * from "
                . "tbl_seeker_companyaction a inner join tbl_seeker b on a.action_status = "
                .SEEKER_COMPANY_ACTION_SAVE. " and a.action_seeker = b.seeker_id and a.action_companyuser = ".$object["companyuser_id"])->result()];
    }
    
    
    
}