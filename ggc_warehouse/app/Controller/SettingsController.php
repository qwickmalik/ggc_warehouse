<?php

class SettingsController extends AppController {

    public $components = array('RequestHandler', 'Session');
    var $name = 'Setting';
    var $uses = array('Setting', 'Item', 'Client', 'User', 'Currency', 'Supplier', 'Tax', 'Rate',
        'DefaultingRate', 'Warehouse', 'Zone', 'CustomerCategory','Portfolio', 'Bank', 'CashAccount',
        'TransactionCategory', 'AccountingHead', 'BankBalance','DiscountCard','DiscountCategory', 
        'JournalEntryLogic', 'Transaction');
    var $paginate = array(
        'Item' => array('limit' => 25, 'order' => array('Item.item' => 'asc')),
        'Client' => array('limit' => 25, 'order' => array('Client.client_name' => 'asc')),
        'CustomerCategory' => array('limit' => 25, 'order' => array('CustomerCategory.customer_category' => 'asc')),
        'Tax' => array('limit' => 25, 'order' => array('Tax.tax_name' => 'asc')),
        'Rate' => array('limit' => 25, 'order' => array('Rate.id' => 'asc')),
        'Supplier' => array('limit' => 25, 'order' => array('Supplier.supplier_name' => 'asc')),
        'DefaultingRate' => array('limit' => 25, 'order' => array('DefaultingRate.id' => 'asc')),
        'TransactionCategory' => array('limit' => 25, 'order' => array('TransactionCategory.id' => 'desc')),
        'Zone' => array('limit' => 25, 'order' => array('Zone.zone' => 'asc')),
        'Warehouse' => array('limit' => 25, 'order' => array('Warehouse.warehouse' => 'asc')),
        'Bank' => array('limit' => 25, 'order' => array('Bank.id' => 'asc')),
        'CashAccount' => array('limit' => 25, 'order' => array('CashAccount.id' => 'asc')),
        'Portfolio' => array('limit' => 25, 'order' => array('Portfolio.id' => 'asc')),
        'DiscountCard' => array('limit' => 25, 'order' => array('DiscountCard.id' => 'asc')),
        'DiscountCategory' => array('limit' => 25, 'order' => array('DiscountCategory.id' => 'asc')),
        'JournalEntryLogic' => array('limit' => 25, 'order' => array('JournalEntryLogic.id' => 'desc')),
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
             $message = 'You Don\'t Have The Priviledges To View The Chosen Resource';
                   $this->Session->write('bmsg', $message);
            $this->redirect('/Dashboard/');
        }
    }

    public function getLoggedInUser(){
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
    
    public function getTransCat($trans_id = null){
        $cat_name = $this->TransactionCategory->find('first', array(
                    'conditions' => array(
                        'TransactionCategory.deleted' => 0,
                        'TransactionCategory.id' => $trans_id,
                    )));
        $category_name = $cat_name['TransactionCategory']['category_name'];
        
        return($category_name);
    }
    
    public function head_category() {
        //attach accounting heads to category names
        $categories = $this->TransactionCategory->find('all', array(
            'fields' => array('id', 'AccountingHead.head_name', 'category_name'),
            'conditions' => array(
                'TransactionCategory.deleted' => 0,),
            'order' => array('AccountingHead.id', 'TransactionCategory.category_name')
        ));
        
        foreach ($categories as $each_item) {
            $list[$each_item['TransactionCategory']['id']] = $each_item['AccountingHead']['head_name'] . ' - ' . $each_item['TransactionCategory']['category_name'];
        }
        $this->set('categoryids', $list);
    }

    function index() {
         $this->__validateUserType();
    }

    function transactionCategories($category_id = null) {
        $this->__validateUserType();
        $this->set('headids', $this->AccountingHead->find('list'));
        
        $data = $this->paginate('TransactionCategory', array('TransactionCategory.deleted' => 0));
        $this->set('data', $data);
        
        
        if ($category_id != null && $category_id != '') {
            $this->set('transcat', $this->TransactionCategory->find('first', ['conditions' => ['TransactionCategory.id' => $category_id]]));
        } else {
            if ($this->request->is('post')) {
                if (!empty($this->request->data['TransactionCategory']['id'])) {
                    
                    if ($this->request->data['TransactionCategory']['category_name'] == "" || $this->request->data['TransactionCategory']['category_name'] == null) {
                        $message = 'Please Enter Transaction Category Name';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'transactionCategories'));
                    }

                    if ($this->request->data['TransactionCategory']['head_id'] == "" || $this->request->data['TransactionCategory']['head_id'] == null) {
                        $message = 'Please Select an Accounting Header';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'transactionCategories'));
                    }

                    $trans_id = $this->request->data['TransactionCategory']['id'];

                    $this->TransactionCategory->delete($trans_id, false);
                    $result = $this->TransactionCategory->save($this->request->data);


                    if ($result) {
                        $this->request->data = null;

                        $message = 'Transaction Category Updated';
                        $this->Session->write('smsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'transactionCategories'));
                    } else {
                        $message = 'Could not update Transaction Category';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'transactionCategories'));
                    }
                } else {
                    if ($this->request->data['TransactionCategory']['category_name'] == "" || $this->request->data['TransactionCategory']['category_name'] == null) {
                        $message = 'Please Enter Transaction Category Name';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'transactionCategories'));
                    }

                    if ($this->request->data['TransactionCategory']['head_id'] == "" || $this->request->data['TransactionCategory']['head_id'] == null) {
                        $message = 'Please Select an Accounting Header';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'transactionCategories'));
                    }
                    $result = $this->TransactionCategory->save($this->request->data);

                    if ($result) {
                        $this->request->data = null;

                        $message = 'Transaction Category successfully added';
                        $this->Session->write('smsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'transactionCategories'));
                    } else {
                        $message = 'Could not add new Transaction Category. Please report to System Administrator';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'transactionCategories'));
                    }
                }
            }
        }
    }

    function delTransactionCategory($catID = null) {
        $this->autoRender =  $this->autoLayout = false;
           
       
            if (!is_null($catID)) {


               // $catID = $_POST['paymentnameId'];
                $result = $this->TransactionCategory->delete($catID,false);



                if ($result) {
                      $message = 'Transaction Category Deleted';
                   $this->Session->write('smsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'transactionCategories'));
                } else {
                     $message = 'Could not Delete Transaction Category';
                   $this->Session->write('bmsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'transactionCategories'));
                }
            }
        
    }

    function setup() {
        $this->__validateUserType();

        $this->set('currencies', $this->Currency->find('list'));

        $setupResults = $this->Setting->getSetup();
        foreach ($setupResults as $setupResult) {
            $setupRes = $setupResult;
        }
        $accounts = $this->CashAccount->find('all', array('fields' => array('id', 'Bank.bank_name', 'account_no', 'Zone.zone')));
        
        
        foreach ($accounts as $each_item) {
            $list[$each_item['CashAccount']['id']] = $each_item['Zone']['zone'] . ' -- ' . $each_item['CashAccount']['account_no'] . ' (' . $each_item['Bank']['bank_name'] . ') ';
        }
        
        
        $this->set('accounts', $list);
        $this->set(compact('setupResults'));

        if ($this->request->is('ajax')) {
            Configure::write('debug', 0);
            $this->autoRender = false;
            $this->autoLayout = false;
            if (!empty($this->request->data)) {
                $day = $this->request->data['Setting']['accounting_month']['day'];
                $month = $this->request->data['Setting']['accounting_month']['month'];
                $year = $this->request->data['Setting']['accounting_month']['year'];
                $this->request->data['Setting']['accounting_month'] = $year . '-' . $month . '-' . $day;

                $count = $this->Setting->find('count');
                if ($count < 1) {
                    $result = $this->Setting->save($this->request->data);
                    if ($result) {
                        $this->request->data = null;


                        return "Company Setup Successfully Added";
                    } else {

                        return "Unsuccessful";
                    }
                } else if ($count >= 1) {
                    $this->Setting->id = 1;

                    $result = $this->Setting->save($this->request->data);
                    if ($result) {
                        $this->request->data = null;


                        return "Company Setup Update Successful";
                    } else {

                        return "Unsuccessful";
                    }
                }
            }
        }
    }

    function logoUpload() {
        $this->__validateUserType();

            if (!empty($this->request->data)) {
                
                
                if(!empty($this->request->data['Setting']['logo']['name'])){
                $file = $this->request->data['Setting']['logo']; //put the data into a var for easy use

                $ext = substr(strtolower(strrchr($file['name'], '.')), 1); //get the extension
                $arr_ext = array('jpg', 'jpeg', 'gif', 'png', 'tiff'); //set allowed extensions

                //only process if the extension is valid
                if(in_array($ext, $arr_ext)){
                    //prepare the filename for database entry
                    
                    $file['name'] = 'logo.png';
                    $this->request->data['Setting']['logo'] = $file['name'];

                    //do the actual uploading of the file. First arg is the tmp name, second arg is where we are putting it
                    move_uploaded_file($file['tmp_name'], WWW_ROOT . 'img/' . $file['name']);
                    }
                }else{
                    $this->request->data['Setting']['logo'] = '';
                }
            
            
            
                $count = $this->Setting->find('count');
                if ($count < 1) {
                    $result = $this->Setting->save($this->request->data);
                    if ($result) {
                        $this->request->data = null;


                        $message = 'Company logo successfully uploaded';
                        $this->Session->write('smsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'setup'));
                    } else {

                        $message = 'Unable to upload company logo';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'setup'));
                    }
                } else if ($count >= 1) {
                    $this->Setting->id = 1;

                    $result = $this->Setting->save($this->request->data);
                    if ($result) {
                        $this->request->data = null;


                        $message = 'Company logo successfully uploaded';
                        $this->Session->write('smsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'setup'));
                    } else {

                        $message = 'Unable to upload company logo';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'setup'));
                    }
                }
            }
//        }
    }


    
    function delClient() {

        if ($this->request->is('ajax')) {
            Configure::write('debug', 0);
            $this->autoRender = false;
            $this->autoLayout = false;
            if (!empty($this->request->data)) {


                $clientID = $_POST['clientId'];
                $result = $this->Client->delete($clientID,false);



                if ($result) {
                    return "success";
                } else {
                    return "unsuccessful";
                }
            }
        }
    }

    function clientInfo() {

        if ($this->request->is('ajax')) {
            Configure::write('debug', 0);
            $this->autoRender = false;
            $this->autoLayout = false;

            if (!empty($_POST['clientId'])) {
                $clientId = $_POST['clientId'];
                $clientLst = $this->Client->find('first', array('conditions' => array('Client.id' => $clientId)));

                $clientLsts = json_encode($clientLst);
                return $clientLsts;
            }
        }
    }

    public function clientsList() {
        //$this->__validateUserType();
        $data = $this->paginate('Client');
        $this->set('data', $data);
        
          $this->set('zones', $this->Zone->find('list'));
          
        if ($this->request->is('ajax')) {
            Configure::write('debug', 0);
            $this->autoRender = false;
           
            if (!empty($this->request->data)) {
                $result = $this->Client->save($this->request->data);
                if ($result) {
                    $this->request->data = null;

                    return "success";
                } else {
                    return "unsuccessful";
                }
            }
        }
    }
    
    public function customerCategories() {
        $this->__validateUserType();
        $data = $this->paginate('CustomerCategory');
        $this->set('data', $data);

        if ($this->request->is('post')) {
            $this->autoRender = false;
            if (!empty($this->request->data)) {
                $result = $this->CustomerCategory->save($this->request->data);
                if ($result) {
                    $this->request->data = null;

                   $message = 'Customer Category Added';
                    $this->Session->write('smsg', $message);
                     $this->redirect(array('controller' => 'Settings', 'action' => 'customerCategories'));
                   
                } else {
                      $message = 'Could not add new Customer Category';
                    $this->Session->write('emsg', $message);
                     $this->redirect(array('controller' => 'Settings', 'action' => 'customerCategories'));
                }
            }
        }
    }
    

    function paymentTerms() {
        $this->__validateUserType();
        
        if ($this->request->is('post')){
            if(!empty($this->request->data)){
                if($this->request->data['Rate']['payment_name'] == "" || $this->request->data['Rate']['payment_name'] == null){
                    $message = 'Please Enter Term Payment Name';
                   $this->Session->write('emsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'paymentTerms'));
                }
                 if($this->request->data['Rate']['period_months'] == "" || $this->request->data['Rate']['period_months'] == null){
                    $message = 'Please Enter Period (Months)';
                   $this->Session->write('emsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'paymentTerms'));
                }
                 if($this->request->data['Rate']['interest_rate'] == "" || $this->request->data['Rate']['interest_rate'] == null){
                    $message = 'Please Enter Interest Rate';
                   $this->Session->write('emsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'paymentTerms'));
                }
                
//                $this->request->data['Rate']['interest_rate'] = floatval($this->request->data['Rate']['interest_rate2']);
                $term = array('interest_rate' => $this->request->data['Rate']['interest_rate'],'period_months' => $this->request->data['Rate']['period_months'],'payment_name' => $this->request->data['Rate']['payment_name']);
                $result = $this->Rate->save($term);
                        //$this->request->data);
                if($result){
                    $this->request->data = null;
                    $message = 'Payment Term Details Save Successfully';
                   $this->Session->write('smsg', $message);
                 $this->redirect(array('controller' => 'Settings','action' => 'paymentTerms'));
                }else{
                    $message = 'Please Check All Fields';
                   $this->Session->write('emsg', $message);
                  $this->redirect(array('controller' => 'Settings','action' => 'paymentTerms'));
                }
            }else{
                    $message = 'Some Fields Missing Data';
                   $this->Session->write('emsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'paymentTerms'));
                }
        }
        $data = $this->paginate('Rate');
        $this->set('data', $data);
    }
   
    
    function portfolioInfo() {

        if ($this->request->is('ajax')) {
            $this->autoRender = false;

            if (!empty($_POST['ptermId'])) {
                $ptermId = $_POST['ptermId'];
                $ptermLst = $this->Portfolio->find('first', array('conditions' => array('Portfolio.id' => $ptermId)));

                $ptermLsts = json_encode($ptermLst);
                return $ptermLsts;
            }
        }
    }
    
    public function delPortterm($payment_term = Null) {
        $this->autoRender = false;

        $result = $this->Portfolio->delete($payment_term,false);
        if($result){
            
            $message = 'Payment Term Deleted';
                   $this->Session->write('smsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'investmentPortfolios'));
        }else{
                    $message = 'Could Not Delete Payment Term';
                   $this->Session->write('emsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'investmentPortfolios'));
                }
        
    }
    
    function paymentInfo() {

        if ($this->request->is('ajax')) {
            $this->autoRender = false;

            if (!empty($_POST['ptermId'])) {
                $ptermId = $_POST['ptermId'];
                $ptermLst = $this->Rate->find('first', array('conditions' => array('Rate.id' => $ptermId)));

                $ptermLsts = json_encode($ptermLst);
                return $ptermLsts;
            }
        }
    }
    
    function savePayment(){
        $this->autoRender = false;
        if ($this->request->is('post')){
            if(!empty($this->request->data)){
                $result = $this->Rate->save($this->request->data);
                if($result){
                    $this->request->data = null;
                    $message = 'Payment Term Details Save Successfully';
                   $this->Session->write('smsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'paymentTerms'));
                }else{
                    $message = 'Please Check All Fields';
                   $this->Session->write('emsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'paymentTerms'));
                }
            }else{
                    $message = 'Some Fields Missing Data';
                   $this->Session->write('emsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'paymentTerms'));
                }
        }
    }
    public function delPterm($payment_term = Null) {
        $this->autoRender = false;

        $result = $this->Rate->delete($payment_term,false);
        if($result){
            
                   $message = 'Payment Term Deleted';
                   $this->Session->write('smsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'paymentTerms'));
        }else{
                    $message = 'Could Not Delete Payment Term';
                   $this->Session->write('emsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'paymentTerms'));
                }
        
    }
    
    public function delcategory($cat_id = Null){
          $this->autoRender = false;

        $result = $this->CustomerCategory->delete($cat_id,false);
        if($result){
            
            $message = 'Category Deleted';
                   $this->Session->write('smsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'customerCategories'));
        }else{
                    $message = 'Could Not Delete Category';
                   $this->Session->write('emsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'customerCategories'));
                }
    }

    function hirePurchaseRates() {
        $this->__validateUserType();
    }

    function notifications() {
        $this->__validateUserType();
    }
    
    function defaultingRates() {
        $this->__validateUserType();
        
        $data = $this->paginate('DefaultingRate');
        $this->set('data', $data);
        $rateResults = $this->DefaultingRate->getDefaultingRate();
//        foreach ($rateResults as $rateResult) {
//            $rateRes = $rateResult;
//        }

        $this->set('$rateResults',$rateResults);
           if ($this->request->is('post')) {
           
            if (!empty($this->request->data)) {
              

                $count = $this->DefaultingRate->find('count');
                if ($count < 1) {
                    $result = $this->DefaultingRate->save($this->request->data);
                    if ($result) {
                        $this->request->data = null;


                        
                        $message = 'Defaulting Rates Added';
                    $this->Session->write('smsg', $message);
                    $this->redirect(array('controller' => 'Settings', 'action' => 'defaultingRates'));
                    } else {

                        $message = 'Could not Add Defaulting Rates';
                    $this->Session->write('emsg', $message);
                     $this->redirect(array('controller' => 'Settings', 'action' => 'defaultingRates'));
                    }
                } elseif ($count >= 1) {
                    $this->request->data['DefaultingRate']['id'] = 1;

                    $result = $this->DefaultingRate->save($this->request->data);
                    if ($result) {
                        $this->request->data = null;


                        $message = 'Defaulting Rates Added';
                    $this->Session->write('smsg', $message);
                    $this->redirect(array('controller' => 'Settings', 'action' => 'defaultingRates'));
                    } else {

                        $message = 'Could not Add Defaulting Rates';
                    $this->Session->write('emsg', $message);
                     $this->redirect(array('controller' => 'Settings', 'action' => 'defaultingRates'));
                    }
                }
            }
        }

    }
    
     function discountCategories(){
        $this->__validateUserType();
        
        if ($this->request->is('post')){
            if(!empty($this->request->data)){
                if($this->request->data['DiscountCategory']['category_name'] == "" || $this->request->data['DiscountCategory']['category_name'] == null){
                    $message = 'Please Enter a Category Name';
                   $this->Session->write('emsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'discountCategories'));
                }
                  if(!empty($this->request->data['DiscountCategory']['category_type'])){
                      $type = $this->request->data['DiscountCategory']['category_type'];
                      
                      switch($type){
                          case 'Points':
                                 if($this->request->data['DiscountCategory']['min_usable_points'] == "" || $this->request->data['DiscountCategory']['min_usable_points'] == null){
                    $message = 'Please Enter Minimum Usable Points';
                   $this->Session->write('emsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'discountCategories'));
                }
                   if($this->request->data['DiscountCategory']['amount_per_point'] == "" || $this->request->data['DiscountCategory']['amount_per_point'] == null){
                    $message = 'Please Enter Amount Per Point';
                   $this->Session->write('emsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'discountCategories'));
                }
                              break;
                          case 'Percentage':
                              
                               if($this->request->data['DiscountCategory']['percent'] == "" || $this->request->data['DiscountCategory']['percent'] == null){
                    $message = 'Please Enter Discount Rate';
                   $this->Session->write('emsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'discountCategories'));
                }
                              break;
                          
                          
                      }
                
              
              
            }else{
               $message = 'Please Select Category Type';
                   $this->Session->write('emsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'discountCategories')); 
            }
                if(empty($this->request->data['DiscountCategory']['id'])){
                $category_name = $this->request->data['DiscountCategory']['category_name'];
                if($discount = $this->DiscountCategory->find('first',array('conditions' => array('DiscountCategory.category_name' => $category_name),'recursive' => -1))){
                     $message = 'Discount Category already created in QwickPoint. Please Check and Try Again.';
                   $this->Session->write('emsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'discountCategories'));
                }
                
                }
                
//                $this->request->data['Rate']['interest_rate'] = floatval($this->request->data['Rate']['interest_rate2']);
                $result = $this->DiscountCategory->save($this->request->data);
                        //$this->request->data);
                if($result){
                    $this->request->data = null;
                    $message = 'Discount Category Details Save Successfully';
                   $this->Session->write('smsg', $message);
                 $this->redirect(array('controller' => 'Settings','action' => 'discountCategories'));
                }else{
                    $message = 'Please Check All Fields';
                   $this->Session->write('emsg', $message);
                  $this->redirect(array('controller' => 'Settings','action' => 'discountCategories'));
                }
            }else{
                    $message = 'Some Fields Missing Data';
                   $this->Session->write('emsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'discountCategories'));
                }
        }
        $data = $this->paginate('DiscountCategory');
        $this->set('data', $data);
    }
    
    
    function discountCards(){
        $this->__validateUserType();
        
        if ($this->request->is('post')){
            if(!empty($this->request->data)){
                if($this->request->data['DiscountCard']['discount_code'] == "" || $this->request->data['DiscountCard']['discount_code'] == null){
                    $message = 'Please Enter a Discount Code';
                   $this->Session->write('emsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'discountCards'));
                }
               
               
                 if($this->request->data['DiscountCard']['discountcategory_id'] == "" || $this->request->data['DiscountCard']['discountcategory_id'] == null){
                    $message = 'Please Select a Category';
                   $this->Session->write('emsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'discountCards'));
                }
                
                if(empty($this->request->data['DiscountCard']['id'])){
                $discount_code = $this->request->data['DiscountCard']['discount_code'];
                if($discount = $this->DiscountCard->find('first',array('conditions' => array('DiscountCard.discount_code' => $discount_code),'recursive' => -1))){
                     $message = 'Discount Code already created in QwickPoint. Please Check and Try Again.';
                   $this->Session->write('emsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'discountCards'));
                }
                
                }
                $type_id = $this->request->data['DiscountCard']['discountcategory_id'];
               $type_data = $this->DiscountCategory->find('first',array('conditions' => array('DiscountCategory.id' => $type_id)));
                if($type_data){
                    if($type_data['DiscountCategory']['category_type'] == 'Percentage'){
                       $this->request->data['DiscountCard']['discount_rate'] = $type_data['DiscountCategory']['percent'];
                    }
                }
                $this->request->data['DiscountCard']['discount_category_id'] = $type_id;
//                $this->request->data['Rate']['interest_rate'] = floatval($this->request->data['Rate']['interest_rate2']);
                $result = $this->DiscountCard->save($this->request->data);
                        //$this->request->data);
                if($result){
                    $this->request->data = null;
                    $message = 'Discount Card Details Save Successfully';
                   $this->Session->write('smsg', $message);
                 $this->redirect(array('controller' => 'Settings','action' => 'discountCards'));
                }else{
                    $message = 'Please Check All Fields';
                   $this->Session->write('emsg', $message);
                  $this->redirect(array('controller' => 'Settings','action' => 'discountCards'));
                }
            }else{
                    $message = 'Some Fields Missing Data';
                   $this->Session->write('emsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'discountCards'));
                }
        }
        $this->set('discountcategories',$this->DiscountCategory->find('list')); 
        $data = $this->paginate('DiscountCard');
        $this->set('data', $data);
    }
    
     function discountCatInfo() {

        if ($this->request->is('ajax')) {
            $this->autoRender = false;

            if (!empty($_POST['dcatID'])) {
                $dcatID = $_POST['dcatID'];
                $ptermLst = $this->DiscountCategory->find('first', array('conditions' => array('DiscountCategory.id' => $dcatID)));

                $ptermLsts = json_encode($ptermLst);
                return $ptermLsts;
            }
        }
    }
      public function delDCat($discount = Null) {
        $this->autoRender = false;

        $result = $this->DiscountCategory->delete($discount,false);
        if($result){
            
                   $message = 'Discount Category Deleted';
                   $this->Session->write('smsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'discountCategories'));
        }else{
                    $message = 'Unable to Delete Discount Category. Please Try Again';
                   $this->Session->write('emsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'discountCategories'));
                }
        
    }
      function discountInfo() {

        if ($this->request->is('ajax')) {
            $this->autoRender = false;

            if (!empty($_POST['dcardID'])) {
                $dcardID = $_POST['dcardID'];
                $ptermLst = $this->DiscountCard->find('first', array('conditions' => array('DiscountCard.id' => $dcardID)));

                $ptermLsts = json_encode($ptermLst);
                return $ptermLsts;
            }
        }
    }
    
    
      public function delDCard($discount = Null) {
        $this->autoRender = false;

        $result = $this->DiscountCard->delete($discount,false);
        if($result){
            
                   $message = 'Discount Card Deleted';
                   $this->Session->write('smsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'discountCards'));
        }else{
                    $message = 'Unable to Delete Discount Card. Please Try Again';
                   $this->Session->write('emsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'discountCards'));
                }
        
    }
    
    
    public function warehouses($warehouse_id = NULL) {
        $this->__validateUserType();
//        $this->set('warehouses', $this->Warehouse->find('list'));
        $data = $this->paginate('Warehouse', array('Warehouse.deleted' => 0));
        $this->set('data', $data);
        
        if ($warehouse_id != null && $warehouse_id != '') {
            $this->set('wh', $this->Warehouse->find('first', ['conditions' => ['Warehouse.id' => $warehouse_id]]));
        } else {
        
        if ($this->request->is('post')) {
            
                if (!empty($this->request->data['Warehouse']['id'])) {//edit zone/branch
                    

                    $warehouse_id = $this->request->data['Warehouse']['id'];

//                    $this->Warehouse->delete($warehouse_id, false);
                    $result = $this->Warehouse->save($this->request->data);


                    if ($result) {
                        $this->request->data = null;

                        $message = 'Warehouse Updated';
                        $this->Session->write('smsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'warehouses'));
                    } else {
                        $message = 'Could not update Warehouse';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'warehouses'));
                    }
                } else { //new entry

                    $result = $this->Warehouse->save($this->request->data);

                    if ($result) {
                        $this->request->data = null;

                        $message = 'Warehouse successfully added';
                        $this->Session->write('smsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'warehouses'));
                    } else {
                        $message = 'Could not add new Warehouse. Please report to System Administrator';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'warehouses'));
                    }
                }
            }
        }
    }
    
    
    
    public function delWarehouse($warehouse_id = null){
        $this->autoRender = false;

        $main_data = array('id' => $warehouse_id, 'deleted' => 1);
        
        $result = $this->Warehouse->save($main_data);

        if ($result) {
            $this->request->data = null;
            $message = 'Warehouse successfully deleted';
            $this->Session->write('smsg', $message);
            $this->redirect(array('controller' => 'Settings', 'action' => 'warehouses'));
        } else {
            $message = 'Could not delete Warehouse. Please report to System Administrator';
            $this->Session->write('emsg', $message);
            $this->redirect(array('controller' => 'Settings', 'action' => 'warehouses'));
        }
        
    }
    
    
    function zones($zone_id=null) {
        $this->__validateUserType();
        $this->set('warehouses', $this->Warehouse->find('list', array('conditions' => array('Warehouse.deleted' => 0))));
        $data = $this->paginate('Zone', array('Zone.deleted' => 0));
        $this->set('data', $data);
        
        if ($zone_id != null && $zone_id != '') {
            $this->set('zo', $this->Zone->find('first', ['conditions' => ['Zone.id' => $zone_id]]));
        } else {
        
        if ($this->request->is('post')) {
            $this->autoRender = false;
            
                if (!empty($this->request->data['Zone']['id'])) {//edit zone/branch
                    

                    $zone_id = $this->request->data['Zone']['id'];

//                    $this->Zone->delete($zone_id, false);
                    $result = $this->Zone->save($this->request->data);


                    if ($result) {
                        $this->request->data = null;

                        $message = 'Branch/Zone/Sales Point Updated';
                        $this->Session->write('smsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'zones'));
                    } else {
                        $message = 'Could not update Branch/Zone/Sales Point';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'zones'));
                    }
                } else { //new entry

                    $result = $this->Zone->save($this->request->data);

                    if ($result) {
                        $this->request->data = null;

                        $message = 'Branch/Zone/Sales Point successfully added';
                        $this->Session->write('smsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'zones'));
                    } else {
                        $message = 'Could not add new Branch/Zone/Sales Point. Please report to System Administrator';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'zones'));
                    }
                }
            }
        }
        
    }
    
    
    public function delzone($zone_id = null){
        $this->autoRender = false;

        $main_data = array('id' => $zone_id, 'deleted' => 1);
        
        $result = $this->Zone->save($main_data);

        if ($result) {
            $this->request->data = null;
            $message = 'Zone successfully deleted';
            $this->Session->write('smsg', $message);
            $this->redirect(array('controller' => 'Settings', 'action' => 'zones'));
        } else {
            $message = 'Could not delete Zone. Please report to System Administrator';
            $this->Session->write('emsg', $message);
            $this->redirect(array('controller' => 'Settings', 'action' => 'zones'));
        }
        
    }
    
    function banks($ba_id = null) {
        $this->__validateUserType();
        
        $data = $this->paginate('Bank', array('Bank.deleted' => 0));
        $this->set('data', $data);

        if ($ba_id != null && $ba_id != '') {
            $this->set('ba', $this->Bank->find('first', ['conditions' => ['Bank.id' => $ba_id]]));
        } else {
            if ($this->request->is('post')) {
                if (!empty($this->request->data['Bank']['id'])) {//edit bank
                    if ($this->request->data['Bank']['bank_name'] == "" || $this->request->data['Bank']['bank_name'] == null) {
                        $message = 'Please Enter Bank Name';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'banks'));
                    }

                    $bank_id = $this->request->data['Bank']['id'];
                    $bank_details = $this->Bank->find('first', array('conditions' => array('Bank.id' => $bank_id)));
                    $this->request->data['Bank']['system'] = $bank_details['Bank']['system'];
                    
//                    $this->Bank->delete($bank_id, false);
                    $result = $this->Bank->save($this->request->data);


                    if ($result) {
                        $this->request->data = null;

                        $message = 'Bank Updated';
                        $this->Session->write('smsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'banks'));
                    } else {
                        $message = 'Could not update Bank';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'banks'));
                    }
                } else {//new bank
                    if ($this->request->data['Bank']['bank_name'] == "" || $this->request->data['Bank']['bank_name'] == null) {
                        $message = 'Please Enter Bank Name';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'banks'));
                    }
                    $result = $this->Bank->save($this->request->data);

                    if ($result) {
                        $this->request->data = null;

                        $message = 'Bank successfully added';
                        $this->Session->write('smsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'banks'));
                    } else {
                        $message = 'Could not add new Bank. Please report to System Administrator';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'banks'));
                    }
                }
            }
        }
    }

    public function delBank($bank_id = Null) {
        $this->autoRender = false;

        $main_data = array('id' => $bank_id, 'deleted' => 1);
        
        $result = $this->Bank->save($main_data);

        if ($result) {
            $this->request->data = null;
            $message = 'Bank successfully deleted';
            $this->Session->write('smsg', $message);
            $this->redirect(array('controller' => 'Settings', 'action' => 'banks'));
        } else {
            $message = 'Could not delete Bank. Please report to System Administrator';
            $this->Session->write('emsg', $message);
            $this->redirect(array('controller' => 'Settings', 'action' => 'banks'));
        }
        
    }

    function cashAccounts($cashaccount_id = null) {
        $this->__validateUserType();
        $data = $this->paginate('CashAccount', array('CashAccount.deleted' => 0));
        $this->set('data', $data);
        
        $this->set('banks', $this->Bank->find('list',array('Bank.deleted' => 0)));
        $this->set('company', $this->Setting->find('first'));
        
        
        $zones = $this->Zone->find('all', array(
            'fields' => array('id', 'zone', 'suburb'),
            'conditions' => array('Zone.deleted' => 0),
            ));
        
        
        
            foreach($zones as $each_item){
                $list[$each_item['Zone']['id']] = $each_item['Zone']['zone'].' '.$each_item['Zone']['suburb'];
            }

            $this->set('zones', $list);
        
        if ($cashaccount_id != null && $cashaccount_id != '') {
            $this->set('ca', $this->CashAccount->find('first', ['conditions' => ['CashAccount.id' => $cashaccount_id]]));
        } else {
            if ($this->request->is('post')) {
                if ($this->request->data['CashAccount']['zone_id'] == "" || $this->request->data['CashAccount']['zone_id'] == null) {
                    $message = 'Please Select a Company Branch';
                    $this->Session->write('emsg', $message);
                    $this->redirect(array('controller' => 'Settings', 'action' => 'cashAccounts'));
                }
                if ($this->request->data['CashAccount']['account_name'] == "" || $this->request->data['CashAccount']['account_name'] == null) {
                    $message = 'Please Enter Account Name';
                    $this->Session->write('emsg', $message);
                    $this->redirect(array('controller' => 'Settings', 'action' => 'cashAccounts'));
                }
                if ($this->request->data['CashAccount']['bank_id'] == "" || $this->request->data['CashAccount']['bank_id'] == null) {
                    $message = 'Please Select a Bank';
                    $this->Session->write('emsg', $message);
                    $this->redirect(array('controller' => 'Settings', 'action' => 'cashAccounts'));
                }
                if ($this->request->data['CashAccount']['account_no'] == "" || $this->request->data['CashAccount']['account_no'] == null) {
                    $message = 'Please Enter Cash Account/Repository Identifier';
                    $this->Session->write('emsg', $message);
                    $this->redirect(array('controller' => 'Settings', 'action' => 'cashAccounts'));
                }
                    
                if (!empty($this->request->data['CashAccount']['id'])) { //edit data submitted

                    $ca_id = $this->request->data['CashAccount']['id'];

                    $this->CashAccount->delete($ca_id, false);
                    $result = $this->CashAccount->save($this->request->data);
                    

                    if ($result) {
                        $this->request->data = null;

                        $message = 'Cash Account/Repository Updated';
                        $this->Session->write('smsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'cashAccounts'));
                    } else {
                        $message = 'Could not update Cash Account/Repository';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'cashAccounts'));
                    }
                } else { //new cash/bank account
                    
                    $user = $this->getLoggedInUser();
                    $random_salt = uniqid(substr(str_replace(' ', '', $user), 0, 4));
                    $this->request->data['CashAccount']['random_salt'] = $random_salt;
                    $result = $this->CashAccount->save($this->request->data);
                    
                    if ($result) {
                        $this->request->data = null;

                        $new_acc = $this->CashAccount->find('first', array(
                                'conditions' => array('CashAccount.random_salt' => $random_salt))
                                );
                        $bank_id = $new_acc['CashAccount']['bank_id'];
                        $acc_id = $new_acc['CashAccount']['id'];
                        
                        $zero_bank_balance = array('bank_id' => $bank_id, 'account_id' => $acc_id, 'user' => $user);
                        $result1 = $this->BankBalance->save($zero_bank_balance);
                        
                        if($result1){
                            $message = 'Cash Account/Repository successfully added. Zero Bank Balance created';
                            $this->Session->write('smsg', $message);
                            $this->redirect(array('controller' => 'Settings', 'action' => 'cashAccounts'));
                        }else{
                            $message = 'Cash Account/Repository successfully added. Unable to create zero bank balance';
                            $this->Session->write('smsg', $message);
                            $this->redirect(array('controller' => 'Settings', 'action' => 'cashAccounts'));
                        }
                        
                    } else {
                        $message = 'Could not add new Cash Account/Repository. Please report to System Administrator';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'cashAccounts'));
                    }
                }
            }
        }
    }

    function accountInfo() {

        if ($this->request->is('ajax')) {
            $this->autoRender = false;

            if (!empty($_POST['baccountId'])) {
                $baccountId = $_POST['baccountId'];
                $baccountLst = $this->CashAccount->find('first', array('conditions' => array('CashAccount.id' => $baccountId)));

                $baccountLsts = json_encode($baccountLst);
                return $baccountLsts;
            }
        }
    }

    public function delCashAcc($ca_id = Null) {
        $this->autoRender = false;

        $main_data = array('id' => $ca_id, 'deleted' => 1);
        
        $result = $this->CashAccount->save($main_data);

        if ($result) {
            $this->request->data = null;
            $message = 'Cash Account successfully deleted';
            $this->Session->write('smsg', $message);
            $this->redirect(array('controller' => 'Settings', 'action' => 'cashAccounts'));
        } else {
            $message = 'Could not delete Cash Account. Please report to System Administrator';
            $this->Session->write('emsg', $message);
            $this->redirect(array('controller' => 'Settings', 'action' => 'cashAccounts'));
        }
    }
    
    function taxRates($taxid = null) {
        $this->__validateUserType();
        
        $data = $this->paginate('Tax');
        $this->set('data', $data);
        
        if ($taxid != null && $taxid != '') {
                $this->set('ta', $this->Tax->find('first', ['conditions' => ['Tax.id' => $taxid]]));
        } else {
            if ($this->request->is('post')) {
                if (!empty($this->request->data['Tax']['id'])) {
                    if ($this->request->data['Tax']['tax_name'] == "" || $this->request->data['Tax']['tax_name'] == null) {
                        $message = 'Please Enter Tax Name';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'taxRates'));
                    }
                    if ($this->request->data['Tax']['tax_rate'] == "" || $this->request->data['Tax']['tax_rate'] == null) {
                        $message = 'Please Enter a Tax Rate';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'taxRates'));
                    }
                    

                    $tax_id = $this->request->data['Tax']['id'];

                    $this->Tax->delete($tax_id, false);
                    $result = $this->Tax->save($this->request->data);


                    if ($result) {
                        $this->request->data = null;

                        $message = 'Tax Rate Updated';
                        $this->Session->write('smsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'taxRates'));
                    } else {
                        $message = 'Could not update Tax Rate';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'taxRates'));
                    }
                } else {
                    if ($this->request->data['Tax']['tax_name'] == "" || $this->request->data['Tax']['tax_name'] == null) {
                        $message = 'Please Enter Tax Name';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'taxRates'));
                    }
                    if ($this->request->data['Tax']['tax_rate'] == "" || $this->request->data['Tax']['tax_rate'] == null) {
                        $message = 'Please Enter a Tax Rate';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'taxRates'));
                    }
                    
                    $result = $this->Tax->save($this->request->data);

                    if ($result) {
                        $this->request->data = null;

                        $message = 'Tax Rate successfully added';
                        $this->Session->write('smsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'taxRates'));
                    } else {
                        $message = 'Could not add new Tax Rate. Please report to System Administrator';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'taxRates'));
                    }
                }
            }
        }
    }
    
    public function delTax($taxid = Null) {
        $this->autoRender = false;

        $result = $this->Tax->delete($taxid, false);
        if ($result) {

            $message = 'Tax Rate Deleted';
            $this->Session->write('smsg', $message);
            $this->redirect(array('controller' => 'Settings', 'action' => 'taxRates'));
        } else {
            $message = 'Could Not Delete Tax Rate';
            $this->Session->write('emsg', $message);
            $this->redirect(array('controller' => 'Settings', 'action' => 'taxRates'));
        }
    }
    /*
    function displayInfo() {
        if ($this->request->is('ajax')) {
            Configure::write('debug', 0);
            $this->autoRender = false;
            $this->autoLayout = false;

            if (!empty($_POST['ItemId'])) {
                $itemId = $_POST['ItemId'];
                $itemLst = $this->Item->find('first', array('conditions' => array('Item.id' => $itemId)));

                $itemLsts = json_encode($itemLst);
                return $itemLsts;
            }
        }
    }

    function itemsList() {
        $this->__validateUserType();
        $data = $this->paginate('Item');
        $this->set('data', $data);


        if ($this->request->is('ajax')) {
            Configure::write('debug', 0);
            $this->autoRender = false;
            $this->autoLayout = false;
            if (!empty($this->request->data)) {
                $result = $this->Item->save($this->request->data);
                if ($result) {
                    $this->request->data = null;

                    return "success";
                } else {
                    return "unsuccessful";
                }
            }
        }
    }

    function delItem() {

        if ($this->request->is('ajax')) {
            Configure::write('debug', 0);
            $this->autoRender = false;
            $this->autoLayout = false;
            if (!empty($this->request->data)) {


                $itemid = $_POST['itemId'];
                $result = $this->Item->delete($itemid,false);



                if ($result) {
                    return "success";
                } else {
                    return "unsuccessful";
                }
            }
        }
    }
*/
    /*
    public function suppliers() {
        $this->__validateUserType();
        $data = $this->paginate('Supplier');
        $this->set('data', $data);



        if ($this->request->is('ajax')) {
            Configure::write('debug', 0);
            $this->autoRender = false;
            $this->autoLayout = false;
            if (!empty($this->request->data)) {
                $result = $this->Supplier->save($this->request->data);
                if ($result) {
                    $this->request->data = null;

                    return "success";
                } else {
                    return "unsuccessful";
                }
            }
        }
    }

    function supplyInfo() {

        if ($this->request->is('ajax')) {
            Configure::write('debug', 0);
            $this->autoRender = false;
            $this->autoLayout = false;

            if (!empty($_POST['SupplyId'])) {
                $supplyId = $_POST['SupplyId'];
                $supplyLst = $this->Supplier->find('first', array('conditions' => array('Supplier.id' => $supplyId)));

                $supplyLsts = json_encode($supplyLst);
                return $supplyLsts;
            }
        }
    }

    function delSupplier() {

        if ($this->request->is('ajax')) {
            Configure::write('debug', 0);
            $this->autoRender = false;
            $this->autoLayout = false;
            if (!empty($this->request->data)) {


                $supplyId = $_POST['supplierId'];
                $result = $this->Supplier->delete($supplyId);



                if ($result) {
                    return "success";
                } else {
                    return "unsuccessful";
                }
            }
        }
    }
*/
    /* 
    function investmentPortfolios() {//please work on this. i just copied the whole function for payment terms
        $this->__validateUserType();
        
        if ($this->request->is('post')){
            if(!empty($this->request->data)){
                if($this->request->data['Portfolio']['payment_name'] == "" || $this->request->data['Portfolio']['payment_name'] == null){
                    $message = 'Please Enter Term Payment Name';
                   $this->Session->write('emsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'investmentPortfolios'));
                }
                 if($this->request->data['Portfolio']['period_months'] == "" || $this->request->data['Portfolio']['period_months'] == null){
                    $message = 'Please Enter Period (Months)';
                   $this->Session->write('emsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'investmentPortfolios'));
                }
                 if($this->request->data['Portfolio']['interest_rate'] == "" || $this->request->data['Portfolio']['interest_rate'] == null){
                    $message = 'Please Enter Interest Rate';
                   $this->Session->write('emsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'investmentPortfolios'));
                }
                
//                $this->request->data['Rate']['interest_rate'] = floatval($this->request->data['Rate']['interest_rate2']);
                if(isset($this->request->data['Portfolio']['id'])){
                                 $term = array('id' =>$this->request->data['Portfolio']['id'],'interest_rate' => $this->request->data['Portfolio']['interest_rate'],'period_months' => $this->request->data['Portfolio']['period_months'],'payment_name' => $this->request->data['Portfolio']['payment_name']);
                }else{
                $term = array('interest_rate' => $this->request->data['Portfolio']['interest_rate'],'period_months' => $this->request->data['Portfolio']['period_months'],'payment_name' => $this->request->data['Portfolio']['payment_name']);
            }
                $result = $this->Portfolio->save($term);
                        //$this->request->data);
                if($result){
                    $this->request->data = null;
                    $message = 'Payment Term Details Save Successfully';
                   $this->Session->write('smsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'investmentPortfolios'));
                }else{
                    $message = 'Please Check All Fields';
                   $this->Session->write('emsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'investmentPortfolios'));
                }
            }else{
                    $message = 'Some Fields Missing Data';
                   $this->Session->write('emsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'investmentPortfolios'));
                }
        }
        $data = $this->paginate('Portfolio');
        $this->set('data', $data);
    }
*/

    
    function doubleEntryLogic($entryid = null) {
        $this->__validateUserType();
//        $this->set('categoryids', $this->TransactionCategory->find('list', array()));
        $this->head_category();
        $data = $this->paginate('JournalEntryLogic', array('JournalEntryLogic.deleted' => 0));
        $this->set('data', $data);
            
        
        
        if (!empty($entryid)) {
            //$this->set('logicdata', $this->JournalEntryLogic->find('first', ['conditions' => ['JournalEntryLogic.category_id' => $category_id]]));
            $this->set('entryid', $entryid);
            $myentry = $this->JournalEntryLogic->find('first', array(
                            'conditions' => array('JournalEntryLogic.id' => $entryid, 'JournalEntryLogic.deleted' => 0)));
            
            $this->set('myentry', $myentry);
            
            
        } else {
            if ($this->request->is('post')) {
                
                
                if (!empty($this->request->data['DoubleEntryLogic']['id'])) {


                    $logic_id = $this->request->data['DoubleEntryLogic']['id'];

                    $main_catid = $this->request->data['DoubleEntryLogic']['category_id'];
                    $main_head = $this->TransactionCategory->find('first', array('conditions' => array('TransactionCategory.id' => $main_catid)));
                    $this->request->data['DoubleEntryLogic']['head_id'] = $main_head['TransactionCategory']['head_id'];
                    
                    
                    $affected_catid = !empty($this->request->data['DoubleEntryLogic']['affected_category_id'])? $this->request->data['DoubleEntryLogic']['affected_category_id']: NULL;
//                    $affected_catid = $this->request->data['DoubleEntryLogic']['affected_category_id'];
                    if(!empty($affected_catid)){
                    $affected_head = $this->TransactionCategory->find('first', array('conditions' => array('TransactionCategory.id' => $affected_catid)));
                    $this->request->data['DoubleEntryLogic']['affected_head_id'] = $affected_head['TransactionCategory']['head_id'];
                    } else {
                        $affected_head = NULL;
                        $this->request->data['DoubleEntryLogic']['affected_head_id'] = NULL;
                        $this->request->data['DoubleEntryLogic']['affected_effect'] = NULL;
                    }
                    
                    
                    
                    $result = $this->JournalEntryLogic->save($this->request->data['DoubleEntryLogic']);


                    if ($result) {
                        $this->request->data = null;

                        $message = 'Double Entry Logic successfully updated';
                        $this->Session->write('smsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'doubleEntryLogic'));
                    } else {
                        $message = 'Could not update Double Entry Logic';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'doubleEntryLogic'));
                    }
                    
                    
                } else {
                    $main_catid = $this->request->data['DoubleEntryLogic']['category_id'];
                    $main_head = $this->TransactionCategory->find('first', array('conditions' => array('TransactionCategory.id' => $main_catid)));
                    $this->request->data['DoubleEntryLogic']['head_id'] = $main_head['TransactionCategory']['head_id'];
                    
                    $affected_catid = !empty($this->request->data['DoubleEntryLogic']['affected_category_id'])? $this->request->data['DoubleEntryLogic']['affected_category_id']: NULL;
//                    $affected_catid = $this->request->data['DoubleEntryLogic']['affected_category_id'];
                    if(!empty($affected_catid)){
                    $affected_head = $this->TransactionCategory->find('first', array('conditions' => array('TransactionCategory.id' => $affected_catid)));
                    $this->request->data['DoubleEntryLogic']['affected_head_id'] = $affected_head['TransactionCategory']['head_id'];
                    } else {
                        $affected_head = NULL;
                        $this->request->data['DoubleEntryLogic']['affected_head_id'] = NULL;
                        $this->request->data['DoubleEntryLogic']['affected_effect'] = NULL;
                    }
                    
                    
                    
                    $result = $this->JournalEntryLogic->save($this->request->data['DoubleEntryLogic']);

                    if ($result) {
                        $this->request->data = null;

                        $message = 'Double Entry Logic successfully added';
                        $this->Session->write('smsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'doubleEntryLogic'));
                    } else {
                        $message = 'Could not add new Double Entry Logic. Please report to System Administrator';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Settings', 'action' => 'doubleEntryLogic'));
                    }
                }
            }
        }
    }

    function delDoubleEntryLogic($catID = null) {
        $this->autoRender =  $this->autoLayout = false;
           
       
            if (!is_null($catID)) {
                $result = $this->JournalEntryLogic->delete($catID,false);



                if ($result) {
                      $message = 'Double Entry Logic Deleted';
                   $this->Session->write('smsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'doubleEntryLogic'));
                } else {
                     $message = 'Could not delete Double Entry Logic';
                   $this->Session->write('bmsg', $message);
                   $this->redirect(array('controller' => 'Settings','action' => 'doubleEntryLogic'));
                }
            }
        
    }

    
}

?>
