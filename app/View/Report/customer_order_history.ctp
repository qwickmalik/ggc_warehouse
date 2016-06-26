<?php
echo $this->element('header_report');
echo $this->Html->script('notification.js');

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
<div id="content">
    <table id="report_content" width="100%" align="left" cellspacing="0" cellpadding="5" border="0">
        <tr>
            <td colspan="7" align="left">
                <table width="100%" align="left" cellspacing="0" cellpadding="5" border="0">
                    <tr>
                        <td align="left" valign="top" width="100"><?php echo $this->Html->image('logo.png', array('style' => 'margin-top: 30px;')); ?></td>
                        <td align="left" >
                            <h2>ULTIMATE CREDIT SOLUTIONS LTD</h2>
                            <h3>Sales Executive Sales Report for <?php echo $customer_name; ?> from <?php echo $sdate; ?> - <?php echo $edate; ?></h3>
                        </td>
                    </tr>
                </table>
                <table cellspacing="10" cellpadding="0" width="100%" border="0" style="background: #fafad2;">
                    <?php echo $this->Form->create('OrdersItem', array("url" => array('controller' => 'Reports', 'action' => 'customerOrderHistory'))); ?>
                    <tr>
                        <td align="center"><b>Name</b></td>
                        
                        <td align="center"><b>Start Date</b></td>
                        <td align="center"><b>End Date</b></td>
                    </tr>
                    <tr>
                            <td align="center">
                            <?php echo $this->Form->input('customer_id', array('default' => 1, 'label' => false, 'style' => 'width: 90px;','empty' => '(All Customers)')); ?>
                        </td>
<!--                        <td align="center">
                            <?php
                           // echo $this->Form->input('user_id', array('empty' => '(Choose Salesperson)', 'label' => false, "id" => "drpSalesPerson"));
                            ?>
                        </td>-->
                        <td align="center" valign="top">
                            <?php
                            echo $this->Form->input('begin_date', array('type' => 'date', 'dateFormat' => 'DMY', 'label' => false));
                            ?>
                        </td>
                        <td align="center" valign="top">
                            <?php
                            echo $this->Form->input('finish_date', array('type' => 'date', 'dateFormat' => 'DMY', 'label' => false));
                            ?>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">&nbsp;</td>
                        <td align="right" colspan="2"></td>
                        <td>
                            <input type="hidden" name="data[Setting][from]" id="dtFrom" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">&nbsp;</td>
                        <td align="right">
                            <?php
                            echo $this->Form->button('View', array("type" => "submit", "class" => "button_green"));
                            ?>
                        </td>
                    </tr>

<?php echo $this->Form->end(); ?>
                </table>
            </td>
        </tr>
        <tr>
            <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('fullname', 'Customer Name'); ?></th>
            
            <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('order_date', 'Order Date'); ?></th>
            
            <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('item', 'Item'); ?></th>
            <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('hp_price', 'Total Amount'); ?></th>
            <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('amount_paid', 'Amt. Paid'); ?></th>
     
            <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('balance', 'Balance'); ?></th>
            
            <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('last_date', 'Expected End Date'); ?></th>
        </tr>

<?php if (isset($accounts)) {
    foreach ($accounts as $each_item):
        ?>
                <tr>
               
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
                if (isset($each_item['Order']['amount_paid'])) {
                    echo $each_item['Order']['amount_paid'];
                }
        ?></td>
                    
                    <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                if (isset($each_item['Order']['balance'])) {
                    echo $each_item['Order']['balance'];
                }
        ?></td>
                    <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                if (isset($each_item['Order']['last_date'])) {
                    echo $each_item['Order']['last_date'];
                }
        ?></td>
                </tr>
                    <?php endforeach;
                }
                ?>
                
        <?php if (isset($total) && isset($salestotal)) {
            foreach ($total as $each_item):
                foreach($salestotal as $val):
                ?>
                <tr>
                    <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">Total</td>
                    <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                    <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">
                    <?php
                if (isset($each_item[0]['total'])) {
                    
                $totstot = $each_item[0]['total'] + $val[0]['stotal'];
                    echo $totstot;
                }
                ?>
                    </td>
                </tr>
                    <?php 
                    endforeach;
                    endforeach;
                } ?>
        <tr>
            <td align="right" valign="top" colspan="7">
                <p style="font-style: italic;">Accessed on <?php echo date('d-m-Y'); ?></p>
            </td>
        </tr>
        <tr>
            <td align="right" valign="top" colspan="7">
<?php
echo $this->Html->link('Print', "javascript:void(0)", array("class" => 'button_red', "id" => "print_report"));
?>
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
