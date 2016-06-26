<?php
echo $this->element('header');
?>

<!-- Content starts here -->
<div id="info">
    <h2>Help</h2>

    <h3>Frequently Asked Questions (FAQ)</h3>
    <p><b>Accounting Equation:</b> Assets = Liabilities + Owner’s Equity (Owner Investment) + Revenues(Income) – Expenses – Drawings (Owner Withdrawal)</p>
    <p><b>Bank Reconciliation Statement:</b> If more than one bank balance is entered on the same date in the Bank Balance submodule of the Accounting module, only the most recently entered balance will be used in generating the Bank Reconciliation Statement. </p>
    <p><b>Stocks/Inventory: </b> Enter total cost of inventory in the Expense/Purchases submodule of the Accounting Module. Enter list of products/items, price and quantity in the Stocks module. When Balance Sheet report is requested, total value remaining stock/inventory will be automatically calculated.</p>
    <p><b>Journal Entries: </b> <span style="color: red;">DO NOT ENTER A NEGATIVE AMOUNT FOR ANY TRANSACTION.</span> Simply select Increase or Decrease. This will be used to determine whether the financial category is Credited or Debited in financial reports.</p>
    <p><b>Accounts Affected in Common Accounting Activities: </b>Please <a href="http://www.qwickpoint.com/guide/accounting_guide.pdf" target="_blank">click here</a> to access the guide for making entries in the accounting module.</p>

    

</div>
<div id="clearer"></div>
</div>
<!-- Content ends here -->

<!-- Sidebar starts here -->
<div id="sidebar">
    <?php
    echo $this->element('logo');
    echo $this->element('sidebar_info');
    ?>
</div>
<!-- Sidebar starts here -->
<!-- Footer starts here -->
<?php echo $this->element('footer'); ?>
<!-- Footer starts here -->