<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
class AccountingHead extends AppModel {

    var $name = "AccountingHead";
    var $usesTable = "accounting_heads";
     var $displayField = "head_name";
     
    var $hasMany = array(
        'TransactionCategory' => array(
            'className' => 'TransactionCategory',
            'foreignKey' => 'head_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'TransCategory' => array(
            'className' => 'TransactionCategory',
            'foreignKey' => 'affected_category_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'AccountingHead' => array(
            'className' => 'AccountingHead',
            'foreignKey' => 'head_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'AccHead' => array(
            'className' => 'AccountingHead',
            'foreignKey' => 'affected_head_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'Journal' => array(
            'className' => 'Journal',
            'foreignKey' => 'head_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'Transaction' => array(
            'className' => 'Transaction',
            'foreignKey' => 'head_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        
        );
    
    
    
}
?>
