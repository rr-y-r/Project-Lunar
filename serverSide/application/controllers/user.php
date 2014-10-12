<?php
class User extends CI_Controller {
    
    function User(){
        parent::__construct();
        $this->load->model('Muser', '', TRUE);
    }
    function changepassword(){
        $data           =   json_decode(file_get_contents("php://input"));
        $user           =   $this->muser->changepassword($data);
        echo json_encode($user);
    }
    public function insert(){
        $data           =   json_decode(file_get_contents("php://input"));
        echo  $this->Muser->insert($data);
    }
    public function updateisactive(){
        $data           =   json_decode(file_get_contents("php://input"));
        echo  $this->Muser->updateisactive($data);
    }
    public function get_all_bypaging(){
        $uri_segment    =   3;
        $offset         =   $this->uri->segment($uri_segment);
        $page           =   isset($offset) ? $offset : 1;
        $user           =   $this->Muser->get_all();
        $totaldata      =   count($user);
        $pagetotal      =   ceil($totaldata / $this->limit);
        $pageshow       =   $pagetotal > $this->pageshow ? $this->pageshow : $pagetotal;
        $step           =   floor($pageshow / 2);
        $pagestart      =   ($page - $step) > 1 ? $page - $step : 1;
        $pageend        =   ($page + $step) < $pagetotal ? $page + $step : $pagetotal;
        if($pageend - $pagestart + 1 < $pageshow) {
            $pageend    =   $pagestart + $pageshow - 1;
            $pageend    =   $pageend > $pagetotal ? $pagetotal : $pageend;

            if($pageend - $pagestart + 1 < $pageshow){
                $pagestart  =   $pageend - $pageshow - 1;
                $pagestart  =   $pagestart > 1 ? $pagestart : 1;
            }
        }
        if($pageend - $pagestart + 1 > $pageshow) {
            if($pageend == $pagetotal){
                $pagestart = $pageend - $pageshow + 1;
            }
        }

        $pagination = array();
        for($i=$pagestart; $i<=$pageend; $i++){
            $pagination[] = $i;
        }

        $data = array_slice($user, ($page-1) * $this->limit, $this->limit);
        $vData = array(
            'page'          => $page,
            'pagefirst'     => 1,
            'pagelast'      => $pagetotal,
            'pagination'    => $pagination,
            'data'          => $data,
        );
        echo  json_encode($vData);

    }
}
