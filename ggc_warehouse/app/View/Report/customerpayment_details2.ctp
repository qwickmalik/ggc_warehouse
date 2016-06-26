<?php
echo $this->Html->script('notification.js');
echo $this->element('header');
?>

<!-- Content starts here -->

<h2>Find Customer Payment Details</h2>
<h3 style="clear: both;">Step 2 - Orders for <span style="color: red;"> <?php if (isset($data[0]['Customer']['fullname'])) {
    echo $data[0]['Customer']['fullname'];
} ?></span></h3>

<div id="clearer"></div>

<table class="table table-striped">
    <tr>
        <td style="border-bottom: solid 2px dodgerblue;" width="50" align="left">
            <b><?php echo $this->Paginator->sort('id', 'ID'); ?></b>
        </td>
        <td style="border-bottom: solid 2px dodgerblue" align="left">
            <b><?php echo $this->Paginator->sort('order_date', 'Order Date'); ?></b>
        </td>
        <td style="border-bottom: solid 2px dodgerblue" align="left">
            <b><?php echo $this->Paginator->sort('hp_price', 'Total Cost'); ?></b>
        </td>
        <td style="border-bottom: solid 2px dodgerblue" align="left">
            <b><?php echo $this->Paginator->sort('mthly_install', 'Mthly. Instal.'); ?></b>
        </td>
        <td style="border-bottom: solid 2px dodgerblue" align="left">
            <b><?php echo $this->Paginator->sort('status', 'Status'); ?></b>
        </td>
        <td style="border-bottom: solid 2px dodgerblue" align="left">
            <b><?php echo $this->Paginator->sort('balance', 'Balance'); ?></b>
        </td>
        <td style="border-bottom: solid 2px dodgerblue" align="left">
            <b><?php echo $this->Paginator->sort('amount_paid', 'Amount Paid'); ?></b>
        </td>
        <td style="border-bottom: solid 2px dodgerblue" align="left">
            <b><?php echo $this->Paginator->sort('last_date', 'Last Pmt. Date'); ?></b>

        </td>
        <td style="border-bottom: solid 2px dodgerblue" align="left">
            <b><?php echo $this->Paginator->sort('due_date', 'Next Pmt. Date'); ?></b>
        </td>
        <td style="border-bottom: solid 2px dodgerblue" align="left">
            <b><?php echo $this->Paginator->sort('payment_status', 'Payment Status'); ?></b>
        </td>
    </tr>
            <?php if (isset($data)) {
                foreach ($data as $each_item): ?>
            <tr>
                <td width="50" align="left">
                    <?php if (isset($each_item['Order']['id'])) {
                        echo $each_item['Order']['id'];
                    } ?>
                </td>
                <td align="left" class="orderAnchor">
                    <?php if (isset($each_item['Order']['order_date'])) {
                        echo $this->Html->link($each_item['Order']['order_date'], "/Reports/customerpaymentDetails/" . $each_item['Order']['id'] . "/" . $each_item['Customer']['fullname'] . "/" . $each_item['Order']['amount_paid'] . "/" . $each_item['Order']['balance'], array("class" => $each_item['Order']['id']));
                    } ?>
                </td> <!-- Link to enable editing -->
        <!--                                <td align="left">
        <?php /* echo $each_item['Customer']['fullname']; */ ?>
                </td>-->
                <td align="left">
        <?php if (isset($each_item['Order']['hp_price'])) {
            echo $each_item['Order']['hp_price'];
        } ?>
                </td>
                <td align="left">
                    <?php if (isset($each_item['Order']['mthly_install'])) {
                        echo $each_item['Order']['mthly_install'];
                    } ?>
                </td>
                <td align="left">
        <?php if (isset($each_item['Order']['status'])) {
            echo $each_item['Order']['status'];
        } ?>
                </td>

                <td align="left">
        <?php echo $each_item['Order']['balance']; ?>
                </td>
                <td align="left">
                <?php echo $each_item['Order']['amount_paid']; ?>
                </td>
                <td align="left">
            <?php echo $each_item['Order']['last_date']; ?>
                </td>
                <td align="left">
                    <?php echo $each_item['Order']['due_date']; ?>
                </td>
                <td align="left">
                    <?php echo $each_item['Order']['payment_status']; ?>
                </td>
        <!--                                <td width="20" align="left">
                    <input type="button" name="<?php
//                                    echo $each_item['Order']['order_id']; 
                    ?>" class="tax_del"/>
                </td>-->
            </tr>
                <?php endforeach;
            } ?>
    <tr>
        <td colspan="10" align="right">
            <?php
            //echo $this->Form->button('Delete',array("type" => "#","class" => "button_red"));           //check the parameters here
            ?>
        </td>
    </tr>
    <tr>
        <td colspan="10" align="center">
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
<div id="sidebar">
<?php
echo $this->element('logo');
echo $this->element('reports_sidebar'); //Mini Dashboard
?>
</div>
<!-- Sidebar starts here -->
<!-- Footer starts here -->
<?php echo $this->element('footer'); ?>
<!-- Footer starts here -->
