<?php
class Creditor extends AppModel {

    var $name = "Creditor";
    var $usesTable = "creditors";
    
     var $belongsTo = array(
        'Supplier' => array(
            'className' => 'Supplier',
            'foreignKey' => 'supplier_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
            'Item' => array(
                'className' => 'Item',
                'foreignKey' => 'item_id',
                'conditions' => '',
                'order' => '',
                'limit' => '',
                'dependent' => true
                )
         );
     
      var $hasMany = array(
        'CreditPayment' => array(
            'className' => 'CreditPayment',
            'foreignKey' => 'creditor_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
          'Payment' => array(
            'className' => 'Payment',
            'foreignKey' => 'creditor_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            )
          );
     
    function getCreditor($supplier = 0){
        //select all records from creditors table where balance is greater than zero
        
        $this->id = $supplier;
        $result = $this->find('first',array('conditions' => array('Creditor.id' => $supplier)));
        return $result;
  
    }
}
?>
