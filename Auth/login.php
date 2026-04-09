<?php

include "../connect.php";

$email = filterRequest("email");
$password = sha1($_POST["password"]);
//$password = $_POST["password"];

getData("users", "user_email = ? AND user_password = ? AND users_approve = 1", array($email, $password));



