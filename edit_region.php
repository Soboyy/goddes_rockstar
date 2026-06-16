<?php
include 'koneksi.php';

// Ambil ID dari URL parameter (?id=...)
if (!isset($_GET['id']) || $_GET['id'] == '') {
    header("Location: region.php");
    exit;
}

$id = mysqli_real_escape_string($conn, $_GET['id']);

// Proses Update Data saat tombol submit ditekan
if (isset($_POST['submit'])) {
    $wilayah      = mysqli_real_escape_string($conn, $_POST['wilayah']);
    $nama_region  = mysqli_real_escape_string($conn, $_POST['nama_region']);
    $koordinator  = mysqli_real_escape_string($conn, $_POST['koordinator']);
    $deskripsi    = mysqli_real_escape_string($conn, $_POST['deskripsi']);
    $link_grup    = mysqli_real_escape_string($conn, $_POST['link_grup']);

    // HANYA menggunakan id_region sesuai struktur database kamu
    $query_update = "UPDATE regions SET 
                     wilayah = '$wilayah', 
                     nama_region = '$nama_region', 
                     koordinator = '$koordinator', 
                     deskripsi = '$deskripsi', 
                     link_grup = '$link_grup' 
                     WHERE id_region = '$id'"; 

    if (mysqli_query($conn, $query_update)) {
        header("Location: region.php");
        exit;
    } else {
        echo "Gagal mengupdate data: " . mysqli_error($conn);
    }
}

// Ambil data lama dari database untuk ditampilkan di form awal
$result = mysqli_query($conn, "SELECT * FROM regions WHERE id_region = '$id'");
$data = mysqli_fetch_assoc($result);

// Jika data tidak ditemukan di database, kembalikan ke halaman utama
if (!$data) {
    header("Location: region.php");
    exit;
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Edit Region - Goddess Rockstar</title>
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
                <h2>✏️ Edit Data Region</h2>
            </div>

            <form method="POST" action="" style="background: #1e1e1e; padding: 30px; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.3);">
                
                <div style="margin-bottom: 20px;">
                    <label style="display: block; margin-bottom: 8px; color: orange; font-weight: bold;">📍 Wilayah / Provinsi</label>
                    <input type="text" name="wilayah" value="<?= htmlspecialchars($data['wilayah']) ?>" required 
                           style="width: 100%; padding: 12px; background: #2a2a2a; border: 1px solid #444; color: white; border-radius: 8px;">
                </div>

                <div style="margin-bottom: 20px;">
                    <label style="display: block; margin-bottom: 8px; color: orange; font-weight: bold;">👥 Nama Region</label>
                    <input type="text" name="nama_region" value="<?= htmlspecialchars($data['nama_region']) ?>" required 
                           style="width: 100%; padding: 12px; background: #2a2a2a; border: 1px solid #444; color: white; border-radius: 8px;">
                </div>

                <div style="margin-bottom: 20px;">
                    <label style="display: block; margin-bottom: 8px; color: orange; font-weight: bold;">👑 Koordinator</label>
                    <input type="text" name="koordinator" value="<?= htmlspecialchars($data['koordinator']) ?>" required 
                           style="width: 100%; padding: 12px; background: #2a2a2a; border: 1px solid #444; color: white; border-radius: 8px;">
                </div>

                <div style="margin-bottom: 20px;">
                    <label style="display: block; margin-bottom: 8px; color: orange; font-weight: bold;">📝 Deskripsi</label>
                    <textarea name="deskripsi" required 
                              style="width: 100%; padding: 12px; background: #2a2a2a; border: 1px solid #444; color: white; border-radius: 8px; height: 100px; resize: vertical;"><?= htmlspecialchars($data['deskripsi']) ?></textarea>
                </div>

                <div style="margin-bottom: 25px;">
                    <label style="display: block; margin-bottom: 8px; color: orange; font-weight: bold;">🔗 Link Grup WhatsApp / Telegram</label>
                    <input type="text" name="link_grup" value="<?= htmlspecialchars($data['link_grup']) ?>" required 
                           style="width: 100%; padding: 12px; background: #2a2a2a; border: 1px solid #444; color: white; border-radius: 8px;">
                </div>

                <div style="display: flex; gap: 10px;">
                    <button type="submit" name="submit" class="btn btn-add" style="border: none; cursor: pointer; padding: 12px 24px;">💾 Update Region</button>
                    <a href="region.php" class="btn btn-reset" style="text-decoration: none; padding: 12px 24px; text-align: center;">✕ Batal</a>
                </div>

            </form>
        </div>
    </main>

</div>
</body>
</html>