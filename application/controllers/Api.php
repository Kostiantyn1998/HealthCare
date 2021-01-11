<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Api extends CI_Controller{


    function __construct(){

        parent::__construct();
        $this->load->helper('url');
        $this->load->database();
        $this->load->model('Seeker');
        $this->load->model('Job');
        $this->load->model("Preference");
        $this->load->model("Company");
        $this->load->model("CompanyUser");
        $this->load->model('Notifications');
        $this->load->model('Session');
        $this->load->model('Reports');
        $this->load->model('Chats');
        $this->load->model('Payments');
        $this->load->model("ImageUploader");
        $this->load->model("User");
    }

    private function doRespond($p_result){        
        
        if(!key_exists("message", $p_result)) {
            $p_result["message"] = "";
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($p_result));
    }   
    
    private function doUrlDecode($p_text){

        $p_text = urldecode($p_text);
        $p_text = str_replace('&#40;', '(', $p_text);
        $p_text = str_replace('&#41;', ')', $p_text);
        $p_text = str_replace('%40', '@', $p_text);
        $p_text = str_replace('%20',' ', $p_text);
        $p_text = str_replace('%2B','+', $p_text);
        $p_text = trim($p_text);
        return $p_text;
     }

    function callBackend() {
        $object = $_POST;
        //$module = $this->checkModule($object);
        
        //if($module[KEY_RESULT] === RES_SUCCESS) {
            return $this->processModule($object);
        /*}
        return $this->doRespond($module);*/
    }

    function processModule($object) {
        try {
            $module = $object[KEY_MODULENAME];
            $func = $object[KEY_FUNCTIONNAME];
            foreach ($object as $key => $value) 
            {
                $object[$key] = $this->doUrlDecode($value);
            }
            $result = $this->$module->$func($object);
            $this->doRespond($result);//processResult($result);*/
        } catch (Exception $ex) {
            $this->doRespond([KEY_RESULT=>RES_FAIL, KEY_RES_MESSAGE=>"Invalid module or function"]);
        } 
    }
     /*
    private function checkModule($object) {
        if(key_exists(KEY_MODULENAME, $object)) {
            if(key_exists(KEY_FUNCTIONNAME, $object)) {
                $func = $object[KEY_FUNCTIONNAME];
                if($object[KEY_MODULENAME] == "User") {
                    if($func == "signUp" || $func == "signIn" || $func == "forgotPassword" || $func == "resendVerifyCode" || $func == "verifyUser"
                            || $func == "checkUserNameValid" || $func == "createAdmin") {
                        return [KEY_RESULT=>RES_SUCCESS];
                    }
                }
                return $this->Session->checkToken($object["session"]);
            }
            return [
                KEY_RESULT=>RES_FAIL,
                KEY_RES_MESSAGE=>"Function Key does not exits!",
                "request"=> $object];
        }
        return [
            KEY_RESULT=>RES_FAIL,
            KEY_RES_MESSAGE=>"Module key does not exists",
                "request"=> $object];
    }*/
    

}