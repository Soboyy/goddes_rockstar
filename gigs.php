<?php
include 'koneksi.php';

// JOIN gigs dengan regions untuk tampilkan nama region
// Referensi: https://www.w3schools.com/sql/sql_join.asp
$sql    = "SELECT gigs.*, regions.nama_region, regions.wilayah
           FROM gigs
           JOIN regions ON gigs.id_region = regions.id_region
           ORDER BY gigs.tanggal DESC";
$result = mysqli_query($conn, $sql);
$gigs   = mysqli_fetch_all($result, MYSQLI_ASSOC);
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Gigs - Goddess Rockstar</title>
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
        <h2>🎪 Jadwal Gigs</h2>
        <a href="tambah_gigs.php" class="btn btn-add">+ Tambah Gig</a>
    </div>

    <table class="tabel">
        <thead>
            <tr>
                <th>No</th>
                <th>Event</th>
                <th>Tanggal</th>
                <th>Lokasi</th>
                <th>Kota</th>
                <th>Region</th>
                <th>Status</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($gigs as $i => $g): ?>
            <tr>
                <td><?= $i + 1 ?></td>
                <td><?= htmlspecialchars($g['nama_event']) ?></td>
                <td><?= date('d M Y', strtotime($g['tanggal'])) ?></td>
                <td><?= htmlspecialchars($g['lokasi']) ?></td>
                <td><?= htmlspecialchars($g['kota']) ?></td>
                <td><?= htmlspecialchars($g['nama_region']) ?> — <?= htmlspecialchars($g['wilayah']) ?></td>
                <td>
                    <span class="badge badge-<?= $g['status'] ?>">
                        <?= $g['status'] === 'upcoming' ? '🟢 Upcoming' : '✅ Done' ?>
                    </span>
                </td>
                <td class="aksi">
                    <a href="edit_gigs.php?id=<?= $g['id_gig'] ?>" class="btn btn-edit">✏️ Edit</a>
                    <a href="hapus_gigs.php?id=<?= $g['id_gig'] ?>"
                       class="btn btn-delete"
                       onclick="return confirm('Yakin hapus gig ini?')">🗑️ Hapus</a>
                </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>

</body>
</html>