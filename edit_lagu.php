<?php
include 'koneksi.php';
$pesan = "";

if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    header("Location: lagu.php");
    exit;
}

$id      = (int) $_GET['id'];
$members = mysqli_fetch_all(mysqli_query($conn, "SELECT * FROM members"), MYSQLI_ASSOC);

// Ambil data lagu yang akan diedit
// Referensi: https://www.w3schools.com/php/php_mysql_update.asp
$result = mysqli_query($conn, "SELECT * FROM lagu WHERE id_lagu = $id");
$lagu   = mysqli_fetch_assoc($result);

if (!$lagu) { header("Location: lagu.php"); exit; }

if (isset($_POST['submit'])) {
    $judul     = mysqli_real_escape_string($conn, $_POST['judul']);
    $album     = mysqli_real_escape_string($conn, $_POST['album']);
    $tahun     = mysqli_real_escape_string($conn, $_POST['tahun']);
    $lirik     = mysqli_real_escape_string($conn, $_POST['lirik']);
    $id_member = (int) $_POST['id_member'];

    $sql = "UPDATE lagu
            SET judul='$judul', album='$album', tahun='$tahun',
                lirik='$lirik', id_member='$id_member'
            WHERE id_lagu=$id";

    if (mysqli_query($conn, $sql)) {
        $pesan = "success|Lagu berhasil diperbarui!";
        $lagu  = mysqli_fetch_assoc(mysqli_query($conn, "SELECT * FROM lagu WHERE id_lagu=$id"));
    } else {
        $pesan = "error|Gagal: " . mysqli_error($conn);
    }
}

$p = explode("|", $pesan);
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Edit Lagu</title>
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
        <h2>✏️ Edit Lagu</h2>
        <a href="lagu.php" class="btn btn-back">← Kembali</a>
    </div>

    <?php if (!empty($p[1])): ?>
        <div class="alert alert-<?= $p[0] ?>"><?= htmlspecialchars($p[1]) ?></div>
    <?php endif; ?>

    <div class="form-box">
        <form method="POST" action="edit_lagu.php?id=<?= $id ?>">

            <div class="form-group">
                <label>Judul Lagu *</label>
                <input type="text" name="judul" value="<?= htmlspecialchars($lagu['judul']) ?>" required>
            </div>

            <div class="form-group">
                <label>Album</label>
                <input type="text" name="album" value="<?= htmlspecialchars($lagu['album']) ?>">
            </div>

            <div class="form-group">
                <label>Tahun</label>
                <input type="number" name="tahun" value="<?= $lagu['tahun'] ?>">
            </div>

            <div class="form-group">
                <label>Vokalis / Penulis *</label>
                <select name="id_member" required>
                    <option value="">-- Pilih Member --</option>
                    <?php foreach ($members as $m): ?>
                        <option value="<?= $m['id_member'] ?>"
                            <?= $m['id_member'] == $lagu['id_member'] ? 'selected' : '' ?>>
                            <?= htmlspecialchars($m['nama']) ?> — <?= htmlspecialchars($m['role']) ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>

            <div class="form-group">
                <label>Lirik *</label>
                <textarea name="lirik" rows="8" required><?= htmlspecialchars($lagu['lirik']) ?></textarea>
            </div>

            <button type="submit" name="submit" class="btn btn-add">💾 Simpan Perubahan</button>
        </form>
    </div>
</div>
</body>
</html>