<?php

include "../connect.php";


$username = filterRequest("username");
$email = filterRequest("email");
$password = sha1($_POST["password"]);
$phone = filterRequest("phone");
$verfiycode = rand(10000, 99999);

$stml = $con->prepare("SELECT * FROM users WHERE user_email = ? OR user_phone = ?");
$stml->execute(array($email, $phone, ));
$count = $stml->rowCount();

if ($count > 0) {
    printfailure("EMAIL OR PHONE EXIST");
} else {
    $date = array(
        "user_name" => $username,
        "user_email" => $email,
        "user_password" => $password,
        "user_phone" => $phone,
        "user_verfiycode" => $verfiycode,

    );
    insertData("users", $date);
}