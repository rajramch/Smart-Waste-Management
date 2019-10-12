<?php
include('config.php');
if (!$db) {
    die("Connection failed: " . mysqli_connect_error());
}

// Gets data from URL parameters.

$bid = $_POST['bid'];
$add = $_POST['add'];
$lat = $_POST['lat'];
$lng = $_POST['lon'];
$tid = $_POST['tid'];
$aid = $_POST['aid'];

// Inserts new row with place data.
$query = "INSERT INTO bins (bins_id,lat,lng,t_id,a_id,bins_add)
VALUES ($bid,$lat,$lng, $tid,$aid,'$add')";


if (mysqli_query($db, $query)) {
    echo "New record created successfully";
} else {
    echo "Error: " . $query . "<br>" . mysqli_error($db);
}

/*
$result = mysqli_query($db,$query);

if (!$result) {

  die('Invalid query: ' . mysqli_error());
}
 */

?>