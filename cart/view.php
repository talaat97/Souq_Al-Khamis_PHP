<?php

include "../connect.php";
$userid = filterRequest("userid");


$data = getAllData("cartView", null, null, null, "cart_userid = $userid", [], false);


$stmt = $con->prepare("SELECT SUM(cartview.iteamsPrice) as totalCartPrice , SUM(cartview.countItems) as totalCartIteamsCount FROM `cartview` 
where cart_userid = $userid  
GROUP by cart_userid");

$stmt->execute();
$totalCartPriceAndCount = $stmt->fetch(PDO::FETCH_ASSOC);

if ($data != null) {
    echo json_encode(
        array(
            "status" => "success",
            "Cartdata" => $data,
            "totalCartPriceAndCount" => $totalCartPriceAndCount,
        ),
    );
} else {
    echo json_encode(
        array(
            "status" => "faliure",
        ),
    );
}




