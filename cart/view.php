<?php

include "../connect.php";
$userid = filterRequest("userid");

$data = getAllData("cartView", "cart_userid = $userid", null, false);

$stmt = $con->prepare("SELECT SUM(cartview.iteamsPrice * cartview.countItems) as totalPrice , SUM(cartview.countItems) as iteamsCount FROM `cartview` 
where cart_userid = $userid 
GROUP by cart_userid");

$stmt->execute();
$priceAndCount = $stmt->fetch(PDO::FETCH_ASSOC);

if ($data != null) {
    echo json_encode(
        array(
            "status" => "success",
            "Cartdata" => $data,
            "priceAndCoun" => $priceAndCount,
        ),
    );
} else {
    array(
        "status" => "faliure",
    );
}




