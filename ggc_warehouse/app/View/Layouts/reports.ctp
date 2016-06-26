<?php
$cakeDescription = __d('cake_dev', 'CODHERIS');
?>
<!DOCTYPE html>
<html class="fuelux" lang="en">
    <head>
        <!--<meta charset="utf-8">-->
        <!--<meta name="viewport" content="width=device-width, initial-scale=1.0">-->

        <?php echo $this->Html->charset(); ?>
        <title>
            <?php echo $cakeDescription ?>:
            <?php echo $title_for_layout; ?>
        </title>
        <!--<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&amp;sensor=false"></script>-->
        <?php
        echo $this->element('header');

        echo $this->fetch('meta');
        echo $this->fetch('css');
        echo $this->fetch('script');
        
        echo $this->Html->script("jquery.js");
        
echo $this->Html->script('jquery.printElement.js');
        ?>
    </head>
    <body>
        <section class="content">

            <!-- Sidebar Start -->
            <div class="sidebar">
                <!-- Logo Start -->
                <!--<a href="index.html">-->
<!--                    <div class="logo-container" id="step1">
                        <h1><?php // echo $this->Html->link($cakeDescription, '#'); ?></h1>
                    </div>-->
                <!--</a>-->
                <!-- Logo End -->

                <!-- Sidebar User Profile Start -->
                <div class="sidebar-profile">
                    <div class="user-avatar">
                        
			<?php 
                        //echo $this->Html->image('parkstone_logo.png', array('align'=>'center')); 
                        echo $this->Element('logo');
                        ?>
                    </div>
                    <div class="user-info">
                            <span style="font-size: 11px; color: #eaeaea;"><h4 style="color: #ffffff;"><i>CODHERIS</i></h4></span>
                    </div>
                </div>

                <div class="responsive-menu">
                    <a href="#"><i class="fa fa-bars"></i></a>
                </div>
                <!-- Sidebar User Profile End -->
                <?php echo $this->element('sidebar'); ?>
            </div>
            <!-- Sidebar End -->

            <div class="content-liquid-full">
                <div class="container">
                    <p>&nbsp;</p>
                 
<?php
if ($this->Session->check('bmsg')) {
    $errorMessage = $this->Session->read('bmsg');
    ?>
    <div class="alert alert-warning">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <h4>Notice!</h4>
    <?php echo $errorMessage; ?>
    </div>
        <?php
        $this->Session->delete('bmsg');
    } else if ($this->Session->check('emsg')) {
        $errorMessage = $this->Session->read('emsg');
        ?>
    <div class="alert alert-danger">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <h4>Warning/Error!</h4>
    <?php echo $errorMessage; ?>
    </div>
    <?php
    $this->Session->delete('emsg');
} else if ($this->Session->check('smsg')) {
    $Message = $this->Session->read('smsg');
    ?>
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <h4>Success!</h4>
    <?php echo $Message; ?>
    </div>
    <?php
    $this->Session->delete('smsg');
} else if ($this->Session->check('imsg')) {
    $Message = $this->Session->read('imsg');
    ?>
    <div class="alert alert-info">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <h4>Info!</h4>
    <?php echo $Message; ?>
    </div>
    <!-- Notifications end here -->
    <?php
    $this->Session->delete('imsg');
}
?>


                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="report_content">
                    

                                    <?php echo $this->Session->flash(); ?>

                                    <?php echo $this->fetch('content'); ?>

                                </div>
                            </div>
                        </div>
                    </div>
                    <?php echo $this->element('footer'); ?>
                </div>
                
<div class="modal_custom"><!-- Place at bottom of page --></div>
            </div>

        </section>

    </body>
</html>
<script type="text/javascript" language="javascript">
$(document).ready(function()
{
     $("#dateRow").hide();
     var content = $("#report_content").html();
     $("#email_content").val(content);
            $("#dateRow").show();
            (function ($) {

            $('#filter').keyup(function () {

                var rex = new RegExp($(this).val(), 'i');
                $('.searchable tr').hide();
                $('.searchable tr').filter(function () {
                    return rex.test($(this).text());
                }).show();

            })

        }($));
          $("a#print_report").click(function(event){
            $("#report_content").printElement();
            event.preventDefault();
            return false;
        });  
            
});
</script>
