<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

class Payment extends AppModel {

    var $name = "Payment";
    var $usesTable = "payments";
    
     var $belongsTo = array(
         'Zone' => array(
            'className' => 'Zone',
            'foreignKey' => 'zone_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'Expectedpayment' => array(
            'className' => 'Expectedpayment',
            'foreignKey' => 'expectedpayment_id',
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
         'Order' => array(
            'className' => 'Order',
            'foreignKey' => 'order_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
          'Creditor' => array(
            'className' => 'Creditor',
            'foreignKey' => 'creditor_id',
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
         );
     
     var $hasMany = array(
        'Expectedinstallment' => array(
            'className' => 'Expectedinstallment',
            'foreignKey' => 'payment_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ));
     
}
?>
