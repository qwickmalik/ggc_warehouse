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

<table  id="report_content" width="100%" align="left" cellspacing="0" cellpadding="5" border="0">
    <tr>
        <td colspan="2" align="left">
            <div id="clearer">&nbsp;</div>
            <div class="row">
                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
<?php echo $this->Html->image('logo.png', array('style' => 'float: left; margin-right: 20px;', 'alt' => $this->Session->read('shopName'))); ?>
                    <p style='font-weight: bold; font-size: 16px; text-align: left;'>
                        SALES EXECUTIVES WITH HIGHEST DEFAULTS as at <?php echo date('d F, Y'); ?>
                    </p>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                    <p align="right"><?php echo $this->Session->read('shopAddress') . ', ' . $this->Session->read('shopPosttown') . '<br />' . $this->Session->read('shopPostCity') . ', ' . $this->Session->read('shopPostCount') . '<br />' . $this->Session->read('shopTelephone') . '<br />' . $this->Session->read('shopEmail'); ?></p>
                </div>
            </div>
        </td>
    </tr>
<!--    <tr>
        <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php // echo $this->Paginator->sort('sales_person', 'Sales Executive'); ?></th>
        <th align="right" valign="top" style="border-bottom: solid 2px Gray;"><?php // echo $this->Paginator->sort('sales_person', 'No. Customers'); ?></th>
    </tr>-->
    <tr>
        <td colspan="2">
            <table class="table table-striped">
                <tr>
        <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo 'Sales Executive'; ?></th>
        <th align="right" valign="top" style="border-bottom: solid 2px Gray;"><?php echo 'No. Customers'; ?></th>
    </tr>
<?php if (isset($accounts)) {
    foreach ($accounts as $each_item):
        ?>
            <tr>
                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    if (isset($each_item['Order']['sales_person'])) {
                        echo $each_item['Order']['sales_person'];
                    }
                    ?></td>
                <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    if (isset($each_item[0]['customers'])) {
                        echo $each_item[0]['customers'];
                    }
                    ?></td>
            </tr>
    <?php endforeach;
}

 if (isset($sales)) {
    foreach ($sales as $each_item):
        ?>
            <tr>
                <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    if (isset($each_item[0]['salesperson'])) {
                        echo $each_item[0]['salesperson'];
                    }
                    ?></td>
                <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
                    if (isset($each_item[0]['customers'])) {
                        echo $each_item[0]['customers'];
                    }
                    ?></td>
            </tr>
    <?php endforeach;
}
?>
            </table>
        </td>
    </tr>
    <tr>
        <td align="left" valign="top">&nbsp;</td>
        <td align="right" valign="top">
            <p style="font-style: italic;">Generated on <?php echo date('d-m-Y H:s'); ?></p>
        </td>
    </tr>
    
    
    <tr>
        <td colspan="2" align="center">
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
