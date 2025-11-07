<?php

include "../connect.php";
$orderId = filterRequest("orderId");

deleteData("customerorders", "`order_id`=$orderId AND `order_status` = 0 ");