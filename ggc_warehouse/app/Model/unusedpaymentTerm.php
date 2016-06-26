<?php
class PaymentTerm extends AppModel {
    var $name = 'PaymentTerm';
    var $usesTable = 'payment_terms';
     var $virtualFields = array("monthly_rates"=>"CONCAT(payment_name, ' - ' ,interest_rate,'%')");
    var $displayField = 'monthly_rates';
        
     var $hasMany = array(
        'Order' => array(
            'className' => 'Order',
            'foreignKey' => 'paymentterm_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ));
}

?>
