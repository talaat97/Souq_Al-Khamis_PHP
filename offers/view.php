<?php

include "../connect.php";

//I change the iteams1view to itemsview_withrating to get the rating of the item
$stml = $con->prepare("SELECT itemsview_withrating.*, (iteams_price - iteams_price * iteams_discount/100)as iteamPriceDescount 
FROM itemsview_withrating 
where iteams_discount != 0 
");


$stml->execute();
$data = $stml->fetchAll(PDO::FETCH_ASSOC);
$count = $stml->rowCount();

if ($count > 0) {
    echo json_encode(array("status" => "success", "data" => $data));
} else {
    echo json_encode(array("status" => "failure"));
}