<!-- Header starts here -->
<?php echo $this->element('header'); ?>
<!-- Header ends here -->

    <h2>Warehousing (Stock/Service management)</h2>
    <div id="clearer"></div>
    <!-- Panels start here -->
    

    <div id="panel">
        <?php
        echo $this->Html->link($this->Html->image('suppliers.png', array('width' => '32', 'height' => '32')), '/Stocks/warehouses', array('escape' => false));
        ?>

        <div id="panel_txt">
            <h2>Warehouses</h2>
            <p></p>
        </div>
    </div>

    <div id="panel">
        <?php
        echo $this->Html->link($this->Html->image('create_product.png', array('width' => '32', 'height' => '32')), '/Stocks/addProduct', array('escape' => false));
        ?>

        <div id="panel_txt">
            <h2>Products</h2>
            <p></p>
        </div>
    </div>

    <div id="panel">
        <?php
        echo $this->Html->link($this->Html->image('add_products.png', array('width' => '32', 'height' => '32')), '/Stocks/productLevels', array('escape' => false));
        ?>

        <div id="panel_txt">
            <h2>Product Stock Levels</h2>
            <p></p>
        </div>
    </div>
    
    
<!--    <div id="panel">
    <?php
//    echo $this->Html->link($this->Html->image('find_products.png', array('width' => '32', 'height' => '32')), '/Stocks/clearSessions', array('escape' => false));
    ?>

        <div id="panel_txt">
            <h2>Find/Edit Products/Services</h2>
            <p></p>
        </div>
    </div>-->
    
    

    <!-- Panels end here -->
</div>
<!-- Sidebar starts here -->
<div id="sidebar">
    <?php
    echo $this->element('logo');
    echo $this->element('sidebar_stocks');
    ?>
</div>
<!-- Sidebar ends here -->
<!-- Footer starts here -->
        <?php echo $this->element('footer'); ?>
<!-- Footer ends here -->