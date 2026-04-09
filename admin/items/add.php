<?php

include '../../connect.php';

$msgError = array();

$table = "iteams";

$name = filterRequest("name");

$namear = filterRequest("nameAr");

$desc = filterRequest("desc");

$descar = filterRequest("descAr");

$count = filterRequest("count");

$price = filterRequest("price");

$discount = filterRequest("discount");

$active = filterRequest("active");

$catid = filterRequest("catid");

$datenow = date("Y-m-d H:i:s");


$imagename = imageUpload("../../upload/iteams/", "file");

$data = array(
    "iteams_name" => $name,
    "iteams_name_ar" => $namear,
    "iteams_dec" => $desc,
    "iteams_dec_ar" => $descar,
    "iteams_count" => $count,
    "iteams_price" => $price,
    "iteams_discount" => $discount,
    "iteams_active" => $active,
    "iteams_image" => $imagename,
    "iteams_cat" => $catid,
    "iteams_date" => $datenow
);

insertData($table, $data);