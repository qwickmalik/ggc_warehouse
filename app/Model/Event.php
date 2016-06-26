<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
class Event extends AppModel {

    var $name = "Event";
    var $usesTable = "events";
    var $displayField = "event";
     
    var $hasMany = array(
        'MsgTemplate' => array(
            'className' => 'MsgTemplate',
            'foreignKey' => 'event_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
        'Promotion' => array(
            'className' => 'Promotion',
            'foreignKey' => 'event_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
    );
    
    
    
}
?>
