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
                                <a href="<?= admin_url() ?>">
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
                                    <li><a href="<?= admin_url('users') ?>"><span><img src="<?= $assets ?>images/icon/dbl-arrow.svg" class="svg" alt=""></span><span>List Users</span></a></li>
                                    <li><a href="<?= admin_url('suppliers') ?>"><span><img src="<?= $assets ?>images/icon/dbl-arrow.svg" class="svg" alt=""></span><span>List Suppliers</span></a></li>
                                    <li><a href="<?= admin_url('customers') ?>"><span><img src="<?= $assets ?>images/icon/dbl-arrow.svg" class="svg" alt=""></span><span>List Customers</span></a></li>
                                </ul>
                            </li>
                            <li>
                                <a class="drop">
                                    <span>
                                        <img src="<?= $assets ?>images/icon/products.svg" class="svg" alt="">
                                    </span>
                                    <span>Products</span>
                                    <span><img src="<?= $assets ?>images/icon/down-arrow.svg" class="svg" alt=""></span>
                                </a>
                                <ul class="down">
                                    <li><a href="<?= admin_url('products') ?>"><span><img src="<?= $assets ?>images/icon/dbl-arrow.svg" class="svg" alt=""></span><span>List Products</span></a></li>
                                    <li><a href="<?= admin_url('products/add') ?>"><span><img src="<?= $assets ?>images/icon/dbl-arrow.svg" class="svg" alt=""></span><span>Add Product</span></a></li>
                                </ul>
                            </li>
                            <li>
                                <a class="drop">
                                    <span>
                                        <img src="<?= $assets ?>images/icon/purchases.svg" class="svg" alt="">
                                    </span>
                                    <span>Purchases</span>
                                    <span><img src="<?= $assets ?>images/icon/down-arrow.svg" class="svg" alt=""></span>
                                </a>
                                <ul class="down">
                                    <li><a href="<?= admin_url('purchases') ?>"><span><img src="<?= $assets ?>images/icon/dbl-arrow.svg" class="svg" alt=""></span><span>List Purchases</span></a></li>
                                    <li><a href="<?= admin_url('purchases/add') ?>"><span><img src="<?= $assets ?>images/icon/dbl-arrow.svg" class="svg" alt=""></span><span>Add Purchase</span></a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="<?= admin_url('branches') ?>">
                                    <span>
                                        <img src="<?= $assets ?>images/icon/branches.svg" class="svg" alt="">
                                    </span>
                                    <span>Branches</span>
                                </a>
                            </li>
                            <li>
                                <a class="drop">
                                    <span>
                                        <img src="<?= $assets ?>images/icon/transfers.svg" class="svg" alt="">
                                    </span>
                                    <span>Transfers</span>
                                    <span><img src="<?= $assets ?>images/icon/down-arrow.svg" class="svg" alt=""></span>
                                </a>
                                <ul class="down">
                                    <li><a href="<?= admin_url('transfers') ?>"><span><img src="<?= $assets ?>images/icon/dbl-arrow.svg" class="svg" alt=""></span><span>List Transfers</span></a></li>
                                    <li><a href="<?= admin_url('transfers/add') ?>"><span><img src="<?= $assets ?>images/icon/dbl-arrow.svg" class="svg" alt=""></span><span>Add Transfer</span></a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="<?= admin_url('reports') ?>">
                                    <span>
                                        <img src="<?= $assets ?>images/icon/reports.svg" class="svg" alt="">
                                    </span>
                                    <span>Reports</span>
                                </a>
                            </li>
                            <li>
                                <a href="<?= admin_url('system_settings') ?>">
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
                        <div class="btnContent">
                            <div class="sideBarcloseIcon">
                                <img src="<?= $assets ?>images/icon/right-arrow.svg" alt="">
                            </div>
                            <div class="btnContentItem">
                                <a href="#" class="headerBtn">
                                    <div class="btnIcon">
                                        <img src="<?= $assets ?>images/icon/pos.svg" alt="" class="svg">
                                    </div>
                                    POS
                                </a>
                            </div>
                            <div class="btnContentItem">
                                <a href="" class="headerBtn">
                                    <div class="btnIcon">
                                        <img src="<?= $assets ?>images/icon/calculator.svg" alt="" class="svg">
                                    </div>
                                    Calculator
                                </a>
                            </div>
                            <div class="btnContentItem">
                                <a href="<?= admin_url('calendar') ?>" class="headerBtn">
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