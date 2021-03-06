<?php
$username = "Unknown";
$userid = null;
if ($this->Session->check('userData')) {
    $username = $this->Session->read('userData');
    $username = ucwords(strtolower($username));
} else {
    $username = "Unknown";
    $username = ucwords(strtolower($username));
}
if ($this->Session->check('userDetails.id')) {
    $userid = $this->Session->read('userDetails.id');
    $user = $this->Session->read('userDetails');
}
date_default_timezone_set('Africa/Accra');
$date = date('g:ia');
?>

<div id="top_menu">
    <?php
    $panel_menu = array(
    ($user['usertype_id'] == 1 || $user['usertype_id'] ==3 || $user['usertype_id'] == 4 || $user['usertype_id'] ==6 || $user['usertype_id'] ==7 || $user['usertype_id'] ==8 || $user['usertype_id'] ==9 
            || $user['usertype_id'] == 10 ? $this->Html->link('Dashboard', '/Dashboard/', array('escape' => false,)) :'' ),
//         ($user['usertype_id'] == 1 || $user['usertype_id'] ==3 || $user['usertype_id'] == 4  || $user['usertype_id'] == 5 || $user['usertype_id'] ==6 || $user['usertype_id'] == 7 || $user['usertype_id'] ==8 ? $this->Html->link('Cash Sales', '/Sales/', array('escape' => false)) :'' ),
//  
//       ($user['usertype_id'] == 1 || $user['usertype_id'] ==3 || $user['usertype_id'] == 4  || $user['usertype_id'] == 5 || $user['usertype_id'] ==6 || $user['usertype_id'] == 7 || $user['usertype_id'] ==8 ? $this->Html->link('Orders', '/HirePurchase/', array('escape' => false)) :'' ),
//  
//        ($user['usertype_id'] == 1 || $user['usertype_id'] ==7 || $user['usertype_id'] == 8 || $user['usertype_id'] == 10 ? $this->Html->link('Warehousing', '/Stocks/stock_dashboard/', array('escape' => false)) :'' ),
//        ($user['usertype_id'] == 1 || $user['usertype_id'] == 9 || $user['usertype_id'] == 7 ? $this->Html->link('Accounting', '/Accounting/', array('escape' => false)) :'' ),
//        ($user['usertype_id'] == 1 ? $this->Html->link('CRM', '/Customers/', array('escape' => false)) :'' ),
//       ($user['usertype_id'] == 1 || $user['usertype_id'] == 7 ?  $this->Html->link('Reports', '/Reports/', array('escape' => false)) :'' ),
       ($user['usertype_id'] == 1 ? $this->Html->link('Settings', '/Settings/', array('escape' => false)) :'' ),
        $this->Html->link('Logout', '/Users/logout', array("class" => "logout")),
        '<span style="color: #fff; margin-left: 10px;"><b>' . $this->Html->link($username, '/Users/editUser/'.$userid, array("class" => "user")) . '</b> is logged in</span>',
        '<span style="color: #fff; margin-left: 30px;"><b>Page accessed at </b>' . $date . '</span>'
    );
    echo $this->Html->nestedList($panel_menu);
    ?>
</div>
<div id="content_body" >
    <div id="container">
        <!-- Content starts here -->
        <div id="content">
    
        <!-- Notifications start here -->
        <?php
        if ($this->Session->check('bmsg')) {
            $errorMessage = $this->Session->read('bmsg');
            ?>
            <div class="alert alert-warning">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <h4>Notice!</h4>
                <?php echo $errorMessage; ?>
            </div>
            <?php
            $this->Session->delete('bmsg');
        } else if ($this->Session->check('emsg')) {
            $errorMessage = $this->Session->read('emsg');
            ?>
            <div class="alert alert-danger">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <h4>Warning!</h4>
                <?php echo $errorMessage; ?>
            </div>
            <?php
            $this->Session->delete('emsg');
        } else if ($this->Session->check('smsg')) {
            $Message = $this->Session->read('smsg');
            ?>
            <div class="alert alert-success">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <h4>Success!</h4>
                <?php echo $Message; ?>
            </div>
            <?php
            $this->Session->delete('smsg');
        } else if ($this->Session->check('imsg')) {
            $Message = $this->Session->read('imsg');
            ?>
            <div class="alert alert-info">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <h4>Info!</h4>
                <?php echo $Message; ?>
            </div>
            <?php
            $this->Session->delete('imsg');
        }
        ?>
        <!-- Notifications end here -->
        





