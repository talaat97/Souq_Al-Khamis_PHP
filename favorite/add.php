<?php

include "../connect.php";
$userid = filterRequest("userid");
$iteamsid = filterRequest("iteamsid");
$data = array(
    'favorite_userid' => $userid,
    'favorite_iteamsid' => $iteamsid,

);

insertData("favorite", $data);