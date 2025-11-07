<?php

include "../../connect.php";
//take the category id 
$categoriesid = filterRequest("categoriesid");



//get all items of this category 
$stml = $con->prepare("SELECT * from iteams1view WHERE `categories_id` = $categoriesid");
$stml->execute();
$items = $stml->fetchAll(PDO::FETCH_ASSOC);


$count = $stml->rowCount();

if ($count > 0) {
    echo json_encode(array(
        "status" => "success",
        "data" => $items,
    ));
} else {
    echo json_encode(array("status" => "failure"));
}




