<?php

class WarehouseTransfer extends AppModel {

    var $name = "WarehouseTransfer";
    var $usesTable = "warehouse_transfers";
    
//     var $hasMany = array(
//        'WarehouseTransferItem' => array(
//            'className' => 'WarehouseTransferItem',
//            'foreignKey' => 'warehouse_transfer_id',
//            'conditions' => '',
//            'order' => '',
//            'limit' => '',
//            'dependent' => true
//            ));
    
    var $belongsTo = array(
        'User' => array(
            'className' => 'User',
            'foreignKey' => 'user_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'Warehouse' => array(
            'className' => 'Warehouse',
            'foreignKey' => 'request_warehs_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'Item' => array(
            'className' => 'Item',
            'foreignKey' => 'item_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'Warehouse' => array(
            'className' => 'Warehouse',
            'foreignKey' => 'warehouse_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ));
//    function getWarehouseByWarehouse($warehouse=null) {
//        $condition = array('Warehouse.warehouse' => $warehouse);
//        $results = $this->find('first',array('conditions' => $condition));
//        return $results;
//    }

    function getWarehouses(){
        $result = $this->find('all');
        return $result;
    }
    
    
}
?>