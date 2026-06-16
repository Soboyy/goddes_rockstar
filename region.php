<?php
include 'koneksi.php';

$keyword = "";
// Logika untuk menangkap input pencarian
if (isset($_GET['keyword']) && $_GET['keyword'] !== "") {
    $keyword = $_GET['keyword'];
    $keyword_safe = mysqli_real_escape_string($conn, $keyword);
    // Mencari data yang cocok dengan wilayah atau nama_region
    $query = "SELECT * FROM regions WHERE wilayah LIKE '%$keyword_safe%' OR nama_region LIKE '%$keyword_safe%'";
} else {
    // Jika tidak ada pencarian, tampilkan semua data region
    $query = "SELECT * FROM regions";
}

$result = mysqli_query($conn, $query);
$regions = mysqli_fetch_all($result, MYSQLI_ASSOC);
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Region Reality Club - Goddess Rockstar</title>
    <link rel="stylesheet" href="style.css">
    <style>
        .btn-join {
            background-color: #ff9f00;
            color: #000 !important;
            font-weight: bold;
            padding: 6px 12px;
            border-radius: 20px;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
        }
        .btn-join:hover { background-color: #e68a00; }
        .aksi-container { display: flex; flex-direction: column; gap: 5px; align-items: flex-start; }
    </style>
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
        <div class="container">

            <div class="page-header">
                <h2>🌎 Daftar Region</h2>
                <a href="tambah_region.php" class="btn btn-add">+ Tambah Region</a>
            </div>

            <form method="GET" action="region.php" class="search-form-inline">
                <input type="text" name="keyword" placeholder="Cari berdasarkan wilayah/nama..." value="<?= htmlspecialchars($keyword) ?>">
                <button type="submit">🔍 Cari</button>
                <?php if ($keyword): ?>
                    <a href="region.php" class="btn btn-reset">✕ Reset</a>
                <?php endif; ?>
            </form>

            <?php if ($keyword): ?>
                <p class="search-info">
                    Hasil pencarian "<strong><?= htmlspecialchars($keyword) ?></strong>": 
                    <strong><?= count($regions) ?></strong> region ditemukan
                </p>
            <?php endif; ?>

            <?php if (count($regions) > 0): ?>
                <table class="tabel">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Wilayah</th>
                            <th>Nama Region</th>
                            <th>Koordinator</th>
                            <th>Deskripsi</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($regions as $i => $row): ?>
                        <tr>
                            <td><?= $i + 1 ?></td>
                            <td><strong><?= htmlspecialchars($row['wilayah']) ?></strong></td>
                            <td><?= htmlspecialchars($row['nama_region']) ?></td>
                            <td><?= htmlspecialchars($row['koordinator']) ?></td>
                            <td><?= htmlspecialchars($row['deskripsi']) ?></td>
                            <td>
                                <div class="aksi-container">
                                    <a href="https://<?= htmlspecialchars($row['link_grup']) ?>" target="_blank" class="btn-join">🔗 Gabung</a>
                                    
                                    <?php 
                                    // Menghindari error id tidak terdefinisi
                                    $id_region = isset($row['id_region']) ? $row['id_region'] : (isset($row['id']) ? $row['id'] : ''); 
                                    ?>

                                    <a href="edit_region.php?id=<?= $id_region ?>" class="btn btn-edit">✏️ Edit</a>
                                    <a href="hapus_region.php?id=<?= $id_region ?>" class="btn btn-delete" onclick="return confirm('Yakin hapus region ini?')">🗑️ Hapus</a>
                                </div>
                            </td>
                        </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            <?php else: ?>
                <div class="not-found">
                    <p>Tidak ada region yang cocok dengan "<strong><?= htmlspecialchars($keyword) ?></strong>"</p>
                </div>
            <?php endif; ?>

        </div>
    </main>

</div>
</body>
</html>