<?php
echo $this->element('header');
?>

    <h2>SETTINGS: Company Setup</h2>
    <p>&nbsp;</p>

    <?php echo $this->Form->create('Setting', array("url" => array('controller' => 'Settings', 'action' => 'setup'))); ?>
    <div class="row">
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <?php
            echo $this->Form->input('company_name', array("value" => $setupResults['Setting']['company_name']));
            echo $this->Form->input('owner_name', array("value" => $setupResults['Setting']['owner_name']));
            echo $this->Form->input('location', array("value" => $setupResults['Setting']['location']));
            echo $this->Form->input('postal_address', array("value" => $setupResults['Setting']['postal_address']));
            echo $this->Form->input('postal_town_suburb', array('label' => 'Postal Town/Suburb', "value" => $setupResults['Setting']['postal_town_suburb']));
            echo $this->Form->input('postal_city', array("value" => $setupResults['Setting']['postal_city']));
            echo $this->Form->input('postal_country', array('label' => 'Country', "value" => $setupResults['Setting']['postal_country']));
            echo $this->Form->input('telephone', array("value" => $setupResults['Setting']['telephone']));
            echo $this->Form->input('mobile', array('label' => 'Mobile Phone', "value" => $setupResults['Setting']['mobile']));
            echo $this->Form->input('email', array("value" => $setupResults['Setting']['email']));
            ?>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <?php
            echo $this->Form->input('inventory_acc_id', array('required','label' => 'Inventory Account/Repository*', 'options' => $accounts, 'empty' => '--Please Select--',"selected" => $setupResults['Setting']['inventory_acc_id']));
            echo $this->Form->input('sales_acc_id', array('required','label' => 'Sales Account/Repository*', 'options' => $accounts, 'empty' => '--Please Select--',"selected" => $setupResults['Setting']['sales_acc_id']));

            $curr = $setupResults['Setting']['currency_id'];
            if (!empty($curr)) {
                $emtpy = 1;
                switch ($curr) {
                    case 1:
                        $empty = "Ghana Cedi";
                        break;
                    case 2:
                        $empty = "US Dollar";
                        break;
                    case 3:
                        $empty = "Pound Sterling";
                        break;
                }
            }
            echo $this->Form->input('currency_id', array('empty' => "--Please Select a Currency--", 'selected' => $curr));
            ?>

            <?php
            $month = date('m', strtotime($setupResults['Setting']['accounting_month']));
            $day = date('d', strtotime($setupResults['Setting']['accounting_month']));
            $Year = date('Y', strtotime($setupResults['Setting']['accounting_month']));
            ?>
            <input type="hidden" id="month" value="<?php echo $month; ?>"/>
            <input type="hidden" id="day" value="<?php echo $day; ?>"/>
            <input type="hidden" id="year" value="<?php echo $Year; ?>"/>

            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <?php echo '<span style="font-size: 13px; font-weight: bold;">Accounting Year Ends</span>'; ?>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <?php echo $this->Form->day('accounting_month', array("selected" => $day, 'empty' => $day)); ?>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <?php echo $this->Form->month('accounting_month', array("selected" => $month, 'empty' => $month)); ?>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <?php echo $this->Form->year('accounting_month', 2000, date('Y'), array("hidden" => true)); ?>
                </div>
            </div>
            <script>
                var day = $("#day").val();
                var month = $("#month").val();
                var year = $("#year").val();
                $("#SettingAccountingMonthDay option[value=" + day + "]").attr('selected', true);
                $("#SettingAccountingMonthMonth option[value=" + month + "]").attr('selected', true);
                $("#SettingAccountingMonthYear option[value=" + year + "]").attr('selected', true);
            </script>
            
            <?php
            echo $this->Form->button('Save Details', array("type" => "submit", "class" => "btn btn-md btn-success", "id" => "company_submit")); 
            ?>
            <?php echo $this->Form->end(); ?>
        </div>
        
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <br /><br /><br /><br /><br /><br />
            <?php 
            echo $this->Form->create('Setting', array('enctype' => 'multipart/form-data', 'type' => 'file', "url" => array('controller' => 'Settings', 'action' => 'logoUpload'))); 
            
            
             
          
                echo $this->Form->input('logo', array('label' => 'Company Logo', 'type' => 'file'));
                echo '<br /><i>Ideal size is 120x55px</i><br />';
                
                echo $this->Html->image('logo.png', array()); 
                
                echo $this->Form->button('Upload', array("type" => "submit", "class" => "btn btn-md btn-success", 'style' => 'float: right;')); //check the parameters here
                echo $this->Form->end(); 
                
                ?>
        </div>
        
    </div>

    

    
    <div id="clearer"></div>
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