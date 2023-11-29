<link rel="stylesheet" href="<?= base_url('themes/default/admin/assets/styles/sweetalert2.css') ?>">

<div class="box">
    <div class="box-header">
        <h2 class="blue"><i class="fa-fw fa fa-users"></i><?= lang('users'); ?></h2>
        <div class="box-icon">
            <ul class="btn-tasks">
                <li class="dropdown">
                    <a title="Add User" class="add_user" href="javascript:void(0)"><i class="icon fa fa-plus tip"></i></a>
                    <ul class="dropdown-menu pull-right tasks-menus" role="menu" aria-labelledby="dLabel">
                        <!-- <li><a href="<= admin_url('auth/create_user'); ?>"><i class="fa fa-plus-circle"></i> <= lang("add_user"); ?></a></li> -->
                        <!-- <li><a href="#" id="excel" data-action="export_excel"><i class="fa fa-file-excel-o"></i> <= lang('export_to_excel') ?></a></li> -->
                        <!-- <li><a href="javascript:void(0)" class="add_user"><i class="fa fa-plus-circle"></i> <= lang("add_user"); ?></a></li> -->
                        <!-- <li><a href="#" class="bpo" title="<b><= $this->lang->line("delete_users") ?></b>" data-content="<p><= lang('r_u_sure') ?></p><button type='button' class='btn btn-danger' id='delete' data-action='delete'><= lang('i_m_sure') ?></a> <button class='btn bpo-close'><= lang('no') ?></button>" data-html="true" data-placement="left"><i class="fa fa-trash-o"></i> <= lang('delete_users') ?></a></li> -->
                        <!-- <li class="divider"></li> -->
                    </ul>
                </li>
                <li class="dropdown branches">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i class="icon fa fa-home tip" data-placement="left" title="Select Branch"></i></a>
                    <ul class="dropdown-menu pull-right tasks-menus" role="menu" aria-labelledby="dLabel"></ul>
                </li>
            </ul>
        </div>
    </div>
    <div class="box-content">
        <div class="row">
            <div class="col-lg-12">
                <p class="introtext"><?= lang('list_results'); ?></p>
                <div class="table-responsive">
                    <table id="UsrTable" cellpadding="0" cellspacing="0" border="0" class="table table_theme">
                        <thead>
                            <tr>
                                <th class="col-xs-2"><?php echo lang('first_name'); ?></th>
                                <th class="col-xs-2"><?php echo lang('last_name'); ?></th>
                                <th class="col-xs-2"><?php echo lang('email_address'); ?></th>
                                <th class="col-xs-2"><?php echo lang('company'); ?></th>
                                <th class="col-xs-1"><?php echo lang('group'); ?></th>
                                <th style="width:100px;"><?php echo lang('status'); ?></th>
                                <th style="width:80px;"><?php echo lang('actions'); ?></th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="userModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span class="fa fa-times"></span></button>
            </div>
            <div class="modal-body"></div>
            <div class="modal-footer"></div>
        </div>
    </div>
</div>

<script src="<?= base_url('themes/default/admin/assets/js/sweetalert2.js') ?>"></script>
<script>
    let url = "<?= base_url() ?>";
    let form = null;

    $(document).ready(function() {
        load_users();
        load_branches();
    });

    function load_users() {
        $.ajax({
            url: `${url}/admin/users/getUsers`,
            dataType: 'JSON',
            method: 'GET',
            success: res => {
                if (res.status) {
                    let tr = ``;
                    for (user of res.users) {
                        tr += make_user_row(user);
                    }
                    $('#UsrTable tbody').empty();
                    $('#UsrTable tbody').html(tr);
                }
            },
            error: res => {
                console.error('AJAX error:', res);
            }
        });
    }

    function load_branches() {
        $.ajax({
            url: `${url}admin/branches/get_branches`,
            dataType: 'JSON',
            method: 'GET',
            success: res => {
                if (res.status) {
                    let tr = ``;
                    for (branch of res.branches) {
                        tr += make_branch_row(branch);
                    }
                    $('.branches ul').empty();
                    $('.branches ul').html('<li><a href="javascript:void(0)" data-id="0" class="select_branch" ><i class="fa fa-home"></i> All Branches </a></li><li class="divider"></li>');
                    $('.branches ul').append(tr);
                }
            },
            error: res => {
                console.error('AJAX error:', res);
            }
        });
    }

    function make_user_row(row) {
        return `
        <tr>
            <td>${row.first_name}</td>
            <td>${row.last_name}</td>
            <td>${row.email}</td>
            <td>${row.company}</td>
            <td>${row.group}</td>
            <td class="text-center"><a title="${row.first_name} Status" href="javascript:void(0)" data-id="${row.id}" data-status="${row.active}" class="update_status fa fa-${row.active == 1 ? 'check' : 'times' }" ></a></td>
            <td>
                <a title="${row.first_name}'s Branches" href="javascript:void(0)" class="user-branches" data-id="${row.id}"><span class="fa fa-home"></span></a>
                <a title="Edit ${row.first_name}" href="javascript:void(0)" class="edit-user" data-id="${row.id}"><span class="fa fa-edit"></span></a>
                <a title="Delete ${row.first_name}" href="javascript:void(0)" class="delete-user" data-id="${row.id}"><span class="fa fa-trash-o"></span></a>
            </td>
        </tr>`;
    }

    function make_branch_row(row) {
        return `<li><a href="javascript:void(0)" data-id="${row.id}" class="select_branch" ><i class="fa fa-home"></i> ${row.name} </a></li>`;
    }

    // Branches
    $(document).on('click', '.select_branch', function() {
        let id = $(this).data('id');
        console.log(id);
        if (id == "0") {
            load_users();
        } else {
            $.ajax({
                url: `${url}/admin/users/getBranchUsers`,
                dataType: 'JSON',
                method: 'GET',
                data: {
                    bid: $(this).data('id')
                },
                success: res => {
                    if (res.status) {
                        let tr = ``;
                        for (user of res.data) {
                            tr += make_user_row(user);
                        }
                        $('#UsrTable tbody').empty();
                        $('#UsrTable tbody').html(tr);
                    } else {
                        Swal.fire({
                            title: 'Info',
                            text: 'No User Found in this Branch',
                            showCancelButton: false,
                            showConfirmButton: false,
                            toast: true,
                            timer: 2000,
                            timerProgressBar: true,
                            position: 'top-right',
                            icon: 'info',
                        });
                    }
                },
                error: res => {
                    console.error('AJAX error:', res);
                }
            });
        }

    });

    // Add User
    $('.add_user').on('click', function() {
        let form_id = "add_user_form";
        $('#userModal .modal-title').text('Add User');
        $('#userModal .modal-body').html(make_user_form(false, {
            'form_id': form_id
        }));
        $('#userModal .modal-footer').html(`
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" form="${form_id}" class="btn btn-primary">Save</button>`);
        $('#userModal').modal('show');
    });

    $(document).on('submit', '#add_user_form', function(e) {
        e.preventDefault();
        let formData = new FormData(this);

        $.ajax({
            url: `${url}/admin/users/create_user`,
            dataType: 'JSON',
            method: 'POST',
            contentType: false,
            processData: false,
            data: formData,
            success: handle_add_user_response,
            error: res => {
                $('.error-msg').remove();
                console.log({
                    'AJAX Error': res
                });
            }
        });
    });

    function handle_add_user_response(res) {
        $('.error-msg').remove();
        if (res.status) {
            $('#userModal').modal('hide');
            load_users();
        } else {
            if (res.error_code == "0013") {
                $.each(res.errors, function(key, msg) {
                    $(`input[name="${key}"]`).after(`<span class="text-danger error-msg">${msg}</span>`);
                });
            } else {

            }
        }
    }

    // User Edit 
    $(document).on('click', '.edit-user', function() {
        let id = $(this).data('id');
        $.ajax({
            url: `${url}/admin/users/get_user`,
            dataType: 'JSON',
            method: 'GET',
            data: {
                'id': id
            },
            success: handle_get_user_response,
            error: res => {}
        });
    });

    function handle_get_user_response(res) {
        if (res.status) {
            let form_id = "update_user_form";
            res.user.form_id = form_id;
            $('#userModal .modal-title').text('Edit User');
            $('#userModal .modal-body').html(make_user_form(true, res.user));
            $('#userModal .modal-footer').html(`
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" form="${form_id}" class="btn btn-primary">Save</button>`);
            $('#userModal').modal('show');
        }
    }

    $(document).on('submit', '#update_user_form', function(e) {
        e.preventDefault();
        let formData = new FormData(this);

        $.ajax({
            url: `${url}/admin/users/update_user`,
            dataType: 'JSON',
            method: 'POST',
            contentType: false,
            processData: false,
            data: formData,
            success: handle_update_user_response,
            error: res => {
                console.log({
                    'AJAX Error': res
                });
            }
        });
    });

    function handle_update_user_response(res) {
        $('.error-msg').remove();
        if (res.status) {
            $('#userModal').modal('hide');
            load_users();
        } else {
            $.each(res.errors, (key, msg) => {
                $(`input[name="${key}"]`).after(`<span class="error-msg text-danger">${msg}</span>`);
            });
        }
    }

    // Delete Edit 
    $(document).on('click', '.delete-user', function() {
        if (confirm('Are you sure you want to Delete this user?')) {
            $.ajax({
                url: `${url}/admin/users/delete_user`,
                dataType: 'json',
                method: 'POST',
                data: {
                    id: $(this).data('id')
                },
                success: res => {
                    if (res.status) {
                        $(this).closest('tr').remove();
                    }
                },
                error: res => {
                    console.log({
                        'AJAX Error': res
                    });
                }
            });
        }
    });

    // Supporting form
    function make_user_form(edit = false, data = null) {
        return `        
        <div class="container">
            <form id="${data.form_id}" action="javascript:void(0)">
                <input type="hidden" name="id" value="${data.id}">
                <div class="form-group">
                    <div class="form-row">
                        <div class="col-sm-6">
                            <label for="first_name">First Name</label>
                            <input type="text" class="form-control" name="first_name" placeholder="First Name" value="${edit?data.first_name:''}">
                        </div>
                        <div class="col-sm-6">
                            <label for="last_name">Last Name</label>
                            <input type="text" class="form-control" name="last_name" placeholder="Last Name" value="${edit?data.last_name:''}">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-sm-6">
                            <label for="phone">Phone</label>
                            <input type="text" class="form-control" name="phone" placeholder="Phone" value="${edit?data.phone:''}">
                        </div>
                        ${!edit ? `<div class="col-sm-6">
                                    <label for="email">Email</label>
                                    <input type="text" class="form-control" name="email" placeholder="Email" value="${edit?data.email:''}">
                                </div>` : '' }
                    </div>
                    <div class="form-row">
                        <div class="col-sm-6">
                            <label for="gender">Gender</label>
                            <select name="gender" class="form-control">
                                <option value="male">Male</option>
                                <option value="Female">Female</option>
                            </select>
                        </div>
                        <div class="col-sm-6">
                            <label for="company">Company</label>
                            <input type="text" class="form-control" name="company" placeholder="Company" value="${edit?data.company:''}">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-sm-12">
                            <label for="group">Group</label>
                            <select name="group" class="form-control">
                                <option value="1">Owner</option>
                                <option value="2">Admin</option>
                                <option value="3">Sales</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-sm-12">
                            <label for="username">Username</label>
                            <input type="text" class="form-control" name="username" placeholder="UserName" value="${edit?data.username:''}">
                        </div>
                    </div>
                    ${!edit ? `<div class="form-row">
                        <div class="col-sm-6">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" name="password" placeholder="Password" value="">
                        </div>
                        <div class="col-sm-6">
                            <label for="confirm-password">Confirm Password</label>
                            <input type="password" class="form-control" name="confirm-password" placeholder="Confirm Password" value="">
                        </div>
                        <div class="col-sm-12">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="notify">
                                <label class="form-check-label" for="notify">Notify User</label>
                            </div>
                        </div>
                    </div>` : ''}
                </div>
            </form>
        </div>`;
    }

    // Update Status
    $(document).on('click', '.update_status', function() {
        let status = $(this).data('status');
        let text = status == 1 ? 'Deactivate' : 'Activate';
        if (confirm(`Are you sure you want to "${text}" this User.`)) {
            $.ajax({
                url: `${url}/admin/users/update_status`,
                dataType: 'json',
                method: 'POST',
                data: {
                    id: $(this).data('id'),
                    status: status
                },
                success: res => {
                    load_users();
                },
                error: res => {
                    console.log({
                        'AJAX Error': res
                    });
                }
            });
        }
    });

    // User Branches
    $(document).on('click', '.user-branches', function() {
        $.ajax({
            url: `${url}/admin/users/user_branches`,
            dataType: 'json',
            method: 'GET',
            data: {
                id: $(this).data('id'),
            },
            success: handle_user_branches_response,
            error: res => {
                console.log({
                    'AJAX Error': res
                });
            }
        });
    });

    function handle_user_branches_response(res) {
        if (res.status) {
            let html = `<div class="container"><div class="row"><div class="col-sm-12"><ol>`;
            for (branch of res.branches) {
                html += `<li>${branch.branch_name}</li>`;
            }
            html += ` </ol></div></div></div>`;
            $('#userModal .modal-title').text('Users Branches');
            $('#userModal .modal-body').html(html);
            $('#userModal .modal-footer').html(`<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>`);
            $('#userModal').modal('show');
        } else {
            let form_id = 'assign_branch';
            let html = `<div class="container"><div class="row"><div class="col-sm-12"><label>Assign Branches to ${res.user.first_name} </label></div><div class="col-sm-12"><form action="javascript:void(0)" id="${form_id}"><div class="col-md-12"><input type="hidden" name="id" value="${res.user.id}"><table class="table"><thead><th>Branch</th><th>Status</th></thead><tbody>`;
            for (branch of res.branches) {
                html += `<tr><td>${branch.name}</td><td class="text-center"><input type="checkbox" class="form-check" value="${branch.id}" name="branch[]"></td></tr>`;
            }
            html += `  </tbody></table></div></form></div></div></div>`;
            $('#userModal .modal-title').text('Assign User');
            $('#userModal .modal-body').html(html);
            $('#userModal .modal-footer').html(`<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="submit" form="${form_id}" class="btn btn-primary">Save</button>`);
            $('#userModal').modal('show');
        }
    }

    $(document).on('submit', `#assign_branch`, function(e) {
        e.preventDefault();
        let formData = new FormData(this);
        $.ajax({
            url: `${url}/admin/users/assign_branch`,
            dataType: 'json',
            method: 'POST',
            contentType: false,
            processData: false,
            data: formData,
            success: res => {
                if (res.status) {
                    $('#userModal').modal('hide');
                }
            },
            error: res => {
                console.log({
                    'AJAX Error': res
                });
            }
        });
    });
</script>