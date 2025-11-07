<?php
include "../../connect.php";
$userid = filterRequest("userid");
$orderId = filterRequest("orderId");
$accessToken = filterRequest("accessToken");
$deviceToken = filterRequest("deviceToken");
$topic = filterRequest("topic");

$data = array(
    'order_status' => 1,
);
$count = updateData("customerorders", $data, "order_id = $orderId AND order_status = 0", false);
if ($count > 0) {
    insertnotify('order approve', 'your order has been approve under shipping now', $userid, $orderId,  $deviceToken);
    echo json_encode(array("status" => "success"));
} else {
    echo json_encode(array("status" => "failure", "reason" => "the order aleady approved"));
}



