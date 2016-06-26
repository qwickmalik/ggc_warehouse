<?php
echo $this->element('header');
echo $this->Html->script('jquery.js');
echo $this->Html->script('jquery.printElement.js');
echo $this->Html->script('print.js');

if ($this->Session->check('shopCurrency')) {
    $shopCurrency = $this->Session->read('shopCurrency');
} else {
    $shopCurrency = "";
}
?>

<!-- Content starts here -->
<h1>Stock Transfers</h1>
<table width="100%" align="left" cellspacing="0" cellpadding="5" border="0" id="report_content">
    <tr>
        <td align="left" colspan="7">
            <div id="clearer">&nbsp;</div>

            <div class="row">
                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                    <?php echo $this->Html->image('logo.png', array('style' => 'float: left; margin-right: 20px;', 'alt' => $this->Session->read('shopName'))); ?>
                    <p style='font-weight: bold; font-size: 16px; text-align: left;'>STOCK TRANSFERS<br />
                        as at <?php echo date('F d, Y'); ?>
                    </p>
                    <p align='left'>For the period <?php echo isset($frend_date) ? 'From ' . $frstart_date . ' to ' . $frend_date : ''; ?></p>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                    <p align="right"><?php echo $this->Session->read('shopAddress') . ', ' . $this->Session->read('shopPosttown') . '<br />' . $this->Session->read('shopPostCity') . ', ' . $this->Session->read('shopPostCount') . '<br />' . $this->Session->read('shopTelephone') . '<br />' . $this->Session->read('shopEmail'); ?></p>
                </div>
            </div>
        </td>
    </tr>


    <tr>
        <td colspan="7"> &nbsp;</td>
    </tr>
    <tr  id="dateRow">

        <td align="left" valign="top" colspan="7">

            <?php echo $this->Form->create('StockTransfer', array("url" => array('controller' => 'Reports', 'action' => 'stockTransfers'))); ?>
            <div class="row" style="background: #eaeaea; padding: 10px 0px 5px 0px;">
<!--                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <?php
//                        echo $this->Form->input('warehouse_id', array('empty' => '(--All warehouses--)', 'label' => 'Warehouse', 'class' => 'form-control', 'div' => array('class' => 'form-inline'))); ?>
                </div>-->
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <?php echo $this->Form->input('start_date', array('label' => 'Start Date*', 'type' => 'date', 'value' => date('d-m-Y'), 'dateFormat' => 'DMY', 'class' => 'form-control', 'div' => array('class' => 'form-inline'))); ?>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <?php echo $this->Form->input('end_date', array('label' => 'End Date*', 'type' => 'date', 'value' => date('d-m-Y'), 'dateFormat' => 'DMY', 'class' => 'form-control', 'div' => array('class' => 'form-inline'))); ?>
                </div>
                
                <?php echo $this->Form->button('View', array("type" => "submit", "class" => "btn btn-md btn-success", 'style' => 'float: left; ')); ?>
            </div>

            <?php echo $this->Form->end(); ?>
        </td>
    </tr>


    <tr>
        <td align="left" valign="top" colspan="7">&nbsp;</td>
    </tr>

    <tr>
        <td colspan="7">
            <table class="table table-striped">
                <tr>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('warehouse_id', 'Supply Warehouse'); ?></th>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('request_warehs_id', 'Requesting Warehouse'); ?></th>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('total_items', 'No. of Items Expected'); ?></th>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('total_supplied', 'No. of Items Transfered'); ?></th>
                    <!--<th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php // echo $this->Paginator->sort('user_id', 'Processed By'); ?></th>-->
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('request_date', 'Request Date'); ?></th>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo 'Status'; ?></th>
                </tr>
                <?php
                if (isset($data)) {
                    foreach ($data as $each_item):
                        ?>
                        <tr>
                            <td align="left" valign="top" ><?php
                                if (isset($each_item['Warehouse']['warehouse'])) {
                                    echo $each_item['Warehouse']['warehouse'];
                                }
                                ?></td>
                            <td align="left" valign="top" ><?php
                                if (isset($each_item['WarehouseTransfer']['request_warehs_id'])) {
                                    echo $warehouses[$each_item['WarehouseTransfer']['request_warehs_id']];
                                }
                                ?></td>
                            <td align="left" valign="top" ><?php
                                if (isset($each_item['WarehouseTransfer']['total_items'])) {
                                    echo $each_item['WarehouseTransfer']['total_items'];
                                }
                                ?></td>
                            <td align="left" valign="top" ><?php
                                if (isset($each_item['WarehouseTransfer']['total_supplied'])) {
                                    echo $each_item['WarehouseTransfer']['total_supplied'];
                                }
                                ?></td>
                            <td align="left" valign="top" ><?php
                                if (isset($each_item['WarehouseTransfer']['request_date'])) {
                                    echo $each_item['WarehouseTransfer']['request_date'];
                                }
                                ?></td>
                            <td align="left" valign="top" ><?php
                                if (isset($each_item['WarehouseTransfer']['request_status'])) {
                                    echo $each_item['WarehouseTransfer']['request_status'];
                                }
                                ?></td>
                        </tr>
                        <?php
                    endforeach;
                }
                ?>

            </table>
        </td>
    </tr>

    <tr>
        <td align="right" valign="top" colspan="7">
            <p style="font-style: italic;">Generated on <?php echo date('d-m-Y'); ?></p>
        </td>
    </tr>
    <tr>
        <td align="right" valign="top" colspan="7">

        </td>
    </tr>
</table>
<?php
echo $this->Html->link('Print', "javascript:void(0)", array("class" => 'btn btn-md btn-danger', "id" => "print_report", 'style' => 'float: right;'));
?>
</div>
<!-- Content ends here -->
<!-- Sidebar starts here -->
<div id="sidebar_reports">
    <?php
    echo $this->element('logo');
    echo $this->element('reports_sidebar');
    ?>
</div>
<!-- Sidebar starts here -->

<?php echo $this->element('footer'); ?>

