<?php
include 'koneksi.php';

if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    header("Location: gigs.php");
    exit;
}

$id = (int) $_GET['id'];
mysqli_query($conn, "DELETE FROM gigs WHERE id_gig = $id");
header("Location: gigs.php");
exit;
?>