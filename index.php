<?php include 'koneksi.php'; ?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Goddess Rockstar - Reality Club Fanbase</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<!-- NAVBAR -->
<nav class="navbar">
    <div class="nav-brand">🎸 Goddess Rockstar</div>
    <div class="nav-links">
        <a href="index.php">Home</a>
        <a href="lagu.php">Lagu</a>
        <a href="members.php">Members</a>
        <a href="gigs.php">Gigs</a>
    </div>
</nav>

<!-- HERO + SEARCH -->
<div class="hero">
    <h1>Find Your Favorite lagu</h1>
    <p>Ketik penggalan lirik Reality Club yang kamu ingat</p>

    <form method="GET" action="lagu.php" class="search-form">
        <input type="text" name="keyword" placeholder="Contoh: you can call me anything you want...">
        <button type="submit">🔍 Cari</button>
    </form>
</div>

<!-- STATS SECTION -->
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

</body>
</html>