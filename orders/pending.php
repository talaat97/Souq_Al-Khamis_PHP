<?php

include "../connect.php";

$userid = filterRequest("userId");
getAllData("ordersview", null, null, null, "order_userid = $userid AND order_status != 4", [], true);