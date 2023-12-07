<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>

<section>
    <div class="tableRow">
        <div class="tableRowItem">
            <div class="tableRowHeading">
                <h2><?= lang('customers'); ?></h2>
            </div>
            <div class="tableRowInput">
                <input type="search" class="customSearchInput" placeholder="Search">
            </div>
            <div class="tableRowBtn">
                <!-- <a href="#" class="ankerBtn">Add Customer</a> -->
                <a class="ankerBtn" href="<?=admin_url('customers/add')?>" data-toggle="modal" data-target="#myModal"><span class="text"> Add Customer</span></a>
            </div>
        </div>
        <div class="tableRowItem">
            <div class="cardTabMenuDivContentItem">
                <table class="table display customer_table" style="width:100%">
                    <thead>
                        <tr>
                            <th><?php echo lang('company'); ?></th>
                            <th><?php echo lang('name'); ?></th>
                            <th><?php echo lang('phone'); ?></th>
                            <th><?php echo lang('price_group'); ?></th>
                            <th><?php echo lang('customer_group'); ?></th>
                            <th>Vat No</th>
                            <th>GST No</th>
                            <th><?php echo lang('actions'); ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- <tr>
                            <td>ALS</td>
                            <td>Qais</td>
                            <td>qais@gmail.com</td>
                            <td>0987654321</td>
                            <td>0.0</td>
                            <td>0.0</td>
                            <td>0987654321</td>
                            <td>
                                <ul class="icon">
                                    <li><a href="#"><img src="<= $assets ?>images/icon/edit.svg" class="svg" alt=""></a></li>
                                    <li><a href="#"><img src="<= $assets ?>images/icon/view.svg" class="svg" alt=""></a></li>
                                    <li><a href="#"><img src="<= $assets ?>images/icon/delete.svg" class="svg" alt=""></a></li>
                                </ul>
                            </td>
                        </tr> -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>


<script>
    let base_url = "<?= base_url() ?>";
    $(document).ready(function() {
        load_customers();
    });

    function load_customers() {
        $.ajax({
            url: `${base_url}/admin/customers/get_ajax_customers`,
            dataType: 'json',
            method: 'GET',
            success: res => {
                if (res.status) {
                    $('.customer_table').DataTable({
                        data: res.data,
                        language: {
                            emptyTable: "No Customer Found!!!"
                        },
                        createdRow: function(row, data, dataIndex) {
                            $(row).addClass('customer_details_link').attr('id', data.id);
                        },
                        columns: [{
                                data: 'company'
                            },
                            {
                                data: 'name'
                            },
                            {
                                data: 'phone'
                            },
                            {
                                data: 'price_group_name'
                            },
                            {
                                data: 'customer_group_name'
                            },
                            {
                                data: 'vat_no'
                            },
                            {
                                data: 'gst_no'
                            },
                            {
                                data: null,
                                render: (data, type, row) => {
                                    return `
                                    <ul class="icon">
                                        <li><a href="${base_url}/admin/customers/edit/${row.id}" data-toggle="modal" data-target="#myModal2"><img src="<?= $assets ?>images/icon/edit.svg" class="svg" alt=""></a></li>
                                        <li><a href="javascript:void(0)" class="delete_customer" data-id="${row.id}"><img src="<?= $assets ?>images/icon/delete.svg" class="svg" alt=""></a></li>
                                    </ul>`;
                                }
                            },
                        ]
                    });
                }
            }
        });
    }

    $(document).on('click', '.delete_customer', function() {
        if (confirm('Are you Sure you Want to Delete this Customer ? This Action is not Reversible')) {
            $.ajax({
                url: `${base_url}/admin/customers/delete_customer`,
                dataType: 'json',
                method: 'POST',
                data: {
                    id: $(this).data('id')
                },
                success: res => {
                    if (res.status) {
                        var suppliersTable = $('.customer_table').DataTable();
                        suppliersTable.row(suppliersTable.row(`[data-id="${$(this).data('id')}"]`).index()).remove().draw();
                    } else {
                        alert(res.msg);
                    }
                },
                error: res => {}
            });
        }
    });
</script>