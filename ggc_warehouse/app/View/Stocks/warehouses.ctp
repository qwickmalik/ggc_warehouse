<?php
echo $this->element('header');
echo $this->Html->script('nicEditor/nicEdit.js');
?>
<script type="text/javascript">
    bkLib.onDomLoaded(function () {
        new nicEditor({fullPanel: true, iconsPath: '<?php echo $this->webroot; ?>js/nicEditor/nicEditorIcons.gif'}).panelInstance('message');
        //new nicEditor({iconsPath : '../nicEditorIcons.gif'}).panelInstance('area3');

    });
</script>

<h2>Warehouses</h2>

<div id="clearer"></div>

<?php echo $this->Form->create('Warehouse', array('enctype' => 'multipart/form-data', "url" => array('controller' => 'Stocks', 'action' => 'warehouses'), "inputDefaults" => array('div' => false))); ?>

<?php // echo $this->Form->create('Msgs', array('enctype' => 'multipart/form-data', "url" => array('controller' => 'Customers', 'action' => 'msgTemplate'), "inputDefaults" => array('div' => false))); 
?>

<div class="row">
    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
        <?php
        echo $this->Form->hidden('id', array('value' => isset($wh['Warehouse']['id']) ? $wh['Warehouse']['id'] : ''));

        echo $this->Form->input('operator', array('label' => 'Warehouse Operator', 'value' => isset($wh['Warehouse']['operator']) ? $wh['Warehouse']['operator'] : ''));


        echo $this->Form->input('warehouse', array('label' => 'Warehouse Name', 'value' => isset($wh['Warehouse']['warehouse_name']) ? $wh['Warehouse']['warehouse_name'] : ''));

        echo $this->Form->input('location', array('label' => 'Location', 'value' => isset($wh['Warehouse']['location']) ? $wh['Warehouse']['location'] : ''));

        echo $this->Form->input('district', array('label' => 'District', 'value' => isset($wh['Warehouse']['district']) ? $wh['Warehouse']['district'] : ''));

        echo $this->Form->input('region_id', array('label' => 'Region', 'empty' => '--Please select--', 'options' => $regionids, 'value' => isset($wh['Warehouse']['region_id']) ? $wh['Warehouse']['region_id'] : ''));

        echo $this->Form->input('warehouse_photo', array('type' => 'file', 'label' => 'Warehouse Photo'));
        ?>
    </div>
    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">

        <?php
//echo $this->Form->input('details', array('label' => 'Details', 'value' => isset($wh['Warehouse']['details']) ? $wh['Warehouse']['details'] : ''));

        echo $this->Form->input('details', array('type' => 'textarea', 'id' => 'message', 'style' => 'height: 300px;', 'value' => (isset($wh['Warehouse']['details']) ? $wh['Warehouse']['details'] : '' )));


        echo $this->Form->button('Save', array("type" => "submit", "class" => "btn btn-md btn-success", 'style' => 'float: right;'));
        ?>
    </div>



</div>
<?php
echo $this->Form->end();
?>


<div id="clearer"></div>


<table class="table table-striped">
    <tr>
        <td style="border-bottom: solid 2px dodgerblue;" align="left"><b><?php echo $this->Paginator->sort('id', 'ID'); ?></b></td>
        <td style="border-bottom: solid 2px dodgerblue" align="left"><b><?php echo $this->Paginator->sort('operator', 'Operator'); ?></b></td>
        <td style="border-bottom: solid 2px dodgerblue" align="left"><b><?php echo $this->Paginator->sort('warehouse_name', 'Warehouse Name'); ?></b></td>
        <td style="border-bottom: solid 2px dodgerblue" align="left"><b><?php echo $this->Paginator->sort('location', 'Location'); ?></b></td>
        <td style="border-bottom: solid 2px dodgerblue" align="left"><b><?php echo $this->Paginator->sort('district', 'District'); ?></b></td>
        <td style="border-bottom: solid 2px dodgerblue" align="left"><b><?php echo $this->Paginator->sort('region_id', 'Region'); ?></b></td>
        <td style="border-bottom: solid 2px dodgerblue" align="left"><b><?php echo $this->Paginator->sort('warehouse_photo', 'Photo'); ?></b></td>
        <td style="border-bottom: solid 2px dodgerblue;" width="20" align="left"><b>Del</b></td>
    </tr>
    <?php foreach ($data as $each_item): ?>
        <tr>
            <td align="left"><?php echo $each_item['Warehouse']['id']; ?></td>
            <td align="left"><?php echo $each_item['Warehouse']['operator']; ?></td>
            <td align="left" class="warehouseAnchor" ><?php echo $this->Html->link($each_item['Warehouse']['warehouse_name'], "/Stocks/warehouses/" . $each_item['Warehouse']['id'], array("class" => $each_item['Warehouse']['id'])); ?></td> 
            <td align="left"><?php echo $each_item['Warehouse']['location']; ?></td>
            <td align="left"><?php echo $each_item['Warehouse']['district']; ?></td>
            <td align="left"><?php echo $each_item['Region']['region_name']; ?></td>
            <td align="left"><?php
//            echo $this->Html->Link('Preview', '#warehousePreview' . "/" . (isset($each_item['Warehouse']['id']) ? $each_item['Warehouse']['warehouse_name'] : '' ), array('escape' => false, 'data-id' => (isset($each_item['Warehouse']['id']) ? $each_item['Warehouse']['id'] : '' ), 'data-toggle' => 'modal', 'data-target' => '#warehousePreview')); 

                if (!empty($each_item['Warehouse']['warehouse_photo'])):

                    $image = imagecreatefromstring($each_item['Warehouse']['warehouse_photo']);

                    ob_start(); //You could also just output the $image via header() and bypass this buffer capture.
                    imagejpeg($image, null, 80);
                    $data = ob_get_contents();
                    ob_end_clean();
                    echo '<img src="data:image/jpg;base64,' . base64_encode($data) . '" style="max-width: 100px;" />';
                    
                   
                    
                else:
                    echo "<i>No image</i>";
                endif;
                ?></td>


            <td width="20" align="left"><?php echo $this->Html->link("Delete", "/Stocks/delWarehouse/" . $each_item['Warehouse']['id'], array('confirm' => 'Are you sure you want to delete?')); ?></td>
        </tr>
    <?php endforeach; ?>
    
    <tr>
        <td colspan="8" align="center">
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
    echo $this->element('sidebar_stocks'); //Settings menu
    ?>
</div>
<!-- Sidebar starts here -->
<!-- Footer starts here -->
<?php echo $this->element('footer'); ?>
<!-- Footer starts here -->