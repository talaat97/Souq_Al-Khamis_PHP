<?php

include "../../connect.php";

$id = filterRequest("id");
$imageName = filterRequest("imageName");

$countImage = deleteFile("../../upload/iteams/", $imageName);
$countdata = deleteData("iteams", "`iteams_id`=$id", false);





// التحقق من نتائج الحذف وإرسال الرد المناسب
if ($countImage == 0 && $countdata == 0) {
    echo json_encode(array("status" => "failure", "message" => "delete data and image failure"));
} elseif ($countImage > 0 && $countdata == 0) {
    echo json_encode(array("status" => "failure", "message" => "delete image only edit data input id or name or Arname"));
} elseif ($countImage == 0 && $countdata > 0) {
    echo json_encode(array("status" => "failure", "message" => "delete data only edit the image name or path to can delete it"));
} else {
    echo json_encode(array("status" => "success", "message" => "delete data and image"));
}