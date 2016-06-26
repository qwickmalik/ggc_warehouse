<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
class InvoiceoldEdition extends AppModel {

    var $name = "InvoiceoldEdition";
    var $usesTable = "invoiceold_editions";
    var $belongsTo = array(
        'Order' => array(
            'className' => 'Order',
            'foreignKey' => 'order_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
        ),
        'Rate' => array(
            'className' => 'Rate',
            'foreignKey' => 'rate_id',
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
    
    
    
    
}
?>
