<?php defined('BASEPATH') or exit('No direct script access allowed');

class Users extends MY_Controller
{
    function __construct()
    {
        parent::__construct();
        if (!$this->loggedIn) {
            admin_redirect('login');
        }
        $this->lang->admin_load('auth', $this->Settings->user_language);
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters($this->config->item('error_start_delimiter', 'ion_auth'), $this->config->item('error_end_delimiter', 'ion_auth'));
        $this->load->admin_model('auth_model');
        $this->load->library('ion_auth');
        $this->load->model('Commons_model');
    }

    function index()
    {
        $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        $meta = [['page_title' => lang('users'), 'bc' => [['link' => base_url(), 'page' => lang('home')], ['link' => '#', 'page' => lang('users')]]]];
        $this->page_construct('users/index', $meta, $this->data);
    }

    function getUsers()
    {
        $branch_id = $this->input->get('bid');
        $data['users'] = $this->db->select('user.*,group.name as group')
            ->from('sma_users as user')
            ->where([true => true])
            ->join('sma_groups as group', 'group.id = user.group_id')
            ->get()
            ->result();
        $data['status'] = !empty($data['users']);
        echo json_encode($data);
    }

    function getBranchUsers()
    {
        $arr['data'] = $this->db->select('user.*,group.name as group')
            ->from('sma_user_branch as branch')
            ->join('sma_users as user', 'branch.user_id = user.id')
            ->join('sma_groups as group', 'user.group_id = group.id')
            ->where(['branch.branch_id' => $this->input->get('bid')])
            ->get()
            ->result();
        $arr['status'] = !empty($arr['data']);
        echo json_encode($arr);
    }

    function get_user()
    {
        $data['user'] = $this->Commons_model->get_row('sma_users', ['id' => $this->input->get('id')]);
        $data['status'] = !empty($data['user']);
        echo json_encode($data);
    }

    function profile($id = NULL)
    {
        if (!$this->ion_auth->logged_in() || !$this->ion_auth->in_group('owner') && $id != $this->session->userdata('user_id')) {
            $this->session->set_flashdata('warning', lang("access_denied"));
            redirect(isset($_SERVER["HTTP_REFERER"]) ? $_SERVER["HTTP_REFERER"] : 'admin');
        }
        if (!$id || empty($id)) {
            admin_redirect('auth');
        }

        $this->data['title'] = lang('profile');

        $user = $this->ion_auth->user($id)->row();
        $groups = $this->ion_auth->groups()->result_array();
        $this->data['user'] = $user;
        $this->data['groups'] = $groups;
        $this->data['billers'] = $this->site->getAllCompanies('biller');
        $this->data['warehouses'] = $this->site->getAllWarehouses();

        $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        $this->data['password'] = array(
            'name' => 'password',
            'id' => 'password',
            'class' => 'form-control',
            'type' => 'password',
            'value' => ''
        );
        $this->data['password_confirm'] = array(
            'name' => 'password_confirm',
            'id' => 'password_confirm',
            'class' => 'form-control',
            'type' => 'password',
            'value' => ''
        );
        $this->data['min_password_length'] = $this->config->item('min_password_length', 'ion_auth');
        $this->data['old_password'] = array(
            'name' => 'old',
            'id' => 'old',
            'class' => 'form-control',
            'type' => 'password',
        );
        $this->data['new_password'] = array(
            'name' => 'new',
            'id' => 'new',
            'type' => 'password',
            'class' => 'form-control',
            'pattern' => '^.{' . $this->data['min_password_length'] . '}.*$',
        );
        $this->data['new_password_confirm'] = array(
            'name' => 'new_confirm',
            'id' => 'new_confirm',
            'type' => 'password',
            'class' => 'form-control',
            'pattern' => '^.{' . $this->data['min_password_length'] . '}.*$',
        );
        $this->data['user_id'] = array(
            'name' => 'user_id',
            'id' => 'user_id',
            'type' => 'hidden',
            'value' => $user->id,
        );

        $this->data['id'] = $id;

        $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => admin_url('auth/users'), 'page' => lang('users')), array('link' => '#', 'page' => lang('profile')));
        $meta = array('page_title' => lang('profile'), 'bc' => $bc);
        $this->page_construct('auth/profile', $meta, $this->data);
    }

    // 9-11-23 Nafees Ahmed
    public function validate_user_form($edit = false)
    {
        $this->form_validation->set_rules('first_name', 'First Name', 'required');
        $this->form_validation->set_rules('last_name', 'Last Name', 'required');
        $this->form_validation->set_rules('phone', 'Phone', 'required');
        $this->form_validation->set_rules('gender', 'Gender', 'required');
        $this->form_validation->set_rules('company', 'Company', 'required');
        $this->form_validation->set_rules('status', 'Status', 'required|in_list[0,1]');
        $this->form_validation->set_rules('group', 'Group', 'required|in_list[1,2,3]');
        // $this->form_validation->set_rules('username', lang("username"), 'trim|is_unique[users.username]|required');
        $this->form_validation->set_rules('username', lang("username"), 'trim|required');
        if (!$edit) {
            $this->form_validation->set_rules('email', lang("email"), 'trim|is_unique[users.email]|required');
            $this->form_validation->set_rules('password', 'Password', 'required');
            $this->form_validation->set_rules('confirm-password', 'Confirm Password', 'required|matches[password]');
        }
        return $this->form_validation->run();
    }

    // create uset
    public function create_user()
    {
        if ($this->validate_user_form()) {
            $username = strtolower($this->input->post('username'));
            $email = strtolower($this->input->post('email'));
            $password = $this->input->post('password');
            $data = [
                'first_name' => $this->input->post('first_name'), 'last_name' => $this->input->post('last_name'),
                'company' => $this->input->post('company'), 'phone' => $this->input->post('phone'),
                'gender' => $this->input->post('gender'), 'group_id' => $this->input->post('group') ? $this->input->post('group') : '3',
            ];
            // $active = $this->input->post('status');
            // 0012 for regitration failed
            echo ($this->ion_auth->register($username, $password, $email, $data, false, false)) ? json_encode(['status' => true]) : json_encode(['status' => false, 'error_code' => "0012"]);
        } else {
            // 0013 for form_validation failed
            echo json_encode(['status' => false, 'error_code' => "0013", 'errors' => $this->form_validation->error_array()]);
        }
    }

    // update user 
    public function update_user()
    {
        if ($this->validate_user_form(true)) {
            echo json_encode([
                'status' => $this->Commons_model->update([
                    'username' => $this->input->post('username'),
                    'company' => $this->input->post('company'),
                    'first_name' => $this->input->post('first_name'),
                    'last_name' => $this->input->post('last_name'),
                    'gender' => $this->input->post('gender'),
                    'phone' => $this->input->post('phone'),
                    'group_id' => $this->input->post('group'),
                    'active' => $this->input->post('status'),
                ], ['id' => $this->input->post('id')], 'sma_users')
            ]);
        } else {
            echo json_encode([
                'status' => false,
                'errors' => $this->form_validation->error_array()
            ]);
        }
    }

    // delete user
    public function delete_user()
    {
        echo json_encode(['status' => $this->auth_model->delete_user($this->input->post('id'))]);
    }

    // update status
    public function update_status()
    {
        echo json_encode([
            'status' => $this->Commons_model->update(['active' => $this->input->post('status') == 1 ? 0 : 1], ['id' => $this->input->post('id')], 'sma_users')
        ]);
    }

    // user Branches
    public function user_branches()
    {
        $data['branches'] = $this->db->select([
            'user.id as user_id',
            'branch.id as branch_id',
            'branch.name as branch_name',
        ])
            ->from('sma_users as user')
            ->join('sma_user_branch as user_branch', 'user.id = user_branch.user_id')
            ->join('sma_branches as branch', 'user_branch.branch_id = branch.id')
            ->where('user.id', $this->input->get('id'))->get()->result();

        $data['status'] = !empty($data['branches']);
        if (!$data['status']) {
            $data['branches'] = $this->Commons_model->get_where('sma_branches', [true => true]);
            $data['user'] = $this->Commons_model->select_row('id,first_name,last_name', 'sma_users', ['id' => $this->input->get('id')]);
        }
        echo json_encode($data);
    }

    // assign branch to user
    public function assign_branch()
    {
        $failed = [];
        foreach ($this->input->post('branch') as $branch) {
            if (!$this->Commons_model->insert([
                'user_id' => $this->input->post('id'),
                'branch_id' => $branch,
                'transfered_by' => $this->user['id'],
                'created_at' => date('Y-m-d H:i:s')
            ], 'sma_user_branch')) {
                $failed[] = $branch;
            }
        }
        echo json_encode([
            'status' => empty($failed)
        ]);
    }
}
