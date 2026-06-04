<?php
include 'koneksi.php';

if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    header("Location: members.php");
    exit;
}

$id = (int) $_GET['id'];
mysqli_query($conn, "DELETE FROM members WHERE id_member = $id");
header("Location: members.php");
exit;
?>