<?php
include 'koneksi.php';

$keyword = "";
$query   = "";

if (isset($_GET['keyword']) && $_GET['keyword'] !== "") {
    $keyword      = $_GET['keyword'];
    $keyword_safe = mysqli_real_escape_string($conn, $keyword);

    $query = "SELECT lagu.id_lagu, lagu.judul, lagu.album, lagu.tahun, members.nama AS vokalis
              FROM lagu
              JOIN members ON lagu.id_member = members.id_member
              WHERE lagu.lirik LIKE '%$keyword_safe%'
              ORDER BY lagu.tahun DESC";
} else {
    $query = "SELECT lagu.id_lagu, lagu.judul, lagu.album, lagu.tahun, members.nama AS vokalis
              FROM lagu
              JOIN members ON lagu.id_member = members.id_member
              ORDER BY lagu.tahun DESC";
}

$result = mysqli_query($conn, $query);
$lagu   = mysqli_fetch_all($result, MYSQLI_ASSOC);
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Daftar Lagu - Goddess Rockstar</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="layout">

    <aside class="sidebar">
        <div class="sidebar-brand">🎸 Goddess<br>Rockstar</div>
        <nav class="sidebar-nav">
            <a href="index.php">🏠 Home</a>
            <a href="lagu.php" class="active">🎵 Lagu</a> <a href="members.php">🎤 Members</a>
            <a href="gigs.php">🎪 Gigs</a>
            <a href="region.php">🌎 Region</a>
        </nav>
    </aside>

    <main class="main-content">
        <div class="container">

            <div class="page-header">
                <h2>🎵 Daftar Lagu</h2>
                <a href="tambah_lagu.php" class="btn btn-add">+ Tambah Lagu</a>
            </div>

            <form method="GET" action="lagu.php" class="search-form-inline">
                <input type="text" name="keyword" placeholder="Cari berdasarkan lirik..." value="<?= htmlspecialchars($keyword) ?>">
                <button type="submit">🔍 Cari</button>
                <?php if ($keyword): ?>
                    <a href="lagu.php" class="btn btn-reset">✕ Reset</a>
                <?php endif; ?>
            </form>

            <?php if ($keyword): ?>
                <p class="search-info">
                    Hasil pencarian "<strong><?= htmlspecialchars($keyword) ?></strong>":
                    <strong><?= count($lagu) ?></strong> lagu ditemukan
                </p>
            <?php endif; ?>

            <?php if (count($lagu) > 0): ?>
                <table class="tabel">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Judul</th>
                            <th>Album</th>
                            <th>Tahun</th>
                            <th>Vokalis</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($lagu as $i => $row): ?>
                        <tr>
                            <td><?= $i + 1 ?></td>
                            <td><?= htmlspecialchars($row['judul']) ?></td>
                            <td><?= htmlspecialchars($row['album']) ?></td>
                            <td><?= $row['tahun'] ?></td>
                            <td><?= htmlspecialchars($row['vokalis']) ?></td>
                            <td class="aksi">
                                <a href="edit_lagu.php?id=<?= $row['id_lagu'] ?>" class="btn btn-edit">✏️ Edit</a>
                                <a href="hapus_lagu.php?id=<?= $row['id_lagu'] ?>" class="btn btn-delete" onclick="return confirm('Yakin hapus lagu ini?')">🗑️ Hapus</a>
                            </td>
                        </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            <?php else: ?>
                <div class="not-found">
                    <p>😔 Tidak ada lagu yang cocok dengan "<strong><?= htmlspecialchars($keyword) ?></strong>"</p>
                </div>
            <?php endif; ?>

        </div>
    </main>

</div>
</body>
</html>
