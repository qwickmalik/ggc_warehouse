<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Product
 *
 * @author Malik
 */
class Product extends AppModel {

    var $name = "Product";
    var $usesTable = "products";
     var $displayField = "product_name";
       var $hasMany = array(
        'ProductLevels' => array(
            'className' => 'ProductLevels',
            'foreignKey' => 'product_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        );
//       var $hasManyAndBelongsTo = array(
//           'Warehouse' => array(
//            'className' => 'Warehouse',
//            'foreignKey' => 'product_id',
//            'conditions' => '',
//            'order' => '',
//            'limit' => '',
//            'dependent' => true
//            ),
//       );
}
