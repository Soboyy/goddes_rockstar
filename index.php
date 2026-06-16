<?php include 'koneksi.php'; ?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Goddess Rockstar - Reality Club Fanbase</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="layout">

    <aside class="sidebar">
        <div class="sidebar-brand">🎸 Goddess<br>Rockstar</div>
        <nav class="sidebar-nav">
            <a href="index.php" class="active">🏠 Home</a>
            <a href="lagu.php">🎵 Lagu</a>
            <a href="members.php">🎤 Members</a>
            <a href="gigs.php">🎪 Gigs</a>
            <a href="region.php">🌎 Region</a>
        </nav>
    </aside>

    <main class="main-content">

        <!-- HERO -->
        <div class="hero">
            <h1>Find Your Favorite Song</h1>
            <p>Ketik penggalan lirik Reality Club yang kamu ingat</p>
            <form method="GET" action="lagu.php" class="search-form">
                <input type="text" name="keyword" placeholder="Contoh: you can call me anything you want...">
                <button type="submit">🔍 Cari</button>
            </form>
        </div>

        <!-- ABOUT BAND -->
        <div class="about-band">
            <h2>Tentang Reality Club</h2>
            <p>
                Reality Club adalah band indie pop asal Jakarta yang dikenal lewat lirik-lirik jujur,
                melodi yang catchy, dan eksplorasi genre dari pop, rock, hingga elemen elektronik.
                Sejak debut, mereka telah merilis beberapa album dan menjadi salah satu nama besar
                di skena musik indie Indonesia, dengan basis penggemar yang tersebar di berbagai daerah.
            </p>
        </div>

        <!-- MEMBER SHOWCASE -->
        <div class="showcase">
    <h2>Meet The Band</h2>
    <div class="showcase-scroll">
        <?php
            $members = mysqli_fetch_all(mysqli_query($conn, "SELECT * FROM members"), MYSQLI_ASSOC);
            foreach ($members as $m):
        ?>
        <div class="showcase-card">
            <div class="showcase-avatar">
                <?php if (!empty($m['foto_url'])): ?>
                    <img src="<?= htmlspecialchars($m['foto_url']) ?>" alt="<?= htmlspecialchars($m['nama']) ?>">
                <?php else: ?>
                    🎵
                <?php endif; ?>
            </div>
            <div class="showcase-name"><?= htmlspecialchars($m['nama']) ?></div>
            <div class="showcase-role"><?= htmlspecialchars($m['role']) ?></div>
        </div>
        <?php endforeach; ?>
    </div>
</div>

        <!-- STATS -->
        <?php
            $total_lagu    = mysqli_fetch_row(mysqli_query($conn, "SELECT COUNT(*) FROM lagu"))[0];
            $total_member  = mysqli_fetch_row(mysqli_query($conn, "SELECT COUNT(*) FROM members"))[0];
            $total_gigs    = mysqli_fetch_row(mysqli_query($conn, "SELECT COUNT(*) FROM gigs"))[0];
            $upcoming_gigs = mysqli_fetch_row(mysqli_query($conn, "SELECT COUNT(*) FROM gigs WHERE status='upcoming'"))[0];
        ?>
        <div class="stats">
            <div class="stat-card">
                <div class="stat-number"><?= $total_lagu ?></div>
                <div class="stat-label">Total Lagu</div>
            </div>
            <div class="stat-card">
                <div class="stat-number"><?= $total_member ?></div>
                <div class="stat-label">Member Band</div>
            </div>
            <div class="stat-card">
                <div class="stat-number"><?= $upcoming_gigs ?></div>
                <div class="stat-label">Upcoming Gigs</div>
            </div>
            <div class="stat-card">
                <div class="stat-number"><?= $total_gigs ?></div>
                <div class="stat-label">Total Gigs</div>
            </div>
        </div>

    </main>
</div>
</body>
</html>