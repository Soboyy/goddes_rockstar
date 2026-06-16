<?php
include 'koneksi.php';

$members = mysqli_fetch_all(mysqli_query($conn, "SELECT * FROM members"), MYSQLI_ASSOC);
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Members - Goddess Rockstar</title>
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
        <h2>🎤 Members Reality Club</h2>
        <a href="tambah_member.php" class="btn btn-add">+ Tambah Member</a>
    </div>

    <div class="member-grid">
        <?php foreach ($members as $m): ?>
        <div class="member-card">
            
            <div class="member-avatar">
                <?php if (!empty($m['foto_url'])): ?>
                    <img src="<?= htmlspecialchars($m['foto_url']) ?>" alt="<?= htmlspecialchars($m['nama']) ?>">
                <?php else: ?>
                    🎵
                <?php endif; ?>
    </div>
        
            <div class="member-name"><?= htmlspecialchars($m['nama']) ?></div>
            <div class="member-role"><?= htmlspecialchars($m['role']) ?></div>
            <div class="member-bio"><?= htmlspecialchars($m['bio']) ?></div>
            <div class="member-actions">
                <a href="edit_member.php?id=<?= $m['id_member'] ?>" class="btn btn-edit">✏️ Edit</a>
                <a href="hapus_member.php?id=<?= $m['id_member'] ?>"
                   class="btn btn-delete"
                   onclick="return confirm('Yakin hapus member ini?')">🗑️ Hapus</a>
            </div>
        </div>
        <?php endforeach; ?>
    </div>
</div>

</body>
</html>