<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <base href="<?= site_url() ?>" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= $page_title ?> - <?= $Settings->site_name ?></title>
    <link rel="shortcut icon" href="<?= $assets ?>images/icon.png" />
    <link href="<?= $assets ?>styles/theme.css" rel="stylesheet" />
    <link href="<?= $assets ?>styles/style.css" rel="stylesheet" />
    <script type="text/javascript" src="<?= $assets ?>js/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="<?= $assets ?>js/jquery-migrate-1.2.1.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

    <!--[if lt IE 9]>
    <script src="<?= $assets ?>js/jquery.js"></script>
    <![endif]-->
    <noscript>
        <style type="text/css">
            #loading {
                display: none;
            }
        </style>
    </noscript>
    <?php if ($Settings->user_rtl) { ?>
        <link href="<?= $assets ?>styles/helpers/bootstrap-rtl.min.css" rel="stylesheet" />
        <link href="<?= $assets ?>styles/style-rtl.css" rel="stylesheet" />
        <script type="text/javascript">
            $(document).ready(function() {
                $('.pull-right, .pull-left').addClass('flip');
            });
        </script>
    <?php } ?>
    <script type="text/javascript">
        $(window).load(function() {
            $("#loading").fadeOut("slow");
        });
    </script>
</head>

<body>
    <noscript>
        <div class="global-site-notice noscript">
            <div class="notice-inner">
                <p><strong>JavaScript seems to be disabled in your browser.</strong><br>You must have JavaScript enabled in
                    your browser to utilize the functionality of this website.</p>
            </div>
        </div>
    </noscript>
    <div id="loading"></div>
    <div id="app_wrapper">
        <div class="content-wrap">
            <div class="sideBar" id="sidebar">
                <div class="sideBarLeft">
                    <div class="sideBarcloseIcon">
                        <img src="<?= $assets ?>images/icon/right-arrow.svg" alt="">
                    </div>
                    <div class="sideBarLogo">
                        <a href="#">
                            <img src="<?= $assets ?>images/icon/logo.svg" alt="">
                        </a>
                    </div>
                    <div class="sideBarLink">
                        <ul>
                            <li>
                                <a href="#">
                                    <span>
                                        <img src="<?= $assets ?>images/icon/dashboard.svg" class="svg" alt="">
                                    </span>
                                    <span>Dashboard</span>
                                </a>
                            </li>
                            <li>
                                <a class="drop">
                                    <span>
                                        <img src="<?= $assets ?>images/icon/people.svg" class="svg" alt="">
                                    </span>
                                    <span>People</span>
                                    <span><img src="<?= $assets ?>images/icon/down-arrow.svg" class="svg" alt=""></span>
                                </a>
                                <ul class="down">
                                    <li><a href="#"><span><img src="<?= $assets ?>images/icon/dbl-arrow.svg" class="svg" alt=""></span><span>Link 1</span></a></li>
                                    <li><a href="#"><span><img src="<?= $assets ?>images/icon/dbl-arrow.svg" class="svg" alt=""></span><span>Link 2</span></a></li>
                                    <li><a href="#"><span><img src="<?= $assets ?>images/icon/dbl-arrow.svg" class="svg" alt=""></span><span>Link 3</span></a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">
                                    <span>
                                        <img src="<?= $assets ?>images/icon/products.svg" class="svg" alt="">
                                    </span>
                                    <span>Products</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span>
                                        <img src="<?= $assets ?>images/icon/purchases.svg" class="svg" alt="">
                                    </span>
                                    <span>Purchases</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span>
                                        <img src="<?= $assets ?>images/icon/branches.svg" class="svg" alt="">
                                    </span>
                                    <span>Branches</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span>
                                        <img src="<?= $assets ?>images/icon/transfers.svg" class="svg" alt="">
                                    </span>
                                    <span>Transfers</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span>
                                        <img src="<?= $assets ?>images/icon/reports.svg" class="svg" alt="">
                                    </span>
                                    <span>Reports</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span>
                                        <img src="<?= $assets ?>images/icon/settings.svg" class="svg" alt="">
                                    </span>
                                    <span>Settings</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="main-container" id="main-container">
                <header id="header" class="navbar">
                    <div class="row">
                        <!-- <a class="navbar-brand" href="<?= admin_url() ?>"><span class="logo"><?= $Settings->site_name ?></span></a>

                        <div class="btn-group visible-xs pull-right btn-visible-sm">
                            <button class="navbar-toggle btn" type="button" data-toggle="collapse" data-target="#sidebar_menu">
                                <span class="fa fa-bars"></span>
                            </button>
                            <?php if (SHOP) { ?>
                                <a href="<?= site_url('/') ?>" class="btn">
                                    <span class="fa fa-shopping-cart"></span>
                                </a>
                            <?php } ?>
                            <a href="<?= admin_url('calendar') ?>" class="btn">
                                <span class="fa fa-calendar"></span>
                            </a>
                            <a href="<?= admin_url('users/profile/' . $this->session->userdata('user_id')); ?>" class="btn">
                                <span class="fa fa-user"></span>
                            </a>
                            <a href="<?= admin_url('logout'); ?>" class="btn">
                                <span class="fa fa-sign-out"></span>
                            </a>
                        </div>
                        <div class="header-nav">
                            <ul class="nav navbar-nav pull-right">
                                <li class="dropdown">
                                    <a class="btn account dropdown-toggle" data-toggle="dropdown" href="#">
                                        <img alt="" src="<?= $this->session->userdata('avatar') ? base_url() . 'assets/uploads/avatars/thumbs/' . $this->session->userdata('avatar') : base_url('assets/images/' . $this->session->userdata('gender') . '.png'); ?>" class="mini_avatar img-rounded">

                                        <div class="user">
                                            <span><?= lang('welcome') ?> <?= $this->session->userdata('username'); ?></span>
                                        </div>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <li>
                                            <a href="<?= admin_url('users/profile/' . $this->session->userdata('user_id')); ?>">
                                                <i class="fa fa-user"></i> <?= lang('profile'); ?>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="<?= admin_url('users/profile/' . $this->session->userdata('user_id') . '/#cpassword'); ?>"><i class="fa fa-key"></i> <?= lang('change_password'); ?>
                                            </a>
                                        </li>
                                        <li class="divider"></li>
                                        <li>
                                            <a href="<?= admin_url('logout'); ?>">
                                                <i class="fa fa-sign-out"></i> <?= lang('logout'); ?>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="nav navbar-nav pull-right">
                                <li class="dropdown hidden-xs"><a class="btn tip" title="<?= lang('dashboard') ?>" data-placement="bottom" href="<?= admin_url('welcome') ?>"><i class="fa fa-dashboard"></i></a></li>
                                <?php if (SHOP) { ?>
                                    <li class="dropdown hidden-xs"><a class="btn tip" title="<?= lang('shop') ?>" data-placement="bottom" href="<?= base_url() ?>"><i class="fa fa-shopping-cart"></i></a></li>
                                <?php } ?>
                                <?php if ($Owner) { ?>
                                    <li class="dropdown hidden-sm">
                                        <a class="btn tip" title="<?= lang('settings') ?>" data-placement="bottom" href="<?= admin_url('system_settings') ?>">
                                            <i class="fa fa-cogs"></i>
                                        </a>
                                    </li>
                                <?php } ?>
                                <li class="dropdown hidden-xs">
                                    <a class="btn tip" title="<?= lang('calculator') ?>" data-placement="bottom" href="#" data-toggle="dropdown">
                                        <i class="fa fa-calculator"></i>
                                    </a>
                                    <ul class="dropdown-menu pull-right calc">
                                        <li class="dropdown-content">
                                            <span id="inlineCalc"></span>
                                        </li>
                                    </ul>
                                </li>
                                <?php if ($info) { ?>
                                    <li class="dropdown hidden-sm">
                                        <a class="btn tip" title="<?= lang('notifications') ?>" data-placement="bottom" href="#" data-toggle="dropdown">
                                            <i class="fa fa-info-circle"></i>
                                            <span class="number blightOrange black"><?= sizeof($info) ?></span>
                                        </a>
                                        <ul class="dropdown-menu pull-right content-scroll">
                                            <li class="dropdown-header"><i class="fa fa-info-circle"></i> <?= lang('notifications'); ?></li>
                                            <li class="dropdown-content">
                                                <div class="scroll-div">
                                                    <div class="top-menu-scroll">
                                                        <ol class="oe">
                                                            <?php foreach ($info as $n) {
                                                                echo '<li>' . $n->comment . '</li>';
                                                            } ?>
                                                        </ol>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </li>
                                <?php } ?>
                                <?php if ($events) { ?>
                                    <li class="dropdown hidden-xs">
                                        <a class="btn tip" title="<?= lang('calendar') ?>" data-placement="bottom" href="#" data-toggle="dropdown">
                                            <i class="fa fa-calendar"></i>
                                            <span class="number blightOrange black"><?= sizeof($events) ?></span>
                                        </a>
                                        <ul class="dropdown-menu pull-right content-scroll">
                                            <li class="dropdown-header">
                                                <i class="fa fa-calendar"></i> <?= lang('upcoming_events'); ?>
                                            </li>
                                            <li class="dropdown-content">
                                                <div class="top-menu-scroll">
                                                    <ol class="oe">
                                                        <?php foreach ($events as $event) {
                                                            echo '<li>' . date($dateFormats['php_ldate'], strtotime($event->start)) . ' <strong>' . $event->title . '</strong><br>' . $event->description . '</li>';
                                                        } ?>
                                                    </ol>
                                                </div>
                                            </li>
                                            <li class="dropdown-footer">
                                                <a href="<?= admin_url('calendar') ?>" class="btn-block link">
                                                    <i class="fa fa-calendar"></i> <?= lang('calendar') ?>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                <?php } else { ?>
                                    <li class="dropdown hidden-xs">
                                        <a class="btn tip" title="<?= lang('calendar') ?>" data-placement="bottom" href="<?= admin_url('calendar') ?>">
                                            <i class="fa fa-calendar"></i>
                                        </a>
                                    </li>
                                <?php } ?>
                                <li class="dropdown hidden-sm">
                                    <a class="btn tip" title="<?= lang('styles') ?>" data-placement="bottom" data-toggle="dropdown" href="#">
                                        <i class="fa fa-css3"></i>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <li class="bwhite noPadding">
                                            <a href="#" id="fixed" class="">
                                                <i class="fa fa-angle-double-left"></i>
                                                <span id="fixedText">Fixed</span>
                                            </a>
                                            <a href="#" id="cssLight" class="grey">
                                                <i class="fa fa-stop"></i> Grey
                                            </a>
                                            <a href="#" id="cssBlue" class="blue">
                                                <i class="fa fa-stop"></i> Blue
                                            </a>
                                            <a href="#" id="cssBlack" class="black">
                                                <i class="fa fa-stop"></i> Black
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="dropdown hidden-xs">
                                    <a class="btn tip" title="<?= lang('language') ?>" data-placement="bottom" data-toggle="dropdown" href="#">
                                        <img src="<?= base_url('assets/images/' . $Settings->user_language . '.png'); ?>" alt="">
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <?php $scanned_lang_dir = array_map(function ($path) {
                                            return basename($path);
                                        }, glob(APPPATH . 'language/*', GLOB_ONLYDIR));
                                        foreach ($scanned_lang_dir as $entry) { ?>
                                            <li>
                                                <a href="<?= admin_url('welcome/language/' . $entry); ?>">
                                                    <img src="<?= base_url('assets/images/' . $entry . '.png'); ?>" class="language-img">
                                                    &nbsp;&nbsp;<?= ucwords($entry); ?>
                                                </a>
                                            </li>
                                        <?php } ?>
                                        <li class="divider"></li>
                                        <li>
                                            <a href="<?= admin_url('welcome/toggle_rtl') ?>">
                                                <i class="fa fa-align-<?= $Settings->user_rtl ? 'right' : 'left'; ?>"></i>
                                                <?= lang('toggle_alignment') ?>
                                            </a>
                                        </li>
                                    </ul>
                                </li>

                                <?php if (($Owner || $Admin || $GP['reports-quantity_alerts'] || $GP['reports-expiry_alerts']) && ($qty_alert_num > 0 || $exp_alert_num > 0 || $shop_sale_alerts)) { ?>
                                    <li class="dropdown hidden-sm">
                                        <a class="btn blightOrange tip" title="<?= lang('alerts') ?>" data-placement="left" data-toggle="dropdown" href="#">
                                            <i class="fa fa-exclamation-triangle"></i>
                                            <span class="number bred black"><?= $qty_alert_num + (($Settings->product_expiry) ? $exp_alert_num : 0) + $shop_sale_alerts + $shop_payment_alerts; ?></span>
                                        </a>
                                        <ul class="dropdown-menu pull-right">
                                            <?php if ($qty_alert_num > 0) { ?>
                                                <li>
                                                    <a href="<?= admin_url('reports/quantity_alerts') ?>" class="">
                                                        <span class="label label-danger pull-right" style="margin-top:3px;"><?= $qty_alert_num; ?></span>
                                                        <span style="padding-right: 35px;"><?= lang('quantity_alerts') ?></span>
                                                    </a>
                                                </li>
                                            <?php } ?>
                                            <?php if ($Settings->product_expiry) { ?>
                                                <li>
                                                    <a href="<?= admin_url('reports/expiry_alerts') ?>" class="">
                                                        <span class="label label-danger pull-right" style="margin-top:3px;"><?= $exp_alert_num; ?></span>
                                                        <span style="padding-right: 35px;"><?= lang('expiry_alerts') ?></span>
                                                    </a>
                                                </li>
                                            <?php } ?>
                                            <?php if ($shop_sale_alerts) { ?>
                                                <li>
                                                    <a href="<?= admin_url('sales?shop=yes&delivery=no') ?>" class="">
                                                        <span class="label label-danger pull-right" style="margin-top:3px;"><?= $shop_sale_alerts; ?></span>
                                                        <span style="padding-right: 35px;"><?= lang('sales_x_delivered') ?></span>
                                                    </a>
                                                </li>
                                            <?php } ?>
                                            <?php if ($shop_payment_alerts) { ?>
                                                <li>
                                                    <a href="<?= admin_url('sales?shop=yes&attachment=yes') ?>" class="">
                                                        <span class="label label-danger pull-right" style="margin-top:3px;"><?= $shop_payment_alerts; ?></span>
                                                        <span style="padding-right: 35px;"><?= lang('manual_payments') ?></span>
                                                    </a>
                                                </li>
                                            <?php } ?>
                                        </ul>
                                    </li>
                                <?php } ?>
                                <?php if (POS) { ?>
                                    <li class="dropdown hidden-xs">
                                        <a class="btn bdarkGreen tip" title="<?= lang('pos') ?>" data-placement="bottom" href="<?= admin_url('pos') ?>">
                                            <i class="fa fa-th-large"></i> <span class="padding05"><?= lang('pos') ?></span>
                                        </a>
                                    </li>
                                <?php } ?>
                                <?php if ($Owner) { ?>
                                    <li class="dropdown">
                                        <a class="btn bdarkGreen tip" id="today_profit" title="<span><?= lang('today_profit') ?></span>" data-placement="bottom" data-html="true" href="<?= admin_url('reports/profit') ?>" data-toggle="modal" data-target="#myModal">
                                            <i class="fa fa-hourglass-2"></i>
                                        </a>
                                    </li>
                                <?php } ?>
                                <?php if ($Owner || $Admin) { ?>
                                    <?php if (POS) { ?>
                                        <li class="dropdown hidden-xs">
                                            <a class="btn bblue tip" title="<?= lang('list_open_registers') ?>" data-placement="bottom" href="<?= admin_url('pos/registers') ?>">
                                                <i class="fa fa-list"></i>
                                            </a>
                                        </li>
                                    <?php } ?>
                                    <li class="dropdown hidden-xs">
                                        <a class="btn bred tip" title="<?= lang('clear_ls') ?>" data-placement="bottom" id="clearLS" href="#">
                                            <i class="fa fa-eraser"></i>
                                        </a>
                                    </li>
                                <?php } ?>
                            </ul>
                        </div> -->

                        <div class="btnContent">
                            <div class="btnContentItem">
                                <a href="#" class="headerBtn">
                                    <div class="btnIcon">
                                        <img src="<?= $assets ?>images/icon/pos.svg" alt="" class="svg">
                                    </div>
                                    POS
                                </a>
                            </div>
                            <div class="btnContentItem">
                                <a href="#" class="headerBtn">
                                    <div class="btnIcon">
                                        <img src="<?= $assets ?>images/icon/calculator.svg" alt="" class="svg">
                                    </div>
                                    Calculator
                                </a>
                            </div>
                            <div class="btnContentItem">
                                <a href="#" class="headerBtn">
                                    <div class="btnIcon">
                                        <img src="<?= $assets ?>images/icon/calendar.svg" alt="" class="svg">
                                    </div>
                                    Calendar
                                </a>
                            </div>
                            <div class="btnContentItem">
                                <a href="#" class="headerBtn">
                                    <div class="btnIcon">
                                        <img src="<?= $assets ?>images/icon/register-detail.svg" alt="" class="svg">
                                    </div>
                                    Register Details
                                </a>
                            </div>
                        </div>
                        <div class="userContent">
                            <div class="userContentScreen">
                                <img src="<?= $assets ?>images/icon/minimize.svg" class="svg" alt="">
                            </div>
                            <div class="userContentNotify">
                                <img src="<?= $assets ?>images/icon/notify.svg" class="svg" alt="">
                            </div>
                            <div class="userContentDropdown">
                                <div class="userContentDrop">
                                    <span><img src="<?= $assets ?>images/icon/user.png" alt=""></span>
                                    <span>Admin</span>
                                    <span class="dropdownArrow"><img src="<?= $assets ?>images/icon/down-arrow.svg" alt=""></span>
                                </div>
                                <div class="userContentDown">
                                    <ul>
                                        <li><a href="#"><span><img class="svg" src="<?= $assets ?>images/icon/profile.svg" alt="">
                                                </span>
                                                <span>Profile</span></a></li>
                                        <li><a href="#"><span><img class="svg" src="<?= $assets ?>images/icon/change-password.svg" alt="">
                                                </span>
                                                <span>Change Password</span></a></li>
                                        <li><a href="#"><span><img class="svg" src="<?= $assets ?>images/icon/logout.svg" alt="">
                                                </span>
                                                <span>Logout</span></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                    </div>
                </header>
                <div id="content">