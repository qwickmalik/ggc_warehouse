<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

class ShellConsolesController extends AppController {

    public $components = array('RequestHandler', 'Session', 'Message');
    var $name = 'ShellConsole';
    var $uses = array('User', 'Usertype', 'Userdepartment', 'Setting',
        'Currency', 'Eod', 'Eom', 'BalanceSheet', 'IncomeStatement', 'Equity',
        'DailyDefault', 'ClosingBalance', 'Order', 'Expectedinstallment', 
        'Customer', 'Sale', 'Transaction', 'BankBalance', 'Event', 'MsgTemplate',
        'Journal', 'CrmStatus');

    function beforeFilter() {
        $settings = $this->Setting->getSettings();

        $this->Session->write('shopName', $settings['Setting']['company_name']);
        $this->Session->write('shopAddress', $settings['Setting']['postal_address']);
        $this->Session->write('shopMobile', $settings['Setting']['mobile']);
        $this->Session->write('shopTelephone', $settings['Setting']['telephone']);
        $this->Session->write('shopPosttown', $settings['Setting']['postal_town_suburb']);
        $this->Session->write('shopPostCity', $settings['Setting']['postal_city']);
        $this->Session->write('shopPostCount', $settings['Setting']['postal_country']);
        $this->Session->write('shopEmail', $settings['Setting']['email']);
        $this->Session->write('invent_acct', $settings['Setting']['inventory_acc_id']);
        $this->Session->write('sales_acct', $settings['Setting']['sales_acc_id']);
    }

    function index() {
        $this->autoRender = false;
    }

    /**
     * Authenticate user
     * @return array() 
     */
    public function cronJobs() {
        $this->autoRender = false;
        $this->__runDailyDefaulters();
    }

    public function defaultJobs() {
        $this->autoRender = false;
        $this->__sumSales();
        $this->__crMail();
    }

    public function endOFDAY() {
        $this->autoRender = false;
        $this->__EOD();
        $this->__EOM();
    }

    public function sms() {
        $this->autoRender = false;
        $this->__runduedateSMS();
        $this->__birthdaySMS();
        $this->__xmasSMS();
    }

    function __defaultDaily() {

        $total = $this->DailyDefault->find('count');
//        
        if ($total > 0) {
            $set = $this->DailyDefault->find('first', array('order' => 'DailyDefault.id DESC'));
            $today = date('Y-m-d');


            if (($today != $set['DailyDefault']['date']) && ($set['DailyDefault']['flag'] == 0)) {

                $EOD_date = $set['DailyDefault']['date'];

                $this->__saveClosingBalance($EOD_date);
//                $this->__balEOD($EOD_date);
//
//                $this->__incomestatementEOD($EOD_date);
//            $this->__ownerequityEOD($EOD_date);


                $DDdata = array('id' => $set['DailyDefault']['id'], 'flag' => 1);
                $result = $this->DailyDefault->save($DDdata);

                if ($result) {

                    $DDdata2 = array('date' => $today);
                    $this->DailyDefault->create();
                    $result = $this->DailyDefault->save($DDdata2);
                }
            }
        } else {
            $today = date('Y-m-d');
            $DDdata3 = array('date' => $today);
            $this->DailyDefault->save($DDdata3);
        }
    }

    function __checkDailyDefaulters($ddDate) {
        $this->__runDailyDefaulters($ddDate);
    }

    function __birthdaySMS() {
        // set_time_limit(0);
        $birth_date = date('m-d');


        $customers = $this->Customer->find('all', array('conditions' => array(array('MONTH(Customer.dob)' => date('m'), 'DAY(Customer.dob)' => date('d')))));

        if ($customers) {
            $c_number = "";
            foreach ($customers as $cust) {

                $cell_number = $cust['Customer']['mobile_no'];
                $fullname = $cust['Customer']['first_name'];
                if ($cell_number != "" && $cell_number != null) {

                    $c_number = $cell_number;
                    $msg = "Dear " . $fullname . ", UCSL appreciates your partnership and on your birthday,we want to wish you many more years of fulfillment. HAPPY BIRTHDAY.";
                    $msgresult = $this->Message->sendSMS($msg, $c_number);
                }
            }
        }
    }

    function __xmasSMS() {
        // set_time_limit(0);
        $eyear = date('Y');
        $ends_date = $eyear . "-" . "12-25";
        $enewdate = strtotime($ends_date);
        $xmas = date('Y-m-d', $enewdate);
        $today = date('Y-m-d');

        if ($today == $xmas) {
            $customers = $this->Customer->find('all');
            $c_number = "";
            if ($customers) {
                foreach ($customers as $cust) {

                    $cell_number = $cust['Customer']['mobile_no'];
                    $fullname = $cust['Customer']['first_name'];
                    if ($cell_number != "" && $cell_number != null) {

                        $c_number = $cell_number;

//                        $msg = "Dear " . $fullname . ", UCSL wishes you a merry X'mas and a Happy new year. Thank you for your support throughout the year. We value your partnership.";
//                        $msgresult = $this->Message->sendSMS($msg, "233" . $cell_number);

                        $msg = "Dear " . $fullname . ", UCSL wishes you a merry X'mas and a Happy new year. Thank you for your support throughout the year. We value your partnership.";
                        $msgresult = $this->Message->sendSMS($msg, $c_number);
                    }
                }
            }
        }
    }

    function __runduedateSMS() {
        //set_time_limit(0);
        $sms_date = date('Y-m-d');
        $dueorders = $this->Order->find('all', array('conditions' => array('Order.payment_status !=' => 'full_payment', 'Order.delivery' => 'Delivered', 'Order.balance >' => 0)));
        $c_number = "";
        foreach ($dueorders as $dueorder) {

            $text_date = new DateTime($sms_date);
            $next_due = $dueorder['Order']['due_date'];
            $order_id = $dueorder['Order']['id'];

            $todate = new DateTime($next_due);
            $todate->sub(new DateInterval('P7D'));

            if ($text_date->format('Y-m-d') == $todate->format('Y-m-d')) {


                $sms_installments = $this->Expectedinstallment->find('first', array('conditions' => array('Expectedinstallment.order_id' => $order_id, 'Expectedinstallment.balance >' => 0, 'Order.balance >' => 0), 'order' => array('Expectedinstallment.id DESC')));

                if ($sms_installments) {
                    $cell_number = $dueorder['Customer']['mobile_no'];
                    $fullname = $dueorder['Customer']['first_name'];
                    $invoice_no = $dueorder['Order']['invoice_no'];
                    $expbalance = $sms_installments['Expectedinstallment']['balance'];

                    if ($cell_number != "" && $cell_number != null) {

                        $c_number = $cell_number;

//                        $msg = "Dear " . $fullname . ", please be reminded that your next payment of " . "GHC" . round($expbalance) . " for your order " . $invoice_no . " will be due in two days. Contact 0202088128 enquiries. Thanks.";
//
//                        $msgresult = $this->Message->sendSMS($msg, "233" . $cell_number);

                        $msg = "Dear " . $fullname . ", please be reminded that your next payment of " . "GHC" . round($expbalance) . " for your order " . $invoice_no . " will be due in two days. Contact 0202088124 enquiries. Thanks.";
                        $msgresult = $this->Message->sendSMS($msg, $c_number);
                    }
                    $this->defaultersMail($dueorder['Customer']['last_name'], $dueorder['Customer']['first_name']);
                }
            }
        }
    }

    function __runDailyDefaulters() {
        //set_time_limit(0);
        //$default_date1 = date('Y-m-d');
        $default_date = date('Y-m-d');
        $previous_day = new DateTime($default_date);
        //print_r($previous_day->format('Y-m-d'));
        //$previous_day->sub(new DateInterval('P1D'));
        //$this->Order->recursive = -1; 
        //,'YEAR(Order.due_date) >' => date('Y',strtotime('2011'))
        $orders = $this->Order->find('all', array('conditions' => array('Order.payment_status !=' => 'full_payment', 'Order.delivery' => 'Delivered', 'Order.approved' => 1, 'Order.status' => 'Approved', 'Order.due_date <=' => $previous_day->format('Y-m-d')), 'recursive' => -1));
        if ($orders) {

            foreach ($orders as $order) {
                $next_due = $order['Order']['due_date'];
                $order_id = $order['Order']['id'];
                $last_paymt = $order['Order']['last_date'];



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
                // $this->Expectedinstallment->recursive = -1; 
                $installments = $this->Expectedinstallment->find('first', array('conditions' => array('Expectedinstallment.order_id' => $order_id), 'order' => array('Expectedinstallment.id DESC'), 'recursive' => -1));


                if ($next_due > $last_paymt) {
                    if ($payment_status != 'expired') {


                        if ($previous_day->format('Y-m-d') >= $expire_date->format('Y-m-d')) {
                            //($this->Session->check('interest') != false){$interest_rate = $this->Session->read('interest');}else{$interest_rate = 0;}

                            $balance = $order['Order']['balance'];
                            $old_accrued = $order['Order']['interest_accrued'];
                            $installment_no = $installments['Expectedinstallment']['newinstallment_no'];
                            while ($previous_day->format('Y-m-d') >= $due_date->format('Y-m-d')) {
                                $interest_rate = 10;

                                $installment_no = $installment_no + 1;
                                $calc_interest = $balance * ($interest_rate / 100);
                                $new_balance = $balance + $calc_interest;
                                $new_accrued = $old_accrued + $calc_interest;

                                $due_date->add(new DateInterval('P1M'));
                                $order_details = array('id' => $order_id, 'balance' => round($new_balance, 0), 'interest_accrued' => round($new_accrued, 0), 'payment_status' => 'expired', 'due_date' => $due_date->format('Y-m-d'));
                                $order_sv = $this->Order->save($order_details);

                                if ($order_sv) {
                                    $next_due = $order_sv['Order']['due_date'];
                                    $order_id = $order_sv['Order']['id'];
                                    $balance = $order_sv['Order']['balance'];
                                    $old_accrued = $order_sv['Order']['interest_accrued'];
                                    // $order_sv = $this->Order->find('first', array('conditions' => array('Order.id' => $order_id, 'Order.payment_status !=' => "full_payment")));
                                    // $this->Expectedinstallment->recursive = -1; 
                                    $installmentsall = $this->Expectedinstallment->find('all', array('conditions' => array('Expectedinstallment.order_id' => $order_id, 'Expectedinstallment.payment_status !=' => "full_payment"), 'recursive' => -1));

                                    if ($installmentsall) {
                                        foreach ($installmentsall as $value) {
                                            $install_data = array('id' => $value['Expectedinstallment']['id'], 'payment_status' => "full_payment");
                                            $this->Expectedinstallment->save($install_data);
                                        }
                                    }
                                    $pastdue_expected_installment = $order_sv['Order']['balance'];
                                    $next_duebalance = $order_sv['Order']['balance'];
                                    //$next_duepaid = $order['Order']['amount_paid'];


                                    $expectedinstall2 = array('order_id' => $order_id, 'expected_installment' => $pastdue_expected_installment, 'paid_install' => 0, 'balance' => round($next_duebalance, 0), 'due_date' => $due_date->format('Y-m-d'), 'user_id' => $installments['Expectedinstallment']['user_id'], 'customer_id' => $order['Order']['customer_id'], 'zone_id' => $order['Order']['zone_id'], 'newinstallment_no' => $installment_no, 'default_interest' => $new_accrued);

                                    $this->Expectedinstallment->create();
                                    $saveInstll2 = $this->Expectedinstallment->save($expectedinstall2);
                                }
                            }
                        }
                    } elseif ($payment_status == 'expired') {
                        if (($previous_day->format('Y-m-d') >= $expire_date->format('Y-m-d'))) {

                            $balance = $order['Order']['balance'];
                            $old_accrued = $order['Order']['interest_accrued'];
                            $installment_no = $installments['Expectedinstallment']['newinstallment_no'];

                            while ($previous_day->format('Y-m-d') >= $due_date->format('Y-m-d')) {
                                $interest_rate = 10;

                                $installment_no = $installment_no + 1;
                                $calc_interest = $balance * ($interest_rate / 100);
                                $new_balance = $balance + $calc_interest;
                                $new_accrued = $old_accrued + $calc_interest;
                                $due_date->add(new DateInterval('P1M'));
                                $order_details = array('id' => $order_id, 'balance' => round($new_balance, 0), 'interest_accrued' => round($new_accrued, 0), 'due_date' => $due_date->format('Y-m-d'));
                                //$this->Order->create();
                                $order_sv = $this->Order->save($order_details);

                                if ($order_sv) {
                                    $next_due = $order_sv['Order']['due_date'];
                                    $order_id = $order_sv['Order']['id'];
                                    $balance = $order_sv['Order']['balance'];
                                    $old_accrued = $order_sv['Order']['interest_accrued'];
                                    // $order_sv = $this->Order->find('first', array('conditions' => array('Order.id' => $order_id, 'Order.payment_status !=' => "full_payment")));
                                    //$this->Expectedinstallment->recursive = -1; 
                                    $installmentsall = $this->Expectedinstallment->find('all', array('conditions' => array('Expectedinstallment.order_id' => $order_id, 'Expectedinstallment.payment_status !=' => "full_payment"), 'recursive' => -1));

                                    if ($installmentsall) {
                                        foreach ($installmentsall as $value) {
                                            $install_data = array('id' => $value['Expectedinstallment']['id'], 'payment_status' => "full_payment");
                                            $this->Expectedinstallment->save($install_data);
                                        }
                                    }
                                    $pastdue_expected_installment = $order_sv['Order']['balance'];
                                    $next_duebalance = $order_sv['Order']['balance'];
                                    //$next_duepaid = $order['Order']['amount_paid'];


                                    $expectedinstall2 = array('order_id' => $order_id, 'expected_installment' => $pastdue_expected_installment, 'paid_install' => 0, 'balance' => round($next_duebalance, 0), 'due_date' => $due_date->format('Y-m-d'), 'user_id' => $installments['Expectedinstallment']['user_id'], 'customer_id' => $order['Order']['customer_id'], 'zone_id' => $order['Order']['zone_id'], 'newinstallment_no' => $installment_no, 'default_interest' => $new_accrued);

                                    $this->Expectedinstallment->create();

                                    $this->Expectedinstallment->save($expectedinstall2);
                                }
                            }
                        }
                    }
                } elseif ($next_due <= $last_paymt) {
                    if ($previous_day->format('Y-m-d') >= $todate->format('Y-m-d')) {
                        if ($payment_status != 'expired') {
                            //($this->Session->check('interest') != false){$interest_rate = $this->Session->read('interest');}else{$interest_rate = 0;}
                            // $this->Expectedinstallment->recursive = -1; 

                            $installments = $this->Expectedinstallment->find('first', array('conditions' => array('Expectedinstallment.order_id' => $order_id, 'Expectedinstallment.payment_status !=' => "full_payment"), 'order' => array('Expectedinstallment.id DESC'), 'recursive' => -1));
                            if ($installments) {
                                $next_due = $order['Order']['due_date'];
                                $order_id = $order['Order']['id'];
                                $last_paymt = $order['Order']['last_date'];
                                $installment = $order['Order']['mthly_install'];
                                $balance = $order['Order']['balance'];
                                $old_accrued = $order['Order']['interest_accrued'];
                                $last_duedate1 = $order['Order']['last_date'];
                                $installment_no = $installments['Expectedinstallment']['newinstallment_no'];
                                while ($previous_day->format('Y-m-d') >= $due_date->format('Y-m-d')) {
                                    //   $order = $this->Order->find('first', array('conditions' => array('Order.id' => $order_id),'recursive' => -1));                           
                                    //$this->Expectedinstallment->recursive = -1; 
                                    $installments = $this->Expectedinstallment->find('first', array('conditions' => array('Expectedinstallment.order_id' => $order_id, 'Expectedinstallment.payment_status !=' => "full_payment"), 'order' => array('Expectedinstallment.id DESC'), 'recursive' => -1));
                                    $interest_rate = 10;

//                                $previous_day = new DateTime($default_date);
//                                $previous_day->sub(new DateInterval('P1D'));
                                    $todate = new DateTime($next_due);
                                    $todate->add(new DateInterval('P15D'));
                                    $due_date = new DateTime($next_due);

                                    $last_duedate = new DateTime($last_duedate1);
                                    $calc_interest = $installment * ($interest_rate / 100);
                                    $new_balance = $balance + $calc_interest;
                                    $new_accrued = $old_accrued + $calc_interest;
                                    $due_date->add(new DateInterval('P1M'));



                                    $order_details = array('id' => $order_id, 'balance' => round($new_balance, 0), 'due_date' => $due_date->format('Y-m-d'), 'interest_accrued' => round($new_accrued, 0));
                                    //$this->Order->create();
                                    $order_sv = $this->Order->save($order_details);

                                    $next_due = $order_sv['Order']['due_date'];
                                    $order_id = $order_sv['Order']['id'];
                                    $balance = $order_sv['Order']['balance'];
                                    $old_accrued = $order_sv['Order']['interest_accrued'];
                                    $last_duedate1 = $order['Order']['last_date'];
                                    $installment_no = $installment_no + 1;
                                    $old_inst_interest = $calc_interest;
                                    $paid_install = $installments['Expectedinstallment']['paid_install'];
                                    $next_duebalance = $installments['Expectedinstallment']['balance'] + $calc_interest;
                                    if ($next_due != $last_paymt && $next_due < $last_paymt) {
                                        
                                    }

                                    if ($paid_install > 0) {
                                        $install_paymt_status = "part_payment";
                                    } elseif ($paid_install <= 0) {
                                        $install_paymt_status = "no_payment";
                                    }


                                    $expectedinstall = array('id' => $installments['Expectedinstallment']['id'], 'order_id' => $order_id, 'payment_status' => $install_paymt_status, 'balance' => round($next_duebalance, 0), 'user_id' => $installments['Expectedinstallment']['user_id'], 'default_interest' => round($old_inst_interest, 0), 'customer_id' => $order['Order']['customer_id'], 'zone_id' => $order['Order']['zone_id'], 'defaulter' => 1);

                                    $saveInstll = $this->Expectedinstallment->save($expectedinstall);

                                    if ($saveInstll) {

                                        if ($due_date->format('Y-m-d') >= $last_duedate->format('Y-m-d')) {
                                            if ($order_sv) {
                                                //$order_sv = $this->Order->find('first', array('conditions' => array('Order.id' => $order_id, 'Order.payment_status !=' => "full_payment")));
                                                // $this->Expectedinstallment->recursive = -1; 
                                                $installmentsall = $this->Expectedinstallment->find('all', array('conditions' => array('Expectedinstallment.order_id' => $order_id, 'Expectedinstallment.payment_status !=' => "full_payment"), 'recursive' => -1));

                                                if ($installmentsall) {
                                                    foreach ($installmentsall as $value) {
                                                        $install_data = array('id' => $value['Expectedinstallment']['id'], 'payment_status' => "full_payment");
                                                        $this->Expectedinstallment->save($install_data);
                                                    }
                                                }
                                                $pastdue_expected_installment = $order_sv['Order']['balance'];
                                                $next_duebalance = $order_sv['Order']['balance'];
                                                //$next_duepaid = $order['Order']['amount_paid'];


                                                $expectedinstall2 = array('order_id' => $order_id, 'expected_installment' => $pastdue_expected_installment, 'paid_install' => 0, 'balance' => round($next_duebalance, 0), 'due_date' => $due_date->format('Y-m-d'), 'user_id' => $installments['Expectedinstallment']['user_id'], 'customer_id' => $order['Order']['customer_id'], 'zone_id' => $order['Order']['zone_id'], 'newinstallment_no' => $installment_no);
                                            }
                                        } else {
                                            $install_paymt_status = "no_payment";
                                            $expectedinstall2 = array('order_id' => $order_id, 'expected_installment' => $order['Order']['mthly_install'], 'balance' => $order['Order']['mthly_install'], 'due_date' => $due_date->format('Y-m-d'), 'user_id' => $installments['Expectedinstallment']['user_id'], 'customer_id' => $order['Order']['customer_id'], 'zone_id' => $order['Order']['zone_id'], 'newinstallment_no' => $installment_no, 'payment_status' => $install_paymt_status);
                                        }



                                        $this->Expectedinstallment->create();
                                        $this->Expectedinstallment->save($expectedinstall2);
                                    }
                                }
                            } else {
                                // $this->Order->recursive = -1; 
                                $order = $this->Order->find('first', array('conditions' => array('Order.id' => $order_id), 'recursive' => -1));

                                $interest_rate = 10;
                                $installment = $order['Order']['mthly_install'];
                                $balance = $order['Order']['balance'];


                                $calc_interest = $installment * ($interest_rate / 100);
                                $new_balance = $balance + $calc_interest;
                                $new_accrued = $old_accrued + $calc_interest;
                                if ($last_paymt != $default_date) {
                                    $due_date->add(new DateInterval('P1M'));
                                }
                                $order_details = array('id' => $order_id, 'balance' => round($new_balance, 0), 'due_date' => $due_date->format('Y-m-d'), 'interest_accrued' => $new_accrued);
                                $this->Order->save($order_details);
                            }
                        }
                    }
                }
            }
        }
    }

    function __saveClosingBalance($ddDate) {
        $closing_balance = $this->Order->find('all', array('conditions' => array('Order.balance >' => 0, 'Order.status' => 'Approved', 'Order.delivery' => 'Delivered', 'Order.delivery_date' => $ddDate)));

        if ($closing_balance) {
            foreach ($closing_balance as $closing_bal) {
                $balance_details = array('order_id' => $closing_bal['Order']['id'], 'customer_id' => $closing_bal['Order']['customer_id'], 'balance' => $closing_bal['Order']['balance'], 'date' => $ddDate);
                $result = $this->ClosingBalance->saveAll($balance_details);
            }
        }
    }

    function __EOD() {

        $total = $this->Eod->find('count');
//        
        if ($total > 0) {
            $set = $this->Eod->find('first', array('order' => 'Eod.id DESC'));
            $today = date('Y-m-d');

//if($today =='2013-10-15'){
//    return 'trial End';
//}

            if (($today != $set['Eod']['eod_date']) && ($set['Eod']['flag'] == 0)) {

                $EOD_date = $set['Eod']['eod_date'];
                $this->__balEOD($EOD_date);

                $this->__incomestatementEOD($EOD_date);

//            $this->__ownerequityEOD($EOD_date);


                $EODdata = array('id' => $set['Eod']['id'], 'flag' => 1);
                $result = $this->Eod->save($EODdata);

                if ($result) {

                    $EODdata2 = array('eod_date' => $today);
                    $this->Eod->create();
                    $result = $this->Eod->save($EODdata2);
                }
            }
        } else {
            $today = date('Y-m-d');
            $EODdata3 = array('eod_date' => $today);
            $result = $this->Eod->save($EODdata3);
        }
    }

    function __EOM() {

        $total = $this->Eom->find('count');
//        
        if ($total > 0) {
            $set = $this->Eom->find('first', array('order' => 'Eom.id DESC'));
            $today = date('Y-m-d');



            if (($today != $set['Eom']['year']) && ($set['Eom']['flag'] == 0)) {

                $EOM_date = $set['Eom']['year'];
//                $this->__balEOD($EOD_date);
//
//                $this->__incomestatementEOD($EOD_date);

                $data = $this->__ownerequityEOM($EOM_date, $set);

                return $data;
            }
        } else {
            $today = $this->Session->read('accYear');
            $date = new DateTime($today);
            $date->add(new DateInterval('P1M1D'));

            $EOMdata3 = array('year' => $date->format('Y-m-d'));
            $result = $this->Eom->save($EOMdata3);
        }
    }

/*
//    function __EOD() {
//
//        $total = $this->Eod->find('count');
////        
//        if ($total > 0) {
//            $set = $this->Eod->find('first', array('order' => 'Eod.id DESC'));
//            $today = date('Y-m-d');
//
//
//
//            if (($today != $set['Eod']['eod_date']) && ($set['Eod']['flag'] == 0)) {
//
//                $EOD_date = $set['Eod']['eod_date'];
//                $this->__balEOD($EOD_date);
//
//                $this->__incomestatementEOD($EOD_date);
//
////            $this->__ownerequityEOD($EOD_date);
//
//
//                $EODdata = array('id' => $set['Eod']['id'], 'flag' => 1);
//                $result = $this->Eod->save($EODdata);
//
//                if ($result) {
//
//                    $EODdata2 = array('eod_date' => $today);
//                    $this->Eod->create();
//                    $this->Eod->save($EODdata2);
//                }
//            }
//        } else {
//            $today = date('Y-m-d');
//            $EODdata3 = array('eod_date' => $today);
//            $this->Eod->save($EODdata3);
//        }
//    }

*/
    function __balEOD($bDate) {


        $this->BalanceSheet->runBalEOD($bDate);
    }

    function __incomestatementEOD($isDate) {
        $this->IncomeStatement->runISEOD($isDate);
    }

/*
//    function __EOM() {
//
//        $total = $this->Eom->find('count');
////        
//        if ($total > 0) {
//            $set = $this->Eom->find('first', array('order' => 'Eom.id DESC'));
//            $today = date('Y-m-d');
//
//
//
//            if (($today != $set['Eom']['year']) && ($set['Eom']['flag'] == 0)) {
//
//                $EOM_date = $set['Eom']['year'];
////                $this->__balEOD($EOD_date);
////
////                $this->__incomestatementEOD($EOD_date);
//
//                $this->__ownerequityEOM($EOM_date, $set);
//            }
//        } else {
//            $today = $this->Session->read('accYear');
//            $date = new DateTime($today);
//            $date->add(new DateInterval('P1M1D'));
//
//            $EOMdata3 = array('year' => $date->format('Y-m-d'));
//            $this->Eom->save($EOMdata3);
//        }
//    }
*/    
    function __ownerequityEOM($oeqDate, $set) {

        $data = $this->runEQEOM($oeqDate, $set);
        return $data;
    }

    function runEQEOM($ismonth, $set) {

        $eomCheck = $this->Session->read('accYear');
        $eomCheck2 = date('d-m', strtotime($eomCheck));

//        return $eomCheck;
        $today = date('Y-m-d');
        $thisDay = date('Y-m-d', strtotime($set['Eom']['year']));
        $thisYear = date('Y-m');
        $eomYear = date('Y-m', strtotime($eomCheck));

        //check if EOM
        $is_EOM = $this->isEOM($ismonth, $eomCheck);

        if ($is_EOM) {

            if ($thisYear == $eomYear) {

                $data = $this->Equity->runEQEOM($eomCheck, 'first');
                $EOMdata = array('id' => $set['Eom']['id'], 'flag' => 1);
                $result = $this->Eom->save($EOMdata);

                if ($result) {
                    $next_oem_dt = $data['next_eom_date'];

                    $EOMdata2 = array('year' => $next_oem_dt);
                    $this->Eom->create();
                    $result = $this->Eom->save($EOMdata2);
                    return $result;
                }
                return $data;
            } elseif ($today >= $thisDay) {

                $data = $this->Equity->runEQEOM($ismonth, 'other');
                $EOMdata = array('id' => $set['Eom']['id'], 'flag' => 1);
                $result = $this->Eom->save($EOMdata);

                if ($result) {
                    $next_oem_dt = $data['next_eom_date'];

                    $EOMdata2 = array('year' => $next_oem_dt);
                    $this->Eom->create();
                    $result = $this->Eom->save($EOMdata2);
                    return $result;
                }
                return $data;
            }
        }
    }

    function isEOM($next_eom, $acc_year) {
        $today = date('Y-m-d');
        $eomCheck3 = date('Y-m-d', strtotime($acc_year));
        $eomCheck4 = date('Y-m-d', strtotime($next_eom));
        $acc_day = date('d', strtotime($acc_year));
        $day = date('d');

        if ($today == $eomCheck3) {
            return false;
        }

        if ($today >= $eomCheck4) {
            return true;
        } else {
            return false;
        }
    }

/*
//    function runEQEOM($ismonth, $set) {
//
//        $eomCheck = $this->Session->read('accYear');
//        $eomCheck2 = date('d-m', strtotime($eomCheck));
//
////        return $eomCheck;
//        $today = date('Y-m-d');
//        $thisDay = date('Y-m-d', strtotime($set['Eom']['year']));
//        $thisYear = date('Y-m');
//        $eomYear = date('Y-m', strtotime($eomCheck));
//
//        //check if EOM
//        $is_EOM = $this->isEOM($ismonth, $eomCheck);
//
//        if ($is_EOM) {
//
//            if ($thisYear == $eomYear) {
//
//                $data = $this->Equity->runEQEOM($eomCheck, 'first');
//                $EOMdata = array('id' => $set['Eom']['id'], 'flag' => 1);
//                $result = $this->Eom->save($EOMdata);
//
//                if ($result) {
//                    $next_oem_dt = $data['next_eom_date'];
//
//                    $EOMdata2 = array('year' => $next_oem_dt);
//                    $this->Eom->create();
//                    $result = $this->Eom->save($EOMdata2);
////                    return $result;
//                }
//            } elseif ($today >= $thisDay) {
//
//                $data = $this->Equity->runEQEOM($ismonth, 'other');
//                $EOMdata = array('id' => $set['Eom']['id'], 'flag' => 1);
//                $result = $this->Eom->save($EOMdata);
//
//                if ($result) {
//                    $next_oem_dt = $data['next_eom_date'];
//
//                    $EOMdata2 = array('year' => $next_oem_dt);
//                    $this->Eom->create();
//                    $this->Eom->save($EOMdata2);
////                    return $result;
//                }
//            }
//        }
//    }
//
//    function isEOM($next_eom, $acc_year) {
//        $today = date('Y-m-d');
//        $eomCheck3 = date('Y-m-d', strtotime($acc_year));
//        $eomCheck4 = date('Y-m-d', strtotime($next_eom));
//        $acc_day = date('d', strtotime($acc_year));
//        $day = date('d');
//
//        if ($today == $eomCheck3) {
//            return false;
//        }
//
//        if ($today >= $eomCheck4) {
//            return true;
//        } else {
//            return false;
//        }
//    }
*/
    function defaultersMail($othernames = null, $lastname = null, $email = null) {
        $date = date('d M, Y');
        $myhtml = '<table align="center" width="100%" cellspacing="10" cellpadding="10" style="border: solid 10px #eaeaea;">
    <tr>
        <td align="left">'; //the table below should be stored into this variable and passed to the email function below
        $myhtml .= $this->Html->image('logo.png', array('style' => 'float: left; margin-right: 20px;', 'alt' => $this->Session->read('shopName')));
        $myhtml .= '</td>
        <td align="right">
            <p align="right">';
        $myhtml .= $this->Session->read('shopAddress') . ', ' . $this->Session->read('shopPosttown') . '<br />' . $this->Session->read('shopPostCity') . ', ' . $this->Session->read('shopPostCount') . '<br />' . $this->Session->read('shopTelephone') . '<br />' . $this->Session->read('shopEmail');

        $myhtml .= '</p>
        </td>
    </tr>

    <tr>
        <td colspan="2">
            <p>';
        $myhtml .= 'Dear' . $othernames . ' ' . $lastname;

        $myhtml .= ' </p>
            <p>
                
            </p>
        </td>
    </tr>
</table>';




        $server_path = $_SERVER['HTTP_HOST'];

        $from = "notifications@bomarkroyal.com";
        $to = $email; //this should be set in another view
        $subject = "Debtors list as at $date";


        $finalhtml .= '<br />';
        $finalhtml .= $myhtml;
        $finalhtml .= '<br />';
        $finalhtml .= '<br />';
        $finalhtml .= '------------------------------------------------------------<br />';
        $finalhtml .= 'Bomark Royal Enterprise(R)<br />';
        $finalhtml .= 'http://www.bomarkroyal.com<br />';

        $this->sendHTMLemail($finalhtml, $from, $to, $subject);
    }

    function __sumSales() {
        $this->autoRender = false;
        $today = date('Y-m-d H:i:s');
        $data = $this->Sale->find('all', array(
            'conditions' => array('Sale.status' => 'alive', 'Sale.payment_status !=' => 'processed'),
            'fields' => array('Sum(Sale.amount_paid) as amount', 'Zone.zone', 'SUM(Sale.total_costprice) as cost_price'),
            'group' => array('Sale.zone_id')));

        if ($data) {
            $saleacct = null;
            if ($this->Session->check('sales_acct')) {
                $saleacct = $this->Session->read('sales_acct');
            }
            $invenacct = null;
            if ($this->Session->check('invent_acct')) {
                $invenacct = $this->Session->read('invent_acct');
            }
            $cash = 0;
            $costp = 0;
            foreach ($data as $val) {
                //saving sale details in transaction table as income
                $amount_paid = $val[0]['amount'];
                $zone = $val['Zone']['zone'];
                $cost_price = $val[0]['cost_price'];
                $user = 'System';
                $random_salt = uniqid(substr(str_replace(' ', '', $user), 0, 4));
                $income_transact = array('head_id' => 1, 'category_id' => 61, 'account_id' => $saleacct, 'payment_mode_id' => 1,
                    'create_date' => $today, 'amount' => $amount_paid, 'credit' => $amount_paid, 'debit' => null, 'effect' => 1,
                    'prepared_by' => 'System', 'paid_to' => $zone, 'transaction_date' => $today, 'random_salt' => $random_salt,
                    'remarks' => 'Revenue from sale point');

                $expense_data = array('head_id' => 2, 'category_id' => 103, 'account_id' => $invenacct, 'payment_mode_id' => 1,
                    'create_date' => $today, 'amount' => $cost_price, 'debit' => $cost_price, 'credit' => null, 'effect' => 1,
                    'prepared_by' => 'System', 'paid_to' => $zone, 'transaction_date' => $today, 'random_salt' => $random_salt,
                    'remarks' => 'Direct cost/sale expense from sale');
                $inventory_data = array('head_id' => 4, 'category_id' => 77, 'account_id' => $invenacct, 'payment_mode_id' => 1,
                    'create_date' => $today, 'amount' => $cost_price, 'credit' => $cost_price, 'debit' => null, 'effect' => 0,
                    'prepared_by' => 'System', 'paid_to' => $zone, 'transaction_date' => $today, 'random_salt' => $random_salt,
                    'remarks' => 'Inventory asset decrease from sale');
                $cash_data = array('head_id' => 4, 'category_id' => 101, 'account_id' => $saleacct, 'payment_mode_id' => 1,
                    'create_date' => $today, 'amount' => $amount_paid, 'debit' => $amount_paid, 'credit' => null, 'effect' => 1,
                    'prepared_by' => 'System', 'paid_to' => $zone, 'transaction_date' => $today, 'random_salt' => $random_salt,
                    'remarks' => 'Cash asset increase from sale');



                $save_data = array($income_transact, $expense_data, $cash_data, $inventory_data);
                $result = $this->Transaction->saveMany($save_data); 
                $result1 = $this->Journal->saveMany($save_data);
                if ($result || $result1) {
                    $cash += $amount_paid;
                }
            }
            $this->Sale->updateAll(array('Sale.payment_status' => "'processed'"), array('Sale.sale_date <=' => $today/* ,'Sale.status' => 'alive' */));
            $sbankBal = $this->BankBalance->find('first', array(
                'conditions' => array('BankBalance.account_id' => $saleacct),
                'order' => array('BankBalance.id' => 'DESC')));
            if ($sbankBal) {
                $bank_id = $sbankBal['BankBalance']['bank_id'];
                $bal_id = $sbankBal['BankBalance']['id'];
                $sbb_bal = $sbankBal['BankBalance']['amount'];
                $sbb_bal2 = $sbb_bal + $cash;

                $sbankBal_array = array('bank_id' => $bank_id, 'account_id' => $saleacct,
                    'amount' => $sbb_bal2, 'amount_chg' => $cash, 'effect' => 1,
                    'description' => 'Revenue from sale point', 'user' => 'System');

                $this->BankBalance->save($sbankBal_array);
            } else {
                $sbb_bal = $cash;

                $sbankBal_array = array('account_id' => $saleacct,
                    'amount' => $sbb_bal, 'user' => $user);
                $this->BankBalance->save($sbankBal_array);
            }
        }
    }

    function sendHTMLemail($finalhtml, $from, $to, $subject) {
// First we have to build our email headers
// Set out "from" address

        $headers = "From: Bomark Royal Enterprise <notifications@bomarkroyal.com>\r\n";

// Now we specify our MIME version
        $headers .= "MIME-Version: 1.0\r\n";

// Create a boundary so we know where to look for
// the start of the data
        $boundary = uniqid("HTMLEMAIL");

// First we be nice and send a non-html version of our email
        $headers .= "Content-Type: multipart/alternative;" .
                "boundary = $boundary\r\n\r\n";

        $headers .= "This is a MIME encoded message.\r\n\r\n";

        $headers .= "--$boundary\r\n" .
                "Content-Type: text/plain; charset=ISO-8859-1\r\n" .
                "Content-Transfer-Encoding: base64\r\n\r\n";

        $headers .= chunk_split(base64_encode(strip_tags($finalhtml)));

// Now we attach the HTML version

        $headers .= "--$boundary\r\n" .
                "Content-Type: text/html;charset=ISO-8859-1\r\n" .
                "Content-Transfer-Encoding: base64\r\n\r\n";
        $headers .= chunk_split(base64_encode($finalhtml));


        mail($to, $subject, "", $headers);
    }

    function __crMail() {
        $today = '2000-' . date('m-d');
//        $this->set('today', $today);
//        $status = '<h4>Status of mails </h4>';
//        $this->set('status', $status);

        $event = null;
        $events = $this->MsgTemplate->find('first', array('conditions' => array('MsgTemplate.event_date' => $today, 'MsgTemplate.system' => 0)));


        

//            $this->set('event', $event);
        $shop = $this->Setting->find('first', array());
        
        
        if ($events) {
            
            
        switch ($events['MsgTemplate']['event_id']):
            case 1: $event = 'bday_msg';
                break;
            case 2: $event = 'ny_msg';
                break;
            case 3: $event = 'indep_msg';
                break;
            case 4: $event = 'promo_msg';
                break;
            case 5: $event = 'easter_msg';
                break;
            case 6: $event = 'xmas_msg';
                break;
            case 7: $event = 'eidfitr_msg';
                break;
            case 8: $event = 'eidadha_msg';
                break;
        endswitch;
        
        
            $recipients = $this->Customer->find('all', array(
                'conditions' => array('Customer.' . $event => 1, 'Customer.email !=' => NULL),
                'recursive' => 0,
                'fields' => array('Customer.id', 'Customer.email'),
            ));

            
            
            if ($recipients) {
                $this->set('recipients', $recipients);

                

                $from = $shop['Setting']['email'];
                $headers = "From: " . $shop['Setting']['company_name'] . " <" . $from . "> " . "\r\n";
                $headers .= "Reply-To: " . $shop['Setting']['company_name'] . " <" . $from . "> " . "\r\n";
//                $headers .= "Return-Path: ".$shop['Setting']['company_name']." <".$from."> "."\r\n";
                $headers .= "MIME-Version: 1.0\r\n";
                $headers .= "Content-Type: text/html;charset=ISO-8859-1\r\n";
                $subject = $events['MsgTemplate']['subject'];
                $finalhtml = $events['MsgTemplate']['message'];
                $finalhtml .= '<br />';
                $finalhtml .= '<br />';
                $finalhtml .= '------------------------------------------------------------<br />';
                $finalhtml .= $shop['Setting']['company_name'] . ', ' . $shop['Setting']['postal_address'] . ', ' . $shop['Setting']['postal_town_suburb'] . ', ' . $shop['Setting']['postal_city'] . ', ' . $shop['Setting']['postal_country'] . ', ' . $shop['Setting']['telephone'];

                foreach ($recipients as $each_item):
                    mail($each_item['Customer']['email'], $subject, $finalhtml, $headers);
                endforeach;


                /*$to = 'info@qwickfusion.net';
                $message = $shop['Setting']['company_name'] .': MESSAGES FOR ' . $events['Event']['event'] . ' SENT';
                $from = 'info@qwickpoint.com';
                $headers = "From: QwickPoint <" . $from . "> " . "\r\n";
                $headers .= "Reply-To: QwickPoint <" . $from . "> " . "\r\n";
                $headers .= "MIME-Version: 1.0\r\n";
                $headers .= "Content-Type: text/html;charset=ISO-8859-1\r\n";
                $subject = $shop['Setting']['company_name'].' CRM Module Status';
                mail($to, $subject, $message, $headers);
                 * 
                 */
                
                $status_msg = "Messages for ".$events['Event']['event'] . " have been sent.";
                
            }else {
                /*
                $to = 'info@qwickfusion.net';
                $message = 'NO CONTACTS SUBSCRIBED TO ' . $events['Event']['event'] . ' MESSAGE';
                $from = 'info@qwickpoint.com';
                $headers = "From: QwickPoint <" . $from . "> " . "\r\n";
                $headers .= "Reply-To: QwickPoint <" . $from . "> " . "\r\n";
                $headers .= "MIME-Version: 1.0\r\n";
                $headers .= "Content-Type: text/html;charset=ISO-8859-1\r\n";
                $subject = $shop['Setting']['company_name'].' CRM Module Status';

                mail($to, $subject, $message, $headers);
                 * 
                 */
                
                $status_msg = 'NO CONTACTS SUBSCRIBED TO ' . $events['Event']['event'] . ' MESSAGE';
            }
        } else {
            /*
            $to = 'info@qwickfusion.net';
            $message = $shop['Setting']['company_name'].': NO EVENT DUE TODAY';
            $from = 'info@qwickpoint.com';
            $headers = "From: QwickPoint <" . $from . "> " . "\r\n";
            $headers .= "Reply-To: QwickPoint <" . $from . "> " . "\r\n";
            $headers .= "MIME-Version: 1.0\r\n";
            $headers .= "Content-Type: text/html;charset=ISO-8859-1\r\n";
            $subject = $shop['Setting']['company_name'].' CRM Module Status';

            mail($to, $subject, $message, $headers);
             * 
             */
            
            $status_msg = "NO EVENT DUE TODAY";
            $this->CrmStatus->save(array('status' => $status_msg));
        }
    }
    
    function bdayMail() {
        $today = "-".date('m-d');
        $this->set('today', $today);
        
        $recipients = $this->Customer->find('all', array('conditions' => array('Customer.dob LIKE' => '%'.$today, 'Customer.visible' => 'alive')));
            
        $shop = $this->Setting->find('first', array());
        
            if ($recipients) {
                $msg = $this->MsgTemplate->find('first', array('conditions' => array('MsgTemplate.event_id' => 1, 'MsgTemplate.system' => 0)));
//                $this->set('recipients', $recipients);

                

//                $to = 'info@qwickfusion.net';
                $subject = $msg['MsgTemplate']['subject'];
                $from = $shop['Setting']['email'];
                $headers = "From: ".$shop['Setting']['company_name']." <".$from."> "."\r\n";
                $headers .= "Reply-To: ".$shop['Setting']['company_name']." <".$from."> "."\r\n";
                $headers .= "MIME-Version: 1.0\r\n";
                $headers .= "Content-Type: text/html;charset=ISO-8859-1\r\n";
                
                $finalhtml = $msg['MsgTemplate']['message'];
                $finalhtml .= '<br />';
                $finalhtml .= '<br />';
                $finalhtml .= '------------------------------------------------------------<br />';
                $finalhtml .= $shop['Setting']['company_name'] . ', ' . $shop['Setting']['postal_address'] . ', ' . $shop['Setting']['postal_town_suburb'] . ', ' . $shop['Setting']['postal_city'] . ', ' . $shop['Setting']['postal_country'] . ', ' . $shop['Setting']['telephone'];

                foreach ($recipients as $each_item):
                    mail($each_item['Customer']['email'], $subject, $finalhtml, $headers);
                endforeach;

                
                

            }else {
                $to = 'info@qwickfusion.net';
                $message = $shop['Setting']['company_name'] .': NO BIRTHDAYS MESSAGES DUE TODAY';
                $from = 'info@qwickpoint.com';
                $headers = "From: QwickPoint <".$from."> "."\r\n";
                $headers .= "Reply-To: QwickPoint <".$from."> "."\r\n";
                $headers .= "MIME-Version: 1.0\r\n";
                $headers .= "Content-Type: text/html;charset=ISO-8859-1\r\n";
                $subject = $shop['Setting']['company_name'].' CRM Module Birthday Message Status';
                
                mail($to, $subject, $message, $headers);
            }
        
    }  

}

?>
