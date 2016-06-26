<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


class Item extends AppModel {

    var $name = "Item";
    var $usesTable = "items";
//    var $displayField = "item";
     var $virtualFields = array("item"=>"CONCAT(item,' (','Ghc','',selling_price,')')");
    var $displayField = 'item';
    var $actsAs = array('Containable');
    
      var $belongsTo = array(
        'Supplier' => array(
            'className' => 'Supplier',
            'foreignKey' => 'supplier_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            )
          ,
          'Supplierinvoice' => array(
            'className' => 'Supplierinvoice',
            'foreignKey' => 'supply_invoiceno',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            )
          );
    
    var $hasMany = array(
        'TempSale' => array(
            'className' => 'TempSale',
            'foreignKey' => 'item_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'SalesItem' => array(
            'className' => 'SalesItem',
            'foreignKey' => 'item_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'OrdersItem' => array(
            'className' => 'OrdersItem',
            'foreignKey' => 'item_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'WarehouseTransfer' => array(
            'className' => 'WarehouseTransfer',
            'foreignKey' => 'item_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'WarehouseItem' => array(
            'className' => 'WarehouseItem',
            'foreignKey' => 'item_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'Repossession' => array(
            'className' => 'Repossession',
            'foreignKey' => 'item_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'Creditor' => array(
            'className' => 'Creditor',
            'foreignKey' => 'item_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'CreditPayment' => array(
            'className' => 'CreditPayment',
            'foreignKey' => 'item_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'Supplieritem' => array(
            'className' => 'Supplieritem',
            'foreignKey' => 'item_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            )
        );

 function getSales(){
        $result = $this->find('all');
        return $result;
    }
    
 function getSale($saleId = 0){
        $this->id = $saleId;
        $result = $this->find('first',array('conditions' => array('Item.id' => $saleId)));
        return $result;
    }
    
        function import($filename) {
        // to avoid having to tweak the contents of
        // $data you should use your db field name as the heading name
        // eg: Post.id, Post.title, Post.description
 
        // set the filename to read CSV from
        $filename = TMP . 'uploads' . DS . 'Post' . DS . $filename;
         
        // open the file
        $handle = fopen($filename, "r");
         
        // read the 1st row as headings
        $header = fgetcsv($handle);
         
        // create a message container
        $return = array(
            'messages' => array(),
            'errors' => array(),
        );
 
        // read each data row in the file
        while (($row = fgetcsv($handle)) !== FALSE) {
            $i++;
            $data = array();
 
            // for each header field
            foreach ($header as $k=>$head) {
                // get the data field from Model.field
                if (strpos($head,'.')!==false) {
                    $h = explode('.',$head);
                    $data[$h[0]][$h[1]]=(isset($row[$k])) ? $row[$k] : '';
                }
                // get the data field from field
                else {
                    $data['Post'][$head]=(isset($row[$k])) ? $row[$k] : '';
                }
            }
 
            // see if we have an id            
            $id = isset($data['Post']['id']) ? $data['Post']['id'] : 0;
 
            // we have an id, so we update
            if ($id) {
                // there is 2 options here,
                  
                // option 1:
                // load the current row, and merge it with the new data
                //$this->recursive = -1;
                //$post = $this->read(null,$id);
                //$data['Post'] = array_merge($post['Post'],$data['Post']);
                 
                // option 2:
                // set the model id
                $this->id = $id;
            }
             
            // or create a new record
            else {
                $this->create();
            }
             
            // see what we have
            // debug($data);
             
            // validate the row
            $this->set($data);
            if (!$this->validates()) {
                //$this->_flash(,'warning');
                $return['errors'][] = __(sprintf('Post for Row %d failed to validate.',$i), true);
            }
 
            // save the row
            if (!$error && !$this->save($data)) {
                $return['errors'][] = __(sprintf('Post for Row %d failed to save.',$i), true);
            }
 
            // success message!
            if (!$error) {
                $return['messages'][] = __(sprintf('Post for Row %d was saved.',$i), true);
            }
        }
         
        // close the file
        fclose($handle);
         
        // return the messages
        return $return;
         
    }


}
?>
