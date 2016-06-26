<?php
class Debtor extends AppModel {

    var $name = "Debtor";
    var $usesTable = "debtors";
    
     var $belongsTo = array(
        'Sale' => array(
            'className' => 'Sale',
            'foreignKey' => 'sale_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
          'Customer' => array(
            'className' => 'Customer',
            'foreignKey' => 'customer_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
          )
         );
     
      var $hasMany = array(
        'DebtPayment' => array(
            'className' => 'DebtPayment',
            'foreignKey' => 'debt_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            )
          );
     
    function getCreditor($saleID = 0){
        //select all records from creditors table where balance is greater than zero
        
        $this->id = $saleID;
        $result = $this->find('first',array('conditions' => array('Debtor.id' => $saleID)));
        return $result;
  
    }
}
?>
