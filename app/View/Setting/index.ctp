<!-- Header starts here -->
<?php echo $this->element('header'); 

$user = $this->Session->read('userDetails');
?>
<!-- Header ends here -->


<h1>Settings</h1>
<div id="clearer"></div>
<!-- Panels start here -->
<div id="panel">
    <?php
    echo $this->Html->link($this->Html->image('company.png', array('width' => '32', 'height' => '32')), '/Settings/setup', array('escape' => false));
    ?>

    <div id="panel_txt">
        <h2>Company Setup</h2>
        <p>Enter/edit your company details here.</p>
    </div>
</div>


<div id="panel">
    <?php
    echo $this->Html->link($this->Html->image('users.png', array('width' => '32', 'height' => '32')), '/Users/users', array('escape' => false));
    ?>

    <div id="panel_txt">
        <h2>Users</h2>
        <?php
        echo $this->Html->link('Create/Edit Users', '/Users/users', array('escape' => false)) . "<br />";
        echo $this->Html->link('Create User Types', '/Users/userTypes', array('escape' => false)) . "<br />";
        echo $this->Html->link('Create User Departments', '/Users/userDepartments', array('escape' => false));
        ?>
    </div>
</div>
<!-- Panels end here -->
</div>
<!-- Sidebar starts here -->
<div id="sidebar">
    <?php
    echo $this->element('logo');
    ?>
</div>
<!-- Sidebar starts here -->
<!-- Footer starts here -->
<?php echo $this->element('footer'); ?>
<!-- Footer starts here -->