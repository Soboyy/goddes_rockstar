<?php
include 'koneksi.php';
$pesan = "";

if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    header("Location: members.php");
    exit;
}

$id     = (int) $_GET['id'];
$result = mysqli_query($conn, "SELECT * FROM members WHERE id_member = $id");
$member = mysqli_fetch_assoc($result);

if (!$member) { header("Location: members.php"); exit; }

if (isset($_POST['submit'])) {
    $nama     = mysqli_real_escape_string($conn, $_POST['nama']);
    $role     = mysqli_real_escape_string($conn, $_POST['role']);
    $bio      = mysqli_real_escape_string($conn, $_POST['bio']);
    $foto_url = mysqli_real_escape_string($conn, $_POST['foto_url']);

    $sql = "UPDATE members
            SET nama='$nama', role='$role', bio='$bio', foto_url='$foto_url'
            WHERE id_member=$id";

    if (mysqli_query($conn, $sql)) {
        $pesan  = "success|Member berhasil diperbarui!";
        $member = mysqli_fetch_assoc(mysqli_query($conn, "SELECT * FROM members WHERE id_member=$id"));
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
    <title>Edit Member</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<nav class="navbar">
    <div class="nav-brand">🎸 Goddess Rockstar</div>
    <div class="nav-links">
        <a href="index.php">Home</a>
        <a href="lagu.php">Lagu</a>
        <a href="members.php" class="active">Members</a>
        <a href="gigs.php">Gigs</a>
    </div>
</nav>

<div class="container">
    <div class="page-header">
        <h2>✏️ Edit Member</h2>
        <a href="members.php" class="btn btn-back">← Kembali</a>
    </div>

    <?php if (!empty($p[1])): ?>
        <div class="alert alert-<?= $p[0] ?>"><?= htmlspecialchars($p[1]) ?></div>
    <?php endif; ?>

    <div class="form-box">
        <form method="POST" action="edit_member.php?id=<?= $id ?>">

            <div class="form-group">
                <label>Nama *</label>
                <input type="text" name="nama" value="<?= htmlspecialchars($member['nama']) ?>" required>
            </div>

            <div class="form-group">
                <label>Role *</label>
                <input type="text" name="role" value="<?= htmlspecialchars($member['role']) ?>">
            </div>

            <div class="form-group">
                <label>Bio</label>
                <textarea name="bio" rows="4"><?= htmlspecialchars($member['bio']) ?></textarea>
            </div>

            <div class="form-group">
                <label>URL Foto</label>
                <input type="text" name="foto_url" value="<?= htmlspecialchars($member['foto_url']) ?>">
            </div>

            <button type="submit" name="submit" class="btn btn-add">💾 Simpan Perubahan</button>
        </form>
    </div>
</div>
</body>
</html>