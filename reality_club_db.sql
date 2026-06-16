-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2026 at 10:08 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reality_club_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `gigs`
--

CREATE TABLE `gigs` (
  `id_gig` int(11) NOT NULL,
  `nama_event` varchar(150) NOT NULL,
  `tanggal` date NOT NULL,
  `lokasi` varchar(200) DEFAULT NULL,
  `kota` varchar(100) DEFAULT NULL,
  `status` enum('upcoming','done') DEFAULT 'upcoming',
  `id_region` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gigs`
--

INSERT INTO `gigs` (`id_gig`, `nama_event`, `tanggal`, `lokasi`, `kota`, `status`, `id_region`) VALUES
(1, 'Stovit Art Exhibition & Molarchy Festival', '2025-11-16', 'Gedung ACC UNAIR', 'Surabaya', 'done', 4),
(2, 'DMusic Fest', '2026-02-21', 'Kebun Raya Denpasar', 'Bali', 'done', 5),
(3, '(10) Years of Reality Club Live in Jakarta', '2026-06-06', 'GBK Basketball Hall', 'Jakarta', 'upcoming', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lagu`
--

CREATE TABLE `lagu` (
  `id_lagu` int(11) NOT NULL,
  `judul` varchar(150) NOT NULL,
  `album` varchar(100) DEFAULT NULL,
  `tahun` int(11) DEFAULT NULL,
  `lirik` text DEFAULT NULL,
  `id_member` int(11) DEFAULT NULL,
  `cover_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lagu`
--

INSERT INTO `lagu` (`id_lagu`, `judul`, `album`, `tahun`, `lirik`, `id_member`, `cover_url`) VALUES
(2, 'Fatal Attraction', 'Never Get Better', 2017, 'Fatal attraction What they had from the start Instant connection Nothing could tear them apart Love isn\'t the answer Sparks eventually fade Not for those skeptical delirious hearts And you thought you were the only one You thought you were second to none But romance came for you', 1, NULL),
(3, '2112', 'What Do You Really Know?', 2019, 'I\'ll fully comprehend Why the 21st of December Rings heavy on my battle worn heart But who are we kidding Nobody\'s winning In this tale of past and future love We were young and we were old Life was warm then life was cold It gets harder yes you\'ll see But were we ever meant to be', 2, NULL),
(4, 'Alexandra', 'What Do You Really Know?', 2019, 'Just like a certain motorbike gang from Charming You\'re trouble yes I knew Right from the start You\'re a goddess you\'re my rock star I fell in love with Alexandra Even though I barely met her Even though we\'d break our hearts Before we\'d even start', 2, NULL),
(5, 'Anything You Want', 'Reality Club Presents', 2023, 'Trails of smoke trapped in a two by two Wasting the night feels right when I\'m with you The same song on repeat You can call me anything you want It\'s fine by me Number two out of three He says that it\'s his favorite And I can\'t disagree', 1, NULL),
(6, 'Am I Bothering You?', 'Reality Club Presents', 2023, 'We\'re both strangers to a miracle We\'ve had our eyes locked for a while Now I\'m bothering you it\'s bothering me What can I do What should I do We\'re not too far look where we are Bothering me bothering you', 2, NULL),
(7, 'Finding a Catholic Man to Love the Love of My Life', 'Who Knows Where Life Will Take You?', 2025, 'I\'m in a pickle I\'ve found the love of my life But if I ever want to make her my wife That\'s when the problems will arise So I\'m finding a Catholic man To love the love of my life When I\'m old and grey I hope you\'ll be happy Either way', 2, NULL),
(8, 'Now I am a Diplomat', 'Who Knows Where Life Will Take You?', 2025, 'All I wanted was to see the world And play Vivaldi on the violin Who knows where life will take you Sold poems now I\'m a diplomat Worked till late to pass the time Refused the caviars and wine I must say I am proud of who I am', 1, NULL),
(9, 'You Let Her Go Again', 'You Let Her Go Again', 2021, 'You let her go again Beginning of another end You\'re talkin to yourself Was she meant for someone else Your right hand is not a man I was only trying to seem like I was fine', 2, NULL),
(10, 'You\'ll Find Lovers Like You and Me', 'You\'ll Find Lovers Like You and Me', 2025, 'The oceans at midnight melancholic and seaside I watched you walk away from me You\'ll find lovers like you and me you\'ll find lovers like you and me And you\'ll find love even though I leave through the chronic pain and the misery', 2, NULL),
(11, 'The Rush', 'The Rush', 2021, 'The Rush', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id_member` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `role` varchar(50) NOT NULL,
  `bio` text DEFAULT NULL,
  `foto_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id_member`, `nama`, `role`, `bio`, `foto_url`) VALUES
(1, 'Fathia Izzati', 'Vocal, Keyboard, Guitar', 'Fathia Izzati adalah vokalis dan keyboardist Reality Club yang dikenal dengan suara lembut dan vibe calm yang khas.', 'image/members/FATHIA%20IZZATI.jpg'),
(2, 'Faiz Novascotia', 'Guitar, Vocal', 'Faiz Novascotia adalah vokalis sekaligus gitaris Reality Club yang punya warna vokal emosional dan gaya bermusik yang kuat.', 'image/members/FAIZ%20NOVASCOTIA.jpg'),
(3, 'Nugi Wicaksono', 'Bassist', 'Nugi Wicaksono adalah bassist Reality Club yang membawa energi fun dan playful ke dalam band.', 'image/members/NUGI%20WICAKSONO.jpg'),
(4, 'Era Patigo', 'Drummer', 'Era Patigo berperan sebagai drummer dengan permainan yang dinamis dan powerful.', 'image/members/ERA%20PATIGO.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id_region` int(11) NOT NULL,
  `nama_region` varchar(100) NOT NULL,
  `wilayah` varchar(100) NOT NULL,
  `link_grup` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `koordinator` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id_region`, `nama_region`, `wilayah`, `link_grup`, `deskripsi`, `koordinator`) VALUES
(1, 'GR_Jakarta', 'DKI Jakarta', 'wa.gr.dkijakarta', 'Region Reality Club Fans area DKI Jakarta.', 'Olla'),
(2, 'GR_Jabar', 'Jawa Barat', 'wa.gr.jabar', 'Komunitas fans Reality Club wilayah Jawa Barat.', 'Nami'),
(3, 'GR_Jateng', 'Jawa Tengah', 'wa.gr.jateng', 'Region fans Reality Club area Jawa Tengah.', 'Dinda'),
(4, 'GR_Jatim', 'Jawa Timur', 'wa.gr.jatim', 'Wadah komunitas fans Reality Club wilayah Jawa Timur.', 'Ella'),
(5, 'GR_Bali', 'Bali', 'wa.gr.bali', 'Region fans Reality Club area Bali.', 'Farah');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gigs`
--
ALTER TABLE `gigs`
  ADD PRIMARY KEY (`id_gig`),
  ADD KEY `id_region` (`id_region`);

--
-- Indexes for table `lagu`
--
ALTER TABLE `lagu`
  ADD PRIMARY KEY (`id_lagu`),
  ADD KEY `id_member` (`id_member`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id_member`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id_region`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gigs`
--
ALTER TABLE `gigs`
  MODIFY `id_gig` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lagu`
--
ALTER TABLE `lagu`
  MODIFY `id_lagu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id_member` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id_region` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `gigs`
--
ALTER TABLE `gigs`
  ADD CONSTRAINT `gigs_ibfk_1` FOREIGN KEY (`id_region`) REFERENCES `regions` (`id_region`);

--
-- Constraints for table `lagu`
--
ALTER TABLE `lagu`
  ADD CONSTRAINT `lagu_ibfk_1` FOREIGN KEY (`id_member`) REFERENCES `members` (`id_member`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
