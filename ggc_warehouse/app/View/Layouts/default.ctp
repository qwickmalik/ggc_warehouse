<?php
/**
 *
 * PHP versions 4 and 5
 *
 * CakePHP(tm) : Rapid Development Framework (http://cakephp.org)
 * Copyright 2005-2009, Cake Software Foundation, Inc. (http://cakefoundation.org)
 *
 * Licensed under The MIT License
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright 2005-2009, Cake Software Foundation, Inc. (http://cakefoundation.org)
 * @link          http://cakephp.org CakePHP(tm) Project
 * @package       cake
 * @subpackage    cake.cake.libs.view.templates.layouts
 * @since         CakePHP(tm) v 0.10.0.1076
 * @license       MIT License (http://www.opensource.org/licenses/mit-license.php)
 */
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <?php echo $this->Html->charset(); ?>

        <title>QwickPOINT</title>
        <?php
//Stylesheets
        echo $this->Html->css('template.css');
        echo $this->Html->css('style.css');
        echo $this->Html->css('print.css');
        echo $this->Html->css('jquery-ui-1.10.3.custom.css');
        echo $this->Html->css('bootstrap.css');
        echo $this->Html->css('font-awesome.min.css');
        echo $this->Html->css('responsive.css');
//Scripts
        echo $this->Html->script('jquery-1.9.1.min.js');
        echo $this->Html->script('jquery.ui.core.js');
        echo $this->Html->script('jquery.ui.widget.js');
        echo $this->Html->script('jquery.ui.position.js');
        echo $this->Html->script('jquery.ui.menu.js');
        echo $this->Html->script('jquery.ui.autocomplete.js');
        echo $this->Html->script('bootstrap.js');
        echo $this->Html->script('nowloading.js');
        echo $this->Html->script('custompopup/custom.js');
        echo $this->Html->script('notification.js');
        
        

        echo $this->Html->meta('favicon.ico', '/favicon.ico', array('type' => 'icon'));
        
        ?>
        
        



    </head>
    
    <?php
    echo $this->Html->tag('body', "$content_for_layout", array(/* 'bgcolor' => '#FFFFFF' */));
    ?>

    <!-- Notifications start here -->
    <!--    <div class="alert">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>Warning!</strong> Best check yo self, you're not looking too good.
        </div>-->
    <!-- Notifications end here -->

</html>
