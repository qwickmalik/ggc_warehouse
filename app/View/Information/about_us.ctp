<?php
echo $this->element('header');
?>

<!-- Content starts here -->
<h2>About QwickPoint</h2>

<div id="clearer"></div>
<p>
   <?php echo $this->Html->image('qwickpoint_logo.png', array()); ?>
</p>
<p><b>Version: </b> 2.0 beta</p>
<p>
    This web application was developed and is maintained by <b>QwickFusion</b> in partnership with <b>Consumer Matters Limited </b> a company based in Accra, Ghana, engaged in providing information technology (IT) services and solutions namely, software and website development, web hosting and domain name registration to corporate and other organizations, as well as individuals, to help them meet the needs of operating in this new IT-driven globalized world. 
</p>

<h3>Application Features</h3>

<ul>
    
    <br /><li><b>Client capture and management: </b>Client details are captured once and stored, and can be made available in multiple sections of the application.</li>
    <br /><li><b>Stock management: </b>The application enables management of stocks and ties them with sales, thus eliminating the drudgery of managing suppliers, stocks, sales and the overall accounting activities separately.</li>
    <br /><li><b>Cash Sales: </b>The application enables direct cash sales.</li>
    <br /><li><b>Ordering, invoicing and payment: </b>The application  facilitates order placement, approval, delivery, invoicing and payment in accordance with the workflow of the company. It also enables handling of returned/repossessed goods and their resale.</li>
    <br /><li><b>Accounting: </b>A basic general accounting module has been incorporated to reduce the burden of managing goods sales with other financial activities such as operating costs; expenses on rent, salaries, utilities, etc; injection of additional capital in the form of owners equity, loans, etc.</li>
    <br /><li><b>Customer Relationship Management: </b>Customers can be contacted via auto-generated emails and SMS text messages at stipulated times.</li>
    <br /><li><b>Reports: </b>All past records available with just a few clicks. In very few clicks, monitor the progress of your outlets, marketing executives, etc.</li>
    <br /><li><b>Security: </b>Password protection to ensure unauthorized access to your records. Different levels of access for users and audit trails have been put in place to ensure that records are not tampered with without approval.</li>
    <br /><li><b>Accessibility: </b>The application runs over the internet and is therefore accessible anywhere in the world once there is internet access.</li>
</ul>


<h3>Contact Us</h3>
<ul style="list-style: none;">
    <li>P.O. Box OS 729, Osu, Accra, Ghana</li>
    <li>+233-24-6335380</li>
    <li>+233-24-3080560</li>
    <li> <a href="http://www.qwickfusion.com" target="_blank">www.qwickfusion.com</a></li>
    <li>info@qwickfusion.net</li>
</ul>



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