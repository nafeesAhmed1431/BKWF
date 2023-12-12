<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>

<section>
    <div class="tableRow">
        <div class="tableRowItem">
            <div class="tableRowHeading">
                <h2>
                    <?= lang('expenses'); ?>
                </h2>
            </div>
            <div class="tableRowInput">
                <input type="search" class="customSearchInput" placeholder="Search">
            </div>
            <div class="tableRowBtn">
                <!-- <a href="#" class="ankerBtn">Add Purchase</a> -->
                <a href="<?= admin_url('purchases/add_expense') ?>" data-toggle="modal" data-target="#myModal"><?= lang('add_expense') ?></a>
            </div>
        </div>
        <div class="tableRowItem">
            <div class="cardTabMenuDivContentItem">
                <table class="table display expense_table" style="width:100%">
                    <thead>
                        <tr>
                            <th><?= lang("date"); ?></th>
                            <th><?= lang("reference"); ?></th>
                            <th><?= lang("category"); ?></th>
                            <th><?= lang("amount"); ?></th>
                            <th><?= lang("note"); ?></th>
                            <th><?= lang("created_by"); ?></th>
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
    let assets = `${base_url}themes/default/admin/assets/`;
    $(document).ready(function() {
        load_expenses();
    });

    function load_expenses() {
        $.ajax({
            url: `${base_url}admin/purchases/get_ajax_expenses`,
            method: 'GET',
            dataType: 'json',
            success: res => {
                if (res.status) {
                    if ($.fn.DataTable.isDataTable('.expense_table')) {
                        var table = $('.expense_table').DataTable();
                        table.clear();
                        table.rows.add(res.expenses);
                        table.draw();
                    } else {
                        $('.expense_table').DataTable({
                            data: res.expenses,
                            language: {
                                emptyTable: "No Record Found !!!"
                            },
                            columns: [{
                                    data: 'date'
                                },
                                {
                                    data: 'reference'
                                },
                                {
                                    data: 'category'
                                },
                                {
                                    data: 'amount'
                                },
                                {
                                    data: 'note'
                                },
                                {
                                    data: 'user'
                                },
                                {
                                    data: null,
                                    render: function(row) {
                                        return `    
                                        <ul class="icon">
                                            <li><a href="${base_url}admin/purchases/edit_expense/${row.id}" data-toggle="modal" data-target="#myModal" ><img src="${assets}images/icon/edit.svg" class="svg" alt=""></a></li>
                                            <li><a href="javascript:void(0)" data-id="${row.id}" class="delete_expense" ><img src="${assets}images/icon/delete.svg" class="svg" alt=""></a></li>
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

    $(document).on('click','.delete_expense',function(){
        if(confirm('Are you sure to Delete? This action is not reversible.')){
            let id = $(this).data('id');
            $.ajax({
                url : `${base_url}admin/purchases/delete_expense/${id}`,
                dataType : 'json',
                method : 'GET',
                success : res => {
                    if(res.error == 0){
                        load_expenses();
                    }
                },
                error : res => {},
            });
        }
    });
</script>