<?php

include "../../connect.php";

// استقبال القيم من الـ frontend
$limit = filterRequest("limit");
$offset = filterRequest("offset");

// تأمين القيم كـ أرقام صحيحة
$limit = (int) $limit;
$offset = (int) $offset;


getAllData("categories", "categories_id", $offset, $limit, null, [], true);
