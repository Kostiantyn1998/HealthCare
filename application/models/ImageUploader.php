<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class ImageUploader extends CI_Model {
    
    function __construct(){
        parent::__construct();
    }
    
    function saveMulitiImages() {
         
        $result = array();      
        $upload_path = "uploadfiles/images/";
        $cur_time = time();
        $upload_url = base_url()."uploadfiles/images/";
        $imageUrls = array();
       // Upload file.
        if(key_exists('file', $_FILES)) {
            for ($i = 0 ; $i < count($_FILES['file']['name']) ; $i++) {
               $filename = $_FILES['file']['name'][$i];            
               $tmpFilePath = $_FILES['file']['tmp_name'][$i];
               $uploadFileName = intval(microtime(true) * 1000)."_".$i.'.png';
               move_uploaded_file($tmpFilePath, $upload_path.$uploadFileName);            
               $file_url = $upload_url . $uploadFileName;
               array_push($imageUrls, $file_url);  
            }
            return $imageUrls;
        }
        else {
            return [];
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
        if(key_exists("companyuser_id", $object)) {
            $upload_path =  "uploadfiles/company/";
        }
        else {
            $upload_path =  "uploadfiles/seeker/";
        }

        
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
            $result['image_url'] = $imageurl;
            $result[KEY_RESULT] = RES_SUCCESS;
            return $result;

        } else {
            $result[KEY_RESULT] = RES_FAIL;
            $result[KEY_RES_MESSAGE] = "Upload Image Failed";
            return $result;
        }
    }    
    
    function uploadCVFile($object) {
         
        $result = array();
        if(key_exists('image_name', $object)){
            $image_name = $_POST['image_name']."_".time();
        }
        else {
            $image_name = "image_test"."_".time();
        }
        if(key_exists("companyuser_id", $object)) {
            $upload_path =  "uploadfiles/company/";
        }
        else {
            $upload_path =  "uploadfiles/seeker/";
        }

        
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
            $result['image_url'] = $imageurl;
            $result[KEY_RESULT] = RES_SUCCESS;
            return $result;

        } else {
            $result[KEY_RESULT] = RES_FAIL;
            $result[KEY_RES_MESSAGE] = "Upload Image Failed";
            return $result;
        }
    }    
     
}