<section>
    <div class="tableRow">
        <div class="tableRowItem">
            <div class="tableRowHeading">
                <h2><?= lang('Transfers'); ?></h2>
            </div>
            <div class="tableRowInput">
                <input type="search" class="customSearchInput" placeholder="Search">
            </div>
            <div class="tableRowBtn">
                <a href="<?= admin_url('transfers/add') ?>" class="ankerBtn">Add Transfer</a>
            </div>
        </div>
        <div class="tableRowItem">
            <div class="cardTabMenuDivContentItem">
                <table class="table display transfers_table" style="width:100%">
                    <thead>
                        <tr>
                            <th><?= lang("date"); ?></th>
                            <th><?= lang("ref_no"); ?></th>
                            <th><?= lang("warehouse") . ' (' . lang('from') . ')'; ?></th>
                            <th><?= lang("warehouse") . ' (' . lang('to') . ')'; ?></th>
                            <th><?= lang("total"); ?></th>
                            <th><?= lang("product_tax"); ?></th>
                            <th><?= lang("grand_total"); ?></th>
                            <th><?= lang("status"); ?></th>
                            <th><?php echo lang('Actions'); ?></th>
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
        load_transfers();
    });

    function load_transfers() {
        $.ajax({
            url: `${base_url}/admin/transfers/get_ajax_transfers`,
            dataType: 'json',
            method: 'GET',
            success: res => {
                if (res.status) {
                    $('.transfers_table').DataTable({
                        data: res.transfers,
                        createdRow: (row, data) => {
                            $(row).addClass('transfer_link').attr('id', data.id);
                        },
                        language: {
                            emptyTable: "No Record Found !!!"
                        },
                        columns: [{
                                data: 'date'
                            },
                            {
                                data: 'transfer_no'
                            },
                            {
                                data: 'fname'
                            },
                            {
                                data: 'tname'
                            },
                            {
                                data: 'total'
                            },
                            {
                                data: 'total_tax'
                            },
                            {
                                data: 'grand_total'
                            },
                            {
                                data: 'status'
                            },
                            {
                                data: null,
                                render: row => `
                                <ul class="icon">
                                    <li><a href="${base_url}/admin/transfers/edit/${row.id}"><img src="${assets}images/icon/edit.svg" class="svg" alt=""></a></li>
                                    <li><a href="javascript:void(0)" class="delete_transfer" data-id="${row.id}"><img src="${assets}images/icon/delete.svg" class="svg" alt=""></a></li>
                                </ul>`
                            },
                        ]
                    });
                }
            },
            error: res => {},
        });
    }

    $(document).on('click', '.delete_transfer', function() {
        if (confirm('Are you sure to Delete this Transfer...')) {
            let id = $(this).data('id');
            $.ajax({
                url: `${base_url}/admin/transfers/delete/${id}`,
                dataType: 'json',
                method: 'GET',
                success: res => {
                    res.error == 0 ? load_transfers() : alert('Something Went Wrong. Please try Later...');
                },
                error: res => {},
            });
        }
    });

   
</script>