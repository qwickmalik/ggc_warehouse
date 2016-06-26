<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
class Journal extends AppModel {

    var $name = "Journal";
    var $usesTable = "journals";
   
    
     var $belongsTo = array(
        'TransactionCategory' => array(
            'className' => 'TransactionCategory',
            'foreignKey' => 'category_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true),
         
         'AccountingHead' => array(
            'className' => 'AccountingHead',
            'foreignKey' => 'head_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true),
         
         'CashAccount' => array(
            'className' => 'CashAccount',
            'foreignKey' => 'account_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true),
         'PaymentMode' => array(
            'className' => 'PaymentMode',
            'foreignKey' => 'paymentmode_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true)
         );
            
    var $hasMany = array(

        );
    
    
        
        
        
        
 }
?>
