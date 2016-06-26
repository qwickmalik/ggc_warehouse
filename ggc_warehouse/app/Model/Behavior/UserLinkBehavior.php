<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of UserLinkBehavior
 *
 * @author Brain
 */
class UserLinkBehavior extends ModelBehavior
{
    /**
     * The string to use to retrieve the user id from CakeSession
     *
     * @var string
     */
    var $user_id_key = 'Auth.User.id';

    function setup(&$model, $settings)
    {
        if(isset($settings['user_id_key']))
        {
            $this->user_id_key = $settings['user_id_key'];
        }
    }
    function beforeFind(&$model){
         $this->$model->bindModel(
        array('hasMany' => array(
                'User' => array(
                    'className' => 'User'
                )
            )
        )
    );
    }

    function beforeSave(&$model)
    {
        App::uses('CakeSession', 'Model/Datasource');

        $logged_user_id = CakeSession::read($this->user_id_key);

        if(isset($logged_user_id))
        {
            $this->set_user_on_current_model($model, $logged_user_id);
        }

        return true;
    }

    /**
     * Set the created_by and modified_by user id on the current model
     *
     * @param Model $model
     * @param int $logged_user_id
     * @return void
     */
    private function set_user_on_current_model(&$model, $logged_user_id)
    {
        if(isset($logged_user_id))
        {
            /*
             * Id is not set -> it is a creation
             */
            if($model->hasField('created_by') && (!isset($model->data[$model->alias]['id']) || empty($model->data[$model->alias]['id'])))
            {
                if(!isset($model->data[$model->alias]['created_by']))
                {
                    $model->data[$model->alias]['created_by'] = $logged_user_id;

                    /*
                     * If the save is called with a whitelist, add 'created_by' to the whitelist
                     * in order to have this field saved as well
                     */
                    if(!empty($model->whitelist) && !in_array('created_by', $model->whitelist))
                    {
                        $model->whitelist[] = 'created_by';
                    }
                }
            }

            /*
             * Id is set -> it is an update
             */
            if($model->hasField('modified_by') && isset($model->data[$model->alias]['id']) && !empty($model->data[$model->alias]['id']))
            {
                $model->data[$model->alias]['modified_by'] = $logged_user_id;

                /*
                 * If the save is called with a whitelist, add 'modified_by' to the whitelist
                 * in order to have this field saved as well
                 */
                if(!empty($model->whitelist) && !in_array('modified_by', $model->whitelist))
                {
                    $model->whitelist[] = 'modified_by';
                }
            }
        }
    }
}
?>
