<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>

<section>
    <div class="tableRow">
        <div class="tableRowItem">
            <div class="tableRowHeading">
                <h2>
                    Purchases
                </h2>
            </div>
            <div class="tableRowInput">
                <input type="search" class="customSearchInput" placeholder="Search">
            </div>
            <div class="tableRowBtn">
                <a href="<?= admin_url('purchases/add') ?>" class="ankerBtn">Add Purchase</a>
            </div>
        </div>
        <div class="tableRowItem">
            <div class="cardTabMenuDivContentItem">
                <table class="table display purchase_table" style="width:100%">
                    <thead>
                        <tr>
                            <th><?= lang('date'); ?></th>
                            <th><?= lang('ref_no'); ?></th>
                            <th><?= lang('supplier'); ?></th>
                            <th><?= lang('purchase_status'); ?></th>
                            <th><?= lang('grand_total'); ?></th>
                            <th><?= lang('paid'); ?></th>
                            <th><?= lang('payment_status'); ?></th>
                            <th><?= lang('actions'); ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- <tr>
                            <td>
                                <span>14/11/2023</span>
                                <span>15:25:00</span>
                            </td>
                            <td>
                                <span>PO2023/</span>
                                <span>11/0032</span>
                            </td>
                            <td>Qais</td>
                            <td>
                                <span class="tableComplete">
                                    Received
                                </span>
                            </td>
                            <td>13,800.0</td>
                            <td>13,800.0</td>
                            <td>0.0</td>
                            <td>
                                <span class="tableComplete">
                                    Paid
                                </span>
                            </td>
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
    let assets = `${base_url}themes/default/admin/assets/`;
    $(document).ready(function() {
        load_purchases();
    });

    function load_purchases(wh = 0) {
        $.ajax({
            url: `${base_url}admin/purchases/get_ajax_purchases`,
            method: 'GET',
            dataType: 'json',
            success: res => {
                if (res.status) {
                    if ($.fn.DataTable.isDataTable('.purchase_table')) {
                        var table = $('.purchase_table').DataTable();
                        table.clear();
                        table.rows.add(res.purchases);
                        table.draw();
                    } else {
                        $('.purchase_table').DataTable({
                            data: res.purchases,
                            createdRow: function(row, data, dataIndex) {
                                $(row).addClass('purchase_link').attr('id', data.id);
                            },
                            language: {
                                emptyTable: "No Record Found !!!"
                            },
                            columns: [{
                                    data: 'date'
                                },
                                {
                                    data: 'reference_no'
                                },
                                {
                                    data: 'supplier'
                                },
                                {
                                    data: null,
                                    render: row => {
                                        return `<span class="tableComplete">Received</span>`;
                                    }
                                },
                                {
                                    data: 'grand_total'
                                },
                                {
                                    data: 'paid'
                                },
                                {
                                    data: null,
                                    render: row => {
                                        return `<span title="${row.payment_status}" class="${row.payment_status == "paid" ? "tableComplete" : "tablePending" }">${row.payment_status ? "Paid" : "Pending" }</span>`;
                                    }
                                },
                                {
                                    data: null,
                                    render: function(row) {
                                        return `
                                        <ul class="icon">
                                            <li><a href="${base_url}admin/purchases/view/${row.id}"><img src="${assets}images/icon/view.svg" class="svg" alt=""></a></li>
                                            <li><a href="${base_url}admin/purchases/add_payment/${row.id}" data-toggle="modal" data-target="#myModal" ><i class="fa fa-money"></i></a></li>
                                            <li><a href="${base_url}admin/purchases/edit/${row.id}"><img src="${assets}images/icon/edit.svg" class="svg" alt=""></a></li>
                                            <li><a href="${base_url}admin/purchases/delete/${row.id}"><img src="${assets}images/icon/delete.svg" class="svg" alt=""></a></li>
                                        </ul>`;
                                    }
                                },
                            ]
                        });
                    }
                }
            },
            error: res => {
                // Handle errors
            }
        });
    }
</script>