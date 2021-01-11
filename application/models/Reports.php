<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


class Reports extends CI_Model {

    function __construct(){
        parent::__construct();
    }
    
    function reportUser($object) {
        $this->db->set("report_user", $object["user_id"])
                ->set("reported_user", $object["reported_user"])
                ->set("report_content", $object["report_content"])
                ->insert("tbl_reports");
        return [KEY_RESULT=>RES_SUCCESS, KEY_RES_MESSAGE=>"Your reported uploaded successfully"];
    }
    
    
}
    