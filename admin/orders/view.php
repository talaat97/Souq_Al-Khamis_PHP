<?php
include "../../connect.php";

$limit = (int) filterRequest("limit");
$offset = (int) filterRequest("offset");
$status = filterRequest("status"); // "all" or a number like "0","1","2","3","4"

$where = $status === "all" ? null : "order_status = :status";
$values = $status === "all" ? [] : [':status' => $status];

getAllData("ordersview", "order_id", $offset, $limit, $where, $values, true);


