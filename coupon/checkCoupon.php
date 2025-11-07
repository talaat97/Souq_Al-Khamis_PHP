<?php

include "../connect.php";


$Coupon = filterRequest("coupon");
$DateNow = date('Y.m.d H:i:s');
getData("coupon", "coupon_name = '$Coupon' AND coupon_expiredate> '$DateNow' AND coupon_count > '0'");