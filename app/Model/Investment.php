<?php

class Investment extends AppModel{
    
    var $name = 'Investment';
    var $usesTable = "investments";
    
    
    var $belongsTo = array(
        'Investor' => array(
            'className' => 'Investor',
            'foreignKey' => 'investor_id',
            'conditions' => '',
            'order' =>  array('Investor.fullname' => 'asc'),
            'limit' => '',
            'dependent' => true
        ),
        'Portfolio' => array(
            'className' => 'Portfolio',
            'foreignKey' => 'portfolio_id',
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
            ));
    
    
     var $hasMany = array(
        'InvestmentPayment' => array(
            'className' => 'InvestmentPayment',
            'foreignKey' => 'investment_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
            'Rollover' => array(
            'className' => 'Rollover',
            'foreignKey' => 'investment_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
            'InvestmentStatement' => array(
            'className' => 'InvestmentStatement',
            'foreignKey' => 'investment_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            )
         );
    
}
?>
