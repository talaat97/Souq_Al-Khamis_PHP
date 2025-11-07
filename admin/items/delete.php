<?php

include "../../connect.php";

$id = filterRequest("id");

$imagename = filterRequest("imagename");

$deleted = deleteFile("../../upload/iteams/", $imagename);
$count = deleteData("iteams", "iteams_id = $id", false);

if ($deleted && $count > 0) {
    echo json_encode(["status" => "success"]);
} else {
    echo json_encode(["status" => "failure"]);
}