<?php

include "../connect.php";
$userid = filterRequest("userid");

$data = getAllData("address", null, null, null, "address_userid = $userid", [], true);
