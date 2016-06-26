<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
class Promotion extends AppModel {

    var $name = "Promotion";
    var $usesTable = "promotions";
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
