<?php
echo $this->element('header');
?>



<h2>Add New Product</h2>

<div id="content_menu">
    
</div>
<div id="clearer"></div>

<?php echo $this->Form->create('Product', array("url" => array('controller' => 'Stocks', 'action' => 'addProduct'))); ?>
<div class="row">
    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">

        <?php
        echo $this->Form->input('product_name', ['label' => 'Product Name*', 'value' => isset($ba['Product']['product_name']) ? $ba['Product']['product_name'] : '']);
        echo $this->Form->hidden('id', ['value' => isset($ba['Product']['id']) ? $ba['Product']['id'] : '']);

        echo $this->Form->button('Save', array("type" => "submit", "class" => "btn btn-md btn-success", 'style' => 'float: right;'));
        ?>
    </div>
</div>
<?php echo $this->Form->end(); ?>

<div id="clearer">
    <br /><br /><br />
</div>

<table  class="table table-striped">
    <tr>
        <td style="border-bottom: solid 2px dodgerblue;" width="50" align="left"><b><?php echo $this->Paginator->sort('id', 'ID'); ?></b></td>
        <td style="border-bottom: solid 2px dodgerblue" align="left"><b><?php echo $this->Paginator->sort('product_name', 'Product Name'); ?></b></td>
        <td style="border-bottom: solid 2px dodgerblue;" width="80" align="left"><b>Delete</b></td>
    </tr>
    <?php foreach ($data as $each_item): ?>
        <tr>
            <td width="50" align="left"><?php echo $each_item['Product']['id']; ?></td>
            <td align="left"><?php echo $this->Html->link($each_item['Product']['product_name'], '/Stocks/addProduct/' . $each_item['Product']['id'], array("class" => $each_item['Product']['id'])); ?></td> 
            
            
            <?php
                if ($each_item['Product']['system'] == 1){
                ?>
                    <td align="left"><?php echo '-System-'; ?></td>
                <?php
                } else {
                    ?>
                    
                    <td align="left"><?php 
                        echo $this->Html->link("Delete", "/Stocks/delProduct/" . $each_item['Product']['id'], array("class" => $each_item['Product']['id'], 'confirm' => 'Are you sure you want to delete?'));
                        ?></td>
                <?php
                }
                ?>
                    
                    
        </tr>
    <?php endforeach; ?>
    <tr>
        <td colspan="3" align="right">&nbsp;</td>
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
<div id="clearer"></div>
</div>
<!-- Content ends here -->
<!-- Sidebar starts here -->
<div id="sidebar">
    <?php
    echo $this->element('logo');
    echo $this->element('sidebar_stocks'); //Stocks menu
    ?>
</div>
<!-- Sidebar starts here -->
<!-- Footer starts here -->
<?php echo $this->element('footer'); ?>
<!-- Footer starts here -->