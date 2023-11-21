<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<?php $totalprice = 0; $totalvat = 0; $nettotal = 0; $total1 = 0; $vat1 = 0; $nettotal1 = 0; ?>
<?php if ($modal) { ?>
    <style type="text/css" media="all">
        body { color: #000; }
        #wrapper { max-width: 480px; margin: 0 auto; padding-top: 20px; }
        .btn { border-radius: 0; margin-bottom: 5px; }
        .bootbox .modal-footer { border-top: 0; text-align: center; }
        h3 { margin: 5px 0; }
        .order_barcodes img { float: none !important; margin-top: 5px; }
        @media print {
            .no-print { display: none; }
            #wrapper { max-width: 480px; width: 100%; min-width: 250px; margin: 0 auto; }
            .no-border { border: none !important; }
            .border-bottom { border-bottom: 1px solid #ddd !important; }
            table tfoot { display: table-row-group; }
        }
        /* @media (min-width: 842px){ */
        .top-first {
            /* width: 33.33333333%; */
            float:left;
            width:250px !important;
        }
        .top-second {
            /* width: 33.33333333%; */
            float:left;
            width:200px !important;
        }
        .top-third {
            /* width: 33.33333333%; */
            float:right;
            width:250px !important;
            margin-top:-180px !important;
            margin-right:-22px !important;
        }
        /* } */
        ul li{
            display:inline-block;
        }
        .row-warrenty{
            color:
        }
    </style>
    
    <div class="modal-dialog no-modal-header" role="document"><div class="modal-content"><div class="modal-body">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-2x">&times;</i></button>
    <?php
} else {
    ?><!doctype html>
    <html>
    <head>
        <meta charset="utf-8">
        <title><?=$page_title . " " . lang("no") . " " . $inv->id;?></title>
        <base href="<?=base_url()?>"/>
        <meta http-equiv="cache-control" content="max-age=0"/>
        <meta http-equiv="cache-control" content="no-cache"/>
        <meta http-equiv="expires" content="0"/>
        <meta http-equiv="pragma" content="no-cache"/>
        <link rel="shortcut icon" href="<?=$assets?>images/icon.png"/>
        <link rel="stylesheet" href="<?=$assets?>styles/theme.css" type="text/css"/>
        <style type="text/css" media="all">
            body { color: #000; }
            #wrapper { max-width: 480px; margin: 0 auto; padding-top: 20px; }
            .btn { border-radius: 0; margin-bottom: 5px; }
            .bootbox .modal-footer { border-top: 0; text-align: center; }
            h3 { margin: 5px 0; }
            .order_barcodes img { float: none !important; margin-top: 5px; }
            @media print {
                .no-print { display: none; }
                #wrapper { max-width: 480px; width: 100%; min-width: 250px; margin: 0 auto; }
                .no-border { border: none !important; }
                .border-bottom { border-bottom: 1px solid #ddd !important; }
                table tfoot { display: table-row-group; }
            }
            /* @media (min-width: 842px){ */
            .top-first {
                /* width: 33.33333333%; */
                float:left;
                width:250px;
            }
            .top-second {
                /* width: 33.33333333%; */
                float:left;
                width:200px;
            }
            .top-third {
                /* width: 33.33333333%; */
                float:right;
                width:250px;
            }
            /* } */
            ul li{
                display:inline-block;
            }
            .row-warrenty{
                font-size: 18px !important;
            }
        </style>
    </head>

    <body>
        <?php
    } ?>
    <div id="wrapper" style="max-width:750px !important;">
        <div id="receiptData">
            <div class="no-print">
                <?php
                if ($message) {
                    ?>
                    <div class="alert alert-success">
                        <button data-dismiss="alert" class="close" type="button">×</button>
                        <?=is_array($message) ? print_r($message, true) : $message;?>
                    </div>
                    <?php
                } ?>
            </div>
            <div id="receipt-data">
                <div class="row">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="ibox-content top-first">
                                <address>
                                    <?= !empty($biller->logo) ? '<img width="250px" src="'.base_url('assets/uploads/logos/'.$biller->logo).'" alt="">' : ''; ?><br>
                                    <h3 style="text-transform:uppercase;"><?=$biller->company != '-' ? $biller->company : $biller->name;?></h3><br>
                                    <?php
                                    echo "<p>" . $biller->address . " " . $biller->city . " " . $biller->postal_code . " " . $biller->state . " " . $biller->country . '</p>';

                                    if ($pos_settings->cf_title1 != "" && $pos_settings->cf_value1 != "") {
                                        echo $pos_settings->cf_title1 . ": " . $pos_settings->cf_value1 . "<br>";
                                    }
                                    if ($pos_settings->cf_title2 != "" && $pos_settings->cf_value2 != "") {
                                        echo $pos_settings->cf_title2 . ": " . $pos_settings->cf_value2 . "<br>";
                                    }
                                    echo '</p>';


                                    "<br>" . lang("tel") . ": " . $biller->phone;
                                    // comment or remove these extra info if you don't need
                                    if (!empty($biller->cf1) && $biller->cf1 != "-") {
                                        echo "<br>" . lang("bcf1") . ": " . $biller->cf1;
                                    }
                                    if (!empty($biller->cf2) && $biller->cf2 != "-") {
                                        echo "<br>" . lang("bcf2") . ": " . $biller->cf2;
                                    }
                                    if (!empty($biller->cf3) && $biller->cf3 != "-") {
                                        echo "<br>" . lang("bcf3") . ": " . $biller->cf3;
                                    }
                                    if (!empty($biller->cf4) && $biller->cf4 != "-") {
                                        echo "<br>" . lang("bcf4") . ": " . $biller->cf4;
                                    }
                                    if (!empty($biller->cf5) && $biller->cf5 != "-") {
                                        echo "<br>" . lang("bcf5") . ": " . $biller->cf5;
                                    }
                                    if (!empty($biller->cf6) && $biller->cf6 != "-") {
                                        echo "<br>" . lang("bcf6") . ": " . $biller->cf6;
                                    }
                                    // end of the customer fields
                                    ?><br>
                                </address>
                            </div>
                        </div>
                    </div>
                    <div class"col-lg-12">
                        <hr style = "border:0.5px dashed;">
                    </div>
                    
                    <div class="row">
                        <div class = "col-lg-5 col-sm-5 col-xs-5">
                        <address>
                            <!-- <strong><font color="#21B9BB">Quality Service</font></strong><br> -->
                            <strong>Client:</strong> <?php echo $customer->name; ?><br>
                            <strong>Attention:</strong> <br>
                            <strong>Address:</strong> <?php echo $customer->address; ?><br>
                            <strong>Tel:</strong> <?php echo $customer->phone; ?><br>
                            <strong>Email:</strong> <?php echo $customer->email; ?><br>
                            <strong>Customer VAT Reg No:</strong> <?php if(!empty($customer->vat_no)){echo $customer->vat_no;}else{echo "";} ?><br>
                        </address>
                        </div>
                        <div class = "col-lg-7 col-sm-7 col-xs-7">
                            <table rules="all" style = "border:1px solid;text-align: center; width:100%;margin-top:7px;" class = "col-lg-4 pull-right">
                                    <tbody>
                                    <tr style = "font-weight:bold;">
                                        <td style = "font-weight:bold;">Doc Number</td>
                                        <td style = "font-weight:bold;">Order No:</td>
                                        <td style = "font-weight:bold;width:150px;">Sales Rep</td>
                                        <td style = "font-weight:bold;">Date</td>
                                    </tr>
                                    <tr>
                                        <td> <?php echo $inv->id; ?></td>
                                        <td> </td>
                                        <td><?php echo $created_by->first_name." ".$created_by->last_name; ?></td>
                                        <td><?php echo $this->sma->hrsd($inv->date); ?></td>
                                    </tr>
                                    </tbody>
                            </table>
                        </div>  
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-sm-12 col-xs-12">
                            <table rules="all" style = "border:1px solid; width:100%; margin:0 auto;">
                                        <tbody>
                                        <tr style = "font-weight:bold;">
                                            <td style = "padding-left:2px;">SKU</td>
                                            <td style = "padding-left:2px; width:350px;">Description</td>
                                            <td style = "text-align:center;">Qty</td>
                                            <td style = "text-align:center;">Price Ex. VAT</td>
                                            <td style = "text-align:center;">VAT</td>
                                            <td style = "text-align:center;">Total Incl</td>
                                        </tr>

                                        <?php $tot = 0; foreach ($rows as $row) { ?>
                                                <tr>
                                                    <td style = "padding-left:2px;"><?php echo $row->product_code; ?></td>
                                                    <td style = "padding-left:2px;"><?php echo $row->product_name; ?></td>
                                                    <td style = "text-align:center;"><?php echo number_format($row->quantity, 0); ?></td>
                                                    <td style = "text-align:center;"><?= $row->quantity * $row->net_unit_price; $tot = $row->quantity * $row->net_unit_price; $totalprice += $row->quantity * $row->net_unit_price; ?>Rs</td>
                                                    <td style = "text-align:center;"><?= $row->item_tax; $totalvat += $row->item_tax; ?>Rs</td>
                                                    <td style = "text-align:center;"><?= $row->subtotal; $nettotal += $row->item_tax + $tot;  ?>Rs</td>
                                                </tr>
                                        <?php }  ?>
                                        <!-- <tr>
                                            <td style = "padding-left:2px;">LAB001</td>
                                            <td style = "padding-left:2px;">Labour - Standard Hourly Rate</td>
                                            <td style = "text-align:center;">1</td>
                                            <td style = "text-align:center;">17.39</td>
                                            <td style = "text-align:center;">2.61</td>
                                            <td style = "text-align:center;">20.00</td>
                                        </tr>
                                        <tr>
                                            <td style = "padding-left:2px;">CAL001</td>
                                            <td style = "padding-left:2px;">Call-Out Fee</td>
                                            <td style = "text-align:center;">1</td>
                                            <td style = "text-align:center;">26.09</td>
                                            <td style = "text-align:center;">3.91</td>
                                            <td style = "text-align:center;">30.00</td>
                                        </tr>
                                        <tr>
                                            <td style = "padding-left:2px;">NET016</td>
                                            <td style = "padding-left:2px;">UniFi AP-2.GHz: Std (11dbi) 300Mbps</td>
                                            <td style = "text-align:center;">1</td>
                                            <td style = "text-align:center;">125.58</td>
                                            <td style = "text-align:center;">18.84</td>
                                            <td style = "text-align:center;">144.42</td>
                                        </tr> -->
                                        </tbody>
                                </table>
                                <br>
                                <br>
                        </div>
                    </div>
                    <div class  = "row">
                        <div class = "col-lg-6 col-lg-6 col-sm-6 col-xs-6" style="float: right;">
                            <div class = "pull-right" style = "margin-right:30px;margin-top:15px;">
                                Thank You for your Business.
                            </div>
                            <table rules="all" style = "border:0;text-align: center;margin-top:3px;" width = "100%" class = "pull-right">
                                <tbody>
                                    <tr style = "font-weight:bold;">
                                        <td style = "border:none !important;"></td>
                                        <td>Price Ext VAT</td>
                                        <td>VAT</td>
                                        <td>Price Inc VAT</td>
                                    </tr>
                                    <tr>
                                        <td style = "font-weight:bold;">Totals</td>
                                        <td><?php echo number_format((float)$inv->total, 2); ?>Rs</td>
                                        <td><?php echo number_format((float)$inv->total_tax, 2);?>Rs</td>
                                        <td><?php echo number_format((float)$inv->grand_total, 2); ?>Rs</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                    <!-- <div class="row row-warrenty">
                        <div class="col-lg-4 text-center">
                            <address>
                                <strong><font color="#21B9BB">Genuine Products</font></strong><br>
                            </address>
                        </div>
                        <div class="col-lg-4 text-center">
                            <address>
                                <strong><font color="#21B9BB">Full Warrenty</font></strong><br>
                            </address>
                        </div>
                        <div class="col-lg-4 text-center">
                            <address>
                                <strong><font color="#21B9BB">Quality Service</font></strong><br>
                            </address>
                        </div>
                    </div> -->
                    
                    <!-- <div class = "row" style = "margin-top:100px !important;">
                        <div class = "col-lg-12">
                            <ul style = "list-style-type:none;">
                                <li style="width:175px;"><div><p style = "border-top:1px solid;text-align:center;">Print Name</p></div></li>
                                <li style="width:175px;margin-left:50px;"><div><p style = "border-top:1px solid;text-align:center;">Signature</p></div></li>
                                <li style="width:175px;margin-left:50px;"><div><p style = "border-top:1px solid;text-align:center;">Date</p></div></li>
                            </ul>
                        </div>
                    </div> -->
                    <!-- <div class="row">
                        <div class = "col-lg-12" style = "text-align:center;">
                        <img src="<?php echo base_url(); ?>assets/images/print-footer.png" />
                        </div>
                    </div> -->
                </div>
                <!-- <?php
                if ($Settings->invoice_view == 1 || $Settings->indian_gst) {
                    ?>
                    <div class="col-sm-12 text-center">
                        <h4 style="font-weight:bold;"><?=lang('tax_invoice');?></h4>
                    </div>
                    <?php
                }
                echo "<p>" .lang("date") . ": " . $this->sma->hrld($inv->date) . "<br>";
                echo lang("sale_no_ref") . ": " . $inv->reference_no . "<br>";
                if (!empty($inv->return_sale_ref)) {
                    echo '<p>'.lang("return_ref").': '.$inv->return_sale_ref;
                    if ($inv->return_id) {
                        echo ' <a data-target="#myModal2" data-toggle="modal" href="'.admin_url('sales/modal_view/'.$inv->return_id).'"><i class="fa fa-external-link no-print"></i></a><br>';
                    } else {
                        echo '</p>';
                    }
                }
                echo lang("sales_person") . ": " . $created_by->first_name." ".$created_by->last_name . "</p>";
                echo "<p>";
                echo lang("customer") . ": " . ($customer->company && $customer->company != '-' ? $customer->company : $customer->name) . "<br>";
                if ($pos_settings->customer_details) {
                    if ($customer->vat_no != "-" && $customer->vat_no != "") {
                        echo "<br>" . lang("vat_no") . ": " . $customer->vat_no;
                    }
                    if ($customer->gst_no != "-" && $customer->gst_no != "") {
                        echo "<br>" . lang("gst_no") . ": " . $customer->gst_no;
                    }
                    echo lang("tel") . ": " . $customer->phone . "<br>";
                    echo lang("address") . ": " . $customer->address . "<br>";
                    echo $customer->city ." ".$customer->state." ".$customer->country ."<br>";
                    if (!empty($customer->cf1) && $customer->cf1 != "-") {
                        echo "<br>" . lang("ccf1") . ": " . $customer->cf1;
                    }
                    if (!empty($customer->cf2) && $customer->cf2 != "-") {
                        echo "<br>" . lang("ccf2") . ": " . $customer->cf2;
                    }
                    if (!empty($customer->cf3) && $customer->cf3 != "-") {
                        echo "<br>" . lang("ccf3") . ": " . $customer->cf3;
                    }
                    if (!empty($customer->cf4) && $customer->cf4 != "-") {
                        echo "<br>" . lang("ccf4") . ": " . $customer->cf4;
                    }
                    if (!empty($customer->cf5) && $customer->cf5 != "-") {
                        echo "<br>" . lang("ccf5") . ": " . $customer->cf5;
                    }
                    if (!empty($customer->cf6) && $customer->cf6 != "-") {
                        echo "<br>" . lang("ccf6") . ": " . $customer->cf6;
                    }
                }
                echo "</p>";
                ?> -->

                <div style="clear:both;"></div>
                <!-- <table class="table table-condensed">
                    <tbody>
                        <?php
                        $r = 1; $category = 0;
                        $tax_summary = array();
                        foreach ($rows as $row) {
                            if ($pos_settings->item_order == 1 && $category != $row->category_id) {
                                $category = $row->category_id;
                                echo '<tr><td colspan="100%" class="no-border"><strong>'.$row->category_name.'</strong></td></tr>';
                            }
                            echo '<tr><td colspan="2" class="no-border">#' . $r . ': &nbsp;&nbsp;' . product_name($row->product_name, ($printer ? $printer->char_per_line : null)) . ($row->variant ? ' (' . $row->variant . ')' : '') . '<span class="pull-right">' . ($row->tax_code ? '*'.$row->tax_code : '') . '</span></td></tr>';
                            if (!empty($row->second_name)) {
                                echo '<tr><td colspan="2" class="no-border">'.$row->second_name.'</td></tr>';
                            }
                            echo '<tr><td class="no-border border-bottom">' . $this->sma->formatQuantity($row->unit_quantity) . ' x '.$this->sma->formatMoney($row->unit_price).($row->item_tax != 0 ? ' - '.lang('tax').' <small>('.($Settings->indian_gst ? $row->tax : $row->tax_code).')</small> '.$this->sma->formatMoney($row->item_tax).' ('.lang('hsn_code').': '.$row->hsn_code.')' : '').'</td><td class="no-border border-bottom text-right">' . $this->sma->formatMoney($row->subtotal) . '</td></tr>';

                            $r++;
                        }
                        if ($return_rows) {
                            echo '<tr class="warning"><td colspan="100%" class="no-border"><strong>'.lang('returned_items').'</strong></td></tr>';
                            foreach ($return_rows as $row) {
                                if ($pos_settings->item_order == 1 && $category != $row->category_id) {
                                    $category = $row->category_id;
                                    echo '<tr><td colspan="100%" class="no-border"><strong>'.$row->category_name.'</strong></td></tr>';
                                }
                                echo '<tr><td colspan="2" class="no-border">#' . $r . ': &nbsp;&nbsp;' . product_name($row->product_name, ($printer ? $printer->char_per_line : null)) . ($row->variant ? ' (' . $row->variant . ')' : '') . '<span class="pull-right">' . ($row->tax_code ? '*'.$row->tax_code : '') . '</span></td></tr>';
                                echo '<tr><td class="no-border border-bottom">' . $this->sma->formatQuantity($row->unit_quantity) . ' x '.$this->sma->formatMoney($row->unit_price).($row->item_tax != 0 ? ' - '.lang('tax').' <small>('.($Settings->indian_gst ? $row->tax : $row->tax_code).')</small> '.$this->sma->formatMoney($row->item_tax).' ('.lang('hsn_code').': '.$row->hsn_code.')' : '').'</td><td class="no-border border-bottom text-right">' . $this->sma->formatMoney($row->subtotal) . '</td></tr>';

                                // echo '<tr><td class="no-border border-bottom">' . $this->sma->formatQuantity($row->quantity) . ' x ';
                                // if ($row->item_discount != 0) {
                                //     echo '<del>' . $this->sma->formatMoney($row->net_unit_price + ($row->item_discount / $row->quantity) + ($row->item_tax / $row->quantity)) . '</del> ';
                                // }
                                // echo $this->sma->formatMoney($row->net_unit_price + ($row->item_tax / $row->quantity)) . '</td><td class="no-border border-bottom text-right">' . $this->sma->formatMoney($row->subtotal) . '</td></tr>';
                                $r++;
                            }
                        }

                        ?>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th><?=lang("total");?></th>
                            <th class="text-right"><?=$this->sma->formatMoney($return_sale ? (($inv->total + $inv->product_tax)+($return_sale->total + $return_sale->product_tax)) : ($inv->total + $inv->product_tax));?></th>
                        </tr>
                        <?php
                        if ($inv->order_tax != 0) {
                            echo '<tr><th>' . lang("tax") . '</th><th class="text-right">' . $this->sma->formatMoney($return_sale ? ($inv->order_tax+$return_sale->order_tax) : $inv->order_tax) . '</th></tr>';
                        }
                        if ($inv->order_discount != 0) {
                            echo '<tr><th>' . lang("order_discount") . '</th><th class="text-right">' . $this->sma->formatMoney($inv->order_discount) . '</th></tr>';
                        }

                        if ($inv->shipping != 0) {
                            echo '<tr><th>' . lang("shipping") . '</th><th class="text-right">' . $this->sma->formatMoney($inv->shipping) . '</th></tr>';
                        }

                        if ($return_sale) {
                            if ($return_sale->surcharge != 0) {
                                echo '<tr><th>' . lang("order_discount") . '</th><th class="text-right">' . $this->sma->formatMoney($return_sale->surcharge) . '</th></tr>';
                            }
                        }

                        if ($Settings->indian_gst) {
                            if ($inv->cgst > 0) {
                                $cgst = $return_sale ? $inv->cgst + $return_sale->cgst : $inv->cgst;
                                echo '<tr><td>' . lang('cgst') .'</td><td class="text-right">' . ( $Settings->format_gst ? $this->sma->formatMoney($cgst) : $cgst) . '</td></tr>';
                            }
                            if ($inv->sgst > 0) {
                                $sgst = $return_sale ? $inv->sgst + $return_sale->sgst : $inv->sgst;
                                echo '<tr><td>' . lang('sgst') .'</td><td class="text-right">' . ( $Settings->format_gst ? $this->sma->formatMoney($sgst) : $sgst) . '</td></tr>';
                            }
                            if ($inv->igst > 0) {
                                $igst = $return_sale ? $inv->igst + $return_sale->igst : $inv->igst;
                                echo '<tr><td>' . lang('igst') .'</td><td class="text-right">' . ( $Settings->format_gst ? $this->sma->formatMoney($igst) : $igst) . '</td></tr>';
                            }
                        }

                        if ($pos_settings->rounding || $inv->rounding != 0) {
                            ?>
                            <tr>
                                <th><?=lang("rounding");?></th>
                                <th class="text-right"><?= $this->sma->formatMoney($inv->rounding);?></th>
                            </tr>
                            <tr>
                                <th><?=lang("grand_total");?></th>
                                <th class="text-right"><?=$this->sma->formatMoney($return_sale ? (($inv->grand_total + $inv->rounding)+$return_sale->grand_total) : ($inv->grand_total + $inv->rounding));?></th>
                            </tr>
                            <?php
                        } else {
                            ?>
                            <tr>
                                <th><?=lang("grand_total");?></th>
                                <th class="text-right"><?=$this->sma->formatMoney($return_sale ? ($inv->grand_total+$return_sale->grand_total) : $inv->grand_total);?></th>
                            </tr>
                            <?php
                        }
                        if ($inv->paid < ($inv->grand_total + $inv->rounding)) {
                            ?>
                            <tr>
                                <th><?=lang("paid_amount");?></th>
                                <th class="text-right"><?=$this->sma->formatMoney($return_sale ? ($inv->paid+$return_sale->paid) : $inv->paid);?></th>
                            </tr>
                            <tr>
                                <th><?=lang("due_amount");?></th>
                                <th class="text-right"><?=$this->sma->formatMoney(($return_sale ? (($inv->grand_total + $inv->rounding)+$return_sale->grand_total) : ($inv->grand_total + $inv->rounding)) - ($return_sale ? ($inv->paid+$return_sale->paid) : $inv->paid));?></th>
                            </tr>
                            <?php
                        } ?>
                    </tfoot>
                </table> -->
                <!-- <?php
                if ($payments) {
                    echo '<table class="table table-striped table-condensed"><tbody>';
                    foreach ($payments as $payment) {
                        echo '<tr>';
                        if (($payment->paid_by == 'cash' || $payment->paid_by == 'deposit') && $payment->pos_paid) {
                            echo '<td>' . lang("paid_by") . ': ' . lang($payment->paid_by) . '</td>';
                            echo '<td colspan="2">' . lang("amount") . ': ' . $this->sma->formatMoney($payment->pos_paid == 0 ? $payment->amount : $payment->pos_paid) . ($payment->return_id ? ' (' . lang('returned') . ')' : '') . '</td>';
                            echo '<td>' . lang("change") . ': ' . ($payment->pos_balance > 0 ? $this->sma->formatMoney($payment->pos_balance) : 0) . '</td>';
                        } elseif (($payment->paid_by == 'CC' || $payment->paid_by == 'ppp' || $payment->paid_by == 'stripe') && $payment->cc_no) {
                            echo '<td>' . lang("paid_by") . ': ' . lang($payment->paid_by) . '</td>';
                            echo '<td>' . lang("amount") . ': ' . $this->sma->formatMoney($payment->pos_paid) . ($payment->return_id ? ' (' . lang('returned') . ')' : '') . '</td>';
                            echo '<td>' . lang("no") . ': ' . 'xxxx xxxx xxxx ' . substr($payment->cc_no, -4) . '</td>';
                            echo '<td>' . lang("name") . ': ' . $payment->cc_holder . '</td>';
                        } elseif ($payment->paid_by == 'Cheque' && $payment->cheque_no) {
                            echo '<td>' . lang("paid_by") . ': ' . lang($payment->paid_by) . '</td>';
                            echo '<td colspan="2">' . lang("amount") . ': ' . $this->sma->formatMoney($payment->pos_paid) . ($payment->return_id ? ' (' . lang('returned') . ')' : '') . '</td>';
                            echo '<td>' . lang("cheque_no") . ': ' . $payment->cheque_no . '</td>';
                        } elseif ($payment->paid_by == 'gift_card' && $payment->pos_paid) {
                            echo '<td>' . lang("paid_by") . ': ' . lang($payment->paid_by) . '</td>';
                            echo '<td>' . lang("no") . ': ' . $payment->cc_no . '</td>';
                            echo '<td>' . lang("amount") . ': ' . $this->sma->formatMoney($payment->pos_paid) . ($payment->return_id ? ' (' . lang('returned') . ')' : '') . '</td>';
                            echo '<td>' . lang("balance") . ': ' . $this->sma->formatMoney($this->sma->getCardBalance($payment->cc_no)) . '</td>';
                        } elseif ($payment->paid_by == 'other' && $payment->amount) {
                            echo '<td colspan="2">' . lang("paid_by") . ': ' . lang($payment->paid_by) . '</td>';
                            echo '<td colspan="2">' . lang("amount") . ': ' . $this->sma->formatMoney($payment->pos_paid == 0 ? $payment->amount : $payment->pos_paid) . ($payment->return_id ? ' (' . lang('returned') . ')' : '') . '</td>';
                            echo $payment->note ? '</tr><td colspan="4">' . lang("payment_note") . ': ' . $payment->note . '</td>' : '';
                        }
                        echo '</tr>';
                    }
                    echo '</tbody></table>';
                }

                if ($return_payments) {
                    echo '<strong>'.lang('return_payments').'</strong><table class="table table-striped table-condensed"><tbody>';
                    foreach ($return_payments as $payment) {
                        $payment->amount = (0-$payment->amount);
                        echo '<tr>';
                        if (($payment->paid_by == 'cash' || $payment->paid_by == 'deposit') && $payment->pos_paid) {
                            echo '<td>' . lang("paid_by") . ': ' . lang($payment->paid_by) . '</td>';
                            echo '<td colspan="2">' . lang("amount") . ': ' . $this->sma->formatMoney($payment->pos_paid == 0 ? $payment->amount : $payment->pos_paid) . ($payment->return_id ? ' (' . lang('returned') . ')' : '') . '</td>';
                            echo '<td>' . lang("change") . ': ' . ($payment->pos_balance > 0 ? $this->sma->formatMoney($payment->pos_balance) : 0) . '</td>';
                        } elseif (($payment->paid_by == 'CC' || $payment->paid_by == 'ppp' || $payment->paid_by == 'stripe') && $payment->cc_no) {
                            echo '<td>' . lang("paid_by") . ': ' . lang($payment->paid_by) . '</td>';
                            echo '<td>' . lang("amount") . ': ' . $this->sma->formatMoney($payment->pos_paid) . ($payment->return_id ? ' (' . lang('returned') . ')' : '') . '</td>';
                            echo '<td>' . lang("no") . ': ' . 'xxxx xxxx xxxx ' . substr($payment->cc_no, -4) . '</td>';
                            echo '<td>' . lang("name") . ': ' . $payment->cc_holder . '</td>';
                        } elseif ($payment->paid_by == 'Cheque' && $payment->cheque_no) {
                            echo '<td>' . lang("paid_by") . ': ' . lang($payment->paid_by) . '</td>';
                            echo '<td colspan="2">' . lang("amount") . ': ' . $this->sma->formatMoney($payment->pos_paid) . ($payment->return_id ? ' (' . lang('returned') . ')' : '') . '</td>';
                            echo '<td>' . lang("cheque_no") . ': ' . $payment->cheque_no . '</td>';
                        } elseif ($payment->paid_by == 'gift_card' && $payment->pos_paid) {
                            echo '<td>' . lang("paid_by") . ': ' . lang($payment->paid_by) . '</td>';
                            echo '<td>' . lang("no") . ': ' . $payment->cc_no . '</td>';
                            echo '<td>' . lang("amount") . ': ' . $this->sma->formatMoney($payment->pos_paid) . ($payment->return_id ? ' (' . lang('returned') . ')' : '') . '</td>';
                            echo '<td>' . lang("balance") . ': ' . $this->sma->formatMoney($this->sma->getCardBalance($payment->cc_no)) . '</td>';
                        } elseif ($payment->paid_by == 'other' && $payment->amount) {
                            echo '<td colspan="2">' . lang("paid_by") . ': ' . lang($payment->paid_by) . '</td>';
                            echo '<td colspan="2">' . lang("amount") . ': ' . $this->sma->formatMoney($payment->pos_paid == 0 ? $payment->amount : $payment->pos_paid) . ($payment->return_id ? ' (' . lang('returned') . ')' : '') . '</td>';
                            echo $payment->note ? '</tr><td colspan="4">' . lang("payment_note") . ': ' . $payment->note . '</td>' : '';
                        }
                        echo '</tr>';
                    }
                    echo '</tbody></table>';
                }
                ?> -->

                <?= $Settings->invoice_view > 0 ? $this->gst->summary($rows, $return_rows, ($return_sale ? $inv->product_tax+$return_sale->product_tax : $inv->product_tax)) : ''; ?>

                <?= $customer->award_points != 0 && $Settings->each_spent > 0 ? '<p class="text-center">'.lang('this_sale').': '.floor(($inv->grand_total/$Settings->each_spent)*$Settings->ca_point)
                .'<br>'.
                lang('total').' '.lang('award_points').': '. $customer->award_points . '</p>' : ''; ?>
                <!-- <?= $inv->note ? '<p class="text-center">' . $this->sma->decode_html($inv->note) . '</p>' : ''; ?> -->
                <?= $inv->staff_note ? '<p class="no-print"><strong>' . lang('staff_note') . ':</strong> ' . $this->sma->decode_html($inv->staff_note) . '</p>' : ''; ?>
                <!-- <?= $biller->invoice_footer ? '<p class="text-center">'.$this->sma->decode_html($biller->invoice_footer).'</p>' : ''; ?> -->
            </div>

            <!-- <div class="order_barcodes text-center">
                <img src="<?= admin_url('misc/barcode/'.$this->sma->base64url_encode($inv->reference_no).'/code128/74/0/1'); ?>" alt="<?= $inv->reference_no; ?>" class="bcimg" />
                <br>
                <?= $this->sma->qrcode('link', urlencode(admin_url('sales/view/' . $inv->id)), 2); ?>
            </div>
            <div style="clear:both;"></div> -->
        </div>

        <div id="buttons" style="padding-top:10px; text-transform:uppercase;" class="no-print">
            <hr>
            <?php
            if ($message) {
                ?>
                <div class="alert alert-success">
                    <button data-dismiss="alert" class="close" type="button">×</button>
                    <?=is_array($message) ? print_r($message, true) : $message;?>
                </div>
                <?php
            } ?>
            <?php
            if ($modal) {
                ?>
                <div class="btn-group btn-group-justified" role="group" aria-label="...">
                    <div class="btn-group" role="group">
                        <?php
                        if ($pos->remote_printing == 1) {
                            echo '<button onclick="window.print();" class="btn btn-block btn-primary">'.lang("print").'</button>';
                        } else {
                            echo '<button onclick="return printReceipt()" class="btn btn-block btn-primary">'.lang("print").'</button>';
                        }

                        ?>
                    </div>
                    <div class="btn-group" role="group">
                        <a class="btn btn-block btn-success" href="#" id="email"><?= lang("email"); ?></a>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default" data-dismiss="modal"><?= lang('close'); ?></button>
                    </div>
                </div>
                <?php
            } else {
                ?>
                <span class="pull-right col-xs-12">
                    <?php
                    if ($pos->remote_printing == 1) {
                        echo '<button onclick="window.print();" class="btn btn-block btn-primary">'.lang("print").'</button>';
                    } else {
                        echo '<button onclick="return printReceipt()" class="btn btn-block btn-primary">'.lang("print").'</button>';
                        echo '<button onclick="return openCashDrawer()" class="btn btn-block btn-default">'.lang("open_cash_drawer").'</button>';
                    }
                    ?>
                </span>
                <span class="pull-left col-xs-12"><a class="btn btn-block btn-success" href="#" id="email"><?= lang("email"); ?></a></span>
                <span class="col-xs-12">
                    <a class="btn btn-block btn-warning" href="<?= admin_url('pos'); ?>"><?= lang("back_to_pos"); ?></a>
                </span>
                <?php
            }
            if ($pos->remote_printing == 1) {
                ?>
                <div style="clear:both;"></div>
                <div class="col-xs-12" style="background:#F5F5F5; padding:10px;">
                    <p style="font-weight:bold;">
                        Please don't forget to disble the header and footer in browser print settings.
                    </p>
                    <p style="text-transform: capitalize;">
                        <strong>FF:</strong> File &gt; Print Setup &gt; Margin &amp; Header/Footer Make all --blank--
                    </p>
                    <p style="text-transform: capitalize;">
                        <strong>chrome:</strong> Menu &gt; Print &gt; Disable Header/Footer in Option &amp; Set Margins to None
                    </p>
                </div>
                <?php
            } ?>
            <div style="clear:both;"></div>
        </div>
    </div>

    <?php
    if( ! $modal) {
        ?>
        <script type="text/javascript" src="<?= $assets ?>js/jquery-2.0.3.min.js"></script>
        <script type="text/javascript" src="<?= $assets ?>js/bootstrap.min.js"></script>
        <script type="text/javascript" src="<?= $assets ?>js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="<?= $assets ?>js/custom.js"></script>
        <?php
    }
    ?>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#email').click(function () {
                bootbox.prompt({
                    title: "<?= lang("email_address"); ?>",
                    inputType: 'email',
                    value: "<?= $customer->email; ?>",
                    callback: function (email) {
                        if (email != null) {
                            $.ajax({
                                type: "post",
                                url: "<?= admin_url('pos/email_receipt') ?>",
                                data: {<?= $this->security->get_csrf_token_name(); ?>: "<?= $this->security->get_csrf_hash(); ?>", email: email, id: <?= $inv->id; ?>},
                                dataType: "json",
                                success: function (data) {
                                    bootbox.alert({message: data.msg, size: 'small'});
                                },
                                error: function () {
                                    bootbox.alert({message: '<?= lang('ajax_request_failed'); ?>', size: 'small'});
                                    return false;
                                }
                            });
                        }
                    }
                });
                return false;
            });
        });

        <?php
        if ($pos_settings->remote_printing == 1) {
            ?>
            $(window).load(function () {
                window.print();
                return false;
            });
            <?php
        }
        ?>

    </script>
    <?php /* include FCPATH.'themes'.DIRECTORY_SEPARATOR.$Settings->theme.DIRECTORY_SEPARATOR.'views'.DIRECTORY_SEPARATOR.'pos'.DIRECTORY_SEPARATOR.'remote_printing.php'; */ ?>
    <?php include 'remote_printing.php'; ?>
    <?php
    if($modal) {
        ?>
    </div>
</div>
</div>
<?php
} else {
    ?>
</body>
</html>
<?php
}
?>
