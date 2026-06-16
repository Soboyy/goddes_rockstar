<?php
include 'koneksi.php';
$pesan = "";

if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    header("Location: gigs.php");
    exit;
}

$id      = (int) $_GET['id'];
$regions = mysqli_fetch_all(mysqli_query($conn, "SELECT * FROM regions"), MYSQLI_ASSOC);
$gig     = mysqli_fetch_assoc(mysqli_query($conn, "SELECT * FROM gigs WHERE id_gig = $id"));

if (!$gig) { header("Location: gigs.php"); exit; }

if (isset($_POST['submit'])) {
    $nama_event = mysqli_real_escape_string($conn, $_POST['nama_event']);
    $tanggal    = mysqli_real_escape_string($conn, $_POST['tanggal']);
    $lokasi     = mysqli_real_escape_string($conn, $_POST['lokasi']);
    $kota       = mysqli_real_escape_string($conn, $_POST['kota']);
    $status     = mysqli_real_escape_string($conn, $_POST['status']);
    $id_region  = (int) $_POST['id_region'];

    $sql = "UPDATE gigs
            SET nama_event='$nama_event', tanggal='$tanggal', lokasi='$lokasi',
                kota='$kota', status='$status', id_region='$id_region'
            WHERE id_gig=$id";

    if (mysqli_query($conn, $sql)) {
        $pesan = "success|Gig berhasil diperbarui!";
        $gig   = mysqli_fetch_assoc(mysqli_query($conn, "SELECT * FROM gigs WHERE id_gig=$id"));
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
    <title>Edit Gig</title>
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
        </nav>
    </aside>

    <main class="main-content">

<div class="container">
    <div class="page-header">
        <h2>✏️ Edit Gig</h2>
        <a href="gigs.php" class="btn btn-back">← Kembali</a>
    </div>

    <?php if (!empty($p[1])): ?>
        <div class="alert alert-<?= $p[0] ?>"><?= htmlspecialchars($p[1]) ?></div>
    <?php endif; ?>

    <div class="form-box">
        <form method="POST" action="edit_gigs.php?id=<?= $id ?>">

            <div class="form-group">
                <label>Nama Event *</label>
                <input type="text" name="nama_event" value="<?= htmlspecialchars($gig['nama_event']) ?>" required>
            </div>

            <div class="form-group">
                <label>Tanggal *</label>
                <input type="date" name="tanggal" value="<?= $gig['tanggal'] ?>">
            </div>

            <div class="form-group">
                <label>Lokasi</label>
                <input type="text" name="lokasi" value="<?= htmlspecialchars($gig['lokasi']) ?>">
            </div>

            <div class="form-group">
                <label>Kota</label>
                <input type="text" name="kota" value="<?= htmlspecialchars($gig['kota']) ?>">
            </div>

            <div class="form-group">
                <label>Region</label>
                <select name="id_region">
                    <option value="">-- Pilih Region --</option>
                    <?php foreach ($regions as $r): ?>
                        <option value="<?= $r['id_region'] ?>"
                            <?= $r['id_region'] == $gig['id_region'] ? 'selected' : '' ?>>
                            <?= htmlspecialchars($r['nama_region']) ?> — <?= htmlspecialchars($r['wilayah']) ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>

            <div class="form-group">
                <label>Status</label>
                <select name="status">
                    <option value="upcoming" <?= $gig['status'] === 'upcoming' ? 'selected' : '' ?>>🟢 Upcoming</option>
                    <option value="done"     <?= $gig['status'] === 'done'     ? 'selected' : '' ?>>✅ Done</option>
                </select>
            </div>

            <button type="submit" name="submit" class="btn btn-add">💾 Simpan Perubahan</button>
        </form>
    </div>
</div>
</body>
</html>