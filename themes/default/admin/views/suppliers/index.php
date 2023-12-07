<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<section>
    <div class="tableRow">
        <div class="tableRowItem">
            <div class="tableRowHeading">
                <h2><?= lang('suppliers'); ?></h2>
            </div>
            <div class="tableRowInput">
                <input type="search" class="customSearchInput" placeholder="Search">
            </div>
            <div class="tableRowBtn">
                <a class="ankerBtn" href="<?= admin_url('suppliers/add') ?>" data-toggle="modal" data-target="#myModal">
                    <i class="fa fa-plus-circle"></i><span class="text"> Add Supplier</span>
                </a>
            </div>
        </div>
        <div class="tableRowItem">
            <div class="cardTabMenuDivContentItem">
                <table class="table display suppliers_table" style="width:100%">
                    <thead>
                        <tr>
                            <th><?php echo lang('company'); ?></th>
                            <th><?php echo lang('name'); ?></th>
                            <th><?php echo lang('email_address'); ?></th>
                            <th><?php echo lang('phone'); ?></th>
                            <th><?php echo lang('city'); ?></th>
                            <th><?php echo lang('country'); ?></th>
                            <th><?php echo lang('vat_no'); ?></th>
                            <th><?php echo lang('gst_no'); ?></th>
                            <th><?php echo lang('actions'); ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- <tr>
                            <td>ALS</td>
                            <td>Qais</td>
                            <td>qais@gmail.com</td>
                            <td>0987654321</td>
                            <td>Patoki</td>
                            <td>Pakistan</td>
                            <td>0987654321</td>
                            <td>0987654321</td>
                            <td>
                                <ul class="icon">
                                    <li><a href="#"><img src="<= $assets ?>images/icon/edit.svg" class="svg" alt=""></a></li>
                                    <li><a href="#"><img src="<= $assets ?>images/icon/money-bill.svg" class="svg" alt=""></a></li>
                                    <li><a href="#"><img src="<= $assets ?>images/icon/list.svg" class="svg" alt=""></a></li>
                                    <li><a href="#"><img src="<= $assets ?>images/icon/user.svg" class="svg" alt=""></a></li>
                                    <li><a href="#"><img src="<= $assets ?>images/icon/add.svg" class="svg" alt=""></a></li>
                                </ul>
                            </td>
                        </tr> -->
                </table>
            </div>
        </div>
    </div>
</section>

<script>
    let base_url = "<?= base_url() ?>";
    $(document).ready(function() {
        load_suppliers();
    });

    function load_suppliers() {
        $.ajax({
            url: `${base_url}/admin/suppliers/get_ajax_suppliers`,
            dataType: 'json',
            method: 'GET',
            success: res => {
                if (res.status) {
                    $('.suppliers_table').DataTable({
                        data: res.data,
                        language: {
                            emptyTable: "No Supplier Found!!!"
                        },
                        createdRow: function(row, data, dataIndex) {
                            $(row).addClass('supplier_details_link').attr('id', data.id);
                        },
                        columns: [{
                                data: 'company'
                            },
                            {
                                data: 'name'
                            },
                            {
                                data: 'email'
                            },
                            {
                                data: 'phone'
                            },
                            {
                                data: 'city'
                            },
                            {
                                data: 'country'
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
                                        <li>
                                            <a href="${base_url}/admin/suppliers/edit/${row.id}" data-toggle="modal" data-target="#myModal" data-original-title="Edit Supplier">
                                                <img src="<?= $assets ?>images/icon/edit.svg" class="svg" alt="">
                                            </a>
                                        </li>
                                        <li><a href="javascript:void(0)" class="delete_supplier" data-id="${row.id}"><img src="<?= $assets ?>images/icon/delete.svg" class="svg" alt=""></a></li>
                                    </ul>`;
                                }
                            },
                        ]
                    });
                }
            }
        });
    }

    $(document).on('click', '.delete_supplier', function() {
        if (confirm('Are you Sure you Want to Delete this Supplier ? This Action is not Reversible')) {
            $.ajax({
                url: `${base_url}/admin/suppliers/delete_supplier`,
                dataType: 'json',
                method: 'POST',
                data: {
                    id: $(this).data('id')
                },
                success: res => {
                    if (res.status) {
                        var suppliersTable = $('.suppliers_table').DataTable();
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