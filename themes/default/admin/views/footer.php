<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<div class="clearfix"></div>
<?= '</div></div></div>'; ?>
<div class="clearfix"></div>

<?= '</div>'; ?>
<div class="modal fade in" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"></div>
<div class="modal fade in" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true"></div>
<div id="modal-loading" style="display: none;">
    <div class="blackbg"></div>
    <div class="loader"></div>
</div>
<div id="ajaxCall"><i class="fa fa-spinner fa-pulse"></i></div>
<?php unset($Settings->setting_id, $Settings->smtp_user, $Settings->smtp_pass, $Settings->smtp_port, $Settings->update, $Settings->reg_ver, $Settings->allow_reg, $Settings->default_email, $Settings->mmode, $Settings->timezone, $Settings->restrict_calendar, $Settings->restrict_user, $Settings->auto_reg, $Settings->reg_notification, $Settings->protocol, $Settings->mailpath, $Settings->smtp_crypto, $Settings->corn, $Settings->customer_group, $Settings->envato_username, $Settings->purchase_code); ?>
<script type="text/javascript">
    var dt_lang = <?= $dt_lang ?>,
        dp_lang = <?= $dp_lang ?>,
        site = <?= json_encode(array('url' => base_url(), 'base_url' => admin_url(), 'assets' => $assets, 'settings' => $Settings, 'dateFormats' => $dateFormats)) ?>;
    var lang = {
        paid: '<?= lang('paid'); ?>',
        pending: '<?= lang('pending'); ?>',
        completed: '<?= lang('completed'); ?>',
        ordered: '<?= lang('ordered'); ?>',
        received: '<?= lang('received'); ?>',
        partial: '<?= lang('partial'); ?>',
        sent: '<?= lang('sent'); ?>',
        r_u_sure: '<?= lang('r_u_sure'); ?>',
        due: '<?= lang('due'); ?>',
        returned: '<?= lang('returned'); ?>',
        transferring: '<?= lang('transferring'); ?>',
        active: '<?= lang('active'); ?>',
        inactive: '<?= lang('inactive'); ?>',
        unexpected_value: '<?= lang('unexpected_value'); ?>',
        select_above: '<?= lang('select_above'); ?>',
        download: '<?= lang('download'); ?>'
    };
</script>
<?php
$s2_lang_file = read_file('./assets/config_dumps/s2_lang.js');
foreach (lang('select2_lang') as $s2_key => $s2_line) {
    $s2_data[$s2_key] = str_replace(array('{', '}'), array('"+', '+"'), $s2_line);
}
$s2_file_date = $this->parser->parse_string($s2_lang_file, $s2_data, true);
?>
<script type="text/javascript" src="<?= $assets ?>js/bootstrap.min.js"></script>
<script type="text/javascript" src="<?= $assets ?>js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<?= $assets ?>js/jquery.dataTables.dtFilter.min.js"></script>
<!-- <script type="text/javascript" src="<?= $assets ?>js/dataTables.responsive.js"></script> -->
<script type="text/javascript" src="<?= $assets ?>js/select2.min.js"></script>
<script type="text/javascript" src="<?= $assets ?>js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<?= $assets ?>js/bootstrapValidator.min.js"></script>
<script type="text/javascript" src="<?= $assets ?>js/custom.js"></script>
<script type="text/javascript" src="<?= $assets ?>js/jquery.calculator.min.js"></script>
<script type="text/javascript" src="<?= $assets ?>js/core.js"></script>
<script type="text/javascript" src="<?= $assets ?>js/perfect-scrollbar.min.js"></script>
<?= ($m == 'purchases' && ($v == 'add' || $v == 'edit' || $v == 'purchase_by_csv')) ? '<script type="text/javascript" src="' . $assets . 'js/purchases.js"></script>' : ''; ?>
<?= ($m == 'transfers' && ($v == 'add' || $v == 'edit')) ? '<script type="text/javascript" src="' . $assets . 'js/transfers.js"></script>' : ''; ?>
<?= ($m == 'sales' && ($v == 'add' || $v == 'edit')) ? '<script type="text/javascript" src="' . $assets . 'js/sales.js"></script>' : ''; ?>
<?= ($m == 'returns' && ($v == 'add' || $v == 'edit')) ? '<script type="text/javascript" src="' . $assets . 'js/returns.js"></script>' : ''; ?>
<?= ($m == 'quotes' && ($v == 'add' || $v == 'edit')) ? '<script type="text/javascript" src="' . $assets . 'js/quotes.js"></script>' : ''; ?>
<?= ($m == 'products' && ($v == 'add_adjustment' || $v == 'edit_adjustment' || $v == 'add_adjustment_production')) ? '<script type="text/javascript" src="' . $assets . 'js/adjustments.js"></script>' : ''; ?>

<script>
    $(document).ready(function() {
        $('.select2Dropdown').select2();

        $('img.svg').each(function() {
            var $img = $(this);
            var imgID = $img.attr('id');
            var imgClass = $img.attr('class');
            var imgURL = $img.attr('src');
            $.get(imgURL, function(data) {
                $svg = $(data).find('svg');
                if (imgID) $svg = $svg.attr('id', imgID);
                if (imgClass) $svg = $svg.attr('class', imgClass + ' replaced-svg');
                $svg = $svg.removeAttr('xmlns:a');
                $img.replaceWith($svg);
            }, 'xml');
        });

        $('.sideBarcloseIcon').on('click', function() {
            $('#sidebar').toggleClass('sicebarActive');

            if ($('.drop').hasClass('activeDown')) {
                $('.drop').toggleClass('activeDown');
                $('.drop').siblings('.down').slideToggle();
            }

            if ($(this).closest('#sidebar').hasClass('sicebarActive')) {
                $('.drop').removeClass('activeDown');
                $('.down').slideUp();
            }
        });

        $(document).on("click", function(event) {
            // Check if the clicked element is not part of the dropdown
            if (!$(event.target).closest(".userContentDown").length) {
                // Close the dropdown
                $(".userContentDown").removeClass('downActive');
            }
        });

        $('.userContentDrop').on('click', function() {
            $(this).siblings('.userContentDown').toggleClass('downActive');
            event.stopPropagation();
        });

        $('.drop').on('click', function() {

            if ($(this).hasClass('activeDown')) {

                $('.down').slideUp();
                $('.drop').removeClass('activeDown');

            } else {
                $('.down').slideUp();
                $('.drop').removeClass('activeDown');
                $(this).next('.down').slideDown();
                $(this).addClass('activeDown');

            }

            if ($(this).closest('#sidebar').hasClass('sicebarActive')) {
                $('#sidebar').toggleClass('sicebarActive');
            }
        });

        $('.sideBarIconMobile').on('click', function() {
            $('.sideBarLeft').toggleClass('resActiveBar');
        });

        $('.sideBarcloseIconRes').on('click', function() {
            $('.sideBarLeft').toggleClass('resActiveBar');
        });

        $('.iconHide').on('click', function() {
            $('.iconShow').slideToggle();
        });

        var dt = $('.dTable').DataTable({
            "lengthMenu": [10],
            "pageLength": 10,
            "lengthChange": false,
            "info": false,
            "language": {
                "search": "",
                "searchPlaceholder": "Search",
                "paginate": {
                    "next": "Next",
                    "previous": "Previous"
                },
            },
            "responsive": true,
            "scrollX": true,
        });
        $('.customSearchInput').on('input', function() {
            var searchValue = $(this).val();
            dt.search(searchValue).draw();
        });

        $('.userContentScreen').on('click', function() {
            toggleFullScreen();
        });

        function toggleFullScreen() {
            if (!document.fullscreenElement &&
                !document.mozFullScreenElement &&
                !document.webkitFullscreenElement &&
                !document.msFullscreenElement) {
                if (document.documentElement.requestFullscreen) {
                    document.documentElement.requestFullscreen();
                } else if (document.documentElement.mozRequestFullScreen) {
                    document.documentElement.mozRequestFullScreen();
                } else if (document.documentElement.webkitRequestFullscreen) {
                    document.documentElement.webkitRequestFullscreen();
                } else if (document.documentElement.msRequestFullscreen) {
                    document.documentElement.msRequestFullscreen();
                }
            } else {
                if (document.exitFullscreen) {
                    document.exitFullscreen();
                } else if (document.mozCancelFullScreen) {
                    document.mozCancelFullScreen();
                } else if (document.webkitExitFullscreen) {
                    document.webkitExitFullscreen();
                } else if (document.msExitFullscreen) {
                    document.msExitFullscreen();
                }
            }
        }
    });
</script>

<script type="text/javascript" charset="UTF-8">
    var oTable = '',
        r_u_sure = "<?= lang('r_u_sure') ?>";
    <?= $s2_file_date ?>
    $.extend(true, $.fn.dataTable.defaults, {
        // "oLanguage": <?= $dt_lang ?>
    });
    $.fn.datetimepicker.dates['sma'] = <?= $dp_lang ?>;
    $(window).load(function() {
        $('.mm_<?= $m ?>').addClass('active');
        $('.mm_<?= $m ?>').find("ul").first().slideToggle();
        $('#<?= $m ?>_<?= $v ?>').addClass('active');
        $('.mm_<?= $m ?> a .chevron').removeClass("closed").addClass("opened");
    });
</script>
<?= (DEMO) ? '<script src="' . $assets . 'js/ppp_ad.min.js"></script>' : ''; ?>
</body>

</html>