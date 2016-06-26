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
                    <table id="report_content" width="100%" align="left" cellspacing="0" cellpadding="5" border="0">
                        <tr>
                            <td align="left" valign="top" width="100"><?php echo $this->Html->image('logo.png', array('style'=>'margin-top: 30px;')); ?></td>
                            <td align="left" colspan="4">
                                <h2>ULTIMATE CREDIT SOLUTIONS LTD</h2>
                                <h3>Expected Installment Due Report - <?php  echo date('F, Y'); ?></h3>
                            </td>
                        </tr>
                        <tr style="background: #fafad2;">
            
            <td align="left" valign="top" colspan="7">
                
                <?php echo $this->Form->create('Order', array('enctype' => 'multipart/form-data', "url" => array('controller' => 'Reports', 'action' => 'expectedInstallment'), "inputDefaults" => array('div' => false))); ?> 
                    <table cellspacing="10" cellpadding="0" width="100%" border="0" style="">  
                    <tr>
                        <td align="center"><b>Start Date</b></td>
                        <td align="center"><b>End Date</b></td>
                        <td align="center"><b>&nbsp;</b></td>
                        <td align="center"><b>&nbsp;</b></td>
                        <td align="center"><b>&nbsp;</b></td>
                    </tr>
                    <tr>
                        <td align="center" valign="top">
                            <?php
                            echo $this->Form->input('begin_date', array('type' => 'date', 'dateFormat' => 'DMY', 'label' => false));
                            ?>
                        </td>
                        <td align="center" valign="top">
                            <?php
                            echo $this->Form->input('finish_date', array('type' => 'date', 'dateFormat' => 'DMY', 'label' => false));
                            ?>
                        </td>
                        <td align="center">&nbsp;</td>
                        <td align="center"><input type="hidden" name="data[Setting][from]" id="dtFrom" /></td>
                        <td align="center">
                            <?php
                            echo $this->Form->button('View', array("type" => "submit", "class" => "button_green"));
                            ?>
                        </td>
                    </tr>
                  </table>
                <?php echo $this->Form->end(); ?>
            </td>
        </tr>
        <tr>
            <td align="left" valign="top" colspan="7">&nbsp;</td>
        </tr>
                        <tr>
                            <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('due_date', 'Due Date'); ?></th>
                            <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('fullname', 'Customer'); ?></th>
                            <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('work_place', 'Institution'); ?></th>
                            <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('mthly_install', 'Installment'); ?></th>
                            <th align="left" valign="top" style="border-bottom: solid 2px Gray;"><?php echo $this->Paginator->sort('amount_paid', 'Paid'); ?></th>
                        </tr>
                         <?php if(isset($accounts)){ foreach($accounts as $each_item): ?> 
                        <tr>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php if(isset( $each_item['Order']['due_date'])){echo $each_item['Order']['due_date'];} ?></td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php if(isset( $each_item['Customer']['fullname'])){echo $each_item['Customer']['fullname'];} ?></td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php if(isset( $each_item['Customer']['work_place'])){echo $each_item['Customer']['work_place'];} ?></td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php if(isset( $each_item['Order']['mthly_install'])){echo round($each_item['Order']['mthly_install'],0);} ?></td>
                            <td align="left" valign="top" style="border-bottom: solid 1px #eaeaea;"><?php if(isset( $each_item['Order']['amount_paid'])){echo round($each_item['Order']['amount_paid'],0);} ?></td>
                        </tr>
                         <?php endforeach;} ?>
                         <?php if (isset($total)) {
            foreach ($total as $each_item):
                ?>
                <tr>
                    <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">Total</td>
                    
                    <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                    <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;">&nbsp;</td>
                    <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;"><?php
                if (isset($each_item[0]['balinstalmt'])) {
                    echo $shopCurrency . ' ' . round($each_item[0]['balinstalmt'], 0);
                }
                ?></td>
                    <td align="left" valign="top" style="border-bottom: solid 1px #ffffff; background: #eaeaea; font-weight: bold;"><?php
                if (isset($each_item[0]['paidtotal'])) {
                    echo $shopCurrency . ' ' . round($each_item[0]['paidtotal'], 0);
                }
                ?></td>
                </tr>
                    <?php endforeach;
                }
                ?>
                        <tr>
                            <td align="left" valign="top">&nbsp;</td>
                            <td align="left" valign="top">&nbsp;</td>
                            <td align="left" valign="top">&nbsp;</td>
                            <td align="left" valign="top">&nbsp;</td>
                            <td align="right" valign="top">
                                <p style="font-style: italic;">Accessed on <?php echo date('d-m-Y'); ?></p>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" valign="top"></td>
                            <td align="left" valign="top"></td>
                            <td align="left" valign="top"></td>
                            <td align="left" valign="top"></td>
                            <td align="right" valign="top">
                                <?php 
                                echo $this->Html->link('Print',"javascript:void(0)",array("class" => 'button_red',"id" => "print_report")); 
                                ?>
                            </td>
                        </tr>
                        <tr>
                                <td colspan="7" align="center">
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