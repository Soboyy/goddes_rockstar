<?php
include 'koneksi.php';
$pesan   = "";
$regions = mysqli_fetch_all(mysqli_query($conn, "SELECT * FROM regions"), MYSQLI_ASSOC);

if (isset($_POST['submit'])) {
    $nama_event = mysqli_real_escape_string($conn, $_POST['nama_event']);
    $tanggal    = mysqli_real_escape_string($conn, $_POST['tanggal']);
    $lokasi     = mysqli_real_escape_string($conn, $_POST['lokasi']);
    $kota       = mysqli_real_escape_string($conn, $_POST['kota']);
    $status     = mysqli_real_escape_string($conn, $_POST['status']);
    $id_region  = (int) $_POST['id_region'];

    if ($nama_event == "" || $tanggal == "") {
        $pesan = "error|Nama event dan tanggal wajib diisi!";
    } else {
        $sql = "INSERT INTO gigs (nama_event, tanggal, lokasi, kota, status, id_region)
                VALUES ('$nama_event', '$tanggal', '$lokasi', '$kota', '$status', '$id_region')";

        if (mysqli_query($conn, $sql)) {
            $pesan = "success|Gig berhasil ditambahkan!";
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
    <title>Tambah Gig</title>
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
                <h2>➕ Tambah Gig</h2>
                <a href="gigs.php" class="btn btn-back">← Kembali</a>
            </div>

            <?php if (!empty($p[1])): ?>
                <div class="alert alert-<?= $p[0] ?>"><?= htmlspecialchars($p[1]) ?></div>
            <?php endif; ?>

            <div class="form-box">
                <form method="POST" action="tambah_gigs.php">

                    <div class="form-group">
                        <label>Nama Event *</label>
                        <input type="text" name="nama_event" required>
                    </div>

                    <div class="form-group">
                        <label>Tanggal *</label>
                        <input type="date" name="tanggal" required>
                    </div>

                    <div class="form-group">
                        <label>Lokasi</label>
                        <input type="text" name="lokasi" placeholder="Contoh: GBK Basketball Hall">
                    </div>

                    <div class="form-group">
                        <label>Kota</label>
                        <input type="text" name="kota">
                    </div>

                    <div class="form-group">
                        <label>Region</label>
                        <select name="id_region">
                            <option value="">-- Pilih Region --</option>
                            <?php foreach ($regions as $r): ?>
                                <option value="<?= $r['id_region'] ?>">
                                    <?= htmlspecialchars($r['nama_region']) ?> — <?= htmlspecialchars($r['wilayah']) ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Status</label>
                        <select name="status">
                            <option value="upcoming">🟢 Upcoming</option>
                            <option value="done">✅ Done</option>
                        </select>
                    </div>

                    <button type="submit" name="submit" class="btn btn-add">💾 Simpan</button>
                </form>
            </div>
        </div>

    </main>

</div>
</body>
</html>