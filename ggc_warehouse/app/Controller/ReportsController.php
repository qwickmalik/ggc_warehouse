<?php

//App::import('Vendor', 'HTML2PDF_myPdf', array('file' => 'Html2Pdf/html2pdf.class.php'));

class ReportsController extends AppController {

//    public $components = array('RequestHandler', 'Session');
    var $name = 'Report';
    var $uses = array('Setting', 'Item', 'Client', 'User', 'Currency', 'Supplier', 'BalanceSheet', 'IncomeStatement',
        'Equity', 'Order', 'Zone', 'OrdersItem', 'Payment', 'ClosingBalance', 'Expectedpayment', 'Expectedinstallment', 
        'SalesItem', 'Sale', 'Warehouse', 'Supplierinvoice', 'Customer', 'Zone', 'Pettycash', 'PettycashDeposit', 
        'PettycashWithdrawal', 'CashAccount', 'TempcashAccount', 'Expense', 'Transaction', 'TransactionCategory', 
        'AccountingHead', 'BankBalance', 'BankTransfer', 'StatedBankBalance', 'WarehouseTransfer', 
        'WarehouseTransferItem','WarehouseItem', 'Journal');
    var $paginate = array(
        'Order' => array('limit' => 25, 'order' => array('Order.customer_id' => 'asc'), 'conditions' => array('Order.balance >' => 0, 'status' => 'Approved', 'delivery' => 'Delivered'), 'fields' => array('DISTINCT Order.customer_id', 'SUM(Order.balance) As bal', 'Order.amount_paid', 'Order.id', 'Customer.fullname', 'Customer.mobile_no', 'Order.last_date')),
        'OrdersItem' => array('limit' => 25),
        'ClosingBalance' => array('limit' => 25),
        'Expectedinstallment' => array('limit' => 500),
        'Supplierinvoice' => array('limit' => 25),
        'Customer' => array('limit' => 500)
    );

    function beforeFilter() {
        $this->__validateLoginStatus();
    }

    function __validateLoginStatus() {
        if ($this->action != 'login' && $this->action != 'logout') {
            if ($this->Session->check('userData') == false) {
                $this->redirect('/');
            }
        }
    }

    function __validateUserType() {

        $userType = $this->Session->read('userDetails.usertype_id');
        if ($userType != 1) {
            $this->redirect('/Dashboard/');
        }
    }
function __validateUserType2() {

        $userType = $this->Session->read('userDetails.usertype_id');
        if ($userType != 1 && $userType != 7) {
            $this->redirect('/Dashboard/');
        }
    }
    function __validateUserType3() {

        $userType = $this->Session->read('userDetails.usertype_id');
        if ($userType != 1 && $userType != 8 && $userType != 9) {
            $this->redirect('/Dashboard/');
        }
    }

    public function getLoggedInUser() {
        //set logged in user
        $user = null;
        if ($this->Session->check('userDetails.firstname')) {
            $user_f = $this->Session->read('userDetails.firstname');
            if ($this->Session->check('userDetails.lastname')) {
                $user_l = $this->Session->read('userDetails.lastname');
                $user = $user_f . ' ' . $user_l;
                return $user;
            } else {
                $user = $user_f;
                return $user;
            }
        } elseif ($this->Session->check('userDetails.lastname')) {
            $user = $this->Session->read('userDetails.lastname');
            return $user;
        }
    }

    public function getAccountingDate() {
        $acc_date = null;
        $setup = $this->Setting->find('first', array());
        if ($setup) {
            $accounting_date = $setup['Setting']['accounting_month'];
            $acc_date1 = explode('-', $accounting_date);

            $acc_date = '-' . $acc_date1[1] . '-' . $acc_date1[2];

            return $acc_date;
        }
    }

    function index() {
        $this->__validateUserType2();
    }

    protected function loadEssentials() {
        // load vendor class
        App::import('Vendor', 'PHPExcel/PHPExcel');
        if (!class_exists('PHPExcel')) {
            throw new CakeException('Vendor class PHPExcel not found!');
        }
    }

    function journal() {
        $this->__validateUserType2();

        if ($this->request->is('post')) {
            if ($this->request->data['Journal']['start_date'] == "" || $this->request->data['Journal']['start_date'] == null) {
                $message = 'Please indicate Start Date';
                $this->Session->write('emsg', $message);
                $this->redirect(array('controller' => 'Reports', 'action' => 'journal'));
            }
            if ($this->request->data['Journal']['end_date'] == "" || $this->request->data['Journal']['end_date'] == null) {
                $message = 'Please indicate End Date';
                $this->Session->write('emsg', $message);
                $this->redirect(array('controller' => 'Reports', 'action' => 'journal'));
            }


            $st_date = $this->request->data['Journal']['start_date'];
            $st_day = $st_date['day'];
            $st_month = $st_date['month'];
            $st_year = $st_date['year'];
            $start_date = $st_year . '-' . $st_month . '-' . $st_day;

            $e_date = $this->request->data['Journal']['end_date'];
            $e_day = $e_date['day'];
            $e_month = $e_date['month'];
            $e_year = $e_date['year'];
            $end_date = $e_year . '-' . $e_month . '-' . $e_day;
//            $end_date = implode('-', $e_date);




            $all_transactions = $this->Journal->find('all', array(
                'conditions' => array('Journal.transaction_date BETWEEN ? AND ?' => array($start_date, $end_date), 'Journal.deleted' => 0),
                'group' => array(),
            ));


            $this->set('start_date', $start_date);
            $this->set('end_date', $end_date);
            $this->set('all_transactions', $all_transactions);
        }
    }

    function generalLedger() {
        $this->__validateUserType2();

        if ($this->request->is('post')) {
            if ($this->request->data['GeneralLedger']['start_date'] == "" || $this->request->data['GeneralLedger']['start_date'] == null) {
                $message = 'Please indicate Start Date';
                $this->Session->write('emsg', $message);
                $this->redirect(array('controller' => 'Reports', 'action' => 'generalLedger'));
            }
            if ($this->request->data['GeneralLedger']['end_date'] == "" || $this->request->data['GeneralLedger']['end_date'] == null) {
                $message = 'Please indicate End Date';
                $this->Session->write('emsg', $message);
                $this->redirect(array('controller' => 'Reports', 'action' => 'generalLedger'));
            }


            $st_date = $this->request->data['GeneralLedger']['start_date'];
            $st_day = $st_date['day'];
            $st_month = $st_date['month'];
            $st_year = $st_date['year'];
            $start_date = $st_year . '-' . $st_month . '-' . $st_day;

            $e_date = $this->request->data['GeneralLedger']['end_date'];
            $e_day = $e_date['day'];
            $e_month = $e_date['month'];
            $e_year = $e_date['year'];
            $end_date = $e_year . '-' . $e_month . '-' . $e_day;
//            $end_date = implode('-', $e_date);




            $all_transactions = $this->Journal->find('all', array(
                'fields' => array('SUM(Journal.debit) AS sum_debit', 'SUM(Journal.credit) AS sum_credit', 'Journal.debit', 'Journal.credit', 'Journal.transaction_date', 'AccountingHead.head_name', 'TransactionCategory.category_name', 'Journal.category_id'),
                'conditions' => array('Journal.transaction_date BETWEEN ? AND ?' => array($start_date, $end_date), 'Journal.deleted' => 0),
                'group' => array('Journal.category_id'),
            ));


            $this->set('start_date', $start_date);
            $this->set('end_date', $end_date);
            $this->set('all_transactions', $all_transactions);
        }
    }

    function trialBalance() {
        $this->__validateUserType2();

        if ($this->request->is('post')) {
            if ($this->request->data['TrialBalance']['start_date'] == "" || $this->request->data['TrialBalance']['start_date'] == null) {
                $message = 'Please indicate Start Date';
                $this->Session->write('emsg', $message);
                $this->redirect(array('controller' => 'Reports', 'action' => 'trialBalance'));
            }
            if ($this->request->data['TrialBalance']['end_date'] == "" || $this->request->data['TrialBalance']['end_date'] == null) {
                $message = 'Please indicate End Date';
                $this->Session->write('emsg', $message);
                $this->redirect(array('controller' => 'Reports', 'action' => 'trialBalance'));
            }


            $st_date = $this->request->data['TrialBalance']['start_date'];
            $st_day = $st_date['day'];
            $st_month = $st_date['month'];
            $st_year = $st_date['year'];
            $start_date = $st_year . '-' . $st_month . '-' . $st_day;

            $e_date = $this->request->data['TrialBalance']['end_date'];
            $e_day = $e_date['day'];
            $e_month = $e_date['month'];
            $e_year = $e_date['year'];
            $end_date = $e_year . '-' . $e_month . '-' . $e_day;
//            $end_date = implode('-', $e_date);




            $all_transactions = $this->Journal->find('all', array(
                'fields' => array('SUM(Journal.debit) AS sum_debit', 'SUM(Journal.credit) AS sum_credit', 'Journal.debit', 'Journal.credit', 'Journal.transaction_date', 'AccountingHead.head_name', 'TransactionCategory.category_name', 'Journal.category_id'),
                'conditions' => array('Journal.transaction_date BETWEEN ? AND ?' => array($start_date, $end_date), 'Journal.deleted' => 0),
                'group' => array('Journal.category_id'),
            ));


            $this->set('start_date', $start_date);
            $this->set('end_date', $end_date);
            $this->set('all_transactions', $all_transactions);
        }
    }
    
    function balanceSheet() {
        $this->__validateUserType2();

        $user1 = $this->getLoggedInUser();
        $user2 = strtolower($user1);
        $user3 = str_replace(" ", "", $user2);
        $user = preg_replace('/[^A-Za-z0-9\-]/', '', $user3);
        $this->set('user', $user);


        if ($this->request->is('post')) {
            if ($this->request->data['BalanceSheet']['year'] == "" || $this->request->data['BalanceSheet']['year'] == null) {
                $message = 'Please indicate Year';
                $this->Session->write('emsg', $message);
                $this->redirect(array('controller' => 'Reports', 'action' => 'balanceSheet'));
            }

            $year = $this->request->data['BalanceSheet']['year']['year'];

            $acc_date = $this->getAccountingDate();
//			$this->set('acc_date', $acc_date);
            if ($acc_date == '-00-00' || $acc_date == null || $acc_date == '') {
                $message = 'Please set accounting date in SETTINGS > COMPANY SETUP';
                $this->Session->write('emsg', $message);
                $this->redirect(array('controller' => 'Reports', 'action' => 'balanceSheet'));
            } else {
                $end_date = $year . $acc_date;

                $date = DateTime::createFromFormat('Y-m-d', $end_date);
                $statement_date = $date->format('F d, Y');

                
                $start_date1 = ".$end_date.";
                $start_date2 = strtotime('-1 year', strtotime($start_date1));
                $start_date3 = date('Y-m-d' , $start_date2);
                $start_date4 = ".$start_date3.";
                $start_date5 = strtotime('+1 day', strtotime($start_date4));
                $start_date = date('Y-m-d' , $start_date5);
                
                $prev_end_date1 = strtotime('-1 year', strtotime($start_date1));
                $prev_end_date = date('Y-m-d' , $prev_end_date1);
                
                $prev_start_date1 = "$start_date";
                $prev_start_date2 = strtotime('-1 year', strtotime($prev_start_date1));
                $prev_start_date = date('Y-m-d' , $prev_start_date2);
                
//                    $this->set('prev_start_date', $prev_start_date);
//                    $this->set('prev_end_date', $prev_end_date);
//                    $this->set('start_date', $start_date);
//                    $this->set('end_date', $end_date);

                $edate = DateTime::createFromFormat('Y-m-d', $end_date);
                $e_date = $edate->format('d-M-y');
                    
                $pedate = DateTime::createFromFormat('Y-m-d', $prev_end_date);
                $pe_date = $pedate->format('d-M-y');


                $prev_start_year = strval($year - 2);
                $pr_date = strval($prev_start_year . $acc_date);
                $pre_date = strtotime ('+1 day', strtotime ($pr_date));
                $prev_date = date ( 'Y-m-d' , $pre_date );
                $this->set('prev_date', $prev_date);

                
                
                
                
                /* search for data for requested and previous years and dump into temporary table */
                App::import('Model', 'ConnectionManager');
                $con = new ConnectionManager;
                $cn = $con->getDataSource('default');

                $sql = "DROP TABLE IF EXISTS `balance_sheets_".$user."`;
                            CREATE TABLE IF NOT EXISTS balance_sheets_".$user."(
                                id INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
                                head_id INT( 11 ) UNSIGNED NOT NULL,
                                category_name VARCHAR( 100 ) NOT NULL ,
                                requested_year DECIMAL(11,2) NOT NULL DEFAULT '0.00',
                                previous_year DECIMAL(11,2) NOT NULL DEFAULT '0.00',
                                modified datetime NOT NULL,
                                PRIMARY KEY ( `id` ) ,
                                INDEX ( `category_name` )
                                )";
                if ($cn->query($sql)) {
                    //send category names and ids to temp table
                    $trans_cats = $this->TransactionCategory->find('all', array(
                        'fields' => array('id', 'head_id', 'category_name'),
                        'conditions' => array('deleted' => 0)
                        ));
                    
                    $mystring = null;
                    foreach($trans_cats as $arr):
                        
                        $mystring.= "(".$arr['TransactionCategory']['id'].",".$arr['TransactionCategory']['head_id'].",'".$arr['TransactionCategory']['category_name']."',0.00,0.00,'". date('Y-m-d H:m:s')."'),";
                    endforeach;
                    
                    $mystring1 = substr_replace($mystring,";",-1,1);
                    
                    $query = "INSERT INTO `balance_sheets_".$user."` (`id`, `head_id`, `category_name`, `requested_year`, `previous_year`, `modified`) VALUES $mystring1";
                    
                    $cn->query($query);
                    
                    /* Requested Year */
                    //send asset transactions to temp table
                    $asset_data = $this->Journal->find('all', array(
                    'fields' => array('SUM(Journal.debit) AS sum_debit', 'SUM(Journal.credit) AS sum_credit','Journal.id', 'Journal.transaction_date', 'Journal.category_id', 'Journal.debit', 'Journal.credit'),
                    'conditions' => array('Journal.transaction_date BETWEEN ? AND ?' => array($start_date, $end_date),'Journal.head_id' => 4, 'Journal.deleted' => 0),
                        'group' => array('Journal.category_id'),
                    ));
                    

                    foreach($asset_data as $asset):
                        $assetquery = "UPDATE `balance_sheets_".$user."` SET `requested_year` = ".($asset[0]['sum_debit'] - $asset[0]['sum_credit'])." WHERE `id` = ".$asset['Journal']['category_id'];
                        
                        $cn->query($assetquery);
                    endforeach;
                    
                    
                    //send OE and Liability transactions to temp table
                    $oe_liab_data = $this->Journal->find('all', array(
                    'fields' => array('SUM(Journal.debit) AS sum_debit', 'SUM(Journal.credit) AS sum_credit','Journal.id', 'Journal.transaction_date', 'Journal.category_id', 'Journal.debit', 'Journal.credit'),
                    'conditions' => array('Journal.transaction_date BETWEEN ? AND ?' => array($start_date, $end_date),'Journal.head_id = ? OR ?' => array(3,5), 'Journal.deleted' => 0),
                        'group' => array('Journal.category_id'),
                    ));
                    

                    foreach($oe_liab_data as $oe_liab):
                        $oe_liab_query = "UPDATE `balance_sheets_".$user."` SET `requested_year` = ".($oe_liab[0]['sum_credit'] - $oe_liab[0]['sum_debit'])." WHERE `id` = ".$oe_liab['Journal']['category_id'];
                        
                        $cn->query($oe_liab_query);
                    endforeach;
                    
                        
                    /* Previous Year */
                    //send asset transactions to temp table
                    $prev_asset_data = $this->Journal->find('all', array(
                    'fields' => array('SUM(Journal.debit) AS sum_debit', 'SUM(Journal.credit) AS sum_credit','Journal.id', 'Journal.transaction_date', 'Journal.category_id', 'Journal.debit', 'Journal.credit'),
                    'conditions' => array('Journal.transaction_date BETWEEN ? AND ?' => array($prev_start_date, $prev_end_date),'Journal.head_id' => 4, 'Journal.deleted' => 0),
                        'group' => array('Journal.category_id'),
                    ));
                    

                    foreach($prev_asset_data as $prev_asset):
                        $prev_assetquery = "UPDATE `balance_sheets_".$user."` SET `previous_year` = ".($prev_asset[0]['sum_debit'] - $prev_asset[0]['sum_credit'])." WHERE `id` = ".$prev_asset['Journal']['category_id'];
                        
                        $cn->query($prev_assetquery);
                    endforeach;
                    
                    
                    //send OE and Liability transactions to temp table
                    $prev_oe_liab_data = $this->Journal->find('all', array(
                    'fields' => array('SUM(Journal.debit) AS sum_debit', 'SUM(Journal.credit) AS sum_credit','Journal.id', 'Journal.transaction_date', 'Journal.category_id', 'Journal.debit', 'Journal.credit'),
                    'conditions' => array('Journal.transaction_date BETWEEN ? AND ?' => array($prev_start_date, $prev_end_date),'Journal.head_id' => 3, 'Journal.head_id' => 5, 'Journal.deleted' => 0),
                        'group' => array('Journal.category_id'),
                    ));
                    

                    foreach($prev_oe_liab_data as $prev_oe_liab):
                        $prev_oe_liab_query = "UPDATE `balance_sheets_".$user."` SET `previous_year` = ".($prev_oe_liab[0]['sum_credit'] - $prev_oe_liab[0]['sum_debit'])." WHERE `id` = ".$prev_oe_liab['Journal']['category_id'];
                        
                        $cn->query($prev_oe_liab_query);
                    endforeach;
                    /*end prev year */
                        
                   
                 
                    
                } else {
                    $message = 'Unable to create temporary balance sheet table';
                    $this->Session->write('emsg', $message);
                    $this->redirect(array('controller' => 'Reports', 'action' => 'balanceSheet'));
                }



                $bs_query = "SELECT * FROM `balance_sheets_".$user."`"; 
                $balance_sheet = $cn->query($bs_query);
                
                
                
                $this->set('e_date', $e_date);
                $this->set('pe_date', $pe_date);
                
                $this->set('statement_date', $statement_date);
                $this->set('balance_sheet', $balance_sheet);
                $this->set('user', $user);
            }
        }
    }

    function incomeStatement() {
        $this->__validateUserType2();

        if ($this->request->is('post')) {
            if ($this->request->data['IncomeStatement']['start_date'] == "" || $this->request->data['IncomeStatement']['start_date'] == null) {
                $message = 'Please indicate Start Date';
                $this->Session->write('emsg', $message);
                $this->redirect(array('controller' => 'Reports', 'action' => 'incomeStatement'));
            }
            if ($this->request->data['IncomeStatement']['end_date'] == "" || $this->request->data['IncomeStatement']['end_date'] == null) {
                $message = 'Please indicate End Date';
                $this->Session->write('emsg', $message);
                $this->redirect(array('controller' => 'Reports', 'action' => 'incomeStatement'));
            }


            $st_date = $this->request->data['IncomeStatement']['start_date'];
            $st_day = $st_date['day'];
            $st_month = $st_date['month'];
            $st_year = $st_date['year'];
            $start_date = $st_year . '-' . $st_month . '-' . $st_day;

            $e_date = $this->request->data['IncomeStatement']['end_date'];
            $e_day = $e_date['day'];
            $e_month = $e_date['month'];
            $e_year = $e_date['year'];
            $end_date = $e_year . '-' . $e_month . '-' . $e_day;
//            $end_date = implode('-', $e_date);


            $income_data = $this->Journal->find('all', array(
                'fields' => array('SUM(Journal.amount) AS sum_amount', 'Journal.category_id', 'TransactionCategory.category_name'),
                'conditions' => array('Journal.head_id' => 1, 'Journal.transaction_date BETWEEN ? AND ?' => array($start_date, $end_date), 'Journal.deleted' => 0),
                'group' => array('Journal.category_id'),
            ));


            $expense_data = $this->Journal->find('all', array(
                'fields' => array('SUM(Journal.amount) AS sum_amount', 'Journal.category_id', 'TransactionCategory.category_name'),
                'conditions' => array('Journal.head_id' => 2, 'Journal.transaction_date between ? and ?' => array($start_date, $end_date), 'Journal.deleted' => 0),
                'group' => array('Journal.category_id'),
            ));


            $this->set('start_date', $start_date);
            $this->set('end_date', $end_date);
            $this->set('income_data', $income_data);
            $this->set('expense_data', $expense_data);
        }
    }

    function ownersEquity() {
        $this->__validateUserType2();

        if ($this->request->is('post')) {
            if ($this->request->data['OwnersEquity']['start_date'] == "" || $this->request->data['OwnersEquity']['start_date'] == null) {
                $message = 'Please indicate Start Date';
                $this->Session->write('emsg', $message);
                $this->redirect(array('controller' => 'Reports', 'action' => 'ownersEquity'));
            }
            if ($this->request->data['OwnersEquity']['end_date'] == "" || $this->request->data['OwnersEquity']['end_date'] == null) {
                $message = 'Please indicate End Date';
                $this->Session->write('emsg', $message);
                $this->redirect(array('controller' => 'Reports', 'action' => 'ownersEquity'));
            }


            $st_date = $this->request->data['OwnersEquity']['start_date'];
            $st_day = $st_date['day'];
            $st_month = $st_date['month'];
            $st_year = $st_date['year'];
            $start_date = $st_year . '-' . $st_month . '-' . $st_day;

            $e_date = $this->request->data['OwnersEquity']['end_date'];
            $e_day = $e_date['day'];
            $e_month = $e_date['month'];
            $e_year = $e_date['year'];
            $end_date = $e_year . '-' . $e_month . '-' . $e_day;
//            $end_date = implode('-', $e_date);

            $income_data = $this->Journal->find('all', array(
                'fields' => array('SUM(Journal.amount) AS sum_amount', 'Journal.category_id', 'TransactionCategory.category_name'),
                'conditions' => array('Journal.head_id' => 1, 'Journal.transaction_date BETWEEN ? AND ?' => array($start_date, $end_date), 'Journal.deleted' => 0),
                'group' => array('Journal.category_id'),
            ));


            $expense_data = $this->Journal->find('all', array(
                'fields' => array('SUM(Journal.amount) AS sum_amount', 'Journal.category_id', 'TransactionCategory.category_name'),
                'conditions' => array('Journal.head_id' => 2, 'Journal.transaction_date BETWEEN ? AND ?' => array($start_date, $end_date), 'Journal.deleted' => 0),
                'group' => array('Journal.category_id'),
            ));

            $oe_investment = $this->Journal->find('all', array(
                'fields' => array('SUM(Journal.credit) AS sum_credit', 'Journal.category_id', 'TransactionCategory.category_name'),
                'conditions' => array('Journal.head_id' => 3, 'Journal.transaction_date between ? and ?' => array($start_date, $end_date), 'Journal.deleted' => 0),
                'group' => array('Journal.category_id'),
            ));

            $oe_withdrawal = $this->Journal->find('all', array(
                'fields' => array('SUM(Journal.debit) AS sum_debit', 'Journal.category_id', 'TransactionCategory.category_name'),
                'conditions' => array('Journal.head_id' => 3, 'Journal.transaction_date between ? and ?' => array($start_date, $end_date), 'Journal.deleted' => 0),
                'group' => array('Journal.category_id'),
            ));

            $this->set('start_date', $start_date);
            $this->set('end_date', $end_date);
            $this->set('income_data', $income_data);
            $this->set('expense_data', $expense_data);
            $this->set('oe_investment', $oe_investment);
            $this->set('oe_withdrawal', $oe_withdrawal);
        }
    }

    function getStatementDates() {

//        $this->set('statement_dates', $statement_dates);
        $this->autoRender = false;
        $this->autoLayout = false;

        if ($this->request->is('ajax')) {


            if (!empty($_POST['ID'])) {

                $ID = $_POST['ID'];
                $statements = $this->StatedBankBalance->find('all', array('fields' => array('id', 'statement_date'), 'conditions' => array('StatedBankBalance.account_id' => $ID)));

                if ($statements) {
//                    foreach ($statements as $each):
//                        $statement_dates[] = $each['StatedBankBalance']['statement_date'];
//                    endforeach;
                    $itemLsts = json_encode($statements);
                    return $itemLsts;
                }else {
                    $message = 'Please select a Statement Date';
                    $this->Session->write('imsg', $message);
                    $error = json_encode(array("error" => "No Data For Account"));
                    return $error;
                }
            } else {
                $error = json_encode(array("error" => "INVALID SELECTION"));
                return $error;
            }
        }
    }

    function bankReconciliation() {
        $this->__validateUserType2();
//        $accounts = $this->CashAccount->find('list');
//        $this->set('accounts', $accounts);
        $accounts = $this->CashAccount->find('all', array('fields' => array('id', 'Bank.bank_name', 'account_no', 'Zone.zone')));
        foreach ($accounts as $each_item):
            $list[$each_item['CashAccount']['id']] = $each_item['Zone']['zone'] . ' -- ' . $each_item['CashAccount']['account_no'];
        endforeach;
        $this->set('accounts', $list);




        if ($this->request->is('post')) { //if form submitted
            $account_id = $this->request->data['Account']['account_id'];

            if ($account_id != "" || $account_id != null) { //if a bank account is selected
                $this->set('balance_details', $this->StatedBankBalance->find('all', array('fields' => array('StatedBankBalance.statement_date'), 'conditions' => array('StatedBankBalance.account_id' => $account_id))));







                if ($this->request->data['Account']['statement_date'] != "" || $this->request->data['Account']['statement_date'] != null) { //if both bank account and bank statement balance date are selected
                    $statement_date = $this->request->data['Account']['statement_date'];
                    $statement_date = date('Y-m-d',strtotime($statement_date));
                    $stated_balance = $this->StatedBankBalance->find('all', array(
                        'fields' => array('SUM(StatedBankBalance.amount) AS sum_amount'),
                        'conditions' => array('StatedBankBalance.statement_date' => $statement_date, 'StatedBankBalance.account_id' => $account_id),
                    ));
//                    
//                    $received_sum = $this->BankTransfer->find('all', array(
//                        'fields' => array('SUM(BankTransfer.amount) AS sum_amount'),
//                        'conditions' => array('BankTransfer.transfer_date <=' => $statement_date, 'BankTransfer.dest_account_id' => $account_id),
//                        ));
//                    
//                    $transferred_sum = $this->BankTransfer->find('all', array(
//                        'fields' => array('SUM(BankTransfer.amount) AS sum_amount'),
//                        'conditions' => array('BankTransfer.transfer_date <=' => $statement_date, 'BankTransfer.source_account_id' => $account_id),
//                        ));
//                    
//                    $income = $this->Journal->find('all', array(
//                        'fields' => array('SUM(Journal.amount) AS sum_amount'),
//                        'conditions' => array('Journal.transaction_date <=' => $statement_date, 'Journal.account_id' => $account_id, 'Journal.head_id' => 1),
//                        ));
//                    
//                    $expenses = $this->Journal->find('all', array(
//                        'fields' => array('SUM(Journal.amount) AS sum_amount'),
//                        'conditions' => array('Journal.transaction_date <=' => $statement_date, 'Journal.account_id' => $account_id, 'Journal.head_id' => 2),
//                        ));
                    $cash = $this->BankBalance->find('first', array(
                        'conditions' => array('BankBalance.created <=' => $statement_date, 'BankBalance.account_id' => $account_id),
                        'order' => array('BankBalance.id' => 'DESC'),
                    ));




//                    $balance_per_books = $income[0][0]['sum_amount'] - $expenses[0][0]['sum_amount'] + $received_sum[0][0]['sum_amount'] - $transferred_sum[0][0]['sum_amount'];

                    $balance_per_books = $cash['BankBalance']['amount'];

                    $uncleared_receive_cheques = $this->BankTransfer->find('all', array(
                        'fields' => array('SUM(BankTransfer.amount) AS sum_amount', 'cheque_no', 'amount'),
                        'conditions' => array('BankTransfer.transfer_date <=' => $statement_date, 'BankTransfer.dest_account_id' => $account_id, 'BankTransfer.cheque_no !=' => '', 'BankTransfer.cheque_no !=' => null, 'BankTransfer.cheque_cleared' => 0,
                    )));
                    $uncleared_payout_cheques = $this->BankTransfer->find('all', array(
                        'fields' => array('SUM(BankTransfer.amount) AS sum_amount', 'cheque_no', 'amount'),
                        'conditions' => array('BankTransfer.transfer_date <=' => $statement_date, 'BankTransfer.source_account_id' => $account_id, 'BankTransfer.cheque_no !=' => '', 'BankTransfer.cheque_no !=' => null, 'BankTransfer.cheque_cleared' => 0,
                    )));
//                    $uncleared_income_cheques = $this->Journal->find('all', array(
//                        'fields' => array('SUM(Journal.amount) AS sum_amount', 'cheque_no', 'amount'),
//                        'conditions' => array('Journal.transaction_date <=' => $statement_date, 'Journal.account_id' => $account_id, 'Journal.head_id' => 1,'Journal.cheque_no !=' => '', 'Journal.cheque_no !=' => null, 'Journal.cheque_cleared' => 0),
//                        ));
//                    $uncleared_expense_cheques = $this->Journal->find('all', array(
//                        'fields' => array('SUM(Journal.amount) AS sum_amount', 'cheque_no', 'amount'),
//                        'conditions' => array('Journal.transaction_date <=' => $statement_date, 'Journal.account_id' => $account_id, 'Journal.cheque_no !=' => '', 'Journal.cheque_no !=' => null, 'Journal.head_id' => 2, 'Journal.cheque_cleared' => 0),
//                        ));
//                    $uncleared_oe_inv_cheques = $this->Journal->find('all', array(
//                        'fields' => array('SUM(Journal.credit) AS sum_amount', 'cheque_no', 'amount', 'credit'),
//                        'conditions' => array('Journal.transaction_date <=' => $statement_date, 'Journal.account_id' => $account_id, 'Journal.head_id' => 3, 'Journal.cheque_no !=' => '','Journal.cheque_no !=' => null, 'Journal.cheque_cleared' => 0),
//                        ));
//                    $uncleared_oe_exp_cheques = $this->Journal->find('all', array(
//                        'fields' => array('SUM(Journal.debit) AS sum_amount', 'cheque_no', 'amount', 'debit'),
//                        'conditions' => array('Journal.transaction_date <=' => $statement_date, 'Journal.account_id' => $account_id, 'Journal.cheque_no !=' => '', 'Journal.cheque_no !=' => null, 'Journal.head_id' => 3, 'Journal.cheque_cleared' => 0),
//                        ));
                    $uncleared_cash_asset_debit_cheques = $this->Journal->find('all', array(
                        'fields' => array('SUM(Journal.debit) AS sum_amount', 'cheque_no', 'amount', 'debit'),
                        'conditions' => array('Journal.transaction_date <=' => $statement_date, 'Journal.account_id' => $account_id, 'Journal.head_id' => 4, 'Journal.category_id' => 101, 'Journal.cheque_no !=' => '', 'Journal.cheque_no !=' => null, 'Journal.cheque_cleared' => 0),
                    ));
                    $uncleared_cash_asset_credit_cheques = $this->Journal->find('all', array(
                        'fields' => array('SUM(Journal.credit) AS sum_amount', 'cheque_no', 'amount', 'credit'),
                        'conditions' => array('Journal.transaction_date <=' => $statement_date, 'Journal.account_id' => $account_id, 'Journal.head_id' => 4, 'Journal.category_id' => 101, 'Journal.cheque_no !=' => null, 'Journal.cheque_cleared' => 0),
                    ));


                    $total_deposit_cheques_in_transit = $uncleared_receive_cheques + $uncleared_cash_asset_debit_cheques;


                    $this->set('statement_date', $statement_date);
                    $this->set('stated_balance', $stated_balance);
                    $this->set('balance_per_books', $balance_per_books);
                    $this->set('uncleared_receive_cheques', $uncleared_receive_cheques);
                    $this->set('uncleared_payout_cheques', $uncleared_payout_cheques);
//                    $this->set('uncleared_income_cheques', $uncleared_income_cheques);
//                    $this->set('uncleared_expense_cheques', $uncleared_expense_cheques);
//                    $this->set('uncleared_oe_inv_cheques', $uncleared_oe_inv_cheques);
//                    $this->set('uncleared_oe_exp_cheques', $uncleared_oe_exp_cheques);
                    $this->set('uncleared_cash_asset_debit_cheques', $uncleared_cash_asset_debit_cheques);
                    $this->set('uncleared_cash_asset_credit_cheques', $uncleared_cash_asset_credit_cheques);
                    $this->set('total_deposit_cheques_in_transit', $total_deposit_cheques_in_transit);
                } else {//only bank account selected. give info on what to do next.
                    $message = 'Please select a Statement Date';
                    $this->Session->write('imsg', $message);
//                    $this->redirect(array('controller' => 'Reports', 'action' => 'bankReconciliation'));    
                }
            } else {//no bank account selected
                $message = 'Please select an Account';
                $this->Session->write('emsg', $message);
                $this->redirect(array('controller' => 'Reports', 'action' => 'bankReconciliation'));
            }
        }
    }

    function activeAccounts() {
        $this->__validateUserType2();
        $this->paginate('Order');

        //$accounts =  $this->Order->find('all', array('group' => array('Order.customer_id'),'conditions' => array('Order.balance >' => 0,'status' => 'Approved','delivery' => 'Delivered'),'fields' => array('DISTINCT Order.customer_id', 'SUM(Order.balance) As bal','Order.amount_paid','Customer.fullname','Customer.mobile_no','Order.last_date')));
        $accounts = $this->Order->find('all', array('Order' => array('Customer.fullname' => 'asc'), 'conditions' => array('Order.balance >' => 0, 'status' => 'Approved', 'delivery' => 'Delivered')));
        if ($accounts) {
            // pr($accounts);
            $this->set('accounts', $accounts);
        }
    }

    function expectedInstallment() {
        $this->__validateUserType2();
        $this->paginate('Order');

        if ($this->request->is('post')) {

            $sday = $this->request->data['Order']['begin_date']['day'];
            $smonth = $this->request->data['Order']['begin_date']['month'];
            $syear = $this->request->data['Order']['begin_date']['year'];
            $starts_date = $syear . "-" . $smonth . "-" . $sday;
            $snewdate = strtotime($starts_date);
            $start_date = date('Y-m-d', $snewdate);
            $frstart_date = date('d F, Y', $snewdate);

            $eday = $this->request->data['Order']['finish_date']['day'];
            $emonth = $this->request->data['Order']['finish_date']['month'];
            $eyear = $this->request->data['Order']['finish_date']['year'];
            $ends_date = $eyear . "-" . $emonth . "-" . $eday;
            $enewdate = strtotime($ends_date);
            $end_date = date('Y-m-d', $enewdate);
            $frend_date = date('d F, Y', $enewdate);

            $this->set('frstart_date', $frstart_date);
            $this->set('frend_date', $frend_date);

            $lateday = date('Y-m-t');
            $firstday = date('Y-m-01');
            $accounts = $this->Order->find('all', array('Order' => array('Customer.fullname' => 'asc'), 'conditions' => array('AND' => array(array('due_date >=' => $start_date), array('due_date <=' => $end_date), array('Order.balance >' => 0), array('status' => 'Approved'), array('delivery' => 'Delivered')))));



            $total = $this->Order->find('all', array('Order' => array('Customer.fullname' => 'asc'), 'conditions' => array('AND' => array(array('due_date >=' => $start_date), array('due_date <=' => $end_date), array('Order.balance >' => 0), array('status' => 'Approved'), array('delivery' => 'Delivered'))), 'fields' => array("SUM((Order.amount_paid)) as 'paidtotal'", "SUM((Order.mthly_install)) as 'balinstalmt'")));
            if ($accounts) {

                $this->set('accounts', $accounts);
                if ($total) {

                    $this->set('total', $total);
                }
            }
        }
        //date('F d, Y',$enewdate);
    }

    function expectedInstallment1() {
        $this->__validateUserType2();
        $this->paginate('Expectedinstallment');

        if ($this->request->is('post')) {

            $sday = $this->request->data['Expectedinstallment']['begin_date']['day'];
            $smonth = $this->request->data['Expectedinstallment']['begin_date']['month'];
            $syear = $this->request->data['Expectedinstallment']['begin_date']['year'];
            $starts_date = $syear . "-" . $smonth . "-" . $sday;
            $snewdate = strtotime($starts_date);
            $start_date = date('Y-m-d', $snewdate);
            $frstart_date = date('d F, Y', $snewdate);

            $eday = $this->request->data['Expectedinstallment']['finish_date']['day'];
            $emonth = $this->request->data['Expectedinstallment']['finish_date']['month'];
            $eyear = $this->request->data['Expectedinstallment']['finish_date']['year'];
            $ends_date = $eyear . "-" . $emonth . "-" . $eday;
            $enewdate = strtotime($ends_date);
            $end_date = date('Y-m-d', $enewdate);
            $date = new DateTime($end_date);
            // $date->add(new DateInterval('P1D'));
            $end_date = $date->format('Y-m-d');
            $frend_date = date('d F, Y', $enewdate);

            $this->set('frstart_date', $frstart_date);
            $this->set('frend_date', $frend_date);

            $lateday = date('Y-m-t');
            $firstday = date('Y-m-01');
            $accounts = $this->Expectedinstallment->find('all', array('order' => array('Customer.fullname' => 'asc'), 'conditions' => array('AND' => array(array('Expectedinstallment.due_date >=' => $start_date), array('Expectedinstallment.due_date <=' => $end_date), array('Order.balance >' => 0), array('Order.payment_status !=' => 'full_payment'), array('Expectedinstallment.balance >' => 0), array('Order.status' => 'Approved'), array('Expectedinstallment.payment_status !=' => 'full_payment')))));



            $total = $this->Expectedinstallment->find('all', array('order' => array('Customer.fullname' => 'asc'), 'conditions' => array('AND' => array(array('Expectedinstallment.due_date >=' => $start_date), array('Expectedinstallment.due_date <=' => $end_date), array('Order.balance >' => 0), array('Order.payment_status !=' => 'full_payment'), array('Order.status' => 'Approved'), array('Expectedinstallment.payment_status !=' => 'full_payment'))), 'fields' => array("SUM((Expectedinstallment.paid_install)) as paidtotal", "SUM((Expectedinstallment.expected_installment)) as instalmt", "SUM((Expectedinstallment.balance)) as bal", "SUM((Expectedinstallment.default_interest)) as interest")));
            if ($accounts) {

                $this->set('accounts', $accounts);
                if ($total) {

                    $this->set('total', $total);
                }
            }
        }
        //date('F d, Y',$enewdate);
    }

    function expectedInstallmentZone() {
        $this->__validateUserType();
        $this->paginate('Order');
        $this->set('zones', $this->Zone->find('list'));
        if ($this->request->is('post')) {

            $sday = $this->request->data['Order']['begin_date']['day'];
            $smonth = $this->request->data['Order']['begin_date']['month'];
            $syear = $this->request->data['Order']['begin_date']['year'];
            $starts_date = $syear . "-" . $smonth . "-" . $sday;
            $snewdate = strtotime($starts_date);
            $start_date = date('Y-m-d', $snewdate);
            $frstart_date = date('d F, Y', $snewdate);

            $eday = $this->request->data['Order']['finish_date']['day'];
            $emonth = $this->request->data['Order']['finish_date']['month'];
            $eyear = $this->request->data['Order']['finish_date']['year'];
            $ends_date = $eyear . "-" . $emonth . "-" . $eday;
            $enewdate = strtotime($ends_date);
            $end_date = date('Y-m-d', $enewdate);
            $frend_date = date('d F, Y', $enewdate);

            $this->set('frstart_date', $frstart_date);
            $this->set('frend_date', $frend_date);

            $zoneid = $this->request->data['Order']['zone_id'];

            $zone_data = $this->Zone->find('first', array('conditions' => array('Zone.id' => $zoneid)));
            if ($zone_data) {
                $this->set('zone_name', $zone_data['Zone']['zone']);
            }
            $lateday = date('Y-m-t');
            $firstday = date('Y-m-01');
            $accounts = $this->Order->find('all', array('Order' => array('Customer.fullname' => 'asc'), 'conditions' => array('AND' => array(array('Order.due_date >=' => $start_date), array('Order.due_date <=' => $end_date), array('Order.balance >' => 0), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered'), array('Order.zone_id' => $zoneid)))));


            $total = $this->Order->find('all', array('Order' => array('Customer.fullname' => 'asc'), 'conditions' => array('AND' => array(array('Order.due_date >=' => $start_date), array('Order.due_date <=' => $end_date), array('Order.balance >' => 0), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered'), array('Order.zone_id' => $zoneid))), 'fields' => array("SUM((Order.balance)) as 'baltotal'", "SUM((Order.mthly_install)) as 'balinstalmt'"), 'group' => array('Order.zone_id')));

            if ($accounts) {

                $this->set('accounts', $accounts);
                if ($total) {

                    $this->set('total', $total);
                }
            }
        }
    }

    function expectedInstallmentZone1() {
        $this->__validateUserType2();
        $this->paginate('Expectedinstallment');
        $this->set('zones', $this->Zone->find('list'));

        if ($this->request->is('post')) {

            $sday = $this->request->data['Expectedinstallment']['begin_date']['day'];
            $smonth = $this->request->data['Expectedinstallment']['begin_date']['month'];
            $syear = $this->request->data['Expectedinstallment']['begin_date']['year'];
            $starts_date = $syear . "-" . $smonth . "-" . $sday;
            $snewdate = strtotime($starts_date);
            $start_date = date('Y-m-d', $snewdate);
            $frstart_date = date('d F, Y', $snewdate);

            $eday = $this->request->data['Expectedinstallment']['finish_date']['day'];
            $emonth = $this->request->data['Expectedinstallment']['finish_date']['month'];
            $eyear = $this->request->data['Expectedinstallment']['finish_date']['year'];
            $ends_date = $eyear . "-" . $emonth . "-" . $eday;
            $enewdate = strtotime($ends_date);
            $end_date = date('Y-m-d', $enewdate);
            $date = new DateTime($end_date);
            //$date->add(new DateInterval('P1D'));
            $end_date = $date->format('Y-m-d');
            $frend_date = date('d F, Y', $enewdate);

            $this->set('frstart_date', $frstart_date);
            $this->set('frend_date', $frend_date);

            $zoneid = $this->request->data['Expectedinstallment']['zone_id'];

            $zone_data = $this->Zone->find('first', array('conditions' => array('Zone.id' => $zoneid)));
            if ($zone_data) {
                $this->set('zone_name', $zone_data['Zone']['zone']);
            }
            $lateday = date('Y-m-t');
            $firstday = date('Y-m-01');
            $accounts = $this->Expectedinstallment->find('all', array('order' => array('Customer.fullname' => 'asc'), 'conditions' => array('AND' => array(array('Expectedinstallment.due_date >=' => $start_date), array('Expectedinstallment.due_date <=' => $end_date), array('Order.balance >' => 0), array('Order.payment_status !=' => 'full_payment'), array('Order.status' => 'Approved'), array('Expectedinstallment.balance >' => 0), array('Expectedinstallment.payment_status !=' => 'full_payment'), array('Order.zone_id' => $zoneid)))));

//, 'group' => array('Expectedinstallment.zone_id')
            $total = $this->Expectedinstallment->find('all', array('order' => array('Customer.fullname' => 'asc'), 'conditions' => array('AND' => array(array('Expectedinstallment.due_date >=' => $start_date), array('Expectedinstallment.due_date <=' => $end_date), array('Order.balance >' => 0), array('Order.payment_status !=' => 'full_payment'), array('Expectedinstallment.balance >' => 0), array('Order.status' => 'Approved'), array('Expectedinstallment.payment_status  !=' => 'full_payment'), array('Order.zone_id' => $zoneid))), 'fields' => array("SUM((Expectedinstallment.balance)) as baltotal", "SUM((Expectedinstallment.expected_installment)) as instalmt", "SUM((Expectedinstallment.paid_install)) as paid", "SUM((Expectedinstallment.default_interest)) as interest")));

            if ($accounts) {

                $this->set('accounts', $accounts);
                if ($total) {

                    $this->set('total', $total);
                }
            }
        }
    }

    public function customerpaymentDetails($order_id = null, $custname = null, $amount_paid = null, $balance = null) {
        $this->__validateUserType2();
        $this->paginate('Payment');

        $last_payment = $this->Expectedinstallment->find('all', array('conditions' => array('Expectedinstallment.order_id' => $order_id), 'order' => array('Expectedinstallment.id ASC')));
        if ($last_payment) {


            $this->set('data', $last_payment);
            $this->set('order_id', $order_id);
            $this->set('custname', $custname);
            $this->set('amount', $amount_paid);
            $this->set('balance', $balance);
        } else {

            $message = 'Unable To Load Payment Data';
            $this->Session->write('emsg', $message);
            $this->redirect(array('controller' => 'Reports', 'action' => 'customerpaymentDetails1'));
        }
    }

    public function customerpaymentDetails1() {
        $this->__validateUserType3();
        $data = $this->paginate('Customer');
        $this->set('customer', $data);
//        
        $check = $this->Session->check('cscust');
        if ($check) {
            $cust = $this->Session->read('cscust');
            $this->set('cust', $cust);
        }
        $check = $this->Session->check('cscusts');
        if ($check) {
            $custs = $this->Session->read('cscusts');
            $this->set('customer', $custs);
        }
    }

    public function searchOrder($sorder = Null) {

        $this->autoRender = false;
        if ($this->request->is('post')) {
            $custname = $this->request->data['order_search'];
            $customer = $this->Customer->find('all', array('conditions' => array('OR' => array(array('Customer.surname LIKE' => "%$custname%"), array('Customer.first_name LIKE' => "%$custname%"), array('Customer.fullname LIKE' => "%$custname%")))));

            if ($customer) {
//            $cust = $this->Session->write('cust',$customer);

                $this->Session->write('cscusts', $customer);
                $this->redirect(array('controller' => 'Reports', 'action' => 'customerpaymentDetails1'));
            } else {
                $this->Session->write('Sorry Customer Not Found');
                $this->redirect(array('controller' => 'Reports', 'action' => 'customerpaymentDetails1'));
            }
        } else {

            $customers = $this->Customer->find('all', array('conditions' => array('Customer.id' => $sorder)));
            $customer = $this->Customer->find('first', array('conditions' => array('Customer.id' => $sorder)));
            if ($customers) {
                $check = $this->Session->check('cscusts');
                if ($check) {
                    $this->Session->delete('cscusts');
                }
                $check = $this->Session->check('cscust');
                if ($check) {
                    $this->Session->delete('cscust');
                }
                $check = $this->Session->check('cscustID');
                if ($check) {
                    $this->Session->delete('cscustID');
                }
                $cust = $this->Session->write('cscusts', $customers);
                $this->Session->write('cscust', $customer);
                $this->Session->write('cscustID', $sorder);
                $this->redirect(array('controller' => 'Reports', 'action' => 'customerpaymentDetails1'));
            } else {

                $message = 'Sorry, Customer Not Found';
                $this->Session->write('emsg', $message);
                $this->redirect(array('controller' => 'Reports', 'action' => 'customerpaymentDetails1'));
            }
        }

//        
    }

    public function clearOrdersearchSessions() {
        $check = $this->Session->check('cscust');
        if (!$check) {
            $message = 'No Customer selected';
            $this->Session->write('emsg', $message);
            $this->redirect(array('controller' => 'Reports', 'action' => 'customerpaymentDetails1'));
        }



        $this->redirect(array('controller' => 'Reports', 'action' => 'customerpaymentDetails2'));
    }

    public function customerpaymentDetails2() {

        $this->__validateUserType2();
        $this->paginate('Order');
//        $this->set('data', $data);

        $check = $this->Session->check('cscust');
        if ($check) {
            $order = $this->Session->read('cscust');
            $order_id = $order['Customer']['id'];
            $order_details = $this->Order->find('all', array('conditions' => array('Order.customer_id' => $order_id, 'Order.status !=' => 'Deleted')));
            if ($order_details) {
                $this->set('data', $order_details);

                $this->Session->delete('cscust');
                $this->Session->delete('cscusts');
            } else {
                $this->redirect(array('controller' => 'Reports', 'action' => 'customerpaymentDetails1'));
            }
        }
//        $check = $this->Session->check('order');
//        if ($check) {
//            $order = $this->Session->read('order');
//
//            $this->set('data', $order);
//        }
    }

    function groupSales() {
        $this->__validateUserType2();
        $this->set('users', $this->User->find('list', array('conditions' => array('User.usertype_id' => 11))));
        $this->paginate('OrdersItem');
        if ($this->request->is('post')) {
            $userid = $this->request->data['Order']['user_id'];
            $user = $this->User->find('first', array('conditions' => array('User.id' => $userid)));
            $month = $this->request->data['Order']['month']['month'];
            $year = $this->request->data['Order']['year']['year'];
            $zones= $this->Zone->find('list');
            $this->set('zones',$zones);
            
if(!empty($userid)){
            if ($user) {
                $username = $user['User']['firstname']." ".$user['User']['lastname'];
                $this->set('sales_name', $username);
                $datestart = strtotime($year . "-" . $month . "-" . "01");
                $start_date = date('Y-m-d', $datestart);
                $dateend = date('Y-m-t', $datestart);
                $date = new DateTime($dateend);
//            $date->add(new DateInterval('P1D'));
                $dateend = $date->format('Y-m-d');
                $month_year = date('F Y', $datestart);
                $this->set('date', $month_year);
//                $accounts = $this->OrdersItem->find('all', array('Order' => array('Customer.fullname' => 'asc'), 'conditions' => array('AND' => array(array('Order.order_date >=' => $start_date), array('Order.order_date <=' => $dateend), array('OrdersItem.user_id' => $userid), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered')))));
//
//               
//
//                $total = $this->OrdersItem->find('all', array('Order' => array('Customer.fullname' => 'asc'), 'conditions' => array('AND' => array(array('Order.order_date >=' => $start_date), array('Order.order_date <=' => $dateend), array('OrdersItem.user_id' => $userid), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered'))), 'fields' => array("SUM((Item.selling_price * OrdersItem.quantity)) as 'paidtotal'"), 'group' => array('Order.sales_person')));
//
//                if ($accounts) {
//
//                    $this->set('accounts', $accounts);
//                    if ($total) {
//
//                        $this->set('total', $total);
//                    }
//                }
                 $sales = $this->SalesItem->find('all', array('Order' => array('Customer.fullname' => 'asc'), 'conditions' => array('Sale.sale_date BETWEEN ? AND ?' =>
                    array($start_date, $dateend),  array('SalesItem.user_id' => $userid), array('Sale.status' => 'alive'))));
                 
                $sales_tot = $this->SalesItem->find('all', array('Order' => array('Customer.fullname' => 'asc'), 'conditions' => array('Sale.sale_date BETWEEN ? AND ?' =>
                    array($start_date, $dateend), array('SalesItem.user_id' => $userid), array('Sale.status' => 'alive')), 'fields' => array("SUM((Item.selling_price * SalesItem.quantity)) as 'paidtotal'"), 'group' => array('SalesItem.user_id')));
if ($sales) {
                        //  $this->set('customer', $accounts[0]['Client']['client_name']);
                        $this->set('sales', $sales);
                        if ($sales_tot) {
                            $this->set('salestotal', $sales_tot);
                        }
                    }
            }
}else{
                $this->set('sales_name', 'All Attendants');
                $datestart = strtotime($year . "-" . $month . "-" . "01");
                $start_date = date('Y-m-d', $datestart);
                $dateend = date('Y-m-t', $datestart);
                $date = new DateTime($dateend);
//            $date->add(new DateInterval('P1D'));
                $dateend = $date->format('Y-m-d');
                $month_year = date('F Y', $datestart);
                $this->set('date', $month_year);
//                $accounts = $this->OrdersItem->find('all', array('Order' => array('Customer.fullname' => 'asc'), 'conditions' => array('AND' => array(array('Order.order_date >=' => $start_date), array('Order.order_date <=' => $dateend), array('OrdersItem.user_id' => $userid), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered')))));
//
//               
//
//                $total = $this->OrdersItem->find('all', array('Order' => array('Customer.fullname' => 'asc'), 'conditions' => array('AND' => array(array('Order.order_date >=' => $start_date), array('Order.order_date <=' => $dateend), array('OrdersItem.user_id' => $userid), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered'))), 'fields' => array("SUM((Item.selling_price * OrdersItem.quantity)) as 'paidtotal'"), 'group' => array('Order.sales_person')));
//
//                if ($accounts) {
//
//                    $this->set('accounts', $accounts);
//                    if ($total) {
//
//                        $this->set('total', $total);
//                    }
//                }
                 $sales = $this->SalesItem->find('all', array('Order' => array('User.zone_id' => 'asc'), 'conditions' => array('Sale.sale_date BETWEEN ? AND ?' =>
                    array($start_date, $dateend),   array('Sale.status' => 'alive')), 'group' => array('SalesItem.user_id'),'fields' => array('User.zone_id','User.firstname','User.lastname',"SUM((SalesItem.unit_price * SalesItem.quantity)) as 'paidtotal'")));
                 
                $sales_tot = $this->SalesItem->find('all', array('Order' => array('User.zone_id' => 'asc'), 'conditions' => array('Sale.sale_date BETWEEN ? AND ?' =>
                    array($start_date, $dateend),   array('Sale.status' => 'alive')), 'fields' => array("SUM((SalesItem.unit_price * SalesItem.quantity)) as 'paidtotal'")));
if ($sales) {
                        //  $this->set('customer', $accounts[0]['Client']['client_name']);
                        $this->set('groupsales', $sales);
                        if ($sales_tot) {
                            $this->set('salestotal', $sales_tot);
                        }
                    }
            
} 
        }
    }

//    function groupSales1() {
//        $this->set('users', $this->User->find('list'));
//        
//    }

    function salesExecClient() {
        $this->__validateUserType2();
        $this->set('users', $this->User->find('list', array('conditions' => array('User.usertype_id' => array(4, 3, 7, 1)),'order' => array('User.username' => 'asc'))));
        $this->paginate('OrdersItem');
        if ($this->request->is('post')) {

            $sday = $this->request->data['OrdersItem']['begin_date']['day'];
            $smonth = $this->request->data['OrdersItem']['begin_date']['month'];
            $syear = $this->request->data['OrdersItem']['begin_date']['year'];
            $starts_date = $syear . "-" . $smonth . "-" . $sday;
            $snewdate = strtotime($starts_date);
            $start_date = date('Y-m-d', $snewdate);

            $eday = $this->request->data['OrdersItem']['finish_date']['day'];
            $emonth = $this->request->data['OrdersItem']['finish_date']['month'];
            $eyear = $this->request->data['OrdersItem']['finish_date']['year'];
            $ends_date = $eyear . "-" . $emonth . "-" . $eday;
            $enewdate = strtotime($ends_date);
            $end_date = date('Y-m-d', $enewdate);
            $date = new DateTime($end_date);
//            $date->add(new DateInterval('P1D'));
            $end_date = $date->format('Y-m-d');

            // $customer_id = $this->request->data['OrdersItem']['customer'];
            $sales_pers_id = $this->request->data['OrdersItem']['user_id'];
            $sales_pers = $this->User->find('first', array('conditions' => array('User.id' => $sales_pers_id)));
            if (!empty($sales_pers_id)) {
                $username = $sales_pers['User']['username'];
                $sales_pers_id = $sales_pers['User']['id'];
                if ($sales_pers_id != "" && !is_null($sales_pers_id)) {

                    $accounts = $this->OrdersItem->find('all', array('conditions' => array('DATE(Order.order_date) BETWEEN ? AND ?' =>
                    array($start_date, $end_date),  array('Order.sales_person' => $username), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered'))));

                    $total = $this->OrdersItem->find('all', array('conditions' => array('DATE(Order.order_date) BETWEEN ? AND ?' =>
                    array($start_date, $end_date), 
                        array('Order.sales_person' => $username), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered')), 'fields' => array("SUM((Item.selling_price * OrdersItem.quantity)) as 'total'")));
                    if ($accounts) {
                        // $this->set('customer', $accounts[0]['Customer']['fullname']);

                        $this->set('accounts', $accounts);
                        if ($total) {
                            $this->set('total', $total);
                        }
                    }

                    $sales = $this->SalesItem->find('all', array('conditions' => array('DATE(Sale.sale_date) BETWEEN ? AND ?' =>
                    array($start_date, $end_date),  array('Sale.sales_person' => $username), array('Sale.status' => 'alive'))));
                    // array('Sale.user_id' => $sales_pers_id),

                    $sales_tot = $this->SalesItem->find('all', array('conditions' => array('DATE(Sale.sale_date) BETWEEN ? AND ?' =>
                    array($start_date, $end_date), 
                        array('Sale.sales_person' => $username), array('Sale.status' => 'alive')), 'fields' => array("SUM((SalesItem.unit_price * SalesItem.quantity)) as 'stotal'")));
                    // array('Sale.user_id' => $sales_pers_id),
                    if ($sales) {
                        //  $this->set('customer', $accounts[0]['Client']['client_name']);
                        $this->set('sales', $sales);
                        if ($sales_tot) {
                            $this->set('salestotal', $sales_tot);
                        }
                    }
                } 
            }else{


                    $accounts = $this->OrdersItem->find('all', array('conditions' => array('DATE(Order.order_date) BETWEEN ? AND ?' =>
                    array($start_date, $end_date), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered'))));

                    $total = $this->OrdersItem->find('all', array('conditions' => array('DATE(Order.order_date) BETWEEN ? AND ?' =>
                    array($start_date, $end_date), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered')), 
                        'fields' => array("SUM((Item.selling_price * OrdersItem.quantity)) as 'total'")));


                    if ($accounts) {

                        $this->set('accounts', $accounts);
                        if ($total) {
                            $this->set('total', $total);
                        }
                    }
                    $sales = $this->SalesItem->find('all', array('conditions' => array('DATE(Sale.sale_date) BETWEEN ? AND ?' =>
                    array($start_date, $end_date), array('Sale.status' => 'alive'))));

                    $sales_tot = $this->SalesItem->find('all', array('conditions' => array('DATE(Sale.sale_date) BETWEEN ? AND ?' =>
                    array($start_date, $end_date), array('Sale.status' => 'alive')), 'fields' => array("SUM((SalesItem.unit_price * SalesItem.quantity)) as 'stotal'")));

                    if ($sales) {

                        // $this->set('customer', $accounts[0]['Client']['client_name']);
                        $this->set('sales', $sales);
                        if ($sales_tot) {
                            $this->set('salestotal', $sales_tot);
                        }
                    }
                }
                $newstart_date = date('d-M-Y', $snewdate);
                $newend_date = date('d-M-Y', $enewdate);
                $this->set('start_date', $newstart_date);
                $this->set('end_date', $newend_date);
        }
    }

    function zonalSales() {
        $this->__validateUserType2();

        $this->set('zones', $this->Zone->find('list'));
        $this->paginate('OrdersItem');
        if ($this->request->is('post')) {

            $sday = $this->request->data['OrdersItem']['begin_date']['day'];
            $smonth = $this->request->data['OrdersItem']['begin_date']['month'];
            $syear = $this->request->data['OrdersItem']['begin_date']['year'];
            $starts_date = $syear . "-" . $smonth . "-" . $sday;
            $snewdate = strtotime($starts_date);
            $start_date = date('Y-m-d', $snewdate);

            $eday = $this->request->data['OrdersItem']['finish_date']['day'];
            $emonth = $this->request->data['OrdersItem']['finish_date']['month'];
            $eyear = $this->request->data['OrdersItem']['finish_date']['year'];
            $ends_date = $eyear . "-" . $emonth . "-" . $eday;
            $enewdate = strtotime($ends_date);
            $end_date = date('Y-m-d', $enewdate);
            $date = new DateTime($end_date);
            $date->add(new DateInterval('P1D'));
            $end_date = $date->format('Y-m-d');

            // $customer_id = $this->request->data['OrdersItem']['customer'];
            $zone_id = $this->request->data['OrdersItem']['zone_id'];
            if (!empty($zone_id)) {
                $zone_details = $this->Zone->find('first', array('conditions' => array('Zone.id' => $zone_id)));
                if ($zone_details) {
                    $zone_name = $zone_details['Zone']['zone'];
                    $zone_id = $zone_details['Zone']['id'];


                    $accounts = $this->OrdersItem->find('all', array('conditions' => array('DATE(Order.order_date) BETWEEN ? AND ?' =>
                    array($start_date, $end_date), array('Order.zone_id' => $zone_id), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered'))));

                    $total = $this->OrdersItem->find('all', array('conditions' => array('DATE(Order.order_date) BETWEEN ? AND ?' =>
                    array($start_date, $end_date), array('Order.zone_id' => $zone_id), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered')), 'fields' => array("SUM((Item.selling_price * OrdersItem.quantity)) as 'total'", "SUM(OrdersItem.quantity) as 'tot_quat'")));
                    if ($accounts) {
                        // $this->set('customer', $accounts[0]['Customer']['fullname']);

                        $this->set('accounts', $accounts);
                        if ($total) {
                            $this->set('total', $total);
                        }
                    }

                    $sales = $this->SalesItem->find('all', array('conditions' => array('DATE(Sale.sale_date) BETWEEN ? AND ?' =>
                    array($start_date, $end_date), array('Customer.zone_id' => $zone_id), array('Sale.status' => 'alive')), 'group' => array('SalesItem.sale_id')));
                    // array('Sale.user_id' => $sales_pers_id),

                    $sales_tot = $this->SalesItem->find('all', array('conditions' => array('DATE(Sale.sale_date) BETWEEN ? AND ?' =>
                    array($start_date, $end_date), array('Customer.zone_id' => $zone_id), array('Sale.status' => 'alive')), 'fields' => array("SUM((SalesItem.unit_price * SalesItem.quantity)) as 'total'", "SUM(SalesItem.quantity) as 'stot_quat'"))); //
                    // array('Sale.user_id' => $sales_pers_id),
                    if ($sales) {
                        //  $this->set('customer', $accounts[0]['Client']['client_name']);
                        $this->set('sales', $sales);
                        if ($sales_tot) {
                            $this->set('salestotal', $sales_tot);
                        }
                    }
                }
            } elseif (empty($zone_id)) {


                $accounts = $this->OrdersItem->find('all', array('conditions' => array('DATE(Order.order_date) BETWEEN ? AND ?' =>
                    array($start_date, $end_date), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered'))));

                $total = $this->OrdersItem->find('all', array('conditions' => array('DATE(Order.order_date) BETWEEN ? AND ?' =>
                    array($start_date, $end_date), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered')), 'fields' => array("SUM((Item.selling_price * OrdersItem.quantity)) as 'total'", "SUM(OrdersItem.quantity) as 'tot_quat'")));


                if ($accounts) {

                    $this->set('accounts', $accounts);
                    if ($total) {
                        $this->set('total', $total);
                    }
                }
                $sales = $this->SalesItem->find('all', array('conditions' => array('DATE(Sale.sale_date) BETWEEN ? AND ?' =>
                    array($start_date, $end_date), array('Sale.status' => 'alive')),
                    'group' => array('SalesItem.sale_id')));

                $sales_tot = $this->SalesItem->find('all', array('conditions' => array('DATE(Sale.sale_date) BETWEEN ? AND ?' =>
                    array($start_date, $end_date), array('Sale.status' => 'alive')), 
                    'fields' => array("SUM((SalesItem.unit_price * SalesItem.quantity)) as 'stotal'", "SUM(SalesItem.quantity) as 'stot_quat'"))); //, 'group' => array('SalesItem.client_id')

                if ($sales) {

                    // $this->set('customer', $accounts[0]['Client']['client_name']);
                    $this->set('sales', $sales);
                    if ($sales_tot) {
                        $this->set('salestotal', $sales_tot);
                    }
                }
            }

            $newstart_date = date('d-M-Y', $snewdate);
            $newend_date = date('d-M-Y', $enewdate);
            $this->set('start_date', $newstart_date);
            $this->set('end_date', $newend_date);
        }
    }

    public function precustomerpaymentDetails() {
        $this->__validateUserType2();
        $data = $this->paginate('Customer');
        $this->set('customer', $data);
//        
        $check = $this->Session->check('precust');
        if ($check) {
            $cust = $this->Session->read('precust');
            $this->set('cust', $cust);
        }
        $check = $this->Session->check('precusts');
        if ($check) {
            $custs = $this->Session->read('precusts');
            $this->set('customer', $custs);
        }
    }

    public function clearpresearchSessions() {
        $check = $this->Session->check('precust');
        if (!$check) {
            $message = 'No Customer selected';
            $this->Session->write('bmsg', $message);
            $this->redirect(array('controller' => 'Reports', 'action' => 'precustomerpaymentDetails'));
        }



        $this->redirect(array('controller' => 'Reports', 'action' => 'customerOrderHistory'));
    }

    public function searchCustomerDetails($sorder = Null) {

        $this->autoRender = false;
        if ($this->request->is('post')) {
            $custname = $this->request->data['order_search'];
            $customer = $this->Customer->find('all', array('conditions' => array('OR' => array(array('Customer.surname LIKE' => "%$custname%"), array('Customer.first_name LIKE' => "%$custname%"), array('Customer.fullname LIKE' => "%$custname%")))));

            if ($customer) {
//            $cust = $this->Session->write('cust',$customer);

                $this->Session->write('precusts', $customer);
                $this->redirect(array('controller' => 'Reports', 'action' => 'precustomerpaymentDetails'));
            } else {
                $this->Session->write('Sorry Customer Not Found');
                $this->redirect(array('controller' => 'Reports', 'action' => 'precustomerpaymentDetails'));
            }
        } else {

            $customers = $this->Customer->find('all', array('conditions' => array('Customer.id' => $sorder)));
            $customer = $this->Customer->find('first', array('conditions' => array('Customer.id' => $sorder)));
            if ($customers) {
                $check = $this->Session->check('precusts');
                if ($check) {
                    $this->Session->delete('precusts');
                }
                $check = $this->Session->check('precust');
                if ($check) {
                    $this->Session->delete('precust');
                }
                $check = $this->Session->check('precustID');
                if ($check) {
                    $this->Session->delete('precustID');
                }
                $cust = $this->Session->write('precusts', $customers);
                $this->Session->write('precust', $customer);
                $this->Session->write('precustID', $sorder);
                $this->redirect(array('controller' => 'Reports', 'action' => 'precustomerpaymentDetails'));
            } else {

                $message = 'Sorry, Customer Not Found';
                $this->Session->write('emsg', $message);
                $this->redirect(array('controller' => 'Reports', 'action' => 'precustomerpaymentDetails'));
            }
        }

//        
    }

    function customerOrderHistory($order_id = null, $customer_id = null, $custname = null, $amount_paid = null, $balance = null) {
        $this->__validateUserType3();
        $this->paginate('OrdersItem');

        $last_payment = $this->OrdersItem->find('all', array('conditions' => array('OrderItem.customer_id' => $order_id),
            'order' => array('OrdersItem.order_id ASC')));

        if ($last_payment) {


            $this->set('data', $last_payment);
            $this->set('order_id', $order_id);
            $this->set('custname', $custname);
            $this->set('amount', $amount_paid);
            $this->set('balance', $balance);
        } else {

            $message = 'Unable To Load Payment Data';
            $this->Session->write('emsg', $message);
            $this->redirect(array('controller' => 'Reports', 'action' => 'precustomerpaymentDetails'));
        }
    }

    function customerOrderDetails() {
        $this->__validateUserType2();
        $this->paginate('OrdersItem');

        if ($this->request->is('post')) {

            $sday = $this->request->data['OrdersItem']['begin_date']['day'];
            $smonth = $this->request->data['OrdersItem']['begin_date']['month'];
            $syear = $this->request->data['OrdersItem']['begin_date']['year'];
            $starts_date = $syear . "-" . $smonth . "-" . $sday;
            $snewdate = strtotime($starts_date);
            $start_date = date('Y-m-d', $snewdate);

            $eday = $this->request->data['OrdersItem']['finish_date']['day'];
            $emonth = $this->request->data['OrdersItem']['finish_date']['month'];
            $eyear = $this->request->data['OrdersItem']['finish_date']['year'];
            $ends_date = $eyear . "-" . $emonth . "-" . $eday;
            $enewdate = strtotime($ends_date);
            $end_date = date('Y-m-d', $enewdate);
            $date = new DateTime($end_date);
//            $date->add(new DateInterval('P1D'));
            $end_date = $date->format('Y-m-d');

            $last_payment = $this->OrdersItem->find('all', array('conditions' => array('AND' =>
                    array(array('Order.order_date >=' => $start_date), array('Order.order_date <=' => $end_date),
                        array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered'))),
                'order' => array('Order.id ASC')));
            $last_payment_total = $this->OrdersItem->find('all', array('conditions' => array('AND' =>
                    array(array('Order.order_date >=' => $start_date), array('Order.order_date <=' => $end_date),
                        array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered'))),
                'order' => array('Order.id ASC'), 'fields' => array('SUM(Order.hp_price) as total_hp', 'SUM(Order.mthly_install) as total_install')));

            $sales = $this->SalesItem->find('all', array('conditions' => array('AND' =>
                    array(array('Sale.sale_date >=' => $start_date), array('Sale.sale_date <=' => $end_date),
                        array('Sale.status' => 'alive'))),
                'order' => array('Sale.id ASC')));

            $sales_total = $this->SalesItem->find('all', array('conditions' => array('AND' =>
                    array(array('Sale.sale_date >=' => $start_date), array('Sale.sale_date <=' => $end_date),
                        array('Sale.status' => 'alive'))),
                'order' => array('Sale.id ASC'), 'fields' => array('SUM(Sale.total_cost) as total_cost')));

            if ($last_payment) {


                $this->set('data', $last_payment);
                if ($last_payment_total) {


                    $this->set('data_total', $last_payment_total);
                }

                if ($sales) {
                    $this->set('sales', $sales);
                    if ($sales_total) {
                        $this->set('salestotal', $sales_total);
                    }
                }
            } else {

                $message = 'Unable To Load Payment Data';
                $this->Session->write('emsg', $message);
//            $this->redirect(array('controller' => 'Reports', 'action' => 'precustomerpaymentDetails'));
            }

            $newstart_date = date('d-M-Y', $snewdate);
            $newend_date = date('d-M-Y', $enewdate);
            $this->set('start_date', $newstart_date);
            $this->set('end_date', $newend_date);
        }
    }

    function itemSalesBranch() {
        $this->__validateUserType2();
        $this->set('users', $this->User->find('list', array('conditions' => array('User.usertype_id' => array(4, 3, 7, 1,11)))));
        $this->set('zones', $this->Zone->find('list'));
        $items = $this->Item->find('list', array(
            'conditions' => array('Item.brand !=' => '', 'Item.brand !=' => NUll, 'Item.brand NOT LIKE' => '%test%'),
            'fields' => array('Item.id', 'Item.brand'),
            'group' => array('Item.brand')
        ));
        $this->set(compact('items'));

        $this->paginate('OrdersItem');
        if ($this->request->is('post')) {

            $sday = $this->request->data['OrdersItem']['begin_date']['day'];
            $smonth = $this->request->data['OrdersItem']['begin_date']['month'];
            $syear = $this->request->data['OrdersItem']['begin_date']['year'];
            $starts_date = $syear . "-" . $smonth . "-" . $sday;
            $snewdate = strtotime($starts_date);
            $start_date = date('Y-m-d', $snewdate);

            $eday = $this->request->data['OrdersItem']['finish_date']['day'];
            $emonth = $this->request->data['OrdersItem']['finish_date']['month'];
            $eyear = $this->request->data['OrdersItem']['finish_date']['year'];
            $ends_date = $eyear . "-" . $emonth . "-" . $eday;
            $enewdate = strtotime($ends_date);
            $end_date = date('Y-m-d', $enewdate);
            $date = new DateTime($end_date);
            $date->add(new DateInterval('P1D'));
            $end_date = $date->format('Y-m-d');

            $zoneid = $this->request->data['OrdersItem']['zone_id'];

            $zone_data = $this->Zone->find('first', array('conditions' => array('Zone.id' => $zoneid), 'recursive' => '-1'));
            if ($zone_data) {
                $this->set('zone_name', $zone_data['Zone']['zone']);
            }
            $item_id = $this->request->data['OrdersItem']['brand'];

            if ($item_id != "" && $item_id != null) {

                $item_data = $this->Item->find('first', array('conditions' => array('Item.id' => $item_id), 'recursive' => '-1'));
                if ($item_data) {
                    $brand = $item_data['Item']['brand'];

                    $brand_array = array('Item.brand LIKE' => '%' . $brand . '%');
                } else {
                    $brand_array = "";
                }
            } else {
                $brand_array = "";
            }

//            $sales_pers_id = $this->request->data['OrdersItem']['user_id'];
//            
//            
//                if ($sales_pers_id != "" && $sales_pers_id != null) {
//                    $sales_pers = $this->User->find('first', array('conditions' => array('User.id' => $sales_pers_id),'recursive' => '-1'));
//            if ($sales_pers) {
//                $username = $sales_pers['User']['username'];
//            }
//               $username = array('Order.sales_person' => $username);
//               $sales_user = array('Sale.user_id' => $sales_pers_id);
//                }else{
//                $username = "";
//                $sales_user = "";
//            }

            if ($zoneid != "" && $zoneid != null) {

                $accounts = $this->OrdersItem->find('all', array('conditions' => array('AND' => array(array('Order.order_date >=' => $start_date), array('Order.order_date <=' => $end_date), array('Item.brand NOT LIKE' => '%test%'), $brand_array, array('Order.zone_id' => $zoneid), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered'))), 'fields' => array('Item.item', 'SUM(OrdersItem.quantity) as quuant', 'Item.brand'), 'group' => array('Item.item', 'Item.brand')));

                $total = $this->OrdersItem->find('all', array('conditions' => array('AND' => array(array('Order.order_date >=' => $start_date), array('Order.order_date <=' => $end_date), array('Item.brand NOT LIKE' => '%test%'), $brand_array, array('Order.zone_id' => $zoneid), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered'))), 'fields' => array("SUM(OrdersItem.quantity) as 'total'")));
                if ($accounts) {
                    if ($total) {
                        $this->set('total', $total);
                    }
                }

                $sales = $this->SalesItem->find('all', array('conditions' => array('Sale.sale_date BETWEEN ? AND ?' =>
                    array($start_date, $end_date), 'Item.brand NOT LIKE' => '%test%', $brand_array, 'Customer.zone_id' => $zoneid, 'Sale.status' => 'alive'), 'fields' => array('Item.item', 'SUM(SalesItem.quantity) as salequuant', 'Item.brand','Customer.zone_id'), 'group' => array('Item.item', 'Item.brand')));

                $sales_tot = $this->SalesItem->find('all', array('conditions' => array('Sale.sale_date BETWEEN ? AND ?' =>
                    array($start_date, $end_date), 'Item.brand NOT LIKE' => '%test%', $brand_array, 'Customer.zone_id' => $zoneid), array('Sale.status' => 'alive'), 'fields' => array("SUM(SalesItem.quantity) as 'stotal'",'Customer.zone_id' )));

                if ($sales) {
                    //  $this->set('customer', $accounts[0]['Client']['client_name']);
                    $this->set('sales', $sales);
                    if ($sales_tot) {
                        $this->set('salestotal', $sales_tot);
                    }
                }
            } else {


                $accounts = $this->OrdersItem->find('all', array('conditions' => array('AND' => array(array('Order.order_date >=' => $start_date), array('Order.order_date <=' => $end_date), array('Item.brand NOT LIKE' => '%test%'), $brand_array, array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered'))), 'fields' => array('Item.item', 'SUM(OrdersItem.quantity) as quuant', 'Item.brand'), 'group' => array('Item.item', 'Item.brand')));

                $total = $this->OrdersItem->find('all', array('conditions' => array('AND' => array(array('Order.order_date >=' => $start_date), array('Order.order_date <=' => $end_date), array('Item.brand NOT LIKE' => '%test%'), $brand_array, array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered'))), 'fields' => array("SUM(OrdersItem.quantity) as 'total'")));
            
                  if ($accounts) {

         
                $this->set('accounts', $accounts);
                if ($total) {
                    $this->set('total', $total);
                }
            }
                
                   $sales = $this->SalesItem->find('all', array('conditions' => array('AND' => array(array('Sale.sale_date >=' => $start_date), array('Sale.sale_date <=' => $end_date), array('Item.brand NOT LIKE' => '%test%'), $brand_array, array('Sale.status' => 'alive'))), 'fields' => array('Item.item', 'SUM(SalesItem.quantity) as salequuant', 'Item.brand'), 'group' => array('Item.item', 'Item.brand')));

            $sales_tot = $this->SalesItem->find('all', array('conditions' => array('AND' => array(array('Sale.sale_date >=' => $start_date), array('Sale.sale_date <=' => $end_date), array('Item.brand NOT LIKE' => '%test%'), $brand_array, array('Sale.status' => 'alive'))), 'fields' => array("SUM(SalesItem.quantity) as 'stotal'")));

            if ($sales) {
                // $this->set('customer', $accounts[0]['Client']['client_name']);
                $this->set('sales', $sales);
                if ($sales_tot) {
                    $this->set('salestotal', $sales_tot);
                }
            }
            }

          
         

            $newstart_date = date('d-M-Y', $snewdate);
            $newend_date = date('d-M-Y', $enewdate);
            $this->set('start_date', $newstart_date);
            $this->set('end_date', $newend_date);
        }
    }

    function getExecCustomers() {
        $this->__validateUserType2();
        $this->autoRender = false;


        if (!empty($_POST['sales_person'])) {
            $execid = $_POST['sales_person'];

            $sales_pers = $this->User->find('first', array('conditions' => array('User.id' => $execid)));

            if ($sales_pers) {
                $sales_name = $sales_pers['User']['username'];
                $customers = $this->Order->find('all', array('group' => array('Order.customer_id'), 'conditions' => array('Order.sales_person' => $sales_name), 'fields' => array('DISTINCT Order.customer_id', 'Customer.id', 'Customer.fullname', 'Order.sales_person')));
                if ($customers) {
                    return json_encode(array('status' => 'ok', 'data' => $customers));
                } else {

//                             $message = 'No Customers Found for Sales Executive';
//                              $this->Session->write('bmsg', $message);
                    return json_encode(array('status' => 'fail'));
                }
            } else {
//                    $message = 'Unable to Retrieve Sales Executive Details';
//                              $this->Session->write('emsg', $message);
                return json_encode(array('status' => 'fail'));
            }
        } else {
//                    $message = 'Unable to Retrieve Sales Executive Details';
//                              $this->Session->write('emsg', $message);
            return json_encode(array('status' => 'postfail'));
        }
    }

    function salesExecDefaults() {
        $this->__validateUserType2();
        $this->paginate('Order');
        //date('F d, Y',$enewdate);
        //$accounts =  $this->Order->find('all', array('group' => array('Order.customer_id'),'conditions' => array('Order.balance >' => 0,'status' => 'Approved','delivery' => 'Delivered'),'fields' => array('DISTINCT Order.customer_id', 'SUM(Order.balance) As bal','Order.amount_paid','Customer.fullname','Customer.mobile_no','Order.last_date')));
        $accounts = $this->Order->find('all', array('group' => array('Order.sales_person'), 'fields' => array('DISTINCT Order.sales_person', 'COUNT(Order.customer_id) As customers', 'Order.balance', 'SUM(Order.balance) As bal'), 'conditions' => array('AND' => array(array('status' => 'Approved'), array('delivery' => 'Delivered'), array('Order.balance >' => 0))), 'Order' => array('bal' => 'DESC')));

        if ($accounts) {

            $this->set('accounts', $accounts);
        }
        
        $sales = $this->Sale->find('all', array('group' => array('Sale.user_id'), 'fields' =>
            array('CONCAT(User.firstname," ",User.lastname) as salesperson', 'COUNT(Sale.customer_id) As customers', 'Sale.balance', 'SUM(Sale.balance) As bal'),
            'conditions' => array('AND' => array(array('Sale.status' => 'alive'), array('Sale.balance >' => 0))), 
            'order' => array('bal' => 'DESC')));

        if ($sales) {

             $this->set('sales', $sales);
        }
    }

    function summPaymentCollector() {
        $this->__validateUserType2();
        $this->paginate('Order');

        if ($this->request->is('post')) {

            $sday = $this->request->data['Order']['begin_date']['day'];
            $smonth = $this->request->data['Order']['begin_date']['month'];
            $syear = $this->request->data['Order']['begin_date']['year'];
            $starts_date = $syear . "-" . $smonth . "-" . $sday;
            $snewdate = strtotime($starts_date);
            $start_date = date('Y-m-d', $snewdate);

            $eday = $this->request->data['Order']['finish_date']['day'];
            $emonth = $this->request->data['Order']['finish_date']['month'];
            $eyear = $this->request->data['Order']['finish_date']['year'];
            $ends_date = $eyear . "-" . $emonth . "-" . $eday;
            $enewdate = strtotime($ends_date);
            $end_date = date('Y-m-d', $enewdate);
            $date = new DateTime($end_date);
            $date->add(new DateInterval('P1D'));
            $end_date = $date->format('Y-m-d');

            $ids = $this->Payment->find('all', array('group' => array('Payment.order_id'), 'fields' => array('Payment.id'), 'conditions' => array('AND' => array(array('Payment.payment_date >=' => $start_date), array('Payment.payment_date <=' => $end_date), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered'))), 'Order' => array('paid' => 'DESC')));


            $totalids = $this->Payment->find('all', array('fields' => array('Payment.id'), 'conditions' => array('AND' => array(array('Payment.payment_date >=' => $start_date), array('Payment.payment_date <=' => $end_date), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered'))), 'Order' => array('paid' => 'DESC')));

            if ($ids) {

                $paymentids = array();
                foreach ($ids as $id) {
                    array_push($paymentids, $id['Payment']['id']);
                }

                $totalpaymentids = array();
                foreach ($totalids as $value) {
                    array_push($totalpaymentids, $value['Payment']['id']);
                }

                $accounts = $this->Payment->find('all', array('group' => array('Payment.user_id'), 'fields' => array('User.username', 'Payment.user_id', 'Order.id', 'SUM(Order.hp_price) As tothp'), 'conditions' => array('AND' => array(array('Payment.payment_date >=' => $start_date), array('Payment.payment_date <=' => $end_date), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered'), array('Payment.id' => $paymentids))), 'Order' => array('paid' => 'DESC')));


                $collectedaccounts = $this->Payment->find('all', array('group' => array('Payment.user_id'), 'fields' => array('User.username', 'Payment.user_id', 'Order.id', 'SUM(Payment.amount) As paid'), 'conditions' => array('AND' => array(array('Payment.payment_date >=' => $start_date), array('Payment.payment_date <=' => $end_date), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered'), array('Payment.id' => $totalpaymentids))), 'Order' => array('paid' => 'DESC')));

                $total = $this->Payment->find('all', array('fields' => array('SUM(Payment.amount) As paid', 'SUM(Order.hp_price) As tothpprice'), 'conditions' => array('AND' => array(array('Payment.payment_date >=' => $start_date), array('Payment.payment_date <=' => $end_date), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered'), array('Payment.id' => $totalpaymentids))), 'Order' => array('paid' => 'DESC')));


                $totalsales = $this->Payment->find('all', array('fields' => array('SUM(Payment.amount) As paid', 'SUM(Order.hp_price) As tothpprice'), 'conditions' => array('AND' => array(array('Payment.payment_date >=' => $start_date), array('Payment.payment_date <=' => $end_date), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered'), array('Payment.id' => $paymentids))), 'Order' => array('paid' => 'DESC')));

                if ($accounts) {
                    $this->set('accounts', $accounts);
                    if ($collectedaccounts) {
                        $this->set('collectedaccounts', $collectedaccounts);
                    }

                    if ($total) {

                        $this->set('total', $total);
                    }
                    if ($totalsales) {

                        $this->set('totalsales', $totalsales);
                    }
                }
            }
            $newstart_date = date('d-M-Y', $snewdate);
            $newend_date = date('d-M-Y', $enewdate);
            $this->set('start_date', $newstart_date);
            $this->set('end_date', $newend_date);
        }
    }

    function salesExecSummary() {
        $this->__validateUserType2();
        $this->paginate('Order');

        if ($this->request->is('post')) {

            $sday = $this->request->data['Order']['begin_date']['day'];
            $smonth = $this->request->data['Order']['begin_date']['month'];
            $syear = $this->request->data['Order']['begin_date']['year'];
            $starts_date = $syear . "-" . $smonth . "-" . $sday;
            $snewdate = strtotime($starts_date);
            $start_date = date('Y-m-d', $snewdate);

            $eday = $this->request->data['Order']['finish_date']['day'];
            $emonth = $this->request->data['Order']['finish_date']['month'];
            $eyear = $this->request->data['Order']['finish_date']['year'];
            $ends_date = $eyear . "-" . $emonth . "-" . $eday;
            $enewdate = strtotime($ends_date);
            $end_date = date('Y-m-d', $enewdate);
            $date = new DateTime($end_date);
//             $date->add(new DateInterval('P1D'));
            $end_date = $date->format('Y-m-d');


            $accounts = $this->OrdersItem->find('all', array('group' => array('Order.sales_person'), 'fields' => array('Order.sales_person', 'SUM(Item.selling_price) As sales'), 'conditions' => array('DATE(Order.order_date) BETWEEN ? AND ?' =>
                    array($start_date, $end_date),  array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered')), 'Order' => array('paid' => 'DESC')));


            $total = $this->OrdersItem->find('all', array('fields' => array('SUM(Item.selling_price) As totalspprice'), 'conditions' => array('DATE(Order.order_date) BETWEEN ? AND ?' =>
                    array($start_date, $end_date),  array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered'))));

            if ($accounts) {
                $this->set('accounts', $accounts);
                if ($total) {

                    $this->set('total', $total);
                }
            }
            $sales = $this->SalesItem->find('all', array('group' => array('Sale.sales_person'), 'fields' => 
                array('Sale.sales_person as salesperson', 'SUM(SalesItem.unit_price * SalesItem.quantity) As sales'), 'conditions' => array('DATE(Sale.sale_date) BETWEEN ? AND ?' =>
                    array($start_date, $end_date),   
                array('Sale.status' => 'alive')), 'Order' => array('paid' => 'DESC')));


            $sales_tot = $this->SalesItem->find('all', array('fields' => array('SUM(SalesItem.unit_price * SalesItem.quantity) As totalspprice'), 'conditions' => 
                array('DATE(Sale.sale_date) BETWEEN ? AND ?' =>
                    array($start_date, $end_date),  array('Sale.status' => 'alive'))));

             if ($sales) {
                        //  $this->set('customer', $accounts[0]['Client']['client_name']);
                        $this->set('sales', $sales);
                        if ($sales_tot) {
                            $this->set('salestotal', $sales_tot);
                        }
             }
            $newstart_date = date('d-M-Y', $snewdate);
            $newend_date = date('d-M-Y', $enewdate);
            $this->set('start_date', $newstart_date);
            $this->set('end_date', $newend_date);
        }
    }

    function purchases() {
        $this->__validateUserType();
        $this->paginate('OrdersItem');

        if ($this->request->is('post')) {

            $sday = $this->request->data['OrdersItem']['begin_date']['day'];
            $smonth = $this->request->data['OrdersItem']['begin_date']['month'];
            $syear = $this->request->data['OrdersItem']['begin_date']['year'];
            $starts_date = $syear . "-" . $smonth . "-" . $sday;
            $snewdate = strtotime($starts_date);
            $start_date = date('Y-m-d', $snewdate);

            $eday = $this->request->data['OrdersItem']['finish_date']['day'];
            $emonth = $this->request->data['OrdersItem']['finish_date']['month'];
            $eyear = $this->request->data['OrdersItem']['finish_date']['year'];
            $ends_date = $eyear . "-" . $emonth . "-" . $eday;
            $enewdate = strtotime($ends_date);
            $end_date = date('Y-m-d', $enewdate);
            $date = new DateTime($end_date);
//            $date->add(new DateInterval('P1D'));
            $end_date = $date->format('Y-m-d');


            $accounts = $this->OrdersItem->find('all', array('conditions' => array('AND' => array(array('Order.order_date >=' => $start_date), array('Order.order_date <=' => $end_date), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered')))));

            $total = $this->OrdersItem->find('all', array('conditions' => array('AND' => array(array('Order.order_date >=' => $start_date), array('Order.order_date <=' => $end_date), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered'))), 'fields' => array("SUM((OrdersItem.hp_price)) as 'total'")));

            if ($accounts) {

                $this->set('accounts', $accounts);
                if ($total) {
                    $this->set('total', $total);
                }
            }

            $newstart_date = date('d-M-Y', $snewdate);
            $newend_date = date('d-M-Y', $enewdate);
            $this->set('start_date', $newstart_date);
            $this->set('end_date', $newend_date);
        }
    }

    function monthlySalesSummary() {
        $this->__validateUserType2();
        $this->paginate('Order');

        if ($this->request->is('post')) {

            $sday = $this->request->data['Order']['begin_date']['day'];
            $smonth = $this->request->data['Order']['begin_date']['month'];
            $syear = $this->request->data['Order']['begin_date']['year'];
            $starts_date = $syear . "-" . $smonth . "-" . $sday;
            $snewdate = strtotime($starts_date);
            $start_date = date('Y-m-d', $snewdate);

            $eday = $this->request->data['Order']['finish_date']['day'];
            $emonth = $this->request->data['Order']['finish_date']['month'];
            $eyear = $this->request->data['Order']['finish_date']['year'];
            $ends_date = $eyear . "-" . $emonth . "-" . $eday;
            $enewdate = strtotime($ends_date);
            $end_date = date('Y-m-d', $enewdate);
            $date = new DateTime($end_date);
            //$date->add(new DateInterval('P1D'));
            $end_date = $date->format('Y-m-d');

            $grand_htotal = 0;
            $accounts = $this->OrdersItem->find('all', array('conditions' => array('DATE(Order.order_date) BETWEEN ? AND ?' =>
                    array($start_date, $end_date), 
                array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered')),
                'fields' => array("SUM(OrdersItem.quantity * Item.selling_price) as htotal", 'CONCAT(YEAR(Order.order_date),"-",MONTH(Order.order_date)) as sdate', 'Order.order_date'),
                'group' => array('sdate'), 'order' => array('Order.order_date' => 'asc')));


            $total = $this->OrdersItem->find('all', array('conditions' => array('DATE(Order.order_date) BETWEEN ? AND ?' =>
                    array($start_date, $end_date), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered')), 'fields' => array("SUM((Item.selling_price)) as total")));

            //  $total = $this->OrdersItem->find('all', array('conditions' => array('AND' => array(array('Order.order_date >=' => $start_date), array('Order.order_date <=' => $end_date), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered'))),'fields' => array('SUM(Item.selling_price) As totalhpprice')));

            if ($accounts) {

                $this->set('accounts', $accounts);
                if ($total) {
                    $this->set('total', $total);
                    foreach ($total as $val) {
                        $grand_htotal += $val[0]['total'];
                    }

                    $this->set('grand_htotal', $grand_htotal);
                }
            }

            $grand_stotal = 0;
            $saccounts = $this->Sale->find('all', array('conditions' => array('DATE(Sale.sale_date) BETWEEN ? AND ?' =>
                    array($start_date, $end_date), array('Sale.status' => 'alive')), 'fields' => array('Sale.sale_date', "SUM((Sale.total_cost)) as 'stotal'", 'CONCAT(YEAR(Sale.sale_date),"-",MONTH(Sale.sale_date)) as sdate'), 'group' => array('sdate'), 'order' => array('Sale.sale_date' => 'asc')));

            //$stotal = $this->Sale->find('all', array('conditions' => array('AND' => array(array('Sale.sale_date >=' => $start_date), array('Sale.sale_date <=' => $end_date), array('Sale.status' => 'alive'))), 'fields' => array("SUM((Sale.total_cost)) as 'sstotal'")));

            if ($saccounts) {

                $this->set('saccounts', $saccounts);
                //if ($stotal) {
                //   $this->set('stotal', $stotal);
//                    foreach($saccounts as $val){
//                    $grand_stotal += $val[0]['stotal'];
//                    $this->set('grand_stotal', $grand_stotal);
//                }
                // }
            }

            $newstart_date = date('d-M-Y', $snewdate);
            $newend_date = date('d-M-Y', $enewdate);
            $this->set('start_date', $newstart_date);
            $this->set('end_date', $newend_date);
        }
    }

    function salesDetails() {
        $this->__validateUserType2();
        $this->paginate('OrdersItem');

        if ($this->request->is('post')) {

            $sday = $this->request->data['OrdersItem']['begin_date']['day'];
            $smonth = $this->request->data['OrdersItem']['begin_date']['month'];
            $syear = $this->request->data['OrdersItem']['begin_date']['year'];
            $starts_date = $syear . "-" . $smonth . "-" . $sday;
            $snewdate = strtotime($starts_date);
            $start_date = date('Y-m-d', $snewdate);

            $eday = $this->request->data['OrdersItem']['finish_date']['day'];
            $emonth = $this->request->data['OrdersItem']['finish_date']['month'];
            $eyear = $this->request->data['OrdersItem']['finish_date']['year'];
            $ends_date = $eyear . "-" . $emonth . "-" . $eday;
            $enewdate = strtotime($ends_date);
            $end_date = date('Y-m-d', $enewdate);
            $date = new DateTime($end_date);
//            $date->add(new DateInterval('P1D'));
            $end_date = $date->format('Y-m-d');

            $accounts = $this->OrdersItem->find('all', array('conditions' => array('DATE(Order.order_date) BETWEEN ? AND ?' =>
                    array($start_date, $end_date), 
                array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered')), 'fields' => array('Order.invoice_no', 'Item.item', 'OrdersItem.customer_id', 'Customer.fullname', 'OrdersItem.quantity', 'Item.selling_price', 'OrdersItem.unit_price', 'OrdersItem.cost_price', 'OrdersItem.unit_price', 'OrdersItem.total_cost', 'OrdersItem.hp_price', 'OrdersItem.profit', 'Order.order_date')));

            $total = $this->OrdersItem->find('all', array('conditions' => array('DATE(Order.order_date) BETWEEN ? AND ?' =>
                    array($start_date, $end_date),  array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered')), 'fields' => array("SUM((OrdersItem.quantity)) as 'total_qty'", "SUM((Item.selling_price * OrdersItem.quantity)) as 'total_tcost'", "SUM((OrdersItem.hp_price)) as 'total_hp_price'", "SUM((Item.selling_price)) as 'total_sp_price'", "SUM((Item.cost_price)) as 'total_cp_price'", "SUM((OrdersItem.hp_price - (OrdersItem.cost_price * OrdersItem.quantity))) as 'total_profit'")));

            //$stotal = $this->Sale->find('all', array('conditions' => array('AND' => array(array('Sale.sale_date >=' => $start_date), array('Sale.sale_date <=' => $end_date), array('Sale.status' => 'alive'))), 'fields' => array("SUM((Sale.total_cost)) as 'sstotal'")));

            if ($accounts) {

                $this->set('accounts', $accounts);
                if ($total) {
                    $this->set('total', $total);
                }
            }
            $grand_stotal = 0;
            $saccounts = $this->SalesItem->find('all', array('conditions' => array('DATE(Sale.sale_date) BETWEEN ? AND ?' =>
                    array($start_date, $end_date), array('Sale.status' => 'alive')), 'fields' => array('Sale.id', 'Item.item', 'SalesItem.customer_id', 'Customer.fullname', 'SalesItem.quantity', 'Item.selling_price', 'SalesItem.unit_price', 'Item.cost_price', "(Item.selling_price * SalesItem.quantity) as saletotal_cost", "((SalesItem.unit_price * SalesItem.quantity) - (SalesItem.cost_price * SalesItem.quantity)) as 'sale_profit'", 'Sale.sale_date'), 'order' => array('Sale.sale_date')));

            $stotal = $this->SalesItem->find('all', array('conditions' => array('DATE(Sale.sale_date) BETWEEN ? AND ?' =>
                    array($start_date, $end_date), array('Sale.status' => 'alive')), 'fields' => array("SUM((SalesItem.quantity)) as 'total_qty'", "SUM((Item.selling_price * SalesItem.quantity)) as 'total_tcost'", "SUM((SalesItem.unit_price)) as 'total_sp_price'", "SUM((Item.cost_price)) as 'total_cp_price'", "SUM(((SalesItem.unit_price * SalesItem.quantity) - (SalesItem.cost_price * SalesItem.quantity))) as 'total_profit'")));

            if ($saccounts) {

                $this->set('saccounts', $saccounts);
                if ($stotal) {
                    $this->set('stotal', $stotal);
//                   foreach($saccounts as $val){
//                   $grand_stotal += $val[0]['stotal'];
//                    $this->set('grand_stotal', $grand_stotal);
//                }
                }
            }

            $newstart_date = date('d-M-Y', $snewdate);
            $newend_date = date('d-M-Y', $enewdate);
            $this->set('start_date', $newstart_date);
            $this->set('end_date', $newend_date);
        }
    }

    function suppliers() {
        $this->__validateUserType2();
        $this->paginate('Supplierinvoice');

        $this->set('suppliers', $this->Supplier->find('list'));
        if ($this->request->is('post')) {

            $sday = $this->request->data['Supplierinvoice']['from']['day'];
            $smonth = $this->request->data['Supplierinvoice']['from']['month'];
            $syear = $this->request->data['Supplierinvoice']['from']['year'];
            $starts_date = $syear . "-" . $smonth . "-" . $sday;
            $snewdate = strtotime($starts_date);
            $start_date = date('Y-m-d', $snewdate);

            $eday = $this->request->data['Supplierinvoice']['to']['day'];
            $emonth = $this->request->data['Supplierinvoice']['to']['month'];
            $eyear = $this->request->data['Supplierinvoice']['to']['year'];
            $ends_date = $eyear . "-" . $emonth . "-" . $eday;
            $enewdate = strtotime($ends_date);
            $end_date = date('Y-m-d', $enewdate);
            $date = new DateTime($end_date);
//            $date->add(new DateInterval('P1D'));
            $end_date = $date->format('Y-m-d');


            $newstart_date = date('d-M-Y', $snewdate);
            $newend_date = date('d-M-Y', $enewdate);
            $this->set('start_date', $newstart_date);
            $this->set('end_date', $newend_date);
            $this->set('enew_date', $enewdate);
            $this->set('snewdate', $snewdate);

            $supplier_id = $this->request->data['Supplierinvoice']['supplier_id'];
            $sales_pers = $this->Supplier->find('first', array('conditions' => array('Supplier.id' => $supplier_id)));
            if ($supplier_id == "" || $supplier_id == null) {

                //$supplier = $sales_pers['Supplier']['supplier_name'];

                $accounts = $this->WarehouseItem->find('all', array('group' => array('WarehouseItem.supply_invoiceno'), 'fields' => array('WarehouseItem.supply_invoiceno', 'WarehouseItem.supplier_id', 'Item.date_added', 'SUM(Item.cost_price) AS totcost_price'), 'conditions' => array('WarehouseItem.supply_invoiceno IS NOT NULL')));

                $saccounts = $this->Supplierinvoice->find('all', array('conditions' => array('AND' => array(array('Supplierinvoice.supply_date >=' => $start_date), array('Supplierinvoice.supply_date <=' => $end_date), array('Supplierinvoice.supply_invoiceno IS NOT NULL'))), 'fields' => array('Supplierinvoice.supply_invoiceno', 'Supplierinvoice.cost_price', 'Supplierinvoice.amountpaid', 'Supplierinvoice.balance', 'Supplierinvoice.supply_date')));
                pr($accounts);exit;
//            $total = $this->Item->find('all', array('group' => array('Item.supply_invoiceno'),'conditions' => array('AND' => array(array('Supplierinvoice.supply_date >=' => $start_date), array('Supplierinvoice.supply_date <=' => $end_date), array('Supplierinvoice.supplier_id' => $supplier_id))), 'fields' => array("SUM((Supplierinvoice.balance)) as 'bal'", "SUM(Item.cost_price) as 'cost'", "SUM(Supplierinvoice.amountpaid) as 'paid'")));

                if ($accounts) {
                    // $this->set('supplier', $supplier);
                    $this->set('accounts', $accounts);
                    $this->set('saccounts', $saccounts);
//                if ($total) {
//                    $this->set('total', $total);
//                }
                }
            } elseif ($sales_pers) {
                $supplier = $sales_pers['Supplier']['supplier_name'];

                $accounts = $this->WarehouseItem->find('all', array('group' => array('WarehouseItem.supply_invoiceno'), 'fields' => array('Item.supply_invoiceno', 'WarehouseItem.supplier_id', 'Item.date_added', 'SUM(Item.cost_price) AS totcost_price'), 'conditions' => array('WarehouseItem.supplier_id' => $supplier_id, 'WarehouseItem.supply_invoiceno !=' => null)));

                $saccounts = $this->Supplierinvoice->find('all', array('conditions' => array('AND' => array(array('Supplierinvoice.supply_date >=' => $start_date), array('Supplierinvoice.supply_date <=' => $end_date), array('Supplierinvoice.supplier_id' => $supplier_id))), 'fields' => array('Supplierinvoice.supply_invoiceno', 'Supplierinvoice.cost_price', 'Supplierinvoice.amountpaid', 'Supplierinvoice.balance', 'Supplierinvoice.supply_date')));

//            $total = $this->Item->find('all', array('group' => array('Item.supply_invoiceno'),'conditions' => array('AND' => array(array('Supplierinvoice.supply_date >=' => $start_date), array('Supplierinvoice.supply_date <=' => $end_date), array('Supplierinvoice.supplier_id' => $supplier_id))), 'fields' => array("SUM((Supplierinvoice.balance)) as 'bal'", "SUM(Item.cost_price) as 'cost'", "SUM(Supplierinvoice.amountpaid) as 'paid'")));

                if ($accounts) {
                    $this->set('supplier', $supplier);
                    $this->set('accounts', $accounts);
                    $this->set('saccounts', $saccounts);
//                if ($total) {
//                    $this->set('total', $total);
//                }
                }
            } else {
                $message = 'Please Select A Valid Supplier';
                $this->Session->write('bmsg', $message);
                $this->redirect(array('controller' => 'Reports', 'action' => 'suppliers'));
            }
        }
    }

    function old_salesSummary() {
        $this->__validateUserType2();
        $this->paginate('Order');

        if ($this->request->is('post')) {

            $sday = $this->request->data['OrdersItem']['begin_date']['day'];
            $smonth = $this->request->data['OrdersItem']['begin_date']['month'];
            $syear = $this->request->data['OrdersItem']['begin_date']['year'];
            $starts_date = $syear . "-" . $smonth . "-" . $sday;
            $snewdate = strtotime($starts_date);
            $start_date = date('Y-m-d', $snewdate);

            $eday = $this->request->data['OrdersItem']['finish_date']['day'];
            $emonth = $this->request->data['OrdersItem']['finish_date']['month'];
            $eyear = $this->request->data['OrdersItem']['finish_date']['year'];
            $ends_date = $eyear . "-" . $emonth . "-" . $eday;
            $enewdate = strtotime($ends_date);
            $end_date = date('Y-m-d', $enewdate);

            $accounts = $this->OrdersItem->find('all', array('conditions' => array('AND' => array(array('Order.order_date >=' => $start_date), array('Order.order_date <=' => $end_date), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered'))), 'fields' => array('Order.invoice_no', 'OrdersItem.customer_id', 'Customer.fullname', 'OrdersItem.quantity', 'Order.discount', 'OrdersItem.hp_price', "(Item.selling_price * OrdersItem.quantity) as 'cash'", 'Order.order_date')));

            $total = $this->OrdersItem->find('all', array('conditions' => array('AND' => array(array('Order.order_date >=' => $start_date), array('Order.order_date <=' => $end_date), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered'))), 'fields' => array("SUM((Item.selling_price * OrdersItem.quantity)) as 'total_cash'", "SUM((Order.discount)) as 'total_discount'", "SUM((OrdersItem.hp_price)) as 'total_hp_price'")));

            if ($accounts) {

                $this->set('accounts', $accounts);
                if ($total) {
                    $this->set('total', $total);
                }
            }

            $newstart_date = date('d-M-Y', $snewdate);
            $newend_date = date('d-M-Y', $enewdate);
            $this->set('start_date', $newstart_date);
            $this->set('end_date', $newend_date);
        }
    }

    function trendIndicator() {
        $this->__validateUserType2();
    }

    function billsPayable() {
        $this->__validateUserType2();
    }

    function billsPaymentSuppliers() {
        $this->__validateUserType2();
    }

    function itemsDelivery() {
        $this->__validateUserType2();
        $this->paginate('OrdersItem');

        if ($this->request->is('post')) {

            $sday = $this->request->data['OrdersItem']['begin_date']['day'];
            $smonth = $this->request->data['OrdersItem']['begin_date']['month'];
            $syear = $this->request->data['OrdersItem']['begin_date']['year'];
            $starts_date = $syear . "-" . $smonth . "-" . $sday;
            $snewdate = strtotime($starts_date);
            $start_date = date('Y-m-d', $snewdate);

            $eday = $this->request->data['OrdersItem']['finish_date']['day'];
            $emonth = $this->request->data['OrdersItem']['finish_date']['month'];
            $eyear = $this->request->data['OrdersItem']['finish_date']['year'];
            $ends_date = $eyear . "-" . $emonth . "-" . $eday;
            $enewdate = strtotime($ends_date);
            $end_date = date('Y-m-d', $enewdate);
            $date = new DateTime($end_date);
//            $date->add(new DateInterval('P1D'));
            $end_date = $date->format('Y-m-d');

            $accounts = $this->OrdersItem->find('all', array('conditions' => array('AND' => array(array('Order.delivery_date >=' => $start_date), array('Order.delivery_date <=' => $end_date), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered')))));


            if ($accounts) {

                $this->set('accounts', $accounts);
            }

            $newstart_date = date('d-M-Y', $snewdate);
            $newend_date = date('d-M-Y', $enewdate);
            $this->set('start_date', $newstart_date);
            $this->set('end_date', $newend_date);
        }
    }

    function locStockBal1() {
        $this->__validateUserType2();
    }

    function locStockBal2() {
        $this->__validateUserType2();
    }

    function suppClosingBal() {
        $this->__validateUserType2();
    }

    function allDebtors() {
        $this->__validateUserType2();
        $this->paginate('Order');
        $this->set('zones', $this->Zone->find('list'));


        if ($this->request->is('post')) {


//        $accounts = $this->Order->find('all', array('Order' => array('Order.order_date' => 'asc'), 'conditions' => array('Order.balance >' => 0, 'status' => 'Approved', 'delivery' => 'Delivered')));
//
//        $total = $this->Order->find('all', array('conditions' => array('Order.balance >' => 0, 'status' => 'Approved', 'delivery' => 'Delivered'), 'fields' => array("SUM(Order.balance) as 'total_bal'")));
//        if ($accounts) {
//            // pr($accounts);
//            $this->set('accounts', $accounts);
//            if ($total) {
//                $this->set('total', $total);
//            }
//        }
            $zoneid = $this->request->data['Order']['zone_id'];

            if (!is_null($zoneid) && $zoneid != "") {
                $zone_data = $this->Zone->find('first', array('conditions' => array('Zone.id' => $zoneid)));
                if ($zone_data) {
                    $this->set('zone_name', $zone_data['Zone']['zone']);
                }
                $accounts = $this->Order->find('all', array('order' => array('Customer.fullname' => 'ASC'), 'conditions' => array('Order.balance >' => 0, 'Order.status' => 'Approved', 'Order.delivery' => 'Delivered', 'Order.payment_status !=' => 'full_payment', 'Order.zone_id' => $zoneid)));

//'Expectedinstallment.due_date <' => date('Y-m-d'),

                $total = $this->Order->find('all', array('conditions' => array('Order.balance >' => 0, 'Order.status' => 'Approved', 'Order.delivery' => 'Delivered', 'Order.payment_status !=' => 'full_payment', 'Order.zone_id' => $zoneid), 'fields' => array("SUM(Order.balance) AS 'total_bal'")));
                if ($accounts) {
                    // pr($accounts);
                    $this->set('accounts', $accounts);
                    if ($total) {
                        $this->set('total', $total);
                    }
                }
            } elseif (is_null($zoneid) || $zoneid == "") {
                $accounts = $this->Order->find('all', array('order' => array('Customer.fullname' => 'ASC'), 'conditions' => array('Order.balance >' => 0, 'Order.status' => 'Approved', 'Order.delivery' => 'Delivered', 'Order.payment_status !=' => 'full_payment')));

//'Expectedinstallment.due_date <' => date('Y-m-d'),

                $total = $this->Order->find('all', array('conditions' => array('Order.balance >' => 0, 'Order.status' => 'Approved', 'Order.delivery' => 'Delivered', 'Order.payment_status !=' => 'full_payment'), 'fields' => array("SUM(Order.balance) AS 'total_bal'")));
                if ($accounts) {
                    // pr($accounts);
                    $this->set('accounts', $accounts);
                    if ($total) {
                        $this->set('total', $total);
                    }
                }
            }
        }
    }

    function debtorsAgeing() {
        $this->__validateUserType2();
        $this->paginate('Order');
        $this->set('zones', $this->Zone->find('list'));


        if ($this->request->is('post')) {

            $sday = $this->request->data['Order']['begin_date']['day'];
            $smonth = $this->request->data['Order']['begin_date']['month'];
            $syear = $this->request->data['Order']['begin_date']['year'];
            $starts_date = $syear . "-" . $smonth . "-" . $sday;
            $snewdate = strtotime($starts_date);
            $start_date = date('Y-m-d', $snewdate);
            $frstart_date = date('d F, Y', $snewdate);

            $eday = $this->request->data['Order']['finish_date']['day'];
            $emonth = $this->request->data['Order']['finish_date']['month'];
            $eyear = $this->request->data['Order']['finish_date']['year'];
            $ends_date = $eyear . "-" . $emonth . "-" . $eday;
            $enewdate = strtotime($ends_date);
            $end_date = date('Y-m-d', $enewdate);
            $frend_date = date('d F, Y', $enewdate);

            $this->set('frstart_date', $frstart_date);
            $this->set('frend_date', $frend_date);

            $lateday = date('Y-m-t');
            $firstday = date('Y-m-01');
            $zoneid = $this->request->data['Order']['zone_id'];

            if (!is_null($zoneid) && $zoneid != "") {
                $zone_data = $this->Zone->find('first', array('conditions' => array('Zone.id' => $zoneid)));
                if ($zone_data) {
                    $this->set('zone_name', $zone_data['Zone']['zone']);
                }
                $accounts = $this->Order->find('all', array('order' => array('Customer.fullname' => 'ASC'), 'group' => array('Order.customer_id'), 'conditions' => array('AND' => array(array('Order.due_date >=' => $start_date), array('Order.due_date <=' => $end_date)), 'Order.balance >' => 0, 'Order.status' => 'Approved', 'Order.delivery' => 'Delivered', 'Order.payment_status !=' => 'full_payment', 'Order.zone_id' => $zoneid), 'fields' => array('Customer.fullname', 'Customer.mobile_no', 'Customer.work_place', "SUM((Order.hp_price + Order.interest_accrued)) AS 'dbt_due'", "SUM(Order.balance) AS 'balance'", "IF(Order.due_date,(DATEDIFF(CURDATE(),Order.due_date)),'') as 'age'")));

//'Expectedinstallment.due_date <' => date('Y-m-d'),

                $total = $this->Order->find('all', array('conditions' => array('AND' => array(array('Order.due_date >=' => $start_date), array('Order.due_date <=' => $end_date)), 'Order.balance >' => 0, 'Order.status' => 'Approved', 'Order.delivery' => 'Delivered', 'Order.payment_status !=' => 'full_payment', 'Order.zone_id' => $zoneid), 'fields' => array("SUM((Order.hp_price + Order.interest_accrued)) AS 'totdbt_due'", "SUM(Order.balance) AS 'totbalance'")));
                if ($accounts) {
                    // pr($accounts);
                    $this->set('accounts', $accounts);
                    if ($total) {
                        $this->set('total', $total);
                    }
                }
            } elseif (is_null($zoneid) || $zoneid == "") {
                $accounts = $this->Order->find('all', array('order' => array('Customer.fullname' => 'ASC'), 'group' => array('Order.customer_id'), 'conditions' => array('AND' => array(array('Order.due_date >=' => $start_date), array('Order.due_date <=' => $end_date)), 'Order.balance >' => 0, 'Order.status' => 'Approved', 'Order.delivery' => 'Delivered', 'Order.payment_status !=' => 'full_payment'), 'fields' => array('Customer.fullname', 'Customer.mobile_no', 'Customer.work_place', "SUM((Order.hp_price+Order.interest_accrued)) AS 'dbt_due'", "SUM(Order.balance) AS 'balance'", "IF(Order.due_date,(DATEDIFF(CURDATE(),Order.due_date)),'') as 'age'")));

//'Expectedinstallment.due_date <' => date('Y-m-d'),

                $total = $this->Order->find('all', array('conditions' => array('AND' => array(array('Order.due_date >=' => $start_date), array('Order.due_date <=' => $end_date)), 'Order.balance >' => 0, 'Order.status' => 'Approved', 'Order.delivery' => 'Delivered', 'Order.payment_status !=' => 'full_payment'), 'fields' => array("SUM((Order.hp_price+Order.interest_accrued)) AS 'totdbt_due'", "SUM(Order.balance) AS 'totbalance'")));
                if ($accounts) {
                    // pr($accounts);
                    $this->set('accounts', $accounts);
                    if ($total) {
                        $this->set('total', $total);
                    }
                }
            }
        }
    }

    function debtorsClosingBal() {
        $this->__validateUserType2();
        $this->paginate('ClosingBalance');

        if ($this->request->is('post')) {

            $sday = $this->request->data['debtorsClosingBal']['begin_date']['day'];
            $smonth = $this->request->data['debtorsClosingBal']['begin_date']['month'];
            $syear = $this->request->data['debtorsClosingBal']['begin_date']['year'];
            $starts_date = $syear . "-" . $smonth . "-" . $sday;
            $snewdate = strtotime($starts_date);
            $start_date = date('Y-m-d', $snewdate);

            $eday = $this->request->data['debtorsClosingBal']['finish_date']['day'];
            $emonth = $this->request->data['debtorsClosingBal']['finish_date']['month'];
            $eyear = $this->request->data['debtorsClosingBal']['finish_date']['year'];
            $ends_date = $eyear . "-" . $emonth . "-" . $eday;
            $enewdate = strtotime($ends_date);
            $end_date = date('Y-m-d', $enewdate);

            $accounts = $this->ClosingBalance->find('all', array('Order' => array('Customer.fullname' => 'asc'), 'conditions' => array('ClosingBalance.date >=' => $start_date, 'ClosingBalance.date <=' => $end_date), 'fields' => array("DISTINCT ClosingBalance.order_id", "ClosingBalance.balance", "Customer.fullname", "Order.invoice_no")));

            $total = $this->ClosingBalance->find('all', array('conditions' => array('ClosingBalance.date >=' => $start_date, 'ClosingBalance.date <=' => $end_date), 'fields' => array("DISTINCT ClosingBalance.order_id", "SUM(ClosingBalance.balance) as 'total_bal'")));
            if ($accounts) {
                // pr($accounts);
                $this->set('accounts', $accounts);
                if ($total) {
                    $this->set('total', $total);
                }
            }

            $newstart_date = date('d-M-Y', $snewdate);
            $newend_date = date('d-M-Y', $enewdate);
            $this->set('start_date', $newstart_date);
            $this->set('end_date', $newend_date);
        }
    }

    function finishPayment() {
        $this->__validateUserType2();
        $this->paginate('Order');

        if ($this->request->is('post')) {

            $sday = $this->request->data['Order']['begin_date']['day'];
            $smonth = $this->request->data['Order']['begin_date']['month'];
            $syear = $this->request->data['Order']['begin_date']['year'];
            $starts_date = $syear . "-" . $smonth . "-" . $sday;
            $snewdate = strtotime($starts_date);
            $start_date = date('Y-m-d', $snewdate);

            $eday = $this->request->data['Order']['finish_date']['day'];
            $emonth = $this->request->data['Order']['finish_date']['month'];
            $eyear = $this->request->data['Order']['finish_date']['year'];
            $ends_date = $eyear . "-" . $emonth . "-" . $eday;
            $enewdate = strtotime($ends_date);
            $end_date = date('Y-m-d', $enewdate);

            $accounts = $this->Order->find('all', array('Order' => array('Order.order_date' => 'asc'), 'conditions' => array('Order.balance <=' => 0, 'status' => 'Approved', 'delivery' => 'Delivered', 'Order.payment_finish_date >=' => $start_date, 'Order.payment_finish_date <=' => $end_date)));

            $total = $this->Order->find('all', array('conditions' => array('Order.balance <=' => 0, 'status' => 'Approved', 'delivery' => 'Delivered', 'Order.payment_finish_date >=' => $start_date, 'Order.payment_finish_date <=' => $end_date), 'fields' => array("SUM(Order.balance) as 'total_bal'")));
            if ($accounts) {
                // pr($accounts);
                $this->set('accounts', $accounts);
                if ($total) {
                    $this->set('total', $total);
                }
            }

            $newstart_date = date('d-M-Y', $snewdate);
            $newend_date = date('d-M-Y', $enewdate);
            $this->set('start_date', $newstart_date);
            $this->set('end_date', $newend_date);
        }
    }

    function summZonal() {
        $this->__validateUserType2();
        $this->paginate('Order');

        if ($this->request->is('post')) {

            $sday = $this->request->data['Order']['begin_date']['day'];
            $smonth = $this->request->data['Order']['begin_date']['month'];
            $syear = $this->request->data['Order']['begin_date']['year'];
            $starts_date = $syear . "-" . $smonth . "-" . $sday;
            $snewdate = strtotime($starts_date);
            $start_date = date('Y-m-d', $snewdate);

            $eday = $this->request->data['Order']['finish_date']['day'];
            $emonth = $this->request->data['Order']['finish_date']['month'];
            $eyear = $this->request->data['Order']['finish_date']['year'];
            $ends_date = $eyear . "-" . $emonth . "-" . $eday;
            $enewdate = strtotime($ends_date);
            $end_date = date('Y-m-d', $enewdate);
            $date = new DateTime($end_date);
//            $date->add(new DateInterval('P1D'));
            $end_date = $date->format('Y-m-d');
//
//            $ids = $this->Expectedpayment->find('all', array('fields' => array('DISTINCT Order.zone_id','Expectedpayment.id'), 'conditions' => array('AND' => array(array('Expectedpayment.expected_date >=' =>$start_date),array('Expectedpayment.expected_date <=' => $end_date),array('Order.balance >' => 0), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered'),array('Order.payment_status !=' => 'full_payment')))));
//            
//            if ($ids) {
//
//                $expaymentids = array();
//                foreach($ids as $id){
//                   array_push($expaymentids,$id['Expectedpayment']['id']);
//                }
//                
//            print_r($expaymentids);
//            exit;
//            
//            $accounts = $this->Payment->find('all', array('group' => array('Order.zone_id'),'Order' => array('Expectedpayment.expected_date' => 'DESC'),'fields' => array('Order.zone_id','SUM(Expectedpayment.expected_amount) As expected_sales','Expectedpayment.expected_date'), 'conditions' => array('AND' => array(array('Order.balance >=' => 0), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered'),array('Payment.expectedpayment_id' => $expaymentids),array('Order.payment_status !=' => 'full_payment')))));
//                
//            
//            $total = $this->Expectedpayment->find('all', array('conditions' => array('AND' => array(array('Order.balance <=' => 0), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered'),array('Order.payment_status !=' => 'full_payment'),array('Expectedpayment.expected_date >=' =>$start_date),array('Expectedpayment.expected_date <=' => $end_date))), 'fields' => array('DISTINCT Order.zone_id',"SUM(Order.balance) as 'total_bal'")));
//            
//            if ($accounts) {
//                // pr($accounts);
//                $this->set('accounts', $accounts);
//                if ($total) {
//                    $this->set('total', $total);
//                }
//            }
//            
            //}
            $ids = $this->Payment->find('all', array('group' => array('Payment.order_id'), 'fields' => array('Payment.id'), 'conditions' => array('AND' => array(array('Payment.payment_date >=' => $start_date), array('Payment.payment_date <=' => $end_date), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered'))), 'Order' => array('paid' => 'DESC')));


            $totalids = $this->Payment->find('all', array('fields' => array('Payment.id'), 'conditions' => array('AND' => array(array('Payment.payment_date >=' => $start_date), array('Payment.payment_date <=' => $end_date), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered'))), 'Order' => array('paid' => 'DESC')));

            if ($ids) {

                $paymentids = array();
                foreach ($ids as $id) {
                    array_push($paymentids, $id['Payment']['id']);
                }
                $totalpaymentids = array();
                foreach ($totalids as $value) {
                    array_push($totalpaymentids, $value['Payment']['id']);
                }

                $accounts = $this->Payment->find('all', array('group' => array('Order.zone_id'), 'fields' => array('Zone.zone', 'Payment.zone_id', 'Order.zone_id', 'Order.id', 'SUM(Order.hp_price) As tothp'), 'conditions' => array('AND' => array(array('Payment.payment_date >=' => $start_date), array('Payment.payment_date <=' => $end_date), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered'), array('Payment.id' => $paymentids))), 'Order' => array('paid' => 'DESC')));


                $collectedaccounts = $this->Payment->find('all', array('group' => array('Order.zone_id'), 'fields' => array('Zone.zone', 'Payment.zone_id', 'Order.id', 'SUM(Payment.amount) As paid'), 'conditions' => array('AND' => array(array('Payment.payment_date >=' => $start_date), array('Payment.payment_date <=' => $end_date), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered'), array('Payment.id' => $totalpaymentids))), 'Order' => array('paid' => 'DESC')));

                $total = $this->Payment->find('all', array('fields' => array('DISTINCT Order.zone_id', 'SUM(Payment.amount) As paid', 'SUM(Order.hp_price) As tothpprice'), 'conditions' => array('AND' => array(array('Payment.payment_date >=' => $start_date), array('Payment.payment_date <=' => $end_date), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered'), array('Payment.id' => $totalpaymentids))), 'Order' => array('paid' => 'DESC')));


                $totalsales = $this->Payment->find('all', array('fields' => array('DISTINCT Order.zone_id', 'SUM(Payment.amount) As paid', 'SUM(Order.hp_price) As tothpprice'), 'conditions' => array('AND' => array(array('Payment.payment_date >=' => $start_date), array('Payment.payment_date <=' => $end_date), array('Order.status' => 'Approved'), array('Order.delivery' => 'Delivered'), array('Payment.id' => $paymentids))), 'Order' => array('paid' => 'DESC')));

                if ($accounts) {
                    $this->set('accounts', $accounts);
                    if ($collectedaccounts) {
                        $this->set('collectedaccounts', $collectedaccounts);
                    }

                    if ($total) {

                        $this->set('total', $total);
                    }
                    if ($totalsales) {

                        $this->set('totalsales', $totalsales);
                    }
                }
            }

            $newstart_date = date('d-M-Y', $snewdate);
            $newend_date = date('d-M-Y', $enewdate);
            $this->set('start_date', $newstart_date);
            $this->set('end_date', $newend_date);
        }
    }

    function stockRemItems() {
        $this->__validateUserType2();
        $this->paginate('Item');
        $this->set('warehouses', $this->Warehouse->find('list'));
        if ($this->request->is('post')) {

            $warehs = $this->request->data['Item']['warehouse_id'];
//            $smonth = $this->request->data['SalesItem']['from']['month'];
//            $syear = $this->request->data['SalesItem']['from']['year'];
//            $starts_date = $syear . "-" . $smonth . "-" . $sday;
//            $snewdate = strtotime($starts_date);
//            $start_date = date('Y-m-d', $snewdate);
//
//            $eday = $this->request->data['SalesItem']['to']['day'];
//            $emonth = $this->request->data['SalesItem']['to']['month'];
//            $eyear = $this->request->data['SalesItem']['to']['year'];
//            $ends_date = $eyear . "-" . $emonth . "-" . $eday;
//            $enewdate = strtotime($ends_date);
//            $end_date = date('Y-m-d', $enewdate);



            if (!empty($warehs)) {
                $stock = $this->WarehouseItem->find('all', array('order' => array('Item.item' => 'asc'), 'group' => array('Item.modelno'), 'conditions' => array('WarehouseItem.warehouse_id' => $warehs, 'WarehouseItem.remaining_quantity >' => 0, 'delete_status' => 'alive'), 'fields' => array("Item.modelno", "Item.brand", "Item.item", "Sum(WarehouseItem.remaining_quantity) As rem", "Warehouse.warehouse")));

                $sales_tot = $this->WarehouseItem->find('all', array('conditions' => array('WarehouseItem.warehouse_id' => $warehs, 'WarehouseItem.remaining_quantity >' => 0, 'delete_status' => 'alive'), 'fields' => array("SUM(WarehouseItem.remaining_quantity) as 'remaining'")));

                if ($stock) {
                    // $this->set('customer', $accounts[0]['Client']['client_name']);
                    $this->set('sales', $stock);
                    if ($sales_tot) {
                        $this->set('salestotal', $sales_tot);
                    }
                } else {
                    $message = 'No Items Available';
                    $this->Session->write('bmsg', $message);
                    $this->redirect(array('controller' => 'Reports', 'action' => 'stockRemItems'));
                }

//            $newstart_date = date('d-M-Y', $snewdate);
//            $newend_date = date('d-M-Y', $enewdate);
//            $this->set('start_date', $newstart_date);
//            $this->set('end_date', $newend_date);
            } else {
                $stock = $this->WarehouseItem->find('all', array('order' => array('Item.item' => 'asc'), 'group' => array('Item.modelno'), 'conditions' => array('WarehouseItem.remaining_quantity >' => 0, 'delete_status' => 'alive'), 'fields' => array("Item.modelno", "Item.item", "Item.brand", "Sum(WarehouseItem.remaining_quantity) As rem", "Warehouse.warehouse")));

                $sales_tot = $this->WarehouseItem->find('all', array('conditions' => array('WarehouseItem.remaining_quantity >' => 0, 'delete_status' => 'alive'), 'fields' => array("SUM(WarehouseItem.remaining_quantity) as 'remaining'")));

                if ($stock) {
                    // $this->set('customer', $accounts[0]['Client']['client_name']);
                    $this->set('sales', $stock);
                    if ($sales_tot) {
                        $this->set('salestotal', $sales_tot);
                    }
                } else {
                    $message = 'No Items Available';
                    $this->Session->write('bmsg', $message);
                    $this->redirect(array('controller' => 'Reports', 'action' => 'stockRemItems'));
                }
            }
        }
    }

    function stockRemItemDetails() {
        $this->__validateUserType2();
        $this->paginate('Item');
        $this->set('warehouses', $this->Warehouse->find('list'));
        if ($this->request->is('post')) {

            $warehs = $this->request->data['Item']['warehouse_id'];
//            $smonth = $this->request->data['SalesItem']['from']['month'];
//            $syear = $this->request->data['SalesItem']['from']['year'];
//            $starts_date = $syear . "-" . $smonth . "-" . $sday;
//            $snewdate = strtotime($starts_date);
//            $start_date = date('Y-m-d', $snewdate);
//
//            $eday = $this->request->data['SalesItem']['to']['day'];
//            $emonth = $this->request->data['SalesItem']['to']['month'];
//            $eyear = $this->request->data['SalesItem']['to']['year'];
//            $ends_date = $eyear . "-" . $emonth . "-" . $eday;
//            $enewdate = strtotime($ends_date);
//            $end_date = date('Y-m-d', $enewdate);



            if ($warehs != "" && $warehs != null) {
                $stock = $this->WarehouseItem->find('all', array('order' => array('Item.item' => 'asc'), 'group' => array('Item.serialno'), 'conditions' => array('WarehouseItem.warehouse_id' => $warehs, 'WarehouseItem.remaining_quantity >' => 0, 'delete_status' => 'alive'), 'fields' => array("Item.serialno", "Item.modelno", "Item.brand", "Item.item", "Sum(WarehouseItem.remaining_quantity) As rem", "Warehouse.warehouse", "Sum(Item.cost_price) as cost")));

                $sales_tot = $this->WarehouseItem->find('all', array('conditions' => array('WarehouseItem.warehouse_id' => $warehs, 'WarehouseItem.remaining_quantity >' => 0, 'delete_status' => 'alive'), 'fields' => array("SUM(WarehouseItem.remaining_quantity) as 'remaining'")));

                if ($stock) {
                    // $this->set('customer', $accounts[0]['Client']['client_name']);
                    $this->set('sales', $stock);
                    if ($sales_tot) {
                        $this->set('salestotal', $sales_tot);
                    }
                } else {
                    $message = 'No Items Available';
                    $this->Session->write('bmsg', $message);
                    $this->redirect(array('controller' => 'Reports', 'action' => 'stockRemItems'));
                }

//            $newstart_date = date('d-M-Y', $snewdate);
//            $newend_date = date('d-M-Y', $enewdate);
//            $this->set('start_date', $newstart_date);
//            $this->set('end_date', $newend_date);
            } else {
                $stock = $this->WarehouseItem->find('all', array('order' => array('Item.item' => 'asc'), 'group' => array('Item.serialno'), 'conditions' => array('WarehouseItem.remaining_quantity >' => 0, 'delete_status' => 'alive'), 'fields' => array("Item.serialno", "Item.modelno", "Sum(Item.cost_price) as cost", "Item.item", "Sum(WarehouseItem.remaining_quantity) As rem", "Item.brand", "Warehouse.warehouse")));

                $sales_tot = $this->WarehouseItem->find('all', array('conditions' => array('WarehouseItem.remaining_quantity >' => 0, 'delete_status' => 'alive'), 'fields' => array("SUM(Item.cost_price) as 'costp'", "SUM(WarehouseItem.remaining_quantity) as 'remaining'")));

                if ($stock) {
                    // $this->set('customer', $accounts[0]['Client']['client_name']);
                    $this->set('sales', $stock);
                    if ($sales_tot) {
                        $this->set('salestotal', $sales_tot);
                    }
                } else {
                    $message = 'No Items Available';
                    $this->Session->write('bmsg', $message);
                    $this->redirect(array('controller' => 'Reports', 'action' => 'stockRemItemDetails'));
                }
            }
        }
    }

    function stockTransfers(){
        $this->__validateUserType2();
        $this->set('warehouses', $this->Warehouse->find('list'));
        
        $this->set('users', $this->User->find('list'));
        if ($this->request->is('post')) {

            $sday = $this->request->data['StockTransfer']['start_date']['day'];
            $smonth = $this->request->data['StockTransfer']['start_date']['month'];
            $syear = $this->request->data['StockTransfer']['start_date']['year'];
            $starts_date = $syear . "-" . $smonth . "-" . $sday;
            $snewdate = strtotime($starts_date);
            $start_date = date('Y-m-d', $snewdate);

            $eday = $this->request->data['StockTransfer']['end_date']['day'];
            $emonth = $this->request->data['StockTransfer']['end_date']['month'];
            $eyear = $this->request->data['StockTransfer']['end_date']['year'];
            $ends_date = $eyear . "-" . $emonth . "-" . $eday;
            $enewdate = strtotime($ends_date);
            $end_date = date('Y-m-d', $enewdate);
            $date = new DateTime($end_date);
//            $date->add(new DateInterval('P1D'));
            $end_date = $date->format('Y-m-d');
            
        $this->paginate = array(
            'conditions' => array('WarehouseTransfer.request_date BETWEEN ? AND ?' =>
                    array($start_date, $end_date)),
            'order' => array('WarehouseTransfer.id' => 'desc'),
            'limit' => 20);
        
         $data = $this->paginate('WarehouseTransfer');
        $this->set('data', $data);

        }else{
            
        $this->paginate = array(
            'order' => array('WarehouseTransfer.request_status' => 'asc'),
            'limit' => 20);
        
         $data = $this->paginate('WarehouseTransfer');
        $this->set('data', $data);
        
        }
    }
    
    function stocksSummary() {
        $this->paginate('SalesItem');

        if ($this->request->is('post')) {

            $sday = $this->request->data['SalesItem']['from']['day'];
            $smonth = $this->request->data['SalesItem']['from']['month'];
            $syear = $this->request->data['SalesItem']['from']['year'];
            $starts_date = $syear . "-" . $smonth . "-" . $sday;
            $snewdate = strtotime($starts_date);
            $start_date = date('Y-m-d', $snewdate);

            $eday = $this->request->data['SalesItem']['to']['day'];
            $emonth = $this->request->data['SalesItem']['to']['month'];
            $eyear = $this->request->data['SalesItem']['to']['year'];
            $ends_date = $eyear . "-" . $emonth . "-" . $eday;
            $enewdate = strtotime($ends_date);
            $end_date = date('Y-m-d', $enewdate);
            $date = new DateTime($end_date);
//            $date->add(new DateInterval('P1D'));
            $end_date = $date->format('Y-m-d');



            $stock = $this->SalesItem->find('all', array('Order' => array('Item.item' => 'asc'), 'group' => array('SalesItem.item_id'), 'fields' => array("", "SUM((Item.cost_price * Item.remaining_quantity)) as 'stotal'", "Item.remaining_quantity", "Item.original_quantity", "SUM(SalesItem.quantity) as 'quant'", "SalesItem.cost_price", "Item.item"), 'conditions' => array('Sale.sale_date BETWEEN ? AND ?' =>
                    array($start_date, $end_date), array('Sale.status' => 'alive'))));

            $sales_tot = $this->SalesItem->find('all', array('conditions' => array('Sale.sale_date BETWEEN ? AND ?' =>
                    array($start_date, $end_date), array('Sale.status' => 'alive')), 'fields' => array("SUM((Item.cost_price * Item.remaining_quantity)) as 'stotal'", "SUM(Item.original_quantity) AS 'original'", "SUM(SalesItem.cost_price) as 'cost'", "SUM(SalesItem.quantity) as 'quant'", "SUM(Item.remaining_quantity) as 'remaining'")));

            $stock_opening = $this->SalesItem->find('all', array('conditions' => array('AND' => array(array('Sale.sale_date <=' => $start_date), array('Sale.status' => 'alive'))), 'fields' => array("SUM((Item.cost_price * Item.remaining_quantity)) as 'stotal'", "SUM(Item.original_quantity) AS 'original'", "SUM(SalesItem.cost_price) as 'cost'", "SUM(SalesItem.quantity) as 'quant'", "SUM(Item.remaining_quantity) as 'remaining'")));
            if ($stock) {
                // $this->set('customer', $accounts[0]['Client']['client_name']);
                $this->set('sales', $stock);
                if ($sales_tot) {
                    $this->set('salestotal', $sales_tot);
                }
                if ($stock_opening) {
                    $this->set('stockopen', $stock_opening);
                }
            } else {
                $message = 'No Sales Available';
                $this->Session->write('bmsg', $message);
                $this->redirect(array('controller' => 'Reports', 'action' => 'salesSummary'));
            }

            $newstart_date = date('d-M-Y', $snewdate);
            $newend_date = date('d-M-Y', $enewdate);
            $this->set('start_date', $newstart_date);
            $this->set('end_date', $newend_date);
        }
    }

    function salesSummary() {

        $this->paginate('SalesItem');
        $this->set('users', $this->User->find('list',array('order' => array('User.username' => 'Asc'))));

        if ($this->request->is('post')) {

            $sday = $this->request->data['SalesItem']['begin_date']['day'];
            $smonth = $this->request->data['SalesItem']['begin_date']['month'];
            $syear = $this->request->data['SalesItem']['begin_date']['year'];
            $starts_date = $syear . "-" . $smonth . "-" . $sday;
            $snewdate = strtotime($starts_date);
            $start_date = date('Y-m-d', $snewdate);

            $eday = $this->request->data['SalesItem']['finish_date']['day'];
            $emonth = $this->request->data['SalesItem']['finish_date']['month'];
            $eyear = $this->request->data['SalesItem']['finish_date']['year'];
            $ends_date = $eyear . "-" . $emonth . "-" . $eday;
            $enewdate = strtotime($ends_date);
            $end_date = date('Y-m-d', $enewdate);
            $date = new DateTime($end_date);
//            $date->add(new DateInterval('P1D'));
            $end_date = $date->format('Y-m-d');



            $sales_pers_id = $this->request->data['SalesItem']['user_id'];
            $sales_pers = $this->User->find('first', array('conditions' => array('User.id' => $sales_pers_id)));
            if ($sales_pers) {
                $username = $sales_pers['User']['username'];

                $sales = $this->SalesItem->find('all', array('Order' => array('User.username' => 'asc'), 'conditions' => array('DATE(Sale.sale_date) BETWEEN ? AND ?' =>
                    array($start_date, $end_date), array('SalesItem.user_id' => $sales_pers_id), array('Sale.status' => 'alive'))));

                $sales_tot = $this->SalesItem->find('all', array('conditions' => array('DATE(Sale.sale_date) BETWEEN ? AND ?' =>
                    array($start_date, $end_date), array('SalesItem.user_id' => $sales_pers_id), array('Sale.status' => 'alive')), 'fields' => array("SUM((SalesItem.unit_price * SalesItem.quantity)) as 'stotal'")));


                if ($sales) {
                    // $this->set('customer', $accounts[0]['Client']['client_name']);
                    $this->set('sales', $sales);
                    if ($sales_tot) {
                        $this->set('salestotal', $sales_tot);
                    }
                } else {
                    $message = 'No Sales Available';
                    $this->Session->write('bmsg', $message);
                    $this->redirect(array('controller' => 'Reports', 'action' => 'salesSummary'));
                }

                $newstart_date = date('d-M-Y', $snewdate);
                $newend_date = date('d-M-Y', $enewdate);
                $this->set('start_date', $newstart_date);
                $this->set('end_date', $newend_date);
            } else {



                $sales = $this->SalesItem->find('all', array('Order' => array('User.username' => 'asc'), 'conditions' => array('DATE(Sale.sale_date) BETWEEN ? AND ?' =>
                    array($start_date, $end_date),array('Sale.status' => 'alive'))));

                $sales_tot = $this->SalesItem->find('all', array('conditions' => array('DATE(Sale.sale_date) BETWEEN ? AND ?' =>
                    array($start_date, $end_date), array('Sale.status' => 'alive')), 'fields' => array("SUM((SalesItem.unit_price * SalesItem.quantity)) as 'stotal'")));


                if ($sales) {
                    // $this->set('customer', $accounts[0]['Client']['client_name']);
                    $this->set('sales', $sales);
                    if ($sales_tot) {
                        $this->set('salestotal', $sales_tot);
                    }
                } else {
                    $message = 'No Sales Available';
                    $this->Session->write('bmsg', $message);
                    $this->redirect(array('controller' => 'Reports', 'action' => 'salesSummary'));
                }

                $newstart_date = date('d-M-Y', $snewdate);
                $newend_date = date('d-M-Y', $enewdate);
                $this->set('start_date', $newstart_date);
                $this->set('end_date', $newend_date);
            }
        }
    }

    public function convert2PdfnEmail() {
//            if ($this->request->is('post')) {
//                        $content = $this->request->data['Expectedinstallment']['content'];
//                        $email =   $this->request->data['Expectedinstallment']['email'];
//                        
//                        if($content != "" && $email != ""){
//                            set_time_limit(0);
//                            ini_set('memory_limit','256M');
//                            
//        $content = htmlentities($content);
//                $html2pdf = new HTML2PDF('P', 'A4', 'en');
//                $html2pdf->WriteHTML($content);
//                $html2pdf->Output('report.pdf');
//                        }
//            }
    }

    public function pettycashSummByZone() {
        $this->__validateUserType2();
        $data = $this->paginate('CashAccount');
        $this->set('zones', $this->Zone->find('list'));

        if ($this->request->is('post')) {

            $zoneid = $this->request->data['CashAccount']['zone_id'];
            $sday = $this->request->data['CashAccount']['begin_date']['day'];
            $smonth = $this->request->data['CashAccount']['begin_date']['month'];
            $syear = $this->request->data['CashAccount']['begin_date']['year'];
            $starts_date = $syear . "-" . $smonth . "-" . $sday;
            $snewdate = strtotime($starts_date);
            $start_date = date('Y-m-d', $snewdate);

            $eday = $this->request->data['CashAccount']['finish_date']['day'];
            $emonth = $this->request->data['CashAccount']['finish_date']['month'];
            $eyear = $this->request->data['CashAccount']['finish_date']['year'];
            $ends_date = $eyear . "-" . $emonth . "-" . $eday;
            $enewdate = strtotime($ends_date);
            $end_date = date('Y-m-d', $enewdate);
            $date = new DateTime($end_date);
            $date->add(new DateInterval('P1D'));
            $end_date = $date->format('Y-m-d');
            $zone_data = $this->Zone->find('first', array('conditions' => array('Zone.id' => $zoneid)));
            if ($zone_data) {
                $this->set('zone_name', $zone_data['Zone']['zone']);
            }

            if ($zoneid != "" && $zoneid != null) {
                $accounts = $this->CashAccount->find('all', array('conditions' => array('AND' => array(array('CashAccount.expense_date >=' => $start_date), 
                    array('CashAccount.expense_date <=' => $end_date), array('CashAccount.expense_type IN (0,7)'), array('CashAccount.zone_id' => $zoneid)))));

                $total = $this->Pettycash->find('all', array('conditions' => array('Pettycash.zone_id' => $zoneid), 'fields' => array('SUM(Pettycash.amount) as pettycash_amt', 'SUM(Pettycash.balance) as pettycash_bal')));

//                $total_dispense = $this->PettycashDeposit->find('all',array('conditions' => array('AND' => array(array('DATE(PettycashDeposit.created) >=' => $start_date), array('DATE(PettycashDeposit.created) <=' => $end_date),array('PettycashDeposit.zone_id' => $zoneid))),'fields' => array('SUM(PettycashDeposit.amount) as pettycash_amt')));
//                
//                
//                $total_withdrawal = $this->PettycashWithdrawal->find('all',array('conditions' => array('AND' => array(array('DATE(PettycashWithdrawal.created) >=' => $start_date), array('DATE(PettycashWithdrawal.created) <=' => $end_date),array('PettycashWithdrawal.zone_id' => $zoneid))),'fields' => array('SUM(PettycashWithdrawal.amount) as pettycash_amt')));
//                 
                $total_dispense = $this->CashAccount->find('all', array('fields' => array('SUM(ABS(CashAccount.amount)) as pettycash_amt'), 'conditions' => array('AND' => array(array('CashAccount.expense_date >=' => $start_date), array('CashAccount.expense_date <=' => $end_date), array('CashAccount.expense_type IN (7)'), array('CashAccount.zone_id' => $zoneid)))));
                $total_withdrawal = $this->CashAccount->find('all', array('fields' => array('SUM(ABS(CashAccount.amount)) as pettycash_amt'), 'conditions' => array('AND' => array(array('CashAccount.expense_date >=' => $start_date), array('CashAccount.expense_date <=' => $end_date), array('CashAccount.expense_type IN (0)'), array('CashAccount.zone_id' => $zoneid)))));

//                $total = $this->Pettycash->find('all', array('fields' => array('SUM(Pettycash.amount) as pettycash_amt','SUM(Pettycash.balance) as pettycash_bal')));


                if ($accounts) {

                    $this->set('data', $accounts);
                    if ($total) {
                        $this->set('total', $total);
                    }
                    if ($total_dispense) {

                        $this->set('total_dispense', $total_dispense);
                    }
                    if ($total_withdrawal) {

                        $this->set('total_withdrawal', $total_withdrawal);
                    }
                } else {
                    $this->request->data = null;
                    $message = 'Sorry, No Data Found For Selected Options';
                    $this->Session->write('bmsg', $message);
                    $this->Session->write('isdata', true);

                    $this->redirect(array('controller' => 'Reports', 'action' => 'redirectTOPettySummByZone'));
                }
            } elseif ($zoneid == "") {

                $accounts = $this->CashAccount->find('all', array('conditions' => array('AND' => array(array('CashAccount.expense_date >=' => $start_date), array('CashAccount.expense_date <=' => $end_date), array('CashAccount.expense_type IN (0,7)')))));

                $total_dispense = $this->CashAccount->find('all', array('fields' => array('SUM(ABS(CashAccount.amount)) as pettycash_amt'), 'conditions' => array('AND' => array(array('CashAccount.expense_date >=' => $start_date), array('CashAccount.expense_date <=' => $end_date), array('CashAccount.expense_type IN (7)')))));
                $total_withdrawal = $this->CashAccount->find('all', array('fields' => array('SUM(ABS(CashAccount.amount)) as pettycash_amt'), 'conditions' => array('AND' => array(array('CashAccount.expense_date >=' => $start_date), array('CashAccount.expense_date <=' => $end_date), array('CashAccount.expense_type IN (0)')))));

                $total = $this->Pettycash->find('all', array('fields' => array('SUM(Pettycash.amount) as pettycash_amt', 'SUM(Pettycash.balance) as pettycash_bal')));
//                 $total_dep = $this->CashAccount->find('all', array('fields' => array('SUM(ABS(CashAccount.amount)) as pettycash_amt'),'conditions' => array(array('CashAccount.expense_type IN (7)'))));
//                 $total_with = $this->CashAccount->find('all', array('fields' => array('SUM(ABS(CashAccount.amount)) as pettycash_amt'),'conditions' => array(array('CashAccount.expense_type IN (0)'))));
//                
                //$total_dispense = $this->PettycashDeposit->find('all',array('conditions' => array('AND' => array(array('DATE(PettycashDeposit.created) >=' => $start_date), array('DATE(PettycashDeposit.created) <=' => $end_date))),'fields' => array('SUM(PettycashDeposit.amount) as pettycash_amt')));
                //$total_withdrawal = $this->PettycashWithdrawal->find('all',array('conditions' => array('AND' => array(array('DATE(PettycashWithdrawal.created) >=' => $start_date), array('DATE(PettycashWithdrawal.created) <=' => $end_date))),'fields' => array('SUM(PettycashWithdrawal.amount) as pettycash_amt')));
                if ($accounts) {

                    $this->set('data', $accounts);
                    if ($total) {

                        $this->set('total', $total);
                    }
                    if ($total_with) {

                        $this->set('total_with', $total_with);
                    }
                    if ($total_dep) {
                        $this->set('total_dep', $total_dep);
                    }


                    if ($total_dispense) {

                        $this->set('total_dispense', $total_dispense);
                    }
                    if ($total_withdrawal) {

                        $this->set('total_withdrawal', $total_withdrawal);
                    }
                } else {
                    $this->request->data = null;
                    $message = 'Sorry, No Data Found For Selected Options';
                    // $this->Session->write('bmsg', $message);
                    $this->Session->write('isdata', true);

                    $this->redirect(array('controller' => 'Reports', 'action' => 'redirectTOPettySummByZone'));
                }
            } else {
                $this->request->data = null;

                $message = 'Sorry, No Data Found For Selected Options';
                //  $this->Session->write('bmsg', $message);
                $this->Session->write('isdata', true);

                $this->redirect(array('controller' => 'Reports', 'action' => 'redirectTOPettySummByZone'));
            }

            $newstart_date = date('d-M-Y', $snewdate);
            $newend_date = date('d-M-Y', $enewdate);
            $this->set('start_date', $newstart_date);
            $this->set('end_date', $newend_date);
        } else {

            $newstart_date = date('d-M-Y');
            $newend_date = date('d-M-Y');
            $this->set('start_date', $newstart_date);
            $this->set('end_date', $newend_date);
            if ($this->Session->check('isdata') == false) {

                $order_details = $this->CashAccount->find('all', array('limit' => 25, 'conditions' => array('CashAccount.expense_type IN (0,7)')));

                $total = $this->Pettycash->find('all', array('fields' => array('SUM(Pettycash.amount) as pettycash_amt', 'SUM(Pettycash.balance) as pettycash_bal')));

                $total_dispense = $this->PettycashDeposit->find('all', array('fields' => array('SUM(PettycashDeposit.amount) as pettycash_amt')));


                $total_withdrawal = $this->PettycashWithdrawal->find('all', array('fields' => array('SUM(PettycashWithdrawal.amount) as pettycash_amt')));
                if ($order_details) {

                    $this->set('data', $order_details);
                    if ($total) {
                        $this->set('total', $total);
                    }
                    if ($total_dispense) {

                        $this->set('total_dispense', $total_dispense);
                    }
                    if ($total_withdrawal) {

                        $this->set('total_withdrawal', $total_withdrawal);
                    }
                }
            } else {
                if ($this->Session->check('isdata')) {
                    $this->Session->delete('isdata');
                }
            }
        }
    }

    public function summByHeading() {
        $this->__validateUserType2();
        $data = $this->paginate('CashAccount');
        $this->set('expenses', $this->Expense->find('list'));

        if ($this->request->is('post')) {

            $acctid = $this->request->data['CashAccount']['expense_id'];
            $sday = $this->request->data['CashAccount']['begin_date']['day'];
            $smonth = $this->request->data['CashAccount']['begin_date']['month'];
            $syear = $this->request->data['CashAccount']['begin_date']['year'];
            $starts_date = $syear . "-" . $smonth . "-" . $sday;
            $snewdate = strtotime($starts_date);
            $start_date = date('Y-m-d', $snewdate);

            $eday = $this->request->data['CashAccount']['finish_date']['day'];
            $emonth = $this->request->data['CashAccount']['finish_date']['month'];
            $eyear = $this->request->data['CashAccount']['finish_date']['year'];
            $ends_date = $eyear . "-" . $emonth . "-" . $eday;
            $enewdate = strtotime($ends_date);
            $end_date = date('Y-m-d', $enewdate);
            $date = new DateTime($end_date);
            $date->add(new DateInterval('P1D'));
            $end_date = $date->format('Y-m-d');


            if ($acctid != "" && $acctid != null) {
                $accounts = $this->CashAccount->find('all', array('conditions' => array('AND' => array(array('CashAccount.expense_date >=' => $start_date), array('CashAccount.expense_date <=' => $end_date), array('CashAccount.expense_id' => $acctid)))));

                if ($accounts) {

                    $this->set('data', $accounts);
                } else {
                    $this->request->data = null;
                    $message = 'Sorry, No Data Found For Selected Options';
                    //$this->Session->write('bmsg', $message);
                    $this->Session->write('isdata', true);

                    $this->redirect(array('controller' => 'Reports', 'action' => 'redirectTOPettySummByHeading'));
                }
            } elseif ($acctid == "") {

                $accounts = $this->CashAccount->find('all', array('conditions' => array('AND' => array(array('CashAccount.expense_date >=' => $start_date), array('CashAccount.expense_date <=' => $end_date)))));


                if ($accounts) {

                    $this->set('data', $accounts);
                } else {
                    $this->request->data = null;
                    $message = 'Sorry, No Data Found For Selected Options';
                    //$this->Session->write('bmsg', $message);
                    $this->Session->write('isdata', true);

                    $this->redirect(array('controller' => 'Reports', 'action' => 'redirectTOPettySummByHeading'));
                }
            } else {
                $this->request->data = null;

                $message = 'Sorry, No Data Found For Selected Options';
                //    $this->Session->write('bmsg', $message);
                $this->Session->write('isdata', true);

                $this->redirect(array('controller' => 'Reports', 'action' => 'redirectTOPettySummByHeading'));
            }

            $newstart_date = date('d-M-Y', $snewdate);
            $newend_date = date('d-M-Y', $enewdate);
            $this->set('start_date', $newstart_date);
            $this->set('end_date', $newend_date);
        }
    }

    function redirectTOPettySummByZone() {

        $this->autoRender = false;
        $this->redirect('/Reports/pettycashSummByZone/');
    }

    function redirectTOPettySummByHeading() {

        $this->autoRender = false;
        $this->redirect('/Reports/summByHeading/');
    }

}

?>
