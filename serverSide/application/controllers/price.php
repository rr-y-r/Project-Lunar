<?php
class Price extends CI_Controller {


    function price(){
        parent::__construct();
        // set config database
        $this->load->model('Mprice', '', TRUE);

    }

    public function index(){
        $this->get();
    }

    public function get(){
        echo json_encode($this->Mprice->get());
    }

    public  function update(){
        $data       =   json_decode(file_get_contents("php://input"));
        echo  $this->mprice->update($data);
    }

}
