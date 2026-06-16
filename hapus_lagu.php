<?php
include 'koneksi.php';

// Referensi: https://www.w3schools.com/php/php_mysql_delete.asp

// Validasi: pastikan ada parameter 'id' di URL dan berupa angka
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    header("Location: lagu.php");
    exit;
}

$id = (int) $_GET['id'];

// Jalankan query DELETE
$query = "DELETE FROM lagu WHERE id_lagu = $id";
mysqli_query($conn, $query);

// Kembali ke halaman daftar lagu
header("Location: lagu.php");
exit;
?>