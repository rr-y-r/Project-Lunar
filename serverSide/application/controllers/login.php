<?php
class Login extends CI_controller{
    
    function login(){
        parent::construct();
        $this->load->model('Mlogin','',TRUE);
    }
    
    function index(){
        $data       =   json_decode(file_get_contents('php://input'));
        $dataCheck  =   $this->Mlogin->uCheck($data->uName,$data->pWord);
        
        echo json_encode($dataCheck);
    }
}