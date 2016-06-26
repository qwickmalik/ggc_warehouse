<table class="table table-striped">
    <tr>
        <td style="border-bottom: solid 2px dodgerblue;" align="left"><b><?php echo $this->Paginator->sort('id', 'ID'); ?></b></td>
        <td style="border-bottom: solid 2px dodgerblue" align="left"><b><?php echo $this->Paginator->sort('operator', 'Operator'); ?></b></td>
        <td style="border-bottom: solid 2px dodgerblue" align="left"><b><?php echo $this->Paginator->sort('warehouse_name', 'Warehouse Name'); ?></b></td>
        <td style="border-bottom: solid 2px dodgerblue" align="left"><b><?php echo $this->Paginator->sort('location', 'Location'); ?></b></td>
        <td style="border-bottom: solid 2px dodgerblue" align="left"><b><?php echo $this->Paginator->sort('district', 'District'); ?></b></td>
        <td style="border-bottom: solid 2px dodgerblue" align="left"><b><?php echo $this->Paginator->sort('region_id', 'Region'); ?></b></td>
        <td style="border-bottom: solid 2px dodgerblue" align="left"><b><?php echo $this->Paginator->sort('warehouse_photo', 'Photo'); ?></b></td>
    </tr>
    <?php foreach ($data as $each_item): ?>
        <tr>
            <td align="left"><?php echo $each_item['Warehouse']['id']; ?></td>
            <td align="left"><?php echo $each_item['Warehouse']['operator']; ?></td>
            <td align="left" class="warehouseAnchor" ><?php echo $this->Html->link($each_item['Warehouse']['warehouse_name'], "/Stocks/warehouseDetails/" . $each_item['Warehouse']['id'], array("class" => $each_item['Warehouse']['id'])); ?></td> 
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


        </tr>
    <?php endforeach; ?>
    
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

