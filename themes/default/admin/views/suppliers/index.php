<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<script>
    $(document).ready(function() {
        oTable = $('#SupData').dataTable({
            "aaSorting": [
                [1, "asc"]
            ],
            "aLengthMenu": [
                [10, 25, 50, 100, -1],
                [10, 25, 50, 100, "<?= lang('all') ?>"]
            ],
            "iDisplayLength": <?= $Settings->rows_per_page ?>,
            'bProcessing': true,
            'bServerSide': true,
            'sAjaxSource': '<?= admin_url('suppliers/getSuppliers') ?>',
            'fnServerData': function(sSource, aoData, fnCallback) {
                aoData.push({
                    "name": "<?= $this->security->get_csrf_token_name() ?>",
                    "value": "<?= $this->security->get_csrf_hash() ?>"
                });
                $.ajax({
                    'dataType': 'json',
                    'type': 'POST',
                    'url': sSource,
                    'data': aoData,
                    'success': fnCallback
                });
            },
            'fnRowCallback': function(nRow, aData, iDisplayIndex) {
                nRow.id = aData[0];
                nRow.className = "supplier_details_link";
                return nRow;
            },
            "aoColumns": [{
                "bSortable": false,
                "mRender": checkbox
            }, null, null, null, null, null, null, null, null, {
                "bSortable": false
            }]
        }).dtFilter([{
                column_number: 1,
                filter_default_label: "[<?= lang('company'); ?>]",
                filter_type: "text",
                data: []
            },
            {
                column_number: 2,
                filter_default_label: "[<?= lang('name'); ?>]",
                filter_type: "text",
                data: []
            },
            {
                column_number: 3,
                filter_default_label: "[<?= lang('email_address'); ?>]",
                filter_type: "text",
                data: []
            },
            {
                column_number: 4,
                filter_default_label: "[<?= lang('phone'); ?>]",
                filter_type: "text",
                data: []
            },
            {
                column_number: 5,
                filter_default_label: "[<?= lang('city'); ?>]",
                filter_type: "text",
                data: []
            },
            {
                column_number: 6,
                filter_default_label: "[<?= lang('country'); ?>]",
                filter_type: "text",
                data: []
            },
            {
                column_number: 7,
                filter_default_label: "[<?= lang('vat_no'); ?>]",
                filter_type: "text",
                data: []
            },
            {
                column_number: 8,
                filter_default_label: "[<?= lang('gst_no'); ?>]",
                filter_type: "text",
                data: []
            },
        ], "footer");
    });
</script>
<?php if ($Owner || $GP['bulk_actions']) {
    echo admin_form_open('suppliers/supplier_actions', 'id="action-form"');
} ?>

<section>
    <div class="tableRow">
        <div class="tableRowItem">
            <div class="tableRowHeading">
                <h2><?= lang('suppliers'); ?></h2>
            </div>
            <div class="tableRowInput">
                <input type="search" class="customSearchInput" placeholder="Search">
            </div>
            <div class="tableRowBtn">
                <!-- <a href="#" class="ankerBtn">Add Supplier</a> -->
                <a <?php if ($count <= 50) { ?> href="<?= admin_url('suppliers/add'); ?>" data-toggle="modal" data-target="#myModal" <?php } else { ?> onclick="alert('You cannot add more than 50 customers please contact to administrator!');" <?php } ?> id="add">Add Supplier</a>
            </div>
        </div>
        <div class="tableRowItem">
            <div class="cardTabMenuDivContentItem">
                <table class="table display dTable" style="width:100%">
                    <thead>
                        <tr>
                            <th><?php echo lang('company'); ?></th>
                            <th><?php echo lang('name'); ?></th>
                            <th><?php echo lang('email_address'); ?></th>
                            <th><?php echo lang('phone'); ?></th>
                            <th><?php echo lang('city'); ?></th>
                            <th><?php echo lang('country'); ?></th>
                            <th><?php echo lang('vat_no'); ?></th>
                            <th><?php echo lang('gst_no'); ?></th>
                            <th><?php echo lang('actions'); ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>ALS</td>
                            <td>Test</td>
                            <td>test@gmail.com</td>
                            <td>1234567890</td>
                            <td>Gujranwala</td>
                            <td>Pakistan</td>
                            <td>1234567890</td>
                            <td>1234567890</td>
                            <td>
                                <ul class="icon">
                                    <li><a href="#"><img src="<?= $assets ?>images/icon/edit.svg" class="svg" alt=""></a></li>
                                    <li><a href="#"><img src="<?= $assets ?>images/icon/money-bill.svg" class="svg" alt=""></a></li>
                                    <li><a href="#"><img src="<?= $assets ?>images/icon/list.svg" class="svg" alt=""></a></li>
                                    <li><a href="#"><img src="<?= $assets ?>images/icon/user.svg" class="svg" alt=""></a></li>
                                    <li><a href="#"><img src="<?= $assets ?>images/icon/add.svg" class="svg" alt=""></a></li>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <td>ALS</td>
                            <td>Qais</td>
                            <td>qais@gmail.com</td>
                            <td>0987654321</td>
                            <td>Patoki</td>
                            <td>Pakistan</td>
                            <td>0987654321</td>
                            <td>0987654321</td>
                            <td>
                                <ul class="icon">
                                    <li><a href="#"><img src="<?= $assets ?>images/icon/edit.svg" class="svg" alt=""></a></li>
                                    <li><a href="#"><img src="<?= $assets ?>images/icon/money-bill.svg" class="svg" alt=""></a></li>
                                    <li><a href="#"><img src="<?= $assets ?>images/icon/list.svg" class="svg" alt=""></a></li>
                                    <li><a href="#"><img src="<?= $assets ?>images/icon/user.svg" class="svg" alt=""></a></li>
                                    <li><a href="#"><img src="<?= $assets ?>images/icon/add.svg" class="svg" alt=""></a></li>
                                </ul>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>

<!-- <div class="box">
    <div class="box-header">
        <h2 class="blue"><i class="fa-fw fa fa-users"></i><?= lang('suppliers'); ?></h2>

        <div class="box-icon">
            <ul class="btn-tasks">
                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="icon fa fa-tasks tip"  data-placement="left" title="<?= lang("actions") ?>"></i>
                    </a>
                    <ul class="dropdown-menu pull-right tasks-menus" role="menu" aria-labelledby="dLabel">
                        <li>
                            <a <?php if ($count <= 50) { ?> href="<?= admin_url('suppliers/add'); ?>" data-toggle="modal" data-target="#myModal" <?php } else { ?> onclick="alert('You cannot add more than 50 customers please contact to administrator!');" <?php } ?> id="add"><i class="fa fa-plus-circle"></i> <?= lang("add_supplier"); ?></a>
                        </li>
                        <li>
                            <a <?php if ($count <= 50) { ?> href="<?= admin_url('suppliers/import_csv'); ?>" data-toggle="modal" data-target="#myModal" <?php } else { ?> onclick="alert('You cannot add more than 50 customers please contact to administrator!');" <?php } ?> id="add"><i class="fa fa-plus-circle"></i> <?= lang("import_by_csv"); ?></a>
                        </li>
                        <li>
                            <a href="#" id="excel" data-action="export_excel">
                                <i class="fa fa-file-excel-o"></i> <?= lang('export_to_excel') ?>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#" class="bpo" title="<b><?= $this->lang->line("delete_suppliers") ?></b>"
                                data-content="<p><?= lang('r_u_sure') ?></p><button type='button' class='btn btn-danger' id='delete' data-action='delete'><?= lang('i_m_sure') ?></a> <button class='btn bpo-close'><?= lang('no') ?></button>" data-html="true" data-placement="left">
                                <i class="fa fa-trash-o"></i> <?= lang('delete_suppliers') ?>
                            </a>
                        </li>
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
                    <table id="SupData" cellpadding="0" cellspacing="0" border="0"
                           class="table table_theme">
                        <thead>
                        <tr class="primary">
                            <th style="min-width:30px; width: 30px; text-align: center;">
                                <input class="checkbox checkth" type="checkbox" name="check"/>
                            </th>
                            <th><?= lang("company"); ?></th>
                            <th><?= lang("name"); ?></th>
                            <th><?= lang("email_address"); ?></th>
                            <th><?= lang("phone"); ?></th>
                            <th><?= lang("city"); ?></th>
                            <th><?= lang("country"); ?></th>
                            <th><?= lang("vat_no"); ?></th>
                            <th><?= lang("gst_no"); ?></th>
                            <th style="min-width:105px; text-align:center;"><?= lang("actions"); ?></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td colspan="10" class="dataTables_empty"><?= lang('loading_data_from_server') ?></td>
                        </tr>
                        </tbody>
                        <tfoot class="dtFilter">
                        <tr class="active">
                            <th style="min-width:30px; width: 30px; text-align: center;">
                                <input class="checkbox checkft" type="checkbox" name="check"/>
                            </th>
                            <th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th>
                            <th style="min-width:105px;"><?= lang("actions"); ?></th>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div> -->

<?php if ($Owner || $GP['bulk_actions']) { ?>
    <div style="display: none;">
        <input type="hidden" name="form_action" value="" id="form_action" />
        <?= form_submit('performAction', 'performAction', 'id="action-form-submit"') ?>
    </div>
    <?= form_close() ?>
<?php } ?>
<?php if ($action && $action == 'add') {
    echo '<script>$(document).ready(function(){$("#add").trigger("click");});</script>';
}
?>