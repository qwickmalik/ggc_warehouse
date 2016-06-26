<?php
if (isset($whse)) {
    echo '<h3>' . $whse['Warehouse']['warehouse_name'] . '</h3>';

    echo '<p><b>Location:</b><br />' . $whse['Warehouse']['location'] . '</p>';

    echo '<p><b>District:</b><br />' . $whse['Warehouse']['district'] . '</p>';

    echo '<p><b>Region:</b><br />' . $whse['Region']['region_name'] . '</p>';

    echo '<p><b>Other Details:</b><br />' . $whse['Warehouse']['details'] . '</p>';

    if (!empty($whse['Warehouse']['warehouse_photo'])) {

        $image = imagecreatefromstring($whse['Warehouse']['warehouse_photo']);

        ob_start(); //You could also just output the $image via header() and bypass this buffer capture.
        imagejpeg($image, null, 80);
        $data = ob_get_contents();
        ob_end_clean();
        echo '<img src="data:image/jpg;base64,' . base64_encode($data) . '" style="max-width: 500px;" />';
    }
}
?>


<table class="table table-striped">
    <tr>
        <td style="border-bottom: solid 2px dodgerblue;" align="left"><b><?php echo 'Date Posted'; ?></b></td>

        <td style="border-bottom: solid 2px dodgerblue" align="left"><b><?php echo 'Product'; ?></b></td>
        <td style="border-bottom: solid 2px dodgerblue" align="left"><b><?php echo 'Quantity'; ?></b></td>
    </tr>
    <?php
    if (!empty($mydata)) {
        foreach ($mydata as $each_item):
            ?>
            <tr>
                <td align="left"><?php echo $each_item['ProductLevel']['modified']; ?></td>
                <td align="left"><?php echo $each_item['Product']['product_name']; ?></td>
                <td align="left"><?php echo $each_item['ProductLevel']['quantity'] . ' ' . $each_item['ProductLevel']['unit']; ?></td> 




            </tr>
            <?php
        endforeach;
    }
    ?>

    
</table>