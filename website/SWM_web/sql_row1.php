<?php
include('config.php');
if (!$db) {
    die("Connection failed: " . mysqli_connect_error());
}

// Gets data from URL parameters.

$tid = $_POST['tid'];
$add = $_POST['add'];
$lat = $_POST['lat'];
$lng = $_POST['lon'];
$tcap = $_POST['tcap'];
$aid = $_POST['aid'];

// Inserts new row with place data.
$query = "INSERT INTO trucks (t_id, t_add, lat, lng, t_cap, a_id)
VALUES ($tid, '$add', $lat, $lng, $tcap, $aid)";


if (mysqli_query($db, $query)) {
    echo "New record created successfully";
} else {
    echo "Error: " . $query . "<br>" . mysqli_error($db);
}
?>