<?php
include "connect.php";
$deviceToken = filterRequest("deviceToken");
sendFirebaseNotification($deviceToken, 'hi', 'test the Firebase messigng', null, true);
