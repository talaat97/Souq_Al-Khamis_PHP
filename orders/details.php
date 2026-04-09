<?php

include "../connect.php";

$orderId = filterRequest("orderId");
getAllData("orderdetailsview", null, null, null, "order_id = $orderId", [], false);