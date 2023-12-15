<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>

<section>
    <div class="tableRow">
        <div class="tableRowItem">
            <div class="tableRowHeading">
                <h2>
                    <?= lang('billers') ?>
                </h2>
            </div>
            <div class="tableRowInput">
                <input type="search" class="customSearchInput" placeholder="Search">
            </div>
            <div class="tableRowBtn">
                <a href="<?=admin_url("billers/add")?>" data-toggle="modal" data-target="#myModal" id="add" class="ankerBtn">Add Biller</a>
            </div>
        </div>
        <div class="tableRowItem">
            <div class="cardTabMenuDivContentItem">
                <table class="table display billers_table" style="width:100%">
                    <thead>
                        <tr>
                            <th><?= lang("company"); ?></th>
                            <th><?= lang("name"); ?></th>
                            <th><?= lang("vat_no"); ?></th>
                            <th><?= lang("phone"); ?></th>
                            <th><?= lang("email_address"); ?></th>
                            <th><?= lang("city"); ?></th>
                            <th><?= lang("country"); ?></th>
                            <th style="width:85px;"><?= lang("actions"); ?></th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </div>
</section>

<script>
    let base_url = "<?= base_url() ?>";
    let assets = `${base_url}/themes/default/admin/assets`;
    $(document).ready(function() {
        load_billers();
    });

    function load_billers() {
        $.ajax({
            url: `${base_url}/admin/billers/get_ajax_billers`,
            dataType: 'json',
            method: 'GET',
            data: {},
            success: res => {
                if (res.status) {
                    $('.billers_table').DataTable({
                        data: res.billers,
                        language: {
                            emptyTable: 'No Record Found!!!'
                        },
                        columns: [{
                                data: 'company'
                            },
                            {
                                data: 'name'
                            },
                            {
                                data: 'vat_no'
                            },
                            {
                                data: 'phone'
                            },
                            {
                                data: 'email'
                            },
                            {
                                data: 'city'
                            },
                            {
                                data: 'country'
                            },
                            {
                                data: null,
                                render: row => {
                                    return `
                                    <ul class="icon">
                                        <li><a class="tip" title="" href="${base_url}admin/billers/edit/${row.id}" data-toggle="modal" data-target="#myModal" data-original-title="Edit Biller"><img src="${assets}/images/icon/edit.svg" class="svg" alt=""></a></li>
                                        <li><a href="javascript:void(0)" class="delete_biller" data-id="${row.id}"><img src="${assets}/images/icon/delete.svg" class="svg" alt=""></a></li>
                                    </ul>`;
                                }
                            }
                        ]
                    });
                } else {
                    alert('Something went Wrong Please try Again...');
                }
            },
            error: res => {},
        });
    }

    $(document).on('click', '.delete_biller', function() {
        // Store reference to the clicked element
        var clickedElement = $(this);

        if (confirm('Are you sure to delete this biller')) {
            $.ajax({
                url: `${base_url}/admin/billers/delete_ajax_biller`,
                dataType: 'json',
                method: 'GET',
                data: {
                    id: clickedElement.data('id')
                },
                success: function(res) {
                    if (res.status) {
                        // Remove the row with the specified ID
                        clickedElement.closest('tr').remove();

                        // Refresh DataTable
                        $('.billers_table').DataTable().draw();
                    } else {
                        alert('This Biller has sales...');
                    }
                },
                error: function(res) {
                    // Handle error if needed
                },
            });
        }
    });
</script>