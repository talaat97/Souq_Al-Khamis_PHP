<?php

include "../connect.php";

$categoryname = filterRequest("catName");
$userid = filterRequest("userid");



$stml = $con->prepare("SELECT iteams1view.*,1 as favorite , (iteams_price - iteams_price * iteams_discount/100)as iteamPriceDescount 
FROM iteams1view  
INNER join favorite 
on favorite.favorite_iteamsid = iteams1view.iteams_id 
and favorite.favorite_userid = $userid 
where categories_name = '$categoryname'
UNION all 
SELECT iteams1view.* ,0 as favorite , (iteams_price - iteams_price * iteams_discount/100)as iteamPriceDescount
from iteams1view 
where categories_name = '$categoryname' and iteams1view.iteams_id not in (
    SELECT iteams1view.iteams_id 
    FROM iteams1view 
    INNER join favorite 
    on favorite.favorite_iteamsid = iteams1view.iteams_id and favorite.favorite_userid = $userid
)
");

$stml->execute();
$data = $stml->fetchAll(PDO::FETCH_ASSOC);
$count = $stml->rowCount();

if ($count > 0) {
    echo json_encode(array("status" => "success", "data" => $data));
} else {
    echo json_encode(array("status" => "failure"));
}