<?php
$host     = "sql213.infinityfree.com";
$username = "if0_42041792";
$password = "prakbasdat01";
$database = "if0_42041792_reality_club_db";

$conn = mysqli_connect($host, $username, $password, $database);

if (!$conn) {
    die("Koneksi gagal: " . mysqli_connect_error());
}
?>