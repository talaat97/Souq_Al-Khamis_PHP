<?php

include "../connect.php";
$userid = filterRequest("userid");
$iteamsid = filterRequest("iteamsid");

$data = array(
    'cart_userid' => $userid,
    'cart_itemsid' => $iteamsid,
);

insertData("cart", $data, true);