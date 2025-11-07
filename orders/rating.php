<?php

include "../connect.php";
$orderId = filterRequest("orderId");
$rating = filterRequest("rating");
$comment = filterRequest("comment");
$data = array(
    "order_rating"=> $rating,
    "order_rating_comment"=> $comment,
);
updateData("customerorders",$data,"order_id= $orderId");
