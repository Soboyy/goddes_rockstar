<?php
include 'koneksi.php';

if (isset($_GET['id']) && $_GET['id'] !== '') {
    $id = mysqli_real_escape_string($conn, $_GET['id']);

    // HANYA menggunakan id_region
    $query_delete = "DELETE FROM regions WHERE id_region = '$id'";

    if (mysqli_query($conn, $query_delete)) {
        header("Location: region.php");
        exit;
    } else {
        echo "Gagal menghapus data: " . mysqli_error($conn);
    }
} else {
    header("Location: region.php");
    exit;
}
?>