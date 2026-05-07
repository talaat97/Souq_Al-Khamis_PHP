<?php
include "../../connect.php";

$userid = filterRequest("userid");
$orderId = (int) filterRequest("orderId");
$userDeviceToken = filterRequest("deviceToken");

$data = ['order_status' => 2];
$count = updateData("customerorders", $data, "order_id = $orderId AND order_status = 1", false);

if ($count > 0) {
    insertnotify('Order Approved', 'Your order is now under shipping', $userid, $orderId, $userDeviceToken, null, false);
    echo json_encode(["status" => "success"]);
} else {
    echo json_encode(["status" => "failure", "reason" => "order already approved"]);
}