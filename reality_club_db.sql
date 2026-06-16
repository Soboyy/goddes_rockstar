-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2026 at 05:52 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

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
(2, 'Fatal Attraction', 'Never Get Better', 2017, 'The oceans at midnight, melancholic and seaside\nI watched you walk away from me and\nWhat a sight, what a night, I can\'t think straight\nAlthough it ended it won\'t ever be a mistake\nThough I think we were meant to be, we\'d make it work far as I can see\nYou\'ll find lovers like you and me, you\'ll find lovers like you and me\nAnd you\'ll find love even though I leave, through the chronic pain and the misery\nYou\'ll find lovers like you and me, you\'ll find love like you and me\nPulling out all the stops, this train\'s full-throttle locked\nThere\'s no one else I\'d rather have but\nI\'m good at self-sabotage, there\'s no hopeful mirage\nI complicate, you educate me\nThough I think we were meant to be, we\'d make it work far as I can see\nYou\'ll find lovers like you and me, you\'ll find lovers like you and me\nAnd you\'ll find love even though I leave, through the chronic pain and the misery\nYou\'ll find lovers like you and me, you\'ll find love like you and me\nWell I will never be the same\nGuess there\'s not much to this game\nYeah I will never be the same\nThough I think we were meant to be, we\'d make it work far as I can see\nYou\'ll find lovers like you and me, you\'ll find lovers like you and me\nAnd you\'ll find love even though I leave, through the chronic pain and the misery\nYou\'ll find lovers like you and me, you\'ll find love like you and me\nYou\'ll find lovers like you and me', 1, NULL),
(3, '2112', 'What Do You Really Know?', 2019, 'I\'m in a pickle\nI\'ve found the love of my life\nBut if I ever want to make her my wife\nThat\'s when the problems will arise\nShe\'s so gorgeous, won\'t you come and see\nBut she can\'t be with someone like me\nI pray that there\'s a miracle for me\nOr else we simply can never be\nSo I\'m finding a Catholic man\nTo love the love of my life\nWhen I\'m old and grey I hope you\'ll be happy\nEither way\nShe\'s got a smile that\'ll melt you in your seat\nShe\'s got wits to make you move your feet\nAlas the universe has me beat\nPushed apart just as soon as we meet\nShe\'s got the beauty and she\'s got the mind\nThe best damn person that you\'ll ever find\nI wish that she could stay as mine\nOh God, won\'t you give me a sign\nSo I\'m finding a Catholic man\nTo love the love of my life\nWhen I\'m old and grey I hope you\'ll be happy\nEither way\nWhen I\'m old and grey you know I\'ll still love you\nAnyways', 2, NULL),
(4, 'Alexandra', 'What Do You Really Know?', 2019, 'Trails of smoke trapped in a two by two\nWasting the night feels right when I\'m with you\nIt\'s the shimmer in your eyes\nAnd the way you let down your disguise\nI feel like I\'ve known you for ages\nI feel like with you I\'m going places\nThe same song on repeat\nYou can call me anything you want\nIt\'s fine by me\nNumber two out of three\nHe says that it\'s his favorite\nAnd I can\'t disagree\nWe talk about everything\nThe important and the mundane\nYou know I think you know everything\nBut the night\'s still young\nAnd there\'s still so much to gain\nI feel like I\'ve known you for ages\nI feel like with you I\'m going places\nThe same song on repeat\nYou can call me anything you want\nIt\'s fine by me\nNumber two out of three\nHe says that it\'s his favorite\nAnd I can\'t disagree\nThe same song on repeat\nYou can call me anything you want\nIt\'s fine by me\nNumber two out of three', 2, NULL),
(5, 'Anything You Want', 'Reality Club Presents', 2023, 'We\'re both strangers to a miracle\nWe\'ve had our eyes locked for a while\nI\'ve completed all the courses, I need to understand my loneliness\nI\'ve accepted that maybe we\'re meant for a different time\nBut then out of the blue, a spark or two\nSeems to generate\nNow I\'m bothering you, it\'s bothering me\nWhat can I do? What should I do?\nWe\'re not too far, look where we are\nBothering me, bothering you\nWe fill our days with hypotheticals\nLiving vividly in our minds\nWe take apart our dreams with heavy heart\nBut I know that maybe we can start something right\nBut then out of the blue, a spark or two\nSeems to generate\nNow I\'m bothering you, it\'s bothering me\nWhat can I do? What should I do?\nWe\'re not too far, look where we are\nBothering me, bothering you\nLost in the sea, feel so complete\nLove is a myth, depends who you\'re with\nBothering me, bothering you', 1, NULL),
(6, 'Am I Bothering You?', 'Reality Club Presents', 2023, 'You let her go again\nBeginning of another end\nYou\'re talkin\' to yourself\nWas she meant for someone else?\nYour right hand is not a man\nWaitin\' \'til you kick the can\nYou don\'t mind\nThe emptiness is fine\nAnd all that you can muster is I\'m aware\nThe condition that I\'m in has got to change\nAm I deranged?\nCause the look on your face\nPlus the hand on her shoulder\nLiving on imagination that you\'d hold her\nOh-ooh, I was only trying to seem like I was fine\nNever a man of many words\nOpened the door just to see if it\'s locked\nAnd now she\'s gone and you\'re blocked\nWill I will never understand the game you play\nIs it rigged or am I shit?\nI just can\'t catch a break\nWith every move I unmake\nOh, the echoing room\nAnd the night getting older\nLiving on imagination that you\'d hold her\nOh-ooh, I was only trying to seem like I was fine\nThe Sunday night market\nAnd the handing of helmets\nWishing that you could\'ve had blacked out eyelids\nOh-ooh, I was only trying to seem like I was fine', 2, NULL),
(7, 'Finding a Catholic Man to Love the Love of My Life', 'Who Knows Where Life Will Take You?', 2025, 'I miss the feelin\' of feelin\' alive\nCan\'t find a reason, like to think that I tried\nI wanna hear that raucous roar one more time\nThat weird elixir, I squeezed it all inside\nIs there another chance for me to survive?\nWithout another kick-start to feel I\'m alive\nMy senses tell me I\'ve crossed the line\nThose same old senses say do it one more time\nMerely just a spectacle to the show\nNeed another fix cause I can\'t seem to find\nThe rush\nThe rush\nBroken soul\nFall prey to the lure\nNo sense of honor\nFor the wicked or poor\nDischarged and beaten\nFrom sins of the past\nCame with regret\nLast time was the last\nMerely just a spectacle to the show\nNeed another fix cause I can\'t seem to find\nThe rush\nThe rush\nThe rush\nSpinning time, breathing lines, I need it now\nThe rush\nRunnin\' wild, grinnin\' wide, all fall to\nThe rush', 2, NULL),
(8, 'Now I am a Diplomat', 'Who Knows Where Life Will Take You?', 2025, 'I\'ll fully comprehend\nWhy the 21st of December\nRings heavy on my battle-worn heart\nBut who are we kidding?\nNobody\'s winning\nIn this tale of past and future love\nThey were just 20\nShow us the money\nA smoke show picturesque affair\nIt started as all things do\nA simple hello turned to romantic visions\nFar away\nThey were too clever\nFor it to be never\nAs they sunk into each other\'s heart\nAnd this is the part\nWhere our whole lives collide\nThe stars themselves fell\nLike we did that night\nThough it felt like the universe knew\nLike a pack of friends who couldn\'t hold their laughter\nThey chose to be painfully obvious in front of us\nWe thrust our weary hearts into each other\'s arms\nContent and comfortable\nFor years to come\nShe said to me\nAnd I said to her\nTo hold back each other\'s true fate\nIs not of our nature\nLet\'s be mature\nMaybe you weren\'t made for me\nNor I for you\nBut I\'d be damn lying\nIf I think that that\'s true\nWe were young and we were old\nLife was warm then life was cold\nIt gets harder, yes, you\'ll see\nBut were we ever meant to be?', 1, NULL),
(9, 'You Let Her Go Again', 'You Let Her Go Again', 2021, 'Just like a certain motorbike gang from Charming\nOr you\'re looking for the old ultraviolence\nYou\'re trouble, yes I knew\nRight from the start\nAnd the labyrinth I thought I knew\nRearranged to shape anew\nAt amazement of the excitement\nThat once rang true\nAnd if I was a fool for you\nI\'d wait 500 million hours\nOn a park bench out on the moon\nBut in full view of what you are\nJust like a feline with multiple lines\nShe lost a couple but she used to have five\nA savior of mankind\nAnd if I was a fool for you\nI\'d wait 500 million hours\nOn a park bench out on the moon\nBut in full view of what you are\nYou\'re a goddess, you\'re my rock star\nI fell in love with Alexandra\nEven though I barely met her\nEven though we\'d break our hearts\nBefore we\'d even start\nAnd if I was a fool for you\nI\'d wait 500 million hours\nOn a park bench out on the moon\nBut in full view of what you are\nYou\'re a goddess, you\'re my rock star', 2, NULL),
(10, 'You\'ll Find Lovers Like You and Me', 'You\'ll Find Lovers Like You and Me', 2025, 'Fatal attraction\nWhat they had from the start\nInstant connection\nNothing could tear them apart\nLove isn\'t the answer\nSparks eventually fade\nNot for those skeptical delirious hearts\nYou thought you were the only one\nYou thought you were second to none\nBut romance came for you\nYou thought you were the only one\nYou thought you were second to none\nBut romance came for you\nFocused attention\nLike an aim to a dart\nHeartbeat reaction\nAn absolute form of art\nLove is the answer\nSparks will rise once again\nNot for those skeptical delirious hearts\nYou thought you were the only one\nYou thought you were second to none\nBut romance came for you\nLike a shadow in the night\nFollow your every step\nLike a shadow in the night\nFollow your every\nYou thought you were the only one\nYou thought you were second to none\nBut romance came for you\nLet\'s go!', 2, NULL),
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
