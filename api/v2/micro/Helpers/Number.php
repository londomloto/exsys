<?php
namespace Micro\Helpers;

class Number {

    public static function format($number, $decimal = 2, $type = 'general', $locale = 'ID') {
        if ($type == 'general') {
            return number_format($number, $decimal, ',', '.');
        } else {
            if ($number > 0) {
                return number_format($number, $decimal, ',', '.');
            } else {
                return '('.number_format(abs($number), $decimal, ',', '.').')';
            }
        }
    }

}