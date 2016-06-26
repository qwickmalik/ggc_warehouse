<?php
echo $this->Html->script('notification.js');
echo $this->element('header');
?>

<!-- Content starts here -->
<div id="content">
    <h1>Find Customer Payment Details</h1>
    <h3 style="clear: both;">Step 1 - Find Customer</h3>
    
    <div id="clearer"></div>

    <?php echo $this->Form->create('Order', array('enctype' => 'multipart/form-data', "url" => array('controller' => 'Orders', 'action' => 'searchCustomerDetails'), "inputDefaults" => array('div' => false))); ?>
    <table border="0" width="100%" cellspacing="0" cellpadding="5" align="left">
        <tr>
            <td align="center" colspan="3" style="font-size: 18px; color: gray; font-weight: bold;">&nbsp;</td>
        </tr>
        <tr>
            <td align="center" valign="top" colspan="3">
                <b style="color: red;">Please enter customer's name</b>
                <?php
//                echo $this->Form->input('search', array('size'=> 40, 'class'=>'search', 'label'=>false));
//                echo $this->Form->button('Search', array("type" => "submit", "id" => "cred_save", "class" => "button_blue"));
                
                echo $this->Form->input('search', array('size'=> 50, 'class'=>'search' ,'name' => 'order_search','label'=>false,'value' => (isset($cust['Customer']['full_name']) ? $cust['Customer']['full_name'] : '' )));
                echo $this->Form->button('Search', array("type" => "submit", "class" => "button_blue"));
                ?>
                &nbsp;
                <?php echo $this->Html->link('Proceed',"/Reports/clearOrdersearchSessions",array("class" => 'button_green')); ?>
                <input type="hidden" name="hid_cust" value="<?php (isset($cust['Customer']['id']) ? $cust['Customer']['id'] : '' ); ?>" />
            </td>
        </tr>
    </table>
   <?php echo $this->Form->end(); ?>
    
<div id="clearer"></div>

    <?php echo $this->Form->create('Order', array('enctype' => 'multipart/form-data', "url" => array('controller' => 'Orders', 'action' => 'findCustomer'), "inputDefaults" => array('div' => false))); ?>
        <table border="0" width="100%" cellspacing="10" cellpadding="0" align="left">
                <tr>
                      <td style="border-bottom: solid 2px dodgerblue;" align="left">
                          <b><?php echo $this->Paginator->sort('surname', 'Surname'); ?></b>
                      </td>
                    <td style="border-bottom: solid 2px dodgerblue" align="left">
                        <b><?php echo $this->Paginator->sort('first_name', 'First Name'); ?></b>
                    </td>
                    <td style="border-bottom: solid 2px dodgerblue" width="200" align="left">
                        <b><?php echo $this->Paginator->sort('mobile_no', 'Mobile Number'); ?></b>
                    </td>
                    <td style="border-bottom: solid 2px dodgerblue" align="left">
                        <b><?php echo $this->Paginator->sort('work_place', 'Work Place'); ?></b>
                    </td>
                </tr>
                <?php if(isset($customer)){  foreach($customer as $each_item): ?>
                <tr>
                    <td align="left">
                        <?php if(isset($each_item['Customer']['surname'])){ echo $this->Html->link($each_item['Customer']['surname'],"/Reports/searchOrder/".$each_item['Customer']['id'],array("class" => $each_item['Customer']['id'])); } ?>
                    </td>
                    <td align="left" class="orderAnchor">
                        <?php if(isset($each_item['Customer']['first_name'])){ echo $this->Html->link($each_item['Customer']['first_name'],"/Reports/searchOrder/".$each_item['Customer']['id'],array("class" => $each_item['Customer']['id']));} ?>
                    </td> <!-- Link to enable editing -->
                    <td width="200" align="left">
                        <?php if(isset($each_item['Customer']['mobile_no'])){   echo $each_item['Customer']['mobile_no'];} ?>
                    </td>
                    <td width="200" align="left">
                        <?php if(isset( $each_item['Customer']['work_place'])){  echo $each_item['Customer']['work_place']; } ?>
                    </td>

                </tr>
                <?php endforeach; } ?>
                <tr>
                    <td colspan="4" align="right">
                    <?php
                        //echo $this->Form->button('Delete',array("type" => "#","class" => "button_red"));           //check the parameters here
                    ?>
                    </td>
                </tr>
                <tr>
                    <td colspan="6" align="center">
                       <?php
                       echo $this->Paginator->first($this->Html->image('first.png', array('width'=>15, 'height'=>15, 'valign'=>'middle', 'alt'=>'First', 'title'=>'First')), array('escape' => false), null, null, array('class' => 'disabled'))."&nbsp;&nbsp;&nbsp;&nbsp;";
                       echo $this->Paginator->prev($this->Html->image('prev.png', array('width'=>15, 'height'=>15, 'valign'=>'middle', 'alt'=>'Previous', 'title'=>'Previous')), array('escape' => false), null, null, array('class' => 'disabled'))."&nbsp;&nbsp;&nbsp;&nbsp;";
                       echo $this->Paginator->numbers()."&nbsp;&nbsp;";
                       echo $this->Paginator->next($this->Html->image('next.png', array('width'=>15, 'height'=>15, 'valign'=>'middle', 'alt'=>'Next', 'title'=>'Next')), array('escape' => false), null, null, array('class' => 'disabled'))."&nbsp;&nbsp;&nbsp;&nbsp;";
                       echo $this->Paginator->last($this->Html->image('last.png', array('width'=>15, 'height'=>15, 'valign'=>'middle', 'alt'=>'Last', 'title'=>'Last')), array('escape' => false), null, null, array('class' => 'disabled'))."&nbsp;&nbsp;&nbsp;&nbsp;";
                       //prints X of Y, where X is current page and Y is number of pages
                       echo $this->Paginator->counter(array('format' => 'Page %page% of %pages%, showing %current% items out of %count% total'));  
                       ?>
                    </td>
                </tr>
        </table>
    <?php 
        echo $this->Form->end();
    ?>
                    
    <table border="0" width="100%" cellspacing="0" cellpadding="5" align="left">
        <tr>
            <td align="left" valign="top" >&nbsp;</td>
            <td align="left" valign="middle" width="375" >
                <?php 
               // echo $this->Html->link('Next',"/Orders/findOrder2",array("class" => 'button_blue')); 
                ?>
            </td>
            <td align="left" valign="middle" width="375">&nbsp;</td>
        </tr>
    </table>
</div>
<!-- Content ends here -->

<!-- Sidebar starts here -->
     <div id="sidebar">
         <?php 
         echo $this->element('logo');
         echo $this->element('sidebar_hire_purchase'); //Mini Dashboard
          ?>
    </div>
<!-- Sidebar starts here -->
<!-- Footer starts here -->
<?php echo $this->element('footer'); ?>
<!-- Footer starts here -->
