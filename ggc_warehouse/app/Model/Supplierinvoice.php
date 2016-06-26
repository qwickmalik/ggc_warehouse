<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of SupplierInvoice
 *
 * @author Brain
 */
class Supplierinvoice extends AppModel {
    //put your code here
    var $name = "Supplierinvoice";
    var $usesTable = "supplierinvoices";
    
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
        'Item' => array(
            'className' => 'Item',
            'foreignKey' => 'supply_invoiceno',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'WarehouseItem' => array(
            'className' => 'WarehouseItem',
            'foreignKey' => 'supply_invoiceno',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'SupplyPayment' => array(
            'className' => 'SupplyPayment',
            'foreignKey' => 'supplierinvoice_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            )
        );
}

?>
