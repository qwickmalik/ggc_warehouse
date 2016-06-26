<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of OrderItem
 *
 * @author Brain
 */
class OrdersItem extends AppModel {

    var $name = "OrdersItem";
    var $usesTable = "orders_items";
    var $virtualFields = array("total_cost"=>"(OrdersItem.cost_price * OrdersItem.quantity)","profit" => "(OrdersItem.hp_price - (OrdersItem.cost_price * OrdersItem.quantity))");
    
     var $belongsTo = array(
          'Item' => array(
            'className' => 'Item',
            'foreignKey' => 'item_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
          ),
          'WarehouseItem' => array(
            'className' => 'WarehouseItem',
            'foreignKey' => 'warehouse_item_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
          ),
         'Order' => array(
            'className' => 'Order',
            'foreignKey' => 'order_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
          ),
         'Customer' => array(
            'className' => 'Customer',
            'foreignKey' => 'customer_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
        ));
  
     var $hasMany = array(
         'Repossession' => array(
            'className' => 'Repossession',
            'foreignKey' => 'orders_item_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ));

}

?>
