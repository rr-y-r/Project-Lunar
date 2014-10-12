<?php

class Muser extends CI_Model {

    var $table = 'user';

    function User_model(){
        parent::__construct();
    }

    function changePWord($data){

        return  $this->db->query("update ".$this->table." set pWord = '".$data->pWord."' where userid =".$data->userid);

    }
    function get_all(){
        return  $this->db->query("SELECT uID,uName, user.name as name, product.name as productName, product.pID, level,sID, isActive FROM user,product where user.pID = shuttle.shuttleid and level != 'admin' ")->result_array();
    }
    function insert($data){
        return $this->db->insert($this->table, $data);
    }
    function updateisactive($data){
        return  $this->db->query("update ".$this->table." set isActive = '".$data->isActive."' where uID =".$data->uID);
    }
}
