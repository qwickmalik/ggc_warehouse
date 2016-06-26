<?php
echo "<h2>Stock Management</h2>";

     $list = array(
         $this->Html->link($this->Html->image('suppliers.png').'Add Products','/Stocks/warehouses', array('escape' => false)),
         $this->Html->link($this->Html->image('create_product.png').'Products','/Stocks/addProduct', array('escape' => false)),
         $this->Html->link($this->Html->image('add_products.png').'Product Stock Levels','/Stocks/productLevels', array('escape' => false)),
         
        );
     echo $this->Html->nestedList($list, $tag = 'ul');
?>