<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Invoice
 *
 * @author Brain
 */
class Invoice extends AppModel {
    //put your code here
    var $name = "Invoice";
    var $usesTable = "invoices";
    
    
        var $belongsTo = array(
          'Customer' => array(
            'className' => 'Customer',
            'foreignKey' => 'customer_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
          ),
            'Order' => array(
            'className' => 'Order',
            'foreignKey' => 'order_id',
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
        
        var $hasMany = array(
            'Repossession' => array(
            'className' => 'Repossession',
            'foreignKey' => 'invoice_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ));
    
}

?>
