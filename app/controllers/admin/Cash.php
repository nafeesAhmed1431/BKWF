<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Cash extends MY_Controller{

    public function __construct()
    {
        parent::__construct();
    }

    public function add()
    {
        $this->page_construct('cash/add_cash');
        // echo "ke hal a theek o na";
    
    }

    public function view()
    {
        echo "let me see";
    }
}