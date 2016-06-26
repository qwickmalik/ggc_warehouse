<?php

//App::import('Vendor', 'Spreadsheet_Excel_Reader', array('file' => 'Excel/excel_reader2.php'));
App::import("Vendor", "parsecsv", array('file' => 'parsecsv.lib.php'));

class StocksController extends AppController {

    public $components = array('RequestHandler', 'Session', 'Message');
    var $name = 'Stocks';
    var $uses = array('Setting', 'Item', 'Client', 'User', 'Currency',
        'Supplier', 'Tax', 'Expense', 'Warehouse', 'Supplieritem', 'Supplierinvoice',
        'SupplyPayment', 'BalanceSheet', 'IncomeStatement', 'Transaction', 'Zone',
        'BankBalance', 'WarehouseTransfer', 'WarehouseItem', 'Product', 'ProductLevel', 'Region');
    var $paginate = array(
        'Item' => array('limit' => 25,
            'order' => array('Item.id' => 'asc'), 'conditions' => array('Item.delete_status !=' => 'deleted')),
        'Client' => array('limit' => 25, 'order' => array('Client.client_name' => 'desc')),
        'Tax' => array('limit' => 25, 'order' => array('Tax.tax_name' => 'desc')),
        'User' => array('limit' => 25, 'order' => array('User.id' => 'desc')),
        'Supplier' => array('limit' => 25, 'order' => array('Supplier.supplier_name' => 'desc')),
        'Supplieritem' => array('limit' => 100, 'order' => array('Supplieritem.supply_invoiceno' => 'asc')),
        'Expense' => array('limit' => 25, 'order' => array('Expense.expense_date' => 'desc')),
        'Supplierinvoice' => array('limit' => 25, 'order' => array('Supplierinvoice.id' => 'desc')),
        'SupplyPayment' => array('limit' => 25, 'order' => array('SupplyPayment.id' => 'asc')),
        'Product' => array('limit' => 25, 'order' => array('Product.id' => 'asc')),
        'ProductLevel' => array('limit' => 25, 'order' => array('ProductLevel.modified' => 'desc'))
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

    function __validateUserType2() {

        $userType = $this->Session->read('userDetails.usertype_id');
        if ($userType != 1 && $userType != 7 && $userType != 10) {
            $message = 'You Don\'t Have The Priviledges To View The Chosen Resource';
            $this->Session->write('bmsg', $message);
            $this->redirect('/Dashboard/');
        }
    }

    public function warehouse_region() {
        //attach accounting heads to category names
        $pairings = $this->Warehouse->find('all', array(
            'fields' => array('id', 'warehouse_name', 'district', 'region_id', 'Region.region_name'),
            'conditions' => array(
                'Warehouse.deleted' => 0,),
            'order' => array('warehouse_name')
        ));


        foreach ($pairings as $each_item) {
            $list[$each_item['Warehouse']['id']] = $each_item['Warehouse']['warehouse_name'] . ' - ' . $each_item['Warehouse']['district'] . ' - ' . $each_item['Region']['region_name'];
        }
        $this->set('warehouseids', $list);
    }

    function stock_dashboard() {
//        $this->__validateUserType();
    }

    function createProduct() {
        $this->__validateUserType2();
        $this->paginate('Item');
        //$this->set('data', $data);
        $this->set('warehouses', $this->Warehouse->find('list', array('conditions' => array('Warehouse.deleted' => 0))));
        $this->set('suppliers', $this->Supplier->find('list'));


        $check = $this->Session->check('items');
        if ($check) {
            $items = $this->Session->read('items');

            $this->set('data', $items);
        }
    }

    function index() {
        $this->__validateUserType2();
        $this->paginate('Item');
        //$this->set('data', $data);
        $this->set('warehouses', $this->Warehouse->find('list', array('conditions' => array('Warehouse.deleted' => 0))));
        $this->set('suppliers', $this->Supplier->find('list'));
        //$this->set('items', $this->Item->find('list',array('condition' => array('Item.item !=' => null,'Item.item !=' => ""))));

        $check = $this->Session->check('items');
        if ($check) {
            $items = $this->Session->read('items');

            $this->set('data', $items);
        }
    }

    function excelUploader() {
        $this->autoRender = false;
        if ($this->request->is('post')) {
            if (!empty($this->request->data)) {

                set_time_limit(240);    //4minutes
                ini_set('memory_limit', '64M');
                $data = new Spreadsheet_Excel_Reader();
                // Set output Encoding.
                $data->setOutputEncoding('CP1251');
                $data->read($this->data['Item']['excel_file']);

                $headings = array();
                $xls_data = array();
                for ($i = 1; $i <= $data->sheets[0]['numRows']; $i++) {
                    $row_data = array();
                    for ($j = 1; $j <= $data->sheets[0]['numCols']; $j++) {
                        if ($i == 1) {
                            //this is the headings row, each column (j) is a header
                            $headings[$j] = $data->sheets[0]['cells'][$i][$j];
                        } else {
                            //column of data
                            $row_data[$headings[$j]] = isset($data->sheets[0]['cells'][$i][$j]) ? $data->sheets[0]['cells'][$i][$j] : '';
                        }
//                        print_r($headings[$j]);
//                        exit;
                        //$data['Item']['date-added'] = date('Y-m-d');
                        //$data['Item']['remaining_quantity'] = 1;
                        //$data['Item']['original_quantity'] = 1;
                    }

                    if ($i > 1) {
                        $xls_data[] = array('Item' => $row_data);
                    }
                }

//                if (isset($this->data['Item']['overwrite']) and $this->data['Item']['overwrite'] == 1) {
//                    $this->Item->emptyTable();
//                }

                if ($this->Item->saveAll($xls_data, array('validate' => false))) {
                    $this->Session->write('smsg', 'Success. Imported ' . count($xls_data) . ' records.');
                } else {
                    $this->Session->write('emsg', 'Error.  Unable to import records. Please try again.');
                }
            }
        }
    }

    function emptyTable() {
        $table = $this->tablePrefix . $this->table;
        return $this->query("TRUNCATE $table");
    }

    public function sendExcelFile() {
        // $this->autoRender = false; 
        $this->viewClass = 'Media';
        // Render app/webroot/files/example.docx
        $params = array(
            'id' => 'items.csv',
            'name' => 'items.csv',
            'download' => true,
            'extension' => 'csv',
            'path' => 'files/downloads' . DS
        );
        $this->set($params);


//    $xcelpath = $this->webroot . 'files/downloads/items.csv';
//     header('Content-type: application/csv');
//      header('Content-Disposition: attachment; filename="'.$xcelpath.'"');
        //$this->response->file($file['path']);
        //Return reponse object to prevent controller from trying to render a view
//        
//        $this->response->file($xcelpath, array('download' => true, 'name' => 'foo'));
//        return $this->response;
    }

    function readCSV() {
        $this->autoRender = false;
        if ($this->request->is('post')) {
            if (!empty($this->request->data)) {

                $filepath = $this->request->data['Item']['excel_file']['tmp_name'];
                if ($filepath == "" || $filepath == null) {
                    $this->request->data = null;
                    $this->Session->write('bmsg', 'Warning.  No File Selected. Please check and try again.');
                    $this->redirect(array('controller' => 'Stocks', 'action' => 'index'));
                }
                $filetype_bf = $this->request->data['Item']['excel_file']['name'];
                $filetype = explode('.', $filetype_bf);
                if ($filetype[1] != 'csv') {
                    $this->request->data = null;
                    $this->Session->write('emsg', 'Error.  Wrong Filetype. Please check and try again.');
                    $this->redirect(array('controller' => 'Stocks', 'action' => 'index'));
                }
                $user_id = 0;
                if ($this->Session->check('userId')) {
                    $user_id = $this->Session->read('userId');
                }

                $csv = new parseCSV();
                $csv->auto($filepath);
                $i = 1;
                $cost1 = 0;
                $quantity = 0;
                $stock_cost = 0;
                foreach ($csv->data as $row) {

                    if (trim($row["warehouse_id"]) == 0 || trim($row["warehouse_id"]) == "") {
                        $this->Session->write('emsg', 'Error. Please Supply A Warehouse ID For Row #' . $i);
                        $this->redirect(array('controller' => 'Stocks', 'action' => 'index'));
                    }

                    if (trim($row["item"]) == "" || trim($row["item"]) == null) {

                        $this->Session->write('emsg', 'Error. Please Supply An Item Name (item) For Row #' . $i);
                        $this->redirect(array('controller' => 'Stocks', 'action' => 'index'));
                    }

                    if (trim($row["supplier_id"]) == 0 || trim($row["supplier_id"]) == "") {
                        $this->Session->write('emsg', 'Error. Please Supply A Supplier ID For Row #' . $i);
                        $this->redirect(array('controller' => 'Stocks', 'action' => 'index'));
                    }
//                    if (trim($row["supply_invoiceno"]) == "" || trim($row["supply_invoiceno"]) == "" || is_null(trim($row["supply_invoiceno"]))) {
//
//                        $this->Session->write('emsg', 'Error. Please Supply A Supplier Invoice No For Row #' . $i);
//                        $this->redirect(array('controller' => 'Stocks', 'action' => 'index'));
//                    }
                    $item_data = $this->Item->find('first', array('recursive' => -1,
                        'conditions' => array('Item.item' => trim($row["item"]),
                            'Item.supplier_id' => trim($row["supplier_id"]), 'Item.serialno' => trim($row["serialno"])
                    )));

                    if ($item_data) {
                        $this->request->data['Item']['id'] = $item_data['Item']['id'];
                    }
                    $supply_invoiceno = trim($row["supply_invoiceno"]);
//                    $this->request->data['Item']["warehouse_id"] = trim($row["warehouse_id"]);
                    $this->request->data['Item']["item"] = trim($row["item"]);
                    $this->request->data['Item']["serialno"] = trim($row["serialno"]);
                    $this->request->data['Item']["supply_invoiceno"] = trim($row["supply_invoiceno"]);
                    $this->request->data['Item']["modelno"] = trim($row["modelno"]);
                    $this->request->data['Item']["item_type"] = trim($row["item_type"]);
                    $this->request->data['Item']["description"] = trim($row["description"]);
                    $this->request->data['Item']["brand"] = trim($row["brand"]);
                    $this->request->data['Item']["supplier_id"] = trim($row["supplier_id"]);
                    $this->request->data['Item']["cost_price"] = trim($row["cost_price"]);
                    $this->request->data['Item']["selling_price"] = trim($row["selling_price"]);
                    $this->request->data['Item']["transaction_mode"] = trim($row["transaction_mode"]);
                    $this->request->data['Item']['date_added'] = date('Y-m-d');
                    $transaction_mode = trim($row["transaction_mode"]);
                    // other stuff  
                    $cost = 0;

                    $cost1 = $this->request->data['Item']['cost_price'];
                    $quantity = trim($row["quantity"]);
                    $result = $this->Item->saveAll($this->request->data);

                    $item_id = $this->Item->id;
                    $this->request->data = null;
                    $i++;
                    $stock_cost += $cost1 * $quantity;

                    $warehouse_id = trim($row["warehouse_id"]);
                    $remaining_quantity = trim($row["quantity"]);
                    $warehsitem_check = $this->WarehouseItem->find('first', array('conditions' =>
                        array('WarehouseItem.item_id' => $item_id, 'WarehouseItem.warehouse_id' => $warehouse_id)
                        ,
                        'recursive' => -1
                    ));
                    if ($warehsitem_check) {
                        if ($transaction_mode != 'Service') {
                            $remaining_quantity = $warehsitem_check['WarehouseItem']['remaining_quantity'];
                            $original_quantity = $warehsitem_check['WarehouseItem']['original_quantity'];
                            $remaining_quantity += trim($row["quantity"]);
                            $original_quantity += trim($row["quantity"]);
                        } elseif ($transaction_mode == 'Service') {
                            $remaining_quantity = 1;
                            $original_quantity = 1;
                        } else {
                            $remaining_quantity = $warehsitem_check['WarehouseItem']['remaining_quantity'];
                            $original_quantity = $warehsitem_check['WarehouseItem']['original_quantity'];
                            $remaining_quantity += trim($row["quantity"]);
                            $original_quantity += trim($row["quantity"]);
                        }
                        $warehs_item_id = $warehsitem_check['WarehouseItem']['id'];
                        $warehouseitems_data = array('id' => $warehs_item_id, 'item_id' => $item_id, 'supplier_id' => trim($row["supplier_id"]), 'warehouse_id' => $warehouse_id,
                            'supply_invoiceno' => $supply_invoiceno, 'remaining_quantity' => $remaining_quantity, 'original_quantity' => $original_quantity, 'modified_by' => $user_id);

                        $this->WarehouseItem->save($warehouseitems_data);
                    } else {
                        if ($transaction_mode != 'Service') {
                            $remaining_quantity = trim($row["quantity"]);
                            $original_quantity = trim($row["quantity"]);
                        } elseif ($transaction_mode == 'Service') {
                            $remaining_quantity = 1;
                            $original_quantity = 1;
                        } else {
                            $remaining_quantity = trim($row["quantity"]);
                            $original_quantity = trim($row["quantity"]);
                        }
                        $warehouseitems_data = array('item_id' => $item_id, 'warehouse_id' => $warehouse_id,
                            'supply_invoiceno' => $supply_invoiceno, 'original_quantity' => $original_quantity, 'remaining_quantity' => $remaining_quantity, 'supplier_id' => trim($row["supplier_id"]), 'modified_by' => $user_id);
                        $this->WarehouseItem->create();
                        $this->WarehouseItem->save($warehouseitems_data);
                    }
                }




                if ($result) {
                    $today = date('Y-m-d');
                    $salesperson = "";
                    if ($this->Session->check('userDetails.id')) {
                        $salesperson_f = $this->Session->read('userDetails.firstname');
                        $salesperson_l = $this->Session->read('userDetails.lastname');
                        $salesperson = $salesperson_f . " " . $salesperson_l;
                    }
                    $saleacct = null;
                    if ($this->Session->check('sales_acct')) {
                        $saleacct = $this->Session->read('sales_acct');
                    }
                    $invenacct = null;
                    if ($this->Session->check('invent_acct')) {
                        $invenacct = $this->Session->read('invent_acct');
                    }
                    $inventory_data = array('head_id' => 4, 'account_id' => $invenacct, 'category_id' => 77,
                        'create_date' => $today, 'amount' => $stock_cost, 'credit' => null, 'debit' => $stock_cost, 'effect' => 1,
                        'prepared_by' => $salesperson, 'transaction_date' => $today, 'random_salt' => uniqid(substr(str_replace(' ', '', $salesperson), 0, 4)),
                        'remarks' => 'Inventory asset increase from inventory update');

                    $cash_data = array('head_id' => 4, 'account_id' => $saleacct, 'payment_mode_id' => 1, 'category_id' => 101,
                        'create_date' => $today, 'amount' => $stock_cost, 'debit' => null, 'credit' => $stock_cost, 'effect' => 0,
                        'prepared_by' => $salesperson, 'transaction_date' => $today, 'random_salt' => uniqid(substr(str_replace(' ', '', $salesperson), 0, 4)),
                        'remarks' => 'Cash asset decrease from inventory update');



                    $save_data = array($cash_data, $inventory_data);
                    $result = $this->Transaction->saveMany($save_data);
                    $sbankBal = $this->BankBalance->find('first', array(
                        'conditions' => array('BankBalance.account_id' => $saleacct),
                        'order' => array('BankBalance.id' => 'DESC')));
                    if ($sbankBal) {
                        $sbb_bal = $sbankBal['BankBalance']['amount'];
                        $sbb_bal = $sbb_bal - $stock_cost;
                        $sbankBal_array = array('account_id' => $saleacct,
                            'amount' => $sbb_bal, 'user' => $salesperson);
                        $this->BankBalance->save($sbankBal_array);
                    }
                    $this->request->data = null;
                    $this->Session->write('smsg', 'Success. Imported ' . count($csv->data) . ' records.');
                    $this->redirect(array('controller' => 'Stocks', 'action' => 'index'));
                } else {
                    $this->request->data = null;
                    $this->Session->write('emsg', 'Error.  Unable to import records. Please try again.');
                    $this->redirect(array('controller' => 'Stocks', 'action' => 'index'));
                }
            } {
                $this->request->data = null;
                $this->Session->write('bmsg', 'No File Selected.');
                $this->redirect(array('controller' => 'Stocks', 'action' => 'index'));
            }
        }
    }

    function import($filepath = null) {
        $filename = "extract from filepath";
        $messages = $this->Item->import('posts.csv');
        debug($messages);
    }

    function itemsList() {
        //$this->__validateUserType();
        // $data = $this->paginate('Item');

        $this->autoRender = false;
        if ($this->request->is('post')) {
            if (!empty($this->request->data)) {


                $supplierID = $_POST['hid_supID'];

                if ($supplierID == null || $supplierID == "" || $supplierID == 0) {
                    $check = $this->Session->check('supplier');
                    if ($check) {
                        $this->Session->delete('supplier');
                    }
                    $message = 'Please Select A Supplier';
                    $this->Session->write('bmsg', $message);
                    $this->redirect('/Stocks/');
                }
                //image handling
                if (is_uploaded_file($this->request->data['Item']['item_photo']['tmp_name'])) {
                    $this->request->data['Item']['img_name'] = $this->request->data['Item']['item_photo']['name'];
                    $fileData = fread(
                            fopen($this->request->data['Item']['item_photo']['tmp_name'], "r"), $this->request->data['Item']['item_photo']['size']
                    );
                    $this->request->data['Item']['item_photo'] = $fileData;
                }


                $this->request->data['Item']['supplier_id'] = $supplierID;
                $cost1 = $this->request->data['Item']['cost_price'];
                $quantity = $this->request->data['Item']['remaining_quantity'];
                $stock_cost = $cost1 * $quantity;
                $today = date('Y-m-d');
                $salesperson = "";
                $user_id = "";
                $transaction_mode = $this->request->data['Item']['transaction_mode'];
                if ($this->Session->check('userDetails.id')) {
                    $user_id = $this->Session->check('userDetails.id');
                    $salesperson_f = $this->Session->read('userDetails.firstname');
                    $salesperson_l = $this->Session->read('userDetails.lastname');
                    $salesperson = $salesperson_f . " " . $salesperson_l;
                }
                $saleacct = null;
                if ($this->Session->check('sales_acct')) {
                    $saleacct = $this->Session->read('sales_acct');
                }
                $invenacct = null;
                if ($this->Session->check('invent_acct')) {
                    $invenacct = $this->Session->read('invent_acct');
                }

                $inventory_data = array('head_id' => 4, 'account_id' => $invenacct, 'category_id' => 77,
                    'create_date' => $today, 'amount' => $stock_cost, 'credit' => null, 'debit' => $stock_cost, 'effect' => 1,
                    'prepared_by' => $salesperson, 'transaction_date' => $today, 'random_salt' => uniqid(substr(str_replace(' ', '', $salesperson), 0, 4)),
                    'remarks' => 'Inventory asset increase from inventory update');

                $cash_data = array('head_id' => 4, 'account_id' => $saleacct, 'payment_mode_id' => 1, 'category_id' => 101,
                    'create_date' => $today, 'amount' => $stock_cost, 'debit' => null, 'credit' => $stock_cost, 'effect' => 0,
                    'prepared_by' => $salesperson, 'transaction_date' => $today, 'random_salt' => uniqid(substr(str_replace(' ', '', $salesperson), 0, 4)),
                    'remarks' => 'Cash asset decrease from inventory update');

                $save_data = array($cash_data, $inventory_data);
                $supply_invoiceno = $this->request->data['Item']['supply_invoiceno'];
                $item_name = $this->request->data['Item']['item'];

                $item_data = $this->Item->find('first', array('recursive' => -1,
                    'conditions' => array('Item.item' => trim($item_name),
                        'Item.supplier_id' => $supplierID
                )));

                if ($item_data) {
                    $this->request->data['Item']['id'] = $item_data['Item']['id'];
                }
                if (!empty($this->request->data['Item']['id'])) {
                    // $this->request->data['Item']['remaining_quantity'] = 1;
                    // $this->request->data['Item']['original_quantity'] += $this->request->data['Item']['remaining_quantity'];
                    $this->request->data['Item']['date_added'] = date('Y-m-d');
                    $result = $this->Item->save($this->request->data);
                    $item_id = $this->Item->id;
                } else {
                    $this->request->data['Item']['date_added'] = date('Y-m-d');
                    $result = $this->Item->save($this->request->data);
                    $item_id = $this->Item->id;
                }


                $today = date('Y-m-d');
                if ($result) {
                    $this->Transaction->saveMany($save_data);

                    $sbankBal = $this->BankBalance->find('first', array(
                        'conditions' => array('BankBalance.account_id' => $saleacct),
                        'order' => array('BankBalance.id' => 'DESC')));
                    if ($sbankBal) {

                        $sbb_bal = $sbankBal['BankBalance']['amount'];
                        $sbb_bal = $sbb_bal - $stock_cost;
                        $sbankBal_array = array('account_id' => $saleacct,
                            'amount' => $sbb_bal, 'user' => $salesperson);
                        $this->BankBalance->save($sbankBal_array);
                    }

                    $warehouse_id = $this->request->data['Item']['warehouse_id'];
                    $remaining_quantity = $this->request->data['Item']['remaining_quantity'];
                    $warehsitem_check = $this->WarehouseItem->find('first', array('conditions' =>
                        array('WarehouseItem.item_id' => $item_id, 'WarehouseItem.warehouse_id' => $warehouse_id)
                    ));
                    if ($warehsitem_check) {
                        if ($transaction_mode != 'Service') {
                            $remaining_quantity = $warehsitem_check['WarehouseItem']['remaining_quantity'];
                            $original_quantity = $warehsitem_check['WarehouseItem']['original_quantity'];
                            $remaining_quantity += $this->request->data['Item']['remaining_quantity'];
                            $original_quantity += $this->request->data['Item']['remaining_quantity'];
                        } elseif ($transaction_mode == 'Service') {
                            $remaining_quantity = 1;
                            $original_quantity = 1;
                        } else {

                            $remaining_quantity = $warehsitem_check['WarehouseItem']['remaining_quantity'];
                            $original_quantity = $warehsitem_check['WarehouseItem']['original_quantity'];
                            $remaining_quantity += $this->request->data['Item']['remaining_quantity'];
                            $original_quantity += $this->request->data['Item']['remaining_quantity'];
                        }
                        $warehs_item_id = $warehsitem_check['WarehouseItem']['id'];
                        $warehouseitems_data = array('id' => $warehs_item_id, 'supply_invoiceno' => $supply_invoiceno, 'item_id' => $item_id, 'supplier_id' => $supplierID, 'warehouse_id' => $warehouse_id,
                            'remaining_quantity' => $remaining_quantity, 'original_quantity' => $original_quantity, 'modified_by' => $user_id);

                        $this->WarehouseItem->save($warehouseitems_data);
                    } else {
                        if ($transaction_mode != 'Service') {
                            $remaining_quantity = $this->request->data['Item']['remaining_quantity'];
                            $original_quantity = $this->request->data['Item']['remaining_quantity'];
                        } elseif ($transaction_mode == 'Service') {
                            $remaining_quantity = 1;
                            $original_quantity = 1;
                        } else {
                            $remaining_quantity = $this->request->data['Item']['remaining_quantity'];
                            $original_quantity = $this->request->data['Item']['remaining_quantity'];
                        }
                        $warehouseitems_data = array('item_id' => $item_id, 'warehouse_id' => $warehouse_id, 'supply_invoiceno' => $supply_invoiceno,
                            'original_quantity' => $original_quantity, 'remaining_quantity' => $remaining_quantity, 'supplier_id' => $supplierID, 'modified_by' => $user_id);


                        $this->WarehouseItem->create();
                        $this->WarehouseItem->save($warehouseitems_data);
                    }


                    $this->request->data = null;
                    $itemsGroup = $this->Item->find('all', array('conditions' => array('Item.supplier_id' => $supplierID, 'Item.delete_status !=' => 'deleted')));
                    if ($itemsGroup) {

                        $check = $this->Session->check('items');
                        if ($check) {
                            $this->Session->delete('items');
                        }
                        $this->Session->write('items', $itemsGroup);
                    } else {
                        $message = 'No Items For Selected Supplier';
                        $this->Session->write('bmsg', $message);
                    }
                    $message = "Product Details Save Successful";
                    $this->Session->write('smsg', $message);
                    $this->redirect('/Stocks/');
                } else {
                    $message = "Product Details Save Fail";
                    $this->Session->write('emsg', $message);
                    $this->redirect(array('controller' => 'Stocks', 'action' => 'index'));
                }
            }
        }
    }

    public function updateProductSave() {
        $this->autoRender = false;
        if ($this->request->is('post')) {
            if (!empty($this->request->data)) {
                if (isset($this->request->data['Item']['id']) && ($this->request->data['Item']['id'] != "" && $this->request->data['Item']['id'] != null)) {
                    $item_id = $this->request->data['Item']['warehouseitem_id'];

                    $supplierID = $_POST['hid_supID'];
                    $check = $this->Session->check('supplier');
                    if ($check) {
                        $this->Session->delete('supplier');
                    }

                    $check = $this->Session->check('itemData');
                    if ($check) {
                        $this->Session->delete('itemData');
                    }
                    if ($supplierID == null || $supplierID == "" || $supplierID == 0) {

                        $message = 'Please Select A Supplier';
                        $this->Session->write('bmsg', $message);
                        $this->redirect('/Stocks/updateProduct' . $item_id);
                    }
                    //image handling
                    if (is_uploaded_file($this->request->data['Item']['item_photo']['tmp_name'])) {
                        $this->request->data['Item']['img_name'] = $this->request->data['Item']['item_photo']['name'];
                        $fileData = fread(
                                fopen($this->request->data['Item']['item_photo']['tmp_name'], "r"), $this->request->data['Item']['item_photo']['size']
                        );
                        $this->request->data['Item']['item_photo'] = $fileData;
                    }

                    // $this->request->data['Item']['supplier_id'] = $supplierID;
//                    $this->request->data['Item']['id'] = $_POST['hid_ID'];
                    $result = $this->Item->save($this->request->data);
                    $warehouse_data = array('id' => $item_id, 'warehouse_id' => $this->request->data['Item']['warehouse_id']
                        , 'remaining_quantity' => $this->request->data['Item']['remaining_quantity'],
                        'original_quantity' => $this->request->data['Item']['remaining_quantity']);

                    if ($result) {
                        $this->WarehouseItem->save($warehouse_data);
                        $this->request->data = null;
                        $message = "Product Details Save Successful";
                        $this->Session->write('smsg', $message);
                        $this->redirect('/Stocks/findProduct/');
                    } else {
                        $message = "Product Details Save Unsuccessful";
                        $this->Session->write('bmsg', $message);
                        $this->redirect(array('controller' => 'Stocks', 'action' => 'updateProduct', $item_id));
                    }
                } else {

                    $message = 'Please Select a Product and Try Again';
                    $this->Session->write('bmsg', $message);
                    $this->redirect(array('controller' => 'Stocks', 'action' => 'findProduct'));
                }
            } else {
                $message = "Product Details Save Fail";
                $this->Session->write('emsg', $message);
                $this->redirect(array('controller' => 'Stocks', 'action' => 'findProduct'));
            }
        }
    }

    function delItem($item = Null, $supplierID = Null) {
        $this->autoRender = false;
        if ($this->request->is('post')) {


            if (!empty($this->request->data)) {


                $itemid = $_POST['itemId'];
                $result = $this->Item->delete($itemid, false);



                if ($result) {
                    $message = "Delete success";
                    $this->redirect(array('controller' => "Stocks", 'action' => "index"));
                } else {
                    $message = "Delete unsuccessful";
                    $this->redirect(array('controller' => "Stocks", 'action' => "index"));
                }
            }
        } else {


            $result = $this->Item->delete($item, false);
            if ($result) {
                $message = "Delete success";
                $this->Session->write('smsg', $message);
                $this->redirect(array('controller' => "Stocks", 'action' => "index", $supplierID));
            } else {
                $message = "Delete unsuccessful";
                $this->Session->write('emsg', $message);
                $this->redirect(array('controller' => "Stocks", 'action' => "index", $supplierID));
            }
        }
    }

    function removeProduct($prodID = null) {

        $this->autoRender = false;
//        $item_status = array('id' => $prodID, 'delete_status' => 'deleted');
        $today = date('Y-m-d');
        $salesperson = "";
        if ($this->Session->check('userDetails.id')) {
            $salesperson_f = $this->Session->read('userDetails.firstname');
            $salesperson_l = $this->Session->read('userDetails.lastname');
            $salesperson = $salesperson_f . " " . $salesperson_l;
        }
        $saleacct = null;
        if ($this->Session->check('sales_acct')) {
            $saleacct = $this->Session->read('sales_acct');
        }
        $invenacct = null;
        if ($this->Session->check('invent_acct')) {
            $invenacct = $this->Session->read('invent_acct');
        }

        $select = $this->WarehouseItem->find('first', array('conditions' => array('WarehouseItem.id' => $prodID)));
        $result = $this->WarehouseItem->delete($prodID, false);
        if ($result) {
            if ($select) {
                $stock_cost = $select['Item']['cost_price'] * $select['WarehouseItem']['remaining_quantity'];
                $today = $select['Item']['date_added'];
                $inventory_data = array('head_id' => 4, 'account_id' => $invenacct, 'category_id' => 77,
                    'create_date' => $today, 'amount' => $stock_cost, 'credit' => $stock_cost, 'debit' => null, 'effect' => 0,
                    'prepared_by' => $salesperson, 'transaction_date' => $today, 'random_salt' => uniqid(substr(str_replace(' ', '', $salesperson), 0, 4)),
                    'remarks' => 'Inventory asset decrease from stock delete');

                $cash_data = array('head_id' => 4, 'account_id' => $saleacct, 'payment_mode_id' => 1, 'category_id' => 101,
                    'create_date' => $today, 'amount' => $stock_cost, 'debit' => $stock_cost, 'credit' => null, 'effect' => 1,
                    'prepared_by' => $salesperson, 'transaction_date' => $today, 'random_salt' => uniqid(substr(str_replace(' ', '', $salesperson), 0, 4)),
                    'remarks' => 'Cash asset increase from stock delete');

                $save_data = array($cash_data, $inventory_data);
                $result = $this->Transaction->saveMany($save_data);
                if ($result) {
                    $sbankBal = $this->BankBalance->find('first', array(
                        'conditions' => array('BankBalance.account_id' => $saleacct),
                        'order' => array('BankBalance.id' => 'DESC')));
                    if ($sbankBal) {
                        $sbb_bal = $sbankBal['BankBalance']['amount'];
                        $sbb_bal = $sbb_bal + $stock_cost;
                        $sbankBal_array = array('account_id' => $saleacct,
                            'amount' => $sbb_bal, 'user' => $salesperson);
                        $this->BankBalance->save($sbankBal_array);
                    }
                }

                $invoice_no = $select['Item']['supply_invoiceno'];
                $invoice_data = $this->Supplierinvoice->find('first', array('conditions' => array('Supplierinvoice.supply_invoiceno' => $invoice_no, 'Supplierinvoice.amountpaid >' => 0), 'recursive' => -1));
                if ($invoice_data) {
                    $amountpaid = $invoice_data['Supplierinvoice']['amountpaid'];
                    $invoice_cost = $invoice_data['Supplierinvoice']['cost_price'];
                    if ($amountpaid >= $stock_cost) {
                        $amountpaid = $amountpaid - $stock_cost;
                        $invoice_cost = $invoice_cost - $stock_cost;
                        $balance = $invoice_cost - $amountpaid;
                        $invoice_array = array('id' => $invoice_data['Supplierinvoice']['id'], 'cost_price' => $invoice_cost, 'amountpaid' => $amountpaid, 'balance' => $balance);
                        $this->Supplierinvoice->save($invoice_array);
                    } else {

                        $invoice_cost = $invoice_cost - $stock_cost;
                        $balance = $invoice_cost - $amountpaid;
                        $invoice_array = array('id' => $invoice_data['Supplierinvoice']['id'], 'cost_price' => $invoice_cost, 'balance' => $balance);
                        $this->Supplierinvoice->save($invoice_array);
                    }
                }
            }

            $check = $this->Session->check('items');
            if ($check) {
                $items = $this->Session->delete('items');
            }
            $message = "Item Delete Successful";
            $this->Session->write('smsg', $message);
        } else {
            $message = "Item Delete unsuccessful";
            $this->Session->write('bmsg', $message);
        }
        $this->redirect(array('controller' => "Stocks", 'action' => "deleteProduct"));
    }

    function listProducts() {
        $this->__validateUserType2();
        $data = $this->paginate('Item');
        $this->set('data', $data);
    }

    function findProduct() {
        $this->__validateUserType2();
//        $data = $this->paginate('Item');

        $this->paginate = array('limit' => 25,
            'order' => array('Item.item' => 'asc'), 'conditions' => array('Item.delete_status !=' => 'deleted')
        );

        $data = $this->paginate('WarehouseItem');
        $this->set('data', $data);
        // $this->set('customer', $this->Customer->find('all'));WarehouseItem

        $check = $this->Session->check('itemData');
        if ($check) {
            $items = $this->Session->read('itemData');
            $this->set('data', $items);

            $this->Session->delete('itemData');
        }
        $check = $this->Session->check('singleitem');
        if ($check) {
            $item = $this->Session->read('singleitem');
            $this->set('item', $item);
        }
    }

    public function clearSessions() {
        $check = $this->Session->check('itemData');
        if ($check) {
            $this->Session->delete('itemData');
        }
        $check = $this->Session->check('singleitem');
        if ($check) {
            $this->Session->delete('singleitem');
        }

        $this->redirect(array('controller' => 'Stocks', 'action' => 'findProduct'));
    }

    function updateProduct($itemID = null) {
        $this->set('warehouses', $this->Warehouse->find('list', array('conditions' => array('Warehouse.deleted' => 0))));
        $this->set('suppliers', $this->Supplier->find('list'));
        if ($itemID == '' || is_null($itemID)) {
            $message = 'Please Select a Product and Try Again';
            $this->Session->write('bmsg', $message);
            $this->redirect(array('controller' => 'Stocks', 'action' => 'findProduct'));
        } else {

            $itemdata = $this->WarehouseItem->find('first', array('conditions' => array('WarehouseItem.id' => $itemID)));

            if ($itemdata) {

                $this->set('item', $itemdata);
            } else {
                $message = 'Item Info Unreachable, Please Select a Product and Try Again';
                $this->Session->write('bmsg', $message);
                $this->redirect(array('controller' => 'Stocks', 'action' => 'findProduct'));
            }
        }
    }

    function updatePrice() {
        $this->autoRender = false;
        if ($this->request->is('post')) {
            $new = $this->request->data['Item']['price_update'];
            $data = $this->Item->find('all', array('conditions' => array('Item.delete_status' => 'alive'), 'recursive' => -1));
            if ($data) {
                foreach ($data as $val) {
                    $increase = 0.00;
                    $price_update = 0.00;
                    $increase = ($new / 100) * $val['Item']['selling_price'];
                    $price_update = $val['Item']['selling_price'] + round($increase, 2);
                    $update = array('id' => $val['Item']['id'], 'selling_price' => round($price_update, 2));
                    $this->Item->save($update);
                }
                $message = 'Product Update Successful';
                $this->Session->write('smsg', $message);
                $this->redirect(array('controller' => 'Stocks', 'action' => 'stock_dashboard'));
            } else {
                $message = 'Sorry, Product Update Unsuccessful';
                $this->Session->write('bmsg', $message);
                $this->redirect(array('controller' => 'Stocks', 'action' => 'stock_dashboard'));
            }
        }
    }

    function productSearch($itemID = null) {
        $this->autoRender = false;
        if ($this->request->is('post')) {
            $itemname = $this->request->data['product_search'];
            $item = $this->WarehouseItem->find('all', array('conditions' => array('OR' => array(array('Item.item LIKE' => "%$itemname%"), array('Item.modelno LIKE' => "%$itemname%"), array('Item.brand LIKE' => "%$itemname%"), array('Item.item_type LIKE' => "%$itemname%"), array('Item.item_item LIKE' => "%$itemname%"), array('Item.serialno LIKE' => "%$itemname%")), 'Item.delete_status !=' => 'deleted')));

            if ($item) {
//            $cust = $this->Session->write('cust',$customer);
                $check = $this->Session->check('itemData');
                if ($check) {
                    $this->Session->delete('itemData');
                }
                $this->Session->write('itemData', $item);
                $this->redirect(array('controller' => 'Stocks', 'action' => 'findProduct'));
            } else {
                $check = $this->Session->check('itemData');
                if ($check) {
                    $this->Session->delete('itemData');
                }
                $message = 'Sorry Product Not Found';
                $this->Session->write('emsg', $message);
                $this->redirect(array('controller' => 'Stocks', 'action' => 'findProduct'));
            }
        } else {


            $products = $this->WarehouseItem->find('all', array('conditions' => array('WarehouseItem.id' => $itemID, 'Item.delete_status !=' => 'deleted')));
            $product = $this->WarehouseItem->find('first', array('conditions' => array('WarehouseItem.id' => $itemID, 'Item.delete_status !=' => 'deleted')));
            if ($products) {
                $check = $this->Session->check('itemData');
                if ($check) {
                    $this->Session->delete('itemData');
                }
                $check = $this->Session->check('singleitem');
                if ($check) {
                    $this->Session->delete('singleitem');
                }
                $this->Session->write('itemData', $products);
                $this->Session->write('singleitem', $product);
                $this->redirect(array('controller' => 'Stocks', 'action' => 'findProduct'));
            } else {
                $check = $this->Session->check('itemData');
                if ($check) {
                    $this->Session->delete('itemData');
                }
                $message = 'Sorry Product Not Found';
                $this->Session->write('emsg', $message);
                $this->redirect(array('controller' => 'Stocks', 'action' => 'findProduct'));
            }
        }
    }

    function deleteProduct() {
        $this->__validateUserType();
//        $data = $this->paginate('Item');

        $this->paginate = array('limit' => 25,
            'order' => array('Item.item' => 'asc'), 'conditions' => array('Item.delete_status' => 'alive'));

        $data = $this->paginate('WarehouseItem');

        $this->set('data', $data);

        $check = $this->Session->check('ditemData');
        if ($check) {
            $items = $this->Session->read('ditemData');
            $this->set('data', $items);

            $this->Session->delete('ditemData');
        }
        $check = $this->Session->check('dsingleitem');
        if ($check) {
            $item = $this->Session->read('dsingleitem');
            $this->set('item', $item);
        }
    }

    function productdele($itemID = null) {
        $this->autoRender = false;
        if ($this->request->is('post')) {
            $itemname = $this->request->data['product_search'];
            $item = $this->WarehouseItem->find('all', array('conditions' => array('OR' => array(array('Item.item LIKE' => "%$itemname%"), array('Item.modelno LIKE' => "%$itemname%"), array('Item.brand LIKE' => "%$itemname%"), array('Item.item_type LIKE' => "%$itemname%"), array('Item.item_item LIKE' => "%$itemname%"), array('Item.serialno LIKE' => "%$itemname%")), 'Item.delete_status' => 'alive')));

            if ($item) {
//            $cust = $this->Session->write('cust',$customer);
                $check = $this->Session->check('ditemData');
                if ($check) {
                    $this->Session->delete('ditemData');
                }
                $this->Session->write('ditemData', $item);
                $this->redirect(array('controller' => 'Stocks', 'action' => 'deleteProduct'));
            } else {
                $check = $this->Session->check('ditemData');
                if ($check) {
                    $this->Session->delete('ditemData');
                }
                $message = 'Sorry Product Not Found';
                $this->Session->write('emsg', $message);
                $this->redirect(array('controller' => 'Stocks', 'action' => 'deleteProduct'));
            }
        } else {


            $products = $this->Item->find('all', array('conditions' => array('Item.id' => $itemID, 'Item.delete_status !=' => 'deleted')));
            $product = $this->Item->find('first', array('conditions' => array('Item.id' => $itemID, 'Item.delete_status !=' => 'deleted')));
            if ($products) {
                $check = $this->Session->check('ditemData');
                if ($check) {
                    $this->Session->delete('ditemData');
                }
                $check = $this->Session->check('dsingleitem');
                if ($check) {
                    $this->Session->delete('dsingleitem');
                }
                $this->Session->write('ditemData', $products);
                $this->Session->write('dsingleitem', $product);
                $this->redirect(array('controller' => 'Stocks', 'action' => 'deleteProduct'));
            } else {
                $check = $this->Session->check('ditemData');
                if ($check) {
                    $this->Session->delete('ditemData');
                }
                $message = 'Sorry Product Not Found';
                $this->Session->write('emsg', $message);
                $this->redirect(array('controller' => 'Stocks', 'action' => 'deleteProduct'));
            }
        }
    }

    function productDetails() {
        $this->__validateUserType2();
        $data = $this->paginate('Item');
        $this->set('data', $data);
        $check = $this->Session->check('singleitem');
        if ($check) {
            $itemData = $this->Session->read('singleitem');
            $this->set('itemData', $itemData);
            $this->Session->delete('singleitem');
        }
    }

    function displayInfo($itemId = null) {


        $this->autoLayout = false;
        $this->autoRender = false;
        $check = $this->Session->check('singleitem');
        if ($check) {
            $this->Session->delete('singleitem');
        }

        $itemLst = $this->Item->find('first', array('conditions' => array('Item.id' => $itemId)));

        if ($itemLst) {
            $order_session = $this->Session->write('singleitem', $itemLst);
            $this->redirect(array('controller' => 'Stocks', 'action' => 'productDetails'));
        } else {
            $this->redirect(array('controller' => 'Stocks', 'action' => 'listProducts'));
        }
    }

    function supplierInfo() {


        $this->autoRender = false;
        if ($this->request->is('ajax')) {

            if (!empty($this->request->data)) {
                $supplierID = $_POST['SupplierId'];
                if ($supplierID != null && $supplierID != "") {
                    $supplierData = $this->Supplier->find('first', array('conditions' => array('Supplier.id' => $supplierID)));

                    //   $itemsGroup = $this->Item->find('all', array('conditions' => array('Item.supplier_id' => $supplierID, 'Item.delete_status !=' => 'deleted')));

                    if ($supplierData) {

                        $check = $this->Session->check('supplier');
                        if ($check) {
                            $this->Session->delete('supplier');
                        }
                        $this->Session->write('supplier', $supplierData);
                    } else {
                        $message = 'Supplier Details Unavailable';
                        $this->Session->write('emsg', $message);
                    }

                    // if ($itemsGroup) {
                    //    $check = $this->Session->check('items');
                    //  if ($check) {
                    //    $this->Session->delete('items');
                    //}
                    //$this->Session->write('items', $itemsGroup);
                    // } else {
                    //$message = 'No Items For Selected Supplier';
                    //  $this->Session->write('bmsg', $message);
                    //}

                    return json_encode(array('status' => 'ok'));
                } else {
                    $message = 'Invalid Supplier Selected';
                    $this->Session->write('bmsg', $message);
                    return json_encode(array('status' => 'fail'));
                }
            }
        }
    }

    function delSupplier($supplyId = null) {


        $this->autoRender = false;

        $result = $this->Supplier->delete($supplyId, false);

        if ($result) {
            $message = "Supplier Delete Successful";
            $this->Session->write('smsg', $message);
        } else {
            $message = "Supplier Delete unsuccessful";
            $this->Session->write('bmsg', $message);
        }

        $this->redirect(array('controller' => "Stocks", 'action' => "supNewSupplier"));
    }

    public function supSuppliers() {
        $this->__validateUserType();
        $data = $this->paginate('Supplier');
        $this->set('data', $data);
    }

    public function supNewSupplier() {
        $this->__validateUserType();
        $data = $this->paginate('Supplier');
        $this->set('data', $data);



        if ($this->request->is('post')) {

            if (!empty($this->request->data)) {
                $result = $this->Supplier->save($this->request->data);
                if ($result) {
                    $this->request->data = null;
                    $message = 'New Supplier Details Save, Successful';
                    $this->Session->write('smsg', $message);
                    $this->redirect(array('controller' => "Stocks", 'action' => "supNewSupplier"));
                } else {
                    $message = 'New Supplier Save, Unsuccessful!!';
                    $this->Session->write('emsg', $message);
                    $this->redirect(array('controller' => "Stocks", 'action' => "supNewSupplier"));
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
                $supplyLst = $this->Supplier->find('first', array('conditions' => array('Supplier.id' => $supplyId), 'recursive' => -1));

                $supplyLsts = json_encode($supplyLst);
                return $supplyLsts;
            }
        }
    }

//    function delSupplier() {
//
//        if ($this->request->is('ajax')) {
//            Configure::write('debug', 0);
//            $this->autoRender = false;
//            $this->autoLayout = false;
//            if (!empty($this->request->data)) {
//
//
//                $supplyId = $_POST['supplierId'];
//                $result = $this->Supplier->delete($supplyId);
//
//
//
//                if ($result) {
//                    return "success";
//                } else {
//                    return "unsuccessful";
//                }
//            }
//        }
//    }


    function supListSuppliers() {
        $this->__validateUserType();
        $data = $this->paginate('Supplier');
        $this->set('data', $data);
    }

    function supListSuppliersInvoices($supplier_id = null) {
        $this->__validateUserType2();
        $data = $this->paginate('Supplierinvoice');

        if ($supplier_id != null && $supplier_id != "") {
            $supplier_info = $this->Supplier->find('first', array('conditions' => array('Supplier.id' => $supplier_id)));
            $supplierData = $this->WarehouseItem->find('all', array('group' => array('WarehouseItem.supply_invoiceno'), 'order' => array('Item.date_added'), 'fields' => array('WarehouseItem.supply_invoiceno', 'WarehouseItem.supplier_id', 'Supplierinvoice.supply_date', 'SUM(Item.cost_price) AS totcost_price', 'Supplierinvoice.cost_price', 'Supplierinvoice.amountpaid', 'Supplierinvoice.balance', 'Supplierinvoice.last_disb_date'), 'conditions' => array('WarehouseItem.supplier_id' => $supplier_id, 'WarehouseItem.supply_invoiceno !=' => null, 'Item.delete_status' => 'alive')));

            if ($supplierData) {
                if ($supplier_info) {
                    $this->set('supplier', $supplier_info);
                }
                $this->set('data', $supplierData);
            } else {

                $message = 'No Invoices Found For Selected Supplier';
                $this->Session->write('bmsg', $message);
                $this->redirect(array('controller' => "Stocks", 'action' => "supListSuppliers"));
            }
        } else {

//            $message = 'Invalid Supplier Details. Please Check Supplier Info Page';
//            $this->Session->write('emsg', $message);
            $this->redirect(array('controller' => "Stocks", 'action' => "supListSuppliers"));
        }

//        $this->set('warehouses', $this->Warehouse->find('list'));
//        $this->set('suppliers', $this->Supplier->find('list'));
    }

    function supListSuppliersInvoicesDetails($invoice_no = null, $supplier_id = null) {
        $this->__validateUserType();
        $this->paginate('WarehouseItem');

        $supplierData = $this->WarehouseItem->find('all', array('conditions' => array('WarehouseItem.supply_invoiceno !=' => null, 'WarehouseItem.supply_invoiceno' => $invoice_no, 'Item.delete_status' => 'alive')));

        if ($supplierData) {
            $supinvoice = $this->Supplierinvoice->find('first', array('conditions' => array('Supplierinvoice.supply_invoiceno' => $invoice_no)));

            $totsupplierData = $this->WarehouseItem->find('all', array('conditions' => array('WarehouseItem.supply_invoiceno !=' => null, 'WarehouseItem.supply_invoiceno' => $invoice_no, 'Item.delete_status' => 'alive'), 'fields' => array('SUM(Item.cost_price) AS totcost_price', 'SUM(WarehouseItem.original_quantity)AS totoriginal_quantity')));

            if ($supinvoice) {
                $this->set('supplyinvoice', $supinvoice);
            }
            //else {
//                $message = 'No Payment Made For Selected Invoice';
//                $this->Session->write('bmsg', $message);
//                $this->redirect(array('controller' => "Stocks", 'action' => "supListSuppliers"));
//            }
            if ($totsupplierData) {
                $this->set('totdata', $totsupplierData);
            }
            $this->set('data', $supplierData);
            $this->set('invoice_no', $invoice_no);

            $this->set('supplier_id', $supplier_id);
        } else {

            $message = 'No Items/Payments Found For Selected Invoice';
            $this->Session->write('bmsg', $message);
            $this->redirect(array('controller' => "Stocks", 'action' => "supListSuppliers"));
        }
    }

    function supListSuppliersInvoicesPrint() {
        $this->__validateUserType();
        $data = $this->paginate('Supplierinvoice');
        $this->set('data', $data);
//        $this->set('warehouses', $this->Warehouse->find('list'));
//        $this->set('suppliers', $this->Supplier->find('list'));
    }

    function supListSuppliersInvoicesDetailsPrint() {
        $this->__validateUserType();
        $data = $this->paginate('Supplierinvoice');
        $this->set('data', $data);
    }

    public function supEditPayments($supplypayment_id = null) {
        $this->__validateUserType();
        $data = $this->paginate('SupplyPayment');
        $this->set('data', $data);

        $last_payment = $this->SupplyPayment->find('first', array('conditions' => array('SupplyPayment.id' => $supplypayment_id)));
        if ($last_payment) {
            $this->set('supinvoice', $last_payment);
            $this->set('supplier_id', $last_payment['SupplyPayment']['supplier_id']);
            $this->set('invoice_no', $last_payment['Supplierinvoice']['supply_invoiceno']);
        } else {
            
        }
    }

    public function edit_sup_payments() {
        $this->autoRender = false;
        if ($this->request->is('post')) {

            if (!empty($this->request->data)) {
                $invoice_id = $_POST['hid_orderid'];
                $invoice_no = $_POST['hid_invoiceno'];
                $cost_price = $_POST['hid_cost_price'];
                $supplier_id = $_POST['hid_supplierid'];
                $payment_id = $this->request->data['SupplyPayment']['id'];
                $payment = 0;
                $payment_day = $this->request->data['SupplyPayment']['payment_date']['day'];
                $payment_month = $this->request->data['SupplyPayment']['payment_date']['month'];
                $payment_year = $this->request->data['SupplyPayment']['payment_date']['year'];

                $cheque_numbers = null;
                $paymentdt = $payment_year . "-" . $payment_month . "-" . $payment_day;
                $payment_date = date('Y-m-d', strtotime($paymentdt));
                $spayment_date = strtotime($paymentdt);
                $lsd_date = date('Y-m-d', $spayment_date);

                $session_date = date('d-m-Y', strtotime($paymentdt));
                $check = $this->Session->check('payment_date');
                if ($check) {
                    $this->Session->delete('payment_date');
                }
                $this->Session->write('payment_date', $session_date);



                $last_payment = $this->SupplyPayment->find('first', array('conditions' => array('SupplyPayment.id' => $payment_id)));

                if ($last_payment) {

                    if ($this->request->data['SupplyPayment']['payment_mode'] == "" || $this->request->data['SupplyPayment']['payment_mode'] == null) {
                        $message = 'Please Select A Mode of Payment.';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Stocks', 'action' => 'supEditPayments', $payment_id));
                    }

                    if (isset($this->request->data['SupplyPayment']['used_chequenos'])) {
                        if ($this->request->data['SupplyPayment']['payment_mode'] == "Post-dated chq" && ($this->request->data['SupplyPayment']['used_chequenos'] == "" || $this->request->data['SupplyPayment']['used_chequenos'] == null )) {
                            $message = 'Please Select A Cheque No.';
                            $this->Session->write('emsg', $message);
                            $this->redirect(array('controller' => 'Stocks', 'action' => 'supEditPayments', $payment_id));
                        }
                    } else {
                        if ($this->request->data['SupplyPayment']['payment_mode'] == "Post-dated chq") {
                            $message = 'Please Select A Different Payment Mode.No Post-date Chqs Available';
                            $this->Session->write('emsg', $message);
                            $this->redirect(array('controller' => 'Stocks', 'action' => 'supEditPayments', $payment_id));
                        }
                    }


//                    if ($this->request->data['SupplyPayment']['payment_mode'] == "Cheque" && ($this->request->data['SupplyPayment']['cheque_nos'] == "" || $this->request->data['SupplyPayment']['cheque_nos'] == null )) {
//                        $message = 'Please State A Cheque No.';
//                        $this->Session->write('emsg', $message);
//                        $this->redirect(array('controller' => 'Stocks', 'action' => 'supEditPayments', $payment_id));
//                    }

                    if ($this->request->data['SupplyPayment']['amount'] == "" || $this->request->data['SupplyPayment']['amount'] == null) {
                        $message = 'Amount Not Entered.';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Stocks', 'action' => 'supEditPayments', $payment_id));
                    }

                    if (isset($this->request->data['SupplyPayment']['used_chequenos'])) {
                        if ($this->request->data['SupplyPayment']['used_chequenos'] != "" || $this->request->data['SupplyPayment']['used_chequenos'] != null) {
                            $cheque_numbers = $this->request->data['SupplyPayment']['used_chequenos'];
                        }
                    }


                    if (isset($this->request->data['SupplyPayment']['cheque_nos'])) {
                        if ($this->request->data['SupplyPayment']['cheque_nos'] != "" || $this->request->data['SupplyPayment']['cheque_nos'] != null) {
                            $cheque_numbers = $this->request->data['SupplyPayment']['cheque_nos'];
                            $this->request->data['SupplyPayment']['used_chequenos'] = $cheque_numbers;
                        }
                    }

                    //add old payment to balance and substract from amount paid
                    $order_date = $last_payment['Supplierinvoice']['supply_date'];
                    $last_pay_date = $last_payment['Supplierinvoice']['last_disb_date'];
                    $first_pay = $last_payment['Supplierinvoice']['first_date'];
                    $sf_date = strtotime($first_pay);
                    $slpdate = strtotime($order_date);

                    // $expectedmod_id = $last_payment['Payment']['expectedpayment_id'];
                    $payment = $this->request->data['SupplyPayment']['amount'];
                    $payment_id = $last_payment['SupplyPayment']['id'];
                    $payment_mode = $this->request->data['SupplyPayment']['payment_mode'];
                    $reset_balance = $last_payment['Supplierinvoice']['balance'] + $last_payment['SupplyPayment']['amount'];
                    $reset_paid = $last_payment['Supplierinvoice']['amountpaid'] - $last_payment['SupplyPayment']['amount'];
                    if ($sf_date == $slpdate) {
                        $resetbalSheet = array('description' => 'Supply', 'cash' => $last_payment['SupplyPayment']['amount'], 'acc_payable_creditors' => $last_payment['SupplyPayment']['amount'], 'date' => $order_date);
                    } elseif ($sf_date > $slpdate) {
                        $resetbalSheet = array('description' => 'Note Payable', 'cash' => $last_payment['SupplyPayment']['amount'], 'acc_payable_creditors' => $last_payment['SupplyPayment']['amount'], 'date' => $last_pay_date);
                    } else {
                        $resetbalSheet = array('description' => 'Supply', 'cash' => '-' . $last_payment['SupplyPayment']['amount'], 'acc_payable_creditors' => $last_payment['SupplyPayment']['amount'], 'date' => $order_date);
                    }

                    $resetinStatment = array('description' => 'Cost of Sales', 'expenditure' => '-' . $last_payment['SupplyPayment']['amount'], 'date' => $last_pay_date);


                    if ($spayment_date == $slpdate) {
                        $balSheet = array('description' => 'Supply', 'cash' => '-' . $payment, 'acc_payable_creditors' => '-' . $payment, 'date' => $order_date);
                    } elseif ($spayment_date > $slpdate) {
                        $balSheet = array('description' => 'Note Payable', 'cash' => '-' . $payment, 'acc_payable_creditors' => '-' . $payment, 'date' => $lsd_date);
                    } else {
                        $balSheet = array('description' => 'Supply', 'cash' => '-' . $payment, 'acc_payable_creditors' => '-' . $payment, 'date' => $lsd_date);
                    }

                    $inStatment = array('description' => 'Cost of Sales', 'expenditure' => $payment, 'date' => $lsd_date);


                    $cost_price = $last_payment['Supplierinvoice']['cost_price'];
                    //$mthly_installmt = $last_payment['Order']['mthly_install'];
                    // $expecteddiff = $last_payment['Order']['differencefrmexpected'];
                    // $interest_accrued = $last_payment['Order']['interest_accrued'];
                    // $zone_id = $last_payment['Order']['zone_id'];
                    // $order_date = $last_payment['Order']['order_date'];
                    //$due_date = $last_payment['Order']['due_date'];
                    //$customer = $last_payment['Order']['customer_id'];
                    $invoice_no = $last_payment['Supplierinvoice']['supply_invoiceno'];

                    $balance = $reset_balance - $payment;
                    $total_paid = $reset_paid + $payment;
//                $total_paid = $old_total_paid + $payment;
//                $balance = $cost_price - $total_paid;

                    switch ($balance) {
                        case 0:
                            $payment_status = "full_payment";
//                    $tdate = date('Y-m-d H:i:s', $spayment_date);
//                    $todate = new DateTime($tdate);
                            break;
                        case $cost_price:
                            $payment_status = "no_payment";
//                    $tdate = date('Y-m-d H:i:s', $spayment_date);
//                    $todate = new DateTime($tdate);
//                    $todate->add(new DateInterval('P1M'));
                            break;
                        default:
                            $payment_status = "part_payment";
//                    $tdate = $order_details['Order']['due_date'];
//                    $todate = new DateTime($tdate);
//                    $todate->add(new DateInterval('P1M'));

                            break;
                    }
                    if ($balance <= 0) {
                        $payment_status = "full_payment";
                        $payment_finish_date = $lsd_date;
                    } else {
                        $payment_finish_date = null;
                    }

                    if ($payment == "" || $payment == null) {
                        $message = "No Payment Made";
                        $this->Session->write('emsg', $message);

                        $this->redirect(array('controller' => 'Stocks', 'action' => 'supEditPayments', $payment_id));
                    }

                    $check = $this->Session->check('userInfo');
                    if ($check) {
                        $userid = $this->Session->read('userInfo');
                        $user_id = $userid['User']['id'];
                    }

                    $payment_details = array('id' => $payment_id, 'supplier_id' => $supplier_id, 'user_id' => $user_id, 'payment_mode' => $payment_mode, 'amount' => $payment, 'payment_date' => $payment_date, 'used_chequenos' => $cheque_numbers);

//                        if ($reset_balance == $cost_price) {
//
////                            $ffpayment_date = date('Y-m-d', $spayment_date);
////                            $tdate = date('Y-m-d H:i:s', strtotime($order_date));
////                            $todate = new DateTime($tdate);
////                            $todate->add(new DateInterval('P1M'));
//
//                             $approval = array('id' => $invoice_id, 'amountpaid' => $payment, 'supplier_id' => $supplier_id, 'balance' => $balance, 'payment_status' => $payment_status, 'first_date' => $lsd_date, 'last_disb_date' => $lsd_date, 'payment_finish_date' => $payment_finish_date);
//                        }else{

                    switch ($payment_status) {
                        case "full_payment":

                            $approval = array('id' => $invoice_id, 'amountpaid' => $total_paid, 'supplier_id' => $supplier_id, 'balance' => $balance, 'payment_status' => $payment_status, 'last_disb_date' => $lsd_date, 'payment_finish_date' => $payment_finish_date);

//                                 print_r('me2');
//                                exit;

                            break;

                        default:
                            $approval = array('id' => $invoice_id, 'amountpaid' => $total_paid, 'supplier_id' => $supplier_id, 'balance' => $balance, 'payment_status' => $payment_status, 'last_disb_date' => $lsd_date);


                            break;
                        //}
                    }

                    $result = $this->Supplierinvoice->save($approval);

                    $result2 = $this->SupplyPayment->save($payment_details);

                    if ($result && $result2) {
                        $bal_data = array($resetbalSheet, $balSheet);
                        $income_data = array($resetinStatment, $inStatment);
                        $this->BalanceSheet->saveMany($bal_data);
                        $this->IncomeStatement->saveMany($income_data);

                        $this->request->data = null;
                        $message = "Payment successful";
                        $this->Session->write('smsg', $message);
                    } else {
                        $this->request->data = null;
                        $message = "Payment unsuccessful";
                        $this->Session->write('emsg', $message);
                    }




                    $this->redirect(array('controller' => 'Stocks', 'action' => 'supListSuppliersInvoicesDetails', $invoice_no, $supplier_id));
                } else {
                    $message = "Unable To Retrieve Payment Data";
                    $this->Session->write('emsg', $message);
                    $this->redirect(array('controller' => 'Stocks', 'action' => 'supListSuppliersInvoicesDetails', $invoice_no, $supplier_id));
                }
            } else {
                $message = "Unable To Retrieve Payment Data";
                $this->Session->write('emsg', $message);
                $this->redirect(array('controller' => 'Stocks', 'action' => 'supListSuppliersInvoicesDetails', $invoice_no, $supplier_id));
            }
        } else {

            $message = "Unable To Save Payment Data";
            $this->Session->write('emsg', $message);
            $this->redirect(array('controller' => 'Stocks', 'action' => 'supListSuppliers'));
        }
    }

    public function listSuppayments($supplierinvoice_id = null, $invoice_no = null, $supplier_id = null) {
        $this->__validateUserType2();
        $this->paginate('SupplyPayment');


        $last_payment = $this->SupplyPayment->find('all', array('conditions' => array('SupplyPayment.supplierinvoice_id' => $supplierinvoice_id), 'order' => array('SupplyPayment.id ASC')));
        if ($last_payment) {
            $supplierinfo = $this->Supplier->find('first', array('conditions', array('Supplier.id' => $supplier_id)));
            if ($supplierinfo) {

                $supplier_name = $supplierinfo['Supplier']['supplier_name'];
            } else {
                $supplier_name = "xxxxx";
            }

            $invoice_info = $this->Supplierinvoice->find('first', array('conditions' => array('Supplierinvoice.id' => $supplierinvoice_id)));

            if ($invoice_info) {

                $amount_paid = $invoice_info['Supplierinvoice']['amountpaid'];
                $balance = $invoice_info['Supplierinvoice']['balance'];
            } else {
                $amount_paid = "";
                $balance = "";
            }
            $this->set('data', $last_payment);
            $this->set('invoice_no', $invoice_no);
            $this->set('supplier_name', $supplier_name);
            $this->set('supplier_id', $supplier_id);
            $this->set('amount', $amount_paid);
            $this->set('balance', $balance);
        } else {

            $message = 'No Payments Made For Selected Invoice';
            $this->Session->write('bmsg', $message);
            $this->redirect(array('controller' => 'Stocks', 'action' => 'supListSuppliersInvoicesDetails', $invoice_no, $supplier_id));
        }
    }

    public function supPaySupplier($invId = null, $supId = null, $Invoice_cost = null) {
        $this->__validateUserType();
        $data = $this->paginate('Supplierinvoice');
        $this->set('suppliers', $this->Supplier->find('list'));

        $supinvoice = $this->Supplierinvoice->find('first', array('conditions' => array('Supplierinvoice.supply_invoiceno' => $invId)));

        if ($supinvoice) {
            if ($supinvoice['Supplierinvoice']['balance'] <= 0) {

                $message = 'Full Payment Made For This Supplier!!!';
                $this->Session->write('bmsg', $message);
            }
            $this->set('supinvoice', $supinvoice);
        }
        if ($supId == null || $supId == "") {

            $supId = '--Please Select a Supplier--';
            $this->set('supplier_id', "");
        } else {
            $this->set('supplier_id', $supId);
        }
        $this->set("invoice_no", $invId);
        $this->set('supId', $supId);
        $this->set('Invoice_cost', $Invoice_cost);
    }

    function makeSupPayment() {

        $this->autoRender = false;
        if ($this->request->is('post')) {
            $balance;
            $total_paid;
            $cost_price;
            $old_total_paid;
            $old_balance;
            $payment;
            $order_id;
            $cheque_numbers = "";
            $new_cheque_numbers = "";
            $payment = 0;
            $invoice_id = $_POST['hid_orderid'];
            $invoice_no = $_POST['hid_invoiceno'];
            $cost_price = $_POST['hid_cost_price'];
            $supplier_id = $_POST['hid_supplierid'];
            if ($this->request->data['SupplyPayment']['payment_mode'] == "" || $this->request->data['SupplyPayment']['payment_mode'] == null) {
                $message = 'Please Select A Mode of Payment.';
                $this->Session->write('emsg', $message);
                $this->redirect(array('controller' => 'Stocks', 'action' => 'supPaySupplier', $invoice_no, $supplier_id, $cost_price));
            }
            if ($this->request->data['SupplyPayment']['supplier_id'] == "" || $this->request->data['SupplyPayment']['supplier_id'] == null) {
                $message = 'Please Select A Supplier.';
                $this->Session->write('emsg', $message);
                $this->redirect(array('controller' => 'Stocks', 'action' => 'supPaySupplier', $invoice_no, $supplier_id, $cost_price));
            }
            if (isset($this->request->data['SupplyPayment']['cheque_nos'])) {
                if ($this->request->data['SupplyPayment']['payment_mode'] == "Post-dated chq" && ($this->request->data['SupplyPayment']['cheque_nos'] == "" || $this->request->data['SupplyPayment']['cheque_nos'] == null )) {
                    $message = 'Please Select A Cheque No.';
                    $this->Session->write('emsg', $message);
                    $this->redirect(array('controller' => 'Stocks', 'action' => 'supPaySupplier', $invoice_no, $supplier_id, $cost_price));
                }
            } else {
                if ($this->request->data['SupplyPayment']['payment_mode'] == "Post-dated chq") {
                    $message = 'Please Select A Different Payment Mode.No Post-date Chqs Available';
                    $this->Session->write('emsg', $message);
                    $this->redirect(array('controller' => 'Stocks', 'action' => 'supPaySupplier', $invoice_no, $supplier_id, $cost_price));
                }
            }

            if ($this->request->data['SupplyPayment']['payment_mode'] == "Cheque" && ($this->request->data['SupplyPayment']['used_chequenos'] == "" || $this->request->data['SupplyPayment']['used_chequenos'] == null )) {
                $message = 'Please State A Cheque No.';
                $this->Session->write('emsg', $message);
                $this->redirect(array('controller' => 'Stocks', 'action' => 'supPaySupplier', $invoice_no, $supplier_id, $cost_price));
            }

            if ($this->request->data['SupplyPayment']['amount'] == "" || $this->request->data['SupplyPayment']['amount'] == null || $this->request->data['SupplyPayment']['amount'] == 0) {
                $message = 'Amount Not Entered.';
                $this->Session->write('emsg', $message);
                $this->redirect(array('controller' => 'Stocks', 'action' => 'supPaySupplier', $invoice_no, $supplier_id, $cost_price));
            }

            if (isset($this->request->data['SupplyPayment']['used_chequenos'])) {
                if ($this->request->data['SupplyPayment']['used_chequenos'] != "" || $this->request->data['SupplyPayment']['used_chequenos'] != null) {
                    $cheque_numbers = $this->request->data['SupplyPayment']['used_chequenos'];
                }
            }

            if (isset($this->request->data['SupplyPayment']['cheque_nos'])) {
                if ($this->request->data['SupplyPayment']['cheque_nos'] != "" || $this->request->data['SupplyPayment']['cheque_nos'] != null) {
                    $cheque_numbers = $this->request->data['SupplyPayment']['cheque_nos'];
                    $this->request->data['SupplyPayment']['used_chequenos'] = $cheque_numbers;
                }
            }

            $payment_day = $this->request->data['SupplyPayment']['supply_date']['day'];
            $payment_month = $this->request->data['SupplyPayment']['supply_date']['month'];
            $payment_year = $this->request->data['SupplyPayment']['supply_date']['year'];
            $fpayment_date = $payment_year . "-" . $payment_month . "-" . $payment_day;
            $spayment_date = strtotime($fpayment_date);
            $payment_date = date('Y-m-d', $spayment_date);

            $last_disb_date_day = $this->request->data['SupplyPayment']['payment_date']['day'];
            $last_disb_date_month = $this->request->data['SupplyPayment']['payment_date']['month'];
            $last_disb_date_year = $this->request->data['SupplyPayment']['payment_date']['year'];
            $flsd_date = $last_disb_date_year . "-" . $last_disb_date_month . "-" . $last_disb_date_day;
            $slsd_date = strtotime($flsd_date);
            $lsd_date = date('Y-m-d', $slsd_date);

            $this->request->data['SupplyPayment']['supplier_id'] = $supplier_id;
            $payment += $this->request->data['SupplyPayment']['amount'];
            $sms_amount = $this->request->data['SupplyPayment']['amount'];
            $payment_mode = $this->request->data['SupplyPayment']['payment_mode'];



            $balance = 0;
            $total_paid = 0;

            $old_total_paid = 0;
            $old_balance = 0;

            $check = $this->Session->check('userInfo');
            if ($check) {
                $userid = $this->Session->read('userInfo');
                $this->request->data['SupplyPayment']['user_id'] = $userid['User']['id'];
            }
            $this->request->data['SupplyPayment']['supply_invoiceno'] = $invoice_no;
            $this->request->data['SupplyPayment']['payment_date'] = $lsd_date;
            $date = date('Y-m-d H:i:s');
            //use id to retrieve order info
            $invoice_details = $this->Supplierinvoice->find('first', array('conditions' => array('Supplierinvoice.id' => $invoice_id)));

            if ($invoice_details) {


                $old_balance = $invoice_details['Supplierinvoice']['balance'];
                $old_total_paid = $invoice_details['Supplierinvoice']['amountpaid'];
                $cost_price = $invoice_details['Supplierinvoice']['cost_price'];
                //$mthly_installmt = $order_details['Supplierinvoice']['mthly_install'];
                //$expecteddiff = $order_details['Order']['differencefrmexpected'];
                //$interest_accrued = $order_details['Order']['interest_accrued'];
                // $zone_id = $order_details['Order']['zone_id'];
                $supply_date = $invoice_details['Supplierinvoice']['supply_date'];
                $last_disb_date = $invoice_details['Supplierinvoice']['last_disb_date'];
                $supplier = $invoice_details['Supplierinvoice']['supplier_id'];
                $invoice_no = $invoice_details['Supplierinvoice']['supply_invoiceno'];
                $old_cheque_numbers = $invoice_details['Supplierinvoice']['cheque_nos'];
                $old_usedchequenos = $invoice_details['Supplierinvoice']['used_chequenos'];

//                    if (isset($this->request->data['SupplyPayment']['used_chequenos'])) {
//                        if ($this->request->data['SupplyPayment']['used_chequenos'] != "" || $this->request->data['SupplyPayment']['used_chequenos'] != null) {
//                            $cheque_numbers = $this->request->data['SupplyPayment']['used_chequenos'];
//
//                            if ($old_cheque_numbers != null || $old_cheque_numbers != "") {
//                                $cheque_arrays = explode(",", $old_cheque_numbers);
//                                if (!empty($cheque_arrays)) {
//                                    foreach ($cheque_arrays as $key => $value) {
//                                        if ($value == $cheque_numbers) {
//                                            if ($old_usedchequenos != null || $old_usedchequenos != "") {
//                                                $old_usedchequenos .= "," . $value;
//                                            } else {
//                                                $old_usedchequenos = $value;
//                                            }
//
//                                            unset($cheque_arrays[$key]);
//                                        }
//                                    }
//                                    $old_cheque_numbers = implode(",", $cheque_arrays);
//                                }
//                            }
//                        }
//                    }



                $this->request->data['SupplyPayment']['supplierinvoice_id'] = $invoice_id;
                $save_payment = $this->request->data['SupplyPayment']['amount'];

                $total_paid = $old_total_paid + $payment;
                $balance = $cost_price - $total_paid;

                switch ($balance) {
                    case 0:
                        $payment_status = "full_payment";
//                    $tdate = date('Y-m-d H:i:s', $spayment_date);
//                    $todate = new DateTime($tdate);
                        break;
                    case $cost_price:
                        $payment_status = "no_payment";
//                    $tdate = date('Y-m-d H:i:s', $spayment_date);
//                    $todate = new DateTime($tdate);
//                    $todate->add(new DateInterval('P1M'));
                        break;
                    default:
                        $payment_status = "part_payment";
//                    $tdate = $order_details['Order']['due_date'];
//                    $todate = new DateTime($tdate);
//                    $todate->add(new DateInterval('P1M'));

                        break;
                }
                if ($balance <= 0) {
                    $payment_status = "full_payment";
                    $payment_finish_date = $lsd_date;
                } else {
                    $payment_finish_date = null;
                }

                if ($save_payment == 0 || $save_payment == "") {
                    $message = "No Payment Made";
                    $this->Session->write('emsg', $message);

                    $this->redirect(array('controller' => 'Stocks', 'action' => 'supPaySupplier', $invoice_no, $supplier_id, $cost_price));
                }
//                    if ($old_balance == $cost_price) {
//
//
//
//                        $approval = array('id' => $invoice_id, 'amountpaid' => $total_paid, 'supply_date' => $payment_date, 'supply_invoiceno' => $invoice_no, 'supplier_id' => $supplier_id, 'cost_price' => $cost_price,  'balance' => $balance, 'payment_status' => $payment_status, 'first_date' => $lsd_date, 'last_disb_date' => $lsd_date, 'payment_finish_date' => $payment_finish_date);
//                        
//                         print_r('me1');
//                                exit;
//                    } else {
                switch ($payment_status) {
                    case "full_payment":

                        $approval = array('id' => $invoice_id, 'amountpaid' => $total_paid, 'supply_date' => $payment_date, 'supplier_id' => $supplier_id, 'balance' => $balance, 'payment_status' => $payment_status, 'last_disb_date' => $lsd_date, 'payment_finish_date' => $payment_finish_date);

//                                 print_r('me2');
//                                exit;

                        break;

                    default:
                        $approval = array('id' => $invoice_id, 'amountpaid' => $total_paid, 'supply_date' => $payment_date, 'supplier_id' => $supplier_id, 'balance' => $balance, 'payment_status' => $payment_status, 'last_disb_date' => $lsd_date);


                        break;
                    //}
                }

                $result = $this->Supplierinvoice->save($approval);

                $result2 = $this->SupplyPayment->save($this->request->data);

                if ($result && $result2) {
                    $balSheet = array('description' => 'Note Payable', 'cash' => '-' . $sms_amount, 'acc_payable_creditors' => '-' . $sms_amount, 'date' => $lsd_date);

                    $inStatment = array('description' => 'Cost of Sales', 'expenditure' => $sms_amount, 'date' => $lsd_date);

                    $this->BalanceSheet->save($balSheet);
                    $this->IncomeStatement->save($inStatment);

                    $supplier_data = $this->Supplier->find('first', array('conditions' => array('Supplier.id' => $supplier_id)));
//                    if ($supplier_data) {
//                        $cell_number = $supplier_data['Supplier']['supplier_tel'];
//                        $fullname = $supplier_data['Supplier']['supplier_name'];
//                        if ($cell_number != "" && $cell_number != null) {
//
//                            $msg = "Dear " . $fullname . ", an amount of GHC" . round($sms_amount) .
//                                    " has been paid into your account by Ultimate Credit Solutions Ltd. Thank you.";
//
//                            $msgresult = $this->Message->sendSMS($msg, $cell_number);
//                        }
//                    }
                    $this->request->data = null;
                    $message = "Payment successful";
                    $this->Session->write('smsg', $message);
                }
            } else {
                //Insert
//                    if (isset($this->request->data['SupplyPayment']['used_chequenos'])) {
//                        if ($this->request->data['SupplyPayment']['used_chequenos'] != "" || $this->request->data['SupplyPayment']['used_chequenos'] != null) {
//                            $cheque_numbers = $this->request->data['SupplyPayment']['used_chequenos'];
//
//                           
//                        }
//                    }


                if ($payment == 0 || $payment == "") {
                    $message = "No Payment Made";
                    $this->Session->write('emsg', $message);

                    $this->redirect(array('controller' => 'Stocks', 'action' => 'supPaySupplier', $invoice_no, $supplier_id, $cost_price));
                }

                $this->request->data['SupplyPayment']['supplierinvoice_id'] = $invoice_id;
                $balance = $cost_price - $payment;


                switch ($balance) {
                    case 0:
                        $payment_status = "full_payment";
//                    $tdate = date('Y-m-d H:i:s', $spayment_date);
//                    $todate = new DateTime($tdate);
                        break;
                    case $cost_price:
                        $payment_status = "no_payment";
//                    $tdate = date('Y-m-d H:i:s', $spayment_date);
//                    $todate = new DateTime($tdate);
//                    $todate->add(new DateInterval('P1M'));
                        break;
                    default:
                        $payment_status = "part_payment";
//                    $tdate = $order_details['Order']['due_date'];
//                    $todate = new DateTime($tdate);
//                    $todate->add(new DateInterval('P1M'));

                        break;
                }
                if ($balance <= 0) {
                    $payment_status = "full_payment";
                    $payment_finish_date = $lsd_date;
                } else {
                    $payment_finish_date = null;
                }




                $approval = array('id' => $invoice_id, 'amountpaid' => $payment, 'supply_date' => $payment_date, 'supply_invoiceno' => $invoice_no, 'supplier_id' => $supplier_id, 'cost_price' => $cost_price, 'balance' => $balance, 'payment_status' => $payment_status, 'first_date' => $lsd_date, 'last_disb_date' => $lsd_date, 'payment_finish_date' => $payment_finish_date);

                $result = $this->Supplierinvoice->save($approval);

                $result2 = $this->SupplyPayment->save($this->request->data);


                if ($result && $result2) {
                    if ($spayment_date == $slsd_date) {
                        $balSheet = array('description' => 'Supply', 'cash' => '-' . $sms_amount, 'acc_payable_creditors' => '-' . $sms_amount, 'date' => $payment_date);
                    } elseif ($slsd_date > $spayment_date) {
                        $balSheet = array('description' => 'Note Payable', 'cash' => '-' . $sms_amount, 'acc_payable_creditors' => '-' . $sms_amount, 'date' => $lsd_date);
                    } else {
                        $balSheet = array('description' => 'Supply', 'cash' => '-' . $sms_amount, 'acc_payable_creditors' => '-' . $sms_amount, 'date' => $payment_date);
                    }


                    $this->BalanceSheet->save($balSheet);
                    $inStatment = array('description' => 'Cost of Sales', 'expenditure' => $sms_amount, 'date' => $payment_date);
                    $this->IncomeStatement->save($inStatment);

                    $invoice_id = $result['Supplierinvoice']['id'];
                    $payment_id = $result2['SupplyPayment']['id'];
                    $resaveExp = array('id' => $payment_id, 'supplierinvoice_id' => $invoice_id);
//                
                    $this->SupplyPayment->save($resaveExp);

                    $supplier_data = $this->Supplier->find('first', array('conditions' => array('Supplier.id' => $supplier_id)));
//                    if ($supplier_data) {
//                        $cell_number = $supplier_data['Supplier']['supplier_tel'];
//                        $fullname = $supplier_data['Supplier']['supplier_name'];
//                        if ($cell_number != "" && $cell_number != null) {
//
//                            $msg = "Dear " . $fullname . ", an amount of GHC" . round($sms_amount) .
//                                    " has been paid into your account by Ultimate Credit Solutions Ltd. Thank you.";
//
//                            $msgresult = $this->Message->sendSMS($msg, $cell_number);
//                        }
//                    }
                    $this->request->data = null;
                    $message = "Payment successful";
                    $this->Session->write('smsg', $message);
                }
            }

            $check = $this->Session->check('payment_receipt');
            if ($check) {
                $this->Session->delete('payment_receipt');
            }
            $check = $this->Session->check('receipt_items');
            if ($check) {
                $this->Session->delete('receipt_items');
            }

            $this->redirect(array('controller' => 'Stocks', 'action' => 'supListSuppliersInvoices', $supplier_id));
        }
    }

    function productTransfers() {

        $this->set('warehouses', $this->Warehouse->find('list'));
        $this->set('users', $this->User->find('list', array('conditions' => array('User.usertype_id = ? OR ? OR ?' => array(1, 4, 6)))));
        $this->set('items', $this->Item->find('list', array(
                    'conditions' => array('Item.item !=' => '', 'Item.item !=' => null, 'Item.delete_status !=' => 'deleted')
        )));

        $data = $this->paginate('WarehouseTransfer', array(
            'WarehouseTransfer.delivery_status !=' => 'Yes',
            'WarehouseTransfer.delete_status' => 'alive', 'WarehouseTransfer.request_status' =>
            array('approved', 'part_supplied')));

        $this->set('data', $data);


        if ($this->Session->check('userDetails')) {
            $user_id = $this->Session->read('userDetails.id');
            $user_zone = $this->Session->read('userDetails.zone_id');
            $this->set('user_warehs', $this->Zone->find('first', array('fields' => array('Zone.warehouse_id'), 'conditions' => array('Zone.id ' => $user_zone), 'recursive' => -1)));
        }


        if ($this->request->is('post')) {
            $user_id = null;
            if ($this->Session->check('userDetails')) {
                $user_id = $this->Session->read('userDetails.id');
            }

            $request_warehs_name = "";
            $supply_warehs_name = "";
            $request_warehs_id = $this->request->data['ProductTransfers']['warehouse_id'];
            $supply_warehs_id = $this->request->data['ProductTransfers']['warehouse'];

            $supply_warehs_data = $this->Warehouse->find('first', array('recursive' => -1,
                'conditions' => array('Warehouse.id' => $supply_warehs_id)));
            $request_warehs_data = $this->Warehouse->find('first', array('recursive' => -1,
                'conditions' => array('Warehouse.id' => $request_warehs_id)));

            if ($request_warehs_data) {
                $request_warehs_name = $request_warehs_data['Warehouse']['warehouse'];
            }
            if ($supply_warehs_data) {
                $supply_warehs_name = $supply_warehs_data['Warehouse']['warehouse'];
            }


            $total_items = $this->request->data['ProductTransfers']['requested_quantity'];
            $item_id = $this->request->data['ProductTransfers']['item_id'];
            $request_date = date('Y-m-d');
            $transfer_array = array('item_id' => $item_id, 'user_id' => $user_id, 'request_warehouse_name' => $request_warehs_name
                , 'request_warehs_id' => $request_warehs_id, 'warehouse_id' => $supply_warehs_id,
                'source_warehouse_name' => $supply_warehs_name, 'total_items' => $total_items, 'request_date' => $request_date);

            $result = $this->WarehouseTransfer->save($transfer_array);

            if ($result) {
//               pr($result);exit;
                $message = 'Products request successfully saved';
                $this->Session->write('smsg', $message);
                $this->redirect(array('controller' => 'Stocks', 'action' => 'productTransfers'));
            } else {
                $message = 'Products request unsuccessful. Please try again';
                $this->Session->write('bmsg', $message);
                $this->redirect(array('controller' => 'Stocks', 'action' => 'productTransfers'));
            }
        }
    }

    function productTransfersApprove() {
        $this->__validateUserType2();
        if ($this->Session->check('userDetails')) {
            $user_type = $this->Session->read('userDetails.usertype_id');
        }
        if ($this->Session->check('warehouse_id')) {
            $warehouse_id = $this->Session->read('warehouse_id');
//            $warehouse_id = $userInfo['Zone']['warehouse_id'];
        }
        if ($user_type == 1 || $user_type == 7 || $user_type == 10) {
            $data = $this->paginate('WarehouseTransfer', array('WarehouseTransfer.request_status' => 'pending'));
        } elseif ($user_type == 8) {
            $data = $this->paginate('WarehouseTransfer', array('WarehouseTransfer.request_status' => 'pending', 'WarehouseTransfer.warehouse_id' => $warehouse_id));
        }
        $this->set('data', $data);
        $this->set('warehouses', $this->Warehouse->find('list'));

        $this->set('users', $this->User->find('list'));
    }

    function productTransfersApprove1($id = null) {
        $warehs_item_data = array();
        $data = $this->WarehouseTransfer->find('first', array('conditions' => array('WarehouseTransfer.id' => $id)));
        if ($data) {
            $item_id = $data['WarehouseTransfer']['item_id'];
            $warehs_id = $data['WarehouseTransfer']['warehouse_id'];
            $warehs_item_data = $this->WarehouseItem->find('first', array(
                'conditions' => array('WarehouseItem.item_id' => $item_id,
                    'WarehouseItem.warehouse_id' => $warehs_id)));
            if ($warehs_item_data) {
                $this->set('warehs_data', $warehs_item_data);
            }
        }
        $this->set('data', $data);
        $this->set('users', $this->User->find('list', array('conditions' => array('User.usertype_id = ? OR ? OR ?' => array(1, 4, 6)))));
        $this->set('items', $this->Item->find('list', array('conditions' => array('AND' => array(array('Item.item !=' => ''), array('Item.item !=' => null)), 'Item.delete_status !=' => 'deleted'))));
        if ($this->request->is('post')) {
            $transfer_id = $this->request->data['ProductTransfersApprove']['id'];
            $quantity_supplied = $this->request->data['ProductTransfersApprove']['total_supplied'];
            $rem_quantity = $this->request->data['ProductTransfersApprove']['rem_quantity'];

            $itm_id = $this->request->data['ProductTransfersApprove']['item_id2'];
            $supply_warehs_id = $this->request->data['ProductTransfersApprove']['warehs_id'];
            $warehsitem_data = $this->WarehouseItem->find('first', array(
                'conditions' => array('WarehouseItem.item_id' => $itm_id,
                    'WarehouseItem.warehouse_id' => $supply_warehs_id), 'recursive' => -1));
            if (isset($this->request->data['ProductTransfersApprove']['Approve'])) {
                $status = 'approved';
                if ($quantity_supplied > $rem_quantity) {
                    $message = 'Supply quantity cannot be more than warehouse quantity. Please try again';
                    $this->Session->write('imsg', $message);
                    $this->redirect(array('controller' => 'Stocks', 'action' => 'productTransfersApprove1', $transfer_id));
                }
            } elseif (isset($this->request->data['ProductTransfersApprove']['Reject'])) {
                $status = 'rejected';
            }
            $update_array = array('id' => $transfer_id, 'request_status' => $status, 'total_supplied' => $quantity_supplied);
            $result = $this->WarehouseTransfer->save($update_array);
            if ($result) {
                if ($warehsitem_data) {
                    $wh_id = $warehsitem_data['WarehouseItem']['id'];
                    $warehs_quantity = $warehsitem_data['WarehouseItem']['remaining_quantity'];
                    $updated_quantity = $warehs_quantity - $quantity_supplied;
                    $warehs_itm_data = array('id' => $wh_id, 'remaining_quantity' => $updated_quantity);
                    $this->WarehouseItem->save($warehs_itm_data);
                }
                $message = 'Products request successfully processed';
                $this->Session->write('smsg', $message);
                $this->redirect(array('controller' => 'Stocks', 'action' => 'productTransfersApprove'));
            } else {
                $message = 'Transfer processing unsuccessful. Please try again';
                $this->Session->write('bmsg', $message);
                $this->redirect(array('controller' => 'Stocks', 'action' => 'productTransfersApprove1', $transfer_id));
            }
        }
    }

    function confirmDelivery() {
        $this->autoRender = $this->autoLayout = false;
        if ($this->request->is('post')) {
            if (!empty($this->request->data['ConfirmDelivery'])) {
                $data = $this->WarehouseTransfer->find('all', array('conditions' => array(
                        'WarehouseTransfer.delivery_status !=' => 'Yes',
                        'WarehouseTransfer.delete_status !=' => 'deleted', 'WarehouseTransfer.request_status' =>
                        array('approved', 'part_supplied'))));

                if ($data) {
                    foreach ($data as $val) {
                        if (isset($this->request->data['ConfirmDelivery']['delivery_status' . $val['WarehouseTransfer']['id']]) && $this->request->data['ConfirmDelivery']['delivery_status' . $val['WarehouseTransfer']['id']] == 'Yes') {
                            $itm_id = $val['WarehouseTransfer']['item_id'];
                            $supplier_id = $val['Item']['supplier_id'];
                            $request_warehs_id = $val['WarehouseTransfer']['request_warehs_id'];
                            $quantity_supplied = $val['WarehouseTransfer']['total_supplied'];
                            $warehsitem_data = $this->WarehouseItem->find('first', array(
                                'conditions' => array('WarehouseItem.item_id' => $itm_id,
                                    'WarehouseItem.warehouse_id' => $request_warehs_id), 'recursive' => -1));
                            if ($warehsitem_data) {
                                $wh_id = $warehsitem_data['WarehouseItem']['id'];
                                $warehs_quantity = $warehsitem_data['WarehouseItem']['original_quantity'];
                                $warehs_originalquant = $warehsitem_data['WarehouseItem']['remaining_quantity'];
                                $updated_quantity = $warehs_quantity + $quantity_supplied;
                                $updated_original = $warehs_originalquant + $quantity_supplied;
                                $warehs_itm_data = array('id' => $wh_id, 'remaining_quantity' => $updated_quantity, 'original_quantity' => $updated_original);
                                $this->WarehouseItem->save($warehs_itm_data);
                            } else {

                                $item_id = $val['WarehouseTransfer']['item_id'];
                                $updated_quantity = $quantity_supplied;
                                $updated_original = $quantity_supplied;
                                $warehs_itm_data = array('item_id' => $itm_id, 'supplier_id' => $supplier_id, 'warehouse_id' => $request_warehs_id,
                                    'remaining_quantity' => $updated_quantity, 'original_quantity' => $updated_original);
                                $this->WarehouseItem->save($warehs_itm_data);
                            }
                            $update = array('id' => $val['WarehouseTransfer']['id'], 'delivery_status' => 'Yes');
                            $this->WarehouseTransfer->save($update);
                        }
                    }
                    $message = 'Products successfully delivered';
                    $this->Session->write('smsg', $message);
                    $this->redirect(array('controller' => 'Stocks', 'action' => 'productTransfers'));
                } else {
                    $message = 'Transfer delivery confirmation unsuccessful. Please try again';
                    $this->Session->write('bmsg', $message);
                    $this->redirect(array('controller' => 'Stocks', 'action' => 'productTransfers'));
                }
            }
        }
    }

    function productTransfersDelivered() {
        $this->__validateUserType2();

        $data = $this->paginate('WarehouseTransfer', array('WarehouseTransfer.delivery_status' => 'Yes', 'WarehouseTransfer.delete_status !=' => 'deleted'));
        $this->set('data', $data);
    }

    public function delProdTransfer($id = null) {
        $this->__validateUserType();

        if (!empty($id)) {
            $result = $this->WarehouseTransfer->delete($id, false);
            if ($result) {
                $message = 'Tranfer Successfully Deleted';
                $this->Session->write('smsg', $message);
                $this->redirect(array('controller' => 'Stocks', 'action' => 'productTransfersDelivered'));
            } else {
                $message = 'Tranfer Deleted Failure. Try Again Later';
                $this->Session->write('bmsg', $message);
                $this->redirect(array('controller' => 'Stocks', 'action' => 'productTransfersDelivered'));
            }
        }
    }

    public function item_search() {
        $this->autoRender = false;
        if ($this->request->is('ajax')) {
            $item = $_GET['term'];
            //return json_encode(array('me' => $item));
            $products = $this->Item->find('all', array('conditions' => array('OR' => array(array('Item.item LIKE' => "%$item%"), array('Item.modelno LIKE' => "%$item%"), array('Item.serialno LIKE' => "%$item%"), array('Item.brand LIKE' => "%$item%"), array('Item.item_type LIKE' => "%$item%"), array('Item.item_item LIKE' => "%$item%")), 'Item.delete_status !=' => 'deleted')));


            if ($products) {
                $response = array();
                $i = 0;
                foreach ($products as $product) {
                    $response[$i]['id'] = $product['Item']['id'];
                    $response[$i]['item'] = $product['Item']['item'];
                    $response[$i]['serialno'] = $product['Item']['serialno'];
                    $response[$i]['modelno'] = $product['Item']['modelno'];
//                    $response[$i]['warehouse'] = $product['Warehouse']['warehouse'];
                    $i++;
                }
                $response['term'] = $item;
                $response['status'] = "ok";
                return json_encode($response);
            } else {
                $response = array();
                $response['status'] = "fail";

                return json_encode($response);
            }
        }
    }

    function getPrice() {

        if ($this->request->is('ajax')) {
//            Configure::write('debug', 0);
            $this->autoRender = false;
            $this->autoLayout = false;

            if (!empty($_POST['saleId'])) {
                $currency = $this->Session->read('shopCurrency');
                $saleId = $_POST['saleId'];
                $warehs = $_POST['warehouse_id'];
                $salesResult = $this->WarehouseItem->getSale($saleId, $warehs);
                if ($salesResult) {
                    $feedback = array('salesResult' => $salesResult['Item'], 'status' => 'ok', 'currency' => $currency, 'warehs' => $salesResult['WarehouseItem']);
                } else {
                    $feedback = array('status' => 'fail');
                }
                $price = json_encode($feedback);
                return $price;
            }
        }
    }

    public function warehouses($warehouse_id = NULL) {
        $this->__validateUserType();
//        $this->set('warehouses', $this->Warehouse->find('list'));
        $data = $this->paginate('Warehouse', array('Warehouse.deleted' => 0));
        $this->set('data', $data);
        $this->set('regionids', $this->Region->find('list'));


        if ($warehouse_id != null && $warehouse_id != '') {
            $this->set('wh', $this->Warehouse->find('first', ['conditions' => ['Warehouse.id' => $warehouse_id]]));
        } else {

            if ($this->request->is('post')) {

                if (!empty($this->request->data['Warehouse']['id'])) {//edit zone/branch
                    $warehouse_id = $this->request->data['Warehouse']['id'];

                    /* Warehouse photo */
                    if (is_uploaded_file($this->request->data['Warehouse']['warehouse_photo']['tmp_name'])) {
                        $this->request->data['Warehouse']['img_name'] = $this->request->data['Warehouse']['warehouse_photo']['name'];
                        $fileData = fread(
                                fopen($this->request->data['Warehouse']['warehouse_photo']['tmp_name'], "r"), $this->request->data['Warehouse']['warehouse_photo']['size']
                        );
                        $this->request->data['Warehouse']['warehouse_photo'] = $fileData;
                    }
                    /* Warehouse photo end */

//                    $this->Warehouse->delete($warehouse_id, false);
                    $result = $this->Warehouse->save($this->request->data);


                    if ($result) {
                        $this->request->data = null;

                        $message = 'Warehouse Updated';
                        $this->Session->write('smsg', $message);
                        $this->redirect(array('controller' => 'Stocks', 'action' => 'warehouses'));
                    } else {
                        $message = 'Could not update Warehouse';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Stocks', 'action' => 'warehouses'));
                    }
                } else { //new entry
                    /* Warehouse photo */
                    if (is_uploaded_file($this->request->data['Warehouse']['warehouse_photo']['tmp_name'])) {
                        $this->request->data['Warehouse']['img_name'] = $this->request->data['Warehouse']['warehouse_photo']['name'];
                        $fileData = fread(
                                fopen($this->request->data['Warehouse']['warehouse_photo']['tmp_name'], "r"), $this->request->data['Warehouse']['warehouse_photo']['size']
                        );
                        $this->request->data['Warehouse']['warehouse_photo'] = $fileData;
                    }
                    /* Warehouse photo end */

                    $result = $this->Warehouse->save($this->request->data);

                    if ($result) {
                        $this->request->data = null;

                        $message = 'Warehouse successfully added';
                        $this->Session->write('smsg', $message);
                        $this->redirect(array('controller' => 'Stocks', 'action' => 'warehouses'));
                    } else {
                        $message = 'Could not add new Warehouse. Please report to System Administrator';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Stocks', 'action' => 'warehouses'));
                    }
                }
            }
        }
    }

    public function delWarehouse($warehouse_id = null) {
        $this->autoRender = false;

        $main_data = array('id' => $warehouse_id, 'deleted' => 1);

        $result = $this->Warehouse->save($main_data);

        if ($result) {
            $this->request->data = null;
            $message = 'Warehouse successfully deleted';
            $this->Session->write('smsg', $message);
            $this->redirect(array('controller' => 'Stocks', 'action' => 'warehouses'));
        } else {
            $message = 'Could not delete Warehouse. Please report to System Administrator';
            $this->Session->write('emsg', $message);
            $this->redirect(array('controller' => 'Stocks', 'action' => 'warehouses'));
        }
    }

    function addProduct($pro_id = null) {
        $this->__validateUserType();

        $data = $this->paginate('Product', array('Product.deleted' => 0));
        $this->set('data', $data);

        if ($pro_id != null && $pro_id != '') {
            $this->set('ba', $this->Product->find('first', ['conditions' => ['Product.id' => $pro_id]]));
        } else {
            if ($this->request->is('post')) {
                if (!empty($this->request->data['Product']['id'])) {//edit entry
                    if ($this->request->data['Product']['product_id'] == "" || $this->request->data['Product']['product_id'] == null) {
                        $message = 'Please Enter Product Name';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Stocks', 'action' => 'addProduct'));
                    }

                    $product_id = $this->request->data['Product']['id'];
                    $product_details = $this->Product->find('first', array('conditions' => array('Product.id' => $product_id)));
                    $this->request->data['Product']['system'] = $product_details['Product']['system'];

//                    $this->Product->delete($product_id, false);
                    $result = $this->Product->save($this->request->data);


                    if ($result) {
                        $this->request->data = null;

                        $message = 'Product Updated';
                        $this->Session->write('smsg', $message);
                        $this->redirect(array('controller' => 'Stocks', 'action' => 'addProduct'));
                    } else {
                        $message = 'Could not update Product';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Stocks', 'action' => 'addProduct'));
                    }
                } else {//new entry
                    if ($this->request->data['Product']['product_id'] == "" || $this->request->data['Product']['product_id'] == null) {
                        $message = 'Please Enter Product Name';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Stocks', 'action' => 'addProduct'));
                    }
                    $result = $this->Product->save($this->request->data);

                    if ($result) {
                        $this->request->data = null;

                        $message = 'Product successfully added';
                        $this->Session->write('smsg', $message);
                        $this->redirect(array('controller' => 'Stocks', 'action' => 'addProduct'));
                    } else {
                        $message = 'Could not add new Product. Please report to System Administrator';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Stocks', 'action' => 'addProduct'));
                    }
                }
            }
        }
    }

    public function delProduct($product_id = Null) {
        $this->autoRender = false;

        $main_data = array('id' => $product_id, 'deleted' => 1);

        $result = $this->Product->save($main_data);

        if ($result) {
            $this->request->data = null;
            $message = 'Product successfully deleted';
            $this->Session->write('smsg', $message);
            $this->redirect(array('controller' => 'Stocks', 'action' => 'addProduct'));
        } else {
            $message = 'Could not delete Product. Please report to System Administrator';
            $this->Session->write('emsg', $message);
            $this->redirect(array('controller' => 'Stocks', 'action' => 'addProduct'));
        }
    }

    function productLevels($category_id = null) {
        $this->__validateUserType();
//        $this->set('warehouseids', $this->Warehouse->find('list'));
        $this->set('prodids', $this->Product->find('list'));
        $this->warehouse_region();

        $data = $this->paginate('ProductLevel', array('ProductLevel.deleted' => 0));
        $this->set('data', $data);


        if ($category_id != null && $category_id != '') {
            $this->set('prodlev', $this->ProductLevel->find('first', ['conditions' => ['ProductLevel.id' => $category_id]]));
        } else {
            if ($this->request->is('post')) {
                if (!empty($this->request->data['ProductLevel']['id'])) {

                    if ($this->request->data['ProductLevel']['quantity'] == "" || $this->request->data['ProductLevel']['quantity'] == null) {
                        $message = 'Please Enter Product Level Name';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Stocks', 'action' => 'productLevels'));
                    }

                    if ($this->request->data['ProductLevel']['warehouse_id'] == "" || $this->request->data['ProductLevel']['warehouse_id'] == null) {
                        $message = 'Please Select an Warehouse';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Stocks', 'action' => 'productLevels'));
                    }

                    $trans_id = $this->request->data['ProductLevel']['id'];

                    $this->ProductLevel->delete($trans_id, false);
                    $result = $this->ProductLevel->save($this->request->data);


                    if ($result) {
                        $this->request->data = null;

                        $message = 'Product Level Updated';
                        $this->Session->write('smsg', $message);
                        $this->redirect(array('controller' => 'Stocks', 'action' => 'productLevels'));
                    } else {
                        $message = 'Could not update Product Level';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Stocks', 'action' => 'productLevels'));
                    }
                } else {
                    if ($this->request->data['ProductLevel']['quantity'] == "" || $this->request->data['ProductLevel']['quantity'] == null) {
                        $message = 'Please Enter Product Level Name';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Stocks', 'action' => 'productLevels'));
                    }

                    if ($this->request->data['ProductLevel']['warehouse_id'] == "" || $this->request->data['ProductLevel']['warehouse_id'] == null) {
                        $message = 'Please Select an Warehouse';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Stocks', 'action' => 'productLevels'));
                    }
                    $result = $this->ProductLevel->save($this->request->data);

                    if ($result) {
                        $this->request->data = null;

                        $message = 'Product Level successfully added';
                        $this->Session->write('smsg', $message);
                        $this->redirect(array('controller' => 'Stocks', 'action' => 'productLevels'));
                    } else {
                        $message = 'Could not add new Product Level. Please report to System Administrator';
                        $this->Session->write('emsg', $message);
                        $this->redirect(array('controller' => 'Stocks', 'action' => 'productLevels'));
                    }
                }
            }
        }
    }

    function delProductLevel($catID = null) {
        $this->autoRender = $this->autoLayout = false;


        if (!is_null($catID)) {


            // $catID = $_POST['paymentnameId'];
            $result = $this->ProductLevel->delete($catID, false);



            if ($result) {
                $message = 'Product Level Deleted';
                $this->Session->write('smsg', $message);
                $this->redirect(array('controller' => 'Stocks', 'action' => 'productLevels'));
            } else {
                $message = 'Could not Delete Product Level';
                $this->Session->write('bmsg', $message);
                $this->redirect(array('controller' => 'Stocks', 'action' => 'productLevels'));
            }
        }
    }

    public function warehouseListing() {
        $data = $this->paginate('Warehouse', array('Warehouse.deleted' => 0));
        $this->set('data', $data);
    }

    public function warehouseDetails($warehouse_id = null) {
        if (!empty($warehouse_id)) {
            $whse = $this->Warehouse->find('first', array(
                'conditions' => array('Warehouse.id' => $warehouse_id, 'Warehouse.deleted' => 0,)
            ));
            $this->set('whse', $whse);

            /*
              $data = $this->ProductLevel->find('all', array(
              'conditions' => array('ProductLevel.warehouse_id' => $warehouse_id, 'ProductLevel.deleted' => 0,),
              'fields' => array('MAX(ProductLevel.modified) AS qty', 'ProductLevel.quantity', 'Product.product_name', 'ProductLevel.modified', 'ProductLevel.unit'),
              'order' => array('ProductLevel.id' => 'desc'),
              'group' => array('ProductLevel.product_id'),
              )); */

            $options['joins'] = array(
                array('table' => 'product_levels',
                    'alias' => 'ProductLevel2',
                    'type' => 'LEFT',
                    'conditions' => array(
                        'ProductLevel.product_id = ProductLevel2.product_id', 'ProductLevel.modified > ProductLevel2.modified'
                    )
                )
            );
            $options['conditions'] = array('ProductLevel.warehouse_id' => $warehouse_id, 'ProductLevel.deleted' => 0,);

            $options['group'] = array('ProductLevel.product_id');
            
            $data = $this->ProductLevel->find('all', $options);

            $query = "SELECT i1.*
                FROM product_levels AS i1 LEFT JOIN product_levels AS i2
                ON (i1.product_id = i2.product_id AND i1.modified < i2.modified)
                WHERE i2.modified IS NULL";


            $this->set('mydata', $data);
        } else {
            $message = 'No warehouse selected';
            $this->Session->write('emsg', $message);
            $this->redirect(array('controller' => 'Stocks', 'action' => 'warehouseListing'));
        }
    }

    public function findStock() {
        $data = $this->paginate('ProductLevel', array('ProductLevel.deleted' => 0));
        $this->set('data', $data);
    }

}

?>
