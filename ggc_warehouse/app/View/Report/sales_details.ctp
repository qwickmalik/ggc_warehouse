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
        <td colspan="10" align="left">
            <div id="clearer">&nbsp;</div>
            <div id="clearer">&nbsp;</div>
            <div class="row">
                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                    <?php echo $this->Html->image('logo.png', array('style' => 'float: left; margin-right: 20px;', 'alt' => $this->Session->read('shopName'))); ?>
                    <p style='font-weight: bold; font-size: 16px; text-align: left;'>SALES DETAILS REPORT <br /> from <?php echo $sdate; ?> - <?php echo $edate; ?></p>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                    <p align="right"><?php echo $this->Session->read('shopAddress') . ', ' . $this->Session->read('shopPosttown') . '<br />' . $this->Session->read('shopPostCity') . ', ' . $this->Session->read('shopPostCount') . '<br />' . $this->Session->read('shopTelephone') . '<br />' . $this->Session->read('shopEmail'); ?></p>
                </div>
            </div>
            
        </td>
    </tr>
    <tr style="background: #eaeaea;" id="dateRow">

        <td align="left" valign="top" colspan="10">

            <?php echo $this->Form->create('OrdersItem', array("url" => array('controller' => 'Reports', 'action' => 'salesDetails'))); ?> 
            <table cellspacing="10" cellpadding="0" width="100%" border="0" style="">

                <tr>
                    <td align="center">
                        
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
                    <td  align="center">
                        <input type="hidden" name="data[Setting][from]" id="dtFrom" />
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
        <td align="left" valign="top" colspan="10">&nbsp;</td>
    </tr>
    <tr>
        <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('invoice_no', 'Invoice No.'); ?></th>
        <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('item', 'Item'); ?></th>
        <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('fullname', 'Customer'); ?></th>
        <th align="right" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('quantity', 'Qty'); ?></th>
        <th align="right" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('cost_price', 'Cost Price'); ?></th>
        <th align="right" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('selling_price', 'Selling Price'); ?></th>
        <!--<th align="right" valign="top" style="border-bottom: solid 2px Gray;"><?php //echo $this->Paginator->sort('total_cost', 'Total Selling Price');   ?></th>-->
        <th align="right" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('hp_price', 'HP Amount'); ?></th>
        <th align="right" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('profit', 'Profit'); ?></th>
        <th align="right" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('order_date', 'Date Sold'); ?></th>
    </tr>
    <?php
    if (isset($accounts)) {
        foreach ($accounts as $each_item):
            ?>
            <tr>
                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    if (isset($each_item['Order']['invoice_no'])) {
                        echo $each_item['Order']['invoice_no'];
                    }
                    ?></td>
                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    if (isset($each_item['Item']['item'])) {
                        echo $each_item['Item']['item'];
                    }
                    ?></td>
                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    if (isset($each_item['Customer']['fullname'])) {
                        echo $each_item['Customer']['fullname'];
                    }
                    ?></td>
                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    if (isset($each_item['OrdersItem']['quantity'])) {
                        echo $each_item['OrdersItem']['quantity'];
                    }
                    ?></td>
                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    if (isset($each_item['OrdersItem']['cost_price'])) {
                        echo round($each_item['OrdersItem']['cost_price'], 2);
                    }
                    ?></td>
                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    if (isset($each_item['Item']['selling_price'])) {
                        echo round($each_item['Item']['selling_price'], 2);
                    }
                    ?></td>
        <!--                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
//        if (isset($each_item[0]['total_tcost'])) {
//            echo round($each_item[0]['total_tcost'], 2);
//        }
                ?></td>-->
                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    if (isset($each_item['OrdersItem']['hp_price'])) {
                        echo round($each_item['OrdersItem']['hp_price'], 2);
                    }
                    ?></td>
                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    if (isset($each_item['OrdersItem']['profit'])) {
                        echo round($each_item['OrdersItem']['profit'], 2);
                    }
                    ?></td>
                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    if (isset($each_item['Order']['order_date'])) {
                        $date = strtotime($each_item['Order']['order_date']);
                        echo date('d-M-Y', $date);
                    }
                    ?></td>
            </tr>
            <?php
        endforeach;
    }
    ?>
    <?php
    if (isset($saccounts)) {
        foreach ($saccounts as $each_item):
            ?>
            <tr>
                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    if (isset($each_item['Sale']['id'])) {
                        echo $each_item['Sale']['id'];
                    }
                    ?></td>
                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    if (isset($each_item['Item']['item'])) {
                        echo $each_item['Item']['item'];
                    }
                    ?></td>
                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    if (isset($each_item['Customer']['fullname'])) {
                        echo $each_item['Customer']['fullname'];
                    }
                    ?></td>
                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    if (isset($each_item['SalesItem']['quantity'])) {
                        echo $each_item['SalesItem']['quantity'];
                    }
                    ?></td>
                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    if (isset($each_item['Item']['cost_price'])) {
                        echo round($each_item['Item']['cost_price'], 2);
                    }
                    ?></td>
                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    if (isset($each_item['SalesItem']['unit_price'])) {
                        echo round($each_item['SalesItem']['unit_price'], 2);
                    }
                    ?></td>
        <!--                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
//        if (isset($each_item[0]['total_tcost'])) {
//            echo round($each_item[0]['total_tcost'], 2);
//        }
                ?></td>-->
                <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
//        if (isset($each_item['SalesItem']['unit_price'])) {
//            echo round($each_item['SalesItem']['unit_price'], 2);
//        }
                    ?></td>
                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    if (isset($each_item[0]['sale_profit'])) {
                        echo round($each_item[0]['sale_profit'], 2);
                    }
                    ?></td>
                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    if (isset($each_item['Sale']['sale_date'])) {
                        $date = strtotime($each_item['Sale']['sale_date']);
                        echo date('d-M-Y', $date);
                    }
                    ?></td>
            </tr>
            <?php
        endforeach;
    }
    ?>
    <?php
    if (isset($total)) {
        $total_qty = 0;
        $total_cp_price = 0;
        $total_sp_price = 0;
        $total_hp_price = 0;
        $total_profit = 0;
        foreach ($total as $each_item):
            ?>
        <!--                        <tr>
                <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">Totals</td>
                <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                <td align="right" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;"><?php
            if (isset($each_item[0]['total_qty'])) {
                $total_qty += $each_item[0]['total_qty'];
            }
            ?></td>
                <td align="right" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;    <?php
            if (isset($each_item[0]['total_cp_price'])) {
                $total_cp_price += round($each_item[0]['total_cp_price'], 2);
            }
            ?></td>
                <td align="right" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;
            <?php
            if (isset($each_item[0]['total_sp_price'])) {
                $total_sp_price += round($each_item[0]['total_sp_price'], 2);
            }
            ?>
                </td>
                <td align="right" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;"><?php
//                if (isset($each_item[0]['total_tcost'])) {
//                    echo $shopCurrency . ' ' . round($each_item[0]['total_tcost'], 2);
//                }
            ?></td>
                <td align="right" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;"><?php
            if (isset($each_item[0]['total_hp_price'])) {
                $total_hp_price += round($each_item[0]['total_hp_price'], 2);
            }
            ?></td>
                <td align="right" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;"><?php
            if (isset($each_item[0]['total_profit'])) {
                $total_profit += round($each_item[0]['total_profit'], 2);
            }
            ?></td>
                <td align="right" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
            </tr>-->

            <?php
        endforeach;
    }
    ?>
    <?php
    if (isset($stotal)) {
        $stotal_qty = 0;
        $stotal_cp_price = 0;
        $stotal_sp_price = 0;
        $stotal_hp_price = 0;
        $stotal_profit = 0;
        foreach ($stotal as $each_item):
            ?>
                <!--<tr>-->
                    <!--<td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">Totals</td>-->
                    <!--<td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>-->
                    <!--<td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>-->
                <!--                            <td align="right" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;"><?php
            if (isset($each_item[0]['total_qty'])) {
                $stotal_qty += $each_item[0]['total_qty'];
            }
//                
            ?></td>-->
                <!--                            <td align="right" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;    <?php
            if (isset($each_item[0]['total_cp_price'])) {
                $stotal_cp_price += round($each_item[0]['total_cp_price'], 2);
            }
            ?></td>-->
                <!--                            <td align="right" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;
            <?php
            if (isset($each_item[0]['total_sp_price'])) {
                $stotal_sp_price += round($each_item[0]['total_sp_price'], 2);
            }
            ?>
                    </td>-->
                <!--                            <td align="right" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;"><?php
//                if (isset($each_item[0]['total_tcost'])) {
//                    echo $shopCurrency . ' ' . round($each_item[0]['total_tcost'], 2);
//                }
            ?></td>-->
                <!--                            <td align="right" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;"><?php
            if (isset($each_item[0]['total_hp_price'])) {
//                    $stotal_hp_price += round($each_item[0]['total_hp_price'], 2);
            }
            ?></td>-->
                <!--                            <td align="right" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;"><?php
            if (isset($each_item[0]['total_profit'])) {
                $stotal_profit += round($each_item[0]['total_profit'], 2);
            }
            ?></td>-->
                    <!--<td align="right" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>-->
            <!--</tr>-->

            <?php
        endforeach;
    }
    ?>
    <?php
    if (isset($total)) {

        foreach ($total as $each_item):
            ?>
            <tr>
                <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">Totals</td>
                <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;"><?php
                    if (isset($total_qty) && isset($stotal_qty)) {
                        $tot_quantity = $total_qty + $stotal_qty;
                        echo $shopCurrency . ' ' . round($tot_quantity, 2);
                    }
                    ?></td>
                <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;    <?php
                    if (isset($total_cp_price) && isset($stotal_cp_price)) {
                        $tot_cost = $total_cp_price + $stotal_cp_price;
                        echo $shopCurrency . ' ' . round($tot_cost, 2);
                    }
                    ?></td>
                <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;
                    <?php
                    if (isset($total_sp_price) && isset($stotal_sp_price)) {
                        $tot_sp = $total_sp_price + $stotal_sp_price;
                        echo $shopCurrency . ' ' . round($tot_sp, 2);
                    }
                    ?>
                </td>
        <!--                            <td align="right" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;"><?php
//                if (isset($each_item[0]['total_tcost'])) {
//                    echo $shopCurrency . ' ' . round($each_item[0]['total_tcost'], 2);
//                }
                ?></td>-->
                <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;"><?php
                    if (isset($total_hp_price)) {
                        echo $shopCurrency . ' ' . round($total_hp_price, 2);
                    }
                    ?></td>
                <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;"><?php
                    if(isset($total_profit) && isset($stotal_profit)){
                        $tot_profit = $total_profit + $stotal_profit;
                        echo $shopCurrency . ' ' . round($tot_profit, 2);
                    }
                    ?></td>
                <td align="right" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
            </tr>

            <?php
        endforeach;
    }
    ?>
    <tr>
        <td align="right" valign="top" colspan="10">
            <p style="font-style: italic;">Generated on <?php echo date('d-m-Y H:s'); ?></p>
        </td>
    </tr>
    <tr>
        <td align="right" valign="top" colspan="10">

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
