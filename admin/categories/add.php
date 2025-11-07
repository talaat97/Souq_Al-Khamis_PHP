<?php

include "../../connect.php";

// استقبال البيانات من الطلب
$table = "categories";


$name = filterRequest("name");
$nameAr = filterRequest("nameAr");



// رفع الصورة
$imageName = imageUpload("../../upload/categories/", "file");

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

// تجهيز البيانات للإدخال
$data = array(
    'categories_name' => $name,
    'categories_name_ar' => $nameAr,
    'categories_image' => $imageName,

);

// تنفيذ عملية الإدخال
insertData($table, $data);


