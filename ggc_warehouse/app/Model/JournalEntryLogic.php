<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
class JournalEntryLogic extends AppModel {

    var $name = "JournalEntryLogic";
    var $usesTable = "journal_entry_logics";
   
    
     var $belongsTo = array(
        'TransactionCategory' => array(
            'className' => 'TransactionCategory',
            'foreignKey' => 'category_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true),
         'TransCategory' => array(
            'className' => 'TransactionCategory',
            'foreignKey' => 'affected_category_id',
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
         'AccHead' => array(
            'className' => 'AccountingHead',
            'foreignKey' => 'affected_head_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true),
         );
            
    var $hasMany = array(

        );
    
    
        
        
        
        
 }
?>
