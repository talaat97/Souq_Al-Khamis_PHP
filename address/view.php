<?php

include "../connect.php";
$userid = filterRequest("userid");

$data = getAllData("address", "address_userid = $userid");





