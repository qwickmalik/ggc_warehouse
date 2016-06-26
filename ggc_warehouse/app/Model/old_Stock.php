<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


class Stock extends AppModel {

    var $name = "Stock";
    var $usesTable = "items";
    var $displayField = "item";
    
      var $belongsTo = array(
        'Supplier' => array(
            'className' => 'Supplier',
            'foreignKey' => 'supplier_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ));
    
    var $hasMany = array(
        'TempSale' => array(
            'className' => 'TempSale',
            'foreignKey' => 'item_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'SalesItem' => array(
            'className' => 'SalesItem',
            'foreignKey' => 'item_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'Creditor' => array(
            'className' => 'Creditor',
            'foreignKey' => 'item_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'CreditPayment' => array(
            'className' => 'CreditPayment',
            'foreignKey' => 'item_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            )
        );

 function getSales(){
        $result = $this->find('all');
        return $result;
    }
    
 function getSale($saleId = 0){
        $this->id = $saleId;
        $result = $this->find('first',array('conditions' => array('Item.id' => $saleId)));
        return $result;
    }


}
?>
