<?php defined('BASEPATH') or exit('No direct script access allowed');

class Db_model extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    public function getLatestSales()
    {
        if ($this->Settings->restrict_user && !$this->Owner && !$this->Admin) {
            $this->db->where('created_by', $this->session->userdata('user_id'));
        }
        $this->db->order_by('id', 'desc');
        $q = $this->db->get("sales", 5);
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
    }

    public function getLastestQuotes()
    {
        if ($this->Settings->restrict_user && !$this->Owner && !$this->Admin) {
            $this->db->where('created_by', $this->session->userdata('user_id'));
        }
        $this->db->order_by('id', 'desc');
        $q = $this->db->get("quotes", 5);
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
    }

    public function getLatestPurchases()
    {
        if ($this->Settings->restrict_user && !$this->Owner && !$this->Admin) {
            $this->db->where('created_by', $this->session->userdata('user_id'));
        }
        $this->db->order_by('id', 'desc');
        $q = $this->db->get("purchases", 5);
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
    }

    public function getLatestTransfers()
    {
        if ($this->Settings->restrict_user && !$this->Owner && !$this->Admin) {
            $this->db->where('created_by', $this->session->userdata('user_id'));
        }
        $this->db->order_by('id', 'desc');
        $q = $this->db->get("transfers", 5);
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
    }

    public function getLatestCustomers()
    {
        $this->db->order_by('id', 'desc');
        $q = $this->db->get_where("companies", array('group_name' => 'customer'), 5);
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
    }

    public function getLatestSuppliers()
    {
        $this->db->order_by('id', 'desc');
        $q = $this->db->get_where("companies", array('group_name' => 'supplier'), 5);
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
    }

    public function getChartData()
    {
        $myQuery = "SELECT S.month,
        COALESCE(S.sales, 0) as sales,
        COALESCE( P.purchases, 0 ) as purchases,
        COALESCE(S.tax1, 0) as tax1,
        COALESCE(S.tax2, 0) as tax2,
        COALESCE( P.ptax, 0 ) as ptax
        FROM (  SELECT  date_format(date, '%Y-%m') Month,
                SUM(total) Sales,
                SUM(product_tax) tax1,
                SUM(order_tax) tax2
                FROM " . $this->db->dbprefix('sales') . "
                WHERE date >= date_sub( now( ) , INTERVAL 12 MONTH )
                GROUP BY date_format(date, '%Y-%m')) S
            LEFT JOIN ( SELECT  date_format(date, '%Y-%m') Month,
                        SUM(product_tax) ptax,
                        SUM(order_tax) otax,
                        SUM(total) purchases
                        FROM " . $this->db->dbprefix('purchases') . "
                        GROUP BY date_format(date, '%Y-%m')) P
            ON S.Month = P.Month
            ORDER BY S.Month";
        $q = $this->db->query($myQuery);
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return FALSE;
    }

    public function getStockValue()
    {
        $q = $this->db->query("SELECT SUM(qty*price) as stock_by_price, SUM(qty*cost) as stock_by_cost
        FROM (
            Select sum(COALESCE(" . $this->db->dbprefix('warehouses_products') . ".quantity, 0)) as qty, price, cost
            FROM " . $this->db->dbprefix('products') . "
            JOIN " . $this->db->dbprefix('warehouses_products') . " ON " . $this->db->dbprefix('warehouses_products') . ".product_id=" . $this->db->dbprefix('products') . ".id
            GROUP BY " . $this->db->dbprefix('warehouses_products') . ".id ) a");
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return FALSE;
    }

    public function getBestSeller($start_date = NULL, $end_date = NULL)
    {
        if (!$start_date) {
            $start_date = date('Y-m-d', strtotime('first day of this month')) . ' 00:00:00';
        }
        if (!$end_date) {
            $end_date = date('Y-m-d', strtotime('last day of this month')) . ' 23:59:59';
        }

        $this->db
            ->select("product_name, product_code")
            ->select_sum('quantity')
            ->from('sale_items')
            ->join('sales', 'sales.id = sale_items.sale_id', 'left')
            ->where('date >=', $start_date)
            ->where('date <', $end_date)
            ->group_by('product_name, product_code')
            ->order_by('sum(quantity)', 'desc')
            ->limit(10);
        $q = $this->db->get();
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return FALSE;
    }

    public function total_products()
    {
        return ($this->db->select('count(id) as total_products')->from('sma_products')->get()->row())->total_products;
    }

    public function total_customers()
    {
        return ($this->db->select('count(id) as total_customers')->from('sma_companies')->where(['group_name' => 'customer'])->get()->row())->total_customers;
    }

    public function total_sales()
    {
        return ($this->db->select('SUM(total) as total_sale')
            ->from('sma_sales')
            ->where(['payment_status' => 'paid', 'MONTH(date)' => date('m'), 'YEAR(date)' => date('Y')])
            ->get()->row())->total_sale;
    }

    public function total_purchases()
    {
        return ($this->db->select('SUM(total) as total_purchases')
            ->from('sma_purchases')
            ->where(['payment_status' => 'paid', 'MONTH(date)' => date('m'), 'YEAR(date)' => date('Y')])
            ->get()->row())->total_purchases;
    }

    public function total_expenses()
    {
        return $this->db->select("expenses.id as id, date, reference, expense_categories.name as category, amount, note, attachment, CONCAT(users.first_name, ' ', users.last_name) as user")
            ->from('sma_expenses as expenses')
            ->join('sma_users as users', 'users.id = expenses.created_by', 'left')
            ->join('sma_expense_categories as expense_categories', 'expense_categories.id = expenses.category_id', 'left')
            ->group_by('expenses.id')
            ->get()
            ->result();
    }

    public function monthly_sale()
    {
        return $this->db->select([
            'DATE_FORMAT(date, "%b") as x',
            'SUM(total) as y'
        ])
            ->from('sma_sales')
            ->where(['payment_status' => 'paid'])
            ->where("YEAR(date)", date('Y'))
            ->group_by("MONTH(date)")
            ->get()->result();
    }

    public function expense_trends_chart()
    {
        $result = $this->db->select('DATE_FORMAT(date, "%b") as month, expense_categories.name as category, SUM(amount) as val')
            ->from('sma_expenses')
            ->join('sma_expense_categories', 'sma_expenses.category_id = sma_expense_categories.id')
            ->group_by(['month', 'category'])
            ->order_by('date', 'ACS')
            ->get()
            ->result();

        return $result;
    }

    public function yearly_sale()
    {
        $currentYear = date('Y');
        $lastYear = $currentYear - 1;
        return $this->db->select("
                DATE_FORMAT(date, '%b') as month, 
                SUM(CASE WHEN YEAR(date) = $lastYear THEN total ELSE 0 END) as last_year_sales,
                SUM(CASE WHEN YEAR(date) = $currentYear THEN total ELSE 0 END) as current_year_sales")
            ->from('sma_sales')
            ->where(['payment_status' => 'paid'])
            ->where_in("YEAR(date)", [$lastYear, $currentYear])
            ->group_by("MONTH(date)")
            ->get()->result();
    }
}
