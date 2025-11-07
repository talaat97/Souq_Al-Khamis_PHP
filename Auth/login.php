<?php

include "../connect.php";


$email = filterRequest("email");
$password = sha1($_POST["password"]);

// $stml = $con->prepare(" SELECT * FROM `users` WHERE (`user_email` = ? AND `user_password` = ? AND users_approve = 1 )");
// $stml->execute(array($email, $password));
// $count = $stml->rowCount();


getData("`users`", "(`user_email` = ? AND `user_password` = ?)", array($email, $password));
