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
                            <td colspan="3" align="left">
                                <table width="100%" align="left" cellspacing="0" cellpadding="5" border="0">
                                    <tr>
                                        <td align="left" valign="top" width="100"><?php echo $this->Html->image('logo.png', array('style'=>'margin-top: 30px;')); ?></td>
                                        <td align="left" >
                                            <h2>ULTIMATE CREDIT SOLUTIONS LTD</h2>
                                            <h3>Trend Indicator as at <?php echo date('d-F-Y'); ?></h3>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" valign="top" colspan="3">&nbsp;</td>
                        </tr>
                        <tr>
                            <th align="left" valign="top" style="border-bottom: solid 2px Gray;">FIXED ASSETS</th>
                            <th align="right" valign="top" style="border-bottom: solid 2px Gray;">DEBIT</th>
                            <th align="right" valign="top" style="border-bottom: solid 2px Gray;">CREDIT</th>
                        </tr>
                        <tr>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">Delivery Truck</td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;">&nbsp;</td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;">42,124.90</td>
                        </tr>
                        <tr>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">Hyundai (H-200)</td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;">&nbsp;</td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;">11,666.70</td>
                        </tr>
                        <tr>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">Land</td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;">&nbsp;</td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;">4,500.00</td>
                        </tr>
                        <tr>
                            <th align="left" valign="top" style="border-bottom: solid 2px Gray;">Total Fixed Assets</th>
                            <th align="right" valign="top" style="border-bottom: solid 2px Gray;">&nbsp;</th>
                            <th align="right" valign="top" style="border-bottom: solid 2px Gray;">124,744.80</th>
                        </tr>
                        <tr>
                            <th align="left" valign="top" style="border-bottom: solid 2px Gray;">CURRENT ASSETS</th>
                            <th align="right" valign="top" style="border-bottom: solid 2px Gray;">&nbsp;</th>
                            <th align="right" valign="top" style="border-bottom: solid 2px Gray;">&nbsp;</th>
                        </tr>
                        <tr>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">Stock</td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;">191,743.00</td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;">&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">Total Trade Debtor</td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;">563,855.96</td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;">&nbsp;</td>
                        </tr>
                        <tr>
                            <th align="left" valign="top" style="border-bottom: solid 2px Gray;">Total Current Assets</th>
                            <th align="right" valign="top" style="border-bottom: solid 2px Gray;">&nbsp;</th>
                            <th align="right" valign="top" style="border-bottom: solid 2px Gray;">75,598.90</th>
                        </tr>
                        <tr>
                            <th align="left" valign="top" style="border-bottom: solid 2px Gray;">Total Assets</th>
                            <th align="right" valign="top" style="border-bottom: solid 2px Gray;">&nbsp;</th>
                            <th align="right" valign="top" style="border-bottom: solid 2px Gray;">880,343.80</th>
                        </tr>
                        <tr>
                            <th align="left" valign="top" style="border-bottom: solid 2px Gray;">LESS CURRENT LIABILITIES</th>
                            <th align="right" valign="top" style="border-bottom: solid 2px Gray;">&nbsp;</th>
                            <th align="right" valign="top" style="border-bottom: solid 2px Gray;">&nbsp;</th>
                        </tr>
                        <tr>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">Investments</td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;">217,898.67</td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;">&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;">Suppliers</td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;">144,649.00</td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;">0.00</td>
                        </tr>
                        <tr>
                            <td align="left" valign="top" style="border-bottom: solid 2px Gray"><h3>BALANCE</h3></td>
                            <td align="right" valign="top" style="border-bottom: solid 2px Gray">&nbsp;</td>
                            <td align="right" valign="top" style="border-bottom: solid 2px Gray"><h3>517,796.10</h3></td>
                        </tr>
                        <tr>
                            <td align="right" valign="top" colspan="3">
                                <p style="font-style: italic;">Accessed on <?php echo date('d-m-Y'); ?></p>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="top" colspan="3">
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
