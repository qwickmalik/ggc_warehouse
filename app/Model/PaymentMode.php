<?php

class PaymentMode extends AppModel {
    var $name = "PaymentMode";
    var $usesTable = "payment_modes";
    var $displayField = "payment_mode_name";
    
    
    var $hasMany = array(
        'Transaction' => array(
            'className' => 'Transaction',
            'foreignKey' => 'paymentmode_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'Journal' => array(
            'className' => 'Journal',
            'foreignKey' => 'paymentmode_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'BankTransfer' => array(
            'className' => 'BankTransfer',
            'foreignKey' => 'paymentmode_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            )
        );
}

?>
