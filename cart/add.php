<?php

include "../connect.php";
$userid = filterRequest("userid");
$iteamsid = filterRequest("iteamsid");

$data = array(
    'cart_userid' => $userid,
    'cart_itemsid' => $iteamsid,
);

$count = getData("cart", "`cart_userid` = $userid AND `cart_itemsid`=$iteamsid AND `cart_orders` = 0", null, false);


insertData("cart", $data, true);