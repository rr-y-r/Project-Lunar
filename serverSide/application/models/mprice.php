<?php
class Mprice extends CI_Model {

    protected $tblname      =   'price';

    function price(){
        parent::__construct();
    }


    function get(){
        return $this->db->get($this->tblname)->result_array();
    }

    function update($data){
        return  $this->db->query("update ".$this->tblname." set price = '".$data->price."' where prID =".$data->prID);
    }
}