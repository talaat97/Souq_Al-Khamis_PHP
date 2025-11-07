<?php

include "../connect.php";
$userid = filterRequest("userid");
$iteamsid = filterRequest("iteamsid");
$data = array(
    'cart_userid' => $userid,
    'cart_itemsid' => $iteamsid,

);
//deleteData("cart" , "cart_id  = (SELECT cart_id FROM cart WHERE cart_usersid = $usersid AND cart_itemsid = $itemsid LIMIT 1)"); 
deleteData("cart", "`cart_userid`=$userid AND `cart_orders` = 0 AND `cart_itemsid` =$iteamsid LIMIT 1");