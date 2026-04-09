<?php

include "../connect.php";
$userid = filterRequest("userid");


getAllData("notification", null, null, null, "notification_userid = $userid", [], true);










