<?php
class Product extends CI_controller{
    
    var $limit      =   5;
    var $pageShow   =   2;
        
    function product(){
        parent::__construct();
        $this->load->model('Mproduct','',TRUE);
    }

    public function index(){
        //intentionally leaves blank
    }
    
    public function count(){
        echo $this->Mproduct->count();
    }
    
    public function insert(){
        $data            =   json_decode(file_get_contents('php://input'));
        echo $this->Mproduct->insert($data);
    }
    
    public function delete($id){
        echo $this->Mproduct->delete($id); //delete id from 'JSON' data
    }
    
    public function getbyid($id){
        echo json_encode($this->Mproduct->getbyid($id));
    }
    public  function update(){
        $data           =   json_decode(file_get_contents("php://input"));
        echo  $this->Mproduct->update($data);
    }

    public function get_all_bypaging(){
        $uri_segment    =   3;
        $offset         =   $this->uri->segment($uri_segment);
        $page           =   isset($offset) ? $offset : 1;
        $shuttle        =   $this->Mproduct->get_all();
        $totaldata      =   count($shuttle);
        $pagetotal      =   ceil($totaldata / $this->limit);
        $pageshow       =   $pagetotal > $this->pageshow ? $this->pageshow : $pagetotal;
        $step           =   floor($pageshow / 2);
        $pagestart      =   ($page - $step) > 1 ? $page - $step : 1;
        $pageend        =   ($page + $step) < $pagetotal ? $page + $step : $pagetotal;
        if($pageend - $pagestart + 1 < $pageshow) {
            $pageend    =   $pagestart + $pageshow - 1;
            $pageend    =   $pageend > $pagetotal ? $pagetotal : $pageend;

            if($pageend - $pagestart + 1 < $pageshow){
                $pagestart = $pageend - $pageshow - 1;
                $pagestart = $pagestart > 1 ? $pagestart : 1;
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

        $data = array_slice($shuttle, ($page-1) * $this->limit, $this->limit);
        $vData = array(
            'page'          => $page,
            'pagefirst'     => 1,
            'pagelast'      => $pagetotal,
            'pagination'    => $pagination,
            'data'          => $data,
        );
        echo  json_encode($vData);

    }

    public function get_groupbyStore(){
        $sID = $this->uri->segment(3);
        $product = $this->Mproduct->get_groupbyStore($sID);
        echo  json_encode($product);
    }
    public function get(){
        $product = $this->Mproduct->get();
        echo  json_encode($product);
    }

}