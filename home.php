<?php

include "connect.php";

$alldata = array();
$categories = getAllData("categories", null, null, false);
$iteams = getAllData("topsailerview", null, null, false);

$alldata['status'] = "success";
$alldata['categories'] = $categories;
$alldata['iteams'] = $iteams;
echo json_encode($alldata);

