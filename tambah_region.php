<?php
include 'koneksi.php';

if (isset($_POST['submit'])) {
    $wilayah      = mysqli_real_escape_string($conn, $_POST['wilayah']);
    $nama_region  = mysqli_real_escape_string($conn, $_POST['nama_region']);
    $koordinator  = mysqli_real_escape_string($conn, $_POST['koordinator']);
    $deskripsi    = mysqli_real_escape_string($conn, $_POST['deskripsi']);
    $link_grup    = mysqli_real_escape_string($conn, $_POST['link_grup']);

    // Query untuk memasukkan data baru ke tabel regions
    $query = "INSERT INTO regions (wilayah, nama_region, koordinator, deskripsi, link_grup) 
              VALUES ('$wilayah', '$nama_region', '$koordinator', '$deskripsi', '$link_grup')";

    if (mysqli_query($conn, $query)) {
        // Jika berhasil, langsung dialihkan kembali ke halaman utama region
        header("Location: region.php");
        exit;
    } else {
        echo "Gagal menambah data: " . mysqli_error($conn);
    }
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Tambah Region - Goddess Rockstar</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="layout">

    <aside class="sidebar">
        <div class="sidebar-brand">🎸 Goddess<br>Rockstar</div>
        <nav class="sidebar-nav">
            <a href="index.php">🏠 Home</a>
            <a href="lagu.php">🎵 Lagu</a>
            <a href="members.php">🎤 Members</a>
            <a href="gigs.php">🎪 Gigs</a>
            <a href="region.php" class="active">🌎 Region</a>
        </nav>
    </aside>

    <main class="main-content">
        <div class="container" style="max-width: 700px; margin: 0 auto;">
            
            <div class="page-header">
                <h2>➕ Tambah Region Baru</h2>
            </div>

            <form method="POST" action="" style="background: #1e1e1e; padding: 30px; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.3);">
                
                <div style="margin-bottom: 20px;">
                    <label style="display: block; margin-bottom: 8px; color: orange; font-weight: bold;">Wilayah / Provinsi</label>
                    <input type="text" name="wilayah" placeholder="Contoh: Jawa Timur" required 
                           style="width: 100%; padding: 12px; background: #2a2a2a; border: 1px solid #444; color: white; border-radius: 8px;">
                </div>

                <div style="margin-bottom: 20px;">
                    <label style="display: block; margin-bottom: 8px; color: orange; font-weight: bold;">Nama Region</label>
                    <input type="text" name="nama_region" placeholder="Contoh: GR_Jatim" required 
                           style="width: 100%; padding: 12px; background: #2a2a2a; border: 1px solid #444; color: white; border-radius: 8px;">
                </div>

                <div style="margin-bottom: 20px;">
                    <label style="display: block; margin-bottom: 8px; color: orange; font-weight: bold;">Koordinator</label>
                    <input type="text" name="koordinator" placeholder="Nama Koordinator Region" required 
                           style="width: 100%; padding: 12px; background: #2a2a2a; border: 1px solid #444; color: white; border-radius: 8px;">
                </div>

                <div style="margin-bottom: 20px;">
                    <label style="display: block; margin-bottom: 8px; color: orange; font-weight: bold;">Deskripsi</label>
                    <textarea name="deskripsi" placeholder="Deskripsi singkat mengenai komunitas region..." required 
                              style="width: 100%; padding: 12px; background: #2a2a2a; border: 1px solid #444; color: white; border-radius: 8px; height: 100px; resize: vertical;"></textarea>
                </div>

                <div style="margin-bottom: 25px;">
                    <label style="display: block; margin-bottom: 8px; color: orange; font-weight: bold;">Link Grup WhatsApp / Telegram</label>
                    <span style="color: #aaa; font-size: 12px; display: block; margin-bottom: 5px;">*Masukkan tanpa menggunakan https:// (Contoh: chat.whatsapp.com/LirikGoddess)</span>
                    <input type="text" name="link_grup" placeholder="chat.whatsapp.com/xxxxx" required 
                           style="width: 100%; padding: 12px; background: #2a2a2a; border: 1px solid #444; color: white; border-radius: 8px;">
                </div>

                <div style="display: flex; gap: 10px;">
                    <button type="submit" name="submit" class="btn btn-add" style="border: none; cursor: pointer; padding: 12px 24px;">💾 Simpan Region</button>
                    <a href="region.php" class="btn btn-reset" style="text-decoration: none; padding: 12px 24px; text-align