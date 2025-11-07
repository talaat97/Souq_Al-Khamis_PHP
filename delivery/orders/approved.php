<?php
include "../../connect.php";
$deliveryId = filterRequest("deliveryId");
$deliveryName = filterRequest("deliveryName");
$userId = filterRequest("userId");
$orderId = filterRequest("orderId");
$userDeviceToken = filterRequest("userDeviceToken");



$data = array(
    'order_status' => 3,
    'order_delivery' => $deliveryId,
);
$count = updateData("customerorders", $data, "order_id = $orderId AND order_status = 2", false);
if ($count > 0) {
    //user 
    insertnotify('order on way', 'your order has been prepared and on way to shipping now', $userId, $orderId,  $userDeviceToken);
    // admin  
    sendFirebaseNotification(null, 'Hey!' ,"order $orderId has been approved by $deliveryName, wait preparing to be on way","admin");
    //an other delivery   
    sendFirebaseNotification(null,'Warnnig!' ,"order $orderId has been approved by $deliveryName","servises");
    echo json_encode(array("status" => "success"));
} else {
    echo json_encode(array("status" => "failure", "reason" => "the order aleady approved"));
}


// order status for delivery
//1 => 'wait to approve form admin', yellow
//2 => 'pending', deep-yellow
//3 => 'accepted', green 
//4 => 'done archived', grey 



