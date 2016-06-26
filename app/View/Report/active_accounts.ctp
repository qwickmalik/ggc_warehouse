<?php
echo $this->element('header_report');
echo $this->Html->script('notification.js');

if ($this->Session->check('shopCurrency')) {
    $shopCurrency = $this->Session->read('shopCurrency');
} else {
    $shopCurrency = "";
}
?>

<!-- Content starts here -->
<div id="content">

    <table id="report_content" width="100%" align="left" cellspacing="0" cellpadding="5" border="0">
        <tr>
            <td align="left" colspan="5">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <?php echo $this->Html->image('logo.png', array('style' => 'float: left; margin-right: 20px;')); ?>
                        <p style='font-weight: bold; font-size: 16px; text-align: left;'><?php // echo $setup_results['Setting']['company_name']; ?>ACTIVE ACCOUNTS</p>
                        <p align='left'>Active Accounts as at <?php echo date('d F, Y'); ?></p>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <p align="right"><?php echo $setup_results['Setting']['postal_address'].', '.$setup_results['Setting']['postal_town_suburb'].'<br />'.$setup_results['Setting']['postal_city'].', '.$setup_results['Setting']['postal_country'].'<br />'.$setup_results['Setting']['telephone'].'<br />'.$setup_results['Setting']['email']; ?></p>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('last_date', 'Finished Date'); ?></th>
            <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('customer_id', 'Customer'); ?></th>
            <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('mobile_no', 'Contact No.'); ?></th>
            <th align="right" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('amount_paid', 'Amount Paid'); ?></th>
            <th align="right" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('balance', 'Balance'); ?></th>
        </tr>
        <?php if (isset($accounts)) {
            foreach ($accounts as $each_item): ?>
                <tr>
                    <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php if (isset($each_item['Order']['last_date'])) {
                    echo $each_item['Order']['last_date'];
                } ?></td>
                    <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"> <?php if (isset($each_item['Customer']['fullname'])) {
                    echo $each_item['Customer']['fullname'];
                } ?></td>
                    <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"> <?php if (isset($each_item['Customer']['mobile_no'])) {
            echo $each_item['Customer']['mobile_no'];
        } ?></td>
                    <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php if (isset($each_item['Order']['amount_paid'])) {
            echo $each_item['Order']['amount_paid'];
        } ?></td>
                    <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php if (isset($each_item['Order']['balance'])) {
            echo $each_item['Order']['balance'];
        } ?></td>
                </tr>
    <?php endforeach;
} ?>

        <tr>
            <td align="left" valign="top">&nbsp;</td>
            <td align="left" valign="top">&nbsp;</td>
            <td align="left" valign="top">&nbsp;</td>
            <td align="left" valign="top">&nbsp;</td>
            <td align="right" valign="top">
                <p style="font-style: italic;">Accessed on <?php echo date('d-m-Y'); ?></p>
            </td>
        </tr>

        <tr>
            <td align="left" valign="top"></td>
            <td align="left" valign="top"></td>
            <td align="left" valign="top"></td>
            <td align="left" valign="top"></td>
            <td align="right" valign="top">
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