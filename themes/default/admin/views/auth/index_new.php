<div class="box">
    <div class="box-header">
        <h2 class="blue"><i class="fa-fw fa fa-users"></i><?= lang('users'); ?></h2>
        <div class="box-icon">
            <ul class="btn-tasks">
                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i class="icon fa fa-tasks tip" data-placement="left" title="<?= lang("actions") ?>"></i></a>
                    <ul class="dropdown-menu pull-right tasks-menus" role="menu" aria-labelledby="dLabel">
                        <!-- <li><a href="<= admin_url('auth/create_user'); ?>"><i class="fa fa-plus-circle"></i> <= lang("add_user"); ?></a></li> -->
                        <li><a href="javascript:void(0)" class="add_user"><i class="fa fa-plus-circle"></i> <?= lang("add_user"); ?></a></li>
                        <li><a href="#" id="excel" data-action="export_excel"><i class="fa fa-file-excel-o"></i> <?= lang('export_to_excel') ?></a></li>
                        <li class="divider"></li>
                        <li><a href="#" class="bpo" title="<b><?= $this->lang->line("delete_users") ?></b>" data-content="<p><?= lang('r_u_sure') ?></p><button type='button' class='btn btn-danger' id='delete' data-action='delete'><?= lang('i_m_sure') ?></a> <button class='btn bpo-close'><?= lang('no') ?></button>" data-html="true" data-placement="left"><i class="fa fa-trash-o"></i> <?= lang('delete_users') ?></a></li>
                    </ul>
                </li>
                <li class="dropdown branches">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i class="icon fa fa-home tip" data-placement="left" title="<?= lang("actions") ?>"></i></a>
                    <ul class="dropdown-menu pull-right tasks-menus" role="menu" aria-labelledby="dLabel">
                    </ul>
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

    $(document).ready(function() {
        load_users();
        load_branches();
    });

    function load_users() {
        $.ajax({
            url: `${url}/admin/auth/getUsers`,
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
                    $('.branches ul').html('<li><a href="javascript:void(0)" data-id="all" ><i class="fa fa-home"></i> All Branches </a></li><li class="divider"></li>');
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
            <td class="text-center"><a class="fa fa-${row.active == 1 ? 'check' : 'times' }" ></a></td>
            <td>
                <a href="javascript:void(0)" data-id="${row.id}"><span class="fa fa-edit"></span></a>
                <a href="javascript:void(0)" data-id="${row.id}"><span class="fa fa-trash-o"></span></a>
            </td>
        </tr>`;
    }

    function make_branch_row(row) {
        return `<li><a href="javascript:void(0)" data-id="${row.id}" ><i class="fa fa-home"></i> ${row.name} </a></li>`;
    }

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
            url: `${url}/admin/auth/create_user`,
            dataType: 'JSON',
            method: 'POST',
            contentType: false,
            processData: false,
            data: formData,
            success: handle_add_user_response,
            error: res => {
                $('.error-msg').remove();
                console.log({'AJAX Error': res});
            }
        });
    });

    function handle_add_user_response(res) {
        $('.error-msg').remove();
        if (res.status) {
            console.log('user created');
        } else {
            if (res.error_code == "0013") {
                $.each(res.errors, function(key, msg) {
                    $(`input[name="${key}"]`).after(`<span class="text-danger error-msg">${msg}</span>`);
                });
            } else {

            }
        }
    }

    function make_user_form(edit = false, data = null) {
        return `        
        <div class="container">
            <form id="${data.form_id}" action="javascript:void(0)">
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
                        <div class="col-sm-6">
                            <label for="email">Email</label>
                            <input type="text" class="form-control" name="email" placeholder="Email" value="${edit?data.email:''}">
                        </div>
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
                        <div class="col-sm-6">
                            <label for="status">Status</label>
                            <select name="status" class="form-control">
                                <option value="1">Active</option>
                                <option value="0">Inactive</option>
                            </select>
                        </div>
                        <div class="col-sm-6">
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
</script>