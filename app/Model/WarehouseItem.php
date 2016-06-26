<?php

class WarehouseItem extends AppModel {

    var $name = "WarehouseItem";
    var $usesTable = "warehouse_items";
   
    var $belongsTo = array(
        'Warehouse' => array(
            'className' => 'Warehouse',
            'foreignKey' => 'warehouse_id',
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
        'Supplier' => array(
            'className' => 'Supplier',
            'foreignKey' => 'supplier_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            )
          ,
          'Supplierinvoice' => array(
            'className' => 'Supplierinvoice',
            'foreignKey' => 'supply_invoiceno',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ));
var $hasMany = array(
        'OrdersItem' => array(
            'className' => 'OrdersItem',
            'foreignKey' => 'warehouse_item_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'SalesItem' => array(
            'className' => 'SalesItem',
            'foreignKey' => 'warehouse_item_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ));

      function getSale($saleId = 0,$warehsid=0){
//        $this->id = $saleId;
        $result = $this->find('first',array('conditions' => array('WarehouseItem.item_id' => $saleId,'WarehouseItem.warehouse_id' => $warehsid)));
        return $result;
    } 
}
?>