<?php

include "../connect.php";

$userid = filterRequest("userId");
getAllData("ordersview","order_userid = $userid AND order_status = 4",null);



// order status 
//1 => 'wait to approve', yellow
//2 => 'Preparing', deep-yellow
//3 => 'on way', green 
//4 => 'archived', grey 