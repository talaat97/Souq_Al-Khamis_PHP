<?php

include "../../connect.php";
// استقبال البيانات من الطلب
$id = filterRequest("id");
$imageName = filterRequest("imageName");
// تنفيذ عملية الحذف
$countImage = deleteFile("../../upload/categories/", $imageName);
$countdata = deleteData("categories", "`categories_id` = $id", false);



// التحقق من نتائج الحذف وإرسال الرد المناسب
if ($countImage == 0 && $countdata == 0) {
    echo json_encode(array("failure" => "delete data and image failure"));
} elseif ($countImage > 0 && $countdata == 0) {
    echo json_encode(array("failure" => "delete image only edit data input id or name or Arname"));
} elseif ($countImage == 0 && $countdata > 0) {
    echo json_encode(array("failure" => "delete data only edit the image name or path to can delete it"));
} else {
    echo json_encode(array("status" => "success delete data and image"));
}