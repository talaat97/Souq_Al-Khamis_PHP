<?php
include "../../connect.php";

// استقبال القيم من الـ frontend
$limit = filterRequest("limit");
$offset = filterRequest("offset");

// تأمين القيم كـ أرقام صحيحة
$limit = (int)$limit;
$offset = (int)$offset;

$stmt = $con->prepare("SELECT * FROM notification ORDER BY notification_id LIMIT :offset, :limit");
$stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
$stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
$stmt->execute();

$data = $stmt->fetchAll(PDO::FETCH_ASSOC);

if ($data) {
    echo json_encode([
        "status" => "success",
        "data"   => $data,
    ]);
} else {
    echo json_encode([
        "status" => "failure",
        "data"   => [],
    ]);
}
