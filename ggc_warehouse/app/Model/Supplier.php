<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
class Supplier extends AppModel {

    var $name = "Supplier";
    var $usesTable = "suppliers";
    var $displayField = "supplier_name";
    
     var $hasMany = array(
        'Creditor' => array(
            'className' => 'Creditor',
            'foreignKey' => 'supplier_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
         'CreditPayment' => array(
            'className' => 'CreditPayment',
            'foreignKey' => 'supplier_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
         
          'Item' => array(
            'className' => 'Item',
            'foreignKey' => 'supplier_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
         'WarehouseItem' => array(
            'className' => 'WarehouseItem',
            'foreignKey' => 'supplier_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
         'Supplieritem' => array(
            'className' => 'Supplieritem',
            'foreignKey' => 'supplier_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
         'Supplierinvoice' => array(
            'className' => 'Supplierinvoice',
            'foreignKey' => 'supplier_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
         'SupplyPayment' => array(
            'className' => 'SupplyPayment',
            'foreignKey' => 'supplier_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            )
         );
}
?>
