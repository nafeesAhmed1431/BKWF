<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title><?= $title ?></title>
    <script type="text/javascript">
        if (parent.frames.length !== 0) {
            top.location = '<?= admin_url() ?>';
        }
    </script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="<?= $assets ?>images/icon.png" />
    <link href="<?= $assets ?>styles/theme.css" rel="stylesheet" />
    <link href="<?= $assets ?>styles/style.css" rel="stylesheet" />
    <link href="<?= $assets ?>styles/helpers/login.css" rel="stylesheet" />
    <script type="text/javascript" src="<?= $assets ?>js/jquery-2.0.3.min.js"></script>
    <!--[if lt IE 9]>
    <script src="<?= $assets ?>js/respond.min.js"></script>
    <![endif]-->

</head>

<body class="login-page">
    <noscript>
        <div class="global-site-notice noscript">
            <div class="notice-inner">
                <p>
                    <strong>JavaScript seems to be disabled in your browser.</strong><br>You must have JavaScript enabled in
                    your browser to utilize the functionality of this website.
                </p>
            </div>
        </div>
    </noscript>

    <section class="login_section">
        <div class="container" style="padding: 0;">
            <div class="row">
                <div class="col-md-7" style="padding: 0;">
                    <div class="content_part">
                        <div class="col-md-9">
                            <div class="row content_part_child">
                                <div class="col-md-5">
                                    <div class="content_part_img">
                                        <img src="<?= base_url('assets/images/login-logo-white.svg') ?>" alt="login-logo">
                                    </div>
                                </div>
                                <div class="col-sm-7">
                                    <div class="content_part_content">
                                        <div class="content_part_content_heading">
                                            <h1>Welcome to</h1>
                                        </div>
                                        <div class="content_part_content_para">
                                            <p>Bilal Khal Wanda Factory. Maintaining a healthy environment in the Farm and Agriculture Industry is far from simple. Unsanitary practices of animal farming can lead to disease outbreaks and food contamination from fungi, bacteria, viruses, ectoparasites, and endoparasites.</p>
                                            <p>To prevent such risks, farms need to maintain good Biosecurity conditions. It is an integral concept that encompasses policy and regulation in protecting agriculture, food, and the environment.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-5" style="padding: 0;">
                    <div class="login_form">
                        <div class="login_form_logo">
                            <img src="<?= base_url('assets/images/login-logo-black.svg') ?>" alt="login-logo">
                        </div>
                        <div class="login_form_content">
                            <p>Bilal Khal Wanda Factory</p>
                        </div>
                        <form action="<?= admin_url('auth/login') ?>" data-toggle="validator" method="post" accept-charset="utf-8">
                            <div class="form-group emailInput">
                                <label for="identity">Username/Email</label>
                                <div class="inputIconShown">
                                    <input type="text" class="inputField" name="identity" id="identity" placeholder="Username | email@mail.com">
                                    <span><img src="<?= base_url('assets/images/user.svg') ?>" alt=""></span>
                                </div>
                            </div>
                            <div class="form-group passwordInput">
                                <label for="password">Password</label>
                                <div class="inputIconShown">
                                    <input type="password" class="inputField" name="password" id="password" placeholder="*********">
                                    <span><img src="<?= base_url('assets/images/lock.svg') ?>" alt=""></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="checkbox" id="remember" name="remember">
                                        <label for="remember">Remember Me</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <a href="#">Forgot Password?</a>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <!-- <a href="#" class="button">LOGIN</a> -->
                                <button type="submit" class="button">LOGIN</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="<?= $assets ?>js/jquery.js"></script>
    <script src="<?= $assets ?>js/bootstrap.min.js"></script>
    <script src="<?= $assets ?>js/jquery.cookie.js"></script>
    <script src="<?= $assets ?>js/login.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            localStorage.clear();
            var hash = window.location.hash;
            if (hash && hash != '') {
                $("#login").hide();
                $(hash).show();
            }
        });
    </script>
</body>

</html>