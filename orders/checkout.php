<?php

include "../connect.php";

$userid = filterRequest("userId");
$addressId = filterRequest("addressId");
$orderType = filterRequest("odrderType");
$priceDelivery = filterRequest("priceDelivery");
$paymentMethod = filterRequest("paymentMethod");
$ordersPrice = filterRequest("ordersPrice");
$couponId = filterRequest("couponId");
$couponDiscount = filterRequest("couponDiscount");
$userDeviceToken = filterRequest("userDeviceToken");
$orderTotalPrice = $ordersPrice;

// check order type 
if ($orderType == '1') {
    $priceDelivery = 0 ;
}


//check coupon 
$DateNow = date('Y.m.d H:i:s');
$checkCouponVaild = getData("coupon", "`coupon_id` = $couponId AND `coupon_expiredate` > '$DateNow' AND `coupon_count` > 0 ",null ,false);
if ($checkCouponVaild > 0) {
    $orderTotalPrice = $ordersPrice - $ordersPrice * $couponDiscount /100 ;
    $stml = $con->prepare("UPDATE coupon set `coupon_count` = `coupon_count` -1 where `coupon_id` = $couponId");
    $stml->execute();
}


$data = array(
    "order_userid" => $userid,
    "order_address" => $addressId,
    "order_type" => $orderType,
    "order_price_delivery" => $priceDelivery,
    "order_price" => $ordersPrice,
    "order_total_price" => $orderTotalPrice,
    "order_payment_method" => $paymentMethod,
    "order_user_devicetoken" => $userDeviceToken,
);
$count = insertData("customerorders", $data, );

if ($count > 0) {
    $stml = $con->prepare("SELECT MAX(order_id) From customerorders");
    $stml->execute();
    $maxid = $stml->fetchColumn();
    $data = array(
        "cart_orders" => $maxid,
    );
    updateData('cart', $data, "cart_userid = $userid AND cart_orders = 0",false);

}