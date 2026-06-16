-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2026 at 06:19 PM
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
(2, 'Fatal Attraction', 'Never Get Better', 2017, 'Fatal attraction\r\nWhat they had from the start\r\nInstant connection\r\nNothing could tear them apart\r\nLove isn\'t the answer\r\nSparks eventually fade\r\nNot for those skeptical delirious hearts\r\nAnd you thought you were the only one\r\nYou thought you were second to none\r\nBut romance came for you\r\nAnd you thought you were the only one\r\nYou thought you were second to none\r\nBut romance came for you\r\nFocused attention\r\nLike an aim to a dart\r\nHeartbeat reaction\r\nAn absolute form of art\r\nLove is the answer\r\nSparks will rise once again\r\nNot for those skeptical delirious hearts\r\nAnd you thought you were the only one\r\nYou thought you were second to none\r\nBut romance came for you\r\nLike a shadow in the night\r\nFollow your every step\r\nLike a shadow in the night\r\nFollow your every\r\nAnd you thought you were the only one\r\nYou thought you were second to none\r\nBut romance came for you\r\nAnd you thought you were the only one\r\nYou thought you were second to none\r\nBut romance came for you\r\nLet\'s go', 1, NULL),
(3, '2112', 'What Do You Really Know?', 2019, 'I\'ll fully comprehend\r\nWhy the 21st of December\r\nRings heavy on my battle—worn heart\r\nBut who are we kidding?\r\nNobody\'s winning\r\nIn this tale of past and future love\r\nThey were just 20\r\nShow us the money\r\nA smoke show picturesque affair\r\nIt started as all things do\r\nA simple hello turned to romantic visions\r\nFar away\r\nThey were too clever\r\nFor it to be never\r\nAs they sunk into each other\'s heart\r\nAnd this is the part\r\nWhere our whole lives collide\r\nThe stars themselves fell\r\nLike we did that night\r\nThough it felt like the universe knew\r\nLike a pack of friends who couldn\'t hold their laughter\r\nThey chose to be painfully obvious in front of us\r\nSlightly unaware or in denial of the dangers ahead\r\nWe thrust our weary hearts into each other\'s arms\r\nContent and comfortable\r\nFor years to come\r\nThey felt it right and true\r\nBlessings and kisses\r\nAs they thought it was the universe\'s wishes\r\nAnd though they could feel it then\r\nIt\'s not how they want to end\r\nSo they turn their heads away\r\nAs if they were to say goodbye\r\nBut clocks keep on ticking\r\nAnd life keeps on going\r\nTo leave the pair behind at last\r\nShe said to me\r\nAnd I said to her\r\nTo hold back each other\'s true fate\r\nIs not of our nature\r\nLet\'s be mature\r\nMaybe you weren\'t made for me\r\nNor I for you\r\nBut I\'d be damn lying\r\nIf I think that that\'s true\r\nWe were young and we were old\r\nLife was warm then life was cold\r\nIt gets harder, yes, you\'ll see\r\nBut were we ever meant to be?\r\nWe were young and we were old\r\nLife was warm then life was cold\r\nIt gets harder, yes, you\'ll see\r\nBut were we ever meant to be?\r\nWe were young and we were old\r\nLife was warm then life was cold\r\nIt gets harder, yes, you\'ll see\r\nBut were we ever meant to be?\r\nWe were young and we were old\r\nLife was warm then life was cold\r\nIt gets harder, yes, you\'ll see\r\nBut were we ever meant to be?\r\nWe were young and we were old\r\nLife was warm then life was cold\r\nIt gets harder, yes, you\'ll see\r\nBut were we ever meant to be?\r\nWe were young and we were old\r\nLife was warm then life was cold\r\nIt gets harder, yes, you\'ll see\r\nBut were we ever meant to', 2, NULL),
(4, 'Alexandra', 'What Do You Really Know?', 2019, 'Just like a certain motorbike gang from Charming\r\nOr you\'re looking for the old ultraviolence\r\nYou\'re trouble, yes I knew\r\nRight from the start\r\n\r\nAnd the labyrinth I thought I knew\r\nRearranged to shape anew\r\nAt amazement of the excitement\r\nThat once rang true\r\n\r\nAnd if I was a fool for you\r\nI\'d wait 500 million hours\r\nOn a park bench out on the moon\r\nBut in full view of what you are\r\nOh\r\n\r\nJust like a feline with multiple lines\r\nShe lost a couple but she used to have five\r\nA savior of mankind\r\n\r\nAnd if I was a fool for you\r\nI\'d wait 500 million hours\r\nOn a park bench out on the moon\r\nBut in full view of what you are\r\nYou\'re a goddess, you\'re my rock star\r\n\r\nI fell in love with Alexandra\r\nEven though I barely met her\r\nEven though we\'d break our hearts\r\nBefore we\'d even start\r\n(Before we\'d even start)\r\n\r\nAnd if I was a fool for you\r\nI\'d wait 500 million hours\r\nOn a park bench out on the moon\r\nBut in full view of what you are\r\nYou\'re a goddess, you\'re my rock star', 2, NULL),
(5, 'Anything You Want', 'Reality Club Presents', 2023, 'Trails of smoke trapped in a two by two\r\nWasting the night feels right when I\'m with you\r\nIt’s the shimmer in your eyes\r\nAnd the way you let down your disguise\r\n\r\nI feel like I\'ve known you for ages\r\nI feel like with you I\'m going places\r\nAh ah, ah ah\r\n\r\nThe same song on repeat\r\n\"You can call me anything you want\"\r\nIt’s fine by me\r\nNumber two out of three\r\nHe says that it\'s his favorite\r\nAnd I can\'t disagree\r\n\r\nWe talk about everything\r\nThe important and the mundane\r\nYou know I think you know everything\r\nBut the night\'s still young\r\nAnd there\'s still so much to gain\r\n\r\nI feel like I\'ve known you for ages\r\nI feel like with you I\'m going places\r\nAh ah, ah ah\r\n\r\nThе same song on repeat\r\n\"You can call mе anything you want\"\r\nIt\'s fine by me\r\nNumber two out of three\r\nHe says that it’s his favorite\r\nAnd I can’t disagree\r\nThe same song on repeat\r\n\"You can call me anything you want\"\r\nIt\'s fine by me\r\nNumber two out of three\r\nHe says that it’s his favorite\r\nAnd I can\'t disagree\r\n\r\nThe same song on repeat\r\n\"You can call me anything you want\"\r\nIt\'s fine by me\r\nNumber two out of three', 1, NULL),
(6, 'Am I Bothering You?', 'Reality Club Presents', 2023, 'We\'re both strangers to a miracle\r\nWe\'ve had our eyes locked for a while\r\nI\'ve completed all the courses, I need to understand my loneliness\r\nI\'ve accepted that maybe we\'re meant for a different time\r\nBut then out of the blue, a spark or two\r\nSeems to generate\r\nNow I\'m bothering you, it\'s bothering me\r\nWhat can I do? What should I do?\r\nWe\'re not too far, look where we are\r\nBothering me, bothering you\r\nWe fill our days with hypotheticals (ooh-ooh)\r\nLiving vividly in our minds (ooh-ooh)\r\nWe take apart our dreams with heavy heart\r\nBut I know that maybe we can start something right\r\nBut then out of the blue, a spark or two\r\nSeems to generate\r\nNow I\'m bothering you, it\'s bothering me\r\nWhat can I do? What should I do?\r\nWe\'re not too far, look where we are\r\nBothering me, bothering you\r\nLost in the sea, feel so complete\r\nLove is a myth, depends who you\'re with\r\nBothering me, bothering you, ooh\r\nBut then out of the blue, a spark or two\r\nSeems to generate\r\nAnd you with similar views, you know my heart did incinerate\r\nNow I\'m bothering you, it\'s bothering me\r\nWhat can I do? What should I do?\r\nWe\'re not too far, look where we are\r\nBothering me, bothering you\r\nLost in the sea, feel so complete\r\nLove is a myth, depends who you\'re with\r\nBothering me, bothering you, ooh', 2, NULL),
(7, 'Finding a Catholic Man to Love the Love of My Life', 'Who Knows Where Life Will Take You?', 2025, 'I\'m in a pickle\r\nI\'ve found the love of my life\r\nBut if I ever want to make her my wife\r\nThat\'s when the problems will arise\r\nShe\'s so gorgeous, won\'t you come and see\r\nBut she can\'t be with someone like me\r\nI pray that there\'s a miracle for me\r\nOr else we simply can never be\r\nSo I\'m finding a Catholic man\r\nTo love the love of my life\r\nWhen I\'m old and grey I hope you\'ll be happy\r\nEither way\r\nShe\'s got a smile that\'ll melt you in your seat\r\nShe\'s got wits to make you move your feet\r\nAlas the universe has me beat\r\nPushed apart just as soon as we meet\r\nShe\'s got the beauty and she\'s got the mind\r\nThe best damn person that you\'ll ever find\r\nI wish that she could stay as mine\r\nOh God, won\'t you give me a sign\r\nSo I\'m finding a Catholic man\r\nTo love the love of my life\r\nWhen I\'m old and grey I hope you\'ll be happy\r\nEither way\r\nI\'m finding a Catholic man\r\nTo love the love of my life\r\nWhen I\'m old and grey I hope you\'ll be happy\r\nEither way\r\n(Alright)\r\nSo I\'m finding a Catholic man\r\nTo love the love of my life\r\nWhen I\'m old and grey I hope you\'ll be happy\r\nEither way\r\nI\'m finding a Catholic man\r\nTo love the love of my life\r\nWhen I\'m old and grey I hope you\'ll be happy\r\nEither way\r\nWhen I\'m old and grey you know I\'ll still love you\r\nAnyways', 2, NULL),
(8, 'Now I am a Diplomat', 'Who Knows Where Life Will Take You?', 2025, 'All I wanted was to see the world and play\r\nVivaldi on the violin\r\nRead philosophy as I sip my coffee, printed books is\r\nMy rush of adrenaline\r\n\r\nStill rode my bike in a sea of Vespas\r\nFather said, “Son, go work for the government”\r\nThere’s no guarantee, can’t feed your family\r\nDrowning yourself in Hobbes and resentment\r\n\r\nWho knows where life will take you?\r\nSold poems, now I’m a diplomat\r\nWorked till late to pass the time, refused the caviars and wine\r\nI must say, I am proud of who I am\r\n\r\nTook my kids to Mandela’s hometown\r\nLeft with shards of glass and a neck brace\r\nBut God works in such mysterious ways\r\nGoodbye Athens, concrete jungle is where I’ll spend my days\r\n\r\nAsk me something about the Middle East, I’ll refer to page\r\n80 of my thesis\r\nNow I’m a professor, my kin a rockstar, for a country boy\r\nYeah I’ve gotten pretty far\r\n\r\nWho knows where life will take you?\r\nSold poems, now I’m a diplomat\r\nWorked till late to pass the time, refused the caviars and wine\r\nI must say, I am proud of who I am\r\n\r\nWho knows where life will take you?\r\nSold poems, now I’m a diplomat\r\nDidn’t think I’d have this life, have so much to thank my wife for\r\nI must say, I am proud of who I am\r\n\r\nWish my father was around\r\nTo say he’s proud of who I am', 1, NULL),
(9, 'You Let Her Go Again', 'You Let Her Go Again', 2021, 'You let her go again\r\nBeginning of another end\r\nYou\'re talkin\' to yourself\r\n\"Was she meant for someone else?\"\r\nYour right hand is not a man\r\nWaitin\' \'til you kick the can\r\nYou don\'t mind\r\nThe emptiness is fine\r\nAnd all that you can muster is I\'m aware\r\nThe condition that I\'m in has got to change\r\nAm I deranged?\r\n\'Cause the look on your face\r\nPlus the hand on her shoulder\r\nLiving on imagination that you\'d hold her\r\nOh-ooh, I was only trying to seem like I was fine\r\nNever a man of many words\r\nOpened the door just to see if it\'s locked\r\nAnd now she\'s gone and you\'re blocked\r\nWill I will never understand the game you play\r\nIs it rigged or am I shit?\r\nI just can\'t catch a break\r\nWith every move I unmake\r\nOh, the echoing room\r\nAnd the night getting older\r\nLiving on imagination that you\'d hold her\r\nOh-ooh, I was only trying to seem like I was fine\r\nOh-ooh, I was only trying to seem like I was fine\r\n\'Cause the look on your face\r\nPlus the hand on her shoulder\r\nLiving on imagination that you\'d hold her\r\nOh-ooh, I was only trying to seem like I was fine\r\nThe Sunday night market\r\nAnd the handing of helmets\r\nWishing that you could\'ve had blacked out eyelids\r\nOh-ooh, I was only trying to seem like I was fine', 2, NULL),
(10, 'You\'ll Find Lovers Like You and Me', 'You\'ll Find Lovers Like You and Me', 2025, 'The oceans at midnight, melancholic and seaside\r\nI watched you walk away from me and\r\nWhat a sight, what a night, I can\'t think straight\r\nAlthough it ended it won\'t ever be a mistake\r\nThough I think we were meant to be, we\'d make it work far as I can see\r\nYou\'ll find lovers like you and me, you\'ll find lovers like you and me\r\nAnd you\'ll find love even though I leave, through the chronic pain and the misery\r\nYou\'ll find lovers like you and me, you\'ll find love like you and me\r\nPulling out all the stops, this train\'s full-throttle locked\r\nThere\'s no one else I\'d rather have but\r\nI\'m good at self-sabotage, there\'s no hopeful mirage\r\nI complicate, you educate me\r\nThough I think we were meant to be, we\'d make it work far as I can see\r\nYou\'ll find lovers like you and me, you\'ll find lovers like you and me\r\nAnd you\'ll find love even though I leave, through the chronic pain and the misery\r\nYou\'ll find lovers like you and me, you\'ll find love like you and me\r\nWell I will never be the same\r\nGuess there\'s not much to this game\r\nYeah I will never be the same\r\nThough I think we were meant to be, we\'d make it work far as I can see\r\nYou\'ll find lovers like you and me, you\'ll find lovers like you and me\r\nAnd you\'ll find love even though I leave, through the chronic pain and the misery\r\nYou\'ll find lovers like you and me, you\'ll find love like you and me\r\nYou\'ll find lovers like you and me', 2, NULL),
(11, 'The Rush', 'The Rush', 2021, 'I miss the feelin\' of feelin\' alive\r\nCan\'t find a reason, like to think that I tried\r\nI wanna hear that raucous roar one more time\r\nThat weird elixir, I squeezed it all inside\r\nIs there another chance for me to survive?\r\nWithout another kick-start to feel I\'m alive\r\nMy senses tell me I\'ve crossed the line\r\nThose same old senses say do it one more time\r\n\r\nMerely just a spectacle to the show\r\nNeed another fix \'cause I can\'t seem to find\r\n\r\nThe rush\r\nThe rush\r\n\r\nBroken soul\r\nFall prey to the lure\r\nNo sense of honor\r\nFor the wicked or poor\r\nDischarged and beaten\r\nFrom sins of the past\r\nCame with regret\r\nLast time was the last\r\n\r\nMerely just a spectacle to the show\r\nNeed another fix \'cause I can\'t seem to find\r\n\r\nThe rush\r\nThe rush\r\nThe rush\r\nSpinning time, breathing lines, I need it now\r\nThe rush\r\nRunnin\' wild, grinnin\' wide, all fall to\r\nThe rush\r\nThe rush\r\nSpinning time, breathing lines, I need it now\r\nThe rush\r\nThe rush\r\nRunnin\' wild, grinnin\' wide, all fall to\r\nThe rush\r\n\r\nMerely just a spectacle to the show\r\nI won\'t even try to justify\r\nAnd I know mistakes of tomorrow don\'t mean a single thing today\r\nI need another fix \'cause I can\'t seem to find\r\n\r\nThe rush\r\nThe rush\r\nSpinning time, breathing lines, I need it now\r\nThe rush\r\nThe rush\r\nRunnin\' wild, grinnin\' wide, all fall to\r\nThe rush', 1, NULL);

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
