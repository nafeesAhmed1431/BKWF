<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>

<section>
    <div class="tableRow">
        <div class="tableRowItem">
            <div class="tableRowHeading">
                <h2>
                    <?= lang('expense_categories'); ?>
                </h2>
            </div>
            <div class="tableRowInput">
                <input type="search" class="customSearchInput" placeholder="Search">
            </div>
            <div class="tableRowBtn">
                <a href="<?php echo admin_url('system_settings/add_expense_category'); ?>" data-toggle="modal" data-target="#myModal"><?= lang('add_expense_category') ?></a>
            </div>
        </div>
        <div class="tableRowItem">
            <div class="cardTabMenuDivContentItem">
                <table class="table display category_table" style="width:100%">
                    <thead>
                        <tr>
                            <th><?= $this->lang->line("category_code"); ?></th>
                            <th><?= $this->lang->line("category_name"); ?></th>
                            <th><?= $this->lang->line("actions"); ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <?= $this->lang->line("category_code"); ?>
                            </td>
                            <td>
                                <?= $this->lang->line("category_name"); ?>
                            </td>
                            <td>
                                <ul class="icon">
                                    <li><a href="#"><img src="<?= $assets ?>images/icon/edit.svg" class="svg" alt=""></a></li>
                                </ul>
                            </td>
                        </tr>
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
        load_categories();
    });

    function load_categories() {
        $.ajax({
            url: `${base_url}admin/system_settings/get_ajax_expense_categories`,
            dataType: 'json',
            method: 'GET',
            success: res => {
                if (res.status) {
                    if ($.fn.DataTable.isDataTable('.category_table')) {
                        var table = $('.category_table').DataTable();
                        table.clear();
                        table.rows.add(res.categories).draw();
                    } else {
                        $('.category_table').DataTable({
                            data: res.categories,
                            language: {
                                emptyTable: "No Category Found !!!"
                            },
                            columns: [{
                                    data: 'code'
                                },
                                {
                                    data: 'name'
                                },
                                {
                                    data: null,
                                    render: function(row) {
                                        return `
                                                <ul class="icon">
                                                    <li><a href="${base_url}admin/system_settings/edit_expense_category/${row.id}"><img src="${assets}images/icon/edit.svg" class="svg" alt=""></a></li>
                                                    <li><a href="javascript:void(0)" class="delete_category" data-id="${row.id}"><img src="${assets}/images/icon/delete.svg" class="svg" alt=""></a></li>
                                                </ul>`;
                                    }
                                },
                            ]
                        });
                    }
                }
            },
            error: res => {},
        });
    }

    $(document).on('click', '.delete_category', function() {
        if (confirm('Are you sure you want to Delete this Category ???')) {
            let id = $(this).data('id');
            $.ajax({
                url: `${base_url}/admin/system_settings/delete_expense_category`,
                dataType: 'json',
                method: 'POST',
                data: {
                    id: id
                },
                success: res => {
                    res.status ? load_categories() : alert('This Category have expense Records.');
                },
                error: res => {},
            });
        }
    });
</script>