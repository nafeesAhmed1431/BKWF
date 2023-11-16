<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>

<div class="box">
    <div class="box-header">
        <h2 class="blue"><i class="fa-fw fa fa-plus"></i><?= lang('add_product'); ?></h2>
        <div class="box-icon">
            <ul class="btn-tasks">
                <li class="dropdown branches">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i class="icon fa fa-plus tip" data-placement="left" title="" data-original-title="Actions"></i></a>
                    <ul class="dropdown-menu pull-right tasks-menus" role="menu" aria-labelledby="dLabel">
                        <li><a href="javascript:void(0)" class="add-supplier"><i class="fa fa-plus"></i> Add Supplier </a></li>
                        <li><a href="javascript:void(0)" class="add-category"><i class="fa fa-plus"></i> Add Category </a></li>
                        <li><a href="javascript:void(0)" class="add-unit"><i class="fa fa-plus"></i> Add Unit </a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <div class="box-content">
        <div class="row mb-4">
            <div class="col-lg-12">
                <p class="introtext"><?php echo lang('enter_info'); ?></p>
                <form action="javascript:void(0)" id="add_product">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <label for="type">Product Type</label>
                                <select name="product_type" class="form-control">
                                    <option value="finished">Finished</option>
                                    <option value="raw_material">Raw Material</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label for="product_name">Product Name*</label>
                                <input type="text" class="form-control" name="product_name" placeholder="Product Name">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <label for="product_code">Product Barcode*</label>
                                <div class="input-group">
                                    <input type="number" name="product_code" class="form-control">
                                    <span class="input-group-addon pointer" id="random_num" style="padding: 1px 10px;">
                                        <i class="fa fa-random"></i>
                                    </span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label for="product_unit">Product Unit</label>
                                <select name="product_unit" class="form-control"></select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <label for="product_category">Product Category*</label>
                                <select name="product_category" class="form-control"></select>
                            </div>
                            <div class="col-md-6">
                                <label for="product_alert_qty">Alert Quantity</label>
                                <input type="number" name="product_alert_qty" class="form-control" placeholder="Alert Quantity">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <label for="product_supplier">Product Suplier*</label>
                                <select name="product_supplier" class="form-control"></select>
                            </div>
                            <div class="col-md-6">
                                <label for="product_brand">Product Brand*</label>
                                <input type="text" name="product_brand" class="form-control" placeholder="Product Brand">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <label for="product_img">Product Image*</label>
                                <input type="file" name="product_img" class="form-control" accept="image/*">
                            </div>
                            <div class="col-md-6">
                                <label for="product_desc">Product Description*</label>
                                <textarea name="product_desc" class="form-control" cols="30" rows="10"></textarea>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="modal" tabindex="-1" role="dialog" aria-labelledby="aModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">
                        <iclass="fa fa-2x">&times;</i>
                    </span><span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" id="modal-title"></h4>
            </div>
            <div class="modal-body"></div>
            <div class="modal-footer"></div>
        </div>
    </div>
</div>

<script>
    let url = "<?= base_url() ?>";

    $(document).ready(() => {
        load_categories();
        load_suppliers();
        load_units();
    });

    // Adding suppliers

    function load_suppliers() {
        $.ajax({
            url: `${url}/admin/products/get_suppliers`,
            dataType: 'json',
            method: 'GET',
            success: res => {
                if (res.status) {
                    handle_suppliers_response(res.data);
                }
            },
        });
    }

    $('.add-supplier').on('click', function() {
        let form_id = 'add_supplier';
        $('#modal .modal-title').text('Add Supplier');
        $('#modal .modal-body').html(`
        <div class="container">
            <form action="javascript:void(0)" id="${form_id}">
                <div class="form-group mt-3">
                    <div class="form-row">
                        <div class="col-md-12">
                            <label for="supplier_name">Supplier Name*</label>
                            <input type="text" name="supplier_name" class="form-control" placeholder="Supplier Name">
                        </div>
                    </div>
                </div>
                <div class="form-group mt-3">
                    <div class="form-row">
                        <div class="col-md-12">
                            <label for="supplier_phone">Supplier Phone*</label>
                            <input type="number" name="supplier_phone" class="form-control" placeholder="Supplier Phone">
                        </div>
                    </div>
                </div>
                <div class="form-group mt-3">
                    <div class="form-row">
                        <div class="col-md-12">
                            <label for="supplier_address">Supplier Address*</label>
                            <input type="text" name="supplier_address" class="form-control" placeholder="Supplier Address">
                        </div>
                    </div>
                </div>
                <div class="form-group mt-3">
                    <div class="form-row">
                        <div class="col-md-12">
                            <label for="supplier_description">Supplier Desc*</label>
                            <textarea name="supplier_description" class="form-control" rows="3"></textarea>
                        </div>
                    </div>
                </div>
            </form>
        </div>`);
        $('#modal .modal-footer').html(`
        <button type="submit" form="${form_id}" class="btn btn-primary">Save</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>`);
        $('#modal').modal('show');
    });

    $(document).on('submit', '#add_supplier', function(e) {
        e.preventDefault();
        let formData = new FormData(this);
        $.ajax({
            url: `${url}/admin/products/add_supplier`,
            dataType: 'json',
            method: 'POST',
            contentType: false,
            processData: false,
            data: formData,
            success: res => {
                $('.error-msg').remove();
                if (res.status) {
                    $('#modal').modal('hide');
                    handle_suppliers_response(res.data);
                } else {
                    $.each(res.errors, function(key, msg) {
                        $(`input[name="${key}"]`).after(`<span class="error-msg text-danger">${msg}</span>`);
                    });
                }
            },
            error: res => {

            },
        });
    });

    function handle_suppliers_response(data) {
        $('select[name="product_supplier"]').append(data.map(option => `<option value="${option.id}">${option.name}</option>`).join(''));
    }

    //---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    // Adding categories

    function load_categories() {
        $.ajax({
            url: `${url}/admin/products/get_categories`,
            dataType: 'json',
            method: 'GET',
            success: res => {
                if (res.status) {
                    handle_categories_response(res.data);
                }
            },
        });
    }

    $('.add-category').on('click', function() {
        let form_id = 'add_category';
        $('#modal .modal-title').text('Add Category');
        $('#modal .modal-body').html(`
        <div class="container">
            <form action="javascript:void(0)" id="${form_id}">
                <div class="form-group mt-3">
                    <div class="form-row">
                        <div class="col-md-12">
                            <label for="category_code">Category Code*</label>
                            <input type="text" name="category_code" class="form-control">
                        </div>
                    </div>
                </div>
                <div class="form-group mt-3">
                    <div class="form-row">
                        <div class="col-md-12">
                            <label for="category_name">Category Name*</label>
                            <input type="text" name="category_name" class="form-control">
                        </div>
                    </div>
                </div>
                <div class="form-group mt-3">
                    <div class="form-row">
                        <div class="col-md-12">
                            <label for="category_slug">Category Slug*</label>
                            <input type="text" name="category_slug" class="form-control">
                        </div>
                    </div>
                </div>
                <div class="form-group mt-3">
                    <div class="form-row">
                        <div class="col-md-12">
                            <label for="category_desc">Category Description*</label>
                            <input type="text" name="category_desc" class="form-control">
                        </div>
                    </div>
                </div>
            </form>
        </div>`);
        $('#modal .modal-footer').html(`
        <button type="submit" form="${form_id}" class="btn btn-primary">Save</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>`);
        $('#modal').modal('show');
    });

    $(document).on('submit', '#add_category', function(e) {
        e.preventDefault();
        let formData = new FormData(this);
        $.ajax({
            url: `${url}/admin/products/add_category`,
            dataType: 'json',
            method: 'POST',
            contentType: false,
            processData: false,
            data: formData,
            success: res => {
                $('.error-msg').remove();
                if (res.status) {
                    $('#modal').modal('hide');
                    handle_categories_response(res.data);
                } else {
                    $.each(res.errors, function(key, msg) {
                        $(`input[name="${key}"]`).after(`<span class="error-msg text-danger">${msg}</span>`);
                    });
                }
            },
            error: res => {

            },
        });
    });

    function handle_categories_response(data) {
        $('select[name="product_category"]').append(data.map(option => `<option value="${option.id}">${option.name}</option>`).join(''));
    }


    //---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    // Adding unit

    function load_units() {
        $.ajax({
            url: `${url}/admin/products/get_units`,
            dataType: 'json',
            method: 'GET',
            success: res => {
                if (res.status) {
                    handle_units_response(res.data);
                }
            },
        });
    }

    $('.add-unit').on('click', function() {
        let form_id = 'add_unit';
        $('#modal .modal-title').text('Add Unit');
        $('#modal .modal-body').html(`
        <div class="container">
            <form action="javascript:void(0)" id="${form_id}">
                <div class="form-group mt-3">
                    <div class="form-row">
                        <div class="col-md-12">
                            <label for="unit_name">Unit Name*</label>
                            <input type="text" name="unit_name" class="form-control" placeholder="Unit Name">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-12">
                            <label for="unit_symbol">Unit Symbol*</label>
                            <input type="text" name="unit_symbol" class="form-control" placeholder="Unit Symbol">
                        </div>
                    </div>
                </div>
            </form>
        </div>`);
        $('#modal .modal-footer').html(`
        <button type="submit" form="${form_id}" class="btn btn-primary">Save</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>`);
        $('#modal').modal('show');
    });

    $(document).on('submit', '#add_unit', function(e) {
        e.preventDefault();
        let formData = new FormData(this);
        $.ajax({
            url: `${url}/admin/products/add_unit`,
            dataType: 'json',
            method: 'POST',
            contentType: false,
            processData: false,
            data: formData,
            success: res => {
                $('.error-msg').remove();
                if (res.status) {

                } else {
                    $.each(res.errors, function(key, msg) {
                        $(`input[name="${key}"]`).after(`<span class="error-msg text-danger">${msg}</span>`);
                    });
                }
            },
            error: res => {

            },
        });
    });

    function handle_units_response(data) {
        $('select[name="product_unit"]').append(data.map(option => `<option value="${option.id}">${option.name} (${option.symbol})</option>`).join(''));
    }
    //---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
</script>