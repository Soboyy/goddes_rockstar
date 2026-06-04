<?php
include 'koneksi.php';

// Referensi: https://www.w3schools.com/php/php_mysql_delete.asp
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    header("Location: lagu.php");
    exit;
}

$id = (int) $_GET['id'];
mysqli_query($conn, "DELETE FROM lagu WHERE id_lagu = $id");
header("Location: lagu.php");
exit;
?>