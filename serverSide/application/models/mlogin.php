<?php

class Mlogin extends CI_Model {

    var $table = 'user';
    
    function Login_model(){
        
        parent::__construct();
        
    }


    function userCheck($uName, $pWord){
        
        return  $this->db->query("SELECT uID,uName,user.name as name, product.name as pName, product.pID, level,sID 
        FROM user,product 
        WHERE user.pID = product.pID AND
        isactive = 1 AND
        uName ='".$uName."' AND
        pWord ='".$pWord."'")->result_array();
        
    }

}
