<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
class Client extends AppModel {

    var $name = "Client";
    var $usesTable = "clients";
    var $displayField = "client_name";
    
    var $hasMany = array(
//        'Sale' => array(
//            'className' => 'Sale',
//            'foreignKey' => 'client_id',
//            'conditions' => '',
//            'order' => '',
//            'limit' => '',
//            'dependent' => true
//            ),
        'TempSale' => array(
            'className' => 'TempSale',
            'foreignKey' => 'client_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            )
//        ,
//        'SalesItem' => array(
//            'className' => 'SalesItem',
//            'foreignKey' => 'client_id',
//            'conditions' => '',
//            'order' => '',
//            'limit' => '',
//            'dependent' => true
//            )
        );
    
    
    var $belongsTo = array(
        'Zone' => array(
            'className' => 'Zone',
            'foreignKey' => 'zone_id',
            'conditions' => '',
            'order' =>  '',
            'limit' => '',
            'dependent' => true
        ));
   
    
        
    
    
 function getClient(){
        $result = $this->find('all');
        return $result;
    }
    
 function editClient() {
        if (!empty($this->data)) {
            $this->TblClient->updateClient($this->data['TblClient']['id'], $this->data);
            $this->redirect('viewAllClient');
        }
        if (empty($this->data)) {
            $this->data = $this->TblClient->read(null, $id);
        }
    }

    function viewAllClient() {
        $clientList = $this->TblClient->find('all');
        $this->set(compact('clientList'));
    }

    function viewClientDetails($id =0) {
        $condition = array('TblClient.id' => $id);
        $clientInfo = $this->TblClient->find($condition);
        $this->set(compact('clientInfo'));
    }
    
}
?>
