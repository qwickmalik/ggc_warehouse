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
        <td colspan="6" align="left">
            <div id="clearer">&nbsp;</div>
            <div id="clearer">&nbsp;</div>
            <div class="row">
                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                    <?php echo $this->Html->image('logo.png', array('style' => 'float: left; margin-right: 20px;', 'alt' => $this->Session->read('shopName'))); ?>
                    <p style='font-weight: bold; font-size: 16px; text-align: left;'>SUMMARY ZONAL PERFORMANCE REPORT <br /> from <?php echo $sdate; ?> - <?php echo $edate; ?></p>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                    <p align="right"><?php echo $this->Session->read('shopAddress') . ', ' . $this->Session->read('shopPosttown') . '<br />' . $this->Session->read('shopPostCity') . ', ' . $this->Session->read('shopPostCount') . '<br />' . $this->Session->read('shopTelephone') . '<br />' . $this->Session->read('shopEmail'); ?></p>
                </div>
            </div>
        </td>
    </tr>
    <tr style="background: #eaeaea;" id="dateRow">

        <td align="left" valign="top" colspan="6">

            <?php echo $this->Form->create('Order', array("url" => array('controller' => 'Reports', 'action' => 'summZonal'))); ?>
            <table cellspacing="10" cellpadding="0" width="100%" border="0" style="">

                <tr>
                    <td align="center">
                        <?php //echo $this->Form->input('zone_id', array('label' => 'Zone*', 'default' => 1, 'style' => 'width: 100px;')); ?>
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
        <td align="left" valign="top" colspan="6">&nbsp;</td>
    </tr>
    <tr>
        <th align="left" valign="top" style="border-bottom: solid 2px Gray;">Zone</th>
<!--            <th align="left" valign="top" style="border-bottom: solid 2px Gray;">&nbsp;</th>
        <th align="left" valign="top" style="border-bottom: solid 2px Gray;">&nbsp;</th>-->
<!--            <th align="right" valign="top" style="border-bottom: solid 2px Gray;">&nbsp;</th>-->
        <th align="right" valign="top" style="border-bottom: solid 2px Gray;">&nbsp;</th>
        <th align="right" valign="top" style="border-bottom: solid 2px Gray;">Actual Collected</th>
    </tr>
    <?php
    if (isset($accounts)) {
        foreach ($accounts as $each_item):
            ?>
            <tr>
                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    if (isset($each_item['Zone']['zone'])) {

                        echo $each_item['Zone']['zone'];
                    }
                    ?></td>
        <!--            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">&nbsp;<?php
                /*  if (isset($each_item[0]['expected_sales'])) {
                  echo $each_item[0]['expected_sales'];
                  } */
                ?></td>
                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">&nbsp;<?php
                ?></td>-->
        <!--          <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;">&nbsp;
                <?php
                /* if (isset($each_item['Rate']['payment_name'])) {
                  echo $each_item['Rate']['payment_name'];
                  } */
                ?></td>-->
                <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;">&nbsp;<?php
                    /* if (isset($each_item['Order']['last_date'])) {
                      echo $each_item['Order']['last_date'];
                      } */
                    ?></td>
                <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;">&nbsp;<?php
                    /* if (isset($each_item['Order']['balance'])) {
                      echo round($each_item['Order']['balance'], 2);
                      } */
                    if (isset($collectedaccounts)) {

                        foreach ($collectedaccounts as $value):
                            if ($value['Payment']['zone_id'] == $each_item['Payment']['zone_id']) {
                                echo round($value[0]['paid'], 0);
                            }
                        endforeach;
                    }
                    ?>

                </td>
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
    <!--            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;
        </td>-->
    <!--            <td align="right" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>-->
            <td align="right" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
            <td align="right" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;"><?php
                if (isset($totalcollected)) {
                    echo $shopCurrency . ' ' . round($totalcollected, 0);
                }
                ?></td>
        </tr>
        <?php
    }
    ?>
    <tr>
        <td align="right" valign="top" colspan="6">
            <p style="font-style: italic;">Generated on <?php echo date('d-m-Y H:s'); ?></p>
        </td>
    </tr>
    <tr>
        <td align="right" valign="top" colspan="6">

        </td>
    </tr>
    <tr>
        <td colspan="6" align="center">
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
