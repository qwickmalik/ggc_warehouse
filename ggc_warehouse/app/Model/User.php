<?php

class User extends AppModel {

    var $name = "User";
    var $usesTable = "users";
    var $displayField = "username";
    
    var $hasMany = array(
        'ImprestAccount' => array(
            'className' => 'ImprestAccount',
            'foreignKey' => 'user_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'WarehouseTransfer' => array(
            'className' => 'WarehouseTransfer',
            'foreignKey' => 'user_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'Sale' => array(
            'className' => 'Sale',
            'foreignKey' => 'user_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'FixedAsset' => array(
            'className' => 'FixedAsset',
            'foreignKey' => 'user_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'TempSale' => array(
            'className' => 'TempSale',
            'foreignKey' => 'user_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'Customer' => array(
            'className' => 'Customer',
            'foreignKey' => 'user_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'Payment' => array(
            'className' => 'Payment',
            'foreignKey' => 'user_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'Expectedinstallment' => array(
            'className' => 'Expectedinstallment',
            'foreignKey' => 'user_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        
        'SupplyPayment' => array(
            'className' => 'SupplyPayment',
            'foreignKey' => 'user_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'SalesItem' => array(
            'className' => 'SalesItem',
            'foreignKey' => 'user_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
         'Investor' => array(
            'className' => 'Investor',
            'foreignKey' => 'user_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'InvestmentPayment' => array(
            'className' => 'InvestmentPayment',
            'foreignKey' => 'user_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
            'Rollover' => array(
            'className' => 'Rollover',
            'foreignKey' => 'user_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
            'InvestmentStatement' => array(
            'className' => 'InvestmentStatement',
            'foreignKey' => 'user_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            )
        );
    
    var $belongsTo = array(
        'Usertype' => array(
            'className' => 'Usertype',
            'foreignKey' => 'usertype_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'Userdepartment' => array(
            'className' => 'Userdepartment',
            'foreignKey' => 'userdepartment_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'Zone' => array(
            'className' => 'Zone',
            'foreignKey' => 'zone_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            )
        );
    

    
    function getUserByUsername($username=null) {
        $condition = array('User.username' => $username);
        $results = $this->find('first',array('conditions' => $condition));
        return $results;
    }

    
    
}
?>