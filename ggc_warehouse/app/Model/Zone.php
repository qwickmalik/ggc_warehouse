<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Zone
 *
 * @author Brain
 */
class Zone extends AppModel {
    //put your code here
    var $name = "Zone";
    var $usesTable = "zones";
    var $displayField = "zone";
    
    var $hasMany = array(
        'Sale' => array(
            'className' => 'Sale',
            'foreignKey' => 'zone_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
         'User' => array(
            'className' => 'User',
            'foreignKey' => 'zone_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        
        'Expectedinstallment' => array(
            'className' => 'Expectedinstallment',
            'foreignKey' => 'zone_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'Payment' => array(
            'className' => 'Payment',
            'foreignKey' => 'zone_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'Customer' => array(
            'className' => 'Customer',
            'foreignKey' => 'zone_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'Client' => array(
            'className' => 'Client',
            'foreignKey' => 'zone_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        
        'Order' => array(
            'className' => 'Order',
            'foreignKey' => 'zone_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'Invoice' => array(
            'className' => 'Invoice',
            'foreignKey' => 'zone_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
         'InvoiceoldEdition' => array(
            'className' => 'InvoiceoldEdition',
            'foreignKey' => 'zone_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        
        'CashAccount' => array(
            'className' => 'CashAccount',
            'foreignKey' => 'zone_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'TempcashAccount' => array(
            'className' => 'TempcashAccount',
            'foreignKey' => 'zone_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),  
        'ImprestAccount' => array(
            'className' => 'ImprestAccount',
            'foreignKey' => 'zone_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
         'Investor' => array(
            'className' => 'Investor',
            'foreignKey' => 'zone_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            )
        
        
        );
    var $belongsTo = array(
        'Warehouse' => array(
            'className' => 'Warehouse',
            'foreignKey' => 'warehouse_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ));
}

?>
