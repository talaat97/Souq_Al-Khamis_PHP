<?php

include "connect.php";

$alldata = array();
$categories = getAllData("categories", null, null, null, null, [], false);
$iteams = getAllData("topsailerview", null, null, 7, null, [], false);
$newArrivals = getAllData("iteams", "iteams_date", 1, 7, null, [], false);
$offers = getAllData("iteams", "iteams_discount", 1, 7, null, [], false);
$recommended = getRandomData("iteams", 7, "iteams_active = 1", [], false);

$alldata['status'] = "success";
$alldata['categories'] = $categories;
$alldata['iteams'] = $iteams;
$alldata['newArrivals'] = $newArrivals;
$alldata['offers'] = $offers;
$alldata['recommended'] = $recommended;
echo json_encode($alldata);

