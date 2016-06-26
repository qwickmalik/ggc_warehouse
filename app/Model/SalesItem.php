<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
class SalesItem extends AppModel {

    var $name = "SalesItem";
    var $usesTable = "sales_items";

    
            
   
var $belongsTo = array(
        'Item' => array(
            'className' => 'Item',
            'foreignKey' => 'item_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ), 
        'Customer' => array(
            'className' => 'Customer',
            'foreignKey' => 'customer_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'Sale' => array(
            'className' => 'Sale',
            'foreignKey' => 'sale_id',
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
            )
    ,
    'WarehouseItem' => array(
            'className' => 'WarehouseItem',
            'foreignKey' => 'warehouse_item_id',
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
