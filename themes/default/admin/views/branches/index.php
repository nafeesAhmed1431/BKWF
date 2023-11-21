<style>
    .text-small {
        font-size: 12px;
    }
</style>
<div class="box">
    <div class="box-header">
        <h2 class="blue"><i class="fa fa-home"></i>Branches</h2>
        <div class="box-icon">
            <ul class="btn-tasks">
                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i class="icon fa fa-tasks tip" data-placement="left" title="<?= lang("actions") ?>"></i></a>
                    <ul class="dropdown-menu pull-right tasks-menus" role="menu" aria-labelledby="dLabel">
                        <li><a href="javascript:void(0)" class="add_branch"><i class="fa fa-plus-circle"></i> Add Branch</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <div class="box-content">
        <div class="row">
            <div class="col-lg-12">
                <div class="table-responsive">
                    <table id="REData" class="table table_theme">
                        <thead>
                            <th>Name</th>
                            <th>City</th>
                            <th>State</th>
                            <th>Phone</th>
                            <th>Mobile</th>
                            <th>Address</th>
                            <th>Live</th>
                            <th>Actions</th>
                        </thead>
                        <tbody>
                            <?php if (!empty($branches)) : ?>
                                <?php foreach ($branches as $branch) : ?>
                                    <tr>
                                        <td><?= $branch->name ?></td>
                                        <td><?= $branch->city ?></td>
                                        <td><?= $branch->state ?></td>
                                        <td><?= $branch->phone ?></td>
                                        <td><?= $branch->mobile ?></td>
                                        <td><?= $branch->address ?></td>
                                        <td><a href="javascript:void(0)" data-id="<?= $branch->id ?>" data-status="<?= $branch->active ?>" class="<?= $branch->active ? "deactivate" : "activate" ?>_branch"> <span class="fa fa-<?= $branch->active ? "check" : "times" ?>"></span></a></td>
                                        <td>
                                            <a href="javascript:void(0)" data-id="<?= $branch->id ?>" class="edit_branch"> <span class="fa fa-edit"></span></a>
                                            <a href="javascript:void(0)" data-id="<?= $branch->id ?>" class="delete_branch"> <span class="fa fa-trash-o"></span></a>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            <?php else : ?>
                                <tr class="text-center">
                                    <td colspan="6">No Record Found!!!</td>
                                </tr>
                            <?php endif; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="branchModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body"></div>
            <div class="modal-footer"></div>
        </div>
    </div>
</div>

<script>
    let url = "<?= base_url() ?>";

    $(document).on('click', '.edit_branch', function() {
        $.ajax({
            url: `${url}/admin/branches/get_branch`,
            dataType: "JSON",
            method: 'GET',
            data: {
                id: $(this).data('id')
            },
            success: handle_branch_details,
            error: res => {

            }
        });
    });

    function handle_branch_details(res = null) {

        let formId = "updateBranch";
        $('#branchModal .modal-title').text('Edit Branch');

        let body = make_form(true, res.data, formId);

        $('#branchModal .modal-body').html(body);
        $('#branchModal .modal-footer').html(`
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" form="${formId}" class="btn btn-primary">Save changes</button>
        `);

        $('#branchModal').modal('show');
    }

    $(document).on('submit', '#updateBranch', function(e) {
        e.preventDefault();
        let formData = new FormData(this);
        $.ajax({
            url: `${url}/admin/branches/update_branch`,
            dataType: 'JSON',
            processData: false,
            contentType: false,
            method: 'POST',
            data: formData,
            success: res => {
                if (res.status) {
                    $('.error-msg').remove();
                    handle_update_feedback(res.data);
                } else {
                    $('.error-msg').remove();
                    $.each(res.error, function(key, msg) {
                        $(`input[name='${key}']`).after(`<span class="text-danger text-small error-msg">${msg}</span>`);
                    });
                }
            },
            error: res => {},
        });
    })

    function handle_update_feedback(data) {
        let tr = ``;
        for (row of data) {
            tr += `
            <tr>
                <td>${row.name}</td>
                <td>${row.city}</td>
                <td>${row.state}</td>
                <td>${row.phone}</td>
                <td>${row.mobile}</td>
                <td>${row.address}</td>
                <td><a href="javascript:void(0)" data-id="${row.id}" data-status="${row.active}" class="${row.active ==1 ? "deactivate" : "activate" }_branch"> <span class="fa fa-${row.active ==1 ? 'check' : 'times' }"></span></a></td>
                <td>
                    <a href="javascript:void(0)" data-id="${row.id}" class="edit_branch"> <span class="fa fa-edit"></span></a>
                    <a href="javascript:void(0)" data-id="${row.id}" class="delete_branch"> <span class="fa fa-trash-o"></span></a>
                </td>
            </tr>`;
        }

        $('#branchModal').modal('hide');
        $('#REData tbody').empty();
        $('#REData tbody').html(tr);


    }

    $('.add_branch').on('click', function() {
        let formID = 'addBranch';
        $('#branchModal .modal-title').text('Add Branch');
        let body = make_form(false, {}, formID);
        $('#branchModal .modal-body').html(body);
        $('#branchModal .modal-footer').html(`
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" form="${formID}" class="btn btn-primary">Save changes</button>`);
        $('#branchModal').modal('show');
    });

    $(document).on('submit', '#addBranch', function(e) {
        e.preventDefault();
        let formData = new FormData(this);
        $.ajax({
            url: `${url}/admin/branches/add_branch`,
            dataType: 'JSON',
            processData: false,
            contentType: false,
            method: 'POST',
            data: formData,
            success: res => {
                if (res.status) {
                    $('.error-msg').remove();
                    handle_update_feedback(res.data);
                } else {
                    $('.error-msg').remove();
                    $.each(res.error, function(key, msg) {
                        $(`input[name='${key}']`).after(`<span class="text-danger text-small error-msg">${msg}</span>`);
                    });
                }
            },
            error: res => {},
        });
    })

    $(document).on('click', '.delete_branch', function(e) {
        if (confirm('Are you sure you want to Delete this Branch.')) {
            $.ajax({
                url: `${url}/admin/branches/delete_branch`,
                dataType: 'JSON',
                method: 'GET',
                data: {
                    id: $(this).data('id')
                },
                success: res => {
                    if (res.status) {
                        $(this).closest('tr').remove();
                    }
                },
                error: res => {},
            });
        }
    })

    $(document).on('click', '.deactivate_branch', function() {
        if (confirm('Are you sure you want to deactivate the branch?')) {
            let status = $(this).data('status');
            $.ajax({
                url: `${url}/admin/branches/manage_branch`,
                dataType: 'JSON',
                method: 'POST',
                data: {
                    id: $(this).data('id'),
                    status: status
                },
                success: res => {
                    $(this).data('status', status == 1 ? 0 : 1);
                    $(this).removeClass('deactivate_branch').addClass('activate_branch');
                    $(this).find('span').removeClass('fa-check').addClass('fa-times');
                },
                error: res => {
                    console.error('AJAX error:', res);
                }
            });
        }
    });

    $(document).on('click', '.activate_branch', function() {
        if (confirm('Are you sure You want to Activate Branch')) {
            $.ajax({
                url: `${url}/admin/branches/manage_branch`,
                dataType: 'JSON',
                method: 'POST',
                data: {
                    id: $(this).data('id'),
                    status: $(this).data('status')
                },
                success: res => {
                    $(this).data('status', status == 1 ? 0 : 1);
                    $(this).removeClass('activate_branch').addClass('deactivate_branch');
                    $(this).find('span').removeClass('fa-times').addClass('fa-check');
                },
                error: res => {}
            });
        }
    });

    function make_form(update = false, data = null, formID) {
        return `
        <form id="${formID}">
            <input type="hidden" name="id" value="${update ? data.id : ''}">
            <div class="form-row mt-3">
                <div class="col-12">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" name="name" placeholder="Branch Name" value="${update ? data.name : ''}">
                </div>
            </div>
            <div class="form-row mt-3">
                <div class="col-6">
                    <label for="city">City</label>
                    <input type="text" class="form-control" name="city" placeholder="Branch City" value="${update ? data.city : ''}">
                </div>
                <div class="col-6">
                    <label for="state">State</label>
                    <input type="text" class="form-control" name="state" placeholder="Branch State" value="${update ? data.state : ''}">
                </div>
            </div>
            <div class="form-row mt-3">
                <div class="col-6">
                    <label for="phone">Phone</label>
                    <input type="text" class="form-control" name="phone" placeholder="Branch Phone" value="${update ? data.phone : ''}">
                </div>
                <div class="col-6">
                    <label for="mobile">Mobile</label>
                    <input type="text" class="form-control" name="mobile" placeholder="Branch Mobile" value="${update ? data.mobile : ''}">
                </div>
            </div>
            <div class="form-row mt-3">
                <div class="col-12">
                    <label for="address">Address</label>
                    <textarea name="address" class="form-control" rows="4">${update ? data.address : ''}</textarea>
                </div>
            </div>
        </form>`;
    }
</script>