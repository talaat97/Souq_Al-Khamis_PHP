<?php

include "../connect.php";

$email = filterRequest("email");
$password = sha1($_POST["password"]);
$deviceToken = filterRequest("deviceToken");



$count = getData("users", "user_email = ? AND user_password = ? AND users_approve = 1", array($email, $password));
if ($count > 0) {
    updateData("users", array("user_devicetoken" => $deviceToken), "user_email = $email", false);
}




