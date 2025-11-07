<?php

include 'connect.php';

$id = filterRequest("id");
$oldData = getallData("categories", "`categories_id` = $id",null,true);

