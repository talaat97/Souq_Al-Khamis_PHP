<?php
include "../../connect.php";
$userid = filterRequest("userid");
$orderId = filterRequest("orderId");
$deviceToken = filterRequest("deviceToken");
$topic = filterRequest("topic");
$type = filterRequest("type");




if ($type =="0") {
    $data = array(
        'order_status' => 2,
    );
    } else{
    $data = array(
        'order_status' => 4,
    );
}
    $count = updateData("customerorders", $data, "order_id = $orderId AND order_status = 1", false);
    if ($count > 0) {
        // send notify and save to user order is preparing  
        insertnotify('order approve', 'your order has been approve', $userid, $orderId,  $deviceToken); 
        echo json_encode(array("status" => "success"));
    } else {
        echo json_encode(array("status" => "failure", "reason" => "the order aleady approved"));
    }


    if ($type =="0") {
        // send notify to delivery order havs been approved 
        sendFirebaseNotification($accessToken , 'Warnnig' ,"order $orderid has been approved , wait to prepare",'delivery');
    }


