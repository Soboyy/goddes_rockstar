<?php
include 'koneksi.php';
$pesan = "";

// Ambil data members untuk dropdown
// Referensi: https://www.w3schools.com/php/php_mysql_select.asp
$members = mysqli_fetch_all(mysqli_query($conn, "SELECT * FROM members"), MYSQLI_ASSOC);

if (isset($_POST['submit'])) {
    $judul     = mysqli_real_escape_string($conn, $_POST['judul']);
    $album     = mysqli_real_escape_string($conn, $_POST['album']);
    $tahun     = mysqli_real_escape_string($conn, $_POST['tahun']);
    $lirik     = mysqli_real_escape_string($conn, $_POST['lirik']);
    $id_member = (int) $_POST['id_member'];

    if ($judul == "" || $lirik == "") {
        $pesan = "error|Judul dan lirik wajib diisi!";
    } else {
        // Referensi: https://www.w3schools.com/php/php_mysql_insert.asp
        $sql = "INSERT INTO lagu (judul, album, tahun, lirik, id_member)
                VALUES ('$judul', '$album', '$tahun', '$lirik', '$id_member')";

        if (mysqli_query($conn, $sql)) {
            $pesan = "success|Lagu berhasil ditambahkan!";
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
    <title>Tambah Lagu</title>
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
        <h2>➕ Tambah Lagu</h2>
        <a href="lagu.php" class="btn btn-back">← Kembali</a>
    </div>

    <?php if (!empty($p[1])): ?>
        <div class="alert alert-<?= $p[0] ?>"><?= htmlspecialchars($p[1]) ?></div>
    <?php endif; ?>

    <div class="form-box">
        <form method="POST" action="tambah_lagu.php">

            <div class="form-group">
                <label>Judul Lagu *</label>
                <input type="text" name="judul" required>
            </div>

            <div class="form-group">
                <label>Album</label>
                <input type="text" name="album">
            </div>

            <div class="form-group">
                <label>Tahun</label>
                <input type="number" name="tahun" min="2000" max="2099">
            </div>

            <!-- DROPDOWN MEMBER — hasil dari query JOIN nantinya -->
            <div class="form-group">
                <label>Vokalis / Penulis *</label>
                <select name="id_member" required>
                    <option value="">-- Pilih Member --</option>
                    <?php foreach ($members as $m): ?>
                        <option value="<?= $m['id_member'] ?>">
                            <?= htmlspecialchars($m['nama']) ?> — <?= htmlspecialchars($m['role']) ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>

            <div class="form-group">
                <label>Lirik *</label>
                <textarea name="lirik" rows="8" required></textarea>
            </div>

            <button type="submit" name="submit" class="btn btn-add">💾 Simpan</button>
        </form>
    </div>
</div>
</body>
</html>