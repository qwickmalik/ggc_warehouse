<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
class CashAccount extends AppModel {

    var $name = "CashAccount";
    var $usesTable = "cash_accounts";
   
    
     var $belongsTo = array(
        'Expense' => array(
            'className' => 'Expense',
            'foreignKey' => 'expense_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true),
         'User' => array(
            'className' => 'User',
            'foreignKey' => 'user_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true)
         );
            
    var $hasMany = array(
        'Loan' => array(
            'className' => 'Loan',
            'foreignKey' => 'cash_account_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ), 
        'Loanpayment' => array(
            'className' => 'Loanpayment',
            'foreignKey' => 'cash_account_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'LoanExpectedpayment' => array(
            'className' => 'LoanExpectedpayment',
            'foreignKey' => 'cash_account_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'BalanceSheet' => array(
            'className' => 'BalanceSheet',
            'foreignKey' => 'cash_account_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'IncomeStatement' => array(
            'className' => 'IncomeStatement',
            'foreignKey' => 'cash_account_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            )
        );
 }
?>
