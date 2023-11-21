<?php defined('BASEPATH') or exit('No direct script access allowed');

class Auth extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->library('ion_auth');
        $this->load->library('form_validation');
    }

    // private function is_logged_in()
    // {
    //     return $this->session->userdata('logged_in') ? true : redirect('admin/login');
    // }

    function index()
    {
        return $this->session->userdata('logged_in') ? redirect('admin/dashboard') : redirect('admin/login');
    }

    function login($m = NULL)
    {
        if ($this->form_validation->run('auth/login')) {
            // $remember = (bool)$this->input->post('remember_me');
            $remember = false;
            if ($this->ion_auth->login($this->input->post('username'), $this->input->post('password'), $remember)) {
                echo json_encode([
                    'status' => true,
                    'successUrl' => base_url('admin/dashboard')
                ]);
            } else {
                echo json_encode([
                    'status' => false,
                    'err_code' => 0012,
                    'errors' => $this->ion_auth->messages()
                ]);
            }
        } else {
            echo json_encode([
                'status' => false,
                'err_code' => 0013,
                'errors' => $this->form_validation->error_array()
            ]);
        }
    }
}
