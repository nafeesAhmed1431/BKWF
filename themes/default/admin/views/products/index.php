<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<section>
    <div class="tableRow">
        <div class="tableRowItem">
            <div class="tableRowHeading">
                <h2>
                    <?= lang('products') ?>
                </h2>
            </div>
            <div class="tableRowInput">
                <input type="search" class="customSearchInput" placeholder="Search">
            </div>
            <div class="tableRowBtn">
                <a href="<?= base_url('admin/products/add') ?>" class="ankerBtn">Add Product</a>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <select class="form-control" id="ware_house">
                    <option value="0" selected>All</option>
                </select>
            </div>
        </div>
        <div class="tableRowItem">
            <div class="cardTabMenuDivContentItem">
                <table class="table display products_table" style="width:100%">
                    <thead>
                        <tr>
                            <th><?= $this->lang->line("image"); ?></th>
                            <th><?= lang('code'); ?></th>
                            <th><?= lang('name'); ?></th>
                            <th><?= lang('brand'); ?></th>
                            <th><?= lang('category'); ?></th>
                            <th><?= lang('cost'); ?></th>
                            <th><?= lang('price'); ?></th>
                            <th><?= lang('quantity'); ?></th>
                            <th><?= lang('unit'); ?></th>
                            <th><?= lang('alert_quantity'); ?></th>
                            <th><?= lang('actions'); ?></th>
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
    let assets = `${base_url}themes/default/admin/assets/`;
    $(document).ready(function() {
        load_products();
        load_warehouses();
        let table;
    });

    function load_warehouses() {
        $.ajax({
            url: `${base_url}admin/system_settings/get_ajax_warehouses`,
            method: 'GET',
            dataType: 'json',
            success: res => {
                if (res.status) {
                    $('#ware_house').append(res.data.map(warehouse => `<option value="${warehouse.id}">${warehouse.name}</option>`));
                }
            },
            errors: res => {}
        });
    }

    $(document).on('change', '#ware_house', function() {
        load_products($(this).val());
    });

    function load_products_old(wh = 0) {
        $.ajax({
            url: `${base_url}admin/products/get_ajax_products`,
            method: 'GET',
            dataType: 'json',
            data: {
                ware_house: wh
            },
            success: res => {
                if (res.status) {
                    if ($.fn.DataTable.isDataTable('.products_table')) {
                        var table = $('.products_table').DataTable();
                        table.clear().rows.add(res.products.map(product => [])).draw();
                    } else {
                        $('.products_table tbody').html(function() {
                            return res.products.length > 0 ? res.products.map(product => make_product_tr(product)) : "<tr><td class='text-center' colspan='11' ><h2 class='text-daner'>No Product Found!!!</h2></td></tr>";
                        });
                        var table = $('.products_table').dataTable();
                    }
                }
            },
            error: res => {
                // Handle errors
            }
        });
    }

    function load_products(wh = 0) {
        $.ajax({
            url: `${base_url}admin/products/get_ajax_products`,
            method: 'GET',
            dataType: 'json',
            data: {
                ware_house: wh
            },
            success: res => {
                if (res.status) {
                    if ($.fn.DataTable.isDataTable('.products_table')) {
                        var table = $('.products_table').DataTable();
                        table.clear();
                        table.rows.add(res.products);
                        table.draw();
                    } else {
                        $('.products_table').DataTable({
                            data: res.products,
                            createdRow: function(row, data, dataIndex) { $(row).addClass('product_link').attr('id', data.id); },
                            language: { emptyTable: "No Products Found !!!" },
                            columns: [
                                {
                                    data: 'image',
                                    render: function(data, type, row) {
                                        return `<div class="tableImg"><img src="${base_url}/assets/uploads/thumbs/${data}" alt=""></div>`;
                                    }
                                },
                                {
                                    data: 'code'
                                },
                                {
                                    data: 'name'
                                },
                                {
                                    data: 'brand'
                                },
                                {
                                    data: 'category'
                                },
                                {
                                    data: 'cost'
                                },
                                {
                                    data: 'price'
                                },
                                {
                                    data: 'quantity'
                                },
                                {
                                    data: 'unit'
                                },
                                {
                                    data: "alert_quantity"
                                },
                                {
                                    data: null,
                                    render: function(data, type, row) {
                                        return `
                                        <ul class="icon">
                                            <li><a href="${base_url}admin/products/edit/${row.id}"><img src="${assets}/images/icon/edit.svg" class="svg" alt=""></a></li>
                                            <li><a href="javascript:void(0)" class="delete_product" data-id="${row.id}"><img src="${assets}/images/icon/delete.svg" class="svg" alt=""></a></li>
                                        </ul>
                                    `;
                                    }
                                }
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



    function make_product_tr(product) {
        return `
                <tr class="product_link" id="${product.id}">
                    <td>
                        <div class="tableImg">
                            <img src="${base_url}/assets/uploads/thumbs/${product.image}" alt="">
                        </div>
                    </td>
                    <td>${product.code ?? "N/A"}</td>
                    <td>${product.name ?? "N/A"}</td>
                    <td>${product.brand ?? "N/A"}</td>
                    <td>${product.category ?? "N/A"}</td>
                    <td>${product.cost ?? "N/A"}</td>
                    <td>${product.price ?? "N/A"}</td>
                    <td>${product.quantity ?? "N/A"}</td>
                    <td>${product.unit ?? "N/A"}</td>
                    <td>${product.alert_quantity ?? "N/A"}</td>
                    <td>
                        <ul class="icon">
                            <li><a href="${base_url}admin/products/edit/${product.id}"><img src="${assets}/images/icon/edit.svg" class="svg" alt=""></a></li>
                            <li><a href="javascript:void(0)" class="delete_product" data-id="${product.id}"><img src="${assets}/images/icon/delete.svg" class="svg" alt=""></a></li>
                        </ul>
                    </td>
                </tr>`;
    }

    $(document).on('click', '.delete_product', function() {
        if (confirm(`Are you sure you want to delete Product`)) {
            $.ajax({
                url: `${base_url}admin/products/delete`,
                dataType: 'json',
                method: 'GET',
                data: {
                    id: $(this).data('id')
                },
                success: res => {
                    res.status ? $(this).closest('tr').remove() : alert('Some Error occured! Please Contact System Administrator...');
                },
                error: res => {
                    alert('System is a bit Busy Yet, Please Try again later...');
                }
            });
        } else {}

    });
</script>