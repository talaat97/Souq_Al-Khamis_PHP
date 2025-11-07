<?php

include "../../connect.php";

$id = filterRequest("id");

getAllData("ordersview","order_status = 3 AND order_delivery = $id",null);

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