<?php
/*
 * View/FullCalendar/index.ctp
 * CakePHP Full Calendar Plugin
 *
 * Copyright (c) 2010 Silas Montgomery
 * http://silasmontgomery.com
 *
 * Licensed under MIT
 * http://www.opensource.org/licenses/mit-license.php
 */
?>
<script type="text/javascript">
    plgFcRoot = '<?php echo $this->Html->url('/'); ?>' + "full_calendar";
</script>
<?php
echo $this->Html->script(array('/full_calendar/js/jquery-1.5.min', '/full_calendar/js/jquery-ui-1.8.9.custom.min', '/full_calendar/js/fullcalendar.min', '/full_calendar/js/jquery.qtip-1.0.0-rc3.min', '/full_calendar/js/ready'), array('inline' => 'false'));
echo $this->Html->css('/full_calendar/css/fullcalendar', null, array('inline' => false));
?>

<!-- Content starts here -->
<h3>Programs</h3>
<div class="boxed">
    <div class="inner">
        <div id="clearer"></div>

        <div class="Calendar index">
            <div class="actions">
                <?php
                echo $this->Html->link(__('New Program', true), array('plugin' => 'full_calendar', 'controller' => 'events', 'action' => 'add'), array("class" => 'btn btn-lg btn-success',));
                echo $this->Html->link(__('Manage Programs', true), array('plugin' => 'full_calendar', 'controller' => 'events'), array("class" => 'btn btn-lg btn-primary',));
                echo $this->Html->link(__('Manage Program Types', true), array('plugin' => 'full_calendar', 'controller' => 'event_types'), array("class" => 'btn btn-lg btn-primary',));
                ?>

            </div>
            <div id="calendar"></div>
        </div>

    </div>
    <!-- Content ends here -->
