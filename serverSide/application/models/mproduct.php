<?php

class Mproduct extends CI_Model {

    function product(){
        parent::__construct();
    }
    protected $tblname = 'product';
    function get_all(){
        return $this->db->get($this->tblname)->result_array();
    }

    function insert($data){
        return $this->db->insert($this->tblname, $data);
    }
    function delete($id){
        return $this->db->delete($this->tblname, array('pID' => $id));
    }
    function getbyid($id){
        return $this->db->get_where($this->tblname , array('pID' => $id))->result_array();
    }
    function update($data){
        return  $this->db->query("update ".$this->tblname." set name = '".$data->name."' , sID = '".$data->sID."' where pID =".$data->pID);
    }
    function get_groupbyStore($sID){
        //get product
        $product = $this->db->get_where($this->tblname,array('sID' => $sID))->result_array();
        $data = array();
        //not done
        
    }
    function get(){
        //get product
        $product = self::get_all();
        $data = array();
        foreach($product as $key => $val){
            $data['product'][$val['sID']][$val['pID']] = $val;
        }
        return $data;
    }

    function countdata(){
        return $this->db->count_all($this->tblname);
    }
}