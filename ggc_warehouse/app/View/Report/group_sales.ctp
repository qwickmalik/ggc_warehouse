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
<table class="table">
    <?php echo $this->Form->create('Order', array("url" => array('controller' => 'Reports', 'action' => 'groupSales'))); ?>
    <tr>
        <td align="left">&nbsp;</td>
        <td align="left">&nbsp;</td>
        <td align="left">&nbsp;</td>
        <td align="right">&nbsp;</td>
        <td align="left">&nbsp;</td>
    </tr>
    <tr style="background: #eaeaea;">

        <td align="right" valign="top">
            <?php
            echo $this->Form->input('user_id', array('default' => 1, 'empty' => 'All Attendants', 'label' => 'Attendants', 'class' => 'form-control', 'div' => array('class' => 'form-inline')));
            ?>
        </td>
        <td align="right" valign="top">
            <?php
//            echo $this->Form->month('month', array('empty' => '--Select Month--')); 

            echo $this->Form->input('month', array('label' => false, 'type' => 'date', 'value' => date('M'), 'dateFormat' => 'M', 'class' => 'form-control', 'div' => array('class' => 'form-inline')));
            ?>

        </td>
        <td align="left" valign="top">

            <?php
//            echo $this->Form->year('year', 2000, date('Y'), array( "style" => "margin-right: 10px;", 'empty' => '--Year--')); 

            echo $this->Form->input('year', array('label' => false, 'type' => 'date', 'value' => date('Y'), 'dateFormat' => 'Y', 'class' => 'form-control', 'div' => array('class' => 'form-inline')));
            ?>
        </td>
        <td >
            <input type="hidden" name="data[Setting][from]" id="dtFrom" />
        </td>
        <td align="left" valign="top">
            <?php
            echo $this->Form->button('View', array("type" => "submit", "class" => "btn btn-md btn-success"));
            ?>
        </td>
    </tr>
    
    <?php echo $this->Form->end(); ?>
</table>
<table id="report_content" width="100%" align="left" cellspacing="0" cellpadding="5" border="0">
     <tr>
         <td align="left" colspan="5">&nbsp;</td>
     </tr>
    <tr>
        <td align="left" colspan="5">

            <div class="row">
                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                    <?php echo $this->Html->image('logo.png', array('style' => 'float: left; margin-right: 20px;', 'alt' => $this->Session->read('shopName'))); ?>
                    <p style='font-weight: bold; font-size: 16px; text-align: left;'>
                        GROUP SALES REPORT by  <?php
                        if (isset($sales_name)) {
                            echo $sales_name;
                        }
                        ?> - for <?php
                        if (isset($date)) {
                            echo $date;
                        }
                        ?></p>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                    <p align="right"><?php echo $this->Session->read('shopAddress') . ', ' . $this->Session->read('shopPosttown') . '<br />' . $this->Session->read('shopPostCity') . ', ' . $this->Session->read('shopPostCount') . '<br />' . $this->Session->read('shopTelephone') . '<br />' . $this->Session->read('shopEmail'); ?></p>
                </div>
            </div>
        </td>
    </tr>
    <div id="clearer"></div>


    <tr>
        <td colspan="5">
            <table class="table table-striped">
<!--                <tr>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php /*echo $this->Paginator->sort('due_date', 'Due Date'); ?></th>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('fullname', 'Customer'); ?></th>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('work_place', 'Institution'); ?></th>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('selling_price', 'Cash Price'); */?></th>
                </tr>-->
                <?php  if(!empty($groupsales)){
                    ?>
                
                <tr>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php  ?></th>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo 'Attendant'; ?></th>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo 'Zone'; ?></th>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo 'Total Sales'; ?></th>
                </tr>

  <?php
                    
                }else{
                ?>
                 <tr>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo 'Due Date'; ?></th>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo 'Customer'; ?></th>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo 'Institution'; ?></th>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo 'Cash Price'; ?></th>
                </tr>
                <?php
                }
                if (!empty($accounts)) {
                    foreach ($accounts as $each_item):
                        ?> 
                        <tr>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                if (isset($each_item['Order']['due_date'])) {
                                    echo $each_item['Order']['due_date'];
                                }
                                ?></td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                if (isset($each_item['Customer']['fullname'])) {
                                    echo $each_item['Customer']['fullname'];
                                }
                                ?></td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                if (isset($each_item['Customer']['work_place'])) {
                                    echo $each_item['Customer']['work_place'];
                                }
                                ?></td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                if (isset($each_item['Item']['selling_price'])) {
                                    $totalcash = $each_item['OrdersItem']['quantity'] * $each_item['Item']['selling_price'];

                                    echo round($totalcash, 0);
                                }
                                ?></td>
                        </tr>
                        <?php
                    endforeach;
                }
                ?>
                        <?php
                if (!empty($sales)) {
                    foreach ($sales as $each_item):
                        ?> 
                        <tr>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                if (isset($each_item['Sale']['sale_date'])) {
                                    echo $each_item['Sale']['sale_date'];
                                }
                                ?></td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                if (isset($each_item['Customer']['fullname'])) {
                                    echo $each_item['Customer']['fullname'];
                                }
                                ?></td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                if (isset($each_item['Customer']['work_place'])) {
                                    echo $each_item['Customer']['work_place'];
                                }
                                ?></td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                if (isset($each_item['SalesItem']['unit_price'])) {
                                    $totalcash = $each_item['SalesItem']['quantity'] * $each_item['SalesItem']['unit_price'];

                                    echo number_format($totalcash, 2,'.',',');
                                }
                                ?></td>
                        </tr>
                        <?php
                    endforeach;
                }elseif(!empty($groupsales)){
                       foreach ($groupsales as $each_item):
                        ?> 
                        <tr>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                
                                ?></td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                if (isset($each_item['User']['firstname'])) {
                                    echo $each_item['User']['firstname'].' '.$each_item['User']['lastname'];
                                }
                                ?></td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                if (isset($each_item['User']['zone_id'])) {
                                    echo $zones[$each_item['User']['zone_id']];
                                }
                                ?></td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                if (isset($each_item[0]['paidtotal'])) {
                                    $total = $each_item[0]['paidtotal'];
                                    echo $shopCurrency . ' ' . number_format($total, 2,'.',',');
                                }
                                ?></td>
                        </tr>
                        <?php
                    endforeach;
                }
                ?>
                <?php
//                if (!empty($total) && !empty($salestotal)) {
//                    foreach ($total as $each_item):
//                        foreach ($salestotal as $val):
                        ?>
<!--                        <tr>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">Total</td>

                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;"><?php
//                                if (isset($each_item[0]['paidtotal']) && isset($val[0]['paidtotal'])) {
//                                    $total = $each_item[0]['paidtotal'] + $val[0]['paidtotal'];
//                                    echo $shopCurrency . ' ' . number_format($total, 2,'.',',');
//                                }
                                ?></td>

                        </tr>-->
                        <?php
//                    endforeach;
//                     endforeach;
//                }elseif(!empty($total)){
//                    foreach ($total as $each_item):
                        ?>
<!--                        <tr>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">Total</td>

                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;"><?php
//                                if (isset($each_item[0]['paidtotal'])) {
//                                    $total = $each_item[0]['paidtotal'];
//                                    echo $shopCurrency . ' ' . number_format($total, 2,'.',',');
//                                }
                                ?></td>

                        </tr>-->
                        <?php
//                    endforeach;
                  
                if(!empty($salestotal)){
                      foreach ($salestotal as $val):
                        ?>
                        <tr>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">Total</td>

                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;"><?php
                                if (isset($val[0]['paidtotal'])) {
                                    $total = $val[0]['paidtotal'];
                                    echo $shopCurrency . ' ' . number_format($total, 2,'.',',');
                                }
                                ?></td>

                        </tr>
                        <?php
                    endforeach;
                }
                ?>
                <tr>
                    <td align="left" valign="top">&nbsp;</td>
                    <td align="left" valign="top">&nbsp;</td>
                    <td align="left" valign="top">&nbsp;</td>

                    <td align="right" valign="top">
                        <p style="font-style: italic;">Generated on <?php echo date('d-m-Y'); ?></p>
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top"></td>
                    <td align="left" valign="top"></td>
                    <td align="left" valign="top"></td>
                    <td align="left" valign="top">
                        <?php
//                        echo $this->Html->link('Print', "javascript:void(0)", array("class" => 'button_red', "id" => "print_report"));
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
