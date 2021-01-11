<?php

class Company extends CI_Model {

    function __construct(){
        parent::__construct();
        
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
    private function getCompanyModelKeys() {
        return [
            "company_id", 
            "company_size",
            "company_name", 
            "company_email", 
            "company_address1",
            "company_address2", 
            "company_latitude", 
            "company_longitude", 
            "company_city", 
            "company_logo", 
            "company_profileviews",
            "company_recommendations",
            "company_aboutus", 
            "company_website", 
            "company_phonenumber",
            "company_mobilenumber",
            "company_yearfound",
            "created_by",
            "company_industry"
            
        ];
    }
    
    function createCompany($object) {
        //check company existance
        $existance = $this->companyExists($object);
        if($existance) {
            //return error code with company existance
            return [KEY_RESULT=>RES_FAIL, KEY_RES_MESSAGE=>"Company already exists!"];
        }
        else {
            $keys = $this->getCompanyModelKeys();
            foreach ($keys as $key) {
                if(key_exists($key, $object)) {
                    $this->db->set($key, $object[$key]);
                }
            }
            $this->db->set("company_createdat", time());
            $this->db->insert("tbl_company");
            $id = $this->db->insert_id();
            return [KEY_RESULT=>RES_SUCCESS, KEY_RES_MESSAGE=>"Company successfully added", "company_id"=>$id];
        }
    }
    
    public function addViewCount($object) {
        //check if view is confirmed
        $rows = $this->db->where("company_id", $object["company_id"])
                ->where("seeker_id", $object["seeker_id"])
                ->get("tbl_company_viewed")->num_rows();
        if($rows == 0) {
            $this->db->set("company_id", $object["company_id"])
                    ->set("seeker_id", $object["seeker_id"])
                    ->insert("tbl_company_viewed");
            $this->db->query("update tbl_company set company_profileviews = company_profileviews + 1 where company_id = ". $object["company_id"]);
        }
        return [KEY_RESULT=>RES_SUCCESS];
    }
    
    public function addRecommendCount($object) {
        //check if view is confirmed
        $rows = $this->db->where("company_id", $object["company_id"])
                ->where("seeker_id", $object["seeker_id"])
                ->get("tbl_company_recommended")->num_rows();
        if($rows == 0) {
            $this->db->set("company_id", $object["company_id"])
                    ->set("seeker_id", $object["seeker_id"])
                    ->insert("tbl_company_recommended");
            $this->db->query("update tbl_company set company_recommendations = company_recommendations + 1 where company_id = ". $object["company_id"]);
        }
        return [KEY_RESULT=>RES_SUCCESS];
    }
    
    function updateCompany($object) {
        //check company existance
        
        $keys = $this->getCompanyModelKeys();
        foreach ($keys as $key) {
            if(key_exists($key, $object)) {
                if($key != "company_id"){
                    $this->db->set($key, $object[$key]);
                }
            }
        }
        $this->db->where("company_id", $object["company_id"]);
        $this->db->update("tbl_company");
        unset($object["module"]);
        unset($object["function"]);
        return [KEY_RESULT=>RES_SUCCESS,"company"=>$object, KEY_RES_MESSAGE=>"Company updated successfully"];

    }
    
    private function companyExists($object) {
        $companies = $this->db->query("select * from tbl_company where company_name = '".$object["company_name"]."' or company_email = '".$object["company_email"]."'")->result();
        if(sizeof($companies) > 0) {
            return true;
        }
        else {
            return false;
        }
    }
    
    function getAllCompanies($object) {
        return [KEY_RESULT=>RES_SUCCESS, "companies"=>$this->db->get("tbl_company")->result()];
    }
    
    
    
}