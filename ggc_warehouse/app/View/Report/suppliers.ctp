<?php
echo $this->element('header');echo $this->Html->script('jquery.js');echo $this->Html->script('jquery.printElement.js');echo $this->Html->script('print.js');

$total_c = 0;
$total_p = 0;
$total_b = 0;
$amount_p = '0.00';
$bal_b = '0.00';

if ($this->Session->check('shopCurrency')) {
    $shopCurrency = $this->Session->read('shopCurrency');
} else {
    $shopCurrency = "";
}

if (isset($supplier)) {
    $customer_name = $supplier;
} else {
    $customer_name = "[supplier]";
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

<table id="report_content" width="100%" align="left" cellspacing="0" cellpadding="5" border="0">
    <tr>
        <td align="left" colspan="7">
            <div id="clearer">&nbsp;</div>
            <div id="clearer">&nbsp;</div>
            <div class="row">
                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                    <?php echo $this->Html->image('logo.png', array('style' => 'float: left; margin-right: 20px;', 'alt' => $this->Session->read('shopName'))); ?>
                    <p style='font-weight: bold; font-size: 16px; text-align: left;'>
                        SUPPLIERS REPORT <br />
                        from <?php echo $sdate; ?> - <?php echo $edate; ?>
                    </p>
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
    <tr style="background: #eaeaea;" id="dateRow">

        <td align="left" valign="top" colspan="7">

            <?php echo $this->Form->create('Supplierinvoice', array("url" => array('controller' => 'Reports', 'action' => 'suppliers'))); ?>
            <table cellspacing="10" cellpadding="0" width="100%" border="0" style="">

                <tr>
                    <td align="center">
                        <?php echo $this->Form->input('supplier_id', array('empty' => '-----------------All Suppliers---------------', 'label' => false, "id" => "drpSalesPerson")); ?>
                    </td>
                    <td align="center" valign="top">
                        <?php
                        echo $this->Form->input('from', array('label' => 'Start Date*', 'type' => 'date', 'value' => date('DMY'), 'dateFormat' => 'DMY', 'class' => 'form-control', 'div' => array('class' => 'form-inline')));
                        ?>
                    </td>
                    <td align="center" valign="top">
                        <?php
                        echo $this->Form->input('to', array('label' => 'End Date*', 'type' => 'date', 'value' => date('DMY'), 'dateFormat' => 'DMY', 'class' => 'form-control', 'div' => array('class' => 'form-inline')));
                        ?>
                    </td>
                    <td  align="center">
                        <input type="hidden" name="data[Setting][from]" id="dtFrom" />
                        <input type="hidden" name="data[Setting][to]" id="dtTo" />
                    </td>
                    <td  align="right">
                        <?php
                        echo $this->Form->button('View', array("type" => "submit", "class" => "btn btn-md btn-success"));
                        ?>
                    </td>
                </tr>
            </table>
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
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('supply_invoiceno', 'Invoice No.'); ?></th>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('cost_price', 'Items Value'); ?></th>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('amountpaid', 'Amount Paid'); ?></th>
                    <th align="right" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('balance', 'Balance'); ?></th>
                    <th align="right" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('supply_date', 'Supply Date'); ?></th>
                </tr>
                <?php
                if (isset($accounts)) {

                    foreach ($accounts as $each_item):
                        foreach ($saccounts as $seach_item):
                            if ($each_item['WarehouseItem']['supply_invoiceno'] == $seach_item['Supplierinvoice']['supply_invoiceno']) {
                                $inv_date = strtotime($seach_item['Supplierinvoice']['supply_date']);
                                if ($inv_date >= $snewdate && $inv_date <= $enew_date) {


                                    $amount_p = '0.00';
                                    $bal_b = '0.00';
                                    $hello = '';
                                    ?>
                                    <tr>
                                        <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                            if (isset($each_item['WarehouseItem']['supply_invoiceno'])) {
                                                echo $each_item['WarehouseItem']['supply_invoiceno'];
                                            }
                                            ?></td>
                                        <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                            if (isset($each_item[0]['totcost_price'])) {
                                                echo $each_item[0]['totcost_price'];
                                                $total_c += $each_item[0]['totcost_price'];
                                            }
                                            ?></td>
                                        <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                            foreach ($saccounts as $seach_item):
                                                if ($each_item['WarehouseItem']['supply_invoiceno'] == $seach_item['Supplierinvoice']['supply_invoiceno']) {
                                                    if (isset($seach_item['Supplierinvoice']['amountpaid'])) {
                                                        $amount_p = $seach_item['Supplierinvoice']['amountpaid'];
                                                        $total_p += $seach_item['Supplierinvoice']['amountpaid'];
                                                    }
                                                }
                                            endforeach;
                                            echo $amount_p;
                                            ?></td>
                                        <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                            $bal_b = $each_item[0]['totcost_price'];
                                            foreach ($saccounts as $seach_item):
                                                if ($each_item['WarehouseItem']['supply_invoiceno'] == $seach_item['Supplierinvoice']['supply_invoiceno']) {
                                                    if (isset($seach_item['Supplierinvoice']['balance'])) {
                                                        $bal_b = $seach_item['Supplierinvoice']['balance'];
                                                        $hello = 'hello';
                                                        $total_b += $seach_item['Supplierinvoice']['balance'];
                                                    }
                                                }

                                            endforeach;
                                            if (isset($hello) && $hello != 'hello') {
                                                $total_b += $each_item[0]['totcost_price'];
                                            }
                                            echo $bal_b;
                                            ?></td>
                                        <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                            if (isset($each_item['Item']['date_added'])) {
                                                echo $each_item['Item']['date_added'];
                                            }
                                            ?></td>
                                    </tr>
                                    <?php
                                }
                            }
                        endforeach;
                    endforeach;
                }
                ?>

                <tr>
                    <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">Totals</td>
                    <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;"><?php
                        echo $shopCurrency . ' ' . $total_c . '.00';
                        ?></td>
                    <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;"><?php
                        echo $shopCurrency . ' ' . $total_p . '.00';
                        ?></td>
                    <td align="right" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;"><?php
                        echo $shopCurrency . ' ' . $total_b . '.00';
                        ?></td>
                    <td align="right" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                </tr>

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
    <tr>
        <td colspan="7" align="center">
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
