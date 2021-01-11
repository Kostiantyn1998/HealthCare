<?php

class Session extends CI_Model {
    
    function __construct(){
        parent::__construct();
    }
    
    public function createToken($userID) {
        $token = $this->generateRandomString(32);
        $this->db->query("UPDATE tbl_users SET SessionToken = '".$token."', TokenExpiry = UNIX_TIMESTAMP() + 86400 WHERE user_id = ".$userID);
        return base64_encode($token);
    }
    
    public function checkToken($cipherToken){
        $userToken = base64_decode($cipherToken);
        $users = $this->db->query("select * from tbl_users where SessionToken = '".$userToken."'")->result();
        if (sizeof($users) > 0 ) {
            $tokenExpiry = $users[0]->TokenExpiry;
            if($tokenExpiry > time()){
                $this->db->query("update tbl_users set TokenExpiry = UNIX_TIMESTAMP() + 86400 where SessionToken = '".$userToken."'");
                return [
                    KEY_RESULT=>RES_SUCCESS,
                    "user"=>$users[0]];
            }
            return [
                KEY_RESULT=>RES_FAIL,
                KEY_RES_MESSAGE=>"Session token has already expired"];
        }
        else {
            return [                
                KEY_RESULT=>RES_FAIL,
                KEY_RES_MESSAGE=>"Session token has been tampered with"];
        }

    }
    
    public function refreshToken($userID) {
        return $this->createToken($userID);
    }
    
    public function invalidateToken($token){
        $this->db->where("SessionToken", $token)->get("tbl_users");
    }
    
    
    public function generateRandomString($length = 10) {
        $characters = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*()_+<>?:{};[],./";
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    } 
}