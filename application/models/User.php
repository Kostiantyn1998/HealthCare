<?php

class User extends CI_Model {

    function __construct(){
        parent::__construct();
    }

    private function getUserKeys() {
        return [
            "user_id", 
            "user_fullname",
            "user_email", 
            "user_password",
            "user_phonenumber",
            "user_birthday",
            "user_photourl", 
            "user_height", 
            "user_weight", 
            "user_available", 
            "user_category", 
            "user_countryname",
            "user_streetname",
            "user_city",
            "user_zip",
            "user_language",
            "user_kind",
            "user_sex",
            "user_history",
            "user_price",
            "user_mdmo",
            "user_doctorid",
            "user_hospitalname",
            "user_billingname",
            "user_bankname",
            "user_bankcode",
            "user_bankaccountnumber",
            "user_bankroutingnumber"
        ];
    }

    function saveUserInfo($object) {
        //insert a new user
        $users = $this->db->where("user_email", $object["user_email"])->get("tbl_user")->result();
        if(sizeof($users) > 0) {
            return [KEY_RESULT=>RES_FAIL, KEY_RES_MESSAGE=>"User exist. please login"];
        }else {
            $keys = $this->getUserKeys();
            foreach ($keys as $key) {
                if(key_exists($key, $object)) {
                    $this->db->set($key, $object[$key]);
                }
            }
            $this->db->insert("tbl_user");
            $id = $this->db->insert_id();
            return [KEY_RESULT=>RES_SUCCESS, KEY_RES_MESSAGE=>"New user successfully saved", "user_id"=>$id];            
        } 
    }
    function updateUserInfo($object) {
        //check company existance
        
        $keys = $this->getUserKeys();
        foreach ($keys as $key) {
            if(key_exists($key, $object)) {
                if($key != "user_id"){
                    $this->db->set($key, $object[$key]);
                }
            }
        }
        $this->db->where("user_id", $object["user_id"]);
        $this->db->update("tbl_user");
        unset($object["module"]);
        unset($object["function"]);
        return [KEY_RESULT=>RES_SUCCESS,"user"=>$object, KEY_RES_MESSAGE=>"user profile updated successfully"];

    }
    function getUsersInfo($object){

        $arrays = array('user_kind' => $object["user_kind"], 'user_countryname' => $object["user_countryname"], 'user_language' => $object["user_language"], 'user_category'=>$object["user_category"]);
        $users = $this->db->where($arrays)->get("tbl_user")->result_array();
        if(sizeof($users) === 0) {
            return [
                KEY_RESULT=>RES_FAIL,
                KEY_RES_MESSAGE=>"You cannot get a list of doctors that match."];
        }else{
            $result = Array();
            foreach ($users as $user) {
                $user["user_rate_value"] = $this->db->query("select user_ratevalue from tbl_user_ratevalue where user_id = " . $user["user_id"])->result();
                array_push($result,$user);
            }
            
            return [KEY_RESULT=>RES_SUCCESS, KEY_RES_MESSAGE=>"Get user infos success!","user_infos"=> $result];
        }
    }
    function getUserInfo($object){
        //$result = Array();
        $users = $this->db->where("user_id", $object["user_id"])->get("tbl_user")->result_array();
        if(sizeof($users) === 0) {
            return [
                KEY_RESULT=>RES_FAIL,
                KEY_RES_MESSAGE=>"You cannot get user info."];
        }else{            
            if($users[0]['user_kind'] == "doctor"){
                $users[0]["user_rate_value"] = $this->db->query("select user_ratevalue from tbl_user_ratevalue where user_id = " . $object["user_id"])->result();
            }
            return [KEY_RESULT=>RES_SUCCESS, KEY_RES_MESSAGE=>"Get user info success!","user_info"=> $users[0]];
        }
    }
    function login($object){
        $arrays = array('user_email' => $object["user_email"], 'user_password' => $object["user_password"]);
        $users = $this->db->where($arrays)->get("tbl_user")->result();
        if(sizeof($users) == 1){
            $user['user_id'] = $users[0]->user_id;
            $result = $this->getUserInfo($user);
            return $result;
        }else{
            return [
                KEY_RESULT=>RES_FAIL,
                KEY_RES_MESSAGE=>"Enter email and password"];
        }
    }
    function uploadImage($object) {
         
        $result = array();
        if(key_exists('image_name', $object)){
            $image_name = $_POST['image_name']."_".time();
        }
        else {
            $image_name = "image_test"."_".time();
        }
        
        $upload_path =  "uploadfiles/users/";
        
        $upload_url = base_url().$upload_path;
        // Upload file
        $w_uploadConfig = array(
            'upload_path' => $upload_path,
            'upload_url' => $upload_url,
            'allowed_types' => "*",
            'overwrite' => TRUE,
            'max_size' => 10000000,
            'max_width' => 6000,
            'max_height' => 6000,
            'file_name' => $image_name

        );
        $this->load->library('upload', $w_uploadConfig);
        if ($this->upload->do_upload('file')) {
            $imageurl = $w_uploadConfig['upload_url'].$this->upload->file_name;
            $result['user_photourl'] = $imageurl;
            $result[KEY_RESULT] = RES_SUCCESS;
            return $result;

        } else {
            $result[KEY_RESULT] = RES_FAIL;
            $result[KEY_RES_MESSAGE] = "Upload Image Failed";
            return $result;
        }
    }
}

   