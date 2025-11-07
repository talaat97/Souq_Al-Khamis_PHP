<?php

include "../connect.php";
$userid = filterRequest("userid");
$iteamsid = filterRequest("iteamsid");
$data = array(
    'favorite_userid' => $userid,
    'favorite_iteamsid' => $iteamsid,

);

deleteData("favorite", "`favorite_userid`=$userid AND `favorite_iteamsid` =$iteamsid ");