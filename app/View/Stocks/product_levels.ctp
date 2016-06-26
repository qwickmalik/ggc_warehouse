<?php
echo $this->element('header');
//echo $this->Html->script('notification.js');
?>

<!-- Content starts here -->

<h2>Product Levels</h2>
<span >
    <div class="row">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <h3><?php echo $this->Html->link("Bulk Item Upload", "#", array("class" => "popup", "rel" => "popuprel")); ?></h3>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">

        </div>
    </div>
    <div class="popupbox" id="popuprel">
        <div id="intabdiv">

            <div style="margin-left: 30px;margin-right: 30px;margin-top: 50px;clear:both">
                <?php echo $this->Form->create('Item', array('enctype' => 'multipart/form-data', "url" => array('controller' => 'Stocks', 'action' => 'readCSV'), "inputDefaults" => array('label' => false, 'div' => false))); ?>

                <table border="0" width="90%" cellspacing="4" cellpadding="0" align="left">
                    <tr >
                        <td align="right" valign="middle"><b>Excel File:&nbsp;</b></td>
                        <td align="left" valign="middle"><span ><?php echo $this->Form->input('excel_file', array("class" => "large", "size" => 30, 'type' => 'file', 'value' => '')); ?></span></td>


                    </tr>
                    <tr>
                        <td><h3 align="right">&nbsp;</h3></td>
                        <td>
                            <?php echo $this->Form->button('Load', array("type" => "submit", "class" => "btn btn-md btn-success")); //check the parameters here   ?>
                        </td>

                    </tr>
                    <tr >
                        <td align="right" valign="middle"><b>&nbsp;</b></td>
                        <td align="left" valign="middle">&nbsp;</td>


                    </tr>
                    <tr>
                        <td><h3 align="right">&nbsp;</h3></td>
                        <td><?php echo $this->Html->link("Download Sample Excel Format", "../Stocks/sendExcelFile/"); ?>
                        </td>

                    </tr>
                </table>
                <?php
                echo $this->Form->end();
                ?>
            </div>
        </div>
    </div>
    <div id="fade"></div>
</span>

<div id="clearer"></div>


<div class="row">
    <?php echo $this->Form->create('ProductLevel', array("url" => array('controller' => 'Stocks', 'action' => 'productLevels'))); ?>

    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
        <?php
        echo $this->Form->input('warehouse_id', ['label' => 'Warehouse', 'empty' => '--Please select--', 'options' => $warehouseids, 'value' => isset($prodlev['ProductLevel']['warehouse_id']) ? $prodlev['ProductLevel']['warehouse_id'] : '']);


        echo $this->Form->hidden('id', ['value' => isset($prodlev['ProductLevel']['id']) ? $prodlev['ProductLevel']['id'] : '']);

        echo $this->Form->input('product_id', ['label' => 'Product', 'empty' => '--Please select--', 'options' => $prodids, 'value' => isset($prodlev['ProductLevel']['product_id']) ? $prodlev['ProductLevel']['product_id'] : '', 'required']);
        ?> 
    </div>
    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
<?php
echo $this->Form->input('quantity', ['label' => 'Quantity', 'value' => isset($prodlev['ProductLevel']['quantity']) ? $prodlev['ProductLevel']['quantity'] : '', 'required']);
?>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <?php
            echo $this->Form->input('unit', ['label' => 'Unit', 'value' => isset($prodlev['ProductLevel']['unit']) ? $prodlev['ProductLevel']['unit'] : '', 'required']);
            ?>
        </div>



<?php echo $this->Form->button('Save', array("type" => "submit", "class" => "btn btn-lg btn-success", 'style' => 'float: right;')); ?>
    </div>
        <?php echo $this->Form->end(); ?>
</div>


<div id="clearer"></div>


<table class="table table-striped">
    <tr>
        <td style="border-bottom: solid 2px dodgerblue;" width="50" align="left"><b><?php echo $this->Paginator->sort('id', 'ID'); ?></b></td>
        <td style="border-bottom: solid 2px dodgerblue;" align="left"><b><?php echo $this->Paginator->sort('modified', 'Date'); ?></b></td>
        <td style="border-bottom: solid 2px dodgerblue;" align="left"><b><?php echo $this->Paginator->sort('warehouse_id', 'Warehouse'); ?></b></td>
        <td style="border-bottom: solid 2px dodgerblue" align="left"><b><?php echo $this->Paginator->sort('product_id', 'Product'); ?></b></td>
        <td style="border-bottom: solid 2px dodgerblue" align="left"><b><?php echo $this->Paginator->sort('quantity', 'Quantity'); ?></b></td>
        <td style="border-bottom: solid 2px dodgerblue;" align="left"><b>Delete</b></td>
    </tr>
<?php foreach ($data as $each_item): ?>
        <tr>
            <td align="left"><?php echo $each_item['ProductLevel']['id']; ?></td>
            <td align="left"><?php echo $each_item['ProductLevel']['modified']; ?></td>
            <td align="left"><?php echo $each_item['Warehouse']['warehouse_name']; ?></td>
            <td align="left"><?php echo $each_item['Product']['product_name']; ?></td>
            <td align="left"><?php echo $this->Html->link($each_item['ProductLevel']['quantity'].' '.$each_item['ProductLevel']['unit'], "/Stocks/productLevels/" . $each_item['ProductLevel']['id'], array()); ?></td> 
            <td align="left"><?php echo $this->Html->link("Delete", "/Stocks/delProductLevel/" . $each_item['ProductLevel']['id'], array("class" => $each_item['ProductLevel']['id'], 'confirm' => 'Are you sure you want to delete?'));
                ?></td>


    
        </tr>
        <?php endforeach; ?>

    <tr>
        <td colspan="6" align="center">
<?php
echo $this->Paginator->first($this->Html->image('first.png', array('width' => 15, 'height' => 15, 'valign' => 'middle', 'alt' => 'First', 'title' => 'First')), array('escape' => false), null, null, array('class' => 'disabled')) . "&nbsp;&nbsp;&nbsp;&nbsp;";
echo $this->Paginator->prev($this->Html->image('prev.png', array('width' => 15, 'height' => 15, 'valign' => 'middle', 'alt' => 'Previous', 'title' => 'Previous')), array('escape' => false), null, null, array('class' => 'disabled')) . "&nbsp;&nbsp;&nbsp;&nbsp;";
echo $this->Paginator->numbers() . "&nbsp;&nbsp;";
echo $this->Paginator->next($this->Html->image('next.png', array('width' => 15, 'height' => 15, 'valign' => 'middle', 'alt' => 'Next', 'title' => 'Next')), array('escape' => false), null, null, array('class' => 'disabled')) . "&nbsp;&nbsp;&nbsp;&nbsp;";
echo $this->Paginator->last($this->Html->image('last.png', array('width' => 15, 'height' => 15, 'valign' => 'middle', 'alt' => 'Last', 'title' => 'Last')), array('escape' => false), null, null, array('class' => 'disabled')) . "&nbsp;&nbsp;&nbsp;&nbsp;";
//prints X of Y, where X is current page and Y is number of pages
echo $this->Paginator->counter(array('format' => 'Page %page% of %pages%, showing %current% items out of %count% total'));
?>
        </td>
    </tr>
</table>
<div id="clearer"></div>



</div>
<!-- Content ends here -->

<!-- Sidebar starts here -->
<div id="sidebar">
<?php
echo $this->element('logo');
echo $this->element('sidebar_stocks');
?>
</div>
<!-- Sidebar starts here -->
<!-- Footer starts here -->
<?php echo $this->element('footer'); ?>
<!-- Footer starts here -->