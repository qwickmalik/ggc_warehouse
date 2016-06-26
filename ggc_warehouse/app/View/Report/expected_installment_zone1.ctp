<?php
echo $this->element('header');
echo $this->Html->script('jquery.js');
echo $this->Html->script('jquery.printElement.js');
echo $this->Html->script('print.js');

$num = 0;
if ($this->Session->check('shopCurrency')) {
    $shopCurrency = $this->Session->read('shopCurrency');
} else {
    $shopCurrency = "";
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
                    <p style='font-weight: bold; font-size: 16px; text-align: left;'>EXPECTED INSTALLMENT DUE ZONAL REPORT<br />
                        for <?php echo isset($zone_name) ? $zone_name : ''; ?>
                    </p>
                    <p align='left'>For the period <?php echo isset($frend_date) ? 'From ' . $frstart_date . ' to ' . $frend_date : ''; ?></p>
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

            <?php echo $this->Form->create('Expectedinstallment', array('enctype' => 'multipart/form-data', "url" => array('controller' => 'Reports', 'action' => 'expectedInstallmentZone1'), "inputDefaults" => array('div' => false))); ?>   
            <table cellspacing="10" cellpadding="0" width="100%" border="0" style="">

                <tr>
                    <td align="center">
                        <?php echo $this->Form->input('zone_id', array('label' => 'Zone*', 'default' => 1, 'class' => 'form-control', 'div' => array('class' => 'form-inline'))); ?>
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
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('order_date', 'Order Date'); ?></th>
                    <th align="left" width="15" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('newinstallment_no', 'Installment #'); ?></th>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('fullname', 'Customer'); ?></th>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('work_place', 'Institution'); ?></th>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('mobile_no', 'Contact No.'); ?></th>

                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('payment_term', 'Duration'); ?></th>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('expected_installment', 'Expected Installment'); ?></th>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('paid_install', 'Paid'); ?></th>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('balance', 'Balance'); ?></th>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('default_interest', 'Defaulting Interest'); ?></th>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('suburb', 'Sub-Zone'); ?></th>
                    <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('due_date', 'Due Date'); ?></th>
                </tr>

                <?php
                if (isset($accounts)) {

                    foreach ($accounts as $each_item):
                        ?>
                        <tr>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                //   echo $each_item['Expectedinstallment']['order_id'].'<br/>';

                                if (isset($each_item['Order']['order_date'])) {
                                    echo $each_item['Order']['order_date'];
                                }
                                ?></td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                if (isset($each_item['Expectedinstallment']['newinstallment_no'])) {
                                    echo $each_item['Expectedinstallment']['newinstallment_no'];
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
                                if (isset($each_item['Customer']['mobile_no'])) {
                                    echo $each_item['Customer']['mobile_no'];
                                }
                                ?></td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                if (isset($each_item['Order']['payment_term'])) {
                                    echo $each_item['Order']['payment_term'];
                                }
                                ?></td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                if (isset($each_item['Expectedinstallment']['expected_installment'])) {
                                    echo $each_item['Expectedinstallment']['expected_installment'];
                                }
                                ?></td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                if (isset($each_item['Expectedinstallment']['paid_install'])) {
                                    echo round($each_item['Expectedinstallment']['paid_install'], 0);
                                }
                                ?></td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                if (isset($each_item['Expectedinstallment']['balance'])) {
                                    echo round($each_item['Expectedinstallment']['balance'], 0);
                                }
                                ?></td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                if (isset($each_item['Expectedinstallment']['default_interest'])) {
                                    echo round($each_item['Expectedinstallment']['default_interest'], 0);
                                }
                                ?></td>

                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                                if (isset($each_item['Zone']['suburb'])) {
                                    echo $each_item['Zone']['suburb'];
                                }
                                ?></td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
//                    echo $each_item['Expectedinstallment']['order_id'];

                                if (isset($each_item['Expectedinstallment']['due_date'])) {
                                    echo $each_item['Expectedinstallment']['due_date'];
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
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;"><?php
                                if (isset($each_item[0]['instalmt'])) {
                                    echo $shopCurrency . ' ' . round($each_item[0]['instalmt'], 0);
                                }
                                ?></td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;"><?php
                                if (isset($each_item[0]['paid'])) {
                                    echo $shopCurrency . ' ' . round($each_item[0]['paid'], 0);
                                }
                                ?></td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;"><?php
                                if (isset($each_item[0]['baltotal'])) {
                                    echo $shopCurrency . ' ' . round($each_item[0]['baltotal'], 0);
                                }
                                ?></td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;"><?php
                                if (isset($each_item[0]['interest'])) {
                                    echo $shopCurrency . ' ' . round($each_item[0]['interest'], 0);
                                }
                                ?></td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
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
<script type="text/javascript" language="javascript">
    $(document).ready(function ()
    {
        $("#dateRow").hide();
        var content = $("#report_content").html();
        $("#email_content").val(content);
        $("#dateRow").show();

    });
</script>