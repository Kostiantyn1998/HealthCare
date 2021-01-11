<?php

class Preference extends CI_Model {

    function __construct(){
        parent::__construct();
        
    }
    
    function getPreference($object) {
        $result = Array();
        $result[KEY_RESULT] = RES_SUCCESS;
        $result["industries"] = $this->getIndustries();
        $result["version"] = $this->getVersion();
        $result["sharelink"] = $this->getShareLink();
        return $result;
    }
    
    private function getIndustries() {
        return $this->db->query("select * from enum_industry order by industry_description")->result();
    }
    
    private function getVersion() {
        return $this->db->query("select * from pref_version")->row();
    }
    
    private function getShareLink() {
        return $this->db->query("select * from pref_sharelink")->row();
    }
       
    
}