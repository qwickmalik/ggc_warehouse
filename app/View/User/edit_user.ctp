<?php
echo $this->element('header');
?>
<h2>Edit Account Details</h2>
<div id="clearer"></div>
<?php echo $this->Form->create('User', array("url" => array('controller' => 'Users', 'action' => 'editUser'), "inputDefaults" => array('div' => false))); ?>

<div class="row">
    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
        <?php
            echo $this->Form->input('username', array('disabled','value' => (isset($users['User']['username'])?$users['User']['username'] :'')));
            echo $this->Form->hidden('id',array('value' => (isset($users['User']['id'])?$users['User']['id'] :'')));
            
            echo $this->Form->input('pass', array("label" => "password", "type" => "password"));
            echo $this->Form->input('confirm_password', array("type" => "password")); 
            echo $this->Form->input('firstname', array("label" => "First Name",'disabled','value' => (isset($users['User']['firstname'])?$users['User']['firstname'] :''))); 
            echo $this->Form->input('lastname', array("label" => "Last Name",'disabled','value' => (isset($users['User']['lastname'])?$users['User']['lastname'] :'')));
            echo $this->Form->input('email', array('disabled','value' => (isset($users['User']['email'])?$users['User']['email'] :''))); 
            echo $this->Form->button('Save', array("type" => "submit", "id" => "editBtn", "class" => "btn btn-md btn-success", 'style' => 'float: right;')); 
            
            ?>
    </div>
    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
        
    </div>
</div>

<?php
echo $this->Form->end();
?>

<div id="clearer"></div>


</div>
<!-- Content ends here -->

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