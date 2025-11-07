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



$table = "categories";

$id = filterRequest("id");

$name = filterRequest("name");

$namear = filterRequest("namear");

$imageold = filterRequest("imageold");


$res = imageUpload("../../upload/categories", "files");

if ($res == "Empty") {
    $data = array(
        "categories_name" => $name,
        "categories_nama_ar" => $namear,
        "message" => "No file uploaded",
    );
} else {
    deleteFile("../../upload/categories", $imageold);
    $data = array(
        "categories_name" => $name,
        "categories_nama_ar" => $namear,
        "categories_image" => $res,
    );
}



updateData($table, $data, "categories_id = $id");