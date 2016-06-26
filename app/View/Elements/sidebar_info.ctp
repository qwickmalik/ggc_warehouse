<?php
echo "<h2>Information</h2>";

     $list = array(
         $this->Html->link($this->Html->image('go.png').'About Us','/Information/aboutUs', array('escape' => false)),
         $this->Html->link($this->Html->image('go.png').'Help','/Information/myHelp', array('escape' => false)),
        );
     echo $this->Html->nestedList($list, $tag = 'ul');
?>