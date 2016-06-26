<?php

class DashboardController extends AppController {

    var $name = 'Dashboard';
    var $uses = array('Dashboard', 'CrmStatus');
    public $components = array('RequestHandler', 'Session', 'Paginator');
    public $helpers = array('Html', 'Form');
    var $paginate = array(
//        'CrmStatus' => array('limit' => 5, 'order' => array('CrmStatus.id' => 'desc'))
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
            $message = 'Not enough privileges to view this resource!!';
            $this->Session->write('bmsg', $message);
            $this->redirect('/Dashboard/');
        }
    }

    function index() {
//        $this->__validateUserType();
        $user = $this->Session->read('userDetails');
        if ($user['usertype_id'] != 1 && $user['usertype_id'] != 3 && $user['usertype_id'] != 4 && $user['usertype_id'] != 8 && $user['usertype_id'] != 6 && $user['usertype_id'] != 7 && $user['usertype_id'] != 9 && $user['usertype_id'] != 10) {
            $this->redirect('/User/logout');
        }
        $this->set(compact('user'));

        $this->Paginator->settings = array('CrmStatus' => array(
            'conditions' => array('CrmStatus.created >' => date('Y-m-d', strtotime("-2 weeks"))),
            'limit' => 5,
            'order' => array('CrmStatus.created' => 'desc')
        ));
        $crm_status = $this->Paginator->paginate('CrmStatus');
        $this->set(compact('crm_status'));
    }

}

?>