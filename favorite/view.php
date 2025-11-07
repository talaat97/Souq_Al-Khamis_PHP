<?php

include "../connect.php";

$userid = filterRequest("userid");
getAllData("myfavorite", "favorite_userid = ?", array($userid));