<?php
echo $this->element('header');
?>
<h2>SETTINGS: Users Types</h2>
<div id="clearer"></div>
<?php echo $this->Form->create('Usertype', array("url" => array('controller' => 'Users', 'action' => 'userTypes'), "inputDefaults" => array('label' => false, 'div' => false))); ?>
<div class="row">
    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
        <?php
        echo $this->Form->input('usertype', array("label" => "User Type"));
        echo $this->Form->hidden('id');
        ?>
    </div>
    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
        <br />
        <?php echo $this->Form->button('Save', array("type" => "submit", "class" => "btn btn-md btn-success")); //check the parameters here ?>
    </div>
</div>


<?php
echo $this->Form->end();
?>

<div id="clearer"></div>



<table class="table table-striped">
    <tr>
        <td style="border-bottom: solid 2px dodgerblue;" width="50" align="left"><b><?php echo $this->Paginator->sort('id', 'ID'); ?></b></td>
        <td style="border-bottom: solid 2px dodgerblue;" align="left"><b><?php echo $this->Paginator->sort('usertype', 'User Type'); ?></b></td>
<!--                                <td style="border-bottom: solid 2px dodgerblue;" width="20" align="left"><b>Del</b></td>-->
    </tr>
    <?php foreach ($data as $each_item): ?>
        <tr>
            <td width="50" align="left"><?php echo $each_item['Usertype']['id']; ?></td>
            <td align="left" class="userTypeAnchor"><?php echo $this->Html->link($each_item['Usertype']['usertype'], "#", array("class" => $each_item['Usertype']['id'], 'confirm' => 'Are you sure you want to delete?')); ?></td> <!-- Link to enable editing -->
    <!--                                <td align="left"><?php //echo $this->Html->link("Delete","/Users/delusertype/".$each_item['Usertype']['id']);  ?></td>-->
        </tr>
    <?php endforeach; ?>
    <tr>
        <td colspan="3" align="right">
            <?php
            //  echo $this->Form->button('Delete',array("type" => "#","class" => "button_red"));           //check the parameters here
            ?>
        </td>
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
    echo $this->element('settings_sidebar'); //Settings menu
    ?>
</div>
<!-- Sidebar starts here -->
<!-- Footer starts here -->
<?php echo $this->element('footer'); ?>
<!-- Footer starts here -->