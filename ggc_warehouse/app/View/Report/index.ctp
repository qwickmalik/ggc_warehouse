<?php
echo $this->element('header');
?>
<!-- Content starts here -->
<h1>Reports</h1>
<div id="clearer"></div>
<table width="100%" align="left" cellspacing="0" cellpadding="5" border="0">
    <tr>
        <td align="left" width="32%" valign="top">

            <?php
            echo "<h3>Payments & Installments Reports</h3>";
//            echo $this->Html->link('Active Accounts', '/Reports/activeAccounts', array('escape' => false)) . "<br />";
            echo $this->Html->link('Customer Payment Details', '/Reports/customerpaymentDetails1', array('escape' => false)) . "<br />";
            // echo $this->Html->link('Expected Installment Due Report','/Reports/expectedInstallment', array('escape' => false))."<br />";
//            echo $this->Html->link('New Expected Installment Due Report', '/Reports/expectedInstallment1', array('escape' => false)) . "<br />";
//            //  echo $this->Html->link('Expected Installment Due Report for Zone','/Reports/expectedInstallmentZone', array('escape' => false))."<br />";
//            echo $this->Html->link('New Expected Installment Due Report for Zone', '/Reports/expectedInstallmentZone1', array('escape' => false)) . "<br />";
            echo $this->Html->link('Customer Order Details', '/Reports/customerOrderDetails', array('escape' => false));
            
            echo "<h3>Performance Reports</h3>";
            echo $this->Html->link('Group Sales Report by Attendants', '/Reports/groupSales', array('escape' => false)) . "<br />";
            echo $this->Html->link('Sales Executive Sales Report for Client', '/Reports/salesExecClient', array('escape' => false)) . "<br />";
            echo $this->Html->link('Sales Executives with Highest Defaults', '/Reports/salesExecDefaults', array('escape' => false)) . "<br />";
            echo $this->Html->link('Sales Executive Summary Report', '/Reports/salesExecSummary', array('escape' => false)) . "<br />";
            echo $this->Html->link('Summary Payment Report by Collector', '/Reports/summPaymentCollector', array('escape' => false)) . "<br />";
            echo $this->Html->link('Summary Zonal Performance Report', '/Reports/summZonal', array('escape' => false)) . "<br />";
            echo $this->Html->link('Zonal Sales Report', '/Reports/zonalSales', array('escape' => false)) . "<br />";
            
            echo "<h3>Purchases</h3>";
            echo $this->Html->link('Monthly Sales Summary', '/Reports/monthlySalesSummary', array('escape' => false)) . "<br />";
            echo $this->Html->link('Purchases Report', '/Reports/purchases', array('escape' => false)) . "<br />";
            echo $this->Html->link('Sales Details Report', '/Reports/salesDetails', array('escape' => false)) . "<br />";
            echo $this->Html->link('Cash Sales Summary Report', '/Reports/salesSummary', array('escape' => false)) . "<br />";
            ?>
        </td>
        <td align="left" width="32%" valign="top">
            <?php
            echo "<h3>Stocks & Suppliers Reports</h3>";
            echo $this->Html->link('Zonal Item Sold Report', '/Reports/itemSalesBranch', array('escape' => false)) . "<br />";
            //echo $this->Html->link('Bills Payment to Suppliers','/Reports/billsPaymentSuppliers', array('escape' => false))."<br />";*/
//            echo $this->Html->link('Supplier Transaction Summary', '/Reports/suppliers', array('escape' => false)) . "<br />";
            echo $this->Html->link('Stock Remaining', '/Reports/stockRemItems/', array('escape' => false)) . "<br />";
            echo $this->Html->link('Stock Remaining Details', '/Reports/stockRemItemDetails/', array('escape' => false)) . "<br />";
            echo $this->Html->link('Stock Transfers', '/Reports/stockTransfers/', array('escape' => false)) . "<br />";
            echo $this->Html->link('Items Delivery Report', '/Reports/itemsDelivery', array('escape' => false)) . "<br />";
            /* echo $this->Html->link('Location Stock Balances Report1','/Reports/locStockBal1', array('escape' => false))."<br />";
              echo $this->Html->link('Location Stock Balances Report2','/Reports/locStockBal2', array('escape' => false))."<br />";
              echo $this->Html->link('Suppliers Closing Balances Report','/Reports/suppClosingBal', array('escape' => false))."<br />"; */

            echo "<h3>Debtors Reports</h3>";
            echo $this->Html->link('All Debtors Report by Invoice', '/Reports/allDebtors', array('escape' => false)) . "<br />";
            echo $this->Html->link('Debtors Ageing Report', '/Reports/debtorsAgeing', array('escape' => false)) . "<br />";
            echo $this->Html->link('Debtors Closing Balances Report', '/Reports/debtorsClosingBal', array('escape' => false)) . "<br />";
            echo $this->Html->link('Finish Payment Report', '/Reports/finishPayment', array('escape' => false)) . "<br />";
            ?>
        </td>
        <td align="left" width="32%" valign="top">
            <?php
            echo "<h3>Financial Statements</h3>";
//                echo $this->Html->link('Cash Accounts Summary By Acct Headings', '/Reports/summByHeading', array('escape' => false)) . "<br />";
//                echo $this->Html->link('Zonal PettyCash Summ.', '/Reports/pettycashSummByZone', array('escape' => false));
            echo $this->Html->link('Statement of Income', '/Reports/incomeStatement', array('escape' => false)) . "<br />";
            echo $this->Html->link('Statement of Owners Equity', '/Reports/ownersEquity', array('escape' => false)) . "<br />";
            echo $this->Html->link('Trial Balance', '/Reports/trialBalance', array('escape' => false)) . "<br />";
            echo $this->Html->link('Balance Sheet', '/Reports/balanceSheet', array('escape' => false)) . "<br />";
            echo $this->Html->link('Bank Reconciliation Statement', '/Reports/bankReconciliation', array('escape' => false)) . "<br />";
            echo $this->Html->link('Journal', '/Reports/journal', array('escape' => false)) . "<br />";
            echo $this->Html->link('General Ledger', '/Reports/generalLedger', array('escape' => false)) . "<br />";
            // echo $this->Html->link('Trend Indicator','/Reports/trendIndicator', array('escape' => false))."<br />";
            ?>
        </td>
    </tr>
</table>

</div>
<!-- Content ends here -->
<!-- Sidebar starts here -->
<div id="sidebar">
    <?php
    echo $this->element('logo');
    ?>
</div>
<!-- Sidebar starts here -->

<?php echo $this->element('footer'); ?>