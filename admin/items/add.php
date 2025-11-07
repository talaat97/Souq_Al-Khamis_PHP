<?php

include '../../connect.php';

$msgError = array();

$table = "iteams";

$name = filterRequest("name");

$namear = filterRequest("namear");

$desc = filterRequest("desc");

$descar = filterRequest("descar");

$count = filterRequest("count");

$price = filterRequest("price");

$discount = filterRequest("discount");

$catid = filterRequest("catid");

$datenow = filterRequest("datenow");


$imagename = imageUpload("../../upload/iteams/", "files");

$data = array(
    "iteams_name" => $name,
    "iteams_name_ar" => $namear,
    "iteams_dec" => $desc,
    "iteams_dec_ar" => $descar,
    "iteams_count" => $count,
    "iteams_price" => $price,
    "iteams_discount" => $discount,
    "iteams_active" => "1",
    "iteams_image" => $imagename,
    "iteams_cat" => $catid,
    "iteams_date" => $datenow
);

insertData($table, $data);