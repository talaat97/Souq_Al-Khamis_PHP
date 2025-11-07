<?php

include "../connect.php";


$email = filterRequest("email");
$verfiycode = rand(10000, 99999);

$stml = $con->prepare(" SELECT * FROM `users` WHERE `user_email` = ? ");
$stml->execute(array($email));
$count = $stml->rowCount();

result($count);

if ($count > 0) {
    $data = array("user_verfiycode" => $verfiycode);
    updateData("users",$data, "user_email = '$email'",false);

}