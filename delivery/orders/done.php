<?php
include "../../connect.php";
$userId = filterRequest("userId");
$orderId = filterRequest("orderId");
$deliveyId = filterRequest("deliveryId");
$userDeviceToken = filterRequest("userDeviceToken");

$data = array(
    'order_status' => 4,
);
$count = updateData("customerorders", $data, "order_id = $orderId AND order_status = 3", false);
if ($count > 0) {
    //user
    insertnotify('Thanks to user or servise', " your order hass ben delivery successfuly , order $orderId by $deliveyId", $userId, $orderId, $userDeviceToken);
    //admin 
    sendFirebaseNotification(null, 'Hey!', "order $userId has been deliverd successfuly", "admin");
    echo json_encode(array("status" => "success"));
} else {
    echo json_encode(array("status" => "failure", "reason" => "the order is already on way"));
}



// order status for user 
//1 => 'wait to approve', yellow
//2 => 'Preparing', deep-yellow
//3 => 'on way', green 
//4 => 'archived', grey 

// order status for delivery
//1 => 'wait to approve form admin', yellow
//2 => 'pending', deep-yellow
//3 => 'accepted work on', green 
//4 => 'done archived', grey 