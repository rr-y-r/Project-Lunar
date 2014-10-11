<?php
class Login extends CI_controller{
    
    function login(){
        parent::construct();
        $this->load->model('login','',TRUE);
    }
    
    function index(){
        
        $data       =   json_decode(file_get_contents('php://input'));
        $dataCheck  =   $this->login->uCheck($data->uName,$data->pWord);
        
        echo json_encode($dataCheck);
        
    }
}