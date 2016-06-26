            <?php 
            echo $this->element('header_report'); 
            echo $this->Html->script('notification.js');
            if ($this->Session->check('shopCurrency')) {
    $shopCurrency = $this->Session->read('shopCurrency');
} else {
    $shopCurrency = "";
}
            ?>
            
            <!-- Content starts here -->
                <div id="content">
                    <table width="100%" align="left" cellspacing="0" cellpadding="5" border="0">
                        <tr>
                            <td colspan="5" align="left">
                                <table width="100%" align="left" cellspacing="0" cellpadding="5" border="0">
                                    <tr>
                                        <td align="left" valign="top" width="100"><?php echo $this->Html->image('logo.png', array('style'=>'margin-top: 30px;')); ?></td>
                                        <td align="left">
                                            <h2>ULTIMATE CREDIT SOLUTIONS LTD</h2>
                                            <h3>Location Stock Balances Report from [start_date] - [end_date]</h3>
                                        </td>
                                    </tr>
                                </table>
                                <table cellspacing="10" cellpadding="0" width="100%" border="0" style="background: #fafad2;">
                                    <?php echo $this->Form->create('BalanceSheet', array("url" => array('controller' => 'Reports', 'action' => 'financialPosition'))); ?>
                                <tr>
                                    <th align="center">Start Date</th>
                                    <th align="center">End Date</th>
                                    <th align="center">&nbsp;</th>
                                    <th align="center">&nbsp;</th>
                                </tr>
                                <tr>
                                    <td align="center" valign="top">
                                        <?php 
                                            echo $this->Form->input('begin_date',array('type' => 'date','dateFormat' =>'DMY', 'label'=>false));                                
                                            ?>
                                    </td>
                                    <td align="center" valign="top">
                                        <?php 
                                            echo $this->Form->input('finish_date',array('type' => 'date','dateFormat' =>'DMY', 'label'=>false));                                
                                            ?>
                                    </td>
                                    <td align="center" valign="top">
                                        <input type="hidden" name="data[Setting][from]" id="dtFrom" />
                                    </td>
                                    <td align="right" valign="top">
                                        <?php
                                        echo $this->Form->button('View', array("type" => "submit", "class" => "button_green", "id" => "balinterrimBTN"));
                                        ?>
                                    </td>
                                </tr>
                                
                                <?php echo $this->Form->end(); ?>
                            </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" valign="top" colspan="5">&nbsp;</td>
                        </tr>
                        <tr>
                            <th align="left" valign="top" style="border-bottom: solid 2px Gray;">Item No.</th>
                            <th align="right" valign="top" style="border-bottom: solid 2px Gray;">Description</th>
                            <th align="right" valign="top" style="border-bottom: solid 2px Gray;">Location</th>
                            <th align="right" valign="top" style="border-bottom: solid 2px Gray;">Balance</th>
                            <th align="right" valign="top" style="border-bottom: solid 2px Gray;">Date Closed</th>
                        </tr>
                        <tr>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">MATRESS-8-H/D</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">Matress-8-H/D-Doublebed (Latex)</td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;">Main</td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;">0</td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;">30-Sep-12</td>
                        </tr>
                        <tr>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">RICE</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">Rice Cooker-10Cups</td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;">Hoehoe</td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;">-1</td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;">30-Sep-12</td>
                        </tr>
                        <tr>
                            <td align="right" valign="top" colspan="5">
                                <p style="font-style: italic;">Accessed on <?php echo date('d-m-Y'); ?></p>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="top" colspan="5">
                                <?php 
                                echo $this->Html->link('Print',"javascript:void(0)",array("class" => 'button_red',"id" => "print_receipt")); 
                                ?>
                            </td>
                        </tr>
                    </table>
                    
                </div>
            <!-- Content ends here -->
            <!-- Sidebar starts here -->
                 <div id="sidebar_reports">
                     <?php 
                     echo $this->element('logo');
                     echo $this->element('reports_sidebar');
                      ?>
                 </div>
            <!-- Sidebar starts here -->
               
                        <?php echo $this->element('footer'); ?>
