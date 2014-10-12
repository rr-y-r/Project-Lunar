<?php
class Mtransaction extends CI_Model {

    function transaction(){
        parent::__construct();
    }
    protected $tblname = 'transaction';
    function get($data){
        return $this->db->get_where($this->tblname,array('tID' => $data->tID,'uID' => $data->uID,
                                                         'date' => $data->date,'name' => $data->name))->result_array();
    }

    function insert($data){

        $tList =  explode('-',$data->tID);
        $data->date = $listtujuan[0];

        try{
            foreach($data->namapemesan as $key => $val){
                $datainsert         = new stdClass();
                $datainsert->uID    = $data->uID;
                $datainsert->date   = $data->date;
                $datainsert->name   = $data->name;
                $datainsert->price  = $data->price;
                $datainsert->phone  = $data->phone;


                $this->db->insert($this->tblname, $datainsert);
            }
            return 1;
        } catch (Exception $e) {

        }
    }


}