<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Suppliers extends MY_Controller
{

    function __construct()
    {
        parent::__construct();

        if (!$this->loggedIn) {
            $this->session->set_userdata('requested_page', $this->uri->uri_string());
            $this->sma->md('login');
        }
        if ($this->Customer || $this->Supplier) {
            $this->session->set_flashdata('warning', lang('access_denied'));
            redirect($_SERVER["HTTP_REFERER"]);
        }
        $this->lang->admin_load('suppliers', $this->Settings->user_language);
        $this->load->library('form_validation');
        $this->load->admin_model('companies_model');
        $this->load->admin_model('purchases_model');
    }

    function index($action = NULL)
    {
        $this->sma->checkPermissions();

        $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        $this->data['action'] = $action;
        $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => '#', 'page' => lang('suppliers')));
        $meta = array('page_title' => lang('suppliers'), 'bc' => $bc);
        $count = $this->companies_model->getUserCount("supplier");
        $this->data['count'] = $count;
        $this->page_construct('suppliers/index', $meta, $this->data);
    }

    function getSuppliers()
    {
        $this->sma->checkPermissions('index');

        $this->load->library('datatables');
        $this->datatables
            ->select("id, company, name, email, phone, city, country, vat_no, gst_no")
            ->from("companies")
            ->where('group_name', 'supplier')
            ->add_column("Actions", "<div class=\"text-center\"><a class=\"tip\" title='" . $this->lang->line("balance") . "' href='" . admin_url('suppliers/balance?supplier=$1') . "'><i class=\"fa fa-money\"></i></a> <a class=\"tip\" title='" . $this->lang->line("list_products") . "' href='" . admin_url('products?supplier=$1') . "'><i class=\"fa fa-list\"></i></a> <a class=\"tip\" title='" . $this->lang->line("list_users") . "' href='" . admin_url('suppliers/users/$1') . "' data-toggle='modal' data-target='#myModal'><i class=\"fa fa-users\"></i></a> <a class=\"tip\" title='" . $this->lang->line("add_user") . "' href='" . admin_url('suppliers/add_user/$1') . "' data-toggle='modal' data-target='#myModal'><i class=\"fa fa-plus-circle\"></i></a> <a class=\"tip\" title='" . $this->lang->line("edit_supplier") . "' href='" . admin_url('suppliers/edit/$1') . "' data-toggle='modal' data-target='#myModal'><i class=\"fa fa-edit\"></i></a> <a href='#' class='tip po' title='<b>" . $this->lang->line("delete_supplier") . "</b>' data-content=\"<p>" . lang('r_u_sure') . "</p><a class='btn btn-danger po-delete' href='" . admin_url('suppliers/delete/$1') . "'>" . lang('i_m_sure') . "</a> <button class='btn po-close'>" . lang('no') . "</button>\"  rel='popover'><i class=\"fa fa-trash-o\"></i></a></div>", "id");
        //->unset_column('id');
        echo $this->datatables->generate();
    }


    function balance($action = NULL)
    {
        $this->sma->checkPermissions();

        $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        $this->data['action'] = $action;
        $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => '#', 'page' => lang('balance')));
        $meta = array('page_title' => lang('balance'), 'bc' => $bc);
        $count = $this->companies_model->getUserCount("supplier");
        $this->data['count'] = $count;
        $this->page_construct('suppliers/balance', $meta, $this->data);
    }

    function getSupplierBalance($supplier)
    {
        $this->sma->checkPermissions('index');
        
        $this->load->library('datatables');
        $this->datatables
            ->select($this->db->dbprefix('companies') . ".id as id, {$this->db->dbprefix('companies')}.company as company, {$this->db->dbprefix('companies')}.name as name, {$this->db->dbprefix('companies')}.email as email, {$this->db->dbprefix('companies')}.phone as phone, {$this->db->dbprefix('companies')}.city as city, {$this->db->dbprefix('companies')}.country as country, (({$this->db->dbprefix('purchases')}.grand_total)-({$this->db->dbprefix('purchases')}.paid)) as balance, (CASE WHEN (({$this->db->dbprefix('purchases')}.grand_total)-({$this->db->dbprefix('purchases')}.paid)) > 0 THEN 'payable' WHEN (({$this->db->dbprefix('purchases')}.grand_total)-({$this->db->dbprefix('purchases')}.paid)) < 0 THEN 'receiveable' ELSE '' END) as balancetype")
            ->from("companies")
            ->join("purchases", "companies.id=purchases.supplier_id", 'left')
            ->where($this->db->dbprefix('companies') .'.group_name', 'supplier')
            ->where($this->db->dbprefix('companies') .'.id', $supplier)
            ->where($this->db->dbprefix('companies') .'.type', "payable")
            ->or_where($this->db->dbprefix('companies') .'.type', "receiveable");
        //->unset_column('id');
        echo $this->datatables->generate();
    }

    function view($id = NULL)
    {
        $this->sma->checkPermissions('index', true);
        $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        $this->data['supplier'] = $this->companies_model->getCompanyByID($id);
        $this->load->view($this->theme.'suppliers/view',$this->data);
    }

    function add()
    {
        $this->sma->checkPermissions(false, true);

        $this->form_validation->set_rules('email', $this->lang->line("email_address"), 'is_unique[companies.email]');

        if ($this->form_validation->run('companies/add') == true) {
            $amount = $this->input->post('opening_balance');
            if($this->input->post('opening_balance') < 0){
                $type = "receiveable";
            }else if($this->input->post('opening_balance') > 0){
                $type = "payable";
            }else{
                $type = null;
                $amount = 0;
            }
            
            $data = array('name' => $this->input->post('name'),
                'email' => $this->input->post('email'),
                'group_id' => '4',
                'group_name' => 'supplier',
                'company' => $this->input->post('company'),
                'address' => $this->input->post('address'),
                'vat_no' => $this->input->post('vat_no'),
                'city' => $this->input->post('city'),
                'state' => $this->input->post('state'),
                'postal_code' => $this->input->post('postal_code'),
                'country' => $this->input->post('country'),
                'phone' => $this->input->post('phone'),
                'cf1' => $this->input->post('cf1'),
                'cf2' => $this->input->post('cf2'),
                'cf3' => $this->input->post('cf3'),
                'cf4' => $this->input->post('cf4'),
                'cf5' => $this->input->post('cf5'),
                'cf6' => $this->input->post('cf6'),
                'gst_no' => $this->input->post('gst_no'),
                'opening_balance' => $amount,
                'type' => $type,
            );
        } elseif ($this->input->post('add_supplier')) {
            $this->session->set_flashdata('error', validation_errors());
            admin_redirect('suppliers');
        }

        if ($this->form_validation->run() == true && $sid = $this->companies_model->addCompany($data)) {
            if($type != null){
                $reference = $this->site->getReference('po');
                $date = date('Y-m-d H:i:s');
                $warehouse_id = 1;
                $supplier_id = $sid;
                $status = "received";
                $shipping = 0;
                $supplier_details = $this->site->getCompanyByID($supplier_id);
                $supplier = $supplier_details->company != '-'  ? $supplier_details->company : $supplier_details->name;
                $note = "";
                $payment_term = null;
                $due_date = $payment_term ? date('Y-m-d', strtotime('+' . $payment_term . ' days', strtotime($date))) : null;

                $total = 0;
                $product_tax = 0;
                $product_discount = 0;
                $i = 1;
                $gst_data = [];
                $total_cgst = $total_sgst = $total_igst = 0;
                for ($r = 0; $r < $i; $r++) {
                    $item_code = "08026190";
                    $item_net_cost = $this->sma->formatDecimal($amount);
                    $unit_cost = $this->sma->formatDecimal($amount);
                    $real_unit_cost = $this->sma->formatDecimal($amount);
                    $item_unit_quantity = 1;
                    $item_option = null;
                    $item_tax_rate = null;
                    $item_discount = null;
                    $item_expiry = null;
                    $supplier_part_no = null;
                    $item_unit = 2;
                    $item_quantity = 1;

                    if (isset($item_code) && isset($real_unit_cost) && isset($unit_cost) && isset($item_quantity)) {
                        $product_details = $this->purchases_model->getProductByCode($item_code);
                        if ($item_expiry) {
                            $today = date('Y-m-d');
                            if ($item_expiry <= $today) {
                                $this->session->set_flashdata('error', lang('product_expiry_date_issue') . ' (' . $product_details->name . ')');
                                redirect($_SERVER["HTTP_REFERER"]);
                            }
                        }
                        // $unit_cost = $real_unit_cost;
                        $pr_discount = $this->site->calculateDiscount($item_discount, $unit_cost);
                        $unit_cost = $this->sma->formatDecimal($unit_cost - $pr_discount);
                        $item_net_cost = $unit_cost;
                        $pr_item_discount = $this->sma->formatDecimal($pr_discount * $item_unit_quantity);
                        $product_discount += $pr_item_discount;
                        $pr_item_tax = $item_tax = 0;
                        $tax = "";

                        if (isset($item_tax_rate) && $item_tax_rate != 0) {

                            $tax_details = $this->site->getTaxRateByID($item_tax_rate);
                            $ctax = $this->site->calculateTax($product_details, $tax_details, $unit_cost);
                            $item_tax = 0;
                            $tax = 0;
                            if ($product_details->tax_method != 1) {
                                $item_net_cost = $unit_cost - $item_tax;
                            }
                            $pr_item_tax = $this->sma->formatDecimal($item_tax * $item_unit_quantity, 4);
                            if ($this->Settings->indian_gst && $gst_data = $this->gst->calculteIndianGST($pr_item_tax, ($this->Settings->state == $supplier_details->state), $tax_details)) {
                                $total_cgst += 0;
                                $total_sgst += 0;
                                $total_igst += 0;
                            }
                        }

                        $product_tax += $pr_item_tax;
                        $subtotal = (($item_net_cost * $item_unit_quantity) + $pr_item_tax);
                        $unit = $this->site->getUnitByID($item_unit);

                        $product = array(
                            'product_id' => $product_details->id,
                            'product_code' => $item_code,
                            'product_name' => $product_details->name,
                            'option_id' => $item_option,
                            'net_unit_cost' => $item_net_cost,
                            'unit_cost' => $this->sma->formatDecimal($item_net_cost + $item_tax),
                            'quantity' => $item_quantity,
                            'product_unit_id' => $item_unit,
                            'product_unit_code' => $unit->code,
                            'unit_quantity' => $item_unit_quantity,
                            'quantity_balance' => $item_quantity,
                            'quantity_received' => $status == 'received' ? $item_quantity : 0,
                            'warehouse_id' => $warehouse_id,
                            'item_tax' => $pr_item_tax,
                            'tax_rate_id' => $item_tax_rate,
                            'tax' => $tax,
                            'discount' => $item_discount,
                            'item_discount' => $pr_item_discount,
                            'subtotal' => $this->sma->formatDecimal($subtotal),
                            'expiry' => $item_expiry,
                            'real_unit_cost' => $real_unit_cost,
                            'date' => date('Y-m-d', strtotime($date)),
                            'status' => $status,
                            'payment_status' => "pending",
                            'supplier_part_no' => $supplier_part_no,
                        );

                        $products[] = ($product + $gst_data);
                        $total += $this->sma->formatDecimal(($item_net_cost * $item_unit_quantity), 4);
                    }
                }
                if (empty($products)) {
                    $this->form_validation->set_rules('product', lang("order_items"), 'required');
                } else {
                    krsort($products);
                }

                $order_discount = $this->site->calculateDiscount($this->input->post('discount'), ($total + $product_tax));
                $total_discount = $this->sma->formatDecimal(($order_discount + $product_discount), 4);
                $order_tax = $this->site->calculateOrderTax($this->input->post('order_tax'), ($total + $product_tax - $order_discount));
                $total_tax = $this->sma->formatDecimal(($product_tax + $order_tax), 4);
                $grand_total = $this->sma->formatDecimal(($total + $total_tax + $this->sma->formatDecimal($shipping) - $order_discount), 4);
                $dataPurchase = array('reference_no' => $reference,
                    'date' => $date,
                    'supplier_id' => $supplier_id,
                    'supplier' => $supplier,
                    'warehouse_id' => $warehouse_id,
                    'note' => $note,
                    'total' => $total,
                    'product_discount' => $product_discount,
                    'order_discount_id' => 0,
                    'order_discount' => $order_discount,
                    'total_discount' => $total_discount,
                    'product_tax' => $product_tax,
                    'order_tax_id' => 0,
                    'order_tax' => $order_tax,
                    'total_tax' => $total_tax,
                    'shipping' => $this->sma->formatDecimal($shipping),
                    'grand_total' => $grand_total,
                    'status' => $status,
                    'created_by' => $this->session->userdata('user_id'),
                    'payment_term' => $payment_term,
                    'due_date' => $due_date,
                    'type' => "opening_balance",
                    'opening_balance_type' => $type,
                );
                if ($this->Settings->indian_gst) {
                    $dataPurchase['cgst'] = $total_cgst;
                    $dataPurchase['sgst'] = $total_sgst;
                    $dataPurchase['igst'] = $total_igst;
                }

                $dataPurchase['attachment'] = "";
                
                if ($this->purchases_model->addPurchase($dataPurchase, $products)) {
                    $this->session->set_userdata('remove_pols', 1);
                    $this->session->set_flashdata('message', $this->lang->line("purchase_added"));
                    // admin_redirect('purchases');
                }
            }
            $this->session->set_flashdata('message', $this->lang->line("supplier_added"));
            $ref = isset($_SERVER["HTTP_REFERER"]) ? explode('?', $_SERVER["HTTP_REFERER"]) : NULL;
            admin_redirect($ref[0] . '?supplier=' . $sid);
        } else {
            $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
            $this->data['modal_js'] = $this->site->modal_js();
            $this->load->view($this->theme . 'suppliers/add', $this->data);
        }
    }

    function edit($id = NULL)
    {
        $this->sma->checkPermissions(false, true);

        if ($this->input->get('id')) {
            $id = $this->input->get('id');
        }

        $company_details = $this->companies_model->getCompanyByID($id);
        if ($this->input->post('email') != $company_details->email) {
            $this->form_validation->set_rules('code', lang("email_address"), 'is_unique[companies.email]');
        }

        if ($this->form_validation->run('companies/add') == true) {
            $data = array('name' => $this->input->post('name'),
                'email' => $this->input->post('email'),
                'group_id' => '4',
                'group_name' => 'supplier',
                'company' => $this->input->post('company'),
                'address' => $this->input->post('address'),
                'vat_no' => $this->input->post('vat_no'),
                'city' => $this->input->post('city'),
                'state' => $this->input->post('state'),
                'postal_code' => $this->input->post('postal_code'),
                'country' => $this->input->post('country'),
                'phone' => $this->input->post('phone'),
                'cf1' => $this->input->post('cf1'),
                'cf2' => $this->input->post('cf2'),
                'cf3' => $this->input->post('cf3'),
                'cf4' => $this->input->post('cf4'),
                'cf5' => $this->input->post('cf5'),
                'cf6' => $this->input->post('cf6'),
                'gst_no' => $this->input->post('gst_no'),
            );
        } elseif ($this->input->post('edit_supplier')) {
            $this->session->set_flashdata('error', validation_errors());
            redirect($_SERVER["HTTP_REFERER"]);
        }

        if ($this->form_validation->run() == true && $this->companies_model->updateCompany($id, $data)) {
            $this->session->set_flashdata('message', $this->lang->line("supplier_updated"));
            redirect($_SERVER["HTTP_REFERER"]);
        } else {
            $this->data['supplier'] = $company_details;
            $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
            $this->data['modal_js'] = $this->site->modal_js();
            $this->load->view($this->theme . 'suppliers/edit', $this->data);
        }
    }

    function users($company_id = NULL)
    {
        $this->sma->checkPermissions(false, true);

        if ($this->input->get('id')) {
            $company_id = $this->input->get('id');
        }


        $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
        $this->data['modal_js'] = $this->site->modal_js();
        $this->data['company'] = $this->companies_model->getCompanyByID($company_id);
        $this->data['users'] = $this->companies_model->getCompanyUsers($company_id);
        $this->load->view($this->theme . 'suppliers/users', $this->data);

    }

    function add_user($company_id = NULL)
    {
        $this->sma->checkPermissions(false, true);

        if ($this->input->get('id')) {
            $company_id = $this->input->get('id');
        }
        $company = $this->companies_model->getCompanyByID($company_id);

        $this->form_validation->set_rules('email', $this->lang->line("email_address"), 'is_unique[users.email]');
        $this->form_validation->set_rules('password', $this->lang->line('password'), 'required|min_length[8]|max_length[20]|matches[password_confirm]');
        $this->form_validation->set_rules('password_confirm', $this->lang->line('confirm_password'), 'required');

        if ($this->form_validation->run('companies/add_user') == true) {
            $active = $this->input->post('status');
            $notify = $this->input->post('notify');
            list($username, $domain) = explode("@", $this->input->post('email'));
            $email = strtolower($this->input->post('email'));
            $password = $this->input->post('password');
            $additional_data = array(
                'first_name' => $this->input->post('first_name'),
                'last_name' => $this->input->post('last_name'),
                'phone' => $this->input->post('phone'),
                'gender' => $this->input->post('gender'),
                'company_id' => $company->id,
                'company' => $company->company,
                'group_id' => 3
            );
            $this->load->library('ion_auth');
        } elseif ($this->input->post('add_user')) {
            $this->session->set_flashdata('error', validation_errors());
            admin_redirect('suppliers');
        }

        if ($this->form_validation->run() == true && $this->ion_auth->register($username, $password, $email, $additional_data, $active, $notify)) {
            $this->session->set_flashdata('message', $this->lang->line("user_added"));
            admin_redirect("suppliers");
        } else {
            $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
            $this->data['modal_js'] = $this->site->modal_js();
            $this->data['company'] = $company;
            $this->load->view($this->theme . 'suppliers/add_user', $this->data);
        }
    }

    function import_csv()
    {
        $this->sma->checkPermissions('add', true);
        $this->load->helper('security');
        $this->form_validation->set_rules('csv_file', $this->lang->line("upload_file"), 'xss_clean');

        if ($this->form_validation->run() == true) {

            if (DEMO) {
                $this->session->set_flashdata('warning', $this->lang->line("disabled_in_demo"));
                redirect($_SERVER["HTTP_REFERER"]);
            }

            if (isset($_FILES["csv_file"])) {

                $this->load->library('upload');

                $config['upload_path'] = 'files/';
                $config['allowed_types'] = 'csv';
                $config['max_size'] = '2000';
                $config['overwrite'] = FALSE;
                $config['encrypt_name'] = TRUE;

                $this->upload->initialize($config);

                if (!$this->upload->do_upload('csv_file')) {

                    $error = $this->upload->display_errors();
                    $this->session->set_flashdata('error', $error);
                    admin_redirect("suppliers");
                }

                $csv = $this->upload->file_name;

                $arrResult = array();
                $handle = fopen("files/" . $csv, "r");
                if ($handle) {
                    while (($row = fgetcsv($handle, 5001, ",")) !== FALSE) {
                        $arrResult[] = $row;
                    }
                    fclose($handle);
                }
                $titles = array_shift($arrResult);
                $rw = 2;
                $updated = '';
                $data = array();
                foreach ($arrResult as $key => $value) {
                    $supplier = [
                        'company'       => isset($value[0]) ? trim($value[0]) : '',
                        'name'          => isset($value[1]) ? trim($value[1]) : '',
                        'email'         => isset($value[2]) ? trim($value[2]) : '',
                        'phone'         => isset($value[3]) ? trim($value[3]) : '',
                        'address'       => isset($value[4]) ? trim($value[4]) : '',
                        'city'          => isset($value[5]) ? trim($value[5]) : '',
                        'state'         => isset($value[6]) ? trim($value[6]) : '',
                        'postal_code'   => isset($value[7]) ? trim($value[7]) : '',
                        'country'       => isset($value[8]) ? trim($value[8]) : '',
                        'vat_no'        => isset($value[9]) ? trim($value[9]) : '',
                        'gst_no'        => isset($value[10]) ? trim($value[10]) : '',
                        'cf1'           => isset($value[11]) ? trim($value[11]) : '',
                        'cf2'           => isset($value[12]) ? trim($value[12]) : '',
                        'cf3'           => isset($value[13]) ? trim($value[13]) : '',
                        'cf4'           => isset($value[14]) ? trim($value[14]) : '',
                        'cf5'           => isset($value[15]) ? trim($value[15]) : '',
                        'cf6'           => isset($value[16]) ? trim($value[16]) : '',
                        'group_id'      => 4,
                        'group_name'    => 'supplier',
                    ];
                    if (empty($supplier['company']) || empty($supplier['name']) || empty($supplier['email'])) {
                        $this->session->set_flashdata('error', lang('company').', '.lang('name').', '.lang('email').' '.lang('are_required'). ' (' . lang('line_no') . ' ' . $rw . ')');
                        admin_redirect("suppliers");
                    } else {
                        if ($this->Settings->indian_gst && empty($supplier['state'])) {
                            $this->session->set_flashdata('error', lang('state').' '.lang('is_required'). ' (' . lang('line_no') . ' ' . $rw . ')');
                            admin_redirect("suppliers");
                        }
                        if ($supplier_details = $this->companies_model->getCompanyByEmail($supplier['email'])) {
                            if ($supplier_details->group_id == 4) {
                                $updated .= '<p>'.lang('supplier_updated').' ('.$supplier['email'].')</p>';
                                $this->companies_model->updateCompany($supplier_details->id, $supplier);
                            }
                        } else {
                            $data[] = $supplier;
                        }
                        $rw++;
                    }
                }

                // $this->sma->print_arrays($data, $updated);
            }

        } elseif ($this->input->post('import')) {
            $this->session->set_flashdata('error', validation_errors());
            admin_redirect('suppliers');
        }

        if ($this->form_validation->run() == true && !empty($data)) {
            if ($this->companies_model->addCompanies($data)) {
                $this->session->set_flashdata('message', $this->lang->line("suppliers_added").$updated);
                admin_redirect('suppliers');
            }
        } else {
            if (isset($data) && empty($data)) {
                if ($updated) {
                    $this->session->set_flashdata('message', $updated);
                } else {
                    $this->session->set_flashdata('warning', lang('data_x_suppliers'));
                }
                admin_redirect('suppliers');
            }

            $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
            $this->data['modal_js'] = $this->site->modal_js();
            $this->load->view($this->theme . 'suppliers/import', $this->data);
        }
    }

    function delete($id = NULL)
    {
        $this->sma->checkPermissions(NULL, TRUE);

        if ($this->input->get('id')) {
            $id = $this->input->get('id');
        }

        if ($this->companies_model->deleteSupplier($id)) {
            $this->sma->send_json(array('error' => 0, 'msg' => lang("supplier_deleted")));
        } else {
            $this->sma->send_json(array('error' => 1, 'msg' => lang("supplier_x_deleted_have_purchases")));
        }
    }

    function suggestions($term = NULL, $limit = NULL)
    {
        // $this->sma->checkPermissions('index');
        if ($this->input->get('term')) {
            $term = $this->input->get('term', TRUE);
        }
        $limit = $this->input->get('limit', TRUE);
        $rows['results'] = $this->companies_model->getSupplierSuggestions($term, $limit);
        $this->sma->send_json($rows);
    }

    function getSupplier($id = NULL)
    {
        // $this->sma->checkPermissions('index');
        $row = $this->companies_model->getCompanyByID($id);
        $this->sma->send_json(array(array('id' => $row->id, 'text' => $row->company)));
    }

    function supplier_actions()
    {
        if (!$this->Owner && !$this->GP['bulk_actions']) {
            $this->session->set_flashdata('warning', lang('access_denied'));
            redirect($_SERVER["HTTP_REFERER"]);
        }

        $this->form_validation->set_rules('form_action', lang("form_action"), 'required');

        if ($this->form_validation->run() == true) {

            if (!empty($_POST['val'])) {
                if ($this->input->post('form_action') == 'delete') {
                    $this->sma->checkPermissions('delete');
                    $error = false;
                    foreach ($_POST['val'] as $id) {
                        if (!$this->companies_model->deleteSupplier($id)) {
                            $error = true;
                        }
                    }
                    if ($error) {
                        $this->session->set_flashdata('warning', lang('suppliers_x_deleted_have_purchases'));
                    } else {
                        $this->session->set_flashdata('message', $this->lang->line("suppliers_deleted"));
                    }
                    redirect($_SERVER["HTTP_REFERER"]);
                }

                if ($this->input->post('form_action') == 'export_excel') {

                    $this->load->library('excel');
                    $this->excel->setActiveSheetIndex(0);
                    $this->excel->getActiveSheet()->setTitle(lang('customer'));
                    $this->excel->getActiveSheet()->SetCellValue('A1', lang('company'));
                    $this->excel->getActiveSheet()->SetCellValue('B1', lang('name'));
                    $this->excel->getActiveSheet()->SetCellValue('C1', lang('email'));
                    $this->excel->getActiveSheet()->SetCellValue('D1', lang('phone'));
                    $this->excel->getActiveSheet()->SetCellValue('E1', lang('address'));
                    $this->excel->getActiveSheet()->SetCellValue('F1', lang('city'));
                    $this->excel->getActiveSheet()->SetCellValue('G1', lang('state'));
                    $this->excel->getActiveSheet()->SetCellValue('H1', lang('postal_code'));
                    $this->excel->getActiveSheet()->SetCellValue('I1', lang('country'));
                    $this->excel->getActiveSheet()->SetCellValue('J1', lang('vat_no'));
                    $this->excel->getActiveSheet()->SetCellValue('K1', lang('gst_no'));
                    $this->excel->getActiveSheet()->SetCellValue('L1', lang('scf1'));
                    $this->excel->getActiveSheet()->SetCellValue('M1', lang('scf2'));
                    $this->excel->getActiveSheet()->SetCellValue('N1', lang('scf3'));
                    $this->excel->getActiveSheet()->SetCellValue('O1', lang('scf4'));
                    $this->excel->getActiveSheet()->SetCellValue('P1', lang('scf5'));
                    $this->excel->getActiveSheet()->SetCellValue('Q1', lang('scf6'));

                    $row = 2;
                    foreach ($_POST['val'] as $id) {
                        $customer = $this->site->getCompanyByID($id);
                        $this->excel->getActiveSheet()->SetCellValue('A' . $row, $customer->company);
                        $this->excel->getActiveSheet()->SetCellValue('B' . $row, $customer->name);
                        $this->excel->getActiveSheet()->SetCellValue('C' . $row, $customer->email);
                        $this->excel->getActiveSheet()->SetCellValue('D' . $row, $customer->phone);
                        $this->excel->getActiveSheet()->SetCellValue('E' . $row, $customer->address);
                        $this->excel->getActiveSheet()->SetCellValue('F' . $row, $customer->city);
                        $this->excel->getActiveSheet()->SetCellValue('G' . $row, $customer->state);
                        $this->excel->getActiveSheet()->SetCellValue('H' . $row, $customer->postal_code);
                        $this->excel->getActiveSheet()->SetCellValue('I' . $row, $customer->country);
                        $this->excel->getActiveSheet()->SetCellValue('J' . $row, $customer->vat_no);
                        $this->excel->getActiveSheet()->SetCellValue('K' . $row, $customer->gst_no);
                        $this->excel->getActiveSheet()->SetCellValue('L' . $row, $customer->cf1);
                        $this->excel->getActiveSheet()->SetCellValue('M' . $row, $customer->cf2);
                        $this->excel->getActiveSheet()->SetCellValue('N' . $row, $customer->cf3);
                        $this->excel->getActiveSheet()->SetCellValue('O' . $row, $customer->cf4);
                        $this->excel->getActiveSheet()->SetCellValue('P' . $row, $customer->cf5);
                        $this->excel->getActiveSheet()->SetCellValue('Q' . $row, $customer->cf6);
                        $row++;
                    }

                    $this->excel->getActiveSheet()->getColumnDimension('A')->setWidth(20);
                    $this->excel->getActiveSheet()->getColumnDimension('B')->setWidth(20);
                    $this->excel->getActiveSheet()->getColumnDimension('C')->setWidth(20);
                    $this->excel->getDefaultStyle()->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
                    $filename = 'suppliers_' . date('Y_m_d_H_i_s');
                    $this->load->helper('excel');
                    create_excel($this->excel, $filename);
                }
            } else {
                $this->session->set_flashdata('error', $this->lang->line("no_supplier_selected"));
                redirect($_SERVER["HTTP_REFERER"]);
            }
        } else {
            $this->session->set_flashdata('error', validation_errors());
            redirect($_SERVER["HTTP_REFERER"]);
        }
    }

}
