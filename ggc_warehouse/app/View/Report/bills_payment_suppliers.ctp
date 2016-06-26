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
                            <td colspan="6" align="left">
                                <table width="100%" align="left" cellspacing="0" cellpadding="5" border="0">
                                    <tr>
                                        <td align="left" valign="top" width="100"><?php echo $this->Html->image('logo.png', array('style'=>'margin-top: 30px;')); ?></td>
                                        <td align="left">
                                            <h2>ULTIMATE CREDIT SOLUTIONS LTD</h2>
                                            <h3>Bills Payment to Suppliers Report from [start_date] - [end_date]</h3>
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
                            <td align="left" valign="top" colspan="6">&nbsp;</td>
                        </tr>
                        <tr>
                            <th align="left" valign="top" style="border-bottom: solid 2px Gray;">Date</th>
                            <th align="left" valign="top" style="border-bottom: solid 2px Gray;">Account Name</th>
                            <th align="right" valign="top" style="border-bottom: solid 2px Gray;">Amt. Paid</th>
                            <th align="left" valign="top" style="border-bottom: solid 2px Gray;">Pmt. Mode</th>
                            <th align="left" valign="top" style="border-bottom: solid 2px Gray;">Cheque No.</th>
                            <th align="left" valign="top" style="border-bottom: solid 2px Gray;">Bank</th>
                        </tr>
                        <tr>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">11-Sep-12</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">Shree Balaji</td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;">8,500.00</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">Cash</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">&nbsp;</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">11-Sep-12</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">Rowi Ltd</td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;">1,524.00</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">Cash</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">&nbsp;</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">Total</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">55,100.00</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right" valign="top" colspan="6">
                                <p style="font-style: italic;">Accessed on <?php echo date('d-m-Y'); ?></p>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="top" colspan="6">
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
