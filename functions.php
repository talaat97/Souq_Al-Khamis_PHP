<?php

// ==========================================================
//  Copyright Reserved Wael Wael Abo Hamza (Course Ecommerce)
// ==========================================================
// to can user FCM messaging
require __DIR__ . '/vendor/autoload.php';

use Kreait\Firebase\Factory;
use Kreait\Firebase\Messaging\CloudMessage;
use Kreait\Firebase\Messaging\Notification;
define("MB", 1048576);
//===========================================================
function filterRequest($requestname)
{
    return htmlspecialchars(strip_tags($_POST[$requestname]));
}

function getAllData(
    string $table,
    string $orderBy = null,
    int $offset = null,
    int $limit = null,
    string $where = null,
    array $values = [],
    bool $json = true,
) {
    global $con;

    // ⚠️ Basic validation (VERY IMPORTANT)
    if (!preg_match('/^[a-zA-Z0-9_]+$/', $table)) {
        die("Invalid table name");
    }

    $sql = "SELECT * FROM $table";

    // WHERE
    if ($where !== null) {
        $sql .= " WHERE $where";
    }

    // ORDER BY
    if ($orderBy !== null) {
        if (!preg_match('/^[a-zA-Z0-9_]+$/', $orderBy)) {
            die("Invalid order by column");
        }
        $sql .= " ORDER BY $orderBy DESC";
    }

    // LIMIT & OFFSET
    if ($limit !== null && $offset !== null) {
        $sql .= " LIMIT :offset, :limit";
    }

    $stmt = $con->prepare($sql);

    // Bind WHERE values
    if (!empty($values)) {
        foreach ($values as $key => $value) {
            $stmt->bindValue($key, $value);
        }
    }

    // Bind pagination values
    if ($limit !== null && $offset !== null) {
        $stmt->bindValue(':offset', (int) $offset, PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, PDO::PARAM_INT);
    }

    $stmt->execute();

    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $count = count($data);

    if ($json) {
        echo json_encode([
            "status" => $count > 0 ? "success" : "failure",
            "count" => $count,
            "data" => $data
        ]);
    } else {
        return $data;
    }
}


function getData($table, $where = null, $values = null, $json = true)
{
    global $con;
    $data = array();

    $stmt = $con->prepare("SELECT  * FROM $table WHERE   $where ");
    $stmt->execute($values);
    $data = $stmt->fetch(PDO::FETCH_ASSOC);
    $count = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => "success", "data" => $data));
        } else {
            echo json_encode(array("status" => "failure"));
        }
    } else {
        return $count;
    }


}


function insertData($table, $data, $json = true)
{
    global $con;
    foreach ($data as $field => $v)
        $ins[] = ':' . $field;
    $ins = implode(',', $ins);
    $fields = implode(',', array_keys($data));
    $sql = "INSERT INTO $table ($fields) VALUES ($ins)";

    $stmt = $con->prepare($sql);
    foreach ($data as $f => $v) {
        $stmt->bindValue(':' . $f, $v);
    }
    $stmt->execute();
    $count = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => "success", "data" => $data));
        } else {
            echo json_encode(array("status" => "failure"));
        }
    }
    return $count;
}

function updateDataVefriyCode($where, $json = true)
{
    global $con;
    $sql = "UPDATE `users` SET `users_aprrove`='1' WHERE $where";
    $stmt = $con->prepare($sql);
    $stmt->execute();
    $count = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => "success"));
        } else {
            echo json_encode(array("status" => "failure"));
        }
    }
    return $count;
}


function updateData($table, $data, $where, $json = true)
{
    global $con;
    $cols = array();
    $vals = array();

    foreach ($data as $key => $val) {
        $vals[] = "$val";
        $cols[] = "`$key` =  ? ";
    }

    $sql = "UPDATE $table SET " . implode(', ', $cols) . "WHERE $where ";
    $stmt = $con->prepare($sql);
    $stmt->execute($vals);
    $count = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => "success", "success", "data" => $data));
        } else {
            echo json_encode(array("status" => "failure"));
        }
    }
    return $count;
}
function deleteData($table, $where, $json = true)
{
    global $con;
    $stmt = $con->prepare("DELETE FROM $table WHERE $where");
    $stmt->execute();
    $count = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => "success"));
        } else {
            echo json_encode(array("status" => "failure"));
        }
    }
    return $count;
}
function imageUpload($dir, $imageRequest)
{
    global $msgError;

    if (isset($_FILES[$imageRequest])) {
        $imagetmp = $_FILES[$imageRequest]['tmp_name'];
        $imagesize = $_FILES[$imageRequest]['size'];

        // ── Clean name ────────────────────────────────
        $ext = strtolower(pathinfo($_FILES[$imageRequest]['name'], PATHINFO_EXTENSION));
        $imagename = uniqid() . '.' . $ext; // e.g → 6579f3a2c1d4e.jpg ✅

        $allowExt = ["svg", "jpg", "png", "gif", "mp3", "pdf", "jpeg"];

        if (!empty($imagename) && !in_array($ext, $allowExt)) {
            $msgError = "EXT";
        }

        if ($imagesize > 2 * MB) {
            $msgError = "size";
        }

        if (empty($msgError)) {
            move_uploaded_file($imagetmp, $dir . $imagename);
            return $imagename;
        } else {
            return $msgError;
        }
    } else {
        return "Empty";
    }
}

function deleteFile($dir, $imagename)
{
    $dir = rtrim($dir, '/'); // remove trailing slash if exists
    $path = $dir . '/' . $imagename;

    if (file_exists($path)) {
        unlink($path);
        return 1;
    }
    return 0;
}
function checkAuthenticate()
{
    if (isset($_SERVER['PHP_AUTH_USER']) && isset($_SERVER['PHP_AUTH_PW'])) {
        if ($_SERVER['PHP_AUTH_USER'] != "wael" || $_SERVER['PHP_AUTH_PW'] != "wael12345") {
            header('WWW-Authenticate: Basic realm="My Realm"');
            header('HTTP/1.0 401 Unauthorized');
            echo 'Page Not Found';
            exit;
        }
    } else {
        exit;
    }


    // End 
}
function printfailure($message = "none")
{

    echo json_encode(array(
        "status" => "failure",
        "message" => $message
    ));
}
function printsuccess($message = "none")
{

    echo json_encode(array(
        "status" => "success",
        "message" => $message,
    ));
}

function result($count)
{
    if ($count > 0) {
        printsuccess();
    } else {
        printfailure();
    }
}

function sendEmail(
    $to,
    $title,
    $body,
) {


    $header = "form support@talaat.gmail . \n . CC:talaat12345@gmail.com";
    mail($to, $title, $body, $header);
    echo "success";
}


function sendFirebaseNotification($deviceToken = null, $title, $body, $topic = null, $json = false)
{
    if (!$deviceToken && !$topic) {
        echo "you have at leats add either device token or topic ❌";
        return;
    }

    // تحميل بيانات الخدمة
    $factory = (new Factory)->withServiceAccount(__DIR__ . '/firebase/firebase-adminsdk.json');
    $messaging = $factory->createMessaging();

    // إعداد الإشعار
    $notification = Notification::create($title, $body);

    if ($deviceToken) {
        $message = CloudMessage::withTarget('token', $deviceToken)
            ->withNotification($notification);
    } elseif ($topic) {
        $message = CloudMessage::withTarget('topic', $topic)
            ->withNotification($notification);
    }

    // إرسال الإشعار
    if ($json) {
        try {
            $messaging->send($message);
            echo "sucecess send message ✅" . ($deviceToken ? 'Device Token' : "Topic: $topic");
        } catch (Exception $e) {
            echo "Erorr in send message ❌" . $e->getMessage();
        }
    }

}


function insertnotify($title, $body, $userid, $orderId, $deviceToken = null, $topic = null)
{
    sendFirebaseNotification($deviceToken, $title, $body, $topic);
    global $con;
    $stml = $con->prepare("INSERT INTO `notification`(`notification_title`, `notification_body`, `notification_userid`,`notification_orderId`) VALUES ('$title','$body','$userid','$orderId')");
    $stml->execute();

}