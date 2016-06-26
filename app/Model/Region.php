<?php


class Region extends AppModel {
    //put your code here
    var $name = "Region";
    var $usesTable = "regions";
    var $displayField = "region_name";
    
    var $hasMany = array(
        'Warehouse' => array(
            'className' => 'Warehouse',
            'foreignKey' => 'region_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'ProductLevel' => array(
            'className' => 'ProductLevel',
            'foreignKey' => 'region_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        );
    
}

?>
