<?php
class Transaction extends CI_Controller {

    function transaction(){
        parent::__construct();
        // set config database
        $this->load->model('Mtransaction', '', TRUE);

    }

    public function index(){
        if ($this->session->userdata('login') == TRUE){
            $this->get_all();
        }
        else{
            $data['login'] = false;
            echo json_decode($data);
        }


    }

    public function insert(){
        $data                  = json_decode(file_get_contents("php://input"));

        echo  $this->Mtransaction->insert($data);
    }

    public function get($id){
        $data = new stdClass();
        $data->tID            = $this->uri->segment(3);
        $data->uID            = $this->uri->segment(4);
        $data->date           = $this->uri->segment(5);
        $data->name           = $this->uri->segment(6);

        $transaction          = $this->Mtransaction->get($data);
        echo json_encode($transaction);
    }
}
