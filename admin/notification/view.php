<?php
include "../../connect.php";

// استقبال القيم من الـ frontend
// استقبال القيم من الـ frontend
$limit = filterRequest("limit");
$offset = filterRequest("offset");

// تأمين القيم كـ أرقام صحيحة
$limit = (int) $limit;
$offset = (int) $offset;


getAllData(
    table: "notification",
    where: null,
    values: [],
    orderBy: "notification_id",
    offset: $offset,
    limit: $limit,
    json: true
);
