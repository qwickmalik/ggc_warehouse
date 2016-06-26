<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
class ProductLevel extends AppModel {

    var $name = "ProductLevel";
    var $usesTable = "product_levels";
     var $displayField = "quantity";
     
    var $hasMany = array(
        );
    
    var $belongsTo = array(
        'Warehouse' => array(
            'className' => 'Warehouse',
            'foreignKey' => 'warehouse_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'Product' => array(
            'className' => 'Product',
            'foreignKey' => 'product_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'Region' => array(
            'className' => 'Region',
            'foreignKey' => 'region_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        );
    
    function getProductLevels(){
        $result = $this->find('all');
        return $result;
    }
    
}
?>
