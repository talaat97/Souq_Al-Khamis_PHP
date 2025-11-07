<?php

include "../connect.php";

$search = filterRequest("search");


$stml = $con->prepare("SELECT iteams1view.*,(iteams_price - iteams_price * iteams_discount/100)as iteamPriceDescount 
FROM iteams1view 
where `iteams_name_ar` LIKE '%$search%'  OR `iteams_name` LIKE '%$search%'
");

$stml->execute();
$data = $stml->fetchAll(PDO::FETCH_ASSOC);
$count = $stml->rowCount();

if ($count > 0) {
    echo json_encode(array("status" => "success", "data" => $data));
} else {
    echo json_encode(array("status" => "failure"));
}
//getAllData("iteams1view", "`iteams_name_ar` LIKE '%$search%'  OR `iteams_name` LIKE '%$search%'");






