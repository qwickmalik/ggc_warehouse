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
                            <td colspan="7" align="left">
                                <table width="100%" align="left" cellspacing="0" cellpadding="5" border="0">
                                    <tr>
                                        <td align="left" valign="top" width="100"><?php echo $this->Html->image('logo.png', array('style'=>'margin-top: 30px;')); ?></td>
                                        <td align="left">
                                            <h2>ULTIMATE CREDIT SOLUTIONS LTD</h2>
                                            <h3>Bills Payable Report from [start_date] - [end_date]</h3>
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
                            <td align="left" valign="top" colspan="7">&nbsp;</td>
                        </tr>
                        <tr>
                            <th align="left" valign="top" style="border-bottom: solid 2px Gray;">Date</th>
                            <th align="left" valign="top" style="border-bottom: solid 2px Gray;">Ref. No.</th>
                            <th align="left" valign="top" style="border-bottom: solid 2px Gray;">Payee</th>
                            <th align="left" valign="top" style="border-bottom: solid 2px Gray;">Description</th>
                            <th align="right" valign="top" style="border-bottom: solid 2px Gray;">Bill</th>
                            <th align="right" valign="top" style="border-bottom: solid 2px Gray;">Amount Paid</th>
                            <th align="right" valign="top" style="border-bottom: solid 2px Gray;">Balance</th>
                            
                        </tr>
                        <tr>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">10-Sep-12</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">SUN</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">Sun Electronics</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">Credit Purchases</td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;">14,490.00</td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;">0.00</td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;">14,490.00</td>
                        </tr>
                        <tr>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">11-Sep-12</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">DELI11-Se</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">Delixx Ltd</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">Credit Purchases</td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;">9,725.00</td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;">0.00</td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;">9,725.00</td>
                        </tr>
                        <tr>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">Total Bills Payable</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">3,614.03</td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">0.00</td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">3,614.03</td>
                        </tr>
                        <tr>
                            <td align="right" valign="top" colspan="7">
                                <p style="font-style: italic;">Accessed on <?php echo date('d-m-Y'); ?></p>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="top" colspan="7">
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
