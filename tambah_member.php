<?php
include 'koneksi.php';
$pesan = "";

if (isset($_POST['submit'])) {
    $nama     = mysqli_real_escape_string($conn, $_POST['nama']);
    $role     = mysqli_real_escape_string($conn, $_POST['role']);
    $bio      = mysqli_real_escape_string($conn, $_POST['bio']);
    $foto_url = mysqli_real_escape_string($conn, $_POST['foto_url']);

    if ($nama == "" || $role == "") {
        $pesan = "error|Nama dan role wajib diisi!";
    } else {
        $sql = "INSERT INTO members (nama, role, bio, foto_url)
                VALUES ('$nama', '$role', '$bio', '$foto_url')";

        if (mysqli_query($conn, $sql)) {
            $pesan = "success|Member berhasil ditambahkan!";
        } else {
            $pesan = "error|Gagal: " . mysqli_error($conn);
        }
    }
}

$p = explode("|", $pesan);
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Tambah Member</title>
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
            <a href="region.php">🌎 Region</a>
        </nav>
    </aside>

    <main class="main-content">

<div class="container">
    <div class="page-header">
        <h2>➕ Tambah Member</h2>
        <a href="members.php" class="btn btn-back">← Kembali</a>
    </div>

    <?php if (!empty($p[1])): ?>
        <div class="alert alert-<?= $p[0] ?>"><?= htmlspecialchars($p[1]) ?></div>
    <?php endif; ?>

    <div class="form-box">
        <form method="POST" action="tambah_member.php">

            <div class="form-group">
                <label>Nama *</label>
                <input type="text" name="nama" required>
            </div>

            <div class="form-group">
                <label>Role *</label>
                <input type="text" name="role" placeholder="Contoh: Vocal, Guitar">
            </div>

            <div class="form-group">
                <label>Bio</label>
                <textarea name="bio" rows="4"></textarea>
            </div>

            <div class="form-group">
                <label>URL Foto</label>
                <input type="text" name="foto_url" placeholder="https://...">
            </div>

            <button type="submit" name="submit" class="btn btn-add">💾 Simpan</button>
        </form>
    </div>
</div>
</body>
</html>