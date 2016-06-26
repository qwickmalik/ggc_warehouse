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
        <td align="left" colspan="7">
            <div id="clearer">&nbsp;</div>
            <div id="clearer">&nbsp;</div>
            <div class="row">
                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                    <?php echo $this->Html->image('logo.png', array('style' => 'float: left; margin-right: 20px;', 'alt' => $this->Session->read('shopName'))); ?>
                    <p style='font-weight: bold; font-size: 16px; text-align: left;'>
                        DEBTORS' AGEING REPORT <br />
                        For <?php
                        if (isset($zone_name)) {
                            echo $zone_name;
                        }
                        ?>- <?php
                        if (isset($frend_date)) {
                            echo 'From ' . $frstart_date . ' to ' . $frend_date;
                        }
                        ?>
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

            <?php echo $this->Form->create('Order', array('enctype' => 'multipart/form-data', "url" => array('controller' => 'Reports', 'action' => 'debtorsAgeing'), "inputDefaults" => array('div' => false))); ?>  
            <table cellspacing="10" cellpadding="0" width="100%" border="0" style="">

                <tr>
                    <td align="center">
                        <?php echo $this->Form->input('zone_id', array('label' => 'Zone*', 'empty' => '--ALL ZONES--', 'class' => 'form-control', 'div' => array('class' => 'form-inline'))); ?>
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
        <td align="left" valign="top" colspan="7">&nbsp;</td>
    </tr>

    <tr>
        <td colspan="7">
            <table class="table table-striped">
                <tr>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('fullname', 'Customer Name'); ?></th>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('mobile_no', 'Contact No.'); ?></th>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('work_place', 'Institution'); ?></th>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('age', 'Age[Days]'); ?></th>
                    <th align="center" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('hp_price', 'Debt Due'); ?></th>


                    <th align="right" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('balance', 'Expected Amt.'); ?></th>
                </tr>
                <?php
                if (isset($accounts)) {
                    foreach ($accounts as $each_item):
                        ?>
                        <tr>

                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                if (isset($each_item['Customer']['fullname'])) {
                                    echo $each_item['Customer']['fullname'];
                                }
                                ?></td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                if (isset($each_item['Customer']['mobile_no'])) {
                                    echo $each_item['Customer']['mobile_no'];
                                }
                                ?></td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                if (isset($each_item['Customer']['work_place'])) {
                                    echo $each_item['Customer']['work_place'];
                                }
                                ?></td>

                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                if (isset($each_item[0]['age'])) {
                                    echo $each_item[0]['age'];
                                }
                                ?></td>
                            <td align="center" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                if (isset($each_item[0]['dbt_due'])) {
                                    echo round($each_item['0']['dbt_due'], 0);
                                }
                                ?></td>


                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                if (isset($each_item[0]['balance'])) {
                                    echo round($each_item[0]['balance'], 0);
                                }
                                ?></td>
                        </tr>
                        <?php
                    endforeach;
                }
                ?>
                <?php
                if (isset($total)) {
                    foreach ($total as $each_item):
                        ?>
                        <tr>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">Total</td>



                            <td align="right" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>

                            <td align="right" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>

                            <td align="center" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;"><?php
                                if (isset($each_item[0]['totdbt_due'])) {
                                    echo $shopCurrency . ' ' . round($each_item[0]['totdbt_due'], 2);
                                }
                                ?></td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;"><?php
                                if (isset($each_item[0]['totbalance'])) {
                                    echo $shopCurrency . ' ' . round($each_item[0]['totbalance'], 2);
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
            <?php ?>
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
