<?php

include "../connect.php";

$userid = filterRequest("userid");
$iteamsid = filterRequest("iteamsid");

$stmt = $con->prepare("SELECT COUNT(cart.cart_id) as countItems FROM cart WHERE `cart_userid` = '$userid' AND `cart_itemsid`= '$iteamsid'AND `cart_orders` = 0");
$stmt->execute();

$count = $stmt->rowCount();

$data = $stmt->fetchColumn();

if ($count > 0) {
    echo json_encode(
        array(
            "status" => "success",
            "data" => $data
        ),
    );
} else {
    echo json_encode(
        array(
            "status" => "faluire",
            "data" => "0"
        ),
    );
}