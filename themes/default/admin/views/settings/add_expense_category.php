<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-2x">&times;</i>
            </button>
            <h4 class="modal-title" id="myModalLabel"><?= lang('add_expense_category'); ?></h4>
        </div>
        <?php $attrib = array('data-toggle' => 'validator', 'role' => 'form');
        echo admin_form_open("system_settings/add_expense_category", $attrib); ?>
        <div class="modal-body">
            <p><?= lang('enter_info'); ?></p>

            <div class="fullFormItems">
                <div class="fullFormItemsListGroup">
                    <div class="fullFormItemsListGroupLabel">
                        <?= lang('category_code', 'code'); ?>
                    </div>
                    <div class="fullFormItemsListGroupInput">
                        <?= form_input('code', '', 'class="form-control" id="code" required="required"'); ?>
                    </div>
                </div>
            </div>
            <div class="fullFormItems" style="margin-bottom: 0;">

                <div class="fullFormItemsListGroup">
                    <div class="fullFormItemsListGroupLabel">
                        <?= lang('category_name', 'name'); ?>
                    </div>
                    <div class="fullFormItemsListGroupInput">
                        <?= form_input('name', '', 'class="form-control" id="name" required="required"'); ?>
                    </div>
                </div>
            </div>

        </div>
        <div class="modal-footer">
            <?= form_submit('add_expense_category', lang('add_expense_category'), 'class="btn btn-primary"'); ?>
        </div>
    </div>
    <?= form_close(); ?>
</div>
<?= $modal_js ?>