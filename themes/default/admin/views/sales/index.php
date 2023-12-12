<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>

<section>
    <div class="tableRow">
        <div class="tableRowItem">
            <div class="tableRowHeading">
                <h2>
                    <?= lang('sales') ?>
                </h2>
            </div>
            <div class="tableRowInput">
                <input type="search" class="customSearchInput" placeholder="Search">
            </div>
            <div class="tableRowBtn">
                <a href="<?= admin_url('sales/add') ?>"><?= lang('add_sale') ?></a>
            </div>
        </div>
        <div class="tableRowItem">
            <div class="cardTabMenuDivContentItem">
                <table class="table display sales_table" style="width:100%">
                    <thead>
                        <tr>
                            <th><?= lang("date"); ?></th>
                            <th><?= lang("reference_no"); ?></th>
                            <th><?= lang("biller"); ?></th>
                            <th><?= lang("customer"); ?></th>
                            <th><?= lang("sale_status"); ?></th>
                            <th><?= lang("grand_total"); ?></th>
                            <th><?= lang("paid"); ?></th>
                            <th><?= lang("balance"); ?></th>
                            <th><?= lang("payment_status"); ?></th>
                            <th><?= lang("actions"); ?></th>
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
                            <td>Test</td>
                            <td>Test</td>
                            <td>Test</td>
                            <td>Test</td>
                            <td>
                                <span class="tableComplete">
                                    Received
                                </span>
                            </td>
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

    $(document).ready(function() {
        load_sales();
    });

    function load_sales() {
        $.ajax({
            url: `${base_url}/admin/sales/get_ajax_sales`,
            dataType: 'json',
            method: 'GET',
            data: {},
            success: res => {
                if (res.status) {
                    $('.sales_table').DataTable({
                        data: res.sales,
                        createdRow: function(row, data, dataIndex) {
                            $(row).addClass('receipt_link').attr('id', data.id);
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
                                data: 'biller'
                            },
                            {
                                data: 'customer'
                            },
                            {
                                data: 'sale_status'
                            },
                            {
                                data: 'grand_total'
                            },
                            {
                                data: 'paid'
                            },
                            {
                                data: 'balance'
                            },
                            {
                                data: 'payment_status'
                            },
                            {
                                data: null,
                                render: function(row) {
                                    return `
                                    <ul class="icon">
                                        <li><a href="#"><img src="<?= $assets ?>images/icon/edit.svg" class="svg" alt=""></a></li>
                                        <li><a href="#"><img src="<?= $assets ?>images/icon/view.svg" class="svg" alt=""></a></li>
                                        <li><a href="#"><img src="<?= $assets ?>images/icon/delete.svg" class="svg" alt=""></a></li>
                                    </ul>`;
                                }
                            },
                        ]
                    });
                }
            },
            error: res => {}
        });
    }
</script>