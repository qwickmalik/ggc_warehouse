            <?php 
            echo $this->element('header_report'); 
            echo $this->Html->script('notification.js');
            if ($this->Session->check('shopCurrency')) {
                $shopCurrency = $this->Session->read('shopCurrency');
            } else {
                $shopCurrency = "";
            }

            if (isset($start_date)) {
                        $sdate = $start_date;
                    } else {
                        $sdate = "[start_date]";
                    }

                    if (isset($end_date)) {
                        $edate = $end_date;
                    } else {
                        $edate = "[end_date]";
                    }
            ?>
            
            <!-- Content starts here -->
                <div id="content">
                    <table id="report_content" width="100%" align="left" cellspacing="0" cellpadding="5" border="0">
                        <tr>
                            <td colspan="6" align="left">
                                <table width="100%" align="left" cellspacing="0" cellpadding="5" border="0">
                                    <tr>
                                        <td align="left" valign="top" width="100"><?php echo $this->Html->image('logo.png', array('style'=>'margin-top: 30px;')); ?></td>
                                        <td align="left">
                                            <h2>ULTIMATE CREDIT SOLUTIONS LTD</h2>
                                            <h3>Sales Summary Report from <?php echo $sdate; ?> - <?php echo $edate; ?></h3>
                                        </td>
                                    </tr>
                                </table>
                                <table cellspacing="10" cellpadding="0" width="100%" border="0" style="background: #fafad2;">
                                    <?php echo $this->Form->create('OrdersItem', array("url" => array('controller' => 'Reports', 'action' => 'salesSummary'))); ?>
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
                                        echo $this->Form->button('View', array("type" => "submit", "class" => "button_green"));
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
                            <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('invoice_no', 'Invoice No.'); ?></th>
                            <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('fullname', 'Customer'); ?></th>
                            <th align="right" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('selling_price', 'Amount'); ?></th>
                            <th align="right" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('discount', 'Discount'); ?></th>
                            <th align="right" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('hp_price', 'Bill'); ?></th>
                            <th align="right" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('order_date', 'Date Sold'); ?></th>
                        </tr>
                        <?php if (isset($accounts)) {
    foreach ($accounts as $each_item):
        ?>
                        <tr>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
        if (isset($each_item['Order']['invoice_no'])) {
            echo $each_item['Order']['invoice_no'];
        }
        ?></td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
        if (isset($each_item['Customer']['fullname'])) {
            echo $each_item['Customer']['fullname'];
        }
        ?></td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
        if (isset($each_item[0]['cash'])) {
            echo round($each_item[0]['cash'], 2);
        }
        ?></td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
        if (isset($each_item['Order']['discount'])) {
            echo $each_item['Order']['discount'].'%';
        }
        ?></td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
        if (isset($each_item['OrdersItem']['hp_price'])) {
            echo round($each_item['OrdersItem']['hp_price'], 2);
        }
        ?></td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php
        if (isset($each_item['Order']['order_date'])) {
           $date = strtotime($each_item['Order']['order_date']);
            echo date('d-M-Y', $date);
        }
        ?></td>
                        </tr>
                       <?php endforeach;
                }
                ?>
                     
                          <?php if (isset($total)) {
            foreach ($total as $each_item):
                ?>
                        <tr>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">Totals</td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;"><?php
                if (isset($each_item[0]['total_cash'])) {
                    echo $shopCurrency . ' ' . round($each_item[0]['total_cash'], 2);
                }
                ?></td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;"><?php
                if (isset($each_item[0]['total_discount'])) {
                    echo $each_item[0]['total_discount'].'%';
                }
                ?></td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;"><?php
                if (isset($each_item[0]['total_hp_price'])) {
                    echo $shopCurrency . ' ' . round($each_item[0]['total_hp_price'], 2);
                }
                ?></td>
                            <td align="right" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                        </tr>
                         <?php endforeach;
                }
                ?>
                        <tr>
                            <td align="right" valign="top" colspan="6">
                                <p style="font-style: italic;">Accessed on <?php echo date('d-m-Y'); ?></p>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="top" colspan="6">
                                <?php 
                                echo $this->Html->link('Print',"javascript:void(0)",array("class" => 'button_red',"id" => "print_report")); 
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
