<?php

include "../../connect.php";

$id = filterRequest("id");

getAllData("ordersview","order_status = 4 AND order_delivery = $id ",null);




// order status for delivery
//1 => 'wait to approve form admin', yellow
//2 => 'pending', deep-yellow
//3 => 'accepted', green 
//4 => 'done archived', grey 