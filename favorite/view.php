<?php

include "../connect.php";

$userid = filterRequest("userid");
getAllData("myfavorite", null, null, null, "favorite_userid = $userid", [], true);