<?php

include "../../connect.php";

getAllData("ordersview", null, null, null, "order_status = 2 AND order_type = 0");




// order status for delivery
//1 => 'wait to approve form admin', yellow
//2 => 'pending', deep-yellow
//3 => 'accepted work on', green 
//4 => 'done archived', grey 