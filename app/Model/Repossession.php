<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

class Repossession extends AppModel {

    var $name = "Repossession";
    var $usesTable = "repossessions";
     
    var $belongsTo = array(
          'Order' => array(
            'className' => 'Order',
            'foreignKey' => 'order_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
          ),
        'Invoice' => array(
            'className' => 'Invoice',
            'foreignKey' => 'invoice_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
          ),
        'Item' => array(
            'className' => 'Item',
            'foreignKey' => 'item_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
          ),
        'OrdersItem' => array(
            'className' => 'OrdersItem',
            'foreignKey' => 'orders_item_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
          ));
}
?>
