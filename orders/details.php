<?php

include "../connect.php";

$orderId = filterRequest("orderId");
getAllData("orderdetailsview", "order_id = $orderId", null);