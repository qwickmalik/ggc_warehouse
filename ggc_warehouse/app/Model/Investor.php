<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Investor
 *
 * @author Brain
 */
class Investor extends AppModel{
    
    var $name = 'Investor';
    var $usesTable = "investors";
    
    var $belongsTo = array(
          'Marriage' => array(
            'className' => 'Marriage',
            'foreignKey' => 'marriage_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
          ),
        'Idtype' => array(
            'className' => 'Idtype',
            'foreignKey' => 'idtype_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
          ),
        'CustomerCategory' => array(
            'className' => 'CustomerCategory',
            'foreignKey' => 'customer_category_id',
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
            'foreignKey' => 'investor_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
            'Rollover' => array(
            'className' => 'Rollover',
            'foreignKey' => 'investor_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
            'InvestmentStatement' => array(
            'className' => 'InvestmentStatement',
            'foreignKey' => 'investor_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            )
            );
}

?>
