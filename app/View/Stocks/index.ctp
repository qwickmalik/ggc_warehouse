<?php
echo $this->element('header');
//echo $this->Html->script('notification.js');
?>

<!-- Content starts here -->

<h2>Stock Management: Add Product</h2>
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

<?php echo $this->Form->create('Item', array('enctype' => 'multipart/form-data', "url" => array('controller' => 'Stocks', 'action' => 'itemsList'), "inputDefaults" => array('div' => false))); ?>

<div class="row">
    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
        <?php
        echo $this->Form->input('item', array("label" => "Product Name"));
        echo $this->Form->hidden('id');
        echo $this->Form->hidden('original_quantity');
        echo $this->Form->input('modelno', array("label" => "Model Number"));
        echo $this->Form->input('item_type', array("label" => "Item Type"));
        ?>

        <?php
        echo $this->Form->input('brand', array("class" => "large"));
        //check the 
        ?>
    </div>
    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
        <fieldset>
            <?php
            echo $this->Form->input('transaction_mode', array('required',
                'type' => 'radio',
                'options' => array('Sale' => 'Sale', 'Service' => 'Service', 'Rental' => 'Rental'),
                'hiddenField' => false,
                'legend' => false,
                'before' => '<label><b align="right">Transaction Mode</b></label><br />',
                'label' => array('class' => 'control-label',),
                'class' => 'myradio',
                ));
            ?>
        </fieldset>

        
        <?php
        echo $this->Form->input('description', array('size' => 5, 'cols' => 37, 'type' => 'textarea', 'style' => 'height: 50px;'));
        ?>
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <?php echo $this->Form->input('cost_price', array("value" => 0)); ?>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <?php echo $this->Form->input('selling_price', array("value" => 0)); ?>
            </div>
        </div>
        
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <?php echo $this->Form->input('remaining_quantity', array("label" => "Quantity to be Added", "value" => 1)); ?>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <?php echo $this->Form->input('item_photo', array('type' => 'file', 'label' => 'Item Photo')); ?>
            </div>
        </div>
        <?php
        
        
        
        
        echo $this->Form->input('warehouse_id', array('default' => 0, 'label' => 'Warehouse', 'empty' => '--Please Select--'));
        echo $this->Form->button('Save', array("type" => "submit", "class" => "btn btn-md btn-success", 'style' => 'float: right;'));
        ?>
    </div>
</div>

<?php
echo $this->Form->end();
?>
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