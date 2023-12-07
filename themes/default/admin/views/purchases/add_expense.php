<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-2x">&times;</i>
            </button>
            <h4 class="modal-title" id="myModalLabel"><?php echo lang('add_expense'); ?></h4>
        </div>
        <?php $attrib = array('data-toggle' => 'validator', 'role' => 'form');
        echo admin_form_open_multipart("purchases/add_expense", $attrib); ?>
        <div class="modal-body">
            <p><?= lang('enter_info'); ?></p>

            <?php if ($Owner || $Admin) { ?>

                <div class="form-group">
                    <div class="fullFormItemsListGroupLabel">
                        <?= lang("date", "date"); ?>
                    </div>
                    <div class="fullFormItemsListGroupInput">
                        <?= form_input('date', (isset($_POST['date']) ? $_POST['date'] : ""), 'class="form-control datetime" id="date" required="required"'); ?>
                    </div>
                </div>
            <?php } ?>

            <div class="form-group">
                <div class="fullFormItemsListGroupLabel">
                    <?= lang("reference", "reference"); ?>
                </div>
                <div class="fullFormItemsListGroupInput">
                    <?= form_input('reference', (isset($_POST['reference']) ? $_POST['reference'] : $exnumber), 'class="form-control tip" id="reference"'); ?>
                </div>
            </div>

            <div class="form-group">
                <div class="fullFormItemsListGroupLabel">
                    <?= lang('category', 'category'); ?>
                </div>
                <div class="fullFormItemsListGroupInput">
                    <?php
                    $ct[''] = lang('select') . ' ' . lang('category');
                    if ($categories) {
                        foreach ($categories as $category) {
                            $ct[$category->id] = $category->name;
                        }
                    }
                    ?>
                    <?= form_dropdown('category', $ct, set_value('category'), 'class="form-control tip" id="category"'); ?>
                </div>
            </div>

            <div class="form-group">
                <div class="fullFormItemsListGroupLabel">
                    <?= lang("warehouse", "warehouse"); ?>
                </div>
                <div class="fullFormItemsListGroupInput">
                    <?php
                    $wh[''] = lang("select") . ' ' . lang("warehouse");
                    foreach ($warehouses as $warehouse) {
                        $wh[$warehouse->id] = $warehouse->name;
                    }
                    echo form_dropdown('warehouse', $wh, (isset($_POST['warehouse']) ? $_POST['warehouse'] : ''), 'id="warehouse" class="form-control input-tip select" style="width:100%;" ');
                    ?>
                </div>
            </div>

            <div class="form-group">
                <div class="fullFormItemsListGroupLabel">
                    <?= lang("amount", "amount"); ?>
                </div>
                <div class="fullFormItemsListGroupInput">
                    <input name="amount" type="text" id="amount" value="" class="pa form-control kb-pad amount" required="required" />
                </div>
            </div>

            <div class="form-group">
                <div class="fullFormItemsListGroupLabel">
                    <?= lang("attachment", "attachment") ?>
                </div>
                <div class="fullFormItemsListGroupInput">
                    <input id="attachment" type="file" data-browse-label="<?= lang('browse'); ?>" name="userfile" data-show-upload="false" data-show-preview="false" class="">
                </div>
            </div>

            <div class="form-group">
                <div class="fullFormItemsListGroupLabel">
                    <?= lang("note", "note"); ?>
                </div>
                <div class="fullFormItemsListGroupInput">
                    <?php echo form_textarea('note', (isset($_POST['note']) ? $_POST['note'] : ""), 'class="form-control" id="note"'); ?>
                </div>
            </div>

        </div>
        <div class="modal-footer">
            <?php echo form_submit('add_expense', lang('add_expense'), 'class="btn btn-primary"'); ?>
        </div>
    </div>
    <?php echo form_close(); ?>
</div>
<script type="text/javascript" src="<?= $assets ?>js/custom.js"></script>
<script type="text/javascript" charset="UTF-8">
    $.fn.datetimepicker.dates['sma'] = <?= $dp_lang ?>;
</script>
<?= $modal_js ?>
<script type="text/javascript" charset="UTF-8">
    $(document).ready(function() {
        $.fn.datetimepicker.dates['sma'] = <?= $dp_lang ?>;
        $("#date").datetimepicker({
            format: site.dateFormats.js_ldate,
            fontAwesome: true,
            language: 'sma',
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            forceParse: 0
        }).datetimepicker('update', new Date());
    });
</script>