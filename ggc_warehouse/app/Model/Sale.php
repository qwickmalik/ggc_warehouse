<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

class Sale extends AppModel {

    var $name = "Sale";
    var $usesTable = "sales";
 
        var $belongsTo = array(
         
          'Customer' => array(
            'className' => 'Customer',
            'foreignKey' => 'customer_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
          ),
           'User' => array(
            'className' => 'User',
            'foreignKey' => 'user_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
          ),
           'Zone' => array(
            'className' => 'Zone',
            'foreignKey' => 'zone_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
          ));
        
 
    function updateSale($saleId=0, $data=0) {
        $this->id = $saleId;
        return $this->save($data);
    }
    
    function getSales($saleId){
        $result = $this->find('first',array('conditions' => array('Sale.id'=>$saleId)));
        return $result;
    }
   
}

?>
