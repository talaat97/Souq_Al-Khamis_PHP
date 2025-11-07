<?php

include "../../connect.php";

/*
$table = "categories";
//id of old category edit 
$id = filterRequest("id");
//patametars of new category edit
$name = filterRequest("name");
$nameAr = filterRequest("nameAr");
$imageold = filterRequest("imageold");
$image = imageUpload("../../upload/categories/", "file");
$datetime = date("Y-m-d H:i:s");


// احصل على البيانات القديمة
if ($oldData["status"] === "failure") {
    echo json_encode(["status" => "fail", "message" => "Category not found"]);
    exit;
}
// تحقق من نجاح رفع الصورة
if ($imageName === "Empty") {
    echo json_encode(array("status" => "failure", "message" => "No file uploaded", ));
    exit;
} elseif ($imageName === "EXT") {
    echo json_encode(array("status" => "failure", "message" => "File not in support formate", ));
    exit;
} elseif ($imageName === "size") {
    echo json_encode(array("status" => "size", "message" => "File size is too large", ));
    exit;
}


$data = array(
    'category_name' => $name !== null && $name !== '' ? $name : $oldData['data']['category_name'],
    'categories_name_ar' => $nameAr !== null && $nameAr !== '' ? $nameAr : $oldData['data']['categories_name_ar'],
    'categories_image' => $image !== null && $image !== '' ? $image : $oldData['data']['categories_image'],
    'categories_datetime' => $datetime !== null && $datetime !== '' ? $datetime : $oldData['data']['categories_datetime'],
);

updateData($table, $data, "`categories_id` = $id", );

deleteFile("../../upload/categories/", $oldData['data']['categories_image']);
*/



$table = "iteams";


$id = filterRequest("id");

$name = filterRequest("name");

$namear = filterRequest("namear");

$desc = filterRequest("desc");
$descar = filterRequest("descar");

$count = filterRequest("count");
$active = filterRequest("active");
$price = filterRequest("price");
$discount = filterRequest("discount");

$catid = filterRequest("catid");

$imageold = filterRequest("imageold");


$res = imageUpload("../../upload/iteams/", "files");
echo "the res value ======================================> $res";
if ($res == "Empty") {
    $data = array(
        "iteams_name" => $name,
        "iteams_name_ar" => $namear,
        "iteams_dec" => $desc,
        "iteams_dec_ar" => $descar,
        "iteams_count" => $count,
        "iteams_price" => $price,
        "iteams_discount" => $discount,
        "iteams_active" => $active,
        "iteams_cat" => $catid
    );
} else {
    deleteFile("../../upload/iteams", $imageold);
    $data = array(
        "iteams_name" => $name,
        "iteams_name_ar" => $namear,
        "iteams_dec" => $desc,
        "iteams_dec_ar" => $descar,
        "iteams_count" => $count,
        "iteams_price" => $price,
        "iteams_discount" => $discount,
        "iteams_active" => $active,
        "iteams_image" => $res,
        "iteams_cat" => $catid
    );
}



updateData($table, $data, "iteams_id = $id");