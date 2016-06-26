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
<table cellspacing="10" cellpadding="0" width="100%" border="0" style="background: #eaeaea;">
    <?php echo $this->Form->create('OrdersItem', array("url" => array('controller' => 'Reports', 'action' => 'customerOrderDetails'))); ?>
    <tr>
        <td colspan="4" align="left">&nbsp;</td>
    </tr>
    <tr>

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
        <td align="right">
            <input type="hidden" name="data[Setting][from]" id="dtFrom" />
            <?php
            echo $this->Form->button('View', array("type" => "submit", "class" => "btn btn-md btn-success"));
            ?>
        </td>
    </tr>


    <?php echo $this->Form->end(); ?>
</table>
<div id="clearer"></div>



<table id="report_content" width="100%" align="left" cellspacing="0" cellpadding="5" border="0">

    <tr>
        <td colspan="8" align="left">
            <div class="row">
                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                    <?php echo $this->Html->image('logo.png', array('style' => 'float: left; margin-right: 20px;', 'alt' => $this->Session->read('shopName'))); ?>
                    <p style='font-weight: bold; font-size: 16px; text-align: left;'>CUSTOMER ORDER DETAILS REPORT</p>
                    <p align='left'><?php echo isset($frend_date) ? 'From ' . $sdate . ' to ' . $edate : ''; ?></p>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                    <p align="right"><?php echo $this->Session->read('shopAddress') . ', ' . $this->Session->read('shopPosttown') . '<br />' . $this->Session->read('shopPostCity') . ', ' . $this->Session->read('shopPostCount') . '<br />' . $this->Session->read('shopTelephone') . '<br />' . $this->Session->read('shopEmail'); ?></p>
                </div>
            </div>


            <div id="clearer"></div>
        </td>
    </tr>
<!--        <tr>
        <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php /* echo 'Sale Type'; ?></th>
                      <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('fullname', 'Customer Name'); ?></th>
                      <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('order_date', 'Order Date'); ?></th>
                      <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('item', 'Item'); ?></th>
                      <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('hp_price', 'Total Amount'); ?></th>
                      <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('mthly_install', 'Installment'); ?></th>
                      <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('payment_term', 'Duration'); ?></th>
                      <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('last_date', 'Expected End Date'); */ ?></th>
    </tr>-->
    <tr>
        <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo 'Sale Type'; ?></th>
        <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo 'Customer Name'; ?></th>
        <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo 'Order Date'; ?></th>
        <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo 'Item'; ?></th>
        <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo 'Total Amount'; ?></th>
        <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo 'Installment'; ?></th>
        <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo 'Duration'; ?></th>
        <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo 'Expected End Date'; ?></th>
    </tr>

    <?php
    if (isset($data)) {
        foreach ($data as $each_item):
            ?>
            <tr>
                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    echo 'HIRE PURCHASE';
                    ?></td>
                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    if (isset($each_item['Customer']['fullname'])) {
                        echo $each_item['Customer']['fullname'];
                    }
                    ?></td>
                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    if (isset($each_item['Order']['order_date'])) {
                        echo $each_item['Order']['order_date'];
                    }
                    ?></td>
                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    if (isset($each_item['Item']['item'])) {
                        echo $each_item['Item']['item'];
                    }
                    ?></td>
                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    if (isset($each_item['Order']['hp_price'])) {
                        echo $each_item['Order']['hp_price'];
                    }
                    ?></td>

                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    if (isset($each_item['Order']['mthly_install'])) {
                        echo $each_item['Order']['mthly_install'];
                    }
                    ?></td>

                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    if (isset($each_item['Order']['payment_term'])) {
                        echo $each_item['Order']['payment_term'];
                    }
                    ?></td>
                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    if (isset($each_item['Order']['last_date'])) {
                        echo $each_item['Order']['last_date'];
                    }
                    ?></td>
            </tr>
            <?php
        endforeach;
    }
    ?>

    <?php
    if (isset($sales)) {
        foreach ($sales as $each_item):
            ?>
            <tr>
                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    echo 'CASH SALE';
                    ?></td>
                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    if (isset($each_item['Client']['client_name'])) {
                        echo $each_item['Client']['client_name'];
                    }
                    ?></td>
                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    if (isset($each_item['Sale']['sale_date'])) {
                        $date = strtotime($each_item['Sale']['sale_date']);
                        echo date('Y-m-d', $date);
                    }
                    ?></td>
                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    if (isset($each_item['Item']['item'])) {
                        echo $each_item['Item']['item'];
                    }
                    ?></td>
                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    if (isset($each_item['Sale']['total_cost'])) {
                        echo $each_item['Sale']['total_cost'];
                    }
                    ?></td>

                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">&nbsp;</td>

                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">&nbsp;</td>
                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">&nbsp;</td>
            </tr>
            <?php
        endforeach;
    }
    ?>
    <?php
    if (isset($data_total) && isset($salestotal)) {
        foreach ($data_total as $each_item):
            foreach ($salestotal as $val):
                ?>
                <tr>
                    <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">Total</td>
                    <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                    <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                    <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                    <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">   <?php
                        if (isset($each_item[0]['total_hp']) || isset($val[0]['total_cost'])) {
                            $total_cost = 0;
                            $total_hp = 0;
                            if (isset($val[0]['total_cost'])) {
                                $total_cost = $val[0]['total_cost'];
                            }
                            if (isset($each_item[0]['total_hp'])) {
                                $total_hp = $each_item[0]['total_hp'];
                            }
                            $totstot = $total_hp + $total_cost;
                            echo $shopCurrency . ' ' . number_format($totstot, 2, ".", ",");
                        }
                        ?></td>
                    <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">  <?php
                        if (isset($each_item[0]['total_install'])) {

                            $totinstall = $each_item[0]['total_install'];
                            echo $shopCurrency . ' ' . number_format($totinstall, 2, ".", ",");
                        }
                        ?></td>
                    <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                    <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">
                        &nbsp;
                    </td>
                </tr>
                <?php
            endforeach;
        endforeach;
    }
    ?>
    <tr>
        <td align="right" valign="top" colspan="7">
            <p style="font-style: italic;">Generated on <?php echo date('d-m-Y H:s'); ?></p>
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
