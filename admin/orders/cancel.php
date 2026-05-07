<?php
include "../../connect.php";

$userid = filterRequest("userid");
$orderId = (int) filterRequest("orderId");
$deviceToken = filterRequest("deviceToken");
$cancelReason = filterRequest("cancelreason");

$data = [
    'order_status' => 0,
    'order_cancel_reason' => $cancelReason
];

$count = updateData("customerorders", $data, "order_id = $orderId AND order_status != 4 AND order_status != 0", false);

if ($count > 0) {
    insertnotify('Order Cancelled', 'Your order has been cancelled by the admin', $userid, $orderId, $deviceToken , null);
    echo json_encode(["status" => "success"]);
} else {
    echo json_encode(["status" => "failure"]);
}
