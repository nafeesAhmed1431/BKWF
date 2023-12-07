<section>
    <div class="tableRow">
        <div class="tableRowItem">
            <div class="tableRowHeading">
                <h2><?= lang('users'); ?></h2>
            </div>
            <div class="tableRowInput">
                <input type="search" class="customSearchInput" placeholder="Search">
            </div>
            <div class="tableRowBtn">
                <a href="#" class="ankerBtn">Add User</a>
            </div>
        </div>
        <div class="tableRowItem">
            <div class="cardTabMenuDivContentItem">
                <table class="table display users_table" style="width:100%">
                    <thead>
                        <tr>
                            <th><?php echo lang('first_name'); ?></th>
                            <th><?php echo lang('last_name'); ?></th>
                            <th><?php echo lang('email_address'); ?></th>
                            <th><?php echo lang('company'); ?></th>
                            <th><?php echo lang('group'); ?></th>
                            <th><?php echo lang('status'); ?></th>
                            <th><?php echo lang('actions'); ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- <tr>
                            <td>Qais</td>
                            <td>Butt</td>
                            <td>qais@gmail.com</td>
                            <td>ALS</td>
                            <td>Back-End</td>
                            <td><span class="tableComplete">Senior</span></td>
                            <td>
                                <ul class="icon">
                                    <li><a href="#"><img src="< $assets ?>images/icon/edit.svg" class="svg" alt=""></a></li>
                                    <li><a href="#"><img src="< $assets ?>images/icon/view.svg" class="svg" alt=""></a></li>
                                    <li><a href="#"><img src="< $assets ?>images/icon/delete.svg" class="svg" alt=""></a></li>
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

        load_users();
    });

    function load_users() {
        $.ajax({
            url: `${base_url}/admin/auth/get_ajax_users`,
            dataType: 'json',
            method: 'GET',
            success: res => {
                if (res.status) {
                    $('.users_table').DataTable({
                        data: res.users,
                        language: {
                            emptyTable: "No Users Found !!!"
                        },
                        columns: [{
                                data: 'first_name'
                            },
                            {
                                data: 'last_name'
                            },
                            {
                                data: 'email'
                            },
                            {
                                data: 'company'
                            },
                            {
                                data: null,
                                render: (data, type, row) => {
                                    return `<span class="tableComplete">${row.group}</span>`;
                                }
                            },
                            {
                                data: null,
                                render: (data, type, row) => `<span class="label label-${row.active ?"success":"danger"}">${row.active ? "Active" : "Inactive" }</span>`
                            },
                            {
                                data: null,
                                render: (data, type, row) => {
                                    return `
                                        <ul class="icon">
                                            <li><a href="${base_url}/admin/auth/profile/${row.id}"><img src="<?= $assets ?>images/icon/edit.svg" class="svg" alt=""></a></li>
                                            <li><a href="javascript:void(0)" class="delete_user" data-id="${row.id}"><img src="<?= $assets ?>images/icon/delete.svg" class="svg" alt=""></a></li>
                                        </ul>`;
                                }
                            },
                        ]
                    });

                }
            }
        });
    }

    $(document).on('click', '.delete_user', function() {
        if (confirm('Are you Sure you Want to Delete this User ? This Action is not Reversible')) {
            var userId = $(this).data('id');
            $.ajax({
                url: `${base_url}/admin/auth/delete_user`,
                dataType: 'json',
                method: 'POST',
                data: {
                    id: userId
                },
                success: res => {
                    if (res.status) {
                        var usersTable = $('.users_table').DataTable();
                        usersTable.row(usersTable.row(`[data-id="${userId}"]`).index()).remove().draw();
                    }
                },
                error: res => {}
            });
        }
    });
</script>