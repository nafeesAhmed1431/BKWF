<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<div class="modal-dialog modal-lg">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-2x">&times;</i></button>
            <h4 class="modal-title" id="myModalLabel"><?php echo lang('add_supplier'); ?></h4>
        </div>
        <?php $attrib = array('data-toggle' => 'validator', 'role' => 'form');
        echo admin_form_open_multipart("suppliers/add", $attrib); ?>
        <div class="modal-body">
            <!-- <p><?= lang('enter_info'); ?></p> -->

            <!--<div class="form-group">
                    <?= lang("type", "type"); ?>
                    <?php $types = array('company' => lang('company'), 'person' => lang('person'));
                    echo form_dropdown('type', $types, '', 'class="form-control select" id="type" required="required"'); ?>
                </div> -->

            <div class="row">
                <div class="fullFormItemsList">
                    <div class="form-group company fullFormItemsListGroup">
                        <div class="fullFormItemsListGroupLabel">
                            <?= lang("company", "company"); ?>
                        </div>
                        <div class="fullFormItemsListGroupInput">
                            <?php echo form_input('company', '', 'class="form-control tip" id="company" data-bv-notempty="true"'); ?>
                        </div>
                    </div>
                    <div class="form-group person fullFormItemsListGroup">
                        <div class="fullFormItemsListGroupLabel">
                            <?= lang("name", "name"); ?>
                        </div>
                        <div class="fullFormItemsListGroupInput">
                            <?php echo form_input('name', '', 'class="form-control tip" id="name" data-bv-notempty="true"'); ?>
                        </div>
                    </div>
                    <div class="form-group fullFormItemsListGroup">
                        <div class="fullFormItemsListGroupLabel">
                            <?= lang("opening_balance", "opening_balance"); ?>
                        </div>
                        <div class="fullFormItemsListGroupInput">
                            <?php //echo form_input('opening_balance', '', 'class="form-control" id="opening_balance"'); 
                            ?>
                            <input type="number" name="opening_balance" value="0" class="form-control" id="opening_balance">
                        </div>
                    </div>
                    <div class="form-group fullFormItemsListGroup">
                        <div class="fullFormItemsListGroupLabel">
                            <?= lang("vat_no", "vat_no"); ?>
                        </div>
                        <div class="fullFormItemsListGroupInput">
                            <?php echo form_input('vat_no', '', 'class="form-control" id="vat_no"'); ?>
                        </div>
                    </div>
                    <div class="form-group fullFormItemsListGroup">
                        <div class="fullFormItemsListGroupLabel">
                            <?= lang("gst_no", "gst_no"); ?>
                        </div>
                        <div class="fullFormItemsListGroupInput">
                            <?php echo form_input('gst_no', '', 'class="form-control" id="gst_no"'); ?>
                        </div>
                    </div>
                    <!--<div class="form-group company fullFormItemsListGroup">
                        <div class="fullFormItemsListGroupLabel">
                            <?= lang("contact_person", "contact_person"); ?>
                        </div>
                        <div class="fullFormItemsListGroupInput">
                            <?php echo form_input('contact_person', '', 'class="form-control" id="contact_person" data-bv-notempty="true"'); ?>
                        </div>
                    </div>-->
                    <div class="form-group fullFormItemsListGroup">
                        <div class="fullFormItemsListGroupLabel">
                            <?= lang("email_address", "email_address"); ?>
                        </div>
                        <div class="fullFormItemsListGroupInput">
                            <input type="email" name="email" class="form-control" required="required" id="email_address" />
                        </div>
                    </div>
                    <div class="form-group fullFormItemsListGroup">
                        <div class="fullFormItemsListGroupLabel">
                            <?= lang("phone", "phone"); ?>
                        </div>
                        <div class="fullFormItemsListGroupInput">
                            <input type="tel" name="phone" class="form-control" required="required" id="phone" />
                        </div>
                    </div>
                    <div class="form-group fullFormItemsListGroup">
                        <div class="fullFormItemsListGroupLabel">
                            <?= lang("address", "address"); ?>
                        </div>
                        <div class="fullFormItemsListGroupInput">
                            <?php echo form_input('address', '', 'class="form-control" id="address" required="required"'); ?>
                        </div>
                    </div>
                    <div class="form-group fullFormItemsListGroup">
                        <div class="fullFormItemsListGroupLabel">
                            <?= lang("city", "city"); ?>
                        </div>
                        <div class="fullFormItemsListGroupInput">
                            <?php echo form_input('city', '', 'class="form-control" id="city" required="required"'); ?>
                        </div>
                    </div>
                    <div class="form-group fullFormItemsListGroup">
                        <div class="fullFormItemsListGroupLabel">
                            <?= lang("state", "state"); ?>
                        </div>
                        <div class="fullFormItemsListGroupInput">
                            <?php
                            if ($Settings->indian_gst) {
                                $states = $this->gst->getIndianStates(true);
                                echo form_dropdown('state', $states, '', 'class="form-control select" id="state" required="required"');
                            } else {
                                echo form_input('state', '', 'class="form-control" id="state"');
                            }
                            ?>
                        </div>
                    </div>
                    <div class="form-group fullFormItemsListGroup">
                        <div class="fullFormItemsListGroupLabel">
                            <?= lang("postal_code", "postal_code"); ?>
                        </div>
                        <div class="fullFormItemsListGroupInput">
                            <?php echo form_input('postal_code', '', 'class="form-control" id="postal_code"'); ?>
                        </div>
                    </div>
                    <div class="form-group fullFormItemsListGroup">
                        <div class="fullFormItemsListGroupLabel">
                            <?= lang("country", "country"); ?>
                        </div>
                        <div class="fullFormItemsListGroupInput">
                            <?php echo form_input('country', '', 'class="form-control" id="country"'); ?>
                        </div>
                    </div>
                    <div class="form-group fullFormItemsListGroup">
                        <div class="fullFormItemsListGroupLabel">
                            <?= lang("scf1", "cf1"); ?>
                        </div>
                        <div class="fullFormItemsListGroupInput">
                            <?php echo form_input('cf1', '', 'class="form-control" id="cf1"'); ?>
                        </div>
                    </div>
                    <div class="form-group fullFormItemsListGroup">
                        <div class="fullFormItemsListGroupLabel">
                            <?= lang("scf2", "cf2"); ?>
                        </div>
                        <div class="fullFormItemsListGroupInput">
                            <?php echo form_input('cf2', '', 'class="form-control" id="cf2"'); ?>
                        </div>

                    </div>
                    <div class="form-group fullFormItemsListGroup">
                        <div class="fullFormItemsListGroupLabel">
                            <?= lang("scf3", "cf3"); ?>
                        </div>
                        <div class="fullFormItemsListGroupInput">
                            <?php echo form_input('cf3', '', 'class="form-control" id="cf3"'); ?>
                        </div>
                    </div>
                    <div class="form-group fullFormItemsListGroup">
                        <div class="fullFormItemsListGroupLabel">
                            <?= lang("scf4", "cf4"); ?>
                        </div>
                        <div class="fullFormItemsListGroupInput">
                            <?php echo form_input('cf4', '', 'class="form-control" id="cf4"'); ?>
                        </div>

                    </div>
                    <div class="form-group fullFormItemsListGroup">
                        <div class="fullFormItemsListGroupLabel">
                            <?= lang("scf5", "cf5"); ?>
                        </div>
                        <div class="fullFormItemsListGroupInput">
                            <?php echo form_input('cf5', '', 'class="form-control" id="cf5"'); ?>
                        </div>

                    </div>
                    <div class="form-group fullFormItemsListGroup">
                        <div class="fullFormItemsListGroupLabel">
                            <?= lang("scf6", "cf6"); ?>
                        </div>
                        <div class="fullFormItemsListGroupInput">
                            <?php echo form_input('cf6', '', 'class="form-control" id="cf6"'); ?>
                        </div>
                    </div>
                </div>
            </div>


        </div>
        <div class="modal-footer">
            <?php echo form_submit('add_supplier', lang('add_supplier'), 'class="btn btn-primary"'); ?>
        </div>
    </div>
    <?php echo form_close(); ?>
</div>
<?= $modal_js ?>