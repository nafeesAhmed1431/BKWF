<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= $this->lang->line('sale') . ' ' . $inv->reference_no; ?></title>
    <link href="<?= $assets ?>styles/pdf/bootstrap.min.css" rel="stylesheet">
    <link href="<?= $assets ?>styles/pdf/pdf.css" rel="stylesheet">
</head>
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
                margin-top:-100px !important;
            }
            .top-second {
                width:200px;
                margin-left:285px !important;
                margin-top:-162px !important;
            }
            .top-third {
                /* width: 33.33333333%; */
                width:550px;
                margin-top:-200px !important;
                float:right !important;
                margin-left:490px !important;
            }
            .totaltabletop{
                border:1px solid !important;
                text-align: center !important;
                float:right !important;
                margin-left:490px !important;
                width:300px !important;
            }
            .cusacctable{
                border:1px solid !important;
                text-align: center !important;
                margin-top:-72px !important;
                width:425px !important;
                margin-left:1px !important;
                /* margin-right:-350px !important; */
            }
            .docandcuscontainer{
                margin-left:350px !important;
            }
            .doctable{
                border:1px solid !important;
                text-align: center !important;                
                margin-top:5px !important;
                width:425px !important;
            }
            .totaltablebottom{
                margin-left:425px !important;
                margin-top:-72px !important;
            }
            .thanknote{
                padding-left:100px !important;
                margin-top:15px !important;
            }
            /* } */
            ul li{
                display:inline-block;
            }
            table, th, td {
                border: 1px solid black !important;
            }
            .space{
                margin-top:150px !important;
            }
            .sig-ul{
                list-style-type:none !important;
            }
            .li1{
                width:150px !important;
            }
            .li2{
                width:150px !important;
                margin-left:285px !important;
                margin-top:-30px !important
            }
            .li3{
                width:150px !important;
                margin-left:575px !important;
                margin-top:-30px !important
            }
            .sig-p-style{
                border-top:1px solid !important;
                text-align:center !important;
            }
            .panel-body{
                border:1px solid !important;
            }
            .row-warrenty{
                font-size: 18px !important;
            }
        </style>
<body>
<!-- <div id="wrap"> -->
    <!-- <div class="row">
        <div class="col-lg-12">
            <?php if ($logo) {
                $path = base_url() . 'assets/uploads/logos/' . $biller->logo;
                $type = pathinfo($path, PATHINFO_EXTENSION);
                $data = file_get_contents($path);
                $base64 = 'data:image/' . $type . ';base64,' . base64_encode($data);
                ?>
                <div class="text-center" style="margin-bottom:20px;">
                    <img src="<?= $base64; ?>" alt="<?= $biller->company != '-' ? $biller->company : $biller->name; ?>">
                </div>
            <?php }
            ?>
            <div class="clearfix"></div>
            <div class="padding10">
                <?php if ($Settings->invoice_view == 1) { ?>
                    <div class="col-xs-12 text-center">
                        <h1><?= lang('tax_invoice'); ?></h1>
                    </div>
                <?php } ?>

                <div class="col-xs-5">
                    <?php echo $this->lang->line("to"); ?>:
                    <h2 class=""><?= $customer->company && $customer->company != '-' ? $customer->company : $customer->name; ?></h2>
                    <?= $customer->company && $customer->company != '-' ? '' : 'Attn: ' . $customer->name; ?>
                    <?php
                        echo $customer->address . '<br />' . $customer->city . ' ' . $customer->postal_code . ' ' . $customer->state . '<br />' . $customer->country;
                        echo '<p>';
                        if ($customer->vat_no != "-" && $customer->vat_no != "") {
                            echo "<br>" . lang("vat_no") . ": " . $customer->vat_no;
                        }
                        if ($customer->gst_no != "-" && $customer->gst_no != "") {
                            echo "<br>" . lang("gst_no") . ": " . $customer->gst_no;
                        }
                        if ($customer->cf1 != '-' && $customer->cf1 != '') {
                            echo '<br>' . lang('ccf1') . ': ' . $customer->cf1;
                        }
                        if ($customer->cf2 != '-' && $customer->cf2 != '') {
                            echo '<br>' . lang('ccf2') . ': ' . $customer->cf2;
                        }
                        if ($customer->cf3 != '-' && $customer->cf3 != '') {
                            echo '<br>' . lang('ccf3') . ': ' . $customer->cf3;
                        }
                        if ($customer->cf4 != '-' && $customer->cf4 != '') {
                            echo '<br>' . lang('ccf4') . ': ' . $customer->cf4;
                        }
                        if ($customer->cf5 != '-' && $customer->cf5 != '') {
                            echo '<br>' . lang('ccf5') . ': ' . $customer->cf5;
                        }
                        if ($customer->cf6 != '-' && $customer->cf6 != '') {
                            echo '<br>' . lang('ccf6') . ': ' . $customer->cf6;
                        }
                        echo '</p>';
                        echo lang('tel') . ': ' . $customer->phone . '<br />' . lang('email') . ': ' . $customer->email;
                    ?>
                </div>

                <div class="col-xs-5">
                    <?php echo $this->lang->line("from"); ?>:
                    <h2 class=""><?= $biller->company != '-' ? $biller->company : $biller->name; ?></h2>
                    <?= $biller->company ? '' : 'Attn: ' . $biller->name; ?>
                    <?php
                        echo $biller->address . '<br />' . $biller->city . ' ' . $biller->postal_code . ' ' . $biller->state . '<br />' . $biller->country;
                        echo '<p>';
                        if ($biller->vat_no != "-" && $biller->vat_no != "") {
                            echo "<br>" . lang("vat_no") . ": " . $biller->vat_no;
                        }
                        if ($biller->gst_no != "-" && $biller->gst_no != "") {
                            echo "<br>" . lang("gst_no") . ": " . $biller->gst_no;
                        }
                        if ($biller->cf1 != '-' && $biller->cf1 != '') {
                            echo '<br>' . lang('bcf1') . ': ' . $biller->cf1;
                        }
                        if ($biller->cf2 != '-' && $biller->cf2 != '') {
                            echo '<br>' . lang('bcf2') . ': ' . $biller->cf2;
                        }
                        if ($biller->cf3 != '-' && $biller->cf3 != '') {
                            echo '<br>' . lang('bcf3') . ': ' . $biller->cf3;
                        }
                        if ($biller->cf4 != '-' && $biller->cf4 != '') {
                            echo '<br>' . lang('bcf4') . ': ' . $biller->cf4;
                        }
                        if ($biller->cf5 != '-' && $biller->cf5 != '') {
                            echo '<br>' . lang('bcf5') . ': ' . $biller->cf5;
                        }
                        if ($biller->cf6 != '-' && $biller->cf6 != '') {
                            echo '<br>' . lang('bcf6') . ': ' . $biller->cf6;
                        }
                        echo '</p>';
                        echo lang('tel') . ': ' . $biller->phone . '<br />' . lang('email') . ': ' . $biller->email;
                    ?>
                    <div class="clearfix"></div>
                </div>

            </div>
            <div class="clearfix"></div>
            <div class="padding10">
                <div class="col-xs-5">
                    <span style="font-weight:bold;"><?= lang('warehouse'); ?></span>:<br>
                    <span class="bold"><?= $Settings->site_name; ?></span><br>
                    <?= $warehouse->name ?>

                    <?php
                        echo $warehouse->address . '<br>';
                        echo ($warehouse->phone ? lang('tel') . ': ' . $warehouse->phone . '<br>' : '') . ($warehouse->email ? lang('email') . ': ' . $warehouse->email : '');
                    ?>
                    <div class="clearfix"></div>
                </div>
                <div class="col-xs-5">
                    <div class="bold">
                        <?= lang('date'); ?>: <?= $this->sma->hrld($inv->date); ?><br>
                        <?= lang('ref'); ?>: <?= $inv->reference_no; ?><br>
                        <?php if (!empty($inv->return_sale_ref)) {
                            echo lang("return_ref").': '.$inv->return_sale_ref.'<br>';
                        } ?>
                        <div class="order_barcodes barcode">
                            <?php
                            $path = admin_url('misc/barcode/'.$this->sma->base64url_encode($inv->reference_no).'/code128/74/0/1');
                            $type = $Settings->barcode_img ? 'png' : 'svg+xml';
                            $data = file_get_contents($path);
                            $base64 = 'data:image/' . $type . ';base64,' . base64_encode($data);
                            ?>
                            <img src="<?= $base64; ?>" alt="<?= $inv->reference_no; ?>" class="bcimg" />
                            <?php /*echo $this->sma->qrcode('link', urlencode(admin_url('sales/view/' . $inv->id)), 2);*/ ?>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>

            <div class="clearfix"></div>
            <?php
                $col = $Settings->indian_gst ? 5 : 4;
                if ( $Settings->product_discount && $inv->product_discount != 0) {
                    $col++;
                }
                if ($Settings->tax1 && $inv->product_tax > 0) {
                    $col++;
                }
                if ( $Settings->product_discount && $inv->product_discount != 0 && $Settings->tax1 && $inv->product_tax > 0) {
                    $tcol = $col - 2;
                } elseif ( $Settings->product_discount && $inv->product_discount != 0) {
                    $tcol = $col - 1;
                } elseif ($Settings->tax1 && $inv->product_tax > 0) {
                    $tcol = $col - 1;
                } else {
                    $tcol = $col;
                }
            ?>
            <div class="col-xs-12" style="margin-top: 15px;">
            <div class="table-responsive">
                <table class="table table-bordered table-hover table-striped">
                    <thead>
                    <tr>
                        <th><?= lang('no'); ?></th>
                        <th><?= lang('description'); ?></th>
                        <?php if ($Settings->indian_gst) { ?>
                            <th><?= lang("hsn_code"); ?></th>
                        <?php } ?>
                        <th><?= lang('quantity'); ?></th>
                        <th><?= lang('unit_price'); ?></th>
                        <?php
                            if ($Settings->tax1 && $inv->product_tax > 0) {
                                echo '<th>' . lang('tax') . '</th>';
                            }
                            if ( $Settings->product_discount && $inv->product_discount != 0) {
                                echo '<th>' . lang('discount') . '</th>';
                            }
                        ?>
                        <th><?= lang('subtotal'); ?></th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php $r = 1;
                        foreach ($rows as $row):
                            ?>
                            <tr>
                                <td style="text-align:center; width:40px; vertical-align:middle;"><?= $r; ?></td>
                                <td style="vertical-align:middle;">
                                    <?= $row->product_code.' - '.$row->product_name . ($row->variant ? ' (' . $row->variant . ')' : ''); ?>
                                    <?= $row->second_name ? '<br>' . $row->second_name : ''; ?>
                                    <?= $row->details ? '<br>' . $row->details : ''; ?>
                                    <?= $row->serial_no ? '<br>' . $row->serial_no : ''; ?>
                                </td>
                                <?php if ($Settings->indian_gst) { ?>
                                <td style="width: 80px; text-align:center; vertical-align:middle;"><?= $row->hsn_code; ?></td>
                                <?php } ?>
                                <td style="width: 80px; text-align:center; vertical-align:middle;"><?= $this->sma->formatQuantity($row->unit_quantity).' '.$row->product_unit_code; ?></td>
                                <td style="text-align:right; width:90px;"><?= $this->sma->formatMoney($row->unit_price); ?></td>
                                <?php
                                    if ($Settings->tax1 && $inv->product_tax > 0) {
                                        echo '<td style="width: 90px; text-align:right; vertical-align:middle;">' . ($row->item_tax != 0 ? '<small>(' . ($Settings->indian_gst ? $row->tax : $row->tax_code) . ')</small> ' : '') . $this->sma->formatMoney($row->item_tax) . '</td>';
                                    }
                                    if ( $Settings->product_discount && $inv->product_discount != 0) {
                                        echo '<td style="width: 90px; text-align:right; vertical-align:middle;">' . ($row->discount != 0 ? '<small>(' . $row->discount . ')</small> ' : '') . $this->sma->formatMoney($row->item_discount) . '</td>';
                                    }
                                ?>
                                <td style="vertical-align:middle; text-align:right; width:110px;"><?= $this->sma->formatMoney($row->subtotal); ?></td>
                            </tr>
                            <?php
                            $r++;
                        endforeach;
                        if ($return_rows) {
                            echo '<tr class="warning"><td colspan="'.($col+1).'" class="no-border"><strong>'.lang('returned_items').'</strong></td></tr>';
                            foreach ($return_rows as $row):
                            ?>
                                <tr class="warning">
                                    <td style="text-align:center; width:40px; vertical-align:middle;"><?= $r; ?></td>
                                    <td style="vertical-align:middle;">
                                        <?= $row->product_code.' - '.$row->product_name . ($row->variant ? ' (' . $row->variant . ')' : ''); ?>
                                        <?= $row->second_name ? '<br>' . $row->second_name : ''; ?>
                                        <?= $row->details ? '<br>' . $row->details : ''; ?>
                                        <?= $row->serial_no ? '<br>' . $row->serial_no : ''; ?>
                                    </td>
                                    <?php if ($Settings->indian_gst) { ?>
                                    <td style="width: 80px; text-align:center; vertical-align:middle;"><?= $row->hsn_code; ?></td>
                                    <?php } ?>
                                    <td style="width: 80px; text-align:center; vertical-align:middle;"><?= $this->sma->formatQuantity($row->quantity).' '.$row->product_unit_code; ?></td>
                                    <td style="text-align:right; width:90px;"><?= $this->sma->formatMoney($row->unit_price); ?></td>
                                    <?php
                                    if ($Settings->tax1 && $inv->product_tax > 0) {
                                        echo '<td style="text-align:right; vertical-align:middle;">' . ($row->item_tax != 0 ? '<small>('.($Settings->indian_gst ? $row->tax : $row->tax_code).')</small>' : '') . ' ' . $this->sma->formatMoney($row->item_tax) . '</td>';
                                    }
                                    if ($Settings->product_discount && $inv->product_discount != 0) {
                                        echo '<td style="text-align:right; vertical-align:middle;">' . ($row->discount != 0 ? '<small>(' . $row->discount . ')</small> ' : '') . $this->sma->formatMoney($row->item_discount) . '</td>';
                                    }
                                    ?>
                                    <td style="text-align:right; width:110px;"><?= $this->sma->formatMoney($row->subtotal); ?></td>
                                </tr>
                                <?php
                                $r++;
                            endforeach;
                        }
                    ?>
                    </tbody>
                    <tfoot>

                    <?php if ($inv->grand_total != $inv->total) {
                        ?>
                        <tr>
                            <td colspan="<?= $tcol; ?>" style="text-align:right;"><?= lang('total'); ?>
                                (<?= $default_currency->code; ?>)
                            </td>
                            <?php
                                if ($Settings->tax1 && $inv->product_tax > 0) {
                                    echo '<td style="text-align:right;">' . $this->sma->formatMoney($return_sale ? ($inv->product_tax+$return_sale->product_tax) : $inv->product_tax) . '</td>';
                                }
                                if ( $Settings->product_discount && $inv->product_discount != 0) {
                                    echo '<td style="text-align:right;">' . $this->sma->formatMoney($return_sale ? ($inv->product_discount+$return_sale->product_discount) : $inv->product_discount) . '</td>';
                                }
                            ?>
                            <td style="text-align:right;"><?= $this->sma->formatMoney($return_sale ? (($inv->total + $inv->product_tax)+($return_sale->total + $return_sale->product_tax)) : ($inv->total + $inv->product_tax)); ?></td>
                        </tr>
                    <?php }
                    ?>
                    <?php
                    if ($return_sale) {
                        echo '<tr><td colspan="' . $col . '" style="text-align:right;">' . lang("return_total") . ' (' . $default_currency->code . ')</td><td style="text-align:right;">' . $this->sma->formatMoney($return_sale->grand_total) . '</td></tr>';
                    }
                    if ($inv->surcharge != 0) {
                        echo '<tr><td colspan="' . $col . '" style="text-align:right;">' . lang("return_surcharge") . ' (' . $default_currency->code . ')</td><td style="text-align:right;">' . $this->sma->formatMoney($inv->surcharge) . '</td></tr>';
                    }
                    ?>

                    <?php if ($Settings->indian_gst) {
                        if ($inv->cgst > 0) {
                            $cgst = $return_sale ? $inv->cgst + $return_sale->cgst : $inv->cgst;
                            echo '<tr><td colspan="' . $col . '" class="text-right">' . lang('cgst') . ' (' . $default_currency->code . ')</td><td class="text-right">' . ( $Settings->format_gst ? $this->sma->formatMoney($cgst) : $cgst) . '</td></tr>';
                        }
                        if ($inv->sgst > 0) {
                            $sgst = $return_sale ? $inv->sgst + $return_sale->sgst : $inv->sgst;
                            echo '<tr><td colspan="' . $col . '" class="text-right">' . lang('sgst') . ' (' . $default_currency->code . ')</td><td class="text-right">' . ( $Settings->format_gst ? $this->sma->formatMoney($sgst) : $sgst) . '</td></tr>';
                        }
                        if ($inv->igst > 0) {
                            $igst = $return_sale ? $inv->igst + $return_sale->igst : $inv->igst;
                            echo '<tr><td colspan="' . $col . '" class="text-right">' . lang('igst') . ' (' . $default_currency->code . ')</td><td class="text-right">' . ( $Settings->format_gst ? $this->sma->formatMoney($igst) : $igst) . '</td></tr>';
                        }
                    } ?>

                    <?php if ($inv->order_discount != 0) {
                        echo '<tr><td colspan="' . $col . '" style="text-align:right;">' . lang('order_discount') . ' (' . $default_currency->code . ')</td><td style="text-align:right;">'.($inv->order_discount_id ? '<small>('.$inv->order_discount_id.')</small> ' : '') . $this->sma->formatMoney($return_sale ? ($inv->order_discount+$return_sale->order_discount) : $inv->order_discount) . '</td></tr>';
                    }
                    ?>
                    <?php if ($Settings->tax2 && $inv->order_tax != 0) {
                        echo '<tr><td colspan="' . $col . '" style="text-align:right;">' . lang('order_tax') . ' (' . $default_currency->code . ')</td><td style="text-align:right;">' . $this->sma->formatMoney($return_sale ? ($inv->order_tax+$return_sale->order_tax) : $inv->order_tax) . '</td></tr>';
                    }
                    ?>
                    <?php if ($inv->shipping != 0) {
                        echo '<tr><td colspan="' . $col . '" style="text-align:right;">' . lang('shipping') . ' (' . $default_currency->code . ')</td><td style="text-align:right;">' . $this->sma->formatMoney($inv->shipping) . '</td></tr>';
                    }
                    ?>
                    <tr>
                        <td colspan="<?= $col; ?>"
                            style="text-align:right; font-weight:bold;"><?= lang('total_amount'); ?>
                            (<?= $default_currency->code; ?>)
                        </td>
                        <td style="text-align:right; font-weight:bold;"><?= $this->sma->formatMoney($return_sale ? ($inv->grand_total+$return_sale->grand_total) : $inv->grand_total); ?></td>
                    </tr>

                    <tr>
                        <td colspan="<?= $col; ?>" style="text-align:right; font-weight:bold;"><?= lang('paid'); ?>
                            (<?= $default_currency->code; ?>)
                        </td>
                        <td style="text-align:right; font-weight:bold;"><?= $this->sma->formatMoney($return_sale ? ($inv->paid+$return_sale->paid) : $inv->paid); ?></td>
                    </tr>
                    <tr>
                        <td colspan="<?= $col; ?>" style="text-align:right; font-weight:bold;"><?= lang('balance'); ?>
                            (<?= $default_currency->code; ?>)
                        </td>
                        <td style="text-align:right; font-weight:bold;"><?= $this->sma->formatMoney(($return_sale ? ($inv->grand_total+$return_sale->grand_total) : $inv->grand_total) - ($return_sale ? ($inv->paid+$return_sale->paid) : $inv->paid)); ?></td>
                    </tr>

                    </tfoot>
                </table>
            </div>
            <?= $Settings->invoice_view > 0 ? $this->gst->summary($rows, $return_rows, ($return_sale ? $inv->product_tax+$return_sale->product_tax : $inv->product_tax)) : ''; ?>
            </div>
            <div class="clearfix"></div>

                <div class="col-xs-12">
                    <?php if ($inv->note || $inv->note != '') { ?>
                        <div class="well well-sm">
                            <p class="bold"><?= lang('note'); ?>:</p>

                            <div><?= $this->sma->decode_html($inv->note); ?></div>
                        </div>
                    <?php }
                    ?>
                </div>
                <div class="clearfix"></div>
                <div class="col-xs-4 pull-left">
                    <p style="height: 80px;"><?= lang('seller'); ?>
                        : <?= $biller->company != '-' ? $biller->company : $biller->name; ?> </p>
                    <hr>
                    <p><?= lang('stamp_sign'); ?></p>
                </div>
                <div class="col-xs-4 pull-right">
                    <p style="height: 80px;"><?= lang('customer'); ?>
                        : <?= $customer->company ? $customer->company : $customer->name; ?> </p>
                    <hr>
                    <p><?= lang('stamp_sign'); ?></p>
                    <?php if ($customer->award_points != 0 && $Settings->each_spent > 0) { ?>
                        <div class="well well-sm">
                            <?=
                            '<p>'.lang('this_sale').': '.floor(($inv->grand_total/$Settings->each_spent)*$Settings->ca_point)
                            .'<br>'.
                            lang('total').' '.lang('award_points').': '. $customer->award_points . '</p>';?>
                        </div>
                    <?php } ?>
                </div>
                <div class="clearfix"></div>

        </div>
    </div> -->
<!-- </div> -->

    <?php $totalprice = 0; $totalvat = 0; $nettotal = 0; $total1 = 0; $vat1 = 0; $nettotal1 = 0;
     ?>
    <div id="wrapper" style="max-width:750px !important;margin:0 auto !important;">
        <div id="receiptData">
            <div id="receipt-data">
                <div class="row">
                
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="ibox-content top-first">
                                <address>
                                    <?= !empty($biller->logo) ? '<img width="250px" src="'.base_url('assets/uploads/logos/'.$biller->logo).'" alt="">' : ''; ?><br>
                                    <br>
                                    <?php
                                    echo "<p>" . $biller->address . " " . $biller->city . " " . $biller->postal_code . " " . $biller->state . " " . $biller->country . '</p>';
                                    echo  lang("vat_no") . ": " . $biller->vat_no;
                                    echo "<br>" . lang("tel") . ": " . $biller->phone;
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

                        <div class="col-lg-8 top-third">
                            <address>
                                <div class="text-right">
                                    <strong><font color="red" style="font-size:20px;font-family:lavender">TAX INVOICE</font></strong><br>
                                </div>
                                <div class="text-center">
                                    <strong><font style="font-size:14px;text-align:center;font-family:lavender;margin-top:5px;">Bank Details, Account Name: Laptops Direct</font></strong><br>
                                </div>
                                <table rules="all" style="width:100%;border:1px solid;pull-right; margin-left:100px;" class="pull-right">
                                    <thead>
                                    <tr>
                                        <th style="text-align:left;padding-left:3px;">Bank</th>
                                        <th style="text-align:left;padding-left:3px;">Branch</th>
                                        <th style="text-align:left;padding-left:3px;">Acc#</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td style="text-align:left;padding-left:3px;">Cabs</td>
                                            <td style="text-align:left;padding-left:3px;">Northridge Park</td>
                                            <td style="text-align:left;padding-left:3px;">100260623</td>
                                        </tr>
                                        <tr>
                                            <td style="text-align:left;padding-left:3px;">BankABC</td>
                                            <td style="text-align:left;padding-left:3px;">Branch Code: 21120</td>
                                            <td style="text-align:left;padding-left:3px;">26833955502010</td>
                                        </tr>
                                        <tr>
                                            <td style="text-align:left;padding-left:3px;">Steward Bank</td>
                                            <td style="text-align:left;padding-left:3px;">Kwame Nkrumah</td>
                                            <td style="text-align:left;padding-left:3px;">1004209083</td>
                                        </tr>
                                        <tr>
                                            <td style="text-align:left;padding-left:3px;">Ecobank</td>
                                            <td style="text-align:left;padding-left:3px;">Samora Machel</td>
                                            <td style="text-align:left;padding-left:3px;">0021037613070301</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </address>
                        </div>
                    
                    </div>

                    <div class = "row" style = "clear:both;">
                        <table rules="all" class = "col-lg-4 totaltabletop">
                                <tbody>
                                <tr style = "font-weight:bold;">
                                    <td style = "font-weight:bold;">Price Ex VAT</td>
                                    <td style = "font-weight:bold;">VAT</td>
                                    <td style = "font-weight:bold;">Price Inc VAT</td>
                                </tr>
                                <tr>
                                    <td>$ <?php echo number_format((float)$inv->total, 2); ?></td>
                                    <td>$ <?php echo number_format((float)$inv->total_tax, 2); ?></td>
                                    <td>$ <?php echo number_format((float)$inv->grand_total, 2); ?></td>
                                </tr>
                                </tbody>
                        </table>
                    </div>

                    <div class"col-lg-12">
                        <hr style = "border:0.5px dashed;">
                    </div>

                    <div class = "row">
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
                        <div class = "col-lg-7 col-sm-7 col-xs-7 docandcuscontainer" >
                            <table rules="all"  class = "col-lg-7 cusacctable">
                                <tbody>
                                    <tr>
                                        <td style = "font-weight:bold;" >Doc Number</td>
                                        <td style = "font-weight:bold;">Order No:</td>
                                        <td style = "font-weight:bold;width:150px;">Sales Rep</td>
                                        <td style = "font-weight:bold;">Date</td>
                                    </tr>
                                    <tr>
                                        <td> <?php echo $inv->id; ?></td>
                                        <td> </td>
                                        <td><?php echo $created_by->first_name." ".$created_by->last_name;?></td>
                                        <td><?php echo $this->sma->hrsd($inv->date); ?></td>
                                    </tr>
                                </tbody>
                            </table>
                            <table rules="all"  class = "col-lg-4 doctable">
                                    
                            </table>
                        </div>  
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-sm-12 col-xs-12">
                            <table rules="all" style = "border:1px solid; width:100%; margin:0 auto;">
                                <tbody>
                                    <tr style = "font-weight:bold;">
                                        <td style = "padding-left:2px;font-weight:bold;">SKU</td>
                                        <td style = "padding-left:2px;font-weight:bold;width:350px;">Description</td>
                                        <td style = "text-align:center;font-weight:bold;">Qty</td>
                                        <td style = "text-align:center;font-weight:bold;">Ex. VAT</td>
                                        <td style = "text-align:center;font-weight:bold;">VAT</td>
                                        <td style = "text-align:center;font-weight:bold;">Total Inc</td>
                                    </tr>

                                    <?php $tot = 0; foreach ($rows as $row) { ?>
                                            <tr>
                                                <td style = "padding-left:2px;"><?php echo $row->product_code; ?></td>
                                                <td style = "padding-left:2px;"><?php echo $row->product_name; ?></td>
                                                <td style = "text-align:center;"><?php echo number_format($row->quantity, 0); ?></td>
                                                <td style = "text-align:center;">$<?php echo sprintf("%.2f", $row->quantity * $row->net_unit_price); $tot = $row->quantity * $row->net_unit_price; $totalprice += $row->quantity * $row->net_unit_price; ?></td>
                                                <td style = "text-align:center;">$<?php echo sprintf("%.2f", $row->item_tax); $totalvat += $row->item_tax; ?></td>
                                                <td style = "text-align:center;">$<?php echo sprintf("%.2f", $row->item_tax += $tot); $nettotal += $row->item_tax + $tot;  ?></td>
                                            </tr>
                                    <?php }  ?>
                                </tbody>
                            </table>
                            <br>
                            <br>
                        </div>
                    </div>

                    <div class="row">
                        <div class = "col-lg-6 col-sm-6 col-xs-6">
                            <div style = "border:1px solid;width:100%;padding:5px;line-height:15px;margin-top:10px;">*No Warranty on PSU's, power adaptors, batteries, ink & toner cartridges*Please allow at least 4-6 months for any warranty claims. Terms and conditions accepted by signatory</div>
                        </div>
                        <div class = "col-lg-6 col-lg-6 col-sm-6 col-xs-6 totaltablebottom">
                            <div class = "pull-right thanknote">
                                Thank You for your Business.
                            </div>
                            <table rules="all" style = "border:0;text-align: center;margin-top:3px;" width = "100%" class = "pull-right">
                                    <tbody>
                                    <tr style = "font-weight:bold;">
                                        <td style = "border:none !important;"></td>
                                        <td style = "font-weight:bold;">Price Ex VAT</td>
                                        <td style = "font-weight:bold;">VAT</td>
                                        <td style = "font-weight:bold;">Price Inc VAT</td>
                                    </tr>
                                    <tr>
                                        <td style = "font-weight:bold;">Totals</td>
                                        <td>$ <?php echo number_format((float)$inv->total, 2); ?></td>
                                        <td>$ <?php echo number_format((float)$inv->total_tax, 2); ?></td>
                                        <td>$ <?php echo number_format((float)$inv->grand_total, 2); ?></td>
                                    </tr>
                                    </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="row row-warrenty">
                        <div style="width:100%;float:left;margin-left:25px;">
                            <div style="width:0%;float:left;">
                                <font color="#21B9BB"><br></font>
                            </div>
                            <div style="width:100%;float:center;text-align: center">
                                <font color="#21B9BB">Genuine Products - Full Warranty - Quality Service</font>
                            </div>
                            <div style="width:0%;float:left;">
                            <!-- <div class="col-lg-4 col-sm-4 col-xs-4"> -->
                                <font color="#21B9BB"></font>
                            </div>
                        </div>
                    </div>

                    <div class="row space">
                        <div class="col-lg-12">
                            <ul class="sig-ul">
                                <li class="li1"><div><p class="sig-p-style">Print Name</p></div></li>
                                <li class="li2"><div><p class="sig-p-style">Signature</p></div></li>
                                <li class="li3"><div><p class="sig-p-style">Date</p></div></li>
                            </ul>
                        </div>
                    </div>

                    <div class="row">
                        <div class = "col-lg-12" style = "text-align:center;">
                        <img src="<?php echo base_url(); ?>assets/images/print-footer.png" />
                        </div>
                    </div>

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
            
             ?>
            <div style="clear:both;"></div>
        </div>
    </div>
    <?php /* include FCPATH.'themes'.DIRECTORY_SEPARATOR.$Settings->theme.DIRECTORY_SEPARATOR.'views'.DIRECTORY_SEPARATOR.'pos'.DIRECTORY_SEPARATOR.'remote_printing.php'; */ ?>

    </div>
</div>
</div>

</body>
</html>