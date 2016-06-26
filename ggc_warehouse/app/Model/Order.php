<?php

class Order extends AppModel {

    var $name = "Order";
    var $usesTable = "orders";
    
    var $belongsTo = array(
        'Customer' => array(
            'className' => 'Customer',
            'foreignKey' => 'customer_id',
            'conditions' => '',
            'order' =>  array('Customer.fullname' => 'asc'),
            'limit' => '',
            'dependent' => true
        ),
        'Rate' => array(
            'className' => 'Rate',
            'foreignKey' => 'rate_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
        ),
        'Zone' => array(
            'className' => 'Zone',
            'foreignKey' => 'zone_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ));
    
    var $hasMany = array(
        'Expectedpayment' => array(
            'className' => 'Expectedpayment',
            'foreignKey' => 'order_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
        ),
        'Expectedinstallment' => array(
            'className' => 'Expectedinstallment',
            'foreignKey' => 'order_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
        ),
        'ClosingBalance' => array(
            'className' => 'ClosingBalance',
            'foreignKey' => 'order_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
        ),
        'OrdersItem' => array(
            'className' => 'OrdersItem',
            'foreignKey' => 'order_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
        ),
        'Repossession' => array(
            'className' => 'Repossession',
            'foreignKey' => 'order_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
        ),
        'Invoice' => array(
            'className' => 'Invoice',
            'foreignKey' => 'order_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
        ),
        'Payment' => array(
            'className' => 'Payment',
            'foreignKey' => 'order_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
        ),
        'InvoiceoldEdition' => array(
            'className' => 'InvoiceoldEdition',
            'foreignKey' => 'order_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
        )
    );

//     var $belongsTo = array(
//        'Supplier' => array(
//            'className' => 'Supplier',
//            'foreignKey' => 'supplier_id',
//            'conditions' => '',
//            'order' => '',
//            'limit' => '',
//            'dependent' => true
//            ),
//            'Item' => array(
//                'className' => 'Item',
//                'foreignKey' => 'item_id',
//                'conditions' => '',
//                'order' => '',
//                'limit' => '',
//                'dependent' => true
//                )
//         );
//     
//      var $hasMany = array(
//        'CreditPayment' => array(
//            'className' => 'CreditPayment',
//            'foreignKey' => 'creditor_id',
//            'conditions' => '',
//            'order' => '',
//            'limit' => '',
//            'dependent' => true
//            )
//          );
//    function getCreditor($supplier = 0){
//        //select all records from creditors table where balance is greater than zero
//        
//        $this->id = $supplier;
//        $result = $this->find('first',array('conditions' => array('Creditor.id' => $supplier)));
//        return $result;
//  
//    }

    function runDailyDefaulters($default_date) {
        $orders = $this->find('all', array('conditions' => array('AND' => array(array('Order.payment_status !=' => 'full_payment'), array('Order.delivery' => 'Delivered')))));

        foreach ($orders as $order) {
            $next_due = $order['Order']['due_date'];
            $order_id = $order['Order']['id'];
            $last_paymt = $order['Order']['last_date'];
            $previous_day = new DateTime($default_date);
            $previous_day->sub(new DateInterval('P1D'));
            $todate = new DateTime($next_due);
            $todate->add(new DateInterval('P15D'));
            $expire_date = new DateTime($next_due);
            $expire_date->add(new DateInterval('P30D'));
            $due_date = new DateTime($next_due);
            $payment_status = $order['Order']['payment_status'];
            $balance = $order['Order']['balance'];
            $old_accrued = $order['Order']['interest_accrued'];
            $order_details = array();
            //check if the last payment and then add 30days to next due..if 30days+nextdue == previous day..then expired
            //get expected installments for order
            $installments = $this->Expectedinstallment->find('first', array('conditions' => array('Expectedinstallment.order_id' => $order_id), 'order' => array('Expectedinstallment.id DESC')));


            if ($next_due >= $last_paymt) {
                if ($payment_status != 'expired') {
                    if (($previous_day->format('Y-m-d') >= $expire_date->format('Y-m-d'))) {
                        //($this->Session->check('interest') != false){$interest_rate = $this->Session->read('interest');}else{$interest_rate = 0;}
                        $interest_rate = 10;
                        $balance = $order['Order']['balance'];
                        $old_accrued = $order['Order']['interest_accrued'];
                        $calc_interest = $balance * ($interest_rate / 100);
                        $new_balance = $balance + $calc_interest;
                        $new_accrued = $old_accrued + $calc_interest;
                        $due_date->add(new DateInterval('P1M'));
                        $order_details = array('id' => $order_id, 'balance' => $new_balance, 'interest_accrued' => $new_accrued, 'payment_status' => 'expired', 'due_date' => $due_date->format('Y-m-d'));
                        $this->save($order_details);
                    }
                } elseif ($payment_status == 'expired') {
                    if (($previous_day->format('Y-m-d') >= $expire_date->format('Y-m-d'))) {
                        $interest_rate = 10;
                        $balance = $order['Order']['balance'];
                        $old_accrued = $order['Order']['interest_accrued'];
                        $calc_interest = $balance * ($interest_rate / 100);
                        $new_balance = $balance + $calc_interest;
                        $new_accrued = $old_accrued + $calc_interest;
                        $due_date->add(new DateInterval('P1M'));
                        $order_details = array('id' => $order_id, 'balance' => $new_balance, 'interest_accrued' => $new_accrued, 'due_date' => $due_date->format('Y-m-d'));
                        $this->save($order_details);
                    }
                }
            } elseif ($previous_day->format('Y-m-d') >= $todate->format('Y-m-d')) {
                if ($payment_status != 'expired') {
                    //($this->Session->check('interest') != false){$interest_rate = $this->Session->read('interest');}else{$interest_rate = 0;}
                    if ($installments) {

                        while ($previous_day->format('Y-m-d') >= $due_date->format('Y-m-d')) {
                            $interest_rate = 10;
                            $installment = $order['Order']['mthly_install'];
                            $balance = $order['Order']['balance'];


                            $calc_interest = $installment * ($interest_rate / 100);
                            $new_balance = $balance + $calc_interest;
                            $new_accrued = $old_accrued + $calc_interest;
                            if ($last_paymt != $default_date) {
                                $due_date->add(new DateInterval('P1M'));
                            }
                            $order_details = array('id' => $order_id, 'balance' => $new_balance, 'due_date' => $due_date->format('Y-m-d'), 'interest_accrued' => $new_accrued);
                            $this->saveAll($order_details);
                            
                            $expectedinstall2 = array('order_id' => $order_id, 'expected_installment' => $order_details['Order']['mthly_install'], 'paid_install' => $next_duepaid, 'balance' => $next_duebalance, 'due_date' => $todate->format('Y-m-d'), 'user_id' => $this->request->data['Payment']['user_id'], 'installment_no' => 1, 'customer_id' => $customer,'zone_id' => $order_details['Order']['zone_id']);
                        }
                    } else {

                        $interest_rate = 10;
                        $installment = $order['Order']['mthly_install'];
                        $balance = $order['Order']['balance'];


                        $calc_interest = $installment * ($interest_rate / 100);
                        $new_balance = $balance + $calc_interest;
                        $new_accrued = $old_accrued + $calc_interest;
                        if ($last_paymt != $default_date) {
                            $due_date->add(new DateInterval('P1M'));
                        }
                        $order_details = array('id' => $order_id, 'balance' => $new_balance, 'due_date' => $due_date->format('Y-m-d'), 'interest_accrued' => $new_accrued);
                        $this->save($order_details);
                    }
                }
            }
        }
    }

}

?>
