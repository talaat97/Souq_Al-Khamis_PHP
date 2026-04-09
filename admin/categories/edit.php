<?php

include "../../connect.php";


$table = "categories";

$id = filterRequest("id");

$name = filterRequest("name");

$nameAr = filterRequest("nameAr");

$imageold = filterRequest("imageold");


$res = imageUpload("../../upload/categories/", "file");

if ($res == "Empty") {
    $data = array(
        "categories_name" => $name,
        "categories_name_ar" => $nameAr,
    );
} else {
    deleteFile("../../upload/categories/", $imageold);
    $data = array(
        "categories_name" => $name,
        "categories_name_ar" => $nameAr,
        "categories_image" => $res,
    );
}



updateData($table, $data, "categories_id = $id");