<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of SupplyPayment
 *
 * @author Brain
 */
class SupplyPayment extends AppModel{
    //put your code here
    var $name = "SupplyPayment";
    var $usesTable = "supply_payments";
    var $belongsTo = array(
         'Supplierinvoice' => array(
            'className' => 'Supplierinvoice',
            'foreignKey' => 'supplierinvoice_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'Supplier' => array(
            'className' => 'Supplier',
            'foreignKey' => 'supplier_id',
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
}

?>
