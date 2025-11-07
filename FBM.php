<?php
include "connect.php";
$deviceToken = filterRequest("deviseToken");
sendFirebaseNotification($deviceToken, 'hi', 'test the Firebase messigng');
