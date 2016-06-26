<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
class DiscountCard extends AppModel {

    var $name = "DiscountCard";
    var $usesTable = "discount_cards";
//    var $virtualFields = array("discount_card"=>"CONCAT( discount_code, ' : ', '(', discount_rate,'%)')");
    var $displayField = 'discount_code';
        
     var $hasMany = array(
        'Customer' => array(
            'className' => 'Customer',
            'foreignKey' => 'discount_card_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => false
            ));
     
 var $belongsTo = array(
          'DiscountCategory' => array(
            'className' => 'DiscountCategory',
            'foreignKey' => 'discount_category_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => false
          ));
    
}
?>
