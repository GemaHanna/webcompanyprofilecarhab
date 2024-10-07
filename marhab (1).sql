-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 07, 2024 at 05:50 AM
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
-- Database: `marhab`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(13, '2023-07-20-081917', 'App\\Database\\Migrations\\TbProduk', 'default', 'App', 1690513521, 1),
(14, '2023-07-20-084755', 'App\\Database\\Migrations\\TbSlider', 'default', 'App', 1690513521, 1),
(15, '2023-07-20-085024', 'App\\Database\\Migrations\\TbProfil', 'default', 'App', 1690513521, 1),
(16, '2023-07-28-035902', 'App\\Database\\Migrations\\TbAktivitas', 'default', 'App', 1690517128, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tb_aktivitas`
--

CREATE TABLE `tb_aktivitas` (
  `id_aktivitas` int(5) UNSIGNED NOT NULL,
  `nama_aktivitas_in` varchar(200) NOT NULL,
  `nama_aktivitas_en` varchar(200) NOT NULL,
  `foto_aktivitas` varchar(100) NOT NULL,
  `deskripsi_aktivitas_in` text DEFAULT NULL,
  `deskripsi_aktivitas_en` text DEFAULT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `slug_in` varchar(255) NOT NULL,
  `slug_en` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tb_aktivitas`
--

INSERT INTO `tb_aktivitas` (`id_aktivitas`, `nama_aktivitas_in`, `nama_aktivitas_en`, `foto_aktivitas`, `deskripsi_aktivitas_in`, `deskripsi_aktivitas_en`, `meta_title`, `meta_description`, `slug_in`, `slug_en`) VALUES
(7, 'Komunitas Porsche', 'Porsche Community', 'Cool Cars_Mobil Keren_10072024114842.jpeg', '<p>Memiliki mobil Porsche memberikan banyak peluang untuk menikmati berbagai aktivitas menarik. Berikut adalah beberapa aktivitas yang biasa dilakukan oleh pemilik mobil Porsche:</p>\r\n<p>1. Berkendara di Jalan Raya Terbuka: Mengendarai Porsche di jalan raya terbuka memberikan pengalaman berkendara yang luar biasa dengan performa dan handling yang superior.</p>\r\n<p>2. Mengikuti Track Days: Pemilik Porsche sering berpartisipasi dalam track days di sirkuit balap, dimana mereka dapat menguji batas performa mobil mereka dalam lingkungan yang aman dan terkendali.</p>\r\n<p>3. Bergabung dengan Klub Mobil: Banyak pemilik Porsche bergabung dengan klub mobil untuk berbagi pengalaman, berpartisipasi dalam acara sosial, dan mengikuti perjalanan bersama.</p>\r\n<p>Aktivitas-aktivitas ini tidak hanya memaksimalkan potensi mobil Porsche, tetapi juga memberikan kesenangan dan kepuasan bagi pemiliknya.</p>', '<p>Owning a Porsche offers numerous opportunities to enjoy various exciting activities. Here are some activities commonly enjoyed by Porsche owners:</p>\r\n<ol>\r\n<li>\r\n<p><strong>Driving on Open Roads:</strong> Taking a Porsche out on open roads provides an incredible driving experience with superior performance and handling.</p>\r\n</li>\r\n<li>\r\n<p><strong>Participating in Track Days:</strong> Porsche owners often participate in track days at racing circuits, where they can push their car\'s performance limits in a safe and controlled environment.</p>\r\n</li>\r\n<li>\r\n<p><strong>Joining Car Clubs:</strong> Many Porsche owners join car clubs to share experiences, take part in social events, and go on group drives together.</p>\r\n</li>\r\n</ol>\r\n<p>These activities not only allow Porsche owners to maximize their car\'s potential but also bring enjoyment and satisfaction.</p>', '<p>Menikmati Aktivitas Seru dengan Mobil Porsche - Pengalaman Berkendara dan Track Days</p>', '<p>Temukan berbagai aktivitas menarik yang bisa dinikmati pemilik mobil Porsche, mulai dari berkendara di jalan raya terbuka, mengikuti track days di sirkuit balap, hingga bergabung dengan klub mobil untuk berbagi pengalaman dan keseruan.</p>', 'porsche-community', 'komunitas-porsche'),
(8, 'Mobil Porsche Showroom', 'Car Porsche Showroom', 'Porsche Showroom_Porsche Showroom_10072024133753.jpeg', '<p>Showroom mobil Porsche adalah tempat di mana kemewahan, inovasi, dan performa bertemu. Dengan desain yang menawan, koleksi kendaraan yang mengesankan, dan layanan pelanggan yang luar biasa, showroom ini menawarkan pengalaman yang tak tertandingi bagi para pecinta mobil mewah. Setiap kunjungan ke showroom Porsche bukan hanya sekedar melihat-lihat mobil, tetapi juga merasakan semangat dan dedikasi yang ditanamkan dalam setiap kendaraan yang diproduksi.</p>', '<p>The Porsche car showroom is a place where luxury, innovation and performance meet. With a stunning design, impressive vehicle collection and exceptional customer service, the showroom offers an unmatched experience for luxury car lovers. Every visit to a Porsche showroom is not just about looking at the cars, but also feeling the passion and dedication that goes into every vehicle produced.</p>', '<p>Showroom Mobil Porsche - Pengalaman Mewah dan Inovatif untuk Pecinta Mobil</p>', '<p>Kunjungi showroom mobil Porsche, tempat di mana kemewahan dan performa bertemu. Temukan koleksi kendaraan yang mengesankan dan nikmati layanan pelanggan yang luar biasa. Rasakan semangat dan dedikasi di balik setiap mobil Porsche yang diproduksi.</p>', 'car-porsche-showroom', 'mobil-porsche-showroom'),
(9, 'Mobil Ferrari vs Porsche', 'Car Ferrari vs Porsche', 'Ferrari vs Porsche_Ferrari vs Porsche_24072024095147.jpeg', '<p><strong>Ferrari vs Porsche Hypercar:</strong> Pertarungan antara dua raksasa otomotif ini mempersembahkan dua hypercar yang tak tertandingi: Ferrari dan Porsche. Keduanya menawarkan performa luar biasa, desain yang menawan, dan teknologi mutakhir. Ferrari dikenal dengan mesin V8 dan V12-nya yang bertenaga, sedangkan Porsche mengandalkan inovasi seperti mesin hybrid untuk efisiensi dan kecepatan. Dalam dunia balap, kedua merek ini terus berinovasi dan bersaing untuk menciptakan kendaraan yang dapat mendefinisikan kembali batasan performa. Siapa yang akan keluar sebagai pemenang dalam pertarungan ini?</p>', '<p><strong>Ferrari vs Porsche Hypercar:</strong> The battle between these two automotive giants showcases two unmatched hypercars: Ferrari and Porsche. Both offer extraordinary performance, stunning design, and cutting-edge technology. Ferrari is renowned for its powerful V8 and V12 engines, while Porsche relies on innovations like hybrid engines for efficiency and speed. In the racing world, both brands continue to innovate and compete to create vehicles that redefine performance boundaries. Who will emerge as the winner in this showdown?</p>', '<p>Ferrari vs Porsche Hypercar: Pertarungan Dua Raksasa Otomotif</p>', '<p>Jelajahi pertarungan antara Ferrari dan Porsche dalam dunia hypercar. Temukan performa luar biasa, desain menawan, dan teknologi mutakhir dari kedua merek ikonik ini. Siapa yang akan mendefinisikan kembali batasan performa?</p>', 'car-ferrari-vs-porsche', 'mobil-ferrari-vs-porsche'),
(0, 'komunitas', 'comunity', 'comunity_komunitas_30092024095327.jpg', '<p>komunitas</p>', '<p>comunity</p>', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_artikel`
--

CREATE TABLE `tb_artikel` (
  `id_artikel` int(5) UNSIGNED NOT NULL,
  `judul_artikel_in` varchar(100) NOT NULL,
  `foto_artikel` varchar(255) NOT NULL,
  `deskripsi_artikel` longtext NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `slug_in` varchar(255) NOT NULL,
  `slug_en` varchar(255) NOT NULL,
  `judul_artikel_en` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_artikel`
--

INSERT INTO `tb_artikel` (`id_artikel`, `judul_artikel_in`, `foto_artikel`, `deskripsi_artikel`, `created_at`, `meta_title`, `meta_description`, `slug_in`, `slug_en`, `judul_artikel_en`) VALUES
(6, 'Porsche di Le Mans 24jam', '1720594727_1b139effc4a24c0b0165.jpeg', '<p><strong>Porsche 963</strong>&nbsp;adalah mobil balap prototipe olahraga&nbsp;LMDh&nbsp;yang dibuat oleh Multimatic dan dirancang oleh Porsche untuk berkompetisi di kelas&nbsp;Hypercar&nbsp;dan&nbsp;GTP (Grand Touring Protoype) masing-masing di Kejuaraan Ketahanan Dunia FIA dan IMSA&nbsp;SportsCar Championship. Nama 963 mengambil inspirasi dari Porsche 956 dan Porsche 962 yang berpacu pada tahun 1980-an, yang juga berkompetisi di seri balap Amerika dan Eropa.&nbsp;<sup id=\"cite_ref-4\" class=\"reference\"></sup>Mobil tersebut diungkap di&nbsp;Goodwood Festival of Speed 2022, dengan livery merah, putih, dan hitam tradisional.<sup id=\"cite_ref-5\" class=\"reference\"></sup> Debut balapan resmi 963 akan menjadi putaran pembuka musim&nbsp;Kejuaraan Mobil Sport IMSA musim 2023&nbsp;di&nbsp;Daytona 24 Jam. Mobil tersebut awalnya dijadwalkan untuk gladi resik non-kompetitif di&nbsp;Bahrain 8 Jam&nbsp;2022,<sup id=\"cite_ref-6\" class=\"reference\"></sup> namun, Porsche kemudian memutuskan bahwa mereka tidak akan balapan di Bahrain demi waktu pengujian yang lebih pribadi.<sup id=\"cite_ref-7\" class=\"reference\"></sup></p>\r\n<p>Juara dunia&nbsp;Formula Satu&nbsp;empat kali,&nbsp;Sebastian Vettel&nbsp;melakukan pengujian mobil Porsche 963 untuk membalap di ajang WEC dan&nbsp;Le Mans 24 Jam.</p>', '2024-07-10 13:51:11', 'Porsche 963: Prototipe LMDh yang Menakjubkan di Kelas Hypercar dan GTP', '<p>Porsche 963 adalah mobil balap prototipe LMDh yang dirancang untuk kompetisi di kelas Hypercar dan GTP. Dengan desain yang terinspirasi dari Porsche 956 dan 962, mobil ini debut di Goodwood Festival of Speed 2022 dan siap berlaga di Daytona 24 Jam. Dap', 'porsche-di-le-mans-24jam', 'porsche-in-le-mans-24hrs', 'Porsche in Le Mans 24hrs'),
(7, 'Porsche 718 Tanpa BBM?', '10072024065620.jpeg', '<p>Jenama otomotif mewah Porsche mengatakan tidak akan melanjutkan mobil berbahan bakar minyak (BBM) 718 Cayman dan 718 Boxster dan menggantinya dengan versi listrik.<br><br>Melansir Car and Driver, Senin (8/7) waktu setempat, Porsche 718 Cayman dan 718 Boxster akan berakhir pada pertengahan 2025, menurut keterangan manajer produk di Porsche Albrecht Reimold.<br><br>Alasan kedua mobil itu dihentikan ialah Porsche ingin memperkenalkan mobil listrik, bukan karena penjualan 718 buruk. Mengikuti versi BBM, 718 listrik juga akan tersedia dalam versi&nbsp;<em>convertible</em>&nbsp;dan&nbsp;<em>hardtop</em>.</p>', '2024-07-10 13:56:20', 'Porsche Hentikan 718 Cayman dan 718 Boxster, Beralih ke Versi Listrik', '<p>Porsche mengumumkan penghentian model berbahan bakar minyak 718 Cayman dan 718 Boxster pada pertengahan 2025. Langkah ini diambil untuk memperkenalkan versi listrik dari kedua model tersebut, yang akan tersedia dalam varian convertible dan hardtop. Pel', 'porsche-718-tanpa-bbm', 'porsche-718-without-bbm', 'Porsche 718 Without BBM?'),
(8, 'Porsche Mempunyai Model SUV', '11072024035812.jpeg', '<p>Porsche Cayenne adalah serangkaian mobil yang diproduksi oleh perusahaan Jerman Porsche sejak tahun 2002. Ini adalah SUV crossover mewah dan digambarkan sebagai kendaraan berukuran penuh dan menengah. Generasi pertama dikenal secara internal di Porsche sebagai Tipe 9PA (955/957) atau E1. Ini adalah kendaraan bermesin V8 pertama yang dibuat oleh Porsche sejak tahun 1995, ketika Porsche 928 dihentikan produksinya. Ini juga merupakan kendaraan varian off-road pertama Porsche sejak traktor Super dan Junior pada tahun 1950-an, dan Porsche pertama dengan empat pintu. Sejak tahun 2014, Cayenne telah dijual bersama SUV Porsche yang lebih kecil, Macan.</p>', '2024-07-11 10:58:12', 'Porsche Cayenne: SUV Crossover Mewah Sejak 2002', '<div class=\"flex max-w-full flex-col flex-grow\">Porsche Cayenne, SUV crossover mewah yang hadir sejak 2002, menawarkan perpaduan sempurna antara performa khas Porsche dengan kenyamanan SUV premium.</div>', 'porsche-mempunyai-model-suv', 'porsche-have-suv-model', 'Porsche Have SUV Model'),
(10, 'Mobil Porsche Paling Diminati oleh Pembeli dari Tahun ke Tahun Yang Sampai Saat ini Masih Tetap Jadi', '24072024024913.jpg', '<p>\"GT3\" diperkenalkan pada tahun 1999 sebagai bagian dari generasi pertama rangkaian model Porsche 996 (umumnya dikenal sebagai 996. Sebagai model homologasi untuk mobil yang masuk dalam piala FIA GT3. Seperti model 911 RS Porsche sebelumnya, 996 GT3 difokuskan pada balap, sehingga tidak ada item yang menambah bobot yang tidak perlu pada mobil. Peredam suara hampir sepenuhnya dihilangkan, begitu pula kursi belakang, pengeras suara belakang, sunroof, dan AC, meskipun AC otomatis dan CD/radio menjadi tambahan opsional tanpa biaya.</p>', '2024-07-24 09:49:13', 'Porsche 996 GT3: Mobil Balap Homologasi dari 1999', '<p>Diperkenalkan pada tahun 1999, Porsche 996 GT3 adalah model homologasi untuk mobil yang bersaing di Piala FIA GT3. Dengan fokus pada performa balap, GT3 menghilangkan bobot yang tidak perlu, termasuk peredam suara, kursi belakang, dan sistem AC. Temuka', 'mobil-porsche-paling-diminati-oleh-pembeli-dari-tahun-ke-tahun-yang-sampai-saat-ini-masih-tetap-jadi', 'the-most-popular-porsche-cars-among-buyers-year-after-year-that-still-remain-favorites-today', 'The Most Popular Porsche Cars Among Buyers Year After Year That Still Remain Favorites Today'),
(11, 'Mobil Ferrari', '24072024025000.jpeg', '<p>Ferrari adalah produsen mobil sport mewah asal Italia yang terkenal dengan performa tinggi, desain yang menawan, dan inovasi teknis. Didirikan oleh Enzo Ferrari pada tahun 1939, merek ini menjadi simbol kecepatan dan keanggunan di seluruh dunia. Model-model ikonik seperti Ferrari 488, LaFerrari, dan Ferrari F8 Tributo menampilkan mesin V8 dan V12 yang bertenaga, serta teknologi balap yang canggih. Ferrari juga memiliki sejarah panjang di dunia motorsport, khususnya di ajang Formula 1, di mana mereka telah meraih banyak gelar juara dunia. Dengan kombinasi dari performa luar biasa dan estetika yang tak tertandingi, Ferrari terus menarik perhatian para pecinta otomotif di seluruh dunia.</p>', '2024-07-24 09:50:00', 'Ferrari: Mobil Sport Mewah dan Ikonik dari Italia', '<p>Ferrari adalah produsen mobil sport mewah asal Italia yang dikenal dengan performa tinggi dan desain menawan. Didirikan oleh Enzo Ferrari, merek ini memiliki model ikonik seperti 488 dan LaFerrari, serta sejarah gemilang di dunia motorsport. Temukan in', 'mobil-ferrari', 'ferrari-car', 'Ferrari Car');

-- --------------------------------------------------------

--
-- Table structure for table `tb_meta`
--

CREATE TABLE `tb_meta` (
  `id_seo` int(11) UNSIGNED NOT NULL,
  `nama_halaman` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `canonical_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_meta`
--

INSERT INTO `tb_meta` (`id_seo`, `nama_halaman`, `meta_title`, `meta_description`, `canonical_url`) VALUES
(1, 'Beranda', 'Perusahaan terkemuka di industri otomotif ', 'Dengan showroom modern yang tersebar di berbagai lokasi strategis, CarHab memastikan kenyamanan dan kemudahan bagi pelanggan dalam melihat dan mencoba kendaraan pilihan mereka.', ''),
(2, 'Tentang', 'CarHab - Jual Mobil Baru dan Bekas Berkualitas Tinggi', 'CarHab adalah perusahaan terkemuka di industri otomotif yang menawarkan berbagai merek dan model mobil baru dan bekas. Dengan layanan purna jual komprehensif dan inspeksi ketat, kami memberikan pengalaman pembelian mobil yang aman dan terpercaya.', ''),
(3, 'Artikel ', 'Artikel dari CarHab', 'CarHab adalah perusahaan otomotif terkemuka yang menyediakan mobil baru dan bekas berkualitas tinggi. Dengan showroom modern dan layanan purna jual terbaik, CarHab memastikan pengalaman membeli mobil yang nyaman, aman, dan memuaskan.', ''),
(4, 'Produk ', 'Temukan Mobil Baru & Bekas Berkualitas | Produk CarHab', 'Jelajahi berbagai pilihan mobil baru dan bekas berkualitas di CarHab. Temukan kendaraan impian Anda dengan penawaran terbaik dan layanan terpercaya di halaman produk kami.', ''),
(6, 'Aktivitas', 'Aktivitas CarHab: Inovasi dan Layanan Unggul di Industri Otomotif', 'CarHab adalah perusahaan terkemuka di industri otomotif, menawarkan beragam layanan inovatif mulai dari penjualan mobil baru dan bekas berkualitas hingga layanan purna jual yang memuaskan. Bergabunglah dengan kami dalam aktivitas menarik kami yang berfoku', ''),
(7, 'Kontak', 'Hubungi Kami untuk Layanan Otomotif Terbaik', 'Butuh informasi lebih lanjut atau memiliki pertanyaan tentang layanan kami? Hubungi CarHab melalui halaman kontak kami. Tim kami siap membantu Anda dengan layanan otomotif berkualitas dan solusi terbaik untuk kebutuhan kendaraan Anda. Dapatkan respon cepa', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_produk`
--

CREATE TABLE `tb_produk` (
  `id_produk` int(5) UNSIGNED NOT NULL,
  `nama_produk_in` varchar(200) NOT NULL,
  `nama_produk_en` varchar(200) NOT NULL,
  `foto_produk` varchar(100) NOT NULL,
  `deskripsi_produk_in` text DEFAULT NULL,
  `deskripsi_produk_en` text DEFAULT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `slug_in` varchar(255) NOT NULL,
  `slug_en` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tb_produk`
--

INSERT INTO `tb_produk` (`id_produk`, `nama_produk_in`, `nama_produk_en`, `foto_produk`, `deskripsi_produk_in`, `deskripsi_produk_en`, `meta_title`, `meta_description`, `slug_in`, `slug_en`) VALUES
(6, 'Mobil Porsche 911 GT3 RS', 'Car Porsche 911 GT3 RS', 'Porsche 911 GT3 RS_Porsche 911 GT3 RS_10072024104829.jpeg', '<p>Porsche 911 GT3 adalah model homologasi performa tinggi dari mobil sport Porsche 911. Ini adalah jajaran model performa tinggi, yang dimulai dengan 911 Carrera RS tahun 1973. GT3 telah memiliki karir balap yang sukses di seri Porsche Carrera Cup dan GT3 Cup Challenge nasional dan regional, serta Porsche Supercup internasional yang mendukung Kejuaraan Dunia FIA F1.</p>', '<p>The Porsche 911 GT3 is a high-performance homologation model of the Porsche 911 sports car. It is a range of high-performance models, which began with the 911 Carrera RS of 1973. The GT3 has had a successful racing career in the national and regional Porsche Carrera Cup and GT3 Cup Challenge series, as well as the international Porsche Supercup supporting the FIA ​​F1 World Championship.</p>', 'Porsche 911 GT3: Mobil Sport Performa Tinggi dengan Warisan Balap yang Kuat', 'Temukan kehebatan Porsche 911 GT3, model homologasi performa tinggi yang melanjutkan tradisi Porsche sejak 1973. Dengan kesuksesan di berbagai ajang balap seperti Porsche Carrera Cup dan FIA F1 Supercup, GT3 adalah pilihan utama bagi pecinta mobil sport.', 'mobil-porsche-911-gt3-rs', 'car-porsche-911-gt3-rs'),
(7, 'Mobil Porsche 718 Cayman GT4 RS', 'Car Porsche 718 Cayman GT4 RS', 'Porsche 718 Cayman GT4 RS_Porsche 718 Cayman GT4 RS_10072024040230.jpg', '<p>Pada tahun 2021, Porsche meluncurkan 718 Cayman GT4 RS, Cayman pertama yang menerima perawatan RS yang biasanya disediakan untuk model 911. Dengan mesin flat-six 4.0 yang disedot secara alami yang berasal dari 911 GT3, ia menghasilkan tenaga 500 PS (370 kW; 490 hp) dan 450 N&sdot;m (330 lbf&sdot;ft) dengan batas rpm 9.000rpm, yang memungkinkannya untuk berlari kencang dari 0&ndash;100 km/jam (0&ndash;62 mph) hanya dalam 3,4 detik. Ini menghasilkan downforce 25% lebih besar dibandingkan varian GT4, melalui sayap belakang tetap yang dipasangi leher angsa. GT4 RS mengungguli N&uuml;rburgring Nordschleife 23 detik lebih cepat dibandingkan GT4.</p>', '<p>In 2021, Porsche unveiled the 718 Cayman GT4 RS, the first Cayman to receive the RS treatment which is usually reserved for the 911 models. With a 4.0 naturally aspirated flat-six derived from the 911 GT3, it puts out 500 PS (370 kW; 490 hp) and 450 N&sdot;m (330 lbf&sdot;ft) with an rpm limit of 9,000rpm, which allows it to sprint from 0&ndash;100 km/h (0&ndash;62 mph) in just 3.4 seconds. It generates 25% more downforce than the GT4 variant, through a swan-neck attachment fixed rear wing. The GT4 RS lapped the N&uuml;rburgring Nordschleife 23 seconds faster than the GT4.</p>', 'Porsche 718 Cayman GT4 RS: Mobil Sport Tercepat dengan Mesin Flat-Six 4.0', 'Rasakan kecepatan Porsche 718 Cayman GT4 RS, model pertama yang menerima perawatan RS dengan mesin flat-six 4.0 dari 911 GT3. Menghasilkan 500 PS dan berakselerasi dari 0-100 km/jam dalam 3,4 detik, GT4 RS menawarkan downforce superior dengan desain sayap', 'mobil-porsche-718-cayman-gt4-rs', 'car-porsche-718-cayman-gt4-rs'),
(8, 'Mobil Porsche Taycan Turbo S', 'Car Porsche Taycan Turbo S', 'Porsche Taycan Turbo S_Porsche Taycan Turbo S_19072024024252.jpeg', '<p>Pertama kali memulai debutnya di Frankfurt Motor Show 2015 sebagai konsep Porsche Mission E, Taycan adalah mobil jalan raya produksi listrik pertama Porsche, yang mulai dijual pada tahun 2020 setelah diperkenalkan di Frankfurt Motor Show 2019.</p>\r\n<p>Dilengkapi dengan dua motor listrik untuk sistem penggerak semua roda - satu untuk setiap gandar serta transmisi dua kecepatan yang dipasang di belakang - Turbo S adalah level trim tertinggi yang ditawarkan, memiliki keluaran tenaga dan kapasitas baterai tertinggi di dunia. rangkaian Taycan, menghasilkan hampir dua kali lipat tenaga kuda dibandingkan trim dasar.</p>', '<p>First debuted at the 2015 Frankfurt Motor Show as the Porsche Mission E concept, the Taycan is Porsche\'s first all-electric production road car, having gone on sale in 2020 following its reveal at the 2019 Frankfurt Motor Show.</p>\r\n<p>Fitted with two electric motors for an all-wheel drive system - one for each axle as well as a two-speed transmission fitted to the rear - the Turbo S is the highest trim level offered, having the highest power output and and battery capacity in the Taycan range, it produces nearly double the horsepower as the base trim.</p>', 'Porsche Taycan: Mobil Listrik Pertama Porsche dengan Kekuatan Superior', 'Porsche Taycan, debut di Frankfurt Motor Show 2015 sebagai konsep Mission E, adalah mobil listrik produksi pertama Porsche yang diluncurkan pada 2020. Ditenagai oleh dua motor listrik dan transmisi dua kecepatan, versi Turbo S menawarkan tenaga luar biasa', 'mobil-porsche-taycan-turbo-s', 'car-porsche-taycan-turbo-s'),
(0, 'produk  indo', 'produk eng', 'produk eng_produk  indo_28092024120319.jpg', '<p>indo</p>', '<p>eng</p>', '', '', 'produk-indo', 'produk-eng');

-- --------------------------------------------------------

--
-- Table structure for table `tb_profil`
--

CREATE TABLE `tb_profil` (
  `id_profil` int(5) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama_perusahaan` varchar(100) NOT NULL,
  `logo_perusahaan` varchar(100) NOT NULL,
  `deskripsi_perusahaan_in` text DEFAULT NULL,
  `deskripsi_perusahaan_en` text DEFAULT NULL,
  `deskripsi_kontak_in` text DEFAULT NULL,
  `deskripsi_kontak_en` text DEFAULT NULL,
  `link_maps` text DEFAULT NULL,
  `link_whatsapp` text DEFAULT NULL,
  `favicon_website` varchar(100) NOT NULL,
  `title_website` varchar(100) NOT NULL,
  `foto_utama` varchar(100) NOT NULL,
  `alamat` text DEFAULT NULL,
  `no_hp` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `teks_footer` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tb_profil`
--

INSERT INTO `tb_profil` (`id_profil`, `username`, `password`, `nama_perusahaan`, `logo_perusahaan`, `deskripsi_perusahaan_in`, `deskripsi_perusahaan_en`, `deskripsi_kontak_in`, `deskripsi_kontak_en`, `link_maps`, `link_whatsapp`, `favicon_website`, `title_website`, `foto_utama`, `alamat`, `no_hp`, `email`, `teks_footer`) VALUES
(1, 'user', 'user', 'CarHab', 'Logo_CarHab_11072024023324.png', '<p>CarHab adalah perusahaan terkemuka di industri otomotif yang berfokus pada penjualan mobil baru dan bekas berkualitas tinggi. Berdiri dengan misi untuk memberikan pengalaman membeli mobil yang luar biasa, CarHab menawarkan berbagai merek dan model yang sesuai dengan berbagai kebutuhan dan anggaran pelanggan.</p>\r\n<p>Dengan showroom modern yang tersebar di berbagai lokasi strategis, CarHab memastikan kenyamanan dan kemudahan bagi pelanggan dalam melihat dan mencoba kendaraan pilihan mereka. Setiap mobil yang dijual oleh CarHab telah melalui proses inspeksi ketat oleh tim ahli kami untuk memastikan kondisi terbaik dan keamanan maksimal.</p>\r\n<p>Selain itu, CarHab juga menyediakan layanan purna jual yang komprehensif, termasuk perawatan berkala, perbaikan, dan penyediaan suku cadang asli. Tim layanan pelanggan kami yang ramah dan berpengalaman siap membantu pelanggan dalam setiap langkah proses pembelian dan pemeliharaan mobil.</p>\r\n<p>CarHab bangga dengan reputasinya dalam memberikan transparansi, kejujuran, dan kepuasan pelanggan yang tinggi. Kami berkomitmen untuk terus meningkatkan kualitas layanan dan memperluas pilihan kendaraan untuk memenuhi kebutuhan pasar yang terus berkembang.</p>', '<p id=\"tw-target-text\" class=\"tw-data-text tw-text-large tw-ta\" dir=\"ltr\" data-placeholder=\"Terjemahan\" aria-label=\"Teks yang diterjemahkan\" data-ved=\"2ahUKEwjeoKjsx5uHAxUW3TgGHcMPAAgQ3ewLegQIBRAU\"><span class=\"Y2IQFc\" lang=\"en\">CarHab is a leading company in the automotive industry focused on selling high-quality new and used cars. Founded on a mission to provide an exceptional car buying experience, CarHab offers a variety of makes and models to suit a variety of customer needs and budgets. With modern showrooms spread across various strategic locations, CarHab ensures comfort and convenience for customers in viewing and trying out the vehicle of their choice. Every car sold by CarHab has gone through a rigorous inspection process by our team of experts to ensure the best condition and maximum safety. Apart from that, CarHab also provides comprehensive after-sales services, including regular maintenance, repairs and supply of original spare parts. Our friendly and experienced customer service team is ready to assist customers with every step of the car purchasing and maintenance process. CarHab is proud of its reputation for providing transparency, honesty and high levels of customer satisfaction. We are committed to continuously improving the quality of service and expanding our vehicle choices to meet the needs of the ever-growing market.</span></p>', '<p>Jl. Grand Bulevar, Cisaranten Kidul, Kec. Gedebage, Kota Bandung, Jawa Barat 40295</p>', '<p>Jl. Grand Bulevar, Cisaranten Kidul, District. Gedebage, Bandung City, West Java 40295</p>', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3960.4536867063466!2d107.6984622!3d-6.9556879!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e68c3006c3b6711%3A0x2e04c418a392860f!2sCarHab!5e0!3m2!1sid!2sid!4v1721963669489!5m2!1sid!2sid\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 'https://wa.me/+6282131222332', 'Favicon_CarHab_11072024020758.png', 'Cars in Your Hand', '1720592984_c939b01a0638a9f6b019.jpeg', '<p>Kec. Gedebage, Kota Bandung, Jawa Barat</p>', '+62 821 3122 2332', 'carhabbsindonesia@gmail.com', 'All Rights Reserved. Designed with love by Me');

-- --------------------------------------------------------

--
-- Table structure for table `tb_slider`
--

CREATE TABLE `tb_slider` (
  `id_slider` int(5) UNSIGNED NOT NULL,
  `file_foto_slider` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tb_slider`
--

INSERT INTO `tb_slider` (`id_slider`, `file_foto_slider`) VALUES
(7, 'Marhab_10072024104249.jpeg'),
(8, 'Marhab_10072024104301.jpeg'),
(9, 'Marhab_10072024104312.jpeg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_meta`
--
ALTER TABLE `tb_meta`
  ADD PRIMARY KEY (`id_seo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_meta`
--
ALTER TABLE `tb_meta`
  MODIFY `id_seo` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
