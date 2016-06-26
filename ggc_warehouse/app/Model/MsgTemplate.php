<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
class MsgTemplate extends AppModel {

    var $name = "MsgTemplate";
    var $usesTable = "msg_templates";
    var $displayField = "subject";
     
    var $belongsTo = array(
        'Event' => array(
            'className' => 'Event',
            'foreignKey' => 'event_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
    );
    
    
    
}
?>
