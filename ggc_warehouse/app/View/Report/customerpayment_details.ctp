<?php
echo $this->element('header');
if ($this->Session->check('shopCurrency')) {
    $shopCurrency = $this->Session->read('shopCurrency');
} else {
    $shopCurrency = "";
}
?>

<!-- Content starts here -->
<h2 style="font-size: 20px" >Payments For Order No.: <?php
    if (isset($order_id)) {
        echo $order_id;
    }
    ?> <br />By: <?php
    if (isset($custname)) {
        echo $custname;
    }
    ?> </h2>

<div id="clearer"></div>

<div id="report_content" style="font-size: 95%">        
    <form id="order_list" action="#" method="post">
        <div class="row">
            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                <?php echo $this->Html->image('logo.png', array('style' => 'float: left; margin-right: 20px;', 'alt' => $this->Session->read('shopName'))); ?>
                <p style='font-weight: bold; font-size: 16px; text-align: left;'><?php // echo $setup_results['Setting']['company_name'];     ?>CUSTOMER PAYMENT DETAILS</p>
                
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                <p align="right"><?php echo $this->Session->read('shopAddress') . ', ' . $this->Session->read('shopPosttown') . '<br />' . $this->Session->read('shopPostCity') . ', ' . $this->Session->read('shopPostCount') . '<br />' . $this->Session->read('shopTelephone') . '<br />' . $this->Session->read('shopEmail'); ?></p>
            </div>
        </div>
        <table class="table table-striped">
<!--            <tr>
                <td style="border-bottom: solid 2px dodgerblue;" align="left">
                    <b><?php // echo $this->Paginator->sort('id', 'ID');  ?></b>
                </td>
                <td style="border-bottom: solid 2px dodgerblue" align="left">
                    <b><?php // echo $this->Paginator->sort('due_date', 'Due Date');  ?></b>
                </td>
                <td style="border-bottom: solid 2px dodgerblue" align="left">
                    <b><?php // echo $this->Paginator->sort('expected_installment', 'Expected Amount');  ?></b>
                </td>
                <td style="border-bottom: solid 2px dodgerblue" align="left">
                    <b><?php // echo $this->Paginator->sort('paid_install', 'Paid');  ?></b>
                </td>

                <td style="border-bottom: solid 2px dodgerblue" align="left">
                    <b><?php // echo $this->Paginator->sort('balance', 'Balance');  ?></b>

                </td>
            </tr>-->
            <tr>
                <td style="border-bottom: solid 2px dodgerblue;" align="left">
                    <b>ID</b>
                </td>
                <td style="border-bottom: solid 2px dodgerblue" align="left">
                    <b>Due Date</b>
                </td>
                <td style="border-bottom: solid 2px dodgerblue" align="left">
                    <b>Expected Amount</b>
                </td>
                <td style="border-bottom: solid 2px dodgerblue" align="left">
                    <b>Paid</b>
                </td>

                <td style="border-bottom: solid 2px dodgerblue" align="left">
                    <b>Balance</b>

                </td>
            </tr>
            <?php
            $n = count($data);
            $j = $n + 1;
            $i = 1;
            foreach ($data as $each_item):
//                                if($each_item['Payment']['id'] != null && $each_item['Payment']['id'] != ""){
                ?>

                <tr>
                    <td align="left">
                        <?php echo $each_item['Expectedinstallment']['id']; ?>
                    </td>

                    <td align="left" class="orderAnchor">
                        <?php
//                                $k = $i+1;
//                                if($k == $j){
//                                    
                        echo $each_item['Expectedinstallment']['due_date'];

//                                         }else{
//                                                 echo $each_item['Expectedinstallment']['due_date'];
//                                         }
//                                     
//                                    $i++;
                        ?>
                    </td> <!-- Link to enable editing -->


                    <td align="left">
                        <?php echo $each_item['Expectedinstallment']['expected_installment']; ?>
                    </td>
                    <td align="left">
                        <?php echo $each_item['Expectedinstallment']['paid_install']; ?>
                    </td>

                    <td align="left">
                        <?php echo $each_item['Expectedinstallment']['balance']; ?>
                    </td>

                <!--                                <td align="left">
                    <?php //echo $each_item['Expectedinstallment']['payment_status'];  ?>
                </td>-->
                <!--                                <td width="20" align="left">
                    <input type="button" name="<?php
//                                    echo $each_item['Order']['order_id']; 
                    ?>" class="tax_del"/>
                </td>-->
                </tr>
                <?php
                //}
            endforeach;
            ?>
            <tr>
                <td  colspan="5" align="right">&nbsp;</td>
            </tr>

            <?php
// if (isset($total)) {
//foreach ($total as $each_item):
            ?>
            <tr>
                <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">Totals</td>
                <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>

                <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;"><?php
                    if (isset($amount)) {
                        echo 'Amount Paid: ' . $shopCurrency . ' ' . round($amount, 0);
                    }
                    ?></td>
                <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;"><?php
                    if (isset($balance)) {
                        echo 'Outstanding Balance: ' . $shopCurrency . ' ' . round($balance, 0);
                    }
                    ?></td>

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
                    echo $this->Paginator->counter(array('format' => 'Page %page%, showing %current% items'));
                    ?>
                </td>
            </tr>
        </table>
    </form>
</div>
<?php
echo $this->Html->link('Print', "javascript:void(0)", array("class" => 'btn btn-md btn-danger', "id" => "print_report", 'style' => 'float: right;'));
//echo $this->Form->button('Delete',array("type" => "#","class" => "button_red"));           //check the parameters here             
?>&nbsp;&nbsp;
<?php
echo $this->Html->link('Back', "/Reports/customerpaymentDetails1/" . (isset($order_id) ? $order_id : '' ), array("class" => 'btn btn-md btn-info', 'style' => 'float: right;'));
?>

</div>
<!-- Content ends here -->

<!-- Sidebar starts here -->
<div id="sidebar_reports">
    <?php
    echo $this->element('logo');
    echo $this->element('reports_sidebar'); //Mini Dashboard
    ?>
</div>
<!-- Sidebar starts here -->
<!-- Footer starts here -->
<?php echo $this->element('footer'); ?>
<!-- Footer starts here -->
