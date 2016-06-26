<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
class DiscountCategory extends AppModel {

    var $name = "DiscountCategory";
    var $usesTable = "discount_categories";
    var $displayField = 'category_name';
        
     var $hasMany = array(
        'DiscountCard' => array(
            'className' => 'DiscountCard',
            'foreignKey' => 'discount_category_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => false
            ));
     
 
     
}
?>
