<?php
include "../../connect.php";

$orderId = (int) filterRequest("orderId");

if (!$orderId) {
    echo json_encode(["status" => "failure", "reason" => "orderId required"]);
    exit;
}

$stmt = $con->prepare("
    SELECT
        i.iteams_id             AS iteams_id,
        i.iteams_name          AS iteams_name,
        i.iteams_image          AS iteams_image,
        i.iteams_price          AS iteams_price,
        COUNT(c.cart_itemsid)   AS item_quantity,
        (COUNT(c.cart_itemsid) * i.iteams_price) AS item_subtotal
    FROM cart c
    INNER JOIN iteams i ON c.cart_itemsid = i.iteams_id
    WHERE c.cart_orders = :orderId
    GROUP BY i.iteams_id, i.iteams_name, i.iteams_image, i.iteams_price
");

$stmt->bindValue(':orderId', $orderId, PDO::PARAM_INT);
$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count = count($data);

echo json_encode([
    "status" => $count > 0 ? "success" : "failure",
    "count" => $count,
    "data" => $data
]);