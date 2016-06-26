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
<table cellspacing="10" cellpadding="0" width="100%" border="0" style="background: #eaeaea;">
<?php echo $this->Form->create('Order', array("url" => array('controller' => 'Reports', 'action' => 'summPaymentCollector'))); ?>
    <tr>
        <td colspan="4">
            <div id="clearer">&nbsp;</div>
        </td>
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
        <td align="center" valign="top">
            <input type="hidden" name="data[Setting][from]" id="dtFrom" />
        </td>
        <td align="center" valign="top">
<?php
echo $this->Form->button('View', array("type" => "submit", "class" => "btn btn-md btn-success"));
?>
        </td>
    </tr>
<?php echo $this->Form->end(); ?>
</table>


<table id="report_content" width="100%" align="left" cellspacing="0" cellpadding="5" border="0">
    <tr>
        <td colspan="3" align="left">
            <div id="clearer">&nbsp;</div>
            <div class="row">
                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
<?php echo $this->Html->image('logo.png', array('style' => 'float: left; margin-right: 20px;', 'alt' => $this->Session->read('shopName'))); ?>
                    <p style='font-weight: bold; font-size: 16px; text-align: left;'>SUMMARY PAYMENT REPORT BY COLLECTOR from <?php echo $sdate; ?> - <?php echo $edate; ?></p>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                    <p align="right"><?php echo $this->Session->read('shopAddress') . ', ' . $this->Session->read('shopPosttown') . '<br />' . $this->Session->read('shopPostCity') . ', ' . $this->Session->read('shopPostCount') . '<br />' . $this->Session->read('shopTelephone') . '<br />' . $this->Session->read('shopEmail'); ?></p>
                </div>
            </div>



        </td>
    </tr>
    <tr>
        <td align="left" valign="top" colspan="2">&nbsp;</td>
    </tr>
<!--        <tr>
        <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php //echo $this->Paginator->sort('username', 'Group by');  ?></th>
        <th align="left" valign="top" style="border-bottom: solid 2px Gray;">&nbsp;</th>
        <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php //echo $this->Paginator->sort('amount_paid', 'Actual Collected');  ?></th>
    </tr>
    -->
    <tr>
        <td colspan="3">
            <table class="table table-striped">
                <tr>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo 'Group by'; ?></th>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;">&nbsp;</th>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo 'Actual Collected'; ?></th>
                </tr>

<?php
if (isset($accounts)) {
    foreach ($accounts as $each_item):
        ?>
                        <tr>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                        if (isset($each_item['User']['username'])) {
                            echo $each_item['User']['username'];
                        }
        ?></td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">&nbsp;<?php
////
                                if (isset($each_item[0]['tothp'])) {
                                    //echo round($each_item[0]['tothp'], 0);
                                }
                                ?></td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                if (isset($collectedaccounts)) {

                                    foreach ($collectedaccounts as $value):
                                        if ($value['Payment']['user_id'] == $each_item['Payment']['user_id']) {
                                            echo round($value[0]['paid'], 0);
                                        }
                                    endforeach;
                                }
                                ?></td>
                        </tr>
                    <?php
                    endforeach;
                }
                ?>

                <?php
                if (isset($total)) {
                    $totalcollected = 0;
                    $totalhp = 0;
                    foreach ($total as $each_item):
                        $totalcollected = $each_item[0]['paid'];


                    endforeach;
                    ?>
                    <?php
                    if (isset($totalsales)) {

                        foreach ($totalsales as $each_item):
                            $totalhp = $each_item[0]['tothpprice'];
                        endforeach;
                    }
                    ?>
                    <tr>
                        <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">Total</td>
                        <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;<?php
                            // if (isset($totalhp)) {
                            //echo $shopCurrency . ' ' . round($totalhp, 0);
                            //  }
                            ?></td>
                        <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;"><?php
                        if (isset($totalcollected)) {
                            echo $shopCurrency . ' ' . round($totalcollected, 0);
                        }
                            ?></td>

                    </tr>
    <?php
}
?>
            </table>
        </td>
    </tr>
    <tr>
        <td align="left" valign="top">&nbsp;</td>
        <td align="left" valign="top">&nbsp;</td>
        <td align="right" valign="top">
            <p style="font-style: italic;">Generated on <?php echo date('d-m-Y H:s'); ?></p>
        </td>
    </tr>
    <tr>
        <td align="left" valign="top"></td>
        <td align="right" colspan="2" valign="top">

        </td>
    </tr>
    <tr>
        <td colspan="3" align="center">
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
