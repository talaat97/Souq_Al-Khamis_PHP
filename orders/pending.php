<?php

include "../connect.php";

$userid = filterRequest("userId");
getAllData("ordersview","order_userid = $userid AND order_status != 4",null);