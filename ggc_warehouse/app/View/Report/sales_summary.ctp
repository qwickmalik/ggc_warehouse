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

if (isset($customer)) {
    $customer_name = $customer;
} else {
    $customer_name = "[customer]";
}

if (isset($start_date)) {
    $sdate = $start_date;
} else {
    $sdate = "[start_date]";
}

if (isset($end_date)) {
    $edate = $end_date;
} else {
    $edate = "[end_date]";
}
?>
<!-- Content starts here -->

<div id="clearer">&nbsp;</div>
<table cellspacing="10" cellpadding="0" width="100%" border="0" style="background: #eaeaea;">
    <?php echo $this->Form->create('SalesItem', array("url" => array('controller' => 'Reports', 'action' => 'salesSummary'))); ?>
    <tr>
        <td align="center" colspan="4">&nbsp;</td>
    </tr>
    <tr>
        <td align="center">
            <?php
            echo $this->Form->input('user_id', array('empty' => '(All Salespersons & Attendants)', 'label' => false, "id" => "drpSalesPerson", 'class' => 'form-control', 'div' => array('class' => 'form-inline')));
            ?>
        </td>
        <td align="center" valign="top">
            <?php
            echo $this->Form->input('begin_date', array('label' => 'Start Date*', 'type' => 'date', 'value' => date('DMY'), 'dateFormat' => 'DMY', 'class' => 'form-control', 'div' => array('class' => 'form-inline')));
            ?>
        </td>
        <td align="center" valign="top">
            <?php
            echo $this->Form->input('finish_date', array('label' => 'End Date*', 'type' => 'date', 'value' => date('DMY'), 'dateFormat' => 'DMY', 'class' => 'form-control', 'div' => array('class' => 'form-inline')));
            ?>
        </td>

        <td align="center">
            <input type="hidden" name="data[Setting][from]" id="dtFrom" />
            <input type="hidden" name="data[Setting][to]" id="dtTo" />
            <?php
            echo $this->Form->button('View', array("type" => "submit", "class" => "btn btn-md btn-success"));
            ?>
        </td>
    </tr>

    <?php echo $this->Form->end(); ?>
</table>



<table id="report_content" width="100%" align="left" cellspacing="0" cellpadding="5" border="0">
    <tr>
        <td colspan="6" align="left">
            <div id="clearer">&nbsp;</div>
            <div id="clearer">&nbsp;</div>
            <div class="row">
                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                    <?php echo $this->Html->image('logo.png', array('style' => 'float: left; margin-right: 20px;', 'alt' => $this->Session->read('shopName'))); ?>
                    <p style='font-weight: bold; font-size: 16px; text-align: left;'>Sales Summary Report from <?php echo $sdate; ?> - <?php echo $edate; ?></p>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                    <p align="right"><?php echo $this->Session->read('shopAddress') . ', ' . $this->Session->read('shopPosttown') . '<br />' . $this->Session->read('shopPostCity') . ', ' . $this->Session->read('shopPostCount') . '<br />' . $this->Session->read('shopTelephone') . '<br />' . $this->Session->read('shopEmail'); ?></p>
                </div>
            </div>

        </td>
    </tr>
    <tr>
        <td align="right">&nbsp;</td>
        <td align="right" colspan="3">

        </td>
    </tr>
    <tr>
        <td colspan="4">
            <table class="table table-striped">

<!--    <tr>
<th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php /* echo $this->Paginator->sort('sale_date', 'Date Sold'); ?></th>
                      <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('username', 'Sales Person'); ?></th>
                      <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('client_name', 'Customer'); ?></th>
                      <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('item', 'Item'); ?></th>
                      <th align="right" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('selling_price', 'Price'); ?></th>
                      <th align="right" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('quantity', 'Qty'); ?></th>
                      <th align="right" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('total_price', 'Total'); */ ?></th>
</tr>-->
                <tr>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo 'Date Sold'; ?></th>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo 'Sales Person'; ?></th>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo 'Customer'; ?></th>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo 'Item'; ?></th>
                    <th align="right" valign="top" style="border-bottom: solid 2px Gray;"><?php echo 'Price'; ?></th>
                    <th align="right" valign="top" style="border-bottom: solid 2px Gray;"><?php echo 'Qty'; ?></th>
                    <th align="right" valign="top" style="border-bottom: solid 2px Gray;"><?php echo 'Total'; ?></th>
                </tr>
                <?php
                if (isset($sales)) {
                    foreach ($sales as $each_item):
                        ?>
                        <tr>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                if (isset($each_item['Sale']['sale_date'])) {
                                    echo $each_item['Sale']['sale_date'];
                                }
                                ?></td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                if (isset($each_item['User']['username'])) {
                                    echo $each_item['User']['username'];
                                }
                                ?></td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                if (isset($each_item['Customer']['fullname'])) {
                                    echo $each_item['Customer']['fullname'];
                                }
                                ?></td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                if (isset($each_item['Item']['item'])) {
                                    echo $each_item['Item']['item'];
                                }
                                ?></td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                if (isset($each_item['SalesItem']['unit_price'])) {
                                    echo $each_item['SalesItem']['unit_price'];
                                }
                                ?></td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                if (isset($each_item['SalesItem']['quantity'])) {
                                    echo $each_item['SalesItem']['quantity'];
                                }
                                ?></td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                if (isset($each_item['SalesItem']['unit_price'])) {
                                    $total = $each_item['SalesItem']['unit_price'] * $each_item['SalesItem']['quantity'];
                                    echo $total;
                                }
                                ?></td>
                        </tr>
                        <?php
                    endforeach;
                }
                ?>

                <?php
                if (isset($salestotal)) {
                    foreach ($salestotal as $val):
                        ?>
                        <tr style="background-color: #eaeaea;">
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">Total</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                            <td align="left" width ="100" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;"><?php
                                if (isset($val[0]['stotal'])) {

                                    $totstot = $val[0]['stotal'];
                                    echo $shopCurrency . ' ' . round($totstot, 0);
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
        <td align="right" valign="top" colspan="6">
            <p style="font-style: italic;">Generated on <?php echo date('d-m-Y H:s'); ?></p>
        </td>
    </tr>
    <tr>
        <td align="right" valign="top" colspan="6">

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
<!-- Footer starts here -->
<?php echo $this->element('footer'); ?>
<!-- Footer starts here -->
