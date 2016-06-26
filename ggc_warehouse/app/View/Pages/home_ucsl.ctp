

<?php 
    echo $this->Html->css('template.css');
echo $this->Html->script('jquery-1.9.1.min.js');
?>

<!--    <script src="http://code.jquery.com/jquery-latest.js"></script>-->
<?php

    echo $this->Html->script('notification.js');
    echo $this->Html->script('jquery.js'); 
    $r2c2_norma =  $this->webroot.'img/r2c2_normal.png';  
    $r2c2_dow =   $this->webroot.'img/r2c2_down.png';
    $r2c2_ove =  $this->webroot.'img/r2c2_over.png';

//    echo $this->Html->script('jquery-1.8.2.js');
//    echo $this->Html->script('jquery-ui-1.9.1.custom.js');
    
    echo $this->Html->script('login.js');
    echo $this->Html->script('log.js');
        echo $this->Html->script('custompopup/custom.js');
        echo $this->Html->css('style.css');
        echo $this->Html->css('bootstrap.css'); 
        echo $this->Html->script('bootstrap.js');
        
//    echo $this->Html->script('shadedborder.js');
	
?>

<script type="text/javascript">
$(document).ready(function()
{
	$("#login_form input:first").focus();
        
});
</script>
<div align="center">
    
<div id="welcome_message" style="background-color: transparent">
		<?php //echo "Welcome! To continue, please login using your username and password below"; ?>
<!--			<div  id="error_msg" class="ui-state-error ui-corner-all" style="padding: 5px; display: none;">This is an error message</div>
                                             <div id="progress_msg" class="ui-state-active ui-corner-all" style="padding: 5px; display: none;">This is an error message</div>
           
	
-->	
 
<!-- Notifications start here -->
<?php
 
        
if( $this->Session->check('bmsg') ) {
                        $errorMessage = $this->Session->read('bmsg');
                        ?>
    <div class="alert alert-block" align="center">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <h4>Notice!</h4>
 <?php echo $errorMessage; ?>
    </div>
 <?php
                        $this->Session->delete('bmsg');
                    
                        
       }else if( $this->Session->check('emsg') ) {
                        $errorMessage = $this->Session->read('emsg');
       ?>
    <div class="alert alert-error" align="center">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <h4>Warning!</h4>
    <?php echo $errorMessage; ?>
    </div>
 <?php
                       
                    
                        
       }else if( $this->Session->check('smsg') ) {
                        $Message = $this->Session->read('smsg');
                        ?>
<div class="alert alert-success" align="center">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <h4>Info</h4>
    <?php echo $Message; ?>
    </div>
 <?php
                        $this->Session->delete('smsg');
                    }
                    else if( $this->Session->check('imsg') ) {
                        $Message = $this->Session->read('imsg');
                        ?>
<div class="alert alert-info" align="center">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <h4>Warning!</h4>
    <?php echo $Message; ?>
    </div>
<!-- Notifications end here -->
 <?php
                        $this->Session->delete('imsg');
                    }
                        ?>
</div>
    
        <div id="content_body" >
            <div id="container_login">
                <div id="login_ad">
                    <?php 
                        //include('http://www.qwickfusion.net/login_ad/login_ad.php'); 
                       // include('http://localhost/UCSL/login_ad/login_ad.php');
                        //include('http://localhost/UCSL/login_ad/index.html');
                        echo $this->element('login_ad');
                        ?>
                </div>
                <div id="logo" style="margin: 50px 0px 0px 120px;"></div>
                <div id="welcome_msg"><?php echo "Welcome, to continue, please login using your username and password below"; ?></div>
                
                
                <div id="login">
                    <?php echo $this->Form->create('login', array('url' => array('controller' => 'Users', 'action' => 'login'),'name' => 'login')); ?>	
                    
                        Username: <?php echo $this->Form->input('username', array('label' => false, 'size' => '20', 'name' => 'username', 'class'=>'large')); ?>
                        Password:<?php echo $this->Form->input('password', array('label' => false, 'size' => '20', 'name' => 'password', 'class'=>'large')); ?>
                        <?php 
                        //echo $this->Form->button('Login',array("type" => "submit","class" => "button_yellow","id" => "login-link", "escape"=>false));
                            ?>
                    <p id="r2c2" style="padding-top:15px;">
                     <?php //echo $this->Html->link('Enter',"javascript:void(0)",array("id" => "login-link", "escape" => false, "class" => 'button_green', 'alt'=>'Click to Enter')); 
                     
                                             echo $this->Form->button('Enter',array("type" => "submit","class" => "button_green","id" => "login-link", "escape"=>false));
                    ?>
                    <?php 
//                    echo $this->Html->link($this->Html->image('r2c2_normal.png', array("border" => "0", "name" => "T1", "width" => "100", "height" => "30", "alt" => "Click here to Enter")), "javascript:void(0)", array("onMouseOut" => "ImageSwap('T1', '$r2c2_norma')", "onMouseUp" => "ImageSwap('T1', '$r2c2_norma')", "onMouseOver" => "ImageSwap('T1', '$r2c2_ove')", "onMouseDown" => "ImageSwap('T1','$r2c2_dow')", "id" => "login-link", "escape" => false)); 
                    ?>
                        
                        
                    </p>
                           
                    <?php echo $this->Form->end(); ?>
                </div>
            </div>
        </div>
        
</div>
<div id="footer">
    <div class="links_left"></div>
    <div class="credits">&copy;<?php echo "2012 - ".date('Y'); ?> <a href="http://www.qwickfusion.net">QwickFusion</a>. Developed for Ultimate Credit Solutions Limited. All rights reserved.</div>
    <div class="links_right">
        <a href="#">About Us</a>
    </div>
</div>
