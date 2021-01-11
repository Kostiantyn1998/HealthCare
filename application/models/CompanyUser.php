<?php

define("NotifyVerification", "Please verify your email to complete your profile");


class CompanyUser extends CI_Model {

    function __construct(){
        parent::__construct();
        $this->load->model('Mail');
        $this->load->model('ImageUploader');
        $this->load->library('session');
        $this->load->model('Chats');
        $this->load->model('Session');
        $this->load->model('Seeker');
        $this->load->model('Company');
        $this->load->model('Job');
        $this->load->model('Notifications');
    }
    
    private function getUserModelKeys() {
        return [
            "companyuser_id", 
            "companyuser_company",
            "companyuser_personalposition", 
            "companyuser_email",
            "companyuser_phonenumber", 
            "companyuser_mobilenumber", 
            "companyuser_address1", 
            "companyuser_address2", 
            "companyuser_city", 
            "companyuser_latitude",
            "companyuser_longitude",
            "companyuser_verified",
            "PasswordHash", 
            "Iterations", 
            "Salt",
            "TokenExpiry",
            "fcmtoken",
            "preferredjobfields",
            "preferredlocation",
            "preferredindustry",
            "timezone"
        ];
    }

    /***** public functions ******/
    
    public function signUp($object) {
        $password = $this->createPassword($object["companyuser_password"]);
        return $user = $this->createUser($object, $password);
    }
    
    public function signIn($object) {
        //return [KEY_RES_MESSAGE => RES_SUCCESS];
        $isSocial = false;
        if(key_exists("companyuser_facebookid", $object)) {
            if(key_exists("companyuser_email", $object)) {
                $this->db->where("companyuser_email", $object["companyuser_email"])
                        ->set("companyuser_facebookid", $object["companyuser_facebookid"])
                        ->set("companyuser_emailverified", "1")->update("tbl_company_user");
            }
            else {
                $users = $this->db->where("companyuser_facebookid", $object["companyuser_facebookid"])->get("tbl_company_user")->result();
            }
            $isSocial = true;
        }
        else if(key_exists("companyuser_linkedinid", $object)) {
            if(key_exists("companyuser_email", $object)) {
                $this->db->where("companyuser_email", $object["companyuser_email"])->set("companyuser_linkedinid", $object["companyuser_linkedinid"])
                        ->set("companyuser_emailverified", "1")->update("tbl_company_user");
            }
            else {
                $users = $this->db->where("companyuser_linkedinid", $object["companyuser_linkedinid"])->get("tbl_company_user")->result();
            }
            $isSocial = true;
        }
        else if(key_exists("companyuser_googleid", $object)) {
            if(key_exists("companyuser_email", $object)) {
                $this->db->where("companyuser_email", $object["companyuser_email"])->set("companyuser_googleid", $object["companyuser_googleid"])
                        ->set("companyuser_emailverified", "1")->update("tbl_company_user");
            }
            else {
                $users = $this->db->where("companyuser_googleid", $object["companyuser_googleid"])->get("tbl_company_user")->result();
            }
            $isSocial = true;
        }
        
        if(key_exists("companyuser_email", $object)) {
            $users = $this->db->where("companyuser_email", $object["companyuser_email"])->get("tbl_company_user")->result();            
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
        if(key_exists("companyuser_password", $object)) {
            $comparableHash = hash_pbkdf2('sha256', $object["companyuser_password"], $user->Salt, $user->Iterations);
        }
        //echo $comparableHash;
        if((key_exists("companyuser_password", $object) && $comparableHash === $user->PasswordHash) || $isSocial === true) {
            if(key_exists("timezone", $object)){
                $this->db->set("fcmtoken", $object["fcmtoken"])
                        ->set("timezone", $object["timezone"])
                        ->where("companyuser_id", $user->companyuser_id)->update("tbl_company_user");
            }
            else {
                $this->db->set("fcmtoken", $object["fcmtoken"])
                        ->where("companyuser_id", $user->companyuser_id)->update("tbl_company_user");
            }
            $loggedUser = $this->db->query("select * from tbl_company_user a inner join tbl_company b on a.companyuser_company = b.company_id where companyuser_id = ".$user->companyuser_id)->row();
            $result = Array();
            $result[KEY_RESULT] = RES_SUCCESS;
            $result["user"] = $loggedUser;
            $result[KEY_RES_MESSAGE] = "Login successful!";
            $userObject = ["companyuser_id"=>$loggedUser->companyuser_id];
            if(isset($loggedUser->companyuser_company))
            {
            $loggedUserCompany = $this->db->query("select * from tbl_company where company_id = ".$loggedUser->companyuser_company)->row();
            //var_dump($loggedUserCompany);
            $result["company"]=$loggedUserCompany;
            }
            else
            {
               $result["company"]=json_decode(json_encode (new stdClass));
            }
            $draftJob = $this->Job->getJobDraft($userObject);
            if($draftJob[KEY_RESULT] == RES_SUCCESS) {
                $result["job_draft"] = $draftJob["job_draft"];
            }
            $result["jobs"] = $this->Job->getMyJobs($userObject)["jobs"];
            $result["savedUsers"] = $this->Seeker->getSavedSeekers($userObject)["seekers"];
            $result["shortlistedUsers"] = $this->Seeker->getShortListedSeeker($userObject)["seekers"];
            $result["chats"] = $this->Chats->getChats($userObject)["chats"];
            $result["schedules"] = $this->Chats->getSchedules($userObject)["schedules"];
            $result["notifications"] = $this->Notifications->getMyNotifications($userObject)["notifications"];
            return $result;
        }
        else {
            return [
                KEY_RESULT=>RES_FAIL,
                KEY_RES_MESSAGE=>"Invalid Password!"];
        }
    }
    
    
    public function logout($object) {
        $this->db->where("companyuser_id", $object["companyuser_id"])->set("fcmtoken", "")->update("tbl_company_user");
        return [KEY_RESULT=>RES_SUCCESS];
    }
    
    public function forgotPassword($object) {
        return $this->startVerification($object["companyuser_email"]);
    }
    
    public function verifyUser($object){
        
        $users = $this->db->query("select * from tbl_users where user_email = '".$object["companyuser_email"]."' or user_username = '".$object["companyuser_email"]."'")->result();
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
                    $this->db->set("ActivationPin", NULL)->where("companyuser_id", $user->user_id)->update("tbl_company_user");
                    $object["companyuser_id"] = $user->user_id;
                    //update user status
                    $users = $this->db->where("companyuser_id", $object["companyuser_id"])->get("tbl_company_user")->result();
                    $user = $users[0];
                    $object["user_status"] = $user->user_status;
                    $this->db->set("user_status", $this->checkUserStatus($object))
                            ->where("companyuser_id", $user->user_id)
                            ->update("tbl_company_user");
                    $users = $this->db->where("companyuser_id", $user->user_id)->get("tbl_company_user")->result();
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
        $users = $this->db->where("companyuser_email", $object["companyuser_email"])->get("tbl_company_user")->result();
        if(sizeof($users) === 0) {
            return [
                KEY_RESULT=>RES_FAIL,
                KEY_RES_MESSAGE=>"Email is not registered yet!"];
        }
        return $this->startVerification($object["companyuser_email"]);//$this->setVerificationDetails($users[0]->user_email, $users[0]->ActivationCode, $users[0]->ActivationPin);
    }

public function changeCompanyUserEmail($object) {
        //check if view is confirmed
        $message = "Email has been changed successfully";
        
        $rows = $this->db
                ->where("companyuser_email", $object["companyuser_newemail"])
                ->get("tbl_company_user")->num_rows();
        if($rows == 0) {
            $message = "Email has been changed successfully";
            $this->db->query("update tbl_company_user set companyuser_email = '".$object['companyuser_newemail'] ."' where companyuser_id = ". $object["companyuser_id"]);
        return [KEY_RESULT=>RES_SUCCESS ,   KEY_RES_MESSAGE=>$message];
            
        }
        else
        {
            $message = "Unable to change Email , this email is already in use";
            return [KEY_RESULT=>RES_FAIL, KEY_RES_MESSAGE=>$message];
        }
        
        
        
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
                ->where("companyuser_id", $object["companyuser_id"])
                ->get("tbl_company_user")->num_rows();
        if($rows != 0) {
            
            $this->db->query("update tbl_company_user set showme = ".$object['showme'] ." where companyuser_id = ". $object["companyuser_id"]);
        return [KEY_RESULT=>RES_SUCCESS ,   KEY_RES_MESSAGE=>$message];
            
        }
        else
        {
            return [KEY_RESULT=>RES_FAIL, KEY_RES_MESSAGE=>$message];
        }
        
        
        
    }
    public function changeCompanyUserPassword($object) {
        
        $users = $this->db->where("companyuser_id", $object["companyuser_id"])->get("tbl_company_user")->result();
        if(sizeof($users) === 0) {
            return [
                KEY_RESULT=>RES_FAIL,
                KEY_RES_MESSAGE=>"Invalid Parameters"];
        }
        $user = $users[0];
        $comparableHash = hash_pbkdf2('sha256', $object["companyuser_password"], $user->Salt, $user->Iterations);
        //echo $comparableHash;
        if($comparableHash === $user->PasswordHash) {
        $password = $this->createPassword($object["companyuser_newpassword"]);
            $message = "Password has been changed successfully";
            $this->db->query("update tbl_company_user set PasswordHash = '".$password["hash"] ."', Iterations = '".$password["iterations"]."', Salt = '".$password["salt"]."' where companyuser_id = ". $object["companyuser_id"]);
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
    private function createUser($object, $password)
    {
        $available = $this->checkUserAvailable($object);
        if($available == RES_SUCCESS) {
            
            $imageString = "";
            $keys = $this->getUserModelKeys();
            foreach ($keys as $key) {
                if(key_exists($key, $object)) {
                    if($key === "companyuser_id") {
                        continue;
                    }
                    if($key === "companyuser_password") {
                        continue;
                    }
                    $this->db->set($key, $object[$key]);
                }
            }
            $this->db->set("PasswordHash", $password["hash"]);
            $this->db->set("Iterations", $password["iterations"]);
            $this->db->set("Salt", $password["salt"]);
            $this->db->set("companyuser_createdat" , time());
            $this->db->insert("tbl_company_user");
            $companyuser_id = $this->db->insert_id();
            //send notification for account verification
            $notification = [
                "notification_type" => NOTIFICATION_TYPE_COMPANYUSER_VERIFICATION,
                "notification_seeker" => 0,
                "notification_companyuser" => $companyuser_id,
                "notification_job" => 0,
                "notification_read" => 0,
                "notification_message" => "Thank you for signing up with be-reached! "
                . "Please complete your profile and verify your email.",
                "notification_title" => "Be-reached",
                "companyuser_id" => $companyuser_id
            ];
            $notiId = $this->Notifications->createNotification($notification, $object["fcmtoken"])["notification_id"];
            $object1 = [
                "companyuser_id"=>$companyuser_id,
                "notification_id"=>$notiId
                ];
            $notification = $this->Notifications->getNotification($object1);
            return [
                KEY_RESULT=>RES_SUCCESS, 
                "signup"=>"1",
                "companyuser_id"=>$companyuser_id,
                "notification" => $notification["notification"],
                KEY_RES_MESSAGE=>NotifyVerification];
                
        }
        else {
            return [
                KEY_RESULT=>RES_FAIL,
                KEY_RES_MESSAGE=>$available];
        }
    }
    
    public  function signUpWithSocials($object)
    {
      $socialid = "";
      
   //   var_dump($object);
       $imageString = "";
            $keys = $this->getUserModelKeys();
            foreach ($keys as $key) {
                if(key_exists($key, $object)) {
                    if($key === "companyuser_id") {
                        continue;
                    }
                    if($key === "companyuser_password") {
                        continue;
                    }
                    $this->db->set($key, $object[$key]);
                }
                
            }
            
            
            //$this->db->set("PasswordHash", $password["hash"]);
           // $this->db->set("Iterations", $password["iterations"]);
        //    $this->db->set("Salt", $password["salt"]);
            $this->db->set("companyuser_createdat" , time());
            if($object["social"] == "facebook")
            {
            $this->db->set("companyuser_facebookid",$object["companyuser_facebookid"]);
            }
            else if($object["social"] == "google")
            {
                $this->db->set("companyuser_googleid",$object["companyuser_googleid"]);
            }
            else if($object["social"] == "linkedin")
            {
                $this->db->set("companyuser_linkedinid",$object["companyuser_linkedinid"]);
            }
            
            $this->db->insert("tbl_company_user");
            $companyuser_id = $this->db->insert_id();
            if(isset($companyuser_id))
            {
                $loggedUser = $this->db->query("select * from tbl_company_user where companyuser_id = ".$companyuser_id)->row();
                $result = Array();
                //var_dump($loggedUser);
                $result[KEY_RESULT] = RES_SUCCESS;
                $result["user"] = $loggedUser;
                if(isset($loggedUser->companyuser_company))
                {
                $loggedUserCompany = $this->db->query("select * from tbl_company where company_id = ".$loggedUser->companyuser_company)->row();
                //var_dump($loggedUserCompany);
                $result["company"]=$loggedUserCompany;
                }
                else
                {
                    $result["company"]=json_decode(json_encode (new stdClass));
                }
                $result[KEY_RES_MESSAGE] = "Login successful!";
            
            }
            //send notification for account verification
            $notification = [
                "notification_type" => NOTIFICATION_TYPE_COMPANYUSER_VERIFICATION,
                "notification_seeker" => 0,
                "notification_companyuser" => $companyuser_id,
                "notification_job" => 0,
                "notification_read" => 0,
                "notification_message" => "Thank you for signing up with be-reached! "
                . "Please complete your profile and verify your email.",
                "notification_title" => "Be-reached",
                "companyuser_id" => $companyuser_id
            ];
            $notiId = $this->Notifications->createNotification($notification, $object["fcmtoken"])["notification_id"];
            $object1 = [
                "companyuser_id"=>$companyuser_id,
                "notification_id"=>$notiId
                ];
            $notification = $this->Notifications->getNotification($object1);
            $result["notification"] =$notification["notification"];
            $result["signup"]="1";
            return $result;
        
    }
   public  function signInWithSocial($object)
    {
        
        if(key_exists("social",$object) )  
        {
            
        if($object["social"] == "facebook" && isset($object["companyuser_facebookid"]) && !empty($object["companyuser_facebookid"]))
        {
            $users = $this->db->where("companyuser_facebookid", $object["companyuser_facebookid"])->get("tbl_company_user")->result();  
            
        }else if($object["social"]== "linkedin" && isset($object["companyuser_linkedinid"]) && !empty($object["companyuser_linkedinid"]))
        {
            $users = $this->db->where("companyuser_linkedinid", $object["companyuser_linkedinid"])->get("tbl_company_user")->result();  
        }else if($object["social"] == "google" && isset($object["companyuser_googleid"]) && !empty($object["companyuser_googleid"]))
        {
            $users = $this->db->where("companyuser_googleid", $object["companyuser_googleid"])->get("tbl_company_user")->result();  
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
                        ->where("companyuser_id", $user->companyuser_id)->update("tbl_company_user");
            }
            else {
                $this->db->set("fcmtoken", $object["fcmtoken"])->where("companyuser_id", $user->companyuser_id)->update("tbl_company_user");
            }
            
            //get user with user id
            
               $loggedUser = $this->db->query("select * from tbl_company_user where companyuser_id = ".$user->companyuser_id)->row();
            $result = Array();
            //var_dump($loggedUser);
            $result[KEY_RESULT] = RES_SUCCESS;
            $result["user"] = $this->solveNulls($loggedUser);
            $result[KEY_RES_MESSAGE] = "Login successful!";
            $userObject = ["companyuser_id"=>$loggedUser->companyuser_id];
            if(isset($loggedUser->companyuser_company))
            {
            $loggedUserCompany = $this->db->query("select * from tbl_company where company_id = ".$loggedUser->companyuser_company)->row();
            //var_dump($loggedUserCompany);
            $result["company"]=$loggedUserCompany;
            }
            else
            {
                $result["company"]=json_decode(json_encode (new stdClass));
            }

            
            $draftJob = $this->Job->getJobDraft($userObject);
            if($draftJob[KEY_RESULT] == RES_SUCCESS) {
                $result["job_draft"] = $draftJob["job_draft"];
            }
            $result["jobs"] = $this->Job->getMyJobs($userObject)["jobs"];
            $result["savedUsers"] = $this->Seeker->getSavedSeekers($userObject)["seekers"];
            $result["shortlistedUsers"] = $this->Seeker->getShortListedSeeker($userObject)["seekers"];
            $result["chats"] = $this->Chats->getChats($userObject)["chats"];
            $result["schedules"] = $this->Chats->getSchedules($userObject)["schedules"];
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
  
    public function solveNulls($object)
    {
       // var_dump($object);
        foreach ($object as $key => $value) {
                
                    if($value == null) {
                        $object->$key = "";
                    }
                
                
            }
            return $object;
    }
    public function updateProfile($object) {
        $i=0;
       $message = RES_SUCCESS;
        $status = $this->checkUserAvailable($object);
        if ($status == RES_SUCCESS) {
            $keys = $this->getUserModelKeys();
//var_dump($object);
            //set values for key
            foreach ($keys as $key) {
                if(key_exists($key, $object)) {
                    //var_dump($key);
                    if($key != "companyuser_id" && $key != "companyuser_email" && $key != "companyuser_password") {
                        
                        $this->db->set($key, $object[$key]);
                        $i=1;
                        
                    }
                }
            }    
            //filter for user id
            $this->db->where("companyuser_id", $object["companyuser_id"]);

            //update user password fields            
            if(key_exists("companyuser_password", $object)) {

                $password = $this->createPassword($object["companyuser_password"]);            
                $this->db->set("PasswordHash", $password["hash"]);
                $this->db->set("Iterations", $password["iterations"]);
                $this->db->set("Salt", $password["salt"]);
                $this->db->update("tbl_company_user");
                //get user object
                return [
                        KEY_RESULT=>RES_SUCCESS,
                        KEY_RES_MESSAGE=>"New password saved"];
            }           
            if($i==1)
            {
              //  var_dump($i);
            $this->db->update("tbl_company_user");
            }
            if(key_exists("company_id", $object)) {
                
                $message = $this->Company->updateCompany($object)[KEY_RESULT];
            }
            else if(key_exists("company_name", $object)) 
            {                
                
                $companyreturn = $this->Company->createCompany($object);
                    //var_dump($companyreturn);
                    //var_dump(mysqli_fetch_assoc($companyreturn)["company_id"]);
                if($companyreturn[KEY_RESULT]==RES_SUCCESS)
                {
                    $object["company"]=$this->db->query("select * from tbl_company where company_id = ".$companyreturn["company_id"])->row();
                    
                    $this->db->set("companyuser_company", $companyreturn["company_id"]);
                $this->db->where("companyuser_id", $object["companyuser_id"]);     
             $x = $this->db->update("tbl_company_user");
             //var_dump($x);
                }
                else
                {
                    $message = RES_FAIL;
                }
            }
            else {
                $message = RES_SUCCESS;
            }
            
            //get user object
            if($message == RES_SUCCESS)
            {
                if(key_exists("company", $object)) {
                    return [
                            KEY_RESULT=>RES_SUCCESS,
                            "company"=>$object["company"],
                            KEY_RES_MESSAGE=>"Profile updated Successfully"];
                }
                else {
                    return [
                            KEY_RESULT=>RES_SUCCESS,
                            KEY_RES_MESSAGE=>"Profile updated Successfully"];
                }
            }
            else
            {
                return [
                    KEY_RESULT=>RES_FAIL,
                    
                    KEY_RES_MESSAGE=>"Company Name or Company Email is already in use. Please change and update"];
            }
        }
        else {
            return [
                    KEY_RESULT=>RES_FAIL,
                    KEY_RES_MESSAGE=>$status];
        }
    }
    
    
    public function updateProfileImage($object) {
        $users = $this->db->where("companyuser_id", $object["companyuser_id"])->get("tbl_company_user")->result();
        if(sizeof($users) > 0) {
            $user = $users[0];
            $imageUrls = $this->ImageUploader->uploadImage($object);
            if($imageUrls[KEY_RESULT] === RES_SUCCESS) {
                $imageString = $imageUrls["image_url"];
                $this->db->set("companyuser_image", $imageString)->where("companyuser_id", $object["companyuser_id"])->update("tbl_company_user");
                if($user->companyuser_verified == 3) {
                    $this->db->set("company_logo", $imageString)->where("company_id", $user->companyuser_company)->update("tbl_company");
                }
                return [KEY_RESULT=>RES_SUCCESS, KEY_RES_MESSAGE=>"Image uploaded successfully!", "companyuser_image"=>$imageString];
            }
            else {
                return $imageUrls;
            }
        }
        else {
            return [KEY_RESULT=>RES_FAIL, KEY_RES_MESSAGE=>"No user!"];
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
   
    
   
    
    private function startVerification($email){
        $activationCode = md5(random_bytes(32));
        $pin = rand(100000, 999999);
        return $this->setVerificationDetails($email, $activationCode, $pin);
    }
    
    private function setVerificationDetails($email, $activationCode, $pin)
    {
        $this->db->query("update tbl_company_user SET ActivationCode = '".$activationCode."', ActivationPin = '".$pin."' where companyuser_email = '".$email."'");
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
        if(key_exists("companyuser_id", $object)) {
            $query = "";
            if (key_exists("companyuser_email", $object)) {
                $query = "companyuser_email = '".$object["companyuser_email"]."'";
            }
            if (key_exists("companyuser_phonenumber", $object)) {
                if(strlen($query) > 0) {
                    $query = $query." or companyuser_phonenumber = '".$object["companyuser_phonenumber"]."'";
                }
                else {
                    $query = "companyuser_phonenumber = '".$object["companyuser_phonenumber"]."'";
                }
            }
            
            if (key_exists("companyuser_mobilenumber", $object)) {
                if(strlen($query) > 0) {
                    $query = $query." or companyuser_mobilenumber = '".$object["companyuser_mobilenumber"]."'";
                }
                else {
                    $query = "companyuser_mobilenumber = '".$object["companyuser_mobilenumber"]."'";
                }
            }
            
            if(strlen($query) > 0) {
                $users = $this->db->query("select * from tbl_company_user where companyuser_id <> '".
                        $object["companyuser_id"]."' and (".$query.")")->result();
            }
            else {
                return RES_SUCCESS;
            }
        }
        else {
            $users = $this->db->where("companyuser_email", $object["companyuser_email"])
                    ->or_where("companyuser_mobilenumber", $object["companyuser_mobilenumber"])                    
                    ->get("tbl_company_user")->result();
        }
        if(sizeof($users)>0) {
            $result = "";
            $user = $users[0];
            
            if (key_exists("companyuser_email", $object)) {
                if($user->companyuser_email == $object["companyuser_email"]) {
                    $result = "Email";
                }
            }
            if (key_exists("companyuser_phonenumber", $object)) {
                if($user->companyuser_phonenumber == $object["companyuser_phonenumber"]) {
                    if(strlen($result) > 0) {
                        $result = $result.", Phone number";
                    }
                    else {
                        $result = "Phone number";
                    }
                }
            }
            if (key_exists("companyuser_mobilenumber", $object)) {
                if($user->companyuser_mobilenumber == $object["companyuser_mobilenumber"]) {
                
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
    
    
    
    
    
}