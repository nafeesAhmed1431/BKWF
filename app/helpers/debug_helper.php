<?php defined('BASEPATH') or exit('No direct script access allowed');

if (!function_exists('__')) {
    function __($data)
    {
        exit(print_r(['<pre>', $data]));
    }
}
