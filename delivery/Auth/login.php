<?php

include "../../connect.php";


$email = filterRequest("email");
$password = filterRequest("password");
getData("delivery", "(`delivery_email` = ? AND `delivery_password` = ? AND delivery_approve = 1)", array($email, $password));
