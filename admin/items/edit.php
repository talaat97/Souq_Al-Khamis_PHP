<?php
include "../../connect.php";

// ── 1. Input ──────────────────────────────────────────
$table = "iteams";
$id = (int) filterRequest("id");       // cast to int = safe from SQL injection
$name = filterRequest("name");
$nameAr = filterRequest("nameAr");
$desc = filterRequest("desc");
$descAr = filterRequest("descAr");
$count = (int) filterRequest("count");
$price = (float) filterRequest("price");
$discount = (float) filterRequest("discount");
$active = (int) filterRequest("active");
$imageOld = filterRequest("imageold");

// ── 2. Validate ───────────────────────────────────────
if (!$id || empty($name) || empty($nameAr) || $price <= 0) {
    echo json_encode(["status" => "failure", "message" => "Invalid input"]);
    exit;
}

// ── 3. Handle image ───────────────────────────────────
$uploadPath = "../../upload/iteams/";
$res = imageUpload($uploadPath, "file");

if ($res == "size") {
    echo json_encode(["status" => "failure", "message" => "File size is too large"]);
    exit;
}
if ($res == "EXT") {
    echo json_encode(["status" => "failure", "message" => "Invalid file extension"]);
    exit;
}

// ── 4. Build data ─────────────────────────────────────
$data = [
    "iteams_name" => $name,
    "iteams_name_ar" => $nameAr,
    "iteams_dec" => $desc,
    "iteams_dec_ar" => $descAr,
    "iteams_count" => $count,
    "iteams_price" => $price,
    "iteams_discount" => $discount,
    "iteams_active" => $active,
];

// Only update image if new one was uploaded
if ($res != "Empty") {
    deleteFile($uploadPath, $imageOld);
    $data["iteams_image"] = $res;
}

// ── 5. Update & respond ───────────────────────────────
$updated = updateData($table, $data, "iteams_id = $id"); // make sure updateData uses prepared statements

if ($updated) {
    echo json_encode(["status" => "success", "message" => "Item updated successfully"]);
} else {
    echo json_encode(["status" => "failure", "message" => "Update failed"]);
}