<?php $user = $this->Session->read('userDetails');?>
<h2>Settings</h2>
<?php
                     $settings_list = array(
                         $this->Html->link($this->Html->image('company.png').'Company Setup','../Settings/setup', array('escape' => false)),
                         
                         $this->Html->link($this->Html->image('users.png').'Users','/Users/users', array('escape' => false)),
                         $this->Html->link($this->Html->image('users.png').'User Types','/Users/userTypes', array('escape' => false)),
                         $this->Html->link($this->Html->image('users.png').'User Departments','/Users/userDepartments', array('escape' => false)),      
//                         $this->Html->link($this->Html->image('investments.png').'Investment Portfolios','../Settings/investmentPortfolios', array('escape' => false)),
//                         $this->Html->link($this->Html->image('suppliers.png').'Suppliers List','../Settings/suppliers', array('escape' => false)),
//                         $this->Html->link($this->Html->image('notifications.png').'Notifications','../Settings/notifications', array('escape' => false)),
                         
                         );
                     
                     echo $this->Html->nestedList($settings_list, $tag = 'ul');
?>
