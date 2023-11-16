<?php defined('BASEPATH') or exit('No direct script access allowed');

class Branches extends MY_Controller
{

    public function __construct()
    {
        parent::__construct();

        if (!$this->loggedIn) {
            $this->session->set_userdata('requested_page', $this->uri->uri_string());
            $this->sma->md('login');
        }
        if ($this->Supplier || $this->Customer) {
            $this->session->set_flashdata('warning', lang('access_denied'));
            redirect($_SERVER["HTTP_REFERER"]);
        }
        $this->lang->admin_load('returns', $this->Settings->user_language);
        $this->load->library('form_validation');
        // $this->load->admin_model('returns_model');
        $this->load->model('Commons_model');
        $this->digital_upload_path = 'files/';
        $this->upload_path = 'assets/uploads/';
        $this->thumbs_path = 'assets/uploads/thumbs/';
        $this->image_types = 'gif|jpg|jpeg|png|tif';
        $this->digital_file_types = 'zip|psd|ai|rar|pdf|doc|docx|xls|xlsx|ppt|pptx|gif|jpg|jpeg|png|tif|txt';
        $this->allowed_file_size = '1024';
        $this->data['logo'] = true;
    }

    public function index($warehouse_id = null)
    {
        $this->sma->checkPermissions();

        $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');

        if ($this->Owner || $this->Admin || !$this->session->userdata('warehouse_id')) {
            $this->data['warehouses'] = $this->site->getAllWarehouses();
            $this->data['warehouse_id'] = $warehouse_id;
            $this->data['warehouse'] = $warehouse_id ? $this->site->getWarehouseByID($warehouse_id) : null;
            $this->data['branches'] = $this->Commons_model->get_where("sma_branches", [true => true]);
        } else {
            $this->data['warehouses'] = null;
            $this->data['warehouse_id'] = $this->session->userdata('warehouse_id');
            $this->data['warehouse'] = $this->session->userdata('warehouse_id') ? $this->site->getWarehouseByID($this->session->userdata('warehouse_id')) : null;
        }

        $meta = [
            'page_title' => "Branches",
            'bc' => [['link' => base_url(), 'page' => lang('home')], ['link' => "#", 'page' => "Branches"]]
        ];

        $this->page_construct('branches/index', $meta, $this->data);
    }

    public function get_branches()
    {
        $data['branches'] = $this->Commons_model->get_where('sma_branches', ['active' => 1]);
        $data['status'] = !empty($data['branches']);
        echo json_encode($data);
    }

    public function get_branch()
    {
        echo json_encode([
            'data' => $this->Commons_model->get_row('sma_branches', ['id' => $this->input->get('id')])
        ]);
    }

    private function validate_branch()
    {
        $this->form_validation->set_rules('name', 'Branch Name', 'required');
        $this->form_validation->set_rules('city', 'Branch City', 'required|alpha');
        $this->form_validation->set_rules('state', 'Branch State', 'required|alpha');
        $this->form_validation->set_rules('phone', 'Branch Phone', 'required|numeric');
        $this->form_validation->set_rules('mobile', 'Branch Mobile', 'required|numeric');
        $this->form_validation->set_rules('address', 'Branch Address', 'required');
        return $this->form_validation->run();
    }

    public function update_branch()
    {
        if ($this->validate_branch()) {
            $update = $this->Commons_model->update([
                'name' => $this->input->post('name'),
                'city' => $this->input->post('city'),
                'state' => $this->input->post('state'),
                'phone' => $this->input->post('phone'),
                'mobile' => $this->input->post('mobile'),
                'address' => $this->input->post('address'),
            ], ['id' => $this->input->post('id')], 'sma_branches');

            $arr['status'] = $update;

            if ($update) {
                $arr['data'] = $this->Commons_model->get_where("sma_branches", [true => true]);
            }

            echo json_encode($arr);
        } else {
            echo json_encode([
                'status' => false,
                'error' => $this->form_validation->error_array()
            ]);
        }
    }

    public function add_branch()
    {
        if ($this->validate_branch()) {
            $insert = $this->Commons_model->insert([
                'name' => $this->input->post('name'),
                'city' => $this->input->post('city'),
                'state' => $this->input->post('state'),
                'phone' => $this->input->post('phone'),
                'mobile' => $this->input->post('mobile'),
                'address' => $this->input->post('address'),
            ], 'sma_branches');
            $arr['status'] = $insert;

            if ($insert) {
                $arr['data'] = $this->Commons_model->get_where("sma_branches", [true => true]);
            }

            echo json_encode($arr);
        } else {
            echo json_encode([
                'status' => false,
                'error' => $this->form_validation->error_array()
            ]);
        }
    }

    public function delete_branch()
    {
        echo json_encode([
            'status' => $this->Commons_model->delete_where('sma_branches', ['id' => $this->input->get('id')])
        ]);
    }

    public function manage_branch()
    {
        echo json_encode([
            'status' => $this->Commons_model->update(['active' => $this->input->post('status') == 1 ? 0 : 1], ['id' => $this->input->post('id')], 'sma_branches')
        ]);
    }
}
