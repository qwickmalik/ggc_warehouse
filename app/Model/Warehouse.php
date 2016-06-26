<?php

class Warehouse extends AppModel {

    var $name = "Warehouse";
    var $usesTable = "warehouses";
    var $displayField = "warehouse_name";
    
    var $belongsTo = array(
        'Region' => array(
            'className' => 'Region',
            'foreignKey' => 'region_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            )
         );
    
     var $hasMany = array(
        'ProductLevels' => array(
            'className' => 'ProductLevels',
            'foreignKey' => 'warehouse_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
         
         
         );
    

    function getWarehouses(){
        $result = $this->find('all');
        return $result;
    }
    
    
}
?>