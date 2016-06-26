<?php

/**
 * Description of Contact Type
 *
 * @author Abdul Malik
 */
class ContactType extends AppModel {
    var $name = "ContactType";
    var $usesTable = "contact_types";
    var $displayField = "contact_type";
    
    
    var $hasMany = array(
        'Customer' => array(
            'className' => 'Customer',
            'foreignKey' => 'contact_type_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
            ),
         
        );
}

?>
