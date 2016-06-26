<!-- Header starts here -->
<?php echo $this->element('header'); ?>
<!-- Header starts here -->

<h1>Ghana Grains Council</h1>
<h2>Warehouse Monitoring System</h2>
<div id="clearer"></div>

<div class="row">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <?php
        
        if ($user['usertype_id'] == 1 || $user['usertype_id'] == 7 || $user['usertype_id'] == 10) {
            echo $this->Html->link('
        <div id="dashboard">' .
                    $this->Html->image('suppliers.png', array())
                    . '<p>Warehouses</p>
        </div>'
                    , '/Stocks/warehouses/', array('escape' => false));
        }
        
        if ($user['usertype_id'] == 1 || $user['usertype_id'] == 7 || $user['usertype_id'] == 10) {
            echo $this->Html->link('
        <div id="dashboard">' .
                    $this->Html->image('create_product.png', array())
                    . '<p>Products</p>
        </div>'
                    , '/Stocks/addProduct/', array('escape' => false));
        }
        
        if ($user['usertype_id'] == 1 || $user['usertype_id'] == 7 || $user['usertype_id'] == 10) {
            echo $this->Html->link('
        <div id="dashboard">' .
                    $this->Html->image('add_products.png', array())
                    . '<p>Product Stock Levels</p>
        </div>'
                    , '/Stocks/productLevels/', array('escape' => false));
        }
        
        if ($user['usertype_id'] == 1 || $user['usertype_id'] == 7 || $user['usertype_id'] == 10) {
            echo $this->Html->link('
        <div id="dashboard">' .
                    $this->Html->image('list_products.png', array())
                    . '<p>Warehouse Listing</p>
        </div>'
                    , '/Stocks/warehouseListing/', array('escape' => false));
        }
        
        if ($user['usertype_id'] == 1 || $user['usertype_id'] == 7 || $user['usertype_id'] == 10) {
            echo $this->Html->link('
        <div id="dashboard">' .
                    $this->Html->image('find_products.png', array())
                    . '<p>Find Stocks</p>
        </div>'
                    , '/Stocks/findStock/', array('escape' => false));
        }
        /*
        if ($user['usertype_id'] == 1 || $user['usertype_id'] == 3 || $user['usertype_id'] == 4 || $user['usertype_id'] == 5 || $user['usertype_id'] == 6 || $user['usertype_id'] == 7 || $user['usertype_id'] == 8) {
            echo $this->Html->link('
        <div id="dashboard">' .
                    $this->Html->image('sales.png', array())
                    . '<p>Cash Sales</p>
        </div>'
                    , '/Sales/', array('escape' => false));
        }

        if ($user['usertype_id'] == 1 || $user['usertype_id'] == 3 || $user['usertype_id'] == 4 || $user['usertype_id'] == 5 || $user['usertype_id'] == 6 || $user['usertype_id'] == 7 || $user['usertype_id'] == 8) {

            echo $this->Html->link('
        <div id="dashboard">' .
                    $this->Html->image('hire_purchase.png', array())
                    . '<p>Orders</p>
        </div>'
                    , '/HirePurchase/', array('escape' => false));
        }

        if ($user['usertype_id'] == 1 || $user['usertype_id'] == 7 || $user['usertype_id'] == 10) {
            echo $this->Html->link('
        <div id="dashboard">' .
                    $this->Html->image('stocks.png', array())
                    . '<p>Warehousing</p>
        </div>'
                    , '/Stocks/stock_dashboard/', array('escape' => false));
        }

        if ($user['usertype_id'] == 1 || $user['usertype_id'] == 7 || $user['usertype_id'] == 9) {

            echo $this->Html->link('
        <div id="dashboard">' .
                    $this->Html->image('company_accounts.png', array())
                    . '<p>Accounting</p>
        </div>'
                    , '/Accounting/', array('escape' => false));
        }

        if ($user['usertype_id'] == 1) {
            echo $this->Html->link('
        <div id="dashboard">' .
                    $this->Html->image('crm.png', array())
                    . '<p>Customer Relations Management</p>
        </div>'
                    , '/Customers/', array('escape' => false));
        }

        if ($user['usertype_id'] == 1 || $user['usertype_id'] == 7) {

            echo $this->Html->link('
        <div id="dashboard">' .
                    $this->Html->image('reports.png', array())
                    . '<p>Reports</p>
        </div>'
                    , '/Reports/', array('escape' => false));
        }
        if ($user['usertype_id'] == 1) {
            echo $this->Html->link('
        <div id="dashboard">' .
                    $this->Html->image('settings.png', array())
                    . '<p>Settings</p>
        </div>'
                    , '/Settings/', array('escape' => false));
        }
        if ($user['usertype_id'] == 1 || $user['usertype_id'] == 9) {
            echo $this->Html->link('
        <div id="dashboard">' .
                    $this->Html->image('help_large.png', array())
                    . '<p>Help</p>
        </div>'
                    , '/Information/myHelp', array('escape' => false));
        }
*/


        ?>
    </div>
    
</div>



</div>
<!-- Sidebar starts here -->
<div id="sidebar">
    <?php echo $this->element('logo'); ?>
</div>
<!-- Sidebar starts here -->
<!-- Footer starts here -->
<?php echo $this->element('footer'); ?>
<!-- Footer starts here -->