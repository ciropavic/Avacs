-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 18, 2022 at 08:47 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `irspring`
--

-- --------------------------------------------------------

--
-- Table structure for table `addon_account`
--

CREATE TABLE `addon_account` (
  `name` varchar(60) COLLATE utf8_persian_ci NOT NULL,
  `label` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `addon_account`
--

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('caution', 'Caution', 0),
('property_black_money', 'Argent Sale Propriété', 0),
('society_ambulance', 'Ambulance', 1),
('society_cafeshop', 'cafeshop', 1),
('society_cardealer', 'Concessionnaire', 1),
('society_casino', 'Kasyno', 1),
('society_cfviona', 'Caffe Viona', 1),
('society_cia', 'C.I.A', 1),
('society_coffee', 'coffee', 1),
('society_fbi', 'fbi', 1),
('society_jobfinder', 'jobfinder', 1),
('society_journaliste', 'journaliste', 1),
('society_justice', 'justice', 1),
('society_mechanic', 'Mechanic', 1),
('society_nightclub', 'nightclub', 1),
('society_police', 'Police', 1),
('society_sheriff', 'sheriff', 1),
('society_swatt', 'swatt', 1),
('society_taxi', 'Taxi', 1),
('society_vigne', 'Winegrower', 1),
('society_weazel', 'Weazel', 1);

-- --------------------------------------------------------

--
-- Table structure for table `addon_account_data`
--

CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL,
  `account_name` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `addon_account_data`
--

INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
(1, 'society_ambulance', 113522, NULL),
(2, 'society_cardealer', 0, NULL),
(3, 'society_police', 92201250, NULL),
(4, 'society_vigne', 0, NULL),
(11, 'society_mechanic', 0, NULL),
(16, 'society_taxi', 763, NULL),
(1853, 'society_casino', 771420, NULL),
(1864, 'society_fire', 0, NULL),
(3117, 'society_journaliste', 0, NULL),
(8585, 'society_cfviona', 0, NULL),
(9824, 'society_fbi', 0, NULL),
(9825, 'society_justice', 0, NULL),
(9826, 'society_sheriff', 0, NULL),
(9827, 'society_swatt', 0, NULL),
(14740, 'society_army', 0, NULL),
(14953, 'society_artesh', 650000, NULL),
(17555, 'society_weazel', 0, NULL),
(19892, 'society_coffee', 0, NULL),
(20447, 'society_cafeshop', 0, NULL),
(20448, 'society_jobfinder', 0, NULL),
(20449, 'society_nightclub', 0, NULL),
(21436, 'society_cia', 0, NULL),
(21443, 'property_black_money', 0, 'steam:110000145d1e773'),
(21444, 'caution', 0, 'steam:110000145d1e773'),
(21445, 'property_black_money', 0, 'steam:110000148adfa01'),
(21446, 'caution', 0, 'steam:110000148adfa01'),
(21447, 'caution', 0, 'steam:1100001402db7a7'),
(21448, 'property_black_money', 0, 'steam:1100001402db7a7'),
(21449, 'property_black_money', 0, 'steam:11000013d0262b2'),
(21450, 'caution', 0, 'steam:11000013d0262b2'),
(21451, 'property_black_money', 0, 'steam:110000148d11f2a'),
(21452, 'caution', 0, 'steam:110000148d11f2a'),
(21453, 'caution', 0, 'steam:11000013b37558e'),
(21454, 'property_black_money', 0, 'steam:11000013b37558e'),
(21455, 'caution', 0, 'steam:11000014534dc5b'),
(21456, 'property_black_money', 0, 'steam:11000014534dc5b'),
(21457, 'property_black_money', 0, 'steam:1100001410e55b4'),
(21458, 'caution', 0, 'steam:1100001410e55b4'),
(21459, 'caution', 0, 'steam:1100001166ec0e6'),
(21460, 'property_black_money', 0, 'steam:1100001166ec0e6');

-- --------------------------------------------------------

--
-- Table structure for table `addon_inventory`
--

CREATE TABLE `addon_inventory` (
  `name` varchar(60) COLLATE utf8_persian_ci NOT NULL,
  `label` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `addon_inventory`
--

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('gang_amberat', 'gang', 1),
('gang_big', 'gang', 1),
('gang_blue', 'gang', 1),
('gang_cartel', 'gang', 1),
('gang_comix', 'gang', 1),
('gang_cyber', 'gang', 1),
('gang_gameover', 'gang', 1),
('gang_grovestreet', 'gang', 1),
('gang_pangoolan', 'gang', 1),
('gang_peakyblinders', 'gang', 1),
('gang_pink', 'gang', 1),
('gang_raiders', 'gang', 1),
('gang_saaax', 'gang', 1),
('gang_sheikh', 'gang', 1),
('gang_venom', 'gang', 1),
('gang_vonip', 'gang', 1),
('property', 'Property', 0),
('society_ambulance', 'Ambulance', 1),
('society_cafeshop', 'cafeshop', 1),
('society_cardealer', 'Car Dealer', 1),
('society_casino', 'Casino', 1),
('society_casino_fridge', 'Casino (Bar)', 1),
('society_cfviona', 'Caffe Viona', 1),
('society_cia', 'C.I.A', 1),
('society_coffee', 'coffee', 1),
('society_fbi', 'fbi', 1),
('society_jobfinder', 'jobfinder', 1),
('society_journaliste', 'journaliste', 1),
('society_justice', 'justice', 1),
('society_mechanic', 'Mechanic', 1),
('society_nightclub', 'nightclub', 1),
('society_police', 'Police', 1),
('society_sheriff', 'sheriff', 1),
('society_swatt', 'swatt', 1),
('society_taxi', 'Taxi', 1),
('society_vigne', 'Winegrower', 1),
('society_weazel', 'Weazel', 1);

-- --------------------------------------------------------

--
-- Table structure for table `addon_inventory_items`
--

CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL,
  `inventory_name` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) COLLATE utf8_persian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `addon_inventory_items`
--

INSERT INTO `addon_inventory_items` (`id`, `inventory_name`, `name`, `count`, `owner`) VALUES
(4, 'society_police', 'marijuana', 40, NULL),
(9, 'society_police', 'alive_chicken', 0, NULL),
(35, 'society_police', 'blowtorch', 0, NULL),
(67, 'society_police', 'meth', 0, NULL),
(73, 'society_police', 'cannabis', 0, NULL),
(74, 'society_police', 'ephedrine', 0, NULL),
(80, 'society_police', 'water', 130, NULL),
(94, 'society_police', 'medikit', 0, NULL),
(95, 'society_police', 'bandage', 0, NULL),
(103, 'society_police', 'jewels', 0, NULL),
(105, 'society_police', 'ephedra', 0, NULL),
(110, 'society_police', 'poppy', 5, NULL),
(174, 'society_police', 'bread', 0, NULL),
(340, 'society_police', 'drill', 0, NULL),
(378, 'society_police', 'marabou', 0, NULL),
(380, 'society_police', 'cheesebows', 0, NULL),
(381, 'society_police', 'chips', 0, NULL),
(441, 'society_police', 'coca', 0, NULL),
(591, 'society_police', 'meat_a', 0, NULL),
(592, 'society_police', 'rice', 0, NULL),
(593, 'society_police', 'leather_a', 0, NULL),
(594, 'society_police', 'gazbottle', 0, NULL),
(595, 'society_police', 'sprite', 0, NULL),
(635, 'society_cardealer', 'weed', 0, NULL),
(639, 'society_police', 'honey_a', 0, NULL),
(751, 'society_police', 'wine', 0, NULL),
(896, 'society_police', 'donat5', 0, NULL),
(954, 'society_police', 'cocaine', 0, NULL),
(1034, 'society_police', 'fixtool', 0, NULL),
(1035, 'society_police', 'wool', 0, NULL),
(1037, 'society_police', 'macka', 0, NULL),
(1042, 'society_police', 'packaged_chicken', 0, NULL),
(1045, 'society_police', 'fixkit', 0, NULL),
(1048, 'society_police', 'mushroom', 0, NULL),
(1049, 'society_police', 'mushroom_d', 0, NULL),
(1050, 'society_police', 'sickle', 0, NULL),
(1080, 'society_police', 'breathalyzer', 331, NULL),
(1081, 'society_police', 'drugtest', 364, NULL),
(1088, 'society_police', 'joint', 0, NULL),
(1090, 'society_police', 'cigarette', 0, NULL),
(1095, 'society_police', 'pork', 0, NULL),
(1096, 'society_police', 'lighter', 0, NULL),
(1097, 'society_police', 'capsul', 0, NULL),
(1098, 'society_police', 'lockpick', 0, NULL),
(1103, 'society_police', 'drillsharji', 0, NULL),
(1169, 'society_police', 'yusuf', 0, NULL),
(1170, 'society_police', 'loole', 0, NULL),
(1171, 'society_police', 'fanar', 0, NULL),
(1221, 'society_police', 'c4_bank', 0, NULL),
(1387, 'society_police', 'beer', 2, NULL),
(1388, 'society_police', 'soda', 441, NULL),
(1410, 'society_police', 'fabric', 0, NULL),
(1416, 'society_police', 'opium', 0, NULL),
(1417, 'society_police', 'heroine', 0, NULL),
(1458, 'society_police', 'copper', 0, NULL),
(1459, 'society_police', 'diamond', 0, NULL),
(1475, 'society_police', 'slaughtered_chicken', 0, NULL),
(1476, 'society_police', 'wood', 0, NULL),
(1699, 'society_artesh', 'water', 0, NULL),
(1706, 'society_police', 'radio', 1934, NULL),
(1918, 'society_police', 'gold', 0, NULL),
(1955, 'society_mechanic', 'bread', 0, NULL),
(1956, 'society_mechanic', 'phone', 0, NULL),
(1957, 'gang_btn', 'breathalyzer', 0, NULL),
(1958, 'society_taxi', 'bread', 0, NULL),
(1960, 'society_taxi', 'radio', 80, NULL),
(1967, 'society_taxi', 'cocacola', 252, NULL),
(1968, 'society_taxi', 'burger', 155, NULL),
(1969, 'society_taxi', 'gps', 38, NULL),
(1970, 'society_taxi', 'phone', 49, NULL),
(1971, 'society_taxi', 'pizza', 0, NULL),
(1972, 'society_taxi', 'fanta', 6, NULL),
(1973, 'society_taxi', 'water', 0, NULL),
(1990, 'society_mechanic', 'water', 0, NULL),
(1991, 'society_mechanic', 'burger', 0, NULL),
(2031, 'society_taxi', 'medikit', 0, NULL),
(2032, 'society_taxi', 'bandage', 0, NULL),
(2033, 'society_taxi', 'macka', 0, NULL),
(2034, 'society_taxi', 'cigarette', 0, NULL),
(2035, 'society_taxi', 'joint', 0, NULL),
(2050, 'society_mechanic', 'cocacola', 49, NULL),
(2126, 'society_taxi', 'cheesebows', 0, NULL),
(2265, 'society_taxi', 'soda', 0, NULL),
(2274, 'society_mechanic', 'macka', 4, NULL),
(2277, 'society_weazel', 'gps', 1, NULL),
(2281, 'society_taxi', 'marabou', 49, NULL),
(2282, 'society_taxi', 'chips', 0, NULL),
(2298, 'society_taxi', 'beer', 0, NULL),
(2354, 'society_taxi', 'clip', 0, NULL),
(2710, 'society_police', 'rasperry', 0, NULL),
(2737, 'society_mechanic', 'breathalyzer', 0, NULL),
(2794, 'society_mechanic', 'radio', 1, NULL),
(2795, 'society_mechanic', 'gps', 0, NULL),
(2796, 'society_mechanic', 'fanta', 40, NULL),
(2907, 'society_mechanic', 'lighter', 0, NULL),
(3031, 'society_mechanic', 'clip', 0, NULL),
(3034, 'society_mechanic', 'cigarette', 0, NULL),
(3110, 'society_taxi', 'marijuana', 0, NULL),
(3121, 'society_mechanic', 'cannabis', 0, NULL),
(3144, 'society_taxi', 'blowpipe', 0, NULL),
(3147, 'society_taxi', 'sprite', 16, NULL),
(3179, 'society_mechanic', 'sprite', 5, NULL),
(3180, 'society_mechanic', 'coca', 0, NULL),
(3385, 'society_taxi', 'opium', 0, NULL),
(3404, 'society_mechanic', 'marijuana', 0, NULL),
(3506, 'society_police', 'grip', 1746, NULL),
(3507, 'society_police', 'clip', 1589, NULL),
(3508, 'society_police', 'phone', 222, NULL),
(3509, 'society_police', 'gps', 207, NULL),
(3514, 'society_police', 'flashlight', 303, NULL),
(3525, 'society_police', 'silencer', 177, NULL),
(3610, 'society_cardealer', 'mari joana', 0, NULL),
(3611, 'society_taxi', 'mari joana', 0, NULL),
(3613, 'society_taxi', 'shahdane', 0, NULL),
(3614, 'society_cardealer', 'shahdane', 0, NULL),
(3615, 'society_taxi', 'marijoana', 0, NULL),
(3616, 'society_cardealer', 'marijoana', 0, NULL),
(3617, 'society_taxi', 'Marijuana', 0, NULL),
(3618, 'society_cardealer', 'Marijuana', 0, NULL),
(3619, 'society_taxi', 'gol', 0, NULL),
(3620, 'society_cardealer', 'gol', 0, NULL),
(3621, 'society_taxi', 'weed', 0, NULL),
(3624, 'society_police', 'eclip', 11, NULL),
(3648, 'society_police', 'vodka', 0, NULL),
(3665, 'society_mechanic', 'beer', 2, NULL),
(3680, 'society_mechanic', 'soda', 5, NULL),
(3681, 'society_mechanic', 'pizza', 0, NULL),
(3752, 'gang_saaax', 'marijuana', 0, NULL),
(3758, 'gang_vonip', 'silencer', 8, NULL),
(3759, 'gang_vonip', 'clip', 5, NULL),
(3765, 'society_vigne', 'radio', 1, NULL),
(3767, 'gang_vonip', 'cannabis', 279, NULL),
(3768, 'society_vigne', 'beer', 0, NULL),
(3769, 'society_vigne', 'alive_chicken', 20, NULL),
(3770, 'society_vigne', 'marijuana', 371, NULL),
(3774, 'society_vigne', 'pizza', 0, NULL),
(3775, 'society_vigne', 'cocacola', 8, NULL),
(3776, 'society_vigne', 'fanta', 0, NULL),
(3777, 'society_vigne', 'bread', 4, NULL),
(3778, 'society_vigne', 'soda', 3, NULL),
(3779, 'society_vigne', 'sprite', 8, NULL),
(3780, 'society_vigne', 'water', 5, NULL),
(3781, 'society_vigne', 'cheesebows', 1, NULL),
(3782, 'society_vigne', 'chips', 4, NULL),
(3783, 'society_vigne', 'marabou', 10, NULL),
(3784, 'society_vigne', 'burger', 0, NULL),
(3785, 'society_vigne', 'macka', 2, NULL),
(3786, 'society_vigne', 'joint', 1, NULL),
(3787, 'society_vigne', 'cigarette', 10, NULL),
(3788, 'society_police', 'burger', 0, NULL),
(3789, 'society_vigne', 'vine', 0, NULL),
(3800, 'society_police', 'vine', 0, NULL),
(3805, 'society_vigne', 'raisin', 500, NULL),
(3815, 'gang_cartel', 'clip', 229, NULL),
(3816, 'gang_cartel', 'silencer', 82, NULL),
(3817, 'gang_saaax', 'drill', 0, NULL),
(3818, 'gang_saaax', 'eclip', 0, NULL),
(3819, 'gang_saaax', 'clip', 0, NULL),
(3820, 'gang_saaax', 'c4_bank', 0, NULL),
(3823, 'gang_saaax', 'cannabis', 100, NULL),
(3824, 'gang_cartel', 'cannabis', 371, NULL),
(3825, 'gang_cartel', 'marijuana', 1721, NULL),
(3826, 'gang_cartel', 'gps', 0, NULL),
(3834, 'gang_blue', 'clip', 1, NULL),
(3835, 'gang_blue', 'radio', 2, NULL),
(3836, 'gang_blue', 'marijuana', 250, NULL),
(3838, 'society_mechanic', 'c4_bank', 0, NULL),
(3840, 'gang_cartel', 'heroine', 1533, NULL),
(3847, 'gang_cartel', 'vine', 261, NULL),
(3848, 'gang_cartel', 'opium', 500, NULL),
(3851, 'gang_saaax', 'raisin', 0, NULL),
(3876, 'society_vigne', 'lighter', 1, NULL),
(3901, 'gang_comix', 'armor', 24, NULL),
(3902, 'gang_comix', 'clip', 294, NULL),
(3903, 'gang_comix', 'grip', 29, NULL),
(3904, 'gang_comix', 'silencer', 87, NULL),
(3905, 'gang_comix', 'eclip', 28, NULL),
(3908, 'society_mechanic', 'cheesebows', 4, NULL),
(3909, 'society_mechanic', 'chips', 28, NULL),
(3910, 'society_mechanic', 'marabou', 25, NULL),
(3912, 'gang_amberat', 'radio', 98, NULL),
(3926, 'gang_cartel', 'coca', 40, NULL),
(3930, 'gang_big', 'clip', 300, NULL),
(3931, 'gang_big', 'eclip', 100, NULL),
(3932, 'gang_big', 'grip', 100, NULL),
(3933, 'gang_big', 'radio', 100, NULL),
(3934, 'gang_big', 'phone', 100, NULL),
(3935, 'gang_big', 'gps', 100, NULL),
(3936, 'gang_big', 'silencer', 100, NULL),
(3937, 'gang_big', 'armor', 100, NULL),
(3938, 'gang_big', 'pizza', 500, NULL),
(3939, 'gang_big', 'soda', 500, NULL),
(3942, 'gang_venom', 'pizza', 258, NULL),
(3943, 'gang_venom', 'soda', 255, NULL),
(3944, 'gang_venom', 'silencer', 97, NULL),
(3945, 'gang_venom', 'phone', 96, NULL),
(3946, 'gang_venom', 'radio', 98, NULL),
(3947, 'gang_venom', 'clip', 288, NULL),
(3948, 'gang_venom', 'gps', 95, NULL),
(3949, 'society_police', 'pizza', 0, NULL),
(3950, 'gang_amberat', 'phone', 97, NULL),
(3951, 'gang_amberat', 'gps', 97, NULL),
(3952, 'gang_amberat', 'pizza', 185, NULL),
(3953, 'gang_amberat', 'grip', 93, NULL),
(3954, 'gang_amberat', 'clip', 268, NULL),
(3955, 'gang_amberat', 'eclip', 290, NULL),
(3956, 'gang_amberat', 'soda', 10, NULL),
(3957, 'gang_amberat', 'silencer', 92, NULL),
(3958, 'gang_amberat', 'armor', 35, NULL),
(3968, 'gang_amberat', 'burger', 3, NULL),
(3969, 'gang_amberat', 'macka', 0, NULL),
(3970, 'gang_amberat', 'bread', 3, NULL),
(3971, 'gang_amberat', 'beer', 7, NULL),
(3972, 'gang_amberat', 'fanta', 9, NULL),
(3973, 'gang_amberat', 'water', 1, NULL),
(3974, 'gang_amberat', 'cocacola', 6, NULL),
(3975, 'gang_amberat', 'sprite', 10, NULL),
(4039, 'gang_venom', 'cannabis', 0, NULL),
(4051, 'society_vigne', 'poppy', 8, NULL),
(4052, 'society_vigne', 'cannabis', 12, NULL),
(4057, 'gang_cyber', 'armor', 32, NULL),
(4066, 'gang_raiders', 'raisin', 100, NULL),
(4068, 'gang_cyber', 'grip', 50, NULL),
(4069, 'gang_cyber', 'eclip', 49, NULL),
(4070, 'gang_cyber', 'clip', 89, NULL),
(4071, 'gang_cyber', 'radio', 0, NULL),
(4072, 'gang_cyber', 'soda', 297, NULL),
(4073, 'gang_cyber', 'pizza', 295, NULL),
(4074, 'gang_cyber', 'gps', 100, NULL),
(4075, 'gang_cyber', 'phone', 100, NULL),
(4076, 'gang_cyber', 'silencer', 100, NULL),
(4077, 'gang_cyber', 'jewels', 0, NULL),
(4078, 'gang_sheikh', 'pizza', 300, NULL),
(4079, 'gang_sheikh', 'fanta', 300, NULL),
(4080, 'gang_sheikh', 'gps', 100, NULL),
(4081, 'gang_sheikh', 'radio', 100, NULL),
(4082, 'gang_sheikh', 'clip', 100, NULL),
(4083, 'gang_sheikh', 'phone', 100, NULL),
(4084, 'gang_sheikh', 'grip', 50, NULL),
(4085, 'gang_sheikh', 'silencer', 0, NULL),
(4087, 'gang_raiders', 'eclip', 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `adminjaillog`
--

CREATE TABLE `adminjaillog` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `oocname` varchar(255) DEFAULT NULL,
  `jailreason` varchar(50) DEFAULT NULL,
  `jailtime` int(50) DEFAULT NULL,
  `punisher` varchar(100) DEFAULT NULL,
  `date` int(32) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adminjaillog`
--

INSERT INTO `adminjaillog` (`id`, `identifier`, `name`, `oocname`, `jailreason`, `jailtime`, `punisher`, `date`) VALUES
(2, 'steam:110000142edcf79', 'steam:110000142edcf79', NULL, 'pg+cl', 30, 'A2', 0),
(3, 'steam:11000014257f01d', 'Daniyal_180', NULL, ':|', 10, 'HAMID', 1603147504),
(4, 'steam:11000014257f01d', 'Daniyal_180', NULL, '.', 60, 'HAMID', 1603151248),
(5, 'steam:1100001349629e7', 'BaBaYaGa', NULL, '.', 60, 'HAMID', 1603151281),
(6, 'steam:1100001349629e7', 'BaBaYaGa', NULL, '0', 10, 'HAMID', 1603151523),
(7, 'steam:11000014257f01d', 'Daniyal_180', NULL, '0', 10, 'HAMID', 1603151526),
(8, 'steam:1100001349629e7', 'BaBaYaGa', NULL, 'tohin be staff', 100, 'HAMID', 1603151754),
(9, 'steam:11000010ee02fed', 'steam:11000010ee02fed', NULL, 'Combat Log', 40, 'HAMID', 0),
(10, 'steam:11000013718236a', 'steam:11000013718236a', NULL, 'combat log', 30, 'HAMID', 0),
(11, 'steam:11000013fb7c107', 'mmdcaptainsparrow7558', NULL, 'test', 1, 'MRX', 1603227753),
(12, 'steam:1100001349629e7', 'BaBaYaGa', NULL, 'sik', 100, 'A2', 1603235817),
(13, 'steam:11000014293a476', 'HSM_JRJ13', NULL, 'OC-Insult+Vdm', 40, 'A2', 1603278808),
(14, 'steam:1100001411839fc', 'steam:1100001411839fc', NULL, 'NonRp+CL', 20, 'A2', 0),
(15, 'steam:110000141c3a056', 'haffwee', NULL, 'dm', 20, 'A2', 1603284532),
(16, 'steam:110000135f94724', 'ZUIX Wilson', NULL, 'rp pause', 10, 'A2', 1603284561),
(17, 'steam:11000013692df57', 'Ali-WTF', NULL, 'ghavanin ro bekhoon', 20, 'A2', 1603286636),
(18, 'steam:11000013ccc85dd', 'steam:11000013ccc85dd', NULL, 'cl-lv1', 30, 'KutieKatty', 0),
(19, 'steam:110000142baf68d', 'steam:110000142baf68d', NULL, 'cl-lv1', 30, 'KutieKatty', 0),
(20, 'steam:11000013c1cadb4', 'steam:11000013c1cadb4', NULL, 'cl-lv1', 30, 'KutieKatty', 0),
(21, 'steam:11000013ed90c41', 'AbolfazlXGamer', NULL, 'Cop Baiting', 20, 'Dexter', 1603304515),
(22, 'steam:11000013fcccb60', 'b0rb0rak', NULL, 'Cop Baiting', 20, 'Dexter', 1603305350),
(23, 'steam:1100001411b2614', 'steam:1100001411b2614', NULL, 'DM + K.O.S BRAKE', 150, 'HAMID', 0),
(24, 'steam:1100001409cb5a4', 'Ahmadreza', NULL, 'test', 1, 'A2', 1603307395),
(25, 'steam:11000013fb7c107', 'mmdcaptainsparrow7558', NULL, 'tohin be rank bala', 20, 'HAMID', 1603350669),
(26, 'steam:1100001423a8b84', 'steam:1100001423a8b84', NULL, 'cl_lvl1', 30, 'HAMID', 0),
(27, 'steam:1100001414e63f9', 'Dexter', NULL, 'karma', 1, 'HAMID', 1603354407),
(28, 'steam:11000014107934c', 'alirz', NULL, 'NCZ Brake', 20, 'HAMID', 1603360079),
(29, 'steam:11000013e657e3d', 'MKD', NULL, '.', 20, 'HAMID', 1603360171),
(30, 'steam:11000014271785a', 'dark wizard', NULL, 'fear rp', 20, 'MRX', 1603363637),
(31, 'steam:11000013b961c60', 'HAMID', NULL, '1', 1, 'HAMID', 1603378008),
(32, 'steam:11000014033b78b', 'steam:11000014033b78b', NULL, 'FeraRp+CL', 20, 'A2', 0),
(33, 'steam:11000013fc9f09d', 'Damoon', NULL, 'fear rp', 20, 'MRX', 1603393290),
(34, 'steam:11000013b961c60', 'HAMID', NULL, 'test', 1, 'HAMID', 1603407632),
(35, 'steam:11000013f96927c', 'PriCe', NULL, 'test', 2, 'MRX', 1603447136),
(36, 'steam:110000142ce8baa', 'saberkamel45', NULL, 'RPpuse', 20, 'MRX', 1603449418),
(37, 'steam:11000013fc9f09d', 'Damoon', NULL, 'K.O.S', 20, 'MRX', 1603449483),
(38, 'steam:110000142baf68d', 'Mr.Amir', NULL, 'cop baiting', 15, 'HAMID', 1603464760),
(39, 'steam:1100001366527c9', 'steam:1100001366527c9', NULL, 'CL', 30, 'A2', 0),
(40, 'steam:11000011b65f6c6', 'The Professional Gamer', NULL, 'tir zadan be yare khodi', 2, 'MRX', 1603475910),
(41, 'steam:1100001433804d1', 'ng.nitrogame', NULL, 'nonrp', 5, 'MRX', 1603477294),
(42, 'steam:11000014217b47a', 'steam:11000014217b47a', NULL, 'CB+CL', 60, 'Dexter', 0),
(43, 'steam:110000118dc54de', 'steam:110000118dc54de', NULL, 'CB+CL', 60, 'Dexter', 0),
(44, 'steam:1100001433804d1', 'ng.nitrogame', NULL, 'pg', 30, '^6KutieKatty', 1603481381),
(45, 'steam:11000013c2e0abd', 'amirJoker', NULL, 'FearRP', 20, 'Dexter', 1603483924),
(46, 'steam:11000013d56fc57', 'Ghost', NULL, 'non rp', 20, 'Mehrbod Blade', 1603485352),
(47, 'steam:11000014257f01d', 'Daniyal_180', NULL, 'jail admin', 10, 'MRX', 1603491175),
(48, 'steam:11000014107934c', 'alirz', NULL, 'nlr bracker', 20, 'HAMID', 1603519862),
(49, 'steam:110000142ce8baa', 'saberkamel45', NULL, 'RPP Rule', 20, 'Dexter', 1603564053),
(50, 'steam:110000142f81833', 'mmad_qazvini', NULL, 'illegal ncz', 120, 'HAMID', 1603569880),
(51, 'steam:110000141d4150f', 'ARIA.MPK', NULL, 'NCZ Break', 10, 'A2', 1603624331),
(52, 'steam:1100001416c2363', 'behzadpearce', NULL, 'PG', 20, '^4Dexter', 1603632500),
(53, 'steam:11000013b961c60', 'HAMID', NULL, 'PG', 1000, 'HAMID', 1603637557),
(54, 'steam:1100001414e63f9', '^4Dexter', NULL, 'Dozdidane Mashine Dolati', 10, 'A2', 1603650962),
(55, 'steam:1100001371d61be', 'steam:1100001371d61be', NULL, 'CombatLog', 120, '^4Dexter', 0),
(56, 'steam:11000013bfc7ef5', 'steam:11000013bfc7ef5', NULL, 'CombatLog', 120, '^4Dexter', 0),
(57, 'steam:1100001421d5732', 'steam:1100001421d5732', NULL, 'CombatLog', 40, '^4Dexter', 0),
(58, 'steam:11000013f96927c', 'PriCe', NULL, 'Tohin Be rank balatar', 20, 'HAMID', 1603657026),
(59, 'steam:1100001424faa91', 'D A Y A N', NULL, 'KILL BEDOUN K.O.S', 20, 'HAMID', 1603700170),
(60, 'steam:110000142decc88', 'steam:110000142decc88', NULL, 'NCZBreake+CL', 30, '^4Dexter', 0),
(61, 'steam:11000014257f01d', 'Daniyal_180', NULL, 'By A2', 20, 'A2', 1603721783),
(62, 'steam:1100001414e63f9', 'steam:1100001414e63f9', NULL, 'By A2', 20, 'A2', 0),
(63, 'steam:1100001353ed74c', '- C4PT4IN !', NULL, 'Meta Gaming', 30, 'HAMID', 1603742885),
(64, 'steam:110000142ce8baa', 'saberkamel45', NULL, 'Meta Gaming', 30, 'HAMID', 1603742974),
(65, 'steam:1100001353ed74c', 'steam:1100001353ed74c', NULL, 'cl + meta gaming', 60, 'HAMID', 0),
(66, 'steam:110000143f0a834', 'steam:110000143f0a834', NULL, 'CL+FRP+PG', 30, 'Dexter', 0),
(67, 'steam:11000011b65f6c6', 'The Professional Gamer', NULL, 'OOC INSULT', 10, 'HAMID', 1603806318),
(68, 'steam:1100001355192c8', 'PABLO', NULL, 'CB', 20, 'Dexter', 1603813716),
(69, 'steam:1100001356ed847', '2020sajad2020', NULL, 'b.a', 60, 'Mehrbod Blade', 1603828572),
(70, 'steam:110000143efb563', 'tohiidansari79', NULL, 'rppuse', 15, 'MRX', 1603830486),
(71, 'steam:1100001356ed847', '2020sajad2020', NULL, 'tohin be hamid', 15, 'HAMID', 1603870827),
(72, 'steam:11000013c51bc0b', 'MRX', NULL, '1', 1, 'HAMID', 1603873004),
(73, 'steam:11000013b961c60', 'HAMID', NULL, '1', 1, 'HAMID', 1603873008),
(74, 'steam:11000013dd183a5', 'rwmitn', NULL, 'copbeting', 10, 'MRX', 1603897108),
(75, 'steam:11000013dd183a5', 'rwmitn', NULL, 'nonrp:bro ghavanin ro kamel bekhon', 20, 'MRX', 1603898458),
(76, 'steam:11000013b961c60', 'steam:11000013b961c60', NULL, 'NonRP', 30, 'Dexter', 0),
(77, 'steam:110000142ce8baa', 'saberkamel45', NULL, 'OOC INSULT', 60, 'HAMID', 1603908111),
(78, 'steam:11000011bdae895', 'A2', NULL, 'sdds', 1, 'HAMID', 1603926510),
(79, 'steam:11000011bdae895', 'A2', NULL, '1', 1, 'HAMID', 1603926857),
(80, 'steam:11000011bdae895', 'A2', NULL, 'sd', 1, 'HAMID', 1603926936),
(81, 'steam:110000141935590', 'arshia-ghost', NULL, 'PG+CB', 30, 'Dexter', 1604007812),
(82, 'steam:110000141696e66', 'steam:110000141696e66', NULL, 'PowerGaming+CombatLog', 20, 'A2', 0),
(83, 'steam:11000014274ecc5', 'steam:11000014274ecc5', NULL, 'CopBaiting+CombatLog', 20, 'A2', 0),
(84, 'steam:110000141806642', 'steam:110000141806642', NULL, 'NonRP+CombatLog', 40, 'A2', 0),
(85, 'steam:11000014182aa6f', 'steam:11000014182aa6f', NULL, 'NonRP+CombatLog', 40, 'A2', 0),
(86, 'steam:1100001349629e7', 'BaBaYaGa', NULL, 'Aroom Bash', 1, 'A2', 1604193471),
(87, 'steam:11000013b961c60', 'HAMID', NULL, 'test', 1, 'HAMID', 1604214894),
(88, 'steam:11000014383b6db', 'QQreyhne', NULL, 'test', 60, 'HAMID', 1604216601),
(89, 'steam:11000013fd39dcb', 'The Stranger', NULL, 'HAMID INSULT', 20, 'HAMID', 1604221061),
(90, 'steam:11000013fb7c107', 'mamad shread', NULL, 'HAMID INSULT', 20, 'HAMID', 1604221072),
(91, 'steam:11000013fb7c107', 'mamad shread', NULL, 'HAMID INSULT', 60, 'HAMID', 1604221171),
(92, 'steam:11000013d207ecb', 'A.H.E', NULL, 'kos', 15, 'HAMID', 1604738288),
(93, 'steam:11000013cafc4ee', 'Tornado', NULL, 'kos', 15, 'HAMID', 1604738294),
(94, 'steam:11000013b961c60', 'HAMID', NULL, 'bug abuse', 20, 'HAMID', 1604766574),
(95, 'steam:110000138a11e8b', 'NOOB-KILLER', NULL, 'hamid insult', 60, 'HAMID', 1604819337),
(96, 'steam:11000013fb7c107', 'mamad shread', NULL, 'senior helpery', 1, 'Mmd_morghi', 1604834356),
(97, 'steam:11000013ebe7405', 'steam:11000013ebe7405', NULL, 'DM+NczBreak+CombatLog', 40, 'A2', 0),
(98, 'steam:110000134909338', 'Mr_Anonym', NULL, 'tohin be staff', 20, 'HAMID', 1604931661),
(99, 'steam:11000011d0dea28', 'KasraKiller', NULL, 'snipe', 10, 'Mehrbod Blade', 1604933869),
(100, 'steam:110000141f8e081', 'amirmokk', NULL, 'snipe', 10, 'Mehrbod Blade', 1604933874),
(101, 'steam:11000011d0dea28', 'KasraKiller', NULL, 'Streamer Snipe', 20, 'HAMID', 1604934964),
(102, 'steam:110000141f8e081', 'amirmokk', NULL, 'Streamer Snipe', 20, 'HAMID', 1604934974),
(103, 'steam:1100001425b0d9b', 'psheykh5.5', NULL, 'Kill bedoun K.O.S + Kill Medic', 20, 'HAMID', 1604941365),
(104, 'steam:1100001436379d3', 'unknown', NULL, 'vdm', 20, 'Mehrbod Blade', 1604941636),
(105, 'steam:11000014360fa26', 'steam:11000014360fa26', NULL, 'cl', 30, 'Mehrbod Blade', 0),
(106, 'steam:11000013f96927c', 'PriCe', NULL, 'insult', 60, 'Mehrbod Blade', 1605020574),
(107, 'steam:1100001433804d1', 'ng.nitrogame', NULL, 'vdm', 5, 'A2', 1605022151),
(108, 'steam:110000135f94724', 'steam:110000135f94724', NULL, 'Insult', 30, 'A2', 0),
(109, 'steam:11000014281f35e', 'steam:11000014281f35e', NULL, 'NonRP+DeathMatch+CombatLog', 35, 'A2', 0),
(110, 'steam:11000013dff330c', 'sarbaz', NULL, 'OC-Insult', 500, 'A2', 1605033220),
(111, 'steam:110000142ed5948', 'steam:110000142ed5948', NULL, 'Insult', 10, 'A2', 0),
(112, 'steam:1100001433804d1', 'ng.nitrogame', NULL, 'RpPause+Insult', 30, 'A2', 1605038344),
(113, 'steam:11000014257f01d', 'Daniyal_180', NULL, 'RpPause+Insult', 30, 'A2', 1605038450),
(114, 'steam:110000141333972', 'mohmdali.138o.21', NULL, 'stream snipe', 10, 'Mmd_morghi', 1605040820),
(115, 'steam:11000014360fa26', 'Bardia Yazdanbaksh', NULL, 'Rp Pause', 15, 'A2', 1605041426),
(116, 'steam:1100001426c77d1', 'norouziempire', NULL, 'pg', 20, 'Mehrbod Blade', 1605045021),
(117, 'steam:1100001432edd27', 'meysam959', NULL, 'DM+VDM', 40, 'A2', 1605054356),
(118, 'steam:11000013df7f04f', 'steam:11000013df7f04f', NULL, 'Estefade Az Gune Gheyre Mojaz', 50, 'A2', 0),
(119, 'steam:11000013df7f04f', 'steam:11000013df7f04f', NULL, 'Estefade Az Gune Gheyre Mojaz', 50, 'A2', 0),
(120, 'steam:11000013df7f04f', 'steam:11000013df7f04f', NULL, 'Estefade Az Gune Gheyre Mojaz', 50, 'A2', 0),
(121, 'steam:11000013df7f04f', 'steam:11000013df7f04f', NULL, 'Estefade Az Gune Gheyre Mojaz', 15, 'A2', 0),
(122, 'steam:11000013df7f04f', 'steam:11000013df7f04f', NULL, 'Estefade Az Gune Gheyre Mojaz', 10, 'A2', 0),
(123, 'steam:11000013df7f04f', 'steam:11000013df7f04f', NULL, 'Estefade Az Gune Gheyre Mojaz', 85, 'A2', 0),
(124, 'steam:1100001417d04c3', 'steam:1100001417d04c3', NULL, 'DeathMatch+NczBreak+NonRP+CombatLog', 200, 'A2', 0),
(125, 'steam:1100001417d04c3', 'steam:1100001417d04c3', NULL, 'DeathMatch+NczBreak+NonRP+CombatLog', 2500, 'A2', 0),
(126, 'steam:1100001417d04c3', 'steam:1100001417d04c3', NULL, 'DeathMatch+NczBreak+NonRP+CombatLog', 250, 'A2', 0),
(127, 'steam:110000144408f9b', 'steam:110000144408f9b', NULL, 'NonRP+CombatLog', 30, 'A2', 0),
(128, 'steam:110000142e67fbf', 'steam:110000142e67fbf', NULL, 'NonRP+DeathMatch+FearRP+CombatLog', 40, 'A2', 0),
(129, 'steam:110000143d99c62', 'steam:110000143d99c62', NULL, 'DeathMatch+OC_Insult', 200, 'A2', 0),
(130, 'steam:11000013fc9f09d', 'Damoon', NULL, 'DM and fear rp check the ruls', 5, 'Secret', 1605245695),
(131, 'steam:110000142ce8baa', 'saberkamel45', NULL, 'DM and fear rp check the ruls', 5, 'Secret', 1605245700),
(132, 'steam:110000143f8b3f3', 'aliaminicyber', NULL, 'dm check the ruls', 10, 'Secret', 1605307160),
(133, 'steam:110000142ce8baa', 'saberkamel45', NULL, 'jail bedon k.o.s check the ruls', 10, 'Secret', 1605307785),
(134, 'steam:11000011bd71502', 'steam:11000011bd71502', NULL, 'NonRP+CombatLog', 150, 'A2', 0),
(135, 'steam:11000010936798e', 'harry_potter', NULL, 'By A2', 200, 'A2', 1605316841),
(136, 'steam:1100001419f8003', 'MehdiGawKosh', NULL, 'insult', 30, 'Mehrbod Blade', 1605317125),
(137, 'steam:110000142ce8baa', 'saberkamel45', NULL, 'stream snipe', 10, 'Mmd_morghi', 1605319219),
(138, 'steam:1100001426c77d1', 'norouziempire', NULL, 'stream snipe', 10, 'Mmd_morghi', 1605319242),
(139, 'steam:11000013ebe327a', 'Hot-Thunder', NULL, 'stream snipe', 10, 'Mmd_morghi', 1605320994),
(140, 'steam:11000013ebe327a', 'Hot-Thunder', NULL, 'Vdm+Pg+Stream snipe', 20, 'A2', 1605322316),
(141, 'steam:110000142b9bbb1', 'mhmdabwalfda160', NULL, 'stream snipe', 20, 'Mmd_morghi', 1605324776),
(142, 'steam:110000142b9bbb1', 'mhmdabwalfda160', NULL, 'stream snipe', 10, 'Mmd_morghi', 1605326537),
(143, 'steam:110000142b9bbb1', 'mhmdabwalfda160', NULL, 'Stream Snipe', 30, 'A2', 1605326595),
(144, 'steam:110000142b9bbb1', 'mhmdabwalfda160', NULL, 'StreamSnipe+NonRP', 20, 'A2', 1605327326),
(145, 'steam:110000142b9bbb1', 'mhmdabwalfda160', NULL, 'FamilyInsult', 500, 'A2', 1605328095),
(146, 'steam:110000142114fd1', 'mr_mdn', NULL, 'ooc insult', 10, 'Secret', 1605392588),
(147, 'steam:11000013d6845af', 'steam:11000013d6845af', NULL, 'By A2', 100, 'A2', 0),
(148, 'steam:11000013c73c374', 'steam:11000013c73c374', NULL, 'VDM+PowerGaming+CombayLog', 150, 'A2', 0),
(149, 'steam:11000013c73c374', 'steam:11000013c73c374', NULL, 'VDM+PowerGaming+CombatLog', 150, 'A2', 0),
(150, 'steam:110000148adfa01', 'BiG ADLER', NULL, '1', 1, 'BiG ADLER', 1624411445),
(151, 'steam:110000148adfa01', 'BiG ADLER', NULL, '1', 1, 'BiG ADLER', 1624411578),
(152, 'steam:110000148adfa01', 'BiG ADLER', NULL, '1', 1, 'BiG ADLER', 1624418715);

-- --------------------------------------------------------

--
-- Table structure for table `allhousing`
--

CREATE TABLE `allhousing` (
  `id` int(11) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `ownername` varchar(50) NOT NULL,
  `owned` tinyint(4) NOT NULL,
  `price` int(11) NOT NULL,
  `resalepercent` int(11) NOT NULL,
  `resalejob` varchar(50) NOT NULL,
  `entry` longtext DEFAULT NULL,
  `garage` longtext DEFAULT NULL,
  `furniture` longtext DEFAULT NULL,
  `shell` varchar(50) NOT NULL,
  `interior` varchar(50) NOT NULL,
  `shells` longtext DEFAULT NULL,
  `doors` longtext DEFAULT NULL,
  `housekeys` longtext DEFAULT NULL,
  `wardrobe` longtext DEFAULT NULL,
  `inventory` longtext DEFAULT NULL,
  `inventorylocation` longtext DEFAULT NULL,
  `mortgage_owed` int(11) NOT NULL DEFAULT 0,
  `last_repayment` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `allhousing`
--

INSERT INTO `allhousing` (`id`, `owner`, `ownername`, `owned`, `price`, `resalepercent`, `resalejob`, `entry`, `garage`, `furniture`, `shell`, `interior`, `shells`, `doors`, `housekeys`, `wardrobe`, `inventory`, `inventorylocation`, `mortgage_owed`, `last_repayment`) VALUES
(1, 'steam:110000148adfa01', 'Arman_Mohebrad', 1, 1, 10, '', '{\"w\":234.03143310546876,\"z\":21.32347869873047,\"y\":-1921.000244140625,\"x\":118.10990142822266}', '{\"w\":140.6759490966797,\"z\":20.75175094604492,\"y\":-1930.34228515625,\"x\":113.23709869384766}', '[]', 'ApartmentV1', '', '{\"ApartmentV1\":true}', '', '[]', '[]', '{\"Items\":[],\"Weapons\":[],\"Cash\":0,\"DirtyMoney\":0}', '[]', 0, 0),
(2, 'steam:110000145d1e773', 'Amirhossien_Azari', 1, 1000, 10, '', '{\"x\":-998.9291381835938,\"y\":816.5809936523438,\"z\":173.0496368408203,\"w\":51.32004928588867}', '{\"x\":-1020.29833984375,\"y\":815.1322631835938,\"z\":172.27430725097657,\"w\":22.57885932922363}', '[]', 'HotelV1', '', '{\"HotelV1\":true}', '', '[]', '[]', '{\"DirtyMoney\":0,\"Items\":[],\"Cash\":0,\"Weapons\":[]}', '{\"x\":-1.552978515625,\"y\":-4.13775634765625,\"z\":28.84945678710937}', 0, 0),
(3, 'steam:110000148adfa01', 'Arman_Mohebrad', 1, 1, 10, '', '{\"y\":-1948.5015869140626,\"z\":21.17420959472656,\"w\":52.65426254272461,\"x\":76.80668640136719}', '[]', '[]', 'NewApt1', '', '{\"NewApt1\":true}', '', '[]', '[]', '{\"Weapons\":[],\"Items\":[],\"Cash\":0,\"DirtyMoney\":0}', '[]', 0, 0),
(4, 'steam:110000148adfa01', 'Arman_Mohebrad', 1, 1, 10, '', '{\"w\":201.06829833984376,\"x\":126.72080993652344,\"y\":-1929.63916015625,\"z\":21.3824291229248}', '[]', '[]', 'HotelV1', '', '{\"HotelV1\":true}', '', '[]', '[]', '{\"Weapons\":[],\"DirtyMoney\":0,\"Items\":[],\"Cash\":0}', '[]', 0, 0),
(5, 'steam:110000148adfa01', 'Arman_Mohebrad', 1, 1, 10, '', '{\"w\":18.78558349609375,\"x\":114.2694320678711,\"y\":-1960.915283203125,\"z\":21.33431625366211}', '[]', '[]', 'NewApt1', '', '{\"NewApt1\":true}', '', '[]', '[]', '{\"Weapons\":[],\"DirtyMoney\":0,\"Items\":[],\"Cash\":0}', '[]', 0, 0),
(6, 'steam:110000148adfa01', 'Arman_Mohebrad', 0, 1, 10, 'government', '{\"z\":20.74747848510742,\"w\":49.47512435913086,\"x\":84.78181457519531,\"y\":-1967.1402587890626}', '[]', '[]', 'Trevor', '', '{\"Trevor\":true}', '', '[]', '[]', '{\"Cash\":0,\"Weapons\":[],\"Items\":[],\"DirtyMoney\":0}', '[]', 0, 0),
(7, 'steam:110000148adfa01', 'Arman_Mohebrad', 1, 1, 10, '', '{\"x\":100.97700500488281,\"w\":331.9974365234375,\"z\":21.40743827819824,\"y\":-1912.2261962890626}', '[]', '[]', 'HotelV1', '', '{\"HotelV1\":true}', '', '[]', '[]', '{\"DirtyMoney\":0,\"Weapons\":[],\"Items\":[],\"Cash\":0}', '[]', 0, 0),
(8, 'steam:11000013b37558e', 'Parsa_Johnson', 1, 1, 10, '', '{\"z\":21.12167358398437,\"w\":237.38720703125,\"x\":85.55575561523438,\"y\":-1959.3712158203126}', '{\"z\":20.74746131896972,\"w\":318.3792419433594,\"x\":88.86795806884766,\"y\":-1967.4813232421876}', '[]', 'Trevor', '', '{\"HotelV1\":true}', '', '[]', '[]', '{\"Weapons\":[],\"Items\":[],\"DirtyMoney\":0,\"Cash\":0}', '[]', 0, 0),
(9, 'steam:110000148adfa01', 'Arman_Mohebrad', 1, 1, 10, '', '{\"x\":56.75417327880859,\"w\":47.25989151000976,\"z\":21.91106796264648,\"y\":-1922.8377685546876}', '[]', '[{\"pos\":{\"z\":-28.70131683349609,\"y\":2.12353515625,\"x\":-3.72341156005859},\"rot\":{\"z\":0.0,\"y\":0.0,\"x\":0.0},\"model\":\"apa_mp_h_acc_rugwooll_03\"}]', 'ApartmentV1', '', '{\"ApartmentV1\":true}', '', '[]', '[]', '{\"Cash\":0,\"Weapons\":[],\"Items\":[],\"DirtyMoney\":0}', '{\"x\":-7.88406372070312,\"z\":27.70104598999023,\"y\":11.095947265625}', 0, 0),
(10, 'steam:110000148adfa01', 'Arman_Mohebrad', 1, 10000, 10, '', '{\"y\":-1864.372314453125,\"x\":45.84184265136719,\"w\":309.385009765625,\"z\":23.2782974243164}', '{\"y\":-1872.39501953125,\"x\":33.1651496887207,\"w\":328.2523498535156,\"z\":22.66823577880859}', '[]', 'NewApt1', '', '{\"NewApt1\":true}', '', '[]', '[]', '{\"Weapons\":[],\"Cash\":0,\"DirtyMoney\":0,\"Items\":[]}', '{\"y\":-0.375244140625,\"z\":26.99922561645507,\"x\":-0.53810119628906}', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `anticheat`
--

CREATE TABLE `anticheat` (
  `identifier` varchar(100) NOT NULL,
  `license` varchar(100) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `discord` varchar(100) DEFAULT NULL,
  `nazwa` varchar(100) DEFAULT NULL,
  `powod` varchar(100) DEFAULT NULL,
  `typkary` varchar(100) DEFAULT NULL,
  `datanadania` varchar(100) DEFAULT NULL,
  `liveid` varchar(100) DEFAULT NULL,
  `xbl` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `arrests_list`
--

CREATE TABLE `arrests_list` (
  `id` int(11) NOT NULL,
  `json_data` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `baninfo`
--

CREATE TABLE `baninfo` (
  `identifier` varchar(25) COLLATE utf8mb4_bin NOT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `liveid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `xblid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `discord` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `playerip` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `playername` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `baninfo`
--

INSERT INTO `baninfo` (`identifier`, `license`, `liveid`, `xblid`, `discord`, `playerip`, `playername`) VALUES
('steam:1100001166ec0e6', 'license:e86ea3bc9986c843637f0187e1d5bddbaa2b75d6', 'live:914799000367759', 'xbl:2535416972810271', 'discord:643137299701563418', 'ip:192.168.0.239', ''),
('steam:11000013b37558e', 'license:a4d4b394cace9e2675c54c909459cdfcfca97422', 'no info', 'no info', 'discord:806460277645901835', 'ip:80.210.49.248', 'Parsa_Johnson'),
('steam:11000013d0262b2', 'license:de3274b7f6a8abb936d1c51c6b3bead4cc7e6ea9', 'live:985154407629259', 'xbl:2535416544547245', 'discord:696599761674960977', 'ip:188.158.140.48', ''),
('steam:1100001402db7a7', 'license:0884ef5361e0c332b6bac2ae932510cfeed70f5a', 'no info', 'no info', 'discord:661213158110658570', 'ip:45.156.203.203', ''),
('steam:1100001410e55b4', 'license:62bffcb569a4eea175d70f9420113b3d30b916f9', 'no info', 'no info', 'no info', 'ip:103.231.137.102', 'Masiha_Omidi'),
('steam:11000014534dc5b', 'license:0d7602df5b8fc7abd27c84c32ea046058450d0fe', 'no info', 'no info', 'discord:705077939284344892', 'ip:188.215.222.245', ''),
('steam:110000145d1e773', 'license:bec20ead50f5ec899ba2ae177ef83adb35698b64', 'live:1055519292394830', 'no info', 'discord:726504417062420500', 'ip:46.248.40.63', 'Amirhossien_Azari'),
('steam:110000148adfa01', 'license:c737b98773cf945a51933035c8fdb35f3d2f0a6d', 'no info', 'no info', 'discord:809903662947893319', 'ip:5.124.244.82', 'Arman_Mohebrad'),
('steam:110000148d11f2a', 'license:3edef7588d15d1c5d057e98ffb1526fd6bd36d7f', 'live:1055518796066500', 'xbl:2535448325363145', 'no info', 'ip:94.60.192.143', '');

-- --------------------------------------------------------

--
-- Table structure for table `banlist`
--

CREATE TABLE `banlist` (
  `identifier` varchar(25) COLLATE utf8mb4_bin NOT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `liveid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `xblid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `discord` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `playerip` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `targetplayername` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `sourceplayername` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `timeat` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `expiration` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `permanent` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `banlist`
--

INSERT INTO `banlist` (`identifier`, `license`, `liveid`, `xblid`, `discord`, `playerip`, `targetplayername`, `sourceplayername`, `reason`, `timeat`, `expiration`, `permanent`) VALUES
('steam:110000148d11f2a', 'license:3edef7588d15d1c5d057e98ffb1526fd6bd36d7f', 'live:1055518796066500', 'xbl:2535448325363145', 'no info', 'ip:94.60.192.143', 'Kian_Behrouzian', 'BiG ADLER', 'Server Under Developming Ast Baad az Run Shodan Asli UnBan Mishavid', '1624472809', '1624472809', 1);

-- --------------------------------------------------------

--
-- Table structure for table `banlisthistory`
--

CREATE TABLE `banlisthistory` (
  `id` int(11) NOT NULL,
  `identifier` varchar(25) COLLATE utf8mb4_bin NOT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `liveid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `xblid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `discord` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `playerip` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `targetplayername` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `sourceplayername` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `timeat` int(11) NOT NULL,
  `added` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `expiration` int(11) NOT NULL,
  `permanent` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `banlisthistory`
--

INSERT INTO `banlisthistory` (`id`, `identifier`, `license`, `liveid`, `xblid`, `discord`, `playerip`, `targetplayername`, `sourceplayername`, `reason`, `timeat`, `added`, `expiration`, `permanent`) VALUES
(1639, 'steam:110000148d11f2a', 'license:3edef7588d15d1c5d057e98ffb1526fd6bd36d7f', 'live:1055518796066500', 'xbl:2535448325363145', 'no info', 'ip:94.60.192.143', 'Kian_Behrouzian', 'BiG ADLER', 'Server Under Developming Ast Baad az Run Shodan Asli UnBan Mishavid', 1624472809, 'Wed Jun 23 22:56:49 2021', 1624472809, 1);

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `sender` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `target_type` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `target` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `blackmarket`
--

CREATE TABLE `blackmarket` (
  `id` int(11) NOT NULL,
  `store` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `item` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `blackmarket`
--

INSERT INTO `blackmarket` (`id`, `store`, `item`, `price`) VALUES
(5, 'blackmarket', 'drillsharji', 20000),
(6, 'blackmarket', 'drill', 75000),
(7, 'blackmarket', 'blowtorch', 30000),
(9, 'blackmarket', 'silencer', 50000),
(10, 'blackmarket', 'grip', 20000),
(11, 'blackmarket', 'flashlight', 10000),
(12, 'blackmarket', 'tintgold', 50000),
(13, 'blackmarket', 'c4_bank', 50000),
(14, 'blackmarket', 'rasperry', 50000),
(15, 'blackmarket', 'clip', 2000),
(16, 'blackmarket', 'tintgreen', 50000),
(17, 'blackmarket', 'tintpink', 50000),
(18, 'blackmarket', 'tintcream', 50000),
(19, 'blackmarket', 'tintblack', 50000),
(20, 'blackmarket', 'tintorange', 50000),
(21, 'blackmarket', 'tintplat', 50000),
(22, 'blackmarket', 'eclip', 20000),
(23, 'blackmarket', 'dclip', 250000);

-- --------------------------------------------------------

--
-- Table structure for table `bolos_list`
--

CREATE TABLE `bolos_list` (
  `id` int(11) NOT NULL,
  `json_data` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `capture`
--

CREATE TABLE `capture` (
  `name` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `reward` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `coordinate` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `handeler` varchar(255) COLLATE utf8_persian_ci NOT NULL DEFAULT 'Daltons'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `capture`
--

INSERT INTO `capture` (`name`, `reward`, `coordinate`, `handeler`) VALUES
('black_market', 'blackmarket:ChangeHandeler', '{\"x\":2381.35,\"y\":3064.27,\"z\":47.17}', 'NoT'),
('drug', 'drug:ChangeHandeler', '{\"x\":-584.6,\"y\":-1606.12,\"z\":26.01}', 'NoT'),
('fuel', 'fuel:ChangeHandeler', '{\"x\":-431.29,\"y\":-2633.21,\"z\":9.82}', 'NoT');

-- --------------------------------------------------------

--
-- Table structure for table `cardealer_vehicles`
--

CREATE TABLE `cardealer_vehicles` (
  `id` int(11) NOT NULL,
  `vehicle` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `car_parking`
--

CREATE TABLE `car_parking` (
  `id` int(10) NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` bigint(20) NOT NULL,
  `parking` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `car_parking`
--

INSERT INTO `car_parking` (`id`, `owner`, `plate`, `data`, `time`, `parking`) VALUES
(48, 'steam:110000107cde97e', '21UAI629', '{\"props\":{\"tyreSmokeColor\":[255,255,255],\"modPlateHolder\":-1,\"modLivery\":-1,\"modHydrolic\":-1,\"windowTint\":-1,\"dirtLevel\":7.3745365142822,\"modTank\":-1,\"health\":949,\"plate\":\"21UAI629\",\"modOrnaments\":-1,\"modAirFilter\":-1,\"neonEnabled\":[false,false,false,false],\"modArchCover\":-1,\"pearlescentColor\":12,\"modTrimA\":-1,\"modDashboard\":-1,\"modBrakes\":-1,\"modSideSkirt\":-1,\"modAerials\":-1,\"modFrontWheels\":-1,\"modDoorSpeaker\":-1,\"modSuspension\":-1,\"modRearBumper\":-1,\"modArmor\":-1,\"modVanityPlate\":-1,\"modExhaust\":-1,\"modFrontBumper\":-1,\"plateIndex\":1,\"modTurbo\":false,\"modHood\":-1,\"modTrimB\":-1,\"modWindows\":-1,\"color2\":12,\"modAPlate\":-1,\"modSpoilers\":-1,\"modRoof\":-1,\"wheels\":3,\"modFender\":-1,\"wheelColor\":0,\"modBackWheels\":-1,\"modTransmission\":-1,\"color1\":12,\"modStruts\":-1,\"model\":-1168952148,\"modXenon\":false,\"modEngine\":1,\"modTrunk\":-1,\"modShifterLeavers\":-1,\"modSpeakers\":-1,\"modRightFender\":-1,\"modSmokeEnabled\":1,\"modSeats\":-1,\"modEngineBlock\":-1,\"modSteeringWheel\":-1,\"modHorns\":-1,\"modGrille\":-1,\"modDial\":-1,\"modFrame\":-1,\"neonColor\":[255,0,255]},\"parking\":\"parking1\",\"livery\":-1,\"location\":{\"z\":30.576961517334,\"h\":68.292503356934,\"x\":-282.50051879883,\"y\":-915.24572753906}}', 1584633223, 'parking1');

-- --------------------------------------------------------

--
-- Table structure for table `code`
--

CREATE TABLE `code` (
  `id` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `streamer` int(11) NOT NULL DEFAULT 0,
  `bank` int(11) NOT NULL DEFAULT 0,
  `money` int(11) NOT NULL DEFAULT 0,
  `usecount` int(11) NOT NULL DEFAULT 1,
  `used` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `code`
--

INSERT INTO `code` (`id`, `code`, `streamer`, `bank`, `money`, `usecount`, `used`) VALUES
(3, 'kutie', 1, 250000, 0, 982, 0),
(4, 'pink', 1, 250000, 0, 990, 0),
(5, 'pedar', 1, 250000, 0, 1000, 0),
(6, 'comix', 1, 300000, 0, 975, 0),
(7, 'amberat', 1, 300000, 0, 992, 0),
(8, 'speedx', 1, 250000, 0, 997, 0);

-- --------------------------------------------------------

--
-- Table structure for table `datastore`
--

CREATE TABLE `datastore` (
  `name` varchar(60) COLLATE utf8_persian_ci NOT NULL,
  `label` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `datastore`
--

INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('gang_amberat', 'gang', 1),
('gang_big', 'gang', 1),
('gang_blue', 'gang', 1),
('gang_cartel', 'gang', 1),
('gang_comix', 'gang', 1),
('gang_cyber', 'gang', 1),
('gang_gameover', 'gang', 1),
('gang_grovestreet', 'gang', 1),
('gang_pangoolan', 'gang', 1),
('gang_peakyblinders', 'gang', 1),
('gang_pink', 'gang', 1),
('gang_raiders', 'gang', 1),
('gang_saaax', 'gang', 1),
('gang_sheikh', 'gang', 1),
('gang_venom', 'gang', 1),
('gang_vonip', 'gang', 1),
('property', 'Property', 0),
('society_ambulance', 'Ambulance', 1),
('society_cafeshop', 'cafeshop', 1),
('society_cia', 'cia', 1),
('society_coffee', 'coffee', 1),
('society_jobfinder', 'jobfinder', 1),
('society_mechanic', 'Mechanic', 1),
('society_nightclub', 'nightclub', 1),
('society_police', 'Police', 1),
('society_taxi', 'Taxi', 1),
('society_weazel', 'weazel', 1),
('user_ears', 'Ears', 0),
('user_glasses', 'Glasses', 0),
('user_helmet', 'Helmet', 0),
('user_mask', 'Mask', 0);

-- --------------------------------------------------------

--
-- Table structure for table `datastore_data`
--

CREATE TABLE `datastore_data` (
  `id` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8_persian_ci NOT NULL,
  `owner` varchar(60) COLLATE utf8_persian_ci DEFAULT NULL,
  `data` longtext COLLATE utf8_persian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `datastore_data`
--

INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
(1, 'society_mechanic', NULL, '{}'),
(30020, 'society_ambulance', NULL, '{}'),
(30022, 'society_casino', NULL, '{}'),
(30023, 'society_cfviona', NULL, '{}'),
(30024, 'society_fbi', NULL, '{}'),
(30025, 'society_journaliste', NULL, '{}'),
(30026, 'society_justice', NULL, '{}'),
(30027, 'society_police', NULL, '{\"weapons\":[{\"count\":306,\"name\":\"WEAPON_PUMPSHOTGUN\"},{\"count\":424,\"name\":\"WEAPON_NIGHTSTICK\"},{\"count\":252,\"name\":\"WEAPON_STUNGUN\"},{\"count\":238,\"name\":\"WEAPON_FLASHLIGHT\"},{\"count\":280,\"name\":\"WEAPON_PISTOL\"},{\"count\":291,\"name\":\"WEAPON_SNSPISTOL\"},{\"count\":213,\"name\":\"WEAPON_COMBATPISTOL\"},{\"count\":223,\"name\":\"WEAPON_HEAVYPISTOL\"},{\"count\":338,\"name\":\"WEAPON_SMG\"},{\"count\":251,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":334,\"name\":\"WEAPON_MICROSMG\"},{\"count\":312,\"name\":\"WEAPON_ADVANCEDRIFLE\"},{\"count\":68,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"count\":12,\"name\":\"WEAPON_PETROLCAN\"},{\"count\":129,\"name\":\"weapon_doubleaction\"},{\"count\":6,\"name\":\"WEAPON_BAT\"},{\"count\":11,\"name\":\"WEAPON_DOUBLEACTION\"},{\"count\":0,\"name\":\"WEAPON_PISTOL50\"}]}'),
(30028, 'society_sheriff', NULL, '{}'),
(30029, 'society_swatt', NULL, '{}'),
(30030, 'society_taxi', NULL, '{}'),
(35847, 'society_mechanic', NULL, '{}'),
(40230, 'society_weazel', NULL, '{}'),
(47561, 'society_coffee', NULL, '{}'),
(49375, 'society_cafeshop', NULL, '{}'),
(49376, 'society_jobfinder', NULL, '{}'),
(49377, 'society_nightclub', NULL, '{}'),
(50355, 'gang_saaax', NULL, '{\"weapons\":[{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"}]}'),
(50551, 'gang_vonip', NULL, '{\"weapons\":[{\"name\":\"weapon_COMBATPISTOL\",\"ammo\":250},{\"name\":\"weapon_COMBATPISTOL\",\"ammo\":250},{\"name\":\"WEAPON_COMBATPISTOL\",\"ammo\":250},{\"name\":\"weapon_COMBATPISTOL\",\"ammo\":250},{\"name\":\"WEAPON_COMBATPISTOL\",\"ammo\":250},{\"name\":\"weapon_COMBATPISTOL\",\"ammo\":250},{\"name\":\"WEAPON_COMBATPISTOL\",\"ammo\":250},{\"name\":\"WEAPON_COMBATPISTOL\",\"ammo\":0},{\"name\":\"WEAPON_HEAVYPISTOL\",\"ammo\":0}]}'),
(50794, 'gang_cartel', NULL, '{\"weapons\":[{\"ammo\":248,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":183,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":246,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":220,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":227,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":169,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":68,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":96,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":102,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":220,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":140,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":0,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":206,\"name\":\"WEAPON_ASSAULTRIFLE\"}]}'),
(50981, 'gang_blue', NULL, '{\"weapons\":[{\"name\":\"WEAPON_COMBATPISTOL\",\"ammo\":250},{\"name\":\"weapon_COMBATPISTOL\",\"ammo\":250},{\"name\":\"WEAPON_COMBATPISTOL\",\"ammo\":250},{\"name\":\"WEAPON_COMBATPISTOL\",\"ammo\":250},{\"name\":\"WEAPON_COMBATPISTOL\",\"ammo\":250},{\"name\":\"WEAPON_ASSAULTRIFLE\",\"ammo\":64},{\"name\":\"WEAPON_PETROLCAN\",\"ammo\":4500}]}'),
(51052, 'gang_gameover', NULL, '[]'),
(51063, 'gang_pink', NULL, '{\"weapons\":[{\"ammo\":245,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"weapon_HEAVYPISTOL\"},{\"ammo\":250,\"name\":\"weapon_HEAVYPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_HEAVYPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_HEAVYPISTOL\"},{\"ammo\":247,\"name\":\"WEAPON_HEAVYPISTOL\"}]}'),
(51134, 'gang_peakyblinders', NULL, '[]'),
(51190, 'gang_pangoolan', NULL, '{\"weapons\":[{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"}]}'),
(51506, 'gang_comix', NULL, '{\"weapons\":[{\"name\":\"weapon_ASSAULTRIFLE\",\"ammo\":250},{\"name\":\"WEAPON_ASSAULTRIFLE\",\"ammo\":250},{\"name\":\"WEAPON_ASSAULTRIFLE\",\"ammo\":250},{\"name\":\"WEAPON_ASSAULTRIFLE\",\"ammo\":250},{\"name\":\"WEAPON_ASSAULTRIFLE\",\"ammo\":250},{\"name\":\"WEAPON_PISTOL\",\"ammo\":250},{\"name\":\"WEAPON_PISTOL\",\"ammo\":250},{\"name\":\"WEAPON_PISTOL\",\"ammo\":250},{\"name\":\"WEAPON_PISTOL\",\"ammo\":250},{\"name\":\"WEAPON_PISTOL\",\"ammo\":250},{\"name\":\"WEAPON_PISTOL\",\"ammo\":250},{\"name\":\"WEAPON_PISTOL\",\"ammo\":250},{\"name\":\"WEAPON_PISTOL\",\"ammo\":250},{\"name\":\"WEAPON_PISTOL\",\"ammo\":250},{\"name\":\"weapon_PISTOL\",\"ammo\":250},{\"name\":\"WEAPON_HEAVYPISTOL\",\"ammo\":250},{\"name\":\"WEAPON_HEAVYPISTOL\",\"ammo\":250},{\"name\":\"weapon_HEAVYPISTOL\",\"ammo\":250},{\"name\":\"WEAPON_HEAVYPISTOL\",\"ammo\":250},{\"name\":\"weapon_HEAVYPISTOL\",\"ammo\":250},{\"name\":\"WEAPON_HEAVYPISTOL\",\"ammo\":250},{\"name\":\"WEAPON_HEAVYPISTOL\",\"ammo\":250},{\"name\":\"WEAPON_HEAVYPISTOL\",\"ammo\":250}]}'),
(51552, 'gang_amberat', NULL, '{\"weapons\":[{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_PISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_PISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_PISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_PISTOL\"},{\"ammo\":250,\"name\":\"weapon_PISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_PISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_PISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_PISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_PISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_PISTOL\"},{\"ammo\":250,\"name\":\"weapon_PISTOL\"},{\"ammo\":250,\"name\":\"weapon_PISTOL\"},{\"ammo\":250,\"name\":\"weapon_PISTOL\"},{\"ammo\":204,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":127,\"name\":\"WEAPON_ASSAULTRIFLE\"}]}'),
(51613, 'gang_big', NULL, '{\"weapons\":[{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"weapon_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"weapon_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"weapon_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"weapon_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"weapon_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"weapon_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_COMBATPISTOL\"}]}'),
(51649, 'gang_venom', NULL, '{\"weapons\":[{\"name\":\"WEAPON_PISTOL\",\"ammo\":250},{\"name\":\"WEAPON_PISTOL\",\"ammo\":250},{\"name\":\"WEAPON_PISTOL\",\"ammo\":250},{\"name\":\"WEAPON_PISTOL\",\"ammo\":250},{\"name\":\"WEAPON_PISTOL\",\"ammo\":250},{\"name\":\"WEAPON_PISTOL\",\"ammo\":250},{\"name\":\"WEAPON_PISTOL\",\"ammo\":250},{\"name\":\"weapon_PISTOL\",\"ammo\":250},{\"name\":\"WEAPON_PISTOL\",\"ammo\":250},{\"name\":\"WEAPON_PISTOL\",\"ammo\":250},{\"name\":\"WEAPON_PISTOL\",\"ammo\":250},{\"name\":\"WEAPON_COMBATPISTOL\",\"ammo\":0},{\"name\":\"WEAPON_COMBATPISTOL\",\"ammo\":0},{\"name\":\"WEAPON_PISTOL\",\"ammo\":229},{\"name\":\"WEAPON_PISTOL\",\"ammo\":250},{\"name\":\"WEAPON_COMBATPISTOL\",\"ammo\":0},{\"name\":\"WEAPON_COMBATPISTOL\",\"ammo\":236},{\"name\":\"weapon_COMBATPISTOL\",\"ammo\":250},{\"name\":\"WEAPON_PISTOL\",\"ammo\":250},{\"name\":\"WEAPON_COMBATPISTOL\",\"ammo\":250},{\"name\":\"WEAPON_ASSAULTRIFLE\",\"ammo\":245}]}'),
(52090, 'gang_cyber', NULL, '{\"weapons\":[{\"ammo\":250,\"name\":\"WEAPON_PISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_PISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_PISTOL\"},{\"ammo\":38,\"name\":\"WEAPON_PISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_PISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_PISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_PISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_PISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"weapon_ASSAULTRIFLE\"},{\"ammo\":206,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":246,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":222,\"name\":\"WEAPON_PISTOL\"},{\"ammo\":220,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"ammo\":250,\"name\":\"WEAPON_PISTOL\"},{\"ammo\":0,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":0,\"name\":\"WEAPON_PISTOL\"}]}'),
(52146, 'gang_raiders', NULL, '{\"weapons\":[{\"ammo\":42,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":0,\"name\":\"WEAPON_PISTOL\"},{\"ammo\":0,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":84,\"name\":\"WEAPON_HEAVYPISTOL\"},{\"ammo\":0,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_PISTOL\"},{\"ammo\":0,\"name\":\"WEAPON_HEAVYPISTOL\"},{\"ammo\":0,\"name\":\"WEAPON_PISTOL\"},{\"ammo\":0,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_HEAVYPISTOL\"},{\"ammo\":0,\"name\":\"WEAPON_PISTOL\"},{\"ammo\":0,\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":4500,\"name\":\"WEAPON_PETROLCAN\"},{\"ammo\":27,\"name\":\"WEAPON_HEAVYPISTOL\"}]}'),
(52277, 'gang_sheikh', NULL, '{\"weapons\":[{\"ammo\":250,\"name\":\"WEAPON_PISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_PISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_PISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_PISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_PISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_PISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_PISTOL\"},{\"ammo\":250,\"name\":\"weapon_PISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_PISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_PISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_PISTOL\"},{\"ammo\":250,\"name\":\"WEAPON_PISTOL\"}]}'),
(52393, 'society_cia', NULL, '{\"weapons\":[{\"count\":0,\"name\":\"WEAPON_PUMPSHOTGUN\"},{\"count\":0,\"name\":\"WEAPON_PISTOL\"},{\"count\":139,\"name\":\"WEAPON_NIGHTSTICK\"},{\"count\":0,\"name\":\"WEAPON_PISTOL50\"},{\"count\":3,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"name\":\"WEAPON_STUNGUN\"},{\"count\":59,\"name\":\"WEAPON_ADVANCEDRIFLE\"},{\"count\":20,\"name\":\"WEAPON_SNSPISTOL\"},{\"count\":18,\"name\":\"WEAPON_HEAVYPISTOL\"},{\"count\":8,\"name\":\"weapon_microsmg\"},{\"count\":6,\"name\":\"weapon_specialcarbine\"},{\"count\":3,\"name\":\"WEAPON_COMBATPISTOL\"},{\"count\":2,\"name\":\"weapon_pistol\"},{\"count\":0,\"name\":\"weapon_bzgas\"},{\"count\":9,\"name\":\"weapon_combatpdw\"},{\"count\":1,\"name\":\"WEAPON_APPISTOL\"}]}'),
(52404, 'gang_grovestreet', NULL, '[]'),
(52405, 'gang_grovestreet', NULL, '[]'),
(52406, 'gang_grovestreet', NULL, '[]'),
(52417, 'user_mask', 'steam:110000145d1e773', '{}'),
(52418, 'user_helmet', 'steam:110000145d1e773', '{}'),
(52419, 'user_ears', 'steam:110000145d1e773', '{}'),
(52420, 'property', 'steam:110000145d1e773', '{}'),
(52421, 'user_glasses', 'steam:110000145d1e773', '{}'),
(52422, 'property', 'steam:110000148adfa01', '{}'),
(52423, 'user_helmet', 'steam:110000148adfa01', '{}'),
(52424, 'user_glasses', 'steam:110000148adfa01', '{}'),
(52425, 'user_ears', 'steam:110000148adfa01', '{}'),
(52426, 'user_mask', 'steam:110000148adfa01', '{\"skin\":{\"mask_2\":5,\"mask_1\":51},\"hasMask\":true}'),
(52427, 'user_ears', 'steam:1100001402db7a7', '{}'),
(52428, 'user_glasses', 'steam:1100001402db7a7', '{}'),
(52429, 'user_helmet', 'steam:1100001402db7a7', '{}'),
(52430, 'user_mask', 'steam:1100001402db7a7', '{}'),
(52431, 'property', 'steam:1100001402db7a7', '{}'),
(52432, 'user_glasses', 'steam:11000013d0262b2', '{}'),
(52433, 'user_mask', 'steam:11000013d0262b2', '{}'),
(52434, 'user_ears', 'steam:11000013d0262b2', '{}'),
(52435, 'property', 'steam:11000013d0262b2', '{}'),
(52436, 'user_helmet', 'steam:11000013d0262b2', '{}'),
(52437, 'user_mask', 'steam:110000148d11f2a', '{}'),
(52438, 'user_helmet', 'steam:110000148d11f2a', '{}'),
(52439, 'user_glasses', 'steam:110000148d11f2a', '{}'),
(52440, 'user_ears', 'steam:110000148d11f2a', '{}'),
(52441, 'property', 'steam:110000148d11f2a', '{}'),
(52442, 'user_mask', 'steam:11000013b37558e', '{}'),
(52443, 'user_helmet', 'steam:11000013b37558e', '{}'),
(52444, 'user_glasses', 'steam:11000013b37558e', '{}'),
(52445, 'user_ears', 'steam:11000013b37558e', '{}'),
(52446, 'property', 'steam:11000013b37558e', '{}'),
(52447, 'user_ears', 'steam:11000014534dc5b', '{}'),
(52448, 'user_glasses', 'steam:11000014534dc5b', '{}'),
(52449, 'user_mask', 'steam:11000014534dc5b', '{}'),
(52450, 'property', 'steam:11000014534dc5b', '{}'),
(52451, 'user_helmet', 'steam:11000014534dc5b', '{}'),
(52452, 'user_ears', 'steam:1100001410e55b4', '{}'),
(52453, 'user_glasses', 'steam:1100001410e55b4', '{}'),
(52454, 'user_helmet', 'steam:1100001410e55b4', '{}'),
(52455, 'user_mask', 'steam:1100001410e55b4', '{}'),
(52456, 'property', 'steam:1100001410e55b4', '{}'),
(52457, 'property', 'steam:1100001166ec0e6', '{}'),
(52458, 'user_ears', 'steam:1100001166ec0e6', '{}'),
(52459, 'user_glasses', 'steam:1100001166ec0e6', '{}'),
(52460, 'user_helmet', 'steam:1100001166ec0e6', '{}'),
(52461, 'user_mask', 'steam:1100001166ec0e6', '{}');

-- --------------------------------------------------------

--
-- Table structure for table `denied`
--

CREATE TABLE `denied` (
  `id` int(30) NOT NULL,
  `steamid` varchar(20) DEFAULT NULL,
  `hardwareid` varchar(50) DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `icname` varchar(30) DEFAULT NULL,
  `timestamp` int(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `owner` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `divisions`
--

INSERT INTO `divisions` (`owner`, `name`, `label`) VALUES
('steam:11000011d4c6d8f', 'swat', 'swat'),
('steam:11000011d4c6d8f', 'hr', 'hr');

-- --------------------------------------------------------

--
-- Table structure for table `division_grades`
--

CREATE TABLE `division_grades` (
  `id` int(11) NOT NULL,
  `division_owner` varchar(50) NOT NULL,
  `division` varchar(50) NOT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `division_grades`
--

INSERT INTO `division_grades` (`id`, `division_owner`, `division`, `grade`, `name`, `label`) VALUES
(1, 'steam:11000011d4c6d8f', 'swat', 0, 'kosekhar', 'kosekhar'),
(2, 'steam:11000011d4c6d8f', 'hr', 0, 'koskesh', 'koskesh');

-- --------------------------------------------------------

--
-- Table structure for table `dpkeybinds`
--

CREATE TABLE `dpkeybinds` (
  `id` varchar(50) DEFAULT NULL,
  `keybind1` varchar(50) DEFAULT 'num4',
  `emote1` varchar(255) DEFAULT '',
  `keybind2` varchar(50) DEFAULT 'num5',
  `emote2` varchar(255) DEFAULT '',
  `keybind3` varchar(50) DEFAULT 'num6',
  `emote3` varchar(255) DEFAULT '',
  `keybind4` varchar(50) DEFAULT 'num7',
  `emote4` varchar(255) DEFAULT '',
  `keybind5` varchar(50) DEFAULT 'num8',
  `emote5` varchar(255) DEFAULT '',
  `keybind6` varchar(50) DEFAULT 'num9',
  `emote6` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dpkeybinds`
--

INSERT INTO `dpkeybinds` (`id`, `keybind1`, `emote1`, `keybind2`, `emote2`, `keybind3`, `emote3`, `keybind4`, `emote4`, `keybind5`, `emote5`, `keybind6`, `emote6`) VALUES
(NULL, 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
('steam:110000145d1e773', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
('steam:110000148adfa01', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
('steam:1100001402db7a7', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
('steam:11000013d0262b2', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
('steam:110000148d11f2a', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
('steam:11000013b37558e', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
('steam:11000014534dc5b', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
('steam:1100001410e55b4', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
('steam:1100001166ec0e6', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', '');

-- --------------------------------------------------------

--
-- Table structure for table `fines`
--

CREATE TABLE `fines` (
  `id` int(100) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `fineamount` int(100) NOT NULL,
  `reason` varchar(50) NOT NULL,
  `punisher` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fines`
--

INSERT INTO `fines` (`id`, `identifier`, `name`, `fineamount`, `reason`, `punisher`) VALUES
(1, 'steam:11000013e71bf01', 'BLADE WORRIED', 150000, 'ooc insult', 'MMD YAKUZA'),
(2, 'steam:110000141ce9f45', 'HARU', 1, 'test', 'MMD YAKUZA'),
(3, 'steam:110000135f94724', 'ZUIXX', 1, 'test', 'ZUIXX');

-- --------------------------------------------------------

--
-- Table structure for table `fine_types`
--

CREATE TABLE `fine_types` (
  `id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8_persian_ci DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fine_types`
--

INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Aloodegi soti', 2000, 0),
(2, 'Oboor az cheraghe ghermez', 5000, 0),
(3, 'Vorood mamnoo', 5000, 0),
(4, 'Dor zadan gheyr e mojaz', 4000, 0),
(5, 'Ranandegi dar line mokhalef', 5000, 0),
(6, 'Ranandegi khatarnak', 7000, 0),
(7, 'Tavaghof mamnoo', 2000, 0),
(8, 'Park e bad', 3000, 0),
(9, 'Adam tavajoh be hagh e taghadom', 2000, 0),
(10, 'Adam tavajo be fasele tooli', 1000, 0),
(11, 'Adam tavajoh be tavaghof', 5000, 0),
(12, 'Adam e tavajoh be alayeme ranandegi', 4000, 0),
(13, 'Harakat e khatarnak', 7000, 0),
(14, 'tajavoz be harime khososi', 6000, 0),
(15, 'Ranandegi bedoone govahinam', 7000, 0),
(16, 'Zadan o dar raftan', 7000, 0),
(17, 'Sorat e kamtar az 60Km/h', 2000, 0),
(18, 'Soraat mojaz 60Km/h', 2000, 0),
(19, 'Soraat mojaz 80Km/h', 4000, 0),
(20, 'Soraat mojaz 120Km/h', 6000, 0),
(21, 'Ijad e traffic', 2500, 1),
(22, 'Bastan e khiyaboon', 7000, 1),
(23, 'Beham rikhtan e nazm ', 4500, 1),
(24, 'Bi tavajohi be ekhtar e police', 8000, 1),
(25, 'Bi ehterami', 3000, 1),
(26, 'Tohin be mamoor e police', 5000, 1),
(27, 'Tahdid shahrvandan', 9500, 1),
(28, 'Tahdid Police', 12000, 1),
(29, 'Eteraz be ghanoon', 3000, 1),
(30, 'Ijad e fesad', 15000, 1),
(31, 'Estefade az selahe sard dar shahr', 4000, 2),
(32, 'Estefade az selahe garm dar shahr', 8000, 2),
(33, 'Hamle aslahe bedoon e mojavez', 15000, 2),
(34, 'Dashtan e aslahe gheyre mojaz', 55000, 2),
(35, 'hamkari nakardan ba mamore ghanon', 25000, 2),
(36, 'Dozdi khodro', 50000, 2),
(37, 'Foroosh e mavad e mokhader', 20000, 2),
(38, 'Tolid e mavad e mokhader', 35000, 2),
(39, 'Dashtan e mavad e mokhader', 25000, 2),
(40, 'Majrooh kardan shahrvand', 35000, 2),
(41, 'Majrooh kardan e mamoor e ghanoon', 50000, 2),
(42, 'Dozdi', 15000, 2),
(43, 'Dozdi az maghaze', 50000, 2),
(44, 'Dozdi az bank', 100000, 2),
(45, 'Shelik be shahrvandan', 40000, 3),
(46, 'Shelik be samte mamoor e ghanoon', 75000, 3),
(47, 'Eghdam be ghatle shahrvand', 50000, 3),
(48, 'Eghdam be ghatle mamoor e ghanoon', 100000, 3),
(49, 'Koshtan e shahrvand', 75000, 3),
(50, 'Koshtan e mamoor e ghanoon', 125000, 3),
(51, 'Ghatl e gheyre amd', 50000, 3),
(52, 'Kolah bardari kari', 25000, 2),
(53, 'Mojavez Aslahe', 60000, 1),
(54, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gangs`
--

CREATE TABLE `gangs` (
  `name` varchar(254) COLLATE utf8_persian_ci DEFAULT NULL,
  `label` varchar(254) COLLATE utf8_persian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `gangs`
--

INSERT INTO `gangs` (`name`, `label`) VALUES
('nogang', 'nogang');

-- --------------------------------------------------------

--
-- Table structure for table `gangs_data`
--

CREATE TABLE `gangs_data` (
  `ID` int(11) NOT NULL,
  `gang_name` varchar(254) COLLATE utf8_persian_ci DEFAULT NULL,
  `blip` varchar(254) COLLATE utf8_persian_ci DEFAULT NULL,
  `armory` varchar(254) COLLATE utf8_persian_ci DEFAULT NULL,
  `locker` varchar(254) COLLATE utf8_persian_ci DEFAULT NULL,
  `boss` varchar(254) COLLATE utf8_persian_ci DEFAULT NULL,
  `vehicles` longtext COLLATE utf8_persian_ci DEFAULT NULL,
  `veh` varchar(254) COLLATE utf8_persian_ci DEFAULT NULL,
  `vehprop` varchar(254) COLLATE utf8_persian_ci DEFAULT NULL,
  `vehdel` varchar(254) COLLATE utf8_persian_ci DEFAULT NULL,
  `vehspawn` varchar(254) COLLATE utf8_persian_ci DEFAULT NULL,
  `register_time` date DEFAULT NULL,
  `expire_time` date DEFAULT NULL,
  `search` tinyint(4) DEFAULT NULL,
  `bulletproof` int(100) DEFAULT 0,
  `webhook` varchar(255) COLLATE utf8_persian_ci DEFAULT NULL,
  `slot` int(255) DEFAULT 10,
  `logpower` int(11) DEFAULT 0,
  `armoryperm` int(11) DEFAULT 6,
  `icon` varchar(255) COLLATE utf8_persian_ci DEFAULT 'http://uupload.ir/files/1j24_gang.png',
  `invperm` int(11) DEFAULT 6,
  `gangsblip` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `gang_account`
--

CREATE TABLE `gang_account` (
  `name` varchar(254) COLLATE utf8_persian_ci DEFAULT NULL,
  `label` varchar(254) COLLATE utf8_persian_ci DEFAULT NULL,
  `shared` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `gang_account_data`
--

CREATE TABLE `gang_account_data` (
  `ID` int(11) NOT NULL,
  `gang_name` varchar(254) COLLATE utf8_persian_ci DEFAULT NULL,
  `money` double DEFAULT NULL,
  `pay` int(11) DEFAULT NULL,
  `owner` varchar(254) COLLATE utf8_persian_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_persian_ci DEFAULT NULL,
  `armoryaccess` int(64) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `gang_grades`
--

CREATE TABLE `gang_grades` (
  `ID` int(11) NOT NULL,
  `gang_name` varchar(254) COLLATE utf8_persian_ci DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `name` varchar(254) COLLATE utf8_persian_ci DEFAULT NULL,
  `label` varchar(254) COLLATE utf8_persian_ci DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `skin_male` longtext COLLATE utf8_persian_ci DEFAULT NULL,
  `skin_female` longtext COLLATE utf8_persian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `gang_grades`
--

INSERT INTO `gang_grades` (`ID`, `gang_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'nogang', 0, 'nogang', 'noGang', 0, '[]', '[]');

-- --------------------------------------------------------

--
-- Table structure for table `gas_station_balance`
--

CREATE TABLE `gas_station_balance` (
  `id` int(10) UNSIGNED NOT NULL,
  `gas_station_id` varchar(50) NOT NULL,
  `income` bit(1) NOT NULL,
  `title` varchar(255) NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `date` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gas_station_business`
--

CREATE TABLE `gas_station_business` (
  `gas_station_id` varchar(50) NOT NULL DEFAULT '',
  `user_id` varchar(50) NOT NULL,
  `stock` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `price` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `stock_upgrade` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `truck_upgrade` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `relationship_upgrade` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `money` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_money_earned` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_money_spent` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gas_bought` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gas_sold` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `distance_traveled` double UNSIGNED NOT NULL DEFAULT 0,
  `total_visits` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `customers` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `timer` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gas_station_jobs`
--

CREATE TABLE `gas_station_jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `gas_station_id` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL,
  `reward` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` int(11) NOT NULL DEFAULT 0,
  `progress` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `granted`
--

CREATE TABLE `granted` (
  `id` int(20) NOT NULL,
  `steamid` varchar(30) DEFAULT NULL,
  `hardwareid` varchar(100) DEFAULT NULL,
  `timestamp` int(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `label` varchar(255) COLLATE utf8_bin NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 0,
  `limit` int(11) NOT NULL DEFAULT -1,
  `rare` int(11) NOT NULL DEFAULT 0,
  `can_remove` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`) VALUES
('bandage', 'Bandage', 0, 15, 0, 1),
('medikit', 'Medikit', 0, 20, 0, 1),
('gazbottle', 'Ghooti gaz', 0, 11, 0, 1),
('fixtool', 'Abzar e tamir', 0, 6, 0, 1),
('carotool', 'Abzar e badane', 0, 4, 0, 1),
('blowpipe', 'Mash`al', 0, 10, 0, 1),
('fixkit', 'Kit Tamir', 0, 5, 0, 1),
('bread', 'Noon', 0, 10, 0, 1),
('water', 'Ab', 0, 5, 0, 1),
('cannabis', 'Shahdane', 0, 50, 0, 1),
('marijuana', 'Marijuana', 0, 250, 0, 1),
('meth', 'Shishe', 0, 25, 0, 1),
('beer', 'Abjo', 0, 5, 0, 1),
('gps', 'GPS', 0, 2, 0, 1),
('cocacola', 'Coca Cola', 0, 10, 0, 1),
('fanta', 'Fanta', 0, 10, 0, 1),
('sprite', 'Sprite', 0, 10, 0, 1),
('loka', 'Abmive', 0, -1, 0, 1),
('chips', 'Chips', 0, 10, 0, 1),
('marabou', 'Shokolat', 0, 10, 0, 1),
('macka', 'Sandwitch', 0, 5, 0, 1),
('cigarette', 'Cigar', 0, 10, 0, 1),
('lighter', 'Fandak', 0, 1, 0, 1),
('creditcard', 'Cart Banki', 0, 1, 0, 1),
('alive_chicken', 'Morgh zende', 0, 20, 0, 1),
('slaughtered_chicken', 'Morgh', 0, 20, 0, 1),
('packaged_chicken', 'Morgh baste bandi shode', 0, 100, 0, 1),
('fish', 'Mahi', 0, 100, 0, 1),
('stone', 'Sang', 0, 100, 0, 1),
('washed_stone', 'Sange boresh khorde', 0, 7, 0, 1),
('copper', 'Mes', 0, 56, 0, 1),
('iron', 'Ahan', 0, 42, 0, 1),
('gold', 'Tala', 0, 21, 0, 1),
('diamond', 'Diamant', 0, 50, 0, 1),
('wood', 'Choob', 0, 100, 0, 1),
('cutted_wood', 'Choobe boresh khorde', 0, 100, 0, 1),
('packaged_plank', 'Choobe baste bandi shode', 0, 100, 0, 1),
('petrol', 'Benzin', 0, 24, 0, 1),
('petrol_raffin', 'Rafin', 0, 24, 0, 1),
('essence', 'Asans', 0, 24, 0, 1),
('wool', 'Pashm', 0, 40, 0, 1),
('fabric', 'Parche', 0, 80, 0, 1),
('clothe', 'Lebas', 0, 40, 0, 1),
('phone', 'Goshi', 0, 2, 0, 1),
('blowtorch', 'Blowtorch', 0, 1, 0, 1),
('drill', 'Drill', 0, 1, 0, 1),
('loole', 'Loole', 0, 3, 0, 1),
('fanar', 'Fanar', 0, 3, 0, 1),
('capsul', 'Capsul', 0, 3, 0, 1),
('lockpick', 'Sanjagh', 0, 3, 0, 1),
('drillsharji', 'Drill Sharji', 0, 3, 0, 1),
('mattezakhim', 'Matte Zakhim', 0, 3, 0, 1),
('battrey', 'Battery', 0, 3, 0, 1),
('carokit', 'Kit e badane', 0, 3, 0, 1),
('yusuf', 'Skin Talaee', 0, 1, 0, 1),
('grip', 'Grip', 0, 3, 0, 1),
('flashlight', 'FlashLight', 0, 3, 0, 1),
('silencer', 'Silencer', 0, 3, 0, 1),
('clip', 'Kheshab', 0, 6, 0, 1),
('bag', 'Bag', 0, 1, 0, 1),
('blank_plate', 'Blank License Plate', 0, -1, 0, 1),
('jewels', 'Javaher', 0, -1, 0, 1),
('vodka', 'Vodka', 0, 5, 0, 1),
('whisky', 'Whisky', 0, 5, 0, 1),
('tequila', 'Tequila', 0, 5, 0, 1),
('martini', 'Martini bianco', 0, 5, 0, 1),
('soda', 'Noshabe', 0, 5, 0, 1),
('jusfruit', 'Jus de fruits', 0, 5, 0, 1),
('icetea', 'Ice Tea', 0, 5, 0, 1),
('energy', 'Energy Drink', 0, 5, 0, 1),
('drpepper', 'Dr. Pepper', 0, 5, 0, 1),
('limonade', 'Lemoniada', 0, 5, 0, 1),
('saucisson', 'Kiełbasa', 0, 5, 0, 1),
('golem', 'Golem', 0, 5, 0, 1),
('whiskycoca', 'Whisky-cola', 0, 5, 0, 1),
('vodkaenergy', 'Vodka-energetyk', 0, 5, 0, 1),
('vodkafruit', 'Vodka-sok owocowy', 0, 5, 0, 1),
('teqpaf', 'Teq\'paf', 0, 5, 0, 1),
('mojito', 'Mojito', 0, 5, 0, 1),
('ice', 'Lód', 0, 5, 0, 1),
('anticorona', 'Anti Corona', 0, 1, 0, 1),
('cake', 'Cake', 0, 15, 0, 1),
('donat1', 'Donate Vanili', 0, 15, 0, 1),
('donat2', 'Donate Shokolati', 0, 15, 0, 1),
('donat3', 'Donate Miveie', 0, 15, 0, 1),
('donat4', 'Donate Keremdar', 0, 15, 0, 1),
('donat5', 'Donate Albaloee', 0, 15, 0, 1),
('wine', 'Sharab', 0, 15, 0, 1),
('mushroom', 'Gharch', 0, 250, 0, 1),
('mushroom_d', 'Gharche Vahshi', 0, 250, 0, 1),
('mushroom_p', 'Baste Gharch', 0, 50, 0, 1),
('pork', 'Goshte Khook', 0, 100, 0, 1),
('porkpackage', 'Goshte Khook Bastebandi', 0, 33, 0, 1),
('poteto', 'Sibzamini', 0, 100, 0, 1),
('lay_b', 'Sabad Sibzamini', 0, 11, 0, 1),
('meat_a', 'Goshte Babr', 0, 100, 0, 1),
('leather_a', 'Poste Babr', 0, 100, 0, 1),
('meat_w', 'Goshte Nahang', 0, 50, 0, 1),
('rice', 'Khoshe Berenj', 0, 100, 0, 1),
('rice_pro', 'Kise Berenj', 0, 21, 0, 1),
('sickle', 'Das', 0, 1, 0, 1),
('honey_a', 'Moome Asal', 0, 300, 0, 1),
('honey_b', 'Shishe Asal', 0, 11, 0, 1),
('meat_ahoo', 'Goshte Ahoo', 0, 100, 0, 1),
('leather_ahoo', 'Poste Ahoo', 0, 100, 0, 1),
('leather_w', 'Poste Nahang', 0, 100, 0, 1),
('jerrycan', 'Dabe Benzin', 0, 6, 0, 1),
('joint', 'Joint', 0, -1, 0, 1),
('c4_bank', 'C4 For Bank', 0, 1, 0, 1),
('rasperry', 'Rasperry', 0, 1, 0, 1),
('radio', 'Radio', 0, 2, 0, 1),
('marijuana', 'Marijuana', 0, 250, 0, 1),
('coca', 'Tokhm Kokayin', 0, 150, 0, 1),
('cocaine', 'Kokayin', 0, 50, 0, 1),
('ephedra', 'Ephedra', 0, 100, 0, 1),
('ephedrine', 'Ephedrine', 0, 100, 0, 1),
('poppy', 'KhashKhaash', 0, 25, 0, 1),
('opium', 'Teryak', 0, 50, 0, 1),
('heroine', 'Heroine', 0, 10, 0, 1),
('crack', 'Crack', 0, 25, 0, 1),
('drugtest', 'Test Mavad', 0, 10, 0, 1),
('breathalyzer', 'Test Alchol', 0, 10, 0, 1),
('fakepee', 'Fake Pee', 0, 5, 0, 1),
('pcp', 'PCP', 0, 25, 0, 1),
('dabs', 'Dabs', 0, 50, 0, 1),
('painkiller', 'Painkiller', 0, 10, 0, 1),
('narcan', 'Narcan', 0, 10, 0, 1),
('WEAPON_FLASHLIGHT', 'Flashlight', 1, -1, 0, 1),
('WEAPON_STUNGUN', 'Taser', 100, -1, 1, 1),
('WEAPON_KNIFE', 'Knife', 100, -1, 1, 1),
('WEAPON_BAT', 'Baseball Bat', 1, -1, 0, 1),
('WEAPON_ADVANCEDRIFLE', 'Advanced Rifle', 1, -1, 0, 1),
('WEAPON_ADVANCEDRIFLE_AMMO', 'Advanced Rifle Ammo', 1, -1, 0, 1),
('WEAPON_APPISTOL', 'AP Pistol', 1, -1, 0, 1),
('WEAPON_APPISTOL_AMMO', 'AP Pistol Ammo', 1, -1, 0, 1),
('WEAPON_ASSAULTRIFLE', 'Assault Rifle', 1, -1, 0, 1),
('WEAPON_ASSAULTRIFLE_AMMO', 'Assault Rifle Ammo', 1, -1, 0, 1),
('WEAPON_ASSAULTSHOTGUN', 'Assault Shotgun', 1, -1, 0, 1),
('WEAPON_ASSAULTSHOTGUN_AMMO', 'Assault Shotgun Ammo', 1, -1, 0, 1),
('WEAPON_ASSAULTSMG', 'Assault SMG', 1, -1, 0, 1),
('WEAPON_ASSAULTSMG_AMMO', 'Assault SMG Ammo', 1, -1, 0, 1),
('WEAPON_AUTOSHOTGUN', 'Auto Shotgun', 1, -1, 0, 1),
('WEAPON_AUTOSHOTGUN_AMMO', 'Auto Shotgun Ammo', 1, -1, 0, 1),
('WEAPON_CARBINERIFLE', 'Carbine Rifle', 1, -1, 0, 1),
('WEAPON_CARBINERIFLE_AMMO', 'Carbin Rifle Ammo', 1, -1, 0, 1),
('WEAPON_COMBATPISTOL', 'Combat Pistol', 1, -1, 0, 1),
('WEAPON_COMBATPISTOL_AMMO', 'Combat Pistol Ammo', 1, -1, 0, 1),
('WEAPON_PISTOL', 'Pistol', 1, -1, 0, 1),
('WEAPON_PISTOL_AMMO', '9mm Rounds', 1, -1, 0, 1),
('WEAPON_PUMPSHOTGUN', 'Pump Shotgun', 1, -1, 0, 1),
('WEAPON_PUMPSHOTGUN_AMMO', 'Pump Shotgun Ammo', 1, -1, 0, 1),
('WEAPON_SMG', 'SMG', 1, -1, 0, 1),
('WEAPON_SMG_AMMO', 'Shotgun Shells', 1, -1, 0, 1),
('burger', 'Burger', 0, 5, 0, 1),
('cheesebows', 'Snack', 0, 10, 0, 1),
('coffee', 'Ghahve', 0, 5, 0, 1),
('pizza', 'Pizza', 0, 5, 0, 1),
('tea', 'Chaee', 0, 5, 0, 1),
('donut', 'Donut', 0, 10, 0, 1),
('majoon', 'Majoon', 0, 10, 0, 1),
('eclip', 'Kheshab Ezafe', 0, 5, 0, 1),
('dclip', 'Drum Magazine', 0, 2, 0, 1),
('armor', 'Armor', 0, 2, 0, 1),
('picklock', 'picklock', 0, 3, 0, 1),
('tintgreen', 'Skin Sabz', 0, 1, 0, 1),
('tintgold', 'Skin Gold', 0, 1, 0, 1),
('tintpink', 'Skin Sorati', 0, 1, 0, 1),
('tintcream', 'Skin Cream', 0, 1, 0, 1),
('tintblack', 'Skin Black', 0, 1, 0, 1),
('tintorange', 'Skin Orange', 0, 1, 0, 1),
('tintplat', 'Skin Plat', 0, 1, 0, 1),
('cigar', 'Cigar', 0, 10, 0, 1),
('sandwich', 'Sandwich', 0, 3, 0, 1),
('flashlight', 'Flashlight', 0, 3, 0, 1),
('hifi', 'Hifi', 0, 20, 0, 1),
('nardeban', 'Nardeban', 0, 1, 0, 1),
('raisin', 'Grapes', 0, 100, 0, 1),
('jus_raisin', 'Grape juice', 0, -1, 0, 1),
('grand_cru', 'Vintage Bottle', 0, -1, 0, 1),
('vine', 'Vine', 0, -1, 0, 1),
('battery', 'Car Battery', 2, -1, 0, 1),
('aluminium', 'Scrap Aluminium', 1, 5, 0, 1),
('radio', 'Car Stereo', 3, -1, 0, 1),
('airbag', 'Airbag', 1, -1, 0, 1),
('wheel_rim', 'Wheel Rim', 1, 4, 0, 1),
('plastic', 'Plastic', 2, -1, 0, 1),
('Scrap', 'Scrap Metal', 5, -1, 0, 1),
('electronics', 'Electronics', 4, -1, 0, 1),
('battery', 'Battery', 2, -1, 0, 1),
('muffler', 'Muffler', 2, -1, 0, 1),
('hood', 'Hood', 2, -1, 0, 1),
('trunk', 'Trunk', 2, -1, 0, 1),
('doors', 'Doors', 2, -1, 0, 1),
('engine', 'Engine', 2, -1, 0, 1),
('waterpump', 'Water Pump', 2, -1, 0, 1),
('oilpump', 'Oil Pump', 2, -1, 0, 1),
('speakers', 'Speakers', 6, -1, 0, 1),
('radio', 'Radio', 5, -1, 0, 1),
('rims', 'Rims', 4, -1, 0, 1),
('subwoofer', 'Subwoofer', 3, -1, 0, 1),
('steeringwheel', 'Steering Wheel', 5, -1, 0, 1),
('meat', 'Meat', 0, -1, 0, 1),
('leather', 'Leather', 0, -1, 0, 1),
('headlight', 'Car HeadLight', 0, 1, 0, 1),
('cocacola', 'Coca Cola', 0, -1, 0, 1),
('fanta', 'Fanta', 0, -1, 0, 1),
('sprite', 'Sprite', 0, -1, 0, 1),
('loka', 'Abmive', 0, -1, 0, 1),
('cheesebows', 'Snack', 0, -1, 0, 1),
('chips', 'Chips', 0, -1, 0, 1),
('marabou', 'Shokolat', 0, -1, 0, 1),
('pizza', 'pitza', 0, -1, 0, 1),
('burger', 'Burger', 0, -1, 0, 1),
('pastacarbonara', 'Paste', 0, -1, 0, 1),
('macka', 'Sandwitch', 0, -1, 0, 1),
('cigarett', 'Cigar', 0, -1, 0, 1),
('lighter', 'Fandak', 0, -1, 0, 1),
('lotteryticket', 'Blit Bakht Azmayi', 0, -1, 0, 1),
('cocacola', 'Coca Cola', 0, -1, 0, 1),
('fanta', 'Fanta', 0, -1, 0, 1),
('sprite', 'Sprite', 0, -1, 0, 1),
('loka', 'Abmive', 0, -1, 0, 1),
('cheesebows', 'Snack', 0, -1, 0, 1),
('chips', 'Chips', 0, -1, 0, 1),
('marabou', 'Shokolat', 0, -1, 0, 1),
('pizza', 'pitza', 0, -1, 0, 1),
('burger', 'Burger', 0, -1, 0, 1),
('pastacarbonara', 'Paste', 0, -1, 0, 1),
('macka', 'Sandwitch', 0, -1, 0, 1),
('cigarett', 'Cigar', 0, -1, 0, 1),
('lighter', 'Fandak', 0, -1, 0, 1),
('lotteryticket', 'Blit Bakht Azmayi', 0, -1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `label` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('ambulance', 'Ambulance', 1),
('bus', 'Sherkat Vahed', 1),
('cafeshop', 'Human Resource', 1),
('cia', 'C.I.A', 1),
('coffee', 'Coffee', 1),
('fisherman', 'Mahigir', 1),
('fueler', 'Sherkat naft', 0),
('government', 'Government', 1),
('jobfinder', 'Human Resource', 1),
('lumberjack', 'Choob Bor', 1),
('mechanic', 'Mechanic', 1),
('miner', 'Maadanchi', 0),
('moneytransfer', 'Hamle Pool', 1),
('nightclub', 'Night Club', 1),
('offambulance', 'Off-Duty', 1),
('offcoffee', 'Off-Duty', 1),
('offmechanic', 'Off-Duty', 1),
('offpolice', 'Off-Duty', 1),
('offtaxi', 'Off-Duty', 1),
('police', 'Police', 1),
('slaughterer', 'Ghassab', 0),
('tailor', 'Khayat', 0),
('taxi', 'Taxi', 1),
('unemployed', 'Bikar', 0),
('vigne', 'Mashroub Sazi', 1),
('weazel', 'Weazel News', 1),
('wood', 'Choob Bor', 0);

-- --------------------------------------------------------

--
-- Table structure for table `job_grades`
--

CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL,
  `job_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `label` varchar(255) COLLATE utf8_bin NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext COLLATE utf8_bin NOT NULL,
  `skin_female` longtext COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'unemployed', 0, 'unemployed', 'Unemployed', 1500, '{}', '{}'),
(2, 'mechanic', 0, 'recrue', 'off-duty', 1000, '{\"tshirt_1\":5,\"tshirt_2\":0,\"torso_1\":5,\"torso_2\":0,\"arms\":73,\"pants_1\":90,\"pants_2\":4,\"shoes_1\":63,\"shoes_2\":6,\"helmet_1\":83,\"helmet_2\":6,\"bags_1\":0,\"bags_2\":0,\"decals_1\":1,\"decals_2\":0,\"hair_2\":0,\"hair_color_2\":0,\"chain_2\":0,,\"chain_1\":0}', '{}'),
(3, 'mechanic', 1, 'novice', 'Taze kar', 6000, '{\"tshirt_1\":5,\"tshirt_2\":0,\"torso_1\":5,\"torso_2\":0,\"arms\":73,\"pants_1\":90,\"pants_2\":0,\"shoes_1\":63,\"shoes_2\":6,\"helmet_1\":83,\"helmet_2\":6,\"bags_1\":0,\"bags_2\":0,\"decals_1\":0,\"decals_2\":0,\"chain_2\":0,\"chain_1\":0}', '{}'),
(4, 'mechanic', 2, 'experimente', 'Ba tajrobe', 7000, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":237,\"torso_2\":9,\"arms\":73,\"pants_1\":89,\"pants_2\":22,\"shoes_1\":63,\"shoes_2\":6,\"helmet_1\":14,\"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"decals_1\":0,\"decals_2\":0,\"chain_2\":0,\"chain_1\":0}', '{}'),
(5, 'mechanic', 3, 'chief', 'Customer', 8000, '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":237,\"torso_2\":9,\"arms\":73,\"pants_1\":89,\"pants_2\":20,\"shoes_1\":63,\"shoes_2\":6,\"helmet_1\":0,\"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"decals_1\":0,\"decals_2\":0,\"chain_2\":0,\"chain_1\":0}', '{}'),
(6, 'mechanic', 4, 'boss', 'Rais', 9000, '{\"tshirt_1\":5,\"tshirt_2\":0,\"torso_1\":5,\"torso_2\":2,\"arms\":73,\"pants_1\":90,\"pants_2\":8,\"shoes_1\":24,\"shoes_2\":0,\"helmet_1\":9,\"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"decals_1\":0,\"decals_2\":0,\"chain_2\":0,\"chain_1\":0}', '{}'),
(7, 'taxi', 0, 'recrue', 'Kar amooz', 3000, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":32,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":0,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":27,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(8, 'taxi', 1, 'novice', 'Taze kar', 4000, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":32,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":0,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":27,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(9, 'taxi', 2, 'experimente', 'Ba Tajrobe', 5000, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":26,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":57,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(10, 'taxi', 3, 'uber', 'Moaven', 6000, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":26,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":57,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(11, 'taxi', 4, 'boss', 'Rais', 7000, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":29,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":1,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":4,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(12, 'lumberjack', 0, 'employee', 'Taze kar', 650, '{}', '{}'),
(13, 'fisherman', 0, 'employee', 'Taze kar', 650, '{}', '{}'),
(14, 'fueler', 0, 'employee', 'Taze kar', 650, '{}', '{}'),
(15, 'tailor', 0, 'employee', 'Taze kar', 650, '{\"mask_1\":0,\"arms\":37,\"glasses_1\":0,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":0,\"torso_1\":26,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":0,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":15,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":10,\"tshirt_2\":0,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":20,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}', '{\"mask_1\":0,\"arms\":5,\"glasses_1\":4,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":0,\"torso_1\":66,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":0,\"lipstick_2\":0,\"chain_1\":11,\"tshirt_1\":21,\"eyebrows_3\":0,\"pants_2\":6,\"beard_4\":0,\"torso_2\":2,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":13,\"tshirt_2\":1,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":0,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}'),
(16, 'miner', 0, 'employee', 'Taze kar', 650, '{\"tshirt_2\":1,\"ears_1\":8,\"glasses_1\":15,\"torso_2\":0,\"ears_2\":2,\"glasses_2\":3,\"shoes_2\":1,\"pants_1\":75,\"shoes_1\":51,\"bags_1\":0,\"helmet_2\":0,\"pants_2\":7,\"torso_1\":71,\"tshirt_1\":59,\"arms\":2,\"bags_2\":0,\"helmet_1\":0}', '{}'),
(17, 'slaughterer', 0, 'employee', 'Taze kar', 650, '{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":67,\"pants_1\":36,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":0,\"torso_1\":56,\"beard_2\":6,\"shoes_1\":12,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":15,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":0,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}', '{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":72,\"pants_1\":45,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":1,\"torso_1\":49,\"beard_2\":6,\"shoes_1\":24,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":9,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":5,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}'),
(18, 'moneytransfer', 0, 'driver', 'Hamle Pool', 650, '{}', '{}'),
(19, 'ambulance', 0, 'emtb', 'off-duty', 7000, '{\"tshirt_1\":129,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":3,\"decals_1\":59,\"decals_2\":0,\"arms\":92,\"pants_1\":24,\"pants_2\":0,\"shoes_1\":10,\"shoes_2\":0,\"chain_1\":126,\"chain_2\":0,\"helmet_1\":-1,\"helmet_2\":0,\"glasses_1\":-1,\"glasses_2\":0,\"bags_1\":0,\"bags_2\":0,\"hair_2\":0,\"hair_color_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"makeup_1\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"age_2\":0,\"ears_2\":0,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"bproof_1\":0,\"mask_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"skin\":0,\"eyebrows_1\":0,\"face\":0}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(20, 'ambulance', 1, 'emti', 'EMT I', 9000, '{\"tshirt_1\":129,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":4,\"decals_1\":59,\"decals_2\":0,\"arms\":92,\"pants_1\":24,\"pants_2\":0,\"shoes_1\":10,\"shoes_2\":0,\"chain_1\":126,\"chain_2\":0,\"helmet_1\":-1,\"helmet_2\":0,\"glasses_1\":-1,\"glasses_2\":0,\"bags_1\":0,\"bags_2\":0,\"hair_2\":0,\"hair_color_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"makeup_1\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"age_2\":0,\"ears_2\":0,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"bproof_1\":0,\"mask_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"skin\":0,\"eyebrows_1\":0,\"face\":0}', '{\"tshirt_2\":0,\"decals_2\":0,\"torso_1\":27,\"shoes_1\":10,\"shoes_2\":1,\"skin\":13,\"face\":6,\"pants_2\":0,\"tshirt_1\":34,\"pants_1\":23,\"torso_2\":0,\"arms\":98,\"sex\":1,\"decals_1\":66,\"chain_1\":96,\"bag_1\":40}'),
(21, 'ambulance', 2, 'emta', 'Emt A', 10000, '{\"tshirt_1\":129,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":3,\"decals_1\":59,\"decals_2\":0,\"arms\":92,\"pants_1\":24,\"pants_2\":0,\"shoes_1\":10,\"shoes_2\":0,\"chain_1\":126,\"chain_2\":0,\"helmet_1\":-1,\"helmet_2\":0,\"glasses_1\":-1,\"glasses_2\":0,\"bags_1\":0,\"bags_2\":0,\"hair_2\":0,\"hair_color_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"makeup_1\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"age_2\":0,\"ears_2\":0,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"bproof_1\":0,\"mask_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"skin\":0,\"eyebrows_1\":0,\"face\":0}', '{\"tshirt_2\":0,\"decals_2\":0,\"torso_1\":27,\"shoes_1\":10,\"shoes_2\":3,\"pants_2\":0,\"tshirt_1\":31,\"pants_1\":23,\"torso_2\":1,\"arms\":98,\"sex\":1,\"decals_1\":66,\"chain_1\":96,\"bag_1\":40}'),
(22, 'ambulance', 3, 'paramedic', 'Paramedic', 11000, '{\"tshirt_1\":129,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":5,\"decals_1\":59,\"decals_2\":0,\"arms\":92,\"pants_1\":24,\"pants_2\":0,\"shoes_1\":10,\"shoes_2\":0,\"chain_1\":126,\"chain_2\":0,\"helmet_1\":-1,\"helmet_2\":0,\"glasses_1\":-1,\"glasses_2\":0,\"bags_1\":0,\"bags_2\":0,\"hair_2\":0,\"hair_color_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"makeup_1\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"age_2\":0,\"ears_2\":0,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"bproof_1\":0,\"mask_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"skin\":0,\"eyebrows_1\":0,\"face\":0}', '{\"tshirt_2\":0,\"decals_2\":0,\"torso_1\":27,\"shoes_1\":10,\"shoes_2\":3,\"pants_2\":0,\"tshirt_1\":31,\"pants_1\":23,\"torso_2\":2,\"arms\":98,\"sex\":1,\"decals_1\":66,\"chain_1\":97,\"bag_1\":41}'),
(23, 'ambulance', 4, 'paramedics', 'Senior Paramedic', 12000, '{\"tshirt_1\":129,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":5,\"decals_1\":59,\"decals_2\":0,\"arms\":92,\"pants_1\":24,\"pants_2\":0,\"shoes_1\":10,\"shoes_2\":0,\"chain_1\":126,\"chain_2\":0,\"helmet_1\":-1,\"helmet_2\":0,\"glasses_1\":-1,\"glasses_2\":0,\"bags_1\":0,\"bags_2\":0,\"hair_2\":0,\"hair_color_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"makeup_1\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"age_2\":0,\"ears_2\":0,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"bproof_1\":0,\"mask_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"skin\":0,\"eyebrows_1\":0,\"face\":0}', '{\"tshirt_2\":1,\"decals_2\":0,\"torso_1\":14,\"shoes_1\":10,\"shoes_2\":0,\"pants_2\":0,\"tshirt_1\":31,\"pants_1\":6,\"torso_2\":9,\"arms\":57,\"sex\":1,\"decals_1\":66,\"chain_1\":96,\"bag_1\":0}'),
(24, 'ambulance', 5, 'commander', 'Commander', 13000, '{\"tshirt_1\":129,\"tshirt_2\":0,\"torso_1\":139,\"torso_2\":4,\"decals_1\":59,\"decals_2\":0,\"arms\":82,\"pants_1\":24,\"pants_2\":0,\"shoes_1\":10,\"shoes_2\":0,\"chain_1\":126,\"chain_2\":0,\"helmet_1\":-1,\"helmet_2\":0,\"glasses_1\":-1,\"glasses_2\":0,\"bags_1\":0,\"bags_2\":0,\"hair_2\":0,\"hair_color_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"makeup_1\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"age_2\":0,\"ears_2\":0,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"bproof_1\":0,\"mask_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"skin\":0,\"eyebrows_1\":0,\"face\":0}', '{\"tshirt_2\":1,\"decals_2\":0,\"torso_1\":14,\"shoes_1\":10,\"shoes_2\":0,\"pants_2\":0,\"tshirt_1\":31,\"pants_1\":6,\"torso_2\":9,\"arms\":57,\"sex\":1,\"decals_1\":66,\"chain_1\":96,\"bag_1\":0}'),
(25, 'ambulance', 6, 'boss', 'Deputy Chief', 14000, '{\"tshirt_1\":129,\"tshirt_2\":0,\"torso_1\":139,\"torso_2\":3,\"decals_1\":59,\"decals_2\":0,\"arms\":82,\"pants_1\":24,\"pants_2\":0,\"shoes_1\":10,\"shoes_2\":0,\"chain_1\":126,\"chain_2\":0,\"helmet_1\":-1,\"helmet_2\":0,\"glasses_1\":-1,\"glasses_2\":0,\"bags_1\":0,\"bags_2\":0,\"hair_2\":0,\"hair_color_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"makeup_1\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"age_2\":0,\"ears_2\":0,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"bproof_1\":0,\"mask_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"skin\":0,\"eyebrows_1\":0,\"face\":0}', '{\"tshirt_1\":31,\"tshirt_2\":0,\"torso_1\":103,\"torso_2\":3,\"decals_1\":67,\"decals_2\":0,\"arms\":36,\"pants_1\":6,\"pants_2\":0,\"shoes_1\":10,\"shoes_2\":0,\"chain_1\":97,\"chain_2\":0,\"helmet_1\":-1,\"helmet_2\":0,\"glasses_1\":-1,\"glasses_2\":0,\"bags_1\":0,\"bags_2\":0,\"hair_2\":0,\"hair_color_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"makeup_1\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"age_2\":0,\"ears_2\":0,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"bproof_1\":0,\"mask_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"skin\":0,\"eyebrows_1\":0,\"face\":0}'),
(26, 'ambulance', 7, 'boss', 'Chief', 15000, '{\"tshirt_1\":129,\"tshirt_2\":0,\"torso_1\":139,\"torso_2\":3,\"decals_1\":59,\"decals_2\":0,\"arms\":82,\"pants_1\":24,\"pants_2\":0,\"shoes_1\":10,\"shoes_2\":0,\"chain_1\":126,\"chain_2\":0,\"helmet_1\":-1,\"helmet_2\":0,\"glasses_1\":-1,\"glasses_2\":0,\"bags_1\":0,\"bags_2\":0,\"hair_2\":0,\"hair_color_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"makeup_1\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"age_2\":0,\"ears_2\":0,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"bproof_1\":0,\"mask_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"skin\":0,\"eyebrows_1\":0,\"face\":0}', '{\"tshirt_1\":31,\"tshirt_2\":0,\"torso_1\":103,\"torso_2\":3,\"decals_1\":67,\"decals_2\":0,\"arms\":36,\"pants_1\":6,\"pants_2\":0,\"shoes_1\":10,\"shoes_2\":0,\"chain_1\":97,\"chain_2\":0,\"helmet_1\":-1,\"helmet_2\":0,\"glasses_1\":-1,\"glasses_2\":0,\"bags_1\":0,\"bags_2\":0,\"hair_2\":0,\"hair_color_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"makeup_1\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"age_2\":0,\"ears_2\":0,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"bproof_1\":0,\"mask_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"skin\":0,\"eyebrows_1\":0,\"face\":0}'),
(27, 'bus', 0, 'employee', 'Taze kar', 650, '{}', '{}'),
(28, 'wood', 0, 'employee', 'Taze kar', 650, '{}', '{}'),
(29, 'weazel', 0, 'secutiry', 'Secutiry', 4000, '{}', '{}'),
(30, 'weazel', 1, 'reporter', 'Reporter', 5000, '{}', '{}'),
(31, 'weazel', 2, 'investigator', 'Investigator', 6000, '{}', '{}'),
(32, 'weazel', 3, 'administrator', 'Administrator', 7000, '{}', '{}'),
(33, 'weazel', 4, 'boss', 'Boss', 8000, '{}', '{}'),
(34, 'coffee', 0, 'recruit', 'Nezafatchi', 4000, '{}', '{}'),
(35, 'coffee', 1, 'officer', 'Garsoon', 5000, '{}', '{}'),
(36, 'coffee', 2, 'sergeant', 'Ashpaz', 6000, '{}', '{}'),
(37, 'coffee', 3, 'lieutenant', 'Sandoghdar', 7000, '{}', '{}'),
(38, 'coffee', 4, 'boss', 'Owner', 8000, '{}', '{}'),
(39, 'offambulance', 1, 'emti', 'Nurse', 0, '{}', '{}'),
(40, 'offambulance', 2, 'emta', 'Doctor', 0, '{}', '{}'),
(41, 'offambulance', 3, 'paramedic', 'Specialist', 0, '{}', '{}'),
(42, 'offambulance', 4, 'paramedics', 'Senior Paramedic', 0, '{}', '{}'),
(43, 'offambulance', 5, 'commander', 'Leader Paramedic', 0, '{}', '{}'),
(44, 'offambulance', 6, 'boss', 'Deputy Chief', 0, '{}', '{}'),
(45, 'offambulance', 7, 'boss', 'Chief', 0, '{}', '{}'),
(46, 'offtaxi', 0, 'recrue', 'Kar amooz', 0, '{}', '{}'),
(47, 'offtaxi', 1, 'novice', 'Taze kar', 0, '{}', '{}'),
(48, 'offtaxi', 2, 'experimente', 'Ba Tajrobe', 0, '{}', '{}'),
(49, 'offtaxi', 3, 'uber', 'Moaven', 0, '{}', '{}'),
(50, 'offtaxi', 4, 'boss', 'Rais', 0, '{}', '{}'),
(51, 'offcoffee', 0, 'recruit', 'Nezafatchi', 0, '{}', '{}'),
(52, 'offcoffee', 1, 'officer', 'Garsoon', 0, '{}', '{}'),
(53, 'offcoffee', 2, 'sergeant', 'Ashpaz', 0, '{}', '{}'),
(54, 'offcoffee', 3, 'lieutenant', 'Sandoghdar', 0, '{}', '{}'),
(55, 'offcoffee', 4, 'boss', 'Owner', 0, '{}', '{}'),
(56, 'offmechanic', 1, 'novice', 'Taze kar', 0, '{}', ''),
(57, 'offmechanic', 2, 'experimente', 'Ba tajrobe', 0, '{}', '{}'),
(58, 'offmechanic', 3, 'chief', 'Customer', 0, '{}', '{}'),
(59, 'offmechanic', 4, 'boss', 'Rais', 0, '{}', '{}'),
(60, 'police', 0, 'cadet', 'Cadet', 6000, '{}', '{}'),
(61, 'police', 1, 'po1', 'Officer I', 7500, '{}', '{}'),
(62, 'police', 2, 'po2', 'Officer II', 9000, '{}', '{}'),
(63, 'police', 3, 'po3', 'Officer III', 10000, '{}', '{}'),
(64, 'police', 4, 'slo', 'Senior lead officer', 11000, '{}', '{}'),
(65, 'police', 5, 'sergeant', 'Sergeant', 12000, '{}', '{}'),
(66, 'police', 7, 'commander', 'Commander', 12500, '{}', '{}'),
(67, 'police', 8, 'boss', 'Deputy Chief', 13000, '{}', '{}'),
(68, 'police', 10, 'boss', 'Chief', 16000, '{}', '{}'),
(69, 'offpolice', 0, 'cadet', 'Cadet', 500, '{}', '{}'),
(70, 'offpolice', 1, 'officer1', 'Officer I', 500, '{}', '{}'),
(71, 'offpolice', 2, 'officer2', 'Officer II', 500, '{}', '{}'),
(72, 'offpolice', 3, 'officer3', 'Officer II', 500, '{}', '{}'),
(73, 'offpolice', 4, 'senior', 'Senior lead officer', 500, '{}', '{}'),
(74, 'offpolice', 5, 'sergeant', 'Sergeant', 500, '{}', '{}'),
(75, 'offpolice', 7, 'commander', 'Commander', 500, '{}', '{}'),
(76, 'offpolice', 8, 'boss', 'Deputy Chief', 500, '{}', '{}'),
(77, 'offpolice', 10, 'boss', 'Chief', 500, '{}', '{}'),
(78, 'government', 0, 'agent', 'Agent', 5000, '{}', '{}'),
(79, 'government', 1, 'sagent', 'Senior Agent', 6000, '{}', '{}'),
(80, 'government', 2, 'supervisor', 'Supervisor', 7000, '{}', '{}'),
(81, 'government', 3, 'speaker', 'Speaker', 8000, '{}', '{}'),
(82, 'government', 4, 'ddirector', 'Deputy Director', 9000, '{}', '{}'),
(83, 'government', 5, 'director', 'Director', 10000, '{}', '{}'),
(84, 'government', 6, 'boss', 'Boss', 12000, '{}', '{}'),
(85, 'jobfinder', 0, 'recruit', 'HR Training', 20, '{}', '{}'),
(86, 'jobfinder', 1, 'officer', 'HR Finder', 40, '{}', '{}'),
(87, 'jobfinder', 2, 'sergeant', 'HR Emplooyes', 60, '{}', '{}'),
(88, 'jobfinder', 3, 'lieutenant', 'HR Assistant', 85, '{}', '{}'),
(89, 'jobfinder', 4, 'boss', 'HR Boss', 100, '{}', '{}'),
(90, 'nightclub', 0, 'baeman', 'Bar Man', 20, '{}', '{}'),
(91, 'nightclub', 1, 'dancer', 'Dancer', 40, '{}', '{}'),
(92, 'nightclub', 2, 'viceboss', 'Vice Boss', 60, '{}', '{}'),
(93, 'nightclub', 4, 'boss', 'Boss', 100, '{}', '{}'),
(94, 'cafeshop', 0, 'nezafat', 'Nezafatchi', 20, '{}', '{}'),
(95, 'cafeshop', 1, 'garson', 'Garsoon', 40, '{}', '{}'),
(96, 'cafeshop', 2, 'ashpaz', 'Ashpaz', 60, '{}', '{}'),
(97, 'cafeshop', 3, 'sandoghdar', 'Sandoghdar', 40, '{}', '{}'),
(98, 'cafeshop', 4, 'boss', 'Boss', 100, '{}', '{}'),
(99, 'vigne', 0, 'recrue', 'Interim', 5000, '{\"tshirt_1\":59,\"tshirt_2\":0,\"torso_1\":12,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":1, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":0,\"tshirt_2\":0,\"torso_1\":56,\"torso_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"pants_1\":36, \"pants_2\":0, \"arms\":63, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(100, 'vigne', 1, 'novice', 'Winegrower', 8000, '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":0,\"tshirt_2\":0,\"torso_1\":56,\"torso_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"pants_1\":36, \"pants_2\":0, \"arms\":63, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(101, 'vigne', 2, 'cdisenior', 'Team boss', 10000, '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":0,\"tshirt_2\":0,\"torso_1\":56,\"torso_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"pants_1\":36, \"pants_2\":0, \"arms\":63, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(102, 'vigne', 3, 'boss', 'Boss', 12000, '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":14,\"torso_2\":15,\"shoes_1\":12,\"shoes_2\":0,\"pants_1\":9, \"pants_2\":5, \"arms\":1, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(103, 'police', 6, 'captain', 'Captain', 12500, '{}', '{}'),
(104, 'police', 9, 'boss', 'Assistant Chief', 13500, '{}', '{}'),
(105, 'offpolice', 6, 'captain', 'Captain', 500, '{}', '{}'),
(106, 'offpolice', 9, 'boss', 'Assistant Chief', 500, '{}', '{}'),
(123, 'offpolice', 0, 'cadet', 'Cadet', 500, '{}', '{}'),
(124, 'offpolice', 1, 'recruit', 'Recruit', 500, '{}', '{}'),
(125, 'offpolice', 2, 'officer1', 'Officer I', 500, '{}', '{}'),
(126, 'offpolice', 3, 'officer2', 'Officer II', 500, '{}', '{}'),
(127, 'offpolice', 4, 'officer3', 'Officer III', 500, '{}', '{}'),
(128, 'offpolice', 5, 'senior', 'Senior lead officer', 500, '{}', '{}'),
(129, 'offpolice', 6, 'sergeant', 'Sergeant', 500, '{}', '{}'),
(130, 'offpolice', 7, 'commander', 'Commander', 500, '{}', '{}'),
(131, 'offpolice', 8, 'deputy', 'Deputy Chief', 500, '{}', '{}'),
(132, 'offpolice', 9, 'medic', 'Doctor', 500, '{}', '{}'),
(133, 'offpolice', 10, 'chief', 'Chief', 500, '{}', '{}'),
(139, 'cia', 0, 'agent', 'agent', 500, '{}', '{}'),
(140, 'cia', 1, 'security', 'security', 20000, '{}', '{}'),
(141, 'cia', 2, 'agent', 'agent', 30000, '{}', '{}'),
(142, 'cia', 3, 'specialagent', 'specialagent', 40000, '', ''),
(143, 'cia', 4, 'supervisor', 'supervisor', 50000, '{}', '{}'),
(144, 'cia', 5, 'assistant', 'assistant', 70000, '', ''),
(145, 'cia', 6, 'boss', 'boss', 100000, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `jsfour_cardetails`
--

CREATE TABLE `jsfour_cardetails` (
  `pk` int(11) NOT NULL,
  `plate` varchar(255) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `incident` varchar(255) NOT NULL DEFAULT '{}',
  `inspected` varchar(255) DEFAULT NULL,
  `identifier` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jsfour_cardetails`
--

INSERT INTO `jsfour_cardetails` (`pk`, `plate`, `owner`, `incident`, `inspected`, `identifier`) VALUES
(1, 'UAMC8872', 'Arman_Mohebrad', '[\"kos (2021-06-23)\"]', 'Yes', 'steam:110000148adfa01');

-- --------------------------------------------------------

--
-- Table structure for table `jsfour_criminalrecord`
--

CREATE TABLE `jsfour_criminalrecord` (
  `offense` varchar(160) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `institution` varchar(255) DEFAULT NULL,
  `charge` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `term` varchar(255) DEFAULT NULL,
  `classified` int(2) NOT NULL DEFAULT 0,
  `identifier` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `warden` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jsfour_criminaluserinfo`
--

CREATE TABLE `jsfour_criminaluserinfo` (
  `identifier` varchar(160) NOT NULL,
  `aliases` varchar(255) DEFAULT NULL,
  `recordid` varchar(255) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `eyecolor` varchar(255) DEFAULT NULL,
  `haircolor` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `height` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jsfour_efterlysningar`
--

CREATE TABLE `jsfour_efterlysningar` (
  `pk` int(11) NOT NULL,
  `wanted` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `crime` varchar(255) DEFAULT NULL,
  `uploader` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `incident` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jsfour_incidents`
--

CREATE TABLE `jsfour_incidents` (
  `pk` int(11) NOT NULL,
  `number` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `uploader` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jsfour_logs`
--

CREATE TABLE `jsfour_logs` (
  `pk` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `remover` varchar(255) DEFAULT NULL,
  `wanted` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `licenses`
--

CREATE TABLE `licenses` (
  `type` varchar(60) COLLATE utf8_persian_ci NOT NULL,
  `label` varchar(60) COLLATE utf8_persian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `licenses`
--

INSERT INTO `licenses` (`type`, `label`) VALUES
('dmv', 'Ayin Naame'),
('drive', 'Govahiname Mashin'),
('drive_bike', 'Govahiname Motor'),
('drive_truck', 'Govahiname Kamiyon'),
('weapon', 'Mojavez Aslahe');

-- --------------------------------------------------------

--
-- Table structure for table `mdt_reports`
--

CREATE TABLE `mdt_reports` (
  `id` int(11) NOT NULL,
  `char_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `incident` longtext DEFAULT NULL,
  `charges` longtext DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `jailtime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mdt_reports`
--

INSERT INTO `mdt_reports` (`id`, `char_id`, `title`, `incident`, `charges`, `author`, `name`, `date`, `jailtime`) VALUES
(2, 3761, 'negin criminall', 'in khanoom be hoshdare police bitavajohi karad va sepas dar moghabele police aslahe keshide', '{\"Estefade az selahe garm dar shahr\":1,\"Soraat mojaz 80Km/h\":1}', 'Pouriya_Mashti', 'Negin_Criminall', '08-17-2020 07:00:24', NULL),
(3, 476, 'BANK ROBBERY', 'FARD DAR HAL BANK ROBRY BODE KE DASTGIR SHOD ', '{\"Dozdi az bank\":1}', 'Mani_Hajrex', 'Ahmad_Zoghi', '08-18-2020 15:12:14', NULL),
(4, 6248, 'TAHOD NAME ', 'IN FARD TAHOD DADE AST KE DAR TOL ZENDEGI JORMI MORTAKEB NASHAVAD DAR SORAT  ROAYAT KHALAF JAIL 2 BARABAR SHAVAD', '{\"Dor zadan gheyr e mojaz\":1}', 'Mani_Hajrex', 'Amo_Hitman', '08-18-2020 16:37:58', NULL),
(5, 963, 'bob marley', 'esm bob marly\njob: docter\nshomare telefon :0939294866 \njorm: hamle aslahe\nfarar az daste maamore ghanoon \ntohin be mamore ghanoon', '{\"Zadan o dar raftan\":1,\"Ranandegi khatarnak\":1,\"Soraat mojaz 60Km/h\":1,\"Ranandegi bedoone govahinam\":1,\"Eteraz be ghanoon\":1,\"Beham rikhtan e nazm \":1,\"Bi tavajohi be ekhtar e police\":1}', 'Pouriya_Mashti', 'Bob_Marley', '08-19-2020 02:10:09', NULL),
(6, 2487, 'cipher', 'dozdi az shop :1. shelik ba maamore ghanoon 2.adame hamkari ba maamoor 3. dozdi az shop ', '{\"Shelik be samte mamoor e ghanoon\":1,\"Eghdam be ghatle mamoor e ghanoon\":1,\"Dozdi az maghaze\":1}', 'Pouriya_Mashti', 'Dean_Winchester', '08-19-2020 03:21:01', NULL),
(7, 6756, 'Karen_Kkn (Javahery)', 'Be Hamrah 3 nafar az javahery serghat karde', '{\"Koshtan e mamoor e ghanoon\":1}', 'Sina_Masoodi', 'Karen_Kkn', '08-19-2020 06:37:33', NULL),
(8, 5445, 'omid_gholizade (javahery)', 'be hamrah 3 nafar digar az javahery dozdi kard', '{\"Dozdi\":1}', 'Sina_Masoodi', 'Omid_Gholizade', '08-19-2020 06:38:53', NULL),
(9, 6795, 'Farhad_mrd (javahery)', 'Be hamrah 3 nafar digar az javahery dozdi karde', '{\"Dozdi\":1}', 'Sina_Masoodi', 'Farhad_Mrd', '08-19-2020 06:41:23', NULL),
(10, 521, 'kamy hyby', 'shakhsi benam kamy hyby : 1. bitavajohi be hoshdar police 2. kal kal ba police 3. shelik be maamore ghanoon . 4. bi ehterami be maamoore ghanoon ,...', '{\"Bi tavajohi be ekhtar e police\":1,\"Estefade az selahe garm dar shahr\":1,\"Harakat e khatarnak\":1,\"Majrooh kardan e mamoor e ghanoon\":1,\"Tahdid Police\":1,\"Tohin be mamoor e police\":1,\"Soraat mojaz 80Km/h\":1,\"Zadan o dar raftan\":1,\"Eghdam be ghatle mamoor e ghanoon\":1,\"Dashtan e aslahe gheyre mojaz\":1,\"Bi ehterami\":1,\"Shelik be samte mamoor e ghanoon\":1,\"Eteraz be ghanoon\":1,\"Beham rikhtan e nazm \":1,\"Ijad e fesad\":1}', 'Pouriya_Mashti', 'Kamy_Hyby', '08-19-2020 07:03:36', NULL),
(11, 7169, 'Asgar_ghasab', 'be hamrah 1 nafar digar az shop serghat karde', '{\"Dozdi az maghaze\":1}', 'Sina_Masoodi', 'Asgar_Gasab', '08-19-2020 07:09:17', NULL),
(12, 2008, 'Taht Taghib (Javahery)', 'Farari', '{\"Majrooh kardan e mamoor e ghanoon\":1,\"Dozdi\":1}', 'Sina_Masoodi', 'Shayan_Karimi', '08-19-2020 07:11:35', NULL),
(13, 476, 'tahrik police', 'dozdi mashin    eteraf be dozdi bi ehterami ', '{\"Dozdi khodro\":1,\"Tohin be mamoor e police\":1,\"Bi ehterami\":1}', 'Mani_Hajrex', 'Ahmad_Zoghi', '08-19-2020 08:17:47', NULL),
(14, 874, 'javahri', 'test', '{\"Vorood mamnoo\":1}', 'Black_Wolf', 'Diego_King', '08-19-2020 08:38:37', NULL),
(17, 2834, 'HameD_Pablo [Dalal Aslahe', 'In fard ba sabeghe chand sale bozorgtarin dalal mavad mokhader dar los santos bode ke sal ha taht taghib bode va dar ye amaliat ba mosharekat sheriff va pd dastgir shodw', '{\"Dashtan e aslahe gheyre mojaz\":1,\"Foroosh e mavad e mokhader\":1}', 'Sina_Masoodi', 'Hamed_Pablo', '08-19-2020 10:47:10', NULL),
(18, 4727, 'SafdarZombiePoor [ Dalal Aslahe ]', 'in fard be hamrah hamed pablo tey amaliati sar gharar va moamele aslahe dastgir shode ba hamkari sheriff', '{\"Shelik be samte mamoor e ghanoon\":1,\"Tolid e mavad e mokhader\":1,\"Dashtan e aslahe gheyre mojaz\":1}', 'Sina_Masoodi', 'Safdar_Zombiepoor', '08-19-2020 10:51:44', NULL),
(19, 3566, 'Mehrdad_Javadian[TirAndazi Dar Shahr]', 'in fard be samt mardom va mashin khod tir andazi karde va dastgir shode', '{\"Bi ehterami\":1,\"Eteraz be ghanoon\":1}', 'Sina_Masoodi', 'Mehrdad_Javadian', '08-20-2020 07:06:18', NULL),
(20, 6939, 'Gang Banafsh Va Sabz', '2 goroh ba lebas haye banafsh va sabz dar sath shahr shoro be falaiat kardan va dargiri ziadi ba police dashtn va tedad ziadi police ro be ghatl resondan 2 nafar az mojremin banafsh dastgir shode va be zendan andakhte shode and name anha ahmad devil va amiryari', '{\"Eghdam be ghatle mamoor e ghanoon\":1,\"Koshtan e mamoor e ghanoon\":3}', 'Sina_Masoodi', 'Ahmad_Devil', '08-20-2020 08:15:38', NULL),
(21, 7034, 'Amir_Yari', 'In fard be hamrah afrad digari mamorin ghanon ro be ghatl resonde dar goroh banafsh faaliat dashte va tey amaliat dargiri sangin dastgir shode va 45 mah be zendan ferstade shod', '{\"Koshtan e mamoor e ghanoon\":1,\"Shelik be samte mamoor e ghanoon\":1}', 'Sina_Masoodi', 'Amir_Yari', '08-20-2020 08:24:43', NULL),
(22, 6939, 'Ahmad Devil[Tir Andazi V ghat mamor', 'in fard be hamrah goroh sabz va banafsh dar yek dargiri sangin mosalahane dastgir shode va be hamrah aghaye Amir_Yari Be zndan ferestade shod', '{\"Koshtan e mamoor e ghanoon\":1,\"Shelik be samte mamoor e ghanoon\":1}', 'Sina_Masoodi', 'Ahmad_Devil', '08-20-2020 08:31:40', NULL),
(24, 6964, 'ESTE TERAFFIC', 'FARD BI TAVAJOHI BE EKHTAR POLICE  VA FARAR AZ POLICE RA DASHTE', '{\"Oboor az cheraghe ghermez\":1,\"Bi tavajohi be ekhtar e police\":1,\"Ranandegi khatarnak\":1,\"Vorood mamnoo\":1,\"hamkari nakardan ba mamore ghanon\":1,\"Soraat mojaz 120Km/h\":1}', 'Mmd_Yakuza', 'Kasra_Slash', '08-20-2020 11:16:54', NULL),
(25, 6244, 'shop robbery', 'fard az shop dozdi be police shelik kard', '{\"Dozdi\":1,\"Estefade az selahe garm dar shahr\":1,\"Dozdi az maghaze\":1}', 'Mmd_Yakuza', 'Arash_Movafaghi', '08-21-2020 01:49:35', NULL),
(26, 4300, 'shop robbery', 'fard az shop dozdi va be olice shelik karde', '{\"Dozdi\":1,\"Estefade az selahe garm dar shahr\":2,\"Dozdi az maghaze\":1}', 'Mmd_Yakuza', 'Mamad_Agha', '08-21-2020 02:24:14', NULL),
(29, 5458, 'Tir andazi va eghdam be qatle mamure ghanoon va hamkari ba mojrem haye digar', 'ishun dar Dargiri pish oomade beyne mamur ha va mojremani ke darhale tolide mavad mokhader boodan hamkari dashtan', '{\"Eghdam be ghatle mamoor e ghanoon\":1,\"Shelik be samte mamoor e ghanoon\":1}', 'Kian_Sti', 'Haj_Mehdi', '08-21-2020 04:51:14', NULL),
(30, 4018, 'Parsa_Yar[Bardaskht Mavad]', 'in fard dar zamin weed dastgir shode va police tir andazi kard', '{\"Dashtan e mavad e mokhader\":1,\"Eghdam be ghatle shahrvand\":1}', 'Sina_Masoodi', 'Parsa_Yar', '08-21-2020 04:58:19', NULL),
(31, 2638, 'hamed_dortan [ghatl shahrvand]', 'in fard to parkingmarkazi 1 nafaro koshte va farar karde', '{\"Koshtan e shahrvand\":1}', 'Sina_Masoodi', 'Hamed_Dortan', '08-21-2020 05:12:49', NULL),
(32, 7056, 'Karen-Xray (mashin dozdi va nadashtan ghovhiname)', 'mashin dozdi va nadashtan ghovhiname', '{\"Oboor az cheraghe ghermez\":1}', 'Black_Wolf', 'Karen_Xray', '08-21-2020 06:55:27', NULL),
(33, 7239, 'arshia Khodadad(rob Shop)', 'rob shop va hamle be mamor ghanon ', '{\"Bi ehterami\":1,\"Tahdid Police\":1}', 'Black_Wolf', 'Arshia_Khodadad', '08-21-2020 07:32:17', NULL),
(34, 7231, 'mmd_Mamadi(bi nazmi shadid)', 'jarayem:\n\n1. bi nazmi dar edare police & bimarestan \n\n2. bi ehterami be police \n', '{\"hamkari nakardan ba mamore ghanon\":1,\"Eteraz be ghanoon\":1,\"Bi ehterami\":1,\"Ijad e fesad\":1}', 'Pouriya_Mashti', 'Mmd_Mamadi', '08-21-2020 09:48:34', NULL),
(35, 6592, 'lilcci amir (ghatle amd va hamle mavad)', 'jaraeem :\n\n1. ghatle amd shahrvand dar street \n\n2. hamle mavad mokhader be meghdar ziad \n\n3. reshve dadan be maamoore police', '{\"Dashtan e mavad e mokhader\":1,\"Eghdam be ghatle shahrvand\":1,\"Shelik be shahrvandan\":1,\"Koshtan e shahrvand\":1}', 'Pouriya_Mashti', 'Lilcci_Amir', '08-21-2020 10:53:48', NULL),
(36, 7000, 'shop robber', 'shop robberi ', '{\"Eghdam be ghatle mamoor e ghanoon\":1,\"Dozdi az maghaze\":1,\"Koshtan e mamoor e ghanoon\":1,\"Shelik be samte mamoor e ghanoon\":1}', 'Kian_Sti', 'Amir_Hamido', '08-26-2020 21:50:34', NULL),
(37, 3862, 'Usf Bermuda(Farar Az Police)', 'hamrah yek zan darhal viraj dar shahr va farar az dast police bodand bedon gavahiname ranadgei ke dastgir shodand', '{\"Dozdi khodro\":1,\"Ranandegi khatarnak\":1,\"Ranandegi bedoone govahinam\":1}', 'Sina_Masoodi', 'Bermuda_Yousef', '08-26-2020 23:12:57', NULL),
(38, 6195, 'Alirezaaa-rezaeii(shop robbery)', 'be hamrah 2 saregh digar az shop dozdi karde va 2 nafr digar foot kardand', '{\"Dozdi az maghaze\":1}', 'Sina_Masoodi', 'Alirezaaa_Rezaeii', '08-27-2020 00:05:06', NULL),
(39, 4390, 'Forooshande mavade mokhader', 'mojrem darhale ertekabe jorm dastgir shod va 50 adad marijuana zabt shod', '{\"Foroosh e mavad e mokhader\":1,\"Dashtan e mavad e mokhader\":1}', 'Kian_Sti', 'Mjf_Zoghi', '08-27-2020 11:25:55', NULL),
(40, 4828, 'shop robber', 'mojrem bad az serghat az shop bazdasht shod va be zendan enteghal dade shod', '{\"Shelik be samte mamoor e ghanoon\":1,\"Majrooh kardan e mamoor e ghanoon\":1,\"Eghdam be ghatle mamoor e ghanoon\":1,\"Dozdi az maghaze\":1,\"Koshtan e mamoor e ghanoon\":1}', 'Kian_Sti', 'Abolfazl_Chenani', '08-27-2020 12:40:56', NULL),
(41, 6465, 'Shemiran [Javahery]', 'be hamrah 2 fard digar az javahery dozdi kard', '{\"Dozdi\":2}', 'Sina_Masoodi', 'Shemiran_Muzikian', '08-28-2020 04:34:25', NULL),
(42, 3960, 'mozahemat baraye mamur ha', 'hengame dastgirie mojrem mozahemat ijad mikard va bi tavajohi be ekhtar ha mikard', '{\"Beham rikhtan e nazm \":1,\"Bi tavajohi be ekhtar e police\":1}', 'Kian_Sti', 'Shervin_Ebi', '08-28-2020 14:29:12', NULL),
(43, 5301, 'Shop robber', '2 mojrem dar shop robbery dastgir shode va be zendan montaghel shodan', '{\"Dozdi az maghaze\":1,\"Shelik be samte mamoor e ghanoon\":1,\"Eghdam be ghatle mamoor e ghanoon\":1}', 'Kian_Sti', 'Aliprice_Price', '08-29-2020 18:46:38', NULL),
(44, 7271, 'Anj_Duhu[ShopRobbery]', 'be hamrah 2 nafar digar az shop dozdi karde', '{\"Dozdi az maghaze\":1}', 'Sina_Masoodi', 'Anj_Duhu', '08-30-2020 20:45:32', NULL),
(45, 4873, 'amir hommasi (rob shop)', 'dozdi az rob shop ', '{\"Dozdi az maghaze\":1}', 'Pouriya_Mashti', 'Amir_Hommasi', '08-30-2020 21:00:37', NULL),
(46, 6244, 'arash movafaghi (rob shop)', 'dozdi az shop va shelik be samte maamore ghanon', '{\"Dozdi az maghaze\":1}', 'Pouriya_Mashti', 'Arash_Movafaghi', '08-31-2020 01:08:32', NULL),
(47, 6244, 'Arash_Movafaghi[Bank Robbery]', 'be hamrah 3 nafar digar az bank dozdi karde', '{\"Dozdi az bank\":1}', 'Sina_Masoodi', 'Arash_Movafaghi', '08-31-2020 02:44:42', NULL),
(48, 7383, 'tir andazi', 'tir andazi be samte mamoore ghanoon va harf goosh nakardn az mamoore ghanoon o bi adabi', '{\"Shelik be samte mamoor e ghanoon\":1,\"Eghdam be ghatle mamoor e ghanoon\":1,\"Koshtan e mamoor e ghanoon\":1,\"Majrooh kardan e mamoor e ghanoon\":1}', 'Parsa_Fallahian', 'Arman_Shams', '09-01-2020 13:33:16', NULL),
(49, 6110, 'abolfazl xgamer (rob shop)', 'dozdi az shop', '{\"Dozdi az maghaze\":1}', 'Pouriya_Mashti', 'Abolfazl_Xgamer', '09-02-2020 13:51:26', NULL),
(50, 5718, 'shop robber', 'Shop robber be hamrahe yek mojreme dg bazdasht va be zendan enteghal dade shod', '{\"Dozdi az maghaze\":1,\"Eghdam be ghatle mamoor e ghanoon\":1,\"Shelik be samte mamoor e ghanoon\":1}', 'Kian_Sti', 'Damoon_Qwerty', '09-02-2020 14:03:21', NULL),
(51, 314, 'shop robber', 'mojrem bazdasht shod', '{\"Shelik be samte mamoor e ghanoon\":1,\"Eghdam be ghatle mamoor e ghanoon\":1,\"Dozdi az maghaze\":1}', 'Kian_Sti', 'Javad_Bgh', '09-02-2020 15:19:51', NULL),
(52, 4062, 'shop robber', 'Bazdasht va zendani shod', '{\"Dozdi az maghaze\":1}', 'Kian_Sti', 'Nikyar_Tafti', '09-02-2020 15:41:17', NULL),
(53, 2004, 'tavagof mamnu', 'mashin lexus (lx 570) jeloye pd tavagof tulani ( 6h ) . be tarikh 2020.09.02 saat 12:05', '{\"Tavaghof mamnoo\":1}', 'Ehsan_Gosili', 'Aydin_Avesta', '09-02-2020 18:09:46', NULL),
(54, 4873, 'takhalof rannedegi', 'khalaf raftan autoband', '{\"Ranandegi dar line mokhalef\":1}', 'Mostafa_Redhat', 'Amir_Hommasi', '09-02-2020 19:04:13', NULL),
(55, 3522, 'shop robber', 'mojrem dastgir va zendani shod', '{\"Majrooh kardan e mamoor e ghanoon\":1,\"Shelik be samte mamoor e ghanoon\":1,\"Dozdi az maghaze\":1}', 'Kian_Sti', 'Soroush_Ninja', '09-02-2020 20:35:28', NULL),
(56, 5608, 'mmd baghal (dozdi az shop)', 'dozdi az shop ', '{\"Eghdam be ghatle mamoor e ghanoon\":1,\"Shelik be samte mamoor e ghanoon\":1,\"Dozdi az maghaze\":1}', 'Pouriya_Mashti', 'Mmd_Baghal', '09-02-2020 20:38:51', NULL),
(57, 4873, 'amir hommasi(dozdi az shop)', 'dozdi az shop', '{\"Eghdam be ghatle mamoor e ghanoon\":1,\"Shelik be samte mamoor e ghanoon\":1,\"Dozdi az maghaze\":1}', 'Pouriya_Mashti', 'Amir_Hommasi', '09-02-2020 20:39:56', NULL),
(58, 4425, 'ist police', '.', '{\"Soraat mojaz 80Km/h\":1,\"hamkari nakardan ba mamore ghanon\":1}', 'Ehsan_Gosili', 'Arvin_King', '09-02-2020 20:43:59', NULL),
(59, 5718, 'damoon (dozdi az shop va  bi nazmi)', 'bi nazmi ijad kardan', '{\"Dozdi az maghaze\":1}', 'Pouriya_Mashti', 'Damoon_Qwerty', '09-03-2020 15:40:59', NULL),
(60, 6756, 'Dozd khodro', 'fard bad az taghibo goriz dastgir va bazdasht shod', '{\"Dozdi khodro\":1,\"Dor zadan gheyr e mojaz\":1,\"Ranandegi dar line mokhalef\":1,\"Oboor az cheraghe ghermez\":1,\"Ranandegi bedoone govahinam\":1}', 'Kian_Sti', 'Karen_Kkn', '09-03-2020 15:54:53', NULL),
(61, 6110, 'KHeft gir', 'mojrem dar heyne ertekab jorm dastgir va be zendan motaghel shod\n', '{\"Tahdid shahrvandan\":1}', 'Kian_Sti', 'Abolfazl_Xgamer', '09-03-2020 17:09:34', NULL),
(62, 5301, 'Dozd mashin', 'Fardi be name Hooman farhadpour az aqaye aliprice shekayat kardan va motaghedan ke ishun mashineshuno dozdidan', '{\"Dozdi khodro\":1}', 'Kian_Sti', 'Aliprice_Price', '09-04-2020 02:30:57', NULL),
(63, 7525, 'dozdi o tir andazi', 'dozdi az shopa va tir andazi be samte mamoore ghanoon', '{\"Dozdi az maghaze\":1,\"Estefade az selahe garm dar shahr\":1,\"hamkari nakardan ba mamore ghanon\":1}', 'Parsa_Fallahian', 'Chandler_Bing', '09-04-2020 12:32:32', NULL),
(64, 7551, 'dozdi va tir andazi', 'shop robbery va tir andazi', '{\"Eghdam be ghatle mamoor e ghanoon\":1,\"Dozdi az maghaze\":1,\"Majrooh kardan e mamoor e ghanoon\":1}', 'Parsa_Fallahian', 'Javad_Xcc', '09-04-2020 14:11:15', NULL),
(65, 768, 'dozdi o tir andazi', 'dozdi o tir andazi', '{\"Eghdam be ghatle mamoor e ghanoon\":1,\"Dozdi az maghaze\":1,\"Koshtan e mamoor e ghanoon\":1}', 'Parsa_Fallahian', 'Amir_Mousavi', '09-04-2020 19:01:44', NULL),
(66, 7670, 'shop robber', 'mojrem be zendan montaghel shod', '{\"Eghdam be ghatle mamoor e ghanoon\":1,\"Dozdi az maghaze\":1,\"Shelik be samte mamoor e ghanoon\":1}', 'Kian_Sti', 'Ali_Ask', '09-05-2020 13:53:19', NULL),
(67, 7768, 'Tir Andazi Be Cop', 'Tir Andazi Mokarar Be police + Adam Hamkari Ba Police', '{\"hamkari nakardan ba mamore ghanon\":1,\"Shelik be samte mamoor e ghanoon\":1}', 'Esperanza_Garcia', 'Mahan_Forest', '09-07-2020 13:32:25', NULL),
(68, 5718, 'tir andazi be samte police', 'fard hamrah ba sharike jormesh zendani shod', '{\"Shelik be samte mamoor e ghanoon\":1,\"hamkari nakardan ba mamore ghanon\":1,\"Estefade az selahe garm dar shahr\":1,\"Koshtan e shahrvand\":2,\"Eghdam be ghatle mamoor e ghanoon\":1}', 'Kian_Sti', 'Damoon_Qwerty', '09-07-2020 13:34:13', NULL),
(69, 4013, 'farbod_koloft', 'ranandgi dar line khalaf\nfarar az dast police + tir andazi be samt police + eghdam be ghat mamor ghanon', '{\"Ranandegi dar line mokhalef\":1}', 'Esperanza_Garcia', 'Farbod_Koloft', '09-07-2020 13:53:36', NULL),
(70, 7315, 'mani sutonzade', 'troll karadan dar pd', '{\"Tohin be mamoor e police\":1}', 'Pouriya_Mashti', 'Mani_Sutonzade', '09-07-2020 23:07:44', NULL),
(71, 6561, 'Shop robber', 'mojrem dastgir va be zendan montaghel shod', '{\"Dozdi az maghaze\":1,\"Shelik be samte mamoor e ghanoon\":1}', 'Kian_Sti', 'Setayesh_Bahrami', '09-08-2020 00:01:22', NULL),
(72, 7221, 'milad sky (dozdi az shop)', 'dozdi az shop', '{\"Shelik be samte mamoor e ghanoon\":1,\"Eghdam be ghatle mamoor e ghanoon\":1,\"Dozdi az maghaze\":1}', 'Pouriya_Mashti', 'Milad_Sky', '09-08-2020 00:01:26', NULL),
(73, 2638, 'hamed dortan (dozdi az shop)', 'dozdi az shop', '{\"Shelik be samte mamoor e ghanoon\":1,\"Eghdam be ghatle mamoor e ghanoon\":1,\"Dozdi az maghaze\":1}', 'Pouriya_Mashti', 'Hamed_Dortan', '09-08-2020 00:02:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdt_warrants`
--

CREATE TABLE `mdt_warrants` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `char_id` int(11) DEFAULT NULL,
  `report_id` int(11) DEFAULT NULL,
  `report_title` varchar(255) DEFAULT NULL,
  `charges` longtext DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `expire` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mdt_warrants`
--

INSERT INTO `mdt_warrants` (`id`, `name`, `char_id`, `report_id`, `report_title`, `charges`, `date`, `expire`, `notes`, `author`) VALUES
(1, 'Aliprice_Price', 5301, 43, 'Shop robber', '{\"Dozdi az maghaze\":1,\"Eghdam be ghatle mamoor e ghanoon\":1,\"Shelik be samte mamoor e ghanoon\":1}', '09-08-2020 16:06:10', '2020-09-15T11:35:37.642Z', 'TAHTE TAGHIB ', 'Kian_Sti');

-- --------------------------------------------------------

--
-- Table structure for table `meeta_accessory_inventory`
--

CREATE TABLE `meeta_accessory_inventory` (
  `id` int(11) NOT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `meeta_vehicle_trunk`
--

CREATE TABLE `meeta_vehicle_trunk` (
  `id` int(11) NOT NULL,
  `plate` varchar(255) DEFAULT NULL,
  `item` varchar(255) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `isweapon` int(255) NOT NULL DEFAULT 0,
  `owner` varchar(255) DEFAULT NULL,
  `label_weapon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `owned_bags`
--

CREATE TABLE `owned_bags` (
  `identifier` varchar(50) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `x` double DEFAULT NULL,
  `y` double DEFAULT NULL,
  `z` double DEFAULT NULL,
  `itemcount` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `owned_bag_inventory`
--

CREATE TABLE `owned_bag_inventory` (
  `id` int(11) DEFAULT NULL,
  `item` varchar(50) COLLATE utf8_persian_ci DEFAULT NULL,
  `label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `owned_properties`
--

CREATE TABLE `owned_properties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) COLLATE utf8_persian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `owned_shops`
--

CREATE TABLE `owned_shops` (
  `owner` varchar(250) DEFAULT 'government',
  `number` int(11) NOT NULL,
  `money` int(11) DEFAULT 0,
  `value` varchar(255) DEFAULT '[]',
  `inventory` varchar(250) DEFAULT '[]',
  `name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `owned_shops`
--

INSERT INTO `owned_shops` (`owner`, `number`, `money`, `value`, `inventory`, `name`) VALUES
('{\"identifier\":\"steam:1100001410e55b4\",\"name\":\"Masiha Omidi\"}', 1, 0, '{\"value\":31000000,\"forsale\":false}', '{\"pizza\":0,\"cheesebows\":0,\"radio\":0,\"water\":0,\"sprite\":0,\"lotteryticket\":0,\"chips\":0,\"fishingrod\":0,\"bread\":0,\"fanta\":0,\"burger\":0,\"marabou\":0,\"picklock\":0}', 'Shop'),
('{\"identifier\":\"government\",\"name\":\"Government\"}', 2, 0, '{\"value\":31000000,\"forsale\":true}', '{\"pizza\":0,\"cheesebows\":0,\"radio\":0,\"water\":0,\"sprite\":0,\"lotteryticket\":0,\"chips\":0,\"fishingrod\":0,\"bread\":0,\"fanta\":0,\"burger\":0,\"marabou\":0,\"picklock\":0}', 'Shop'),
('{\"identifier\":\"government\",\"name\":\"Government\"}', 3, 0, '{\"value\":31000000,\"forsale\":true}', '{\"pizza\":0,\"cheesebows\":0,\"radio\":0,\"water\":0,\"sprite\":0,\"lotteryticket\":0,\"chips\":0,\"fishingrod\":0,\"bread\":0,\"fanta\":0,\"burger\":0,\"marabou\":0,\"picklock\":0}', 'Shop'),
('{\"identifier\":\"government\",\"name\":\"Government\"}', 4, 0, '{\"value\":31000000,\"forsale\":true}', '{\"pizza\":0,\"cheesebows\":0,\"radio\":0,\"water\":0,\"sprite\":0,\"lotteryticket\":0,\"chips\":0,\"fishingrod\":0,\"bread\":0,\"fanta\":0,\"burger\":0,\"marabou\":0,\"picklock\":0}', 'Shop'),
('{\"identifier\":\"government\",\"name\":\"Government\"}', 5, 0, '{\"value\":31000000,\"forsale\":true}', '{\"pizza\":0,\"cheesebows\":0,\"radio\":0,\"water\":0,\"sprite\":0,\"lotteryticket\":0,\"chips\":0,\"fishingrod\":0,\"bread\":0,\"fanta\":0,\"burger\":0,\"marabou\":0,\"picklock\":0}', 'Shop'),
('{\"identifier\":\"government\",\"name\":\"Government\"}', 6, 0, '{\"value\":31000000,\"forsale\":true}', '{\"pizza\":0,\"cheesebows\":0,\"radio\":0,\"water\":0,\"sprite\":0,\"lotteryticket\":0,\"chips\":0,\"fishingrod\":0,\"bread\":0,\"fanta\":0,\"burger\":0,\"marabou\":0,\"picklock\":0}', 'Shop'),
('{\"identifier\":\"government\",\"name\":\"Government\"}', 7, 0, '{\"value\":31000000,\"forsale\":true}', '{\"pizza\":0,\"cheesebows\":0,\"radio\":0,\"water\":0,\"sprite\":0,\"lotteryticket\":0,\"chips\":0,\"fishingrod\":0,\"bread\":0,\"fanta\":0,\"burger\":0,\"marabou\":0,\"picklock\":0}', 'Shop'),
('{\"identifier\":\"government\",\"name\":\"Government\"}', 8, 0, '{\"value\":31000000,\"forsale\":true}', '{\"pizza\":0,\"cheesebows\":0,\"radio\":0,\"water\":0,\"sprite\":0,\"lotteryticket\":0,\"chips\":0,\"fishingrod\":0,\"bread\":0,\"fanta\":0,\"burger\":0,\"marabou\":0,\"picklock\":0}', 'Shop'),
('{\"identifier\":\"government\",\"name\":\"Government\"}', 9, 0, '{\"value\":31000000,\"forsale\":true}', '{\"pizza\":0,\"cheesebows\":0,\"radio\":0,\"water\":0,\"sprite\":0,\"lotteryticket\":0,\"chips\":0,\"fishingrod\":0,\"bread\":0,\"fanta\":0,\"burger\":0,\"marabou\":0,\"picklock\":0}', 'Shop'),
('{\"identifier\":\"government\",\"name\":\"Government\"}', 10, 0, '{\"value\":31000000,\"forsale\":true}', '{\"pizza\":0,\"cheesebows\":0,\"radio\":0,\"water\":0,\"sprite\":0,\"lotteryticket\":0,\"chips\":0,\"fishingrod\":0,\"bread\":0,\"fanta\":0,\"burger\":0,\"marabou\":0,\"picklock\":0}', 'Shop'),
('{\"identifier\":\"government\",\"name\":\"Government\"}', 11, 0, '{\"value\":31000000,\"forsale\":true}', '{\"pizza\":0,\"cheesebows\":0,\"radio\":0,\"water\":0,\"sprite\":0,\"lotteryticket\":0,\"chips\":0,\"fishingrod\":0,\"bread\":0,\"fanta\":0,\"burger\":0,\"marabou\":0,\"picklock\":0}', 'Shop'),
('{\"identifier\":\"government\",\"name\":\"Government\"}', 12, 0, '{\"value\":31000000,\"forsale\":true}', '{\"pizza\":0,\"cheesebows\":0,\"radio\":0,\"water\":0,\"sprite\":0,\"lotteryticket\":0,\"chips\":0,\"fishingrod\":0,\"bread\":0,\"fanta\":0,\"burger\":0,\"marabou\":0,\"picklock\":0}', 'Shop'),
('{\"identifier\":\"government\",\"name\":\"Government\"}', 13, 0, '{\"value\":31000000,\"forsale\":true}', '{\"pizza\":0,\"cheesebows\":0,\"radio\":0,\"water\":0,\"sprite\":0,\"lotteryticket\":0,\"chips\":0,\"fishingrod\":0,\"bread\":0,\"fanta\":0,\"burger\":0,\"marabou\":0,\"picklock\":0}', 'Shop'),
('{\"identifier\":\"steam:1100001410e55b4\",\"name\":\"Masiha Omidi\"}', 14, 0, '{\"value\":50,\"forsale\":true}', '{\"pizza\":0,\"cheesebows\":0,\"radio\":0,\"water\":0,\"sprite\":0,\"lotteryticket\":0,\"chips\":0,\"fishingrod\":0,\"bread\":0,\"fanta\":0,\"burger\":0,\"marabou\":0,\"picklock\":0}', 'masiha'),
('{\"identifier\":\"government\",\"name\":\"Government\"}', 15, 0, '{\"value\":31000000,\"forsale\":true}', '{\"pizza\":0,\"cheesebows\":0,\"radio\":0,\"water\":0,\"sprite\":0,\"lotteryticket\":0,\"chips\":0,\"fishingrod\":0,\"bread\":0,\"fanta\":0,\"burger\":0,\"marabou\":0,\"picklock\":0}', 'Shop'),
('{\"identifier\":\"government\",\"name\":\"Government\"}', 16, 0, '{\"value\":31000000,\"forsale\":true}', '{\"pizza\":0,\"cheesebows\":0,\"radio\":0,\"water\":0,\"sprite\":0,\"lotteryticket\":0,\"chips\":0,\"fishingrod\":0,\"bread\":0,\"fanta\":0,\"burger\":0,\"marabou\":0,\"picklock\":0}', 'Shop'),
('{\"identifier\":\"government\",\"name\":\"Government\"}', 17, 0, '{\"value\":31000000,\"forsale\":true}', '{\"pizza\":0,\"cheesebows\":0,\"radio\":0,\"water\":0,\"sprite\":0,\"lotteryticket\":0,\"chips\":0,\"fishingrod\":0,\"bread\":0,\"fanta\":0,\"burger\":0,\"marabou\":0,\"picklock\":0}', 'Shop'),
('{\"identifier\":\"government\",\"name\":\"Government\"}', 18, 0, '{\"value\":31000000,\"forsale\":true}', '{\"pizza\":0,\"cheesebows\":0,\"radio\":0,\"water\":0,\"sprite\":0,\"lotteryticket\":0,\"chips\":0,\"fishingrod\":0,\"bread\":0,\"fanta\":0,\"burger\":0,\"marabou\":0,\"picklock\":0}', 'Shop'),
('{\"identifier\":\"steam:110000148adfa01\",\"name\":\"Arman Mohebrad\"}', 19, 0, '{\"forsale\":false,\"value\":31000000}', '{\"pizza\":0,\"cheesebows\":0,\"radio\":0,\"water\":0,\"sprite\":0,\"lotteryticket\":0,\"chips\":0,\"fishingrod\":0,\"bread\":0,\"fanta\":0,\"burger\":0,\"marabou\":0,\"picklock\":0}', 'ADLER');

-- --------------------------------------------------------

--
-- Table structure for table `owned_vehicles`
--

CREATE TABLE `owned_vehicles` (
  `owner` varchar(30) COLLATE utf8_persian_ci NOT NULL,
  `plate` varchar(12) COLLATE utf8_persian_ci NOT NULL,
  `vehicle` longtext COLLATE utf8_persian_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_persian_ci NOT NULL DEFAULT 'car',
  `stored` tinyint(1) NOT NULL DEFAULT 0,
  `job` varchar(20) COLLATE utf8_persian_ci DEFAULT NULL,
  `lasthouse` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `owned_vehicles`
--

INSERT INTO `owned_vehicles` (`owner`, `plate`, `vehicle`, `type`, `stored`, `job`, `lasthouse`) VALUES
('steam:110000148adfa01', 'IXVI1009', '{\"neonColor\":[255,0,255],\"color1\":43,\"modRoof\":-1,\"modHood\":-1,\"tyreSmokeColor\":[255,255,255],\"modEngine\":-1,\"modTrunk\":-1,\"modFrame\":-1,\"modAirFilter\":-1,\"modPlateHolder\":-1,\"plateIndex\":0,\"modSpoilers\":-1,\"wheelColor\":0,\"modTurbo\":false,\"modDashboard\":-1,\"modVanityPlate\":-1,\"modBrakes\":-1,\"pearlescentColor\":35,\"modDial\":-1,\"model\":-1149725334,\"modRightFender\":-1,\"health\":972,\"modSeats\":-1,\"modArchCover\":-1,\"windowTint\":-1,\"modTrimA\":-1,\"modHorns\":-1,\"modSmokeEnabled\":1,\"modSideSkirt\":-1,\"modOrnaments\":-1,\"modAPlate\":-1,\"modTrimB\":-1,\"neonEnabled\":[false,false,false,false],\"modExhaust\":-1,\"modWindows\":-1,\"modLivery\":-1,\"modDoorSpeaker\":-1,\"wheels\":7,\"modSuspension\":-1,\"modFrontBumper\":-1,\"modEngineBlock\":-1,\"modStruts\":-1,\"modTank\":-1,\"color2\":43,\"plate\":\"IXVI1009\",\"dirtLevel\":4.22649335861206,\"modGrille\":-1,\"modSpeakers\":-1,\"modFender\":-1,\"modAerials\":-1,\"modFrontWheels\":-1,\"modTransmission\":-1,\"modShifterLeavers\":-1,\"modSteeringWheel\":-1,\"modArmor\":-1,\"modBackWheels\":-1,\"modRearBumper\":-1,\"modXenon\":1,\"modHydrolic\":-1}', 'car', 1, NULL, 0),
('steam:110000148adfa01', 'UAMC8872', '{\"modAerials\":-1,\"modRearBumper\":-1,\"modSmokeEnabled\":false,\"color2\":134,\"modFender\":-1,\"modEngine\":-1,\"modTrimA\":-1,\"pearlescentColor\":0,\"modHood\":-1,\"modFrame\":-1,\"modSteeringWheel\":-1,\"modDial\":-1,\"modSpeakers\":-1,\"modStruts\":-1,\"modArchCover\":-1,\"modXenon\":1,\"modEngineBlock\":-1,\"modRightFender\":-1,\"neonColor\":[255,0,255],\"wheels\":1,\"modRoof\":-1,\"modLivery\":-1,\"plateIndex\":4,\"modHydrolic\":-1,\"modSpoilers\":-1,\"modFrontWheels\":-1,\"wheelColor\":156,\"windowTint\":-1,\"model\":2046537925,\"modTrimB\":-1,\"modDashboard\":-1,\"neonEnabled\":[false,false,false,false],\"modTrunk\":-1,\"health\":1000,\"modTurbo\":false,\"plate\":\"UAMC8872\",\"modShifterLeavers\":-1,\"tyreSmokeColor\":[255,255,255],\"dirtLevel\":3.00651478767395,\"modAirFilter\":-1,\"modTank\":-1,\"color1\":134,\"modSeats\":-1,\"modGrille\":-1,\"modHorns\":-1,\"modDoorSpeaker\":-1,\"modSideSkirt\":-1,\"modVanityPlate\":-1,\"modBackWheels\":-1,\"modExhaust\":-1,\"modWindows\":-1,\"modArmor\":-1,\"modTransmission\":-1,\"modPlateHolder\":-1,\"modBrakes\":-1,\"modFrontBumper\":-1,\"modSuspension\":-1,\"modAPlate\":-1,\"modOrnaments\":-1}', 'car', 1, NULL, 0),
('steam:110000148adfa01', 'ZNFK7165', '{\"color1\":64,\"modRightFender\":-1,\"modFrame\":-1,\"modSpoilers\":-1,\"modSuspension\":-1,\"modSmokeEnabled\":false,\"modArchCover\":-1,\"modTurbo\":false,\"modRoof\":-1,\"modBrakes\":-1,\"modFender\":-1,\"windowTint\":-1,\"modSpeakers\":-1,\"modFrontWheels\":-1,\"plate\":\"ZNFK7165\",\"wheelColor\":0,\"model\":-1848994066,\"modOrnaments\":-1,\"modDoorSpeaker\":-1,\"modHorns\":-1,\"modHood\":-1,\"modTank\":-1,\"color2\":0,\"modGrille\":-1,\"modDashboard\":-1,\"modSeats\":-1,\"modTrimB\":-1,\"modExhaust\":-1,\"modDial\":-1,\"modAerials\":-1,\"modBackWheels\":-1,\"modStruts\":-1,\"neonColor\":[255,0,255],\"modRearBumper\":-1,\"modWindows\":-1,\"modSideSkirt\":-1,\"modTransmission\":-1,\"modSteeringWheel\":-1,\"modHydrolic\":-1,\"modShifterLeavers\":-1,\"modLivery\":-1,\"modTrimA\":-1,\"modVanityPlate\":-1,\"neonEnabled\":[false,false,false,false],\"modAirFilter\":-1,\"wheels\":0,\"plateIndex\":0,\"pearlescentColor\":73,\"health\":1000,\"modXenon\":1,\"modAPlate\":-1,\"modEngine\":-1,\"modFrontBumper\":-1,\"tyreSmokeColor\":[255,255,255],\"modEngineBlock\":-1,\"dirtLevel\":4.01176643371582,\"modArmor\":-1,\"modTrunk\":-1,\"modPlateHolder\":-1}', 'car', 1, NULL, 0),
('steam:110000145d1e773', '25', '{\"color1\":0,\"modRightFender\":-1,\"modFrame\":-1,\"modSpoilers\":-1,\"modSuspension\":-1,\"modSmokeEnabled\":false,\"modArchCover\":-1,\"modTurbo\":false,\"modRoof\":-1,\"modDoorSpeaker\":-1,\"modFender\":-1,\"windowTint\":-1,\"modSpeakers\":-1,\"modFrontWheels\":-1,\"modArmor\":-1,\"wheelColor\":112,\"model\":86520421,\"modOrnaments\":-1,\"health\":943,\"modHorns\":-1,\"modHood\":-1,\"modTank\":-1,\"modBrakes\":-1,\"modGrille\":-1,\"modFrontBumper\":-1,\"modSeats\":-1,\"modDashboard\":-1,\"modExhaust\":-1,\"modDial\":-1,\"modAerials\":-1,\"modBackWheels\":-1,\"color2\":4,\"neonColor\":[255,0,255],\"modRearBumper\":-1,\"modWindows\":-1,\"modSideSkirt\":-1,\"modTransmission\":-1,\"modSteeringWheel\":-1,\"plateIndex\":0,\"modShifterLeavers\":-1,\"modLivery\":-1,\"modStruts\":-1,\"modVanityPlate\":-1,\"neonEnabled\":[false,false,false,false],\"modAirFilter\":-1,\"wheels\":6,\"modTrimA\":-1,\"pearlescentColor\":5,\"modHydrolic\":-1,\"modXenon\":1,\"modAPlate\":-1,\"modEngine\":-1,\"modPlateHolder\":-1,\"tyreSmokeColor\":[255,255,255],\"modEngineBlock\":-1,\"dirtLevel\":8.40484619140625,\"plate\":\"25\",\"modTrunk\":-1,\"modTrimB\":-1}', 'car', 1, NULL, 0),
('steam:110000148adfa01', 'ULMO6290', '{\"neonColor\":[255,0,255],\"color1\":64,\"modRoof\":-1,\"modHood\":-1,\"tyreSmokeColor\":[255,255,255],\"modEngine\":1,\"modTrunk\":-1,\"modFrame\":-1,\"modAirFilter\":-1,\"modPlateHolder\":-1,\"plateIndex\":0,\"modSpoilers\":-1,\"wheelColor\":0,\"modTurbo\":false,\"modDashboard\":-1,\"modVanityPlate\":-1,\"modBrakes\":-1,\"pearlescentColor\":73,\"modDial\":-1,\"model\":-1848994066,\"modRightFender\":-1,\"health\":1000,\"modSeats\":-1,\"modArchCover\":-1,\"windowTint\":-1,\"modTrimA\":-1,\"modHorns\":-1,\"modSmokeEnabled\":1,\"modSideSkirt\":-1,\"modOrnaments\":-1,\"modAPlate\":-1,\"modTrimB\":-1,\"neonEnabled\":[false,false,false,false],\"modExhaust\":-1,\"modWindows\":-1,\"modLivery\":-1,\"modDoorSpeaker\":-1,\"wheels\":0,\"modSuspension\":-1,\"modFrontBumper\":-1,\"modEngineBlock\":-1,\"modStruts\":-1,\"modTank\":-1,\"color2\":0,\"plate\":\"ULMO6290\",\"dirtLevel\":4.08911323547363,\"modGrille\":-1,\"modSpeakers\":-1,\"modFender\":-1,\"modAerials\":-1,\"modFrontWheels\":-1,\"modTransmission\":-1,\"modShifterLeavers\":-1,\"modSteeringWheel\":-1,\"modArmor\":-1,\"modBackWheels\":-1,\"modRearBumper\":-1,\"modXenon\":1,\"modHydrolic\":-1}', 'car', 1, NULL, 0),
('steam:110000145d1e773', '1385', '{\"modEngineBlock\":-1,\"modGrille\":-1,\"modHorns\":-1,\"modTransmission\":-1,\"modTurbo\":false,\"plate\":\"1385\",\"modAPlate\":-1,\"modHood\":-1,\"modRoof\":-1,\"wheelColor\":0,\"neonEnabled\":[false,false,false,false],\"health\":1000,\"modOrnaments\":-1,\"modSeats\":-1,\"modRightFender\":-1,\"modFrame\":-1,\"modDoorSpeaker\":-1,\"plateIndex\":0,\"modSuspension\":-1,\"modArchCover\":-1,\"modWindows\":-1,\"modSpoilers\":-1,\"wheels\":0,\"modTank\":-1,\"modSideSkirt\":-1,\"modSmokeEnabled\":false,\"modStruts\":-1,\"modSpeakers\":-1,\"windowTint\":-1,\"color1\":64,\"modArmor\":-1,\"modDial\":-1,\"modFrontBumper\":-1,\"neonColor\":[255,0,255],\"modTrimB\":-1,\"modTrunk\":-1,\"modTrimA\":-1,\"modSteeringWheel\":-1,\"modAerials\":-1,\"modPlateHolder\":-1,\"modRearBumper\":-1,\"tyreSmokeColor\":[255,255,255],\"modShifterLeavers\":-1,\"color2\":0,\"modFender\":-1,\"pearlescentColor\":73,\"modDashboard\":-1,\"modBrakes\":-1,\"modXenon\":1,\"modBackWheels\":-1,\"dirtLevel\":3.00000214576721,\"model\":-1848994066,\"modExhaust\":-1,\"modAirFilter\":-1,\"modFrontWheels\":-1,\"modEngine\":-1,\"modLivery\":-1,\"modHydrolic\":-1,\"modVanityPlate\":-1}', 'car', 1, NULL, 0),
('steam:110000148adfa01', 'QWMN5838', '{\"modSideSkirt\":-1,\"modArchCover\":-1,\"model\":-1848994066,\"modDashboard\":-1,\"modFrame\":-1,\"modRearBumper\":-1,\"modAPlate\":-1,\"modArmor\":-1,\"dirtLevel\":1.00001049041748,\"modPlateHolder\":-1,\"modSmokeEnabled\":false,\"wheelColor\":0,\"modGrille\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"modShifterLeavers\":-1,\"health\":1000,\"modHood\":-1,\"modSpoilers\":-1,\"modTrimA\":-1,\"color2\":0,\"modVanityPlate\":-1,\"modStruts\":-1,\"modXenon\":false,\"modFrontBumper\":-1,\"plate\":\"QWMN5838\",\"modExhaust\":-1,\"plateIndex\":0,\"modTransmission\":-1,\"modFrontWheels\":-1,\"modTrunk\":-1,\"modSeats\":-1,\"color1\":111,\"modBrakes\":-1,\"modSpeakers\":-1,\"neonColor\":[255,0,255],\"modRightFender\":-1,\"modEngine\":-1,\"modFender\":-1,\"modLivery\":-1,\"modHorns\":-1,\"wheels\":0,\"modOrnaments\":-1,\"modDial\":-1,\"neonEnabled\":[false,false,false,false],\"modHydrolic\":-1,\"modDoorSpeaker\":-1,\"modSuspension\":-1,\"tyreSmokeColor\":[255,255,255],\"modEngineBlock\":-1,\"modSteeringWheel\":-1,\"modTrimB\":-1,\"modTank\":-1,\"modRoof\":-1,\"modAerials\":-1,\"modBackWheels\":-1,\"modWindows\":-1,\"pearlescentColor\":111,\"windowTint\":-1}', 'car', 1, NULL, 0),
('steam:110000148adfa01', 'LXRE8503', '{\"modSideSkirt\":-1,\"modArchCover\":-1,\"model\":-1848994066,\"modDashboard\":-1,\"modFrame\":-1,\"modRearBumper\":-1,\"modAPlate\":-1,\"modArmor\":-1,\"dirtLevel\":2.00001144409179,\"modPlateHolder\":-1,\"modSmokeEnabled\":false,\"wheelColor\":0,\"modGrille\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"modShifterLeavers\":-1,\"health\":1000,\"modHood\":-1,\"modSpoilers\":-1,\"modTrimA\":-1,\"color2\":1,\"modVanityPlate\":-1,\"modStruts\":-1,\"modXenon\":false,\"modFrontBumper\":-1,\"plate\":\"LXRE8503\",\"modExhaust\":-1,\"plateIndex\":0,\"modTransmission\":-1,\"modFrontWheels\":-1,\"modTrunk\":-1,\"modSeats\":-1,\"color1\":0,\"modBrakes\":-1,\"modSpeakers\":-1,\"neonColor\":[255,0,255],\"modRightFender\":-1,\"modEngine\":-1,\"modFender\":-1,\"modLivery\":-1,\"modHorns\":-1,\"wheels\":0,\"modOrnaments\":-1,\"modDial\":-1,\"neonEnabled\":[false,false,false,false],\"modHydrolic\":-1,\"modDoorSpeaker\":-1,\"modSuspension\":-1,\"tyreSmokeColor\":[255,255,255],\"modEngineBlock\":-1,\"modSteeringWheel\":-1,\"modTrimB\":-1,\"modTank\":-1,\"modRoof\":-1,\"modAerials\":-1,\"modBackWheels\":-1,\"modWindows\":-1,\"pearlescentColor\":2,\"windowTint\":-1}', 'car', 1, NULL, 0),
('steam:110000148adfa01', 'LYNO3839', '{\"modSideSkirt\":-1,\"modArchCover\":-1,\"model\":-1848994066,\"modDashboard\":-1,\"modFrame\":-1,\"modRearBumper\":-1,\"modAPlate\":-1,\"modArmor\":-1,\"dirtLevel\":0.0001275173854,\"modPlateHolder\":-1,\"modSmokeEnabled\":false,\"wheelColor\":0,\"modGrille\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"modShifterLeavers\":-1,\"health\":1000,\"modHood\":-1,\"modSpoilers\":-1,\"modTrimA\":-1,\"color2\":1,\"modVanityPlate\":-1,\"modStruts\":-1,\"modXenon\":1,\"modFrontBumper\":-1,\"plate\":\"LYNO3839\",\"modExhaust\":-1,\"plateIndex\":0,\"modTransmission\":-1,\"modFrontWheels\":-1,\"modTrunk\":-1,\"modSeats\":-1,\"color1\":89,\"modBrakes\":-1,\"modSpeakers\":-1,\"neonColor\":[255,0,255],\"modRightFender\":-1,\"modEngine\":-1,\"modFender\":-1,\"modLivery\":-1,\"modHorns\":-1,\"wheels\":0,\"modOrnaments\":-1,\"modDial\":-1,\"neonEnabled\":[false,false,false,false],\"modHydrolic\":-1,\"modDoorSpeaker\":-1,\"modSuspension\":-1,\"tyreSmokeColor\":[255,255,255],\"modEngineBlock\":-1,\"modSteeringWheel\":-1,\"modTrimB\":-1,\"modTank\":-1,\"modRoof\":-1,\"modAerials\":-1,\"modBackWheels\":-1,\"modWindows\":-1,\"pearlescentColor\":2,\"windowTint\":-1}', 'car', 1, NULL, 0),
('steam:110000148adfa01', 'PQGH1067', '{\"modSideSkirt\":-1,\"modArchCover\":-1,\"model\":-1848994066,\"modDashboard\":-1,\"modFrame\":-1,\"modRearBumper\":-1,\"modAPlate\":-1,\"modArmor\":-1,\"dirtLevel\":0.00543604651466,\"modPlateHolder\":-1,\"modSmokeEnabled\":false,\"wheelColor\":0,\"modGrille\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"modShifterLeavers\":-1,\"health\":1000,\"modHood\":-1,\"modSpoilers\":-1,\"modTrimA\":-1,\"color2\":0,\"modVanityPlate\":-1,\"modStruts\":-1,\"modXenon\":1,\"modFrontBumper\":-1,\"plate\":\"PQGH1067\",\"modExhaust\":-1,\"plateIndex\":0,\"modTransmission\":-1,\"modFrontWheels\":-1,\"modTrunk\":-1,\"modSeats\":-1,\"color1\":64,\"modBrakes\":-1,\"modSpeakers\":-1,\"neonColor\":[255,0,255],\"modRightFender\":-1,\"modEngine\":-1,\"modFender\":-1,\"modLivery\":-1,\"modHorns\":-1,\"wheels\":0,\"modOrnaments\":-1,\"modDial\":-1,\"neonEnabled\":[false,false,false,false],\"modHydrolic\":-1,\"modDoorSpeaker\":-1,\"modSuspension\":-1,\"tyreSmokeColor\":[255,255,255],\"modEngineBlock\":-1,\"modSteeringWheel\":-1,\"modTrimB\":-1,\"modTank\":-1,\"modRoof\":-1,\"modAerials\":-1,\"modBackWheels\":-1,\"modWindows\":-1,\"pearlescentColor\":73,\"windowTint\":-1}', 'car', 1, NULL, 0),
('steam:110000148adfa01', 'JTKV8359', '{\"modSideSkirt\":-1,\"modEngine\":-1,\"plateIndex\":0,\"modDial\":-1,\"dirtLevel\":1.00000083446502,\"modFrame\":-1,\"modRightFender\":-1,\"neonColor\":[255,0,255],\"modSteeringWheel\":-1,\"modOrnaments\":-1,\"modFrontBumper\":-1,\"modSuspension\":-1,\"modWindows\":-1,\"modExhaust\":-1,\"modArmor\":-1,\"modShifterLeavers\":-1,\"modBackWheels\":-1,\"modVanityPlate\":-1,\"modTrimA\":-1,\"modPlateHolder\":-1,\"pearlescentColor\":73,\"modTrimB\":-1,\"modFender\":-1,\"color2\":0,\"neonEnabled\":[false,false,false,false],\"modSpeakers\":-1,\"modBrakes\":-1,\"modAirFilter\":-1,\"health\":1000,\"modHorns\":-1,\"modStruts\":-1,\"tyreSmokeColor\":[255,255,255],\"modDashboard\":-1,\"color1\":64,\"modFrontWheels\":-1,\"modGrille\":-1,\"modDoorSpeaker\":-1,\"modAerials\":-1,\"model\":-1848994066,\"modSeats\":-1,\"modRoof\":-1,\"windowTint\":-1,\"modXenon\":1,\"modTrunk\":-1,\"wheelColor\":0,\"modHood\":-1,\"modSpoilers\":-1,\"modEngineBlock\":-1,\"modTank\":-1,\"modRearBumper\":-1,\"wheels\":0,\"modSmokeEnabled\":false,\"modAPlate\":-1,\"plate\":\"JTKV8359\",\"modTurbo\":false,\"modHydrolic\":-1,\"modArchCover\":-1,\"modLivery\":-1,\"modTransmission\":-1}', 'car', 1, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `owned_vehicles_headlights`
--

CREATE TABLE `owned_vehicles_headlights` (
  `id` int(11) NOT NULL,
  `plate` text NOT NULL,
  `color` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `owned_vehicles_headlights`
--

INSERT INTO `owned_vehicles_headlights` (`id`, `plate`, `color`) VALUES
(1, '65TDJ308', 4),
(2, '25JCQ441', 4),
(3, 'PKFQ5661', 4),
(4, 'WHIB3407', 1),
(5, 'VCLP6067', 4),
(6, '24KMJ960', 4),
(7, '40LFS204', 4),
(8, '05YAC799', 8),
(9, '64OPO130', 11),
(10, '04RKF985', 8),
(11, 'ULMO6290', 8),
(12, '67AML202', 10),
(13, '82IDV041', 7),
(14, '03DJK816', 4),
(15, '49PDF411', 4),
(16, 'QWMN5838', 10),
(17, 'LXRE8503', 3);

-- --------------------------------------------------------

--
-- Table structure for table `phone_app_chat`
--

CREATE TABLE `phone_app_chat` (
  `id` int(11) NOT NULL,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phone_app_chat`
--

INSERT INTO `phone_app_chat` (`id`, `channel`, `message`, `time`) VALUES
(28, 'gun', 'hello', '2020-04-19 22:47:23'),
(29, 'gun', 'xd', '2020-04-19 22:47:31'),
(30, 'gun', 'bia', '2020-04-19 22:47:37'),
(31, 'gun', 'berim kun bokonim', '2020-04-19 22:47:43'),
(32, 'gun', 'bruh', '2020-04-19 22:47:50'),
(33, 'mh', 'salam', '2020-04-21 20:36:23'),
(34, 'levi', 'SucK', '2020-04-22 06:53:45'),
(35, 'ah', 'kasi hast???', '2020-04-24 13:11:18'),
(36, 'saman', 'salam', '2020-04-26 00:37:25'),
(37, 'amirfn', 'salam', '2020-04-26 00:37:51'),
(38, 'sd', 'sdf', '2020-04-26 07:29:15'),
(39, 'foxteam', 'Fuck off', '2020-05-01 11:11:17'),
(40, 'foxteam', 'ali bebin ka kard !?', '2020-05-01 11:11:29'),
(41, 'mafia', 's', '2020-05-03 20:51:07'),
(42, 'mafia', 'salam be hamge', '2020-05-03 20:51:16'),
(43, 'df', 'sda', '2020-05-03 23:31:33'),
(44, 'test', 'hello', '2020-05-06 12:25:23'),
(45, 'policedepatment', '0939', '2020-05-07 00:15:17'),
(46, 'policedepatment', '0939945059', '2020-05-07 00:15:26'),
(47, 'policedepatment', 'tomy', '2020-05-07 00:15:40'),
(48, 'azwolf', 'salam', '2020-05-07 11:36:37'),
(49, 'aznwolf', 'az', '2020-05-07 11:36:57'),
(50, 'e', 'e', '2020-05-10 00:52:42'),
(51, 'energy', 's', '2020-05-10 07:41:58'),
(52, 'energy', 'lm', '2020-05-10 23:52:52'),
(53, 'badboys', 'slam', '2020-05-11 05:18:43'),
(54, 'badboys', 'slam', '2020-05-11 05:18:44'),
(55, 'energy', 'salam kase hast??', '2020-05-12 02:03:34'),
(56, 'energy', 'badansaz', '2020-05-12 19:45:19'),
(57, 'o', 'gg', '2020-05-28 19:20:07'),
(58, 'smgmikham', 'smg mikham kasi nadare', '2020-05-30 05:47:09'),
(59, 'smgmikham', 'slm kasi smg mifroshe', '2020-06-01 14:34:31'),
(60, 'smgmikham', '?', '2020-06-01 14:34:34'),
(61, 'bazo', 'slm', '2020-06-01 21:57:47'),
(62, 'bazo', 'salam amer damagh', '2020-06-01 22:05:36'),
(63, 'energy', 's', '2020-06-04 06:17:56'),
(64, 'energy', 's', '2020-06-04 06:17:59'),
(65, 'energy', 's', '2020-06-04 06:18:01'),
(66, 'hello', 'salam', '2020-06-05 08:57:43'),
(67, 'chat', 'hey', '2020-06-06 09:04:20'),
(68, 'sherif', 'sdfg', '2020-06-06 11:31:03'),
(69, 'shf', 'slm', '2020-06-06 11:31:15'),
(70, 'sheriff', 'salam', '2020-06-06 11:31:31'),
(71, 'sheriff', 'gostakh', '2020-06-06 11:31:47'),
(72, 'sheriff', 'slm', '2020-06-06 11:31:47'),
(73, 'shriff', '123', '2020-06-06 11:31:49'),
(74, 'sheriff', '123', '2020-06-06 11:32:19'),
(75, 'sheriff', 'inja okeye?', '2020-06-06 12:41:38'),
(76, 'sheriff', '???', '2020-06-06 12:41:43'),
(77, 's', 's', '2020-06-06 20:30:26'),
(78, 'oo', 'mcnici ba takhfifi vije', '2020-06-06 22:35:47'),
(79, 'taximans', 'bmd', '2020-06-07 11:06:04'),
(80, 'fuckthepolice', 'sasda', '2020-06-09 20:42:05'),
(81, 'ballas', 'SLam', '2020-06-13 17:19:09'),
(82, 'ballas', 'Baaaah', '2020-06-13 17:19:19'),
(83, 'secret', 'salam', '2020-06-14 18:37:38'),
(84, 'gangforhame', 'chetorin', '2020-06-15 14:19:03'),
(85, 'sa', 'slm', '2020-06-16 17:54:36'),
(86, 'sa', 'amir', '2020-06-16 21:44:45'),
(87, 'sinaghaf', 'salam', '2020-06-17 13:06:27'),
(88, 'siktirchat', 'siktir chat', '2020-07-04 11:19:46'),
(89, 'siktirchat', 'SALAM', '2020-07-04 11:20:00'),
(90, 'siktirchat', 'kirrrrrrrrrrrrr', '2020-07-05 22:14:19'),
(91, 'siktirchat', 'feghat kashoo', '2020-07-05 22:14:33'),
(92, 'siktirchat', 'siktir chat', '2020-07-06 18:58:25'),
(93, 'aa', 'salam', '2020-07-13 13:20:32'),
(94, 'aa', '1111', '2020-07-13 13:20:40'),
(95, 'khantaqi', 'salam', '2020-07-16 10:07:04'),
(96, 'khantaqi', 'salam khedmat shoma dostan aziz', '2020-07-16 10:07:25'),
(97, 'konia', 'SALAM KONIA', '2020-07-20 14:17:32'),
(98, 'venomous', 'k', '2020-07-20 17:28:05'),
(99, 'a', 'tof tof kerak moft', '2020-07-20 19:12:55'),
(100, 'joon', 'SALAM', '2020-07-20 22:47:29'),
(101, 'm', 'SLM', '2020-07-24 13:44:09'),
(102, 'parsaravandel', 'salam', '2020-07-26 13:20:14'),
(103, 'miladi', 'salam', '2020-07-29 20:59:38'),
(104, 'nema', 'salam', '2020-08-05 02:13:56'),
(105, 'fakes', 'helllo', '2020-08-05 04:43:11'),
(106, 'mafia', 'sdsa', '2020-08-05 08:27:10'),
(107, 'mafia', 'salam', '2020-08-05 08:28:03'),
(108, 'mafia', 'slm', '2020-08-05 08:28:08'),
(109, 'mafia', 'khosh omadam', '2020-08-05 08:28:15'),
(110, 'mafia', 'bale', '2020-08-05 08:28:21'),
(111, 'mafia', 'mnm', '2020-08-05 08:28:51'),
(112, 'mafia', 'salam', '2020-08-05 08:29:01'),
(113, 'mafia', 'shab shode porstare', '2020-08-05 08:29:03'),
(114, 'mafia', 'usf slm', '2020-08-05 08:29:04'),
(115, 'mafia', 'cheshmak bezn dobare', '2020-08-05 08:29:14'),
(116, 'mafia', 'SALAMM', '2020-08-05 08:29:15'),
(117, 'mafia', 'aqe gofti mn kiam', '2020-08-05 08:29:22'),
(118, 'mafia', 'MAFIAAAAAAAAAAAAAAAAAAAAAAAAAA', '2020-08-05 08:29:28'),
(119, 'mafia', 'hey', '2020-08-05 08:29:37'),
(120, 'mafia', 'mn goz darm', '2020-08-05 08:29:41'),
(121, 'mafia', 'hellp', '2020-08-05 08:29:41'),
(122, 'mafia', 'HAMATONO LOH MIDAM', '2020-08-05 08:29:43'),
(123, 'mafia', 'GPS BEDID', '2020-08-05 08:29:47'),
(124, 'mafia', 'be ki', '2020-08-05 08:29:53'),
(125, 'mafia', 'u3f nob sage', '2020-08-05 08:29:55'),
(126, 'mafia', 'bedam', '2020-08-05 08:29:56'),
(127, 'mafia', 'BE KHODAM', '2020-08-05 08:29:58'),
(128, 'mafia', 'babat noob sage', '2020-08-05 08:30:03'),
(129, 'mafia', 'doroste', '2020-08-05 08:30:03'),
(130, 'mafia', 'dayooos', '2020-08-05 08:30:13'),
(131, 'mafia', 'noob sag XD', '2020-08-05 08:30:14'),
(132, 'mafia', 'BOSAM KONID', '2020-08-05 08:30:15'),
(133, 'mafia', 'hi beach', '2020-08-05 08:30:16'),
(134, 'mafia', 'blz be chokh raft', '2020-08-05 08:30:21'),
(135, 'mafia', ':D', '2020-08-05 08:30:25'),
(136, 'mafia', ':D', '2020-08-05 08:30:28'),
(137, 'mafia', 'stream nmiaeed XD\\', '2020-08-05 08:30:33'),
(138, 'mafia', 'fuck mafia', '2020-08-05 08:30:42'),
(139, 'mafia', 'BLZ CHERA BE CHOKH RAFT ?', '2020-08-05 08:30:43'),
(140, 'mafia', 'ridid', '2020-08-05 08:30:44'),
(141, 'mafia', 'fosh gozashtam bara paiini', '2020-08-05 08:30:48'),
(142, 'mafia', 'sar ye seri dastana', '2020-08-05 08:30:58'),
(143, 'mafia', 'usef kheili shakh shide chat', '2020-08-05 08:31:23'),
(144, 'mafia', ':D', '2020-08-05 08:31:41'),
(145, 'mafia', 'babayaga companysh kharabe', '2020-08-05 08:31:41'),
(146, 'mafia', 'shakhaie majazzi', '2020-08-05 08:31:43'),
(147, 'mafia', 'maro dor nandaz u3f', '2020-08-05 08:31:52'),
(148, 'mafia', 'ali jonoooooooooo', '2020-08-05 08:32:17'),
(149, 'mafia', 'alireza shabi jhony shode', '2020-08-05 08:32:36'),
(150, 'mafia', 'you 3 f #delvan', '2020-08-05 08:32:41'),
(151, 'mafia', 'hey bitch', '2020-08-05 08:32:42'),
(152, 'mafia', 'usf asl bde', '2020-08-05 08:32:43'),
(153, 'mafia', 'dayoos', '2020-08-05 08:32:51'),
(154, 'mafia', '/bring 145', '2020-08-05 08:33:05'),
(155, 'mafia', 'salam', '2020-08-05 08:33:18'),
(156, 'mafia', 'MN KON MIKHAM', '2020-08-05 08:33:20'),
(157, 'mafia', 'asl bedin donbal konam', '2020-08-05 08:33:21'),
(158, 'mafia', 'tamom kardim', '2020-08-05 08:33:45'),
(159, 'mafia', 'KOOOOOOON', '2020-08-05 08:33:47'),
(160, 'mafia', 'man dick mikham', '2020-08-05 08:33:47'),
(161, 'mafia', 'kooooooooon', '2020-08-05 08:33:55'),
(162, 'mafia', 'bediiiiiiiiiiin', '2020-08-05 08:33:59'),
(163, 'mafia', 'paiini khare', '2020-08-05 08:33:59'),
(164, 'mafia', 'koooooooooooooooooon', '2020-08-05 08:34:02'),
(165, 'mafia', 'KIR KI AZ HAME BOLAND TARE', '2020-08-05 08:34:19'),
(166, 'mafia', 'shab sa.at 3 davaaa', '2020-08-05 08:34:22'),
(167, 'mafia', 'pornhub.com', '2020-08-05 08:34:42'),
(168, 'mafia', 'BIA POSHT MADRESE', '2020-08-05 08:34:43'),
(169, 'mafia', 'lets gay', '2020-08-05 08:34:55'),
(170, 'mafia', 'khaye nadari', '2020-08-05 08:34:56'),
(171, 'mafia', 'zeid mikham', '2020-08-05 08:35:12'),
(172, 'mafia', 'harki dare biad dam dar', '2020-08-05 08:35:19'),
(173, 'mafia', 'baradaran zagraz . com', '2020-08-05 08:35:19'),
(174, 'mafia', 'mano dar youtube subscribe konid', '2020-08-05 08:35:21'),
(175, 'mafia', 'mn ye pesar mikham', '2020-08-05 08:35:27'),
(176, 'mafia', 'man yek streamer kooni am', '2020-08-05 08:35:42'),
(177, 'mafia', 'kon nabod ?', '2020-08-05 08:35:53'),
(178, 'mafia', 'khaye mali nakoninnnnnn', '2020-08-05 08:35:54'),
(179, 'mafia', 'salam koooni', '2020-08-05 08:35:56'),
(180, 'mafia', '1 bar koon = 500 k', '2020-08-05 08:36:12'),
(181, 'mafia', 'mn konma', '2020-08-05 08:36:18'),
(182, 'mafia', 'khaye mali nakon satar', '2020-08-05 08:36:21'),
(183, 'mafia', '1 subscribe = 1 koon', '2020-08-05 08:36:23'),
(184, 'mafia', 'kon khod ra be ma beseparid', '2020-08-05 08:36:31'),
(185, 'mafia', '1 koon = 1$', '2020-08-05 08:36:43'),
(186, 'mafia', 'age 10 t donate konid too aparat lokht misham', '2020-08-05 08:36:53'),
(187, 'mafia', 'kiaomin nistam', '2020-08-05 08:37:00'),
(188, 'mafia', 'daus mno kharab nkon', '2020-08-05 08:37:14'),
(189, 'mafia', 'lokht pashmi nmikhaym', '2020-08-05 08:37:15'),
(190, 'mafia', 'har ki j nade koonie', '2020-08-05 08:37:17'),
(191, 'mafia', 'paiini khare', '2020-08-05 08:37:39'),
(192, 'mafia', 'harki nage albaloo', '2020-08-05 08:37:50'),
(193, 'mafia', 'mn u3fam', '2020-08-05 08:37:53'),
(194, 'mafia', 'kon kon kon kon az hame rang', '2020-08-05 08:37:54'),
(195, 'mafia', 'man kooni am', '2020-08-05 08:38:01'),
(196, 'mafia', 'fuck me', '2020-08-05 08:38:21'),
(197, 'mafia', 'alireza is johnny sins', '2020-08-05 08:38:24'),
(198, 'mafia', 'man kiaomin koooni aaaam', '2020-08-05 08:38:45'),
(199, 'mafia', 'alireza ba in kalash che sexy shode', '2020-08-05 08:38:46'),
(200, 'mafia', 'fuck meeeeee', '2020-08-05 08:38:49'),
(201, 'mafia', 'ahhhhhhhhhhh', '2020-08-05 08:38:56'),
(202, 'mafia', 'offfffffffff', '2020-08-05 08:38:59'),
(203, 'mafia', 'man roo sattar crush daram', '2020-08-05 08:39:06'),
(204, 'mafia', 'mn kon mikhammmmm', '2020-08-05 08:39:07'),
(205, 'mafia', 'yeeeeeh', '2020-08-05 08:39:11'),
(206, 'mafia', 'bia koon bedam', '2020-08-05 08:39:18'),
(207, 'mafia', 'mn sattar ro mikham bokonaaaaaaammmmmmmmmmmmmm', '2020-08-05 08:39:20'),
(208, 'mafia', 'biaaaaaa', '2020-08-05 08:39:25'),
(209, 'mafia', 'omadam', '2020-08-05 08:39:34'),
(210, 'hanipink', 'SALAAAAAAAAAAAM', '2020-08-08 03:01:01'),
(211, 'mafia', 'bache khoshgel', '2020-08-11 07:27:30'),
(212, 'mafia', 'slm bekiram', '2020-08-11 07:28:10'),
(213, 'infinity', 'slm', '2020-08-13 22:00:06'),
(214, 'infinity', 'Slm', '2020-08-13 22:06:10'),
(215, 'infinity', 'kose amaton', '2020-08-13 22:06:14'),
(216, 'infinity', 'XD', '2020-08-13 22:06:20'),
(217, 'infinity', 'kiramam nistid', '2020-08-13 22:06:24'),
(218, 'infinity', 'noob', '2020-08-13 22:06:31'),
(219, 'infinity', 'namal', '2020-08-13 22:07:17'),
(220, 'infinity', 'kojayid biam', '2020-08-13 22:13:17'),
(221, 'infinity', 'tokhme saga ja mondammmm', '2020-08-14 00:28:14'),
(222, 'infinity', 'sety shomarat ro bde', '2020-08-14 22:49:13'),
(223, 'sgd', 'FG', '2020-08-15 00:13:50'),
(224, 'sgd', 'gr', '2020-08-15 00:13:53'),
(225, 'infinity', 's', '2020-08-17 21:22:59'),
(226, 'mamad', 'salaaaaaaaaaaam', '2020-08-27 15:00:36'),
(227, 'mechanic', 'hame bache khoshgla', '2020-08-30 19:02:17'),
(228, 'mechanic', 'fuck you all', '2020-08-30 19:03:07'),
(229, 'mechanic', 'farar konid', '2020-08-30 21:21:00'),
(230, 'selam', 'nabar', '2020-08-31 18:49:21'),
(231, 'siktirchat', 'hello siktir chati ha', '2020-09-02 19:44:56'),
(232, 'siktir', 'slm', '2020-09-03 15:22:35'),
(233, 'siktir', 'KIRRRRRRRRRRRRRRRRRRRRR', '2020-09-03 15:23:30'),
(234, 'siktir', 'kir khar', '2020-09-03 15:23:34'),
(235, 'siktir', 'KOSKESH KIRE KHAR SAVAR', '2020-09-03 15:23:48'),
(236, 'siktir', 'kirm dhn mehrbod', '2020-09-03 15:23:55'),
(237, 'siktir', 'KIR DHNE MRX', '2020-09-03 15:24:04'),
(238, 'siktir', 'kir tu dhnnnnn mrx', '2020-09-03 15:24:13'),
(239, 'mari', 'salam', '2020-09-04 09:58:17'),
(240, 'saghj', 'salam', '2020-09-04 10:43:59'),
(241, 'infinity', 'slm', '2020-09-04 14:09:20'),
(242, 'mechanic', '# Mechanic.', '2020-09-07 08:35:12'),
(243, 'azoblackmarket', 'Pistol 50 = 90000$', '2020-09-10 02:33:04'),
(244, 'azoblackmarket', 'Pistol = 40000$', '2020-09-10 02:33:24'),
(245, 'azoblackmarket', 'Combat Pistol = 70000$', '2020-09-10 02:33:40'),
(246, 'kos', 'Slm bache ha', '2020-09-15 20:28:44'),
(247, 'gardesh', 'salam', '2020-09-17 02:39:56'),
(248, 'gardesh', 'slm', '2020-09-17 02:40:53'),
(249, 'gardesh', 'sakam', '2020-09-17 02:40:59'),
(250, 'gardesh', 'slm mn mahiam', '2020-09-17 02:41:05'),
(251, 'gardesh', 'man asgharam', '2020-09-17 02:41:18'),
(252, 'gardesh', 'nokaram', '2020-09-17 17:02:59'),
(253, 'gardesh', 'gorgali vared mishavad', '2020-09-17 17:03:09'),
(254, 'gardesh', 'emshab barname nadarim ?', '2020-09-17 21:49:50'),
(255, 'taxi', 'taxi', '2020-09-17 22:08:42'),
(256, 'gardesh', 'bache barnameii nist?', '2020-09-18 01:06:56'),
(257, 'dads', 'dffd', '2020-09-19 06:46:29'),
(258, 'sat', 'salam', '2020-09-19 06:47:07'),
(259, 'sat', 'sat', '2020-09-19 06:47:18'),
(260, 'sat', 'hello', '2020-09-19 06:47:21'),
(261, 'sat', 'salam', '2020-09-19 06:47:24'),
(262, 'sat', 'welcome', '2020-09-19 06:47:25'),
(263, 'sat', 'lets goooo', '2020-09-19 06:47:32'),
(264, 'sat', 'haji che bahahle', '2020-09-19 06:47:41'),
(265, 'sat', 'fuck the bitches', '2020-09-19 06:47:42'),
(266, 'sat', 'yeee', '2020-09-19 06:47:47'),
(267, 'sat', 'areeee', '2020-09-19 06:47:50'),
(268, 'alikashi', '1', '2020-09-20 13:07:08'),
(269, 'alikashi', '2', '2020-09-20 13:07:10'),
(270, 'alikashi', '3', '2020-09-20 13:07:12'),
(271, 'sat', 'salam', '2020-09-20 19:10:32'),
(272, 'sat', 'hello', '2020-09-20 19:10:44'),
(273, 'sat', 'fsdf', '2020-09-20 19:10:45'),
(274, 'sat', 'fuck yuo', '2020-09-20 19:10:48'),
(275, 'sat', 'hello', '2020-09-20 19:10:52'),
(276, 'sat', '/;', '2020-09-20 19:10:54'),
(277, 'sat', 'salam', '2020-09-20 19:11:34'),
(278, 'sat', 'chetorid', '2020-09-20 19:11:42'),
(279, 'sat', 'fuck youuuuuuuuuuuuuuuu', '2020-09-20 19:11:47'),
(280, 'sat', 'fuck my asssssss', '2020-09-20 19:11:56'),
(281, 'sat', 'hellllllllllllllllllllllllllllllllllllllllloooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo', '2020-09-20 19:12:01'),
(282, 'sat', 'alooo', '2020-09-20 19:12:07'),
(283, 'sat', 'alo', '2020-09-20 19:12:11'),
(284, 'sat', 'alo', '2020-09-20 19:12:14'),
(285, 'sat', 'alo', '2020-09-20 19:12:15'),
(286, 'sat', 'alo', '2020-09-20 19:12:16'),
(287, 'sat', 'alo', '2020-09-20 19:12:18'),
(288, 'sat', 'alo', '2020-09-20 19:12:20'),
(289, 'sat', 'bye', '2020-09-20 19:12:22'),
(290, 'sat', 'aloo', '2020-09-20 19:12:23'),
(291, 'sat', 'byeeeee', '2020-09-20 19:12:25'),
(292, 'sat', 'byeeeeeeeeeeeeeeee', '2020-09-20 19:12:27'),
(293, 'sat', 'y', '2020-09-20 19:12:28'),
(294, 'sat', 'y', '2020-09-20 19:12:29'),
(295, 'sat', 'y', '2020-09-20 19:12:31'),
(296, 'sat', 'o', '2020-09-20 19:12:33'),
(297, 'sat', 'o', '2020-09-20 19:12:36'),
(298, 'sat', 'o', '2020-09-20 19:12:37'),
(299, 'sat', 'u', '2020-09-20 19:12:39'),
(300, 'sat', 'u', '2020-09-20 19:12:41'),
(301, 'sat', 'u', '2020-09-20 19:12:42'),
(302, 'sat', 's', '2020-09-20 19:12:44'),
(303, 'sat', 's', '2020-09-20 19:12:45'),
(304, 'sat', 's', '2020-09-20 19:12:47'),
(305, 'sat', 'e', '2020-09-20 19:12:48'),
(306, 'sat', 'e', '2020-09-20 19:12:50'),
(307, 'sat', 'e', '2020-09-20 19:12:51'),
(308, 'sat', 'f', '2020-09-20 19:12:52'),
(309, 'sat', 'f', '2020-09-20 19:12:54'),
(310, 'sat', 'f', '2020-09-20 19:12:55'),
(311, 'sat', ':)', '2020-09-20 19:13:04'),
(312, 'sat', 'sdasds', '2020-09-20 19:52:59'),
(313, 'aliver', 'salam', '2020-09-20 23:43:01'),
(314, 'aliver', 'salam', '2020-09-20 23:43:09'),
(315, 'blackgun', 'ksi hast gun mikham', '2020-09-21 00:04:41'),
(316, 'aliver', 'yaser yaser mamad', '2020-09-21 00:05:15'),
(317, 'aliver', 's', '2020-09-21 00:05:22'),
(318, 'aliver', 's', '2020-09-21 00:05:51'),
(319, 'aliver', 'miow', '2020-09-21 00:06:03'),
(320, 'aliver', 'SALAM', '2020-09-21 00:06:16'),
(321, 'aliver', 'MoZ', '2020-09-21 00:11:30'),
(322, 'aliver', 'freq?', '2020-09-21 19:42:06'),
(323, 'aliver', 'nade nade', '2020-09-21 19:42:12'),
(324, 'divass', 's', '2020-09-21 20:49:38'),
(325, 'divass', 's back', '2020-09-21 20:49:45'),
(326, 'aliver', 'kojaee', '2020-09-21 21:03:41'),
(327, 'aliver', 'ba hosin kar daram', '2020-09-21 21:03:52'),
(328, 'aliver', 'alo', '2020-09-21 21:05:14'),
(329, 'aliver', '?', '2020-09-21 21:05:29'),
(330, 'aliver', 'chekhe', '2020-09-21 21:06:16'),
(331, 'aliver', 'kojaee alan?', '2020-09-21 21:06:41'),
(332, 'aliver', 'haminjam', '2020-09-21 21:07:09'),
(333, 'aliver', 'mechanici', '2020-09-21 21:08:49'),
(334, 'sat', 'salam', '2020-09-21 22:35:55'),
(335, 'sat', 'rd', '2020-09-21 22:36:04'),
(336, 'aliver', 'mikham pare konin body cama ham roshan', '2020-09-22 05:54:26'),
(337, 'aliver', 'mashallah', '2020-09-22 05:54:33'),
(338, 'aliver', 'bachehaye jacky too shahran', '2020-09-22 22:09:01'),
(339, 'aliver', 'fk knm jacky oomade', '2020-09-22 22:42:23'),
(340, 'aliver', 'yekio didam', '2020-09-22 22:42:30'),
(341, 'aliver', 'khob nemitonim kari konim', '2020-09-22 22:42:35'),
(342, 'aliver', 'havaset bashe migam', '2020-09-22 22:42:50'),
(343, 'aliver', 'okeye khaliam', '2020-09-22 22:42:56'),
(344, 'aliver', 'lebaseshon chie hamon mask?w', '2020-09-22 22:45:19'),
(345, 'aliver', 're', '2020-09-22 22:45:40'),
(346, 'aliver', 'radio chande?', '2020-09-24 19:28:23'),
(347, 'aliver', '?', '2020-09-24 19:28:26'),
(348, 'aliver', 'kasi nist?', '2020-09-24 19:31:46'),
(349, 'aliver', '?', '2020-09-24 19:31:47'),
(350, 'sat', 'salam', '2020-09-25 07:36:17'),
(351, 'sat', 's', '2020-09-25 07:36:21'),
(352, 'reza', 'SALAM', '2020-09-26 06:41:54');

-- --------------------------------------------------------

--
-- Table structure for table `phone_calls`
--

CREATE TABLE `phone_calls` (
  `id` int(11) NOT NULL,
  `owner` varchar(11) NOT NULL COMMENT 'Name',
  `num` varchar(11) NOT NULL COMMENT 'Phone Number',
  `incoming` int(11) NOT NULL COMMENT 'Define Incoming Call',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL COMMENT 'Accept Call'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `phone_messages`
--

CREATE TABLE `phone_messages` (
  `id` int(11) NOT NULL,
  `transmitter` varchar(11) NOT NULL,
  `receiver` varchar(11) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `phone_users_contacts`
--

CREATE TABLE `phone_users_contacts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(11) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `phone_users_contacts`
--

INSERT INTO `phone_users_contacts` (`id`, `identifier`, `number`, `display`) VALUES
(1, 'steam:11000013f96927c', '6666', 'mafia'),
(2, 'steam:11000011bd71502', 's', 'New Contact'),
(3, 'steam:110000119a295c5', '09397166981', 'torobche'),
(4, 'steam:1100001432edd27', '09394454357', 'Esi'),
(5, 'steam:110000136946dee', '09394365101', 'meitham'),
(6, 'steam:1100001432edd27', '09392765167', 'mahdi'),
(7, 'steam:110000119a295c5', '0939114199', 'alirz'),
(8, 'steam:11000013b15dfeb', '09397204342', 'bababega'),
(9, 'steam:110000142fdb81a', '09394698625', 'korosh gang'),
(10, 'steam:110000142fdb81a', '09397395071', 'kati owner'),
(11, 'steam:110000137262ae4', '09397395071', 'katy joon'),
(12, 'steam:1100001423a8b84', '09397395071', 'Katty'),
(13, 'steam:11000013eee641f', '09393435679', 'dsa'),
(14, 'steam:11000013565aca2', '09399561193', 'Ali Fimo'),
(15, 'steam:11000014130f8bc', '09399561193', 'ali fimo \\'),
(16, 'steam:1100001337524bb', 'tara', '1'),
(17, 'steam:110000133a6c38a', 'amir ', '09391893601'),
(18, 'steam:110000141888e6f', '09394454357', 'Ehsan King'),
(19, 'steam:110000136946dee', '09392765167', 'mahdi iham'),
(20, 'steam:110000135e4cad3', '09396067085', 'hosein (xrax)'),
(21, 'steam:110000135e4cad3', '09391798367', 'yong god'),
(22, 'steam:11000013fe1d324', '09391798367', 'kon bolnoli'),
(23, 'steam:110000142f84c2e', '09398042545', 'aslan'),
(24, 'steam:11000013cbe7deb', '09398891741', 'aryan'),
(25, 'steam:11000013bfec6d3', '09396542343', 'Bahman Beheshti'),
(26, 'steam:110000135ec4c27', '09395144282', 'hajmetiiiiiiiiiii'),
(27, 'steam:110000137356e77', '09393663348', 'rexxon'),
(28, 'steam:110000137356e77', '09395144282', 'mhti lsh'),
(29, 'steam:110000135ec4c27', '09396808572', 'abol'),
(30, 'steam:110000142baf68d', '09398557539', 'Omid'),
(31, 'steam:1100001416c2363', '09397760585', 'Damon'),
(32, 'steam:110000138a11e8b', '09391155150', 'Max Payne'),
(33, 'steam:110000139a98e60', '09391155150', 'mavad'),
(34, 'steam:1100001416c2363', '09391363204', 'Meysam Gonde Goz'),
(35, 'steam:110000137356e77', '09398574927', 'mmd svg'),
(36, 'steam:1100001416c2363', '09392343781', 'DaniHb Pd'),
(37, 'steam:11000013524ab85', '09393547976', 'oss Arshia '),
(38, 'steam:110000141888e6f', '09393547976', 'Arshia(Khanande)'),
(39, 'steam:1100001349629e7', '09398959639', 'Sahr'),
(40, 'steam:110000142a8932e', '09396343859', 'amir hsd'),
(41, 'steam:1100001432edd27', '09396343859', 'amir mekanik'),
(42, 'steam:1100001429bc668', '09398318716', 'dada hasan'),
(43, 'steam:1100001429bc668', '09398318716', 'dada hasan'),
(44, 'steam:1100001416c2363', '09392348289', 'Moaven'),
(45, 'steam:1100001404c8108', '09398204559', 'kaftar baz'),
(46, 'steam:110000138a11e8b', '09399331144', 'Hooman MD'),
(47, 'steam:11000013c569f47', '09397204342', 'babayaga'),
(48, 'steam:1100001416c2363', '09392472878', 'Mehrdad/Schwarz'),
(49, 'steam:11000014383d01c', '09397395071', 'katy'),
(50, 'steam:1100001432edd27', '09393872243', 'ariyan'),
(51, 'steam:11000014383d01c', '09394365101', 'mesam'),
(52, 'steam:1100001432edd27', '09397395071', 'katty'),
(53, 'steam:11000013c009f71', '09397395071', 'caatti'),
(54, 'steam:1100001355192c8', '09397318941', 'SHERLOK'),
(55, 'steam:11000013fc9f09d', '09397088330', 'Vakil'),
(56, 'steam:11000013fc9f09d', '09391155150', 'Max Payne'),
(57, 'steam:1100001432edd27', '09396971915', 'parsa'),
(58, 'steam:110000138a11e8b', '09394760521', 'Parsa'),
(152, 'steam:110000135200829', '09394560521', 'parsa'),
(60, 'steam:11000013fb7c107', '09393547976', 'arshia'),
(61, 'steam:11000013fb7c107', '09397395071', 'kati'),
(62, 'steam:110000119a295c5', '09394365101', 'Meysam'),
(63, 'steam:1100001424faa91', '09398557157', 'MMD'),
(64, 'steam:11000014257f01d', '09392545996', 'piremadre por hashie'),
(65, 'steam:11000014383d01c', '09392545996', 'amo golam'),
(66, 'steam:11000013eabc99c', '09394698625', 'kourosh'),
(67, 'steam:110000142a7484e', '09398794552', 'Mehraboon'),
(68, 'steam:11000013c569f47', '09391827929', 'MMD'),
(69, 'steam:11000013c009f71', '09393872243', 'arian joker'),
(70, 'steam:11000014383d01c', '09396219034', 'parsa'),
(71, 'steam:1100001416c2363', '09399204970', 'Mahdi Koskhol'),
(72, 'steam:110000119a295c5', '09393114199', 'AliRZ'),
(73, 'steam:11000013d56fc57', '09393547976', 'arshia'),
(74, 'steam:110000104773ae5', '09391956796', 'mmd gun'),
(75, 'steam:110000143f2e9a6', '09396055121', 'amir reza'),
(76, 'steam:110000141888e6f', '09397395071', 'kATTY'),
(77, 'steam:110000141888e6f', '09394365101', 'Meysam King'),
(79, 'steam:110000141888e6f', '09396971915', 'Parsa No.1'),
(80, 'steam:11000013618e045', '09396054235', 'Ghazi'),
(81, 'steam:11000013524ab85', '09391827929', 'mmd sparow'),
(82, 'steam:1100001416c2363', '09392765167', 'Asghar.Kuty Gang'),
(83, 'steam:1100001416c2363', '09394454357', 'Ehsan.Kuty Gang'),
(84, 'steam:1100001416c2363', '09391827929', 'Mamad Helper'),
(85, 'steam:1100001416c2363', '09397830557', 'Hani Pink'),
(86, 'steam:1100001416c2363', '09394760521', 'Parsa Kuty Gang'),
(87, 'steam:1100001416c2363', '09391956796', 'Mohamad.Kuty Gang'),
(88, 'steam:1100001416c2363', '09396054235', 'Karen'),
(89, 'steam:1100001416c2363', '09394279660', 'Tiban'),
(90, 'steam:11000013fc9f09d', '09396054235', 'Karen'),
(91, 'steam:110000118d6378d', '09396698609', 'shekh sistani gan frosh'),
(92, 'steam:110000136946dee', '09396971915', 'parsa no1'),
(93, 'steam:110000138a11e8b', '09399464152', 'Sattar MC'),
(94, 'steam:11000013524ab85', '09392343781', 'dani'),
(95, 'steam:11000013fb7c107', '09399370374', 'a.h.e'),
(96, 'steam:110000143f2e9a6', '09395027057', 'aryan'),
(97, 'steam:11000013e003bd7', '09392822278', 'saleh'),
(98, 'steam:110000141888e6f', '09391956796', 'Mamad Dx(Gun Sangin)'),
(99, 'steam:11000013fb7c107', '09391676340', 'NGIN'),
(100, 'steam:1100001349629e7', '09391676340', 'negin '),
(101, 'steam:11000013fb7c107', '09397204342', 'NICKEL'),
(102, 'steam:1100001432edd27', '09393547976', 'arshiya'),
(103, 'steam:1100001429bc668', '09391819259', 'police'),
(104, 'steam:11000013618e045', '09393547976', 'Arshia'),
(105, 'steam:110000104773ae5', '09399331144', 'HOMAN'),
(106, 'steam:11000014257f01d', '09391819259', 'e'),
(107, 'steam:1100001339f2ba9', '09392236886', 'police officer'),
(108, 'steam:110000136946dee', '09392980484', 'gerogan'),
(109, 'steam:110000138a11e7f', '09391827929', 'mohamad-mafia'),
(110, 'steam:11000014257f01d', '09399478936', 'bamaze'),
(111, 'steam:110000141888e6f', '09393832501', 'Abolfazl'),
(112, 'steam:110000143e28467', '09392765167', 'mehdi'),
(113, 'steam:1100001433804d1', '09396698609', 'mmd'),
(114, 'steam:11000013c0f0744', '09391956796', 'team'),
(115, 'steam:110000142a8932e', '09393832501', 'zeow'),
(116, 'steam:110000143e28467', '09392765380', 'sasan'),
(117, 'steam:110000112e25e18', '09399202702', 'reza corvo '),
(118, 'steam:110000143cd67c3', '09397719288', 'U3F'),
(119, 'steam:1100001432edd27', '09396063135', 'eynolah'),
(120, 'steam:110000141888e6f', '09396063135', 'Einoallah'),
(121, 'steam:1100001349629e7', '09392343781', 'Danial Watson'),
(122, 'steam:11000014257f01d', '09392343781', 'dani'),
(123, 'steam:110000138a11e8b', '09393547976', 'Arshia MC'),
(124, 'steam:110000138a11e8b', '09392236886', 'Danial TR'),
(125, 'steam:110000138a11e8b', '09396059464', 'A2'),
(126, 'steam:110000143f2e9a6', '09391956796', ''),
(127, 'steam:11000013c932e18', '09397697716', 'Amin'),
(128, 'steam:11000011b3cf3c0', '09395033937', 'Amir'),
(129, 'steam:110000118d6378d', '09391956796', 'mmd akm'),
(130, 'steam:1100001432edd27', '09396059464', 'king'),
(131, 'steam:1100001432edd27', '09393943251', 'amir '),
(132, 'steam:110000143e28467', '09393943251', 'amir shiraz'),
(133, 'steam:110000141888e6f', '09393943251', 'Amir Gholami'),
(134, 'steam:1100001432edd27', '09393832501', 'abish'),
(135, 'steam:110000143e28467', '09394365101', 'meysam'),
(136, 'steam:11000014257f01d', '09393867421', 'melo'),
(137, 'steam:1100001349629e7', '09396630451', 'Pouriya'),
(138, 'steam:11000013d207ecb', '09394760521', 'New Contact11'),
(139, 'steam:110000136946dee', '09394760521', 'pasra'),
(140, 'steam:11000013f8748af', '09394760521', 'parsa ak katty'),
(141, 'steam:1100001429bc668', '0939940176', 'ALIREZA GUN'),
(142, 'steam:1100001429bc668', '09399405176', 'ALIREZA GUN 1'),
(143, 'steam:11000014377ff08', '09396721555', 'aidin'),
(144, 'steam:11000013dfdaaf4', '09322548581', 'peyman'),
(145, 'steam:11000013dfdaaf4', '09392548581', 'peyman jn'),
(146, 'steam:11000013dfdaaf4', '09396055121', 'amirreza medic\\'),
(147, 'steam:110000136946dee', '09393547976', 'arshia'),
(148, 'steam:110000136946dee', '09392816450', 'haj morghi'),
(149, 'steam:110000143ca57b7', '09398151564', 'Neo'),
(150, 'steam:1100001443f8b91', '', 'New Contact'),
(151, 'steam:1100001429bc668', '09392003282', 'javad'),
(153, 'steam:11000014431336e', '09392765167', 'Mahdi Ihaam'),
(154, 'steam:110000141888e6f', '09391960534', 'Pedram'),
(155, 'steam:1100001151b206f', '09391956796', 'mamad deox'),
(156, 'steam:110000140540265', '09394454357', 'angori'),
(157, 'steam:110000138a11e8b', '09391827929', 'Mamad'),
(158, 'steam:11000014257f01d', '09399331144', 'chief medic'),
(159, 'steam:11000014257f01d', '09391956796', 'mamad X'),
(160, 'steam:11000010c51198f', '09391004234', 'amberat'),
(161, 'steam:1100001425e6768', '09391004234', 'amberat'),
(162, 'steam:1100001151b206f', '09391576571', 'mehdi'),
(163, 'steam:110000140540265', '09391004234', 'amberat'),
(164, 'steam:11000013fb7c107', '09392448303', 'EDRIS'),
(165, 'steam:11000013eeae96b', '09391960534', 'pedram'),
(175, 'steam:11000014182e9cf', '09392816450', 'haj morghi'),
(174, 'steam:110000135f0740e', '09394454357', 'Ehsan'),
(168, 'steam:11000014328acae', '09391956796', 'New Contact'),
(169, 'steam:110000138a11e8b', '09391819259', 'Aydin'),
(170, 'steam:110000139d4bc73', '09396708442', 'L'),
(171, 'steam:11000013deb383c', '09394454357', 'ehsan'),
(172, 'steam:110000136946dee', '09393626908', 'pastil'),
(173, 'steam:11000013fb7c107', '09395520587', 'mehdigavkosh'),
(176, 'steam:1100001362f9d7a', '09397354246', 'ali mogo'),
(177, 'steam:11000013eeae96b', '09394454357', 'ehsan'),
(178, 'steam:11000014182e9cf', '09039387141', 'amiryasin'),
(179, 'steam:110000136946dee', '09395944339', 'amir'),
(180, 'steam:1100001428aa65e', '09393547976', 'doolshia'),
(181, 'steam:110000134186c02', '09391952883', 'googoolie sheriff'),
(182, 'steam:110000143338b15', '09399204970', 'sarbaz'),
(183, 'steam:1100001416c2363', '09396063135', 'Pedar Bozorg'),
(184, 'steam:11000010a8daf9b', '09392765167', 'Eeham (Aragh)'),
(185, 'steam:110000143b4a46a', '09392765167', 'iham'),
(186, 'steam:11000013ebe327a', 'ali', '09394707920'),
(187, 'steam:1100001416c2363', '09394781905', 'Sourena'),
(188, 'steam:11000010a8daf9b', '9394760521', 'Parsa'),
(189, 'steam:11000013df9ff7d', '09397760585', 'GUHN\\'),
(190, 'steam:110000144037b34', '09394781905', 'Sorena'),
(191, 'steam:11000013cbe7deb', '09396071031', 'lester'),
(192, 'steam:110000141b68d20', '09397052372', 'sheykh'),
(193, 'steam:110000140bd6406', '09393704994', 'ACZ'),
(194, 'steam:110000136946dee', '09392959653', 'amir ebiii'),
(195, 'steam:11000013df67941', '09392545068', 'mani'),
(196, 'steam:11000013cbe7deb', '09393704994', 'abol'),
(197, 'steam:1100001416c2363', '09396851001', 'Ghermez ha/Pedar Moamele'),
(198, 'steam:110000141b68d20', '09392765167', 'eham'),
(199, 'steam:1100001404c8108', '', 'mamad'),
(200, 'steam:11000011c69f190', '09393650296', 'gambalo'),
(201, 'steam:11000010a8daf9b', '09393931656', 'Parhaam');

-- --------------------------------------------------------

--
-- Table structure for table `playerhousing`
--

CREATE TABLE `playerhousing` (
  `id` int(32) NOT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `rented` tinyint(1) DEFAULT NULL,
  `price` int(32) DEFAULT NULL,
  `wardrobe` longtext DEFAULT NULL,
  `furniture` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `police_ext`
--

CREATE TABLE `police_ext` (
  `identifier` varchar(50) NOT NULL DEFAULT 'noident',
  `division` varchar(50) DEFAULT 'police'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `police_ext`
--

INSERT INTO `police_ext` (`identifier`, `division`) VALUES
('steam:1100001411929e2', 'fbi'),
('steam:110000141f3c4c7', 'police'),
('steam:11000011b65f6c6', 'sheriff'),
('steam:110000132bff389', 'sheriff'),
('steam:110000134186c02', 'sheriff'),
('steam:1100001356ed847', 'sheriff'),
('steam:1100001419e40c0', 'sheriff'),
('steam:1100001419f8003', 'sheriff'),
('steam:110000141ffaa49', 'sheriff'),
('steam:11000010b1e15af', 'swat'),
('steam:1100001131f2622', 'swat'),
('steam:1100001132407e5', 'swat'),
('steam:1100001133ee7c2', 'swat'),
('steam:11000011bdae895', 'swat'),
('steam:11000011bf03921', 'swat'),
('steam:11000011d0c45c7', 'swat'),
('steam:11000011d4c6d8f', 'swat'),
('steam:11000013386a434', 'swat'),
('steam:1100001339c03f0', 'swat'),
('steam:110000133ad55ed', 'swat'),
('steam:1100001349629e7', 'swat'),
('steam:110000134e357d3', 'swat'),
('steam:110000136733eb7', 'swat'),
('steam:110000136ca4d47', 'swat'),
('steam:110000138a11e8b', 'swat'),
('steam:11000013aaf4b2e', 'swat'),
('steam:11000013c31d991', 'swat'),
('steam:11000013c51bc0b', 'swat'),
('steam:11000013cafc4ee', 'swat'),
('steam:11000013d107a4f', 'swat'),
('steam:11000013d6134a4', 'swat'),
('steam:11000013f8748af', 'swat'),
('steam:11000013fd18918', 'swat'),
('steam:1100001404c8108', 'swat'),
('steam:11000014068772e', 'swat'),
('steam:110000140f14bfd', 'swat'),
('steam:110000141534b37', 'swat'),
('steam:11000014257f01d', 'swat'),
('steam:110000143098ec7', 'swat');

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_persian_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8_persian_ci DEFAULT NULL,
  `entering` varchar(255) COLLATE utf8_persian_ci DEFAULT NULL,
  `exit` varchar(255) COLLATE utf8_persian_ci DEFAULT NULL,
  `inside` varchar(255) COLLATE utf8_persian_ci DEFAULT NULL,
  `outside` varchar(255) COLLATE utf8_persian_ci DEFAULT NULL,
  `ipls` varchar(255) COLLATE utf8_persian_ci DEFAULT '[]',
  `gateway` varchar(255) COLLATE utf8_persian_ci DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_room` int(11) DEFAULT NULL,
  `is_gateway` int(11) DEFAULT NULL,
  `room_menu` varchar(255) COLLATE utf8_persian_ci DEFAULT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `properties_inventory`
--

CREATE TABLE `properties_inventory` (
  `id` int(11) NOT NULL,
  `propertie_id` int(11) DEFAULT NULL,
  `item` varchar(255) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `isweapon` int(255) NOT NULL DEFAULT 0,
  `owner` varchar(255) DEFAULT NULL,
  `label_weapon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `rented_vehicles`
--

CREATE TABLE `rented_vehicles` (
  `vehicle` varchar(60) COLLATE utf8_persian_ci NOT NULL,
  `plate` varchar(12) COLLATE utf8_persian_ci NOT NULL,
  `player_name` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) COLLATE utf8_persian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `identifier` varchar(50) NOT NULL,
  `count` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`identifier`, `count`) VALUES
('steam:11000010145970e', 12),
('steam:110000116278833', 249),
('steam:110000119a295c5', 171),
('steam:11000011bdae895', 239),
('steam:11000011bf03921', 102),
('steam:11000011d4035f0', 8),
('steam:1100001350426b3', 15),
('steam:11000013b91acbb', 48),
('steam:11000013b961c60', 87),
('steam:11000013c51bc0b', 100),
('steam:11000013deb383c', 110),
('steam:11000013e535de3', 68),
('steam:11000013ee53c27', 83),
('steam:11000013f96927c', 201),
('steam:11000013fb7c107', 1013),
('steam:1100001414e63f9', 341),
('steam:110000141ef4bd8', 14),
('steam:1100001424faa91', 24),
('steam:1100001432edd27', 357),
('steam:11000014344f23d', 140);

-- --------------------------------------------------------

--
-- Table structure for table `shipments`
--

CREATE TABLE `shipments` (
  `id` int(11) DEFAULT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `item` varchar(50) DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  `count` varchar(50) DEFAULT NULL,
  `time` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` int(11) NOT NULL,
  `store` varchar(100) NOT NULL,
  `item` varchar(100) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `trunk_inventory`
--

CREATE TABLE `trunk_inventory` (
  `id` int(11) NOT NULL,
  `plate` varchar(8) COLLATE utf8_persian_ci NOT NULL,
  `data` text COLLATE utf8_persian_ci NOT NULL,
  `owned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `playerName` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `firstname` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `lastname` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `money` int(11) DEFAULT NULL,
  `bank` int(11) DEFAULT 10000,
  `permission_level` int(11) DEFAULT NULL,
  `group` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `position` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `vip` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `inventory` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `loadout` longtext COLLATE utf8mb4_bin DEFAULT '[]',
  `gender` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `skin` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `gang` varchar(255) COLLATE utf8mb4_bin DEFAULT 'nogang',
  `gang_grade` int(2) DEFAULT 0,
  `job` varchar(255) COLLATE utf8mb4_bin DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `divisions` varchar(255) COLLATE utf8mb4_bin DEFAULT 'police',
  `badge` int(11) DEFAULT 0,
  `status` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `last_property` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `jail` varchar(100) COLLATE utf8mb4_bin DEFAULT '{"type":0,"time":0,"part":0}',
  `jailreason` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `dateofbirth` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `height` int(255) DEFAULT NULL,
  `armour` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `tattoos` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `IsBeingCprd` tinyint(1) DEFAULT NULL,
  `lastchange` int(32) NOT NULL DEFAULT 0,
  `IsDetective` tinyint(1) NOT NULL DEFAULT 0,
  `IsSwat` tinyint(1) NOT NULL DEFAULT 0,
  `IsSheriff` tinyint(1) NOT NULL DEFAULT 0,
  `IsHR` tinyint(1) NOT NULL DEFAULT 0,
  `IsXray` tinyint(1) NOT NULL DEFAULT 0,
  `Assign` tinyint(5) NOT NULL DEFAULT 0,
  `timePlay` int(11) NOT NULL DEFAULT 0,
  `phone_number` varchar(11) COLLATE utf8mb4_bin DEFAULT NULL,
  `streamerpack` int(11) NOT NULL DEFAULT 0,
  `question_rp` tinyint(1) NOT NULL DEFAULT 0,
  `rp_xp` int(11) NOT NULL DEFAULT 0,
  `rp_rank` int(11) NOT NULL DEFAULT 1,
  `lastdigits` int(15) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `identifier`, `license`, `playerName`, `firstname`, `lastname`, `money`, `bank`, `permission_level`, `group`, `position`, `vip`, `inventory`, `loadout`, `gender`, `skin`, `gang`, `gang_grade`, `job`, `job_grade`, `divisions`, `badge`, `status`, `is_dead`, `last_property`, `jail`, `jailreason`, `dateofbirth`, `height`, `armour`, `tattoos`, `IsBeingCprd`, `lastchange`, `IsDetective`, `IsSwat`, `IsSheriff`, `IsHR`, `IsXray`, `Assign`, `timePlay`, `phone_number`, `streamerpack`, `question_rp`, `rp_xp`, `rp_rank`, `lastdigits`) VALUES
(8711, 'steam:1100001166ec0e6', 'license:e86ea3bc9986c843637f0187e1d5bddbaa2b75d6', 'Kasra_Godazri', 'Kasra', 'Godazri', 10000, 100000, 0, 'user', '{\"x\":-213.47,\"y\":-895.68,\"z\":29.25}', NULL, '[{\"count\":1,\"item\":\"phone\"},{\"count\":1,\"item\":\"gps\"},{\"count\":5,\"item\":\"water\"},{\"count\":5,\"item\":\"bread\"}]', '[]', '0', '{\"arms_2\":0,\"age_1\":0,\"tshirt_1\":15,\"pants_2\":4,\"watches_2\":-1,\"arms\":15,\"torso_1\":15,\"complexion_1\":0,\"hair_2\":0,\"eyebrows_2\":10,\"chain_1\":0,\"skin\":12,\"helmet_1\":-1,\"torso_2\":0,\"face_2\":21,\"chain_2\":0,\"face_3\":5,\"moles_2\":1,\"shoes_2\":0,\"beard_2\":10,\"ears_1\":-1,\"moles_1\":0,\"watches_1\":-1,\"shoes_1\":34,\"helmet_2\":-1,\"eyebrows_1\":0,\"glasses_1\":-1,\"sex\":0,\"beard_1\":0,\"tshirt_2\":0,\"beard_4\":0,\"hair_color_1\":0,\"age_2\":0,\"pants_1\":61,\"hair_1\":0,\"beard_3\":0,\"ears_2\":-1,\"glasses_2\":-1,\"hair_color_2\":0,\"face_1\":0,\"eye_color\":0,\"complexion_2\":1}', 'nogang', 0, 'unemployed', 0, 'police', 0, '[{\"val\":990000,\"name\":\"hunger\",\"percent\":99.0},{\"val\":992500,\"name\":\"thirst\",\"percent\":99.25},{\"val\":100,\"name\":\"health\",\"percent\":100},{\"val\":0,\"name\":\"armor\",\"percent\":0}]', 0, NULL, '{\"type\":0,\"time\":0,\"part\":0}', NULL, '09/01/2022', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 101, '09392514456', 0, 0, 0, 1, NULL),
(8696, 'steam:11000011a4a8df4', 'license:94d69390370bf994e9baf163fb3e77b06666b4ba', 'سسس_سسس', '', '', 10000, 100000, 0, 'user', '{\"x\":-246.02,\"z\":28.79,\"y\":-1018.0}', NULL, '[{\"item\":\"phone\",\"count\":1},{\"item\":\"gps\",\"count\":1},{\"item\":\"water\",\"count\":5},{\"item\":\"bread\",\"count\":5}]', '[]', '0', '{\"helmet_2\":-1,\"torso_2\":0,\"complexion_2\":1,\"torso_1\":15,\"age_2\":0,\"sex\":0,\"hair_1\":0,\"hair_color_1\":0,\"shoes_1\":34,\"watches_1\":-1,\"glasses_2\":-1,\"age_1\":0,\"complexion_1\":0,\"chain_1\":0,\"face_1\":0,\"chain_2\":0,\"moles_2\":1,\"moles_1\":0,\"beard_3\":0,\"pants_2\":4,\"beard_1\":0,\"eyebrows_1\":0,\"face_3\":5,\"pants_1\":61,\"hair_2\":0,\"arms\":15,\"tshirt_2\":0,\"beard_4\":0,\"arms_2\":0,\"eyebrows_2\":10,\"tshirt_1\":15,\"helmet_1\":-1,\"watches_2\":-1,\"face_2\":21,\"glasses_1\":-1,\"ears_2\":-1,\"ears_1\":-1,\"skin\":12,\"eye_color\":0,\"shoes_2\":0,\"hair_color_2\":0,\"beard_2\":10}', 'nogang', 0, 'unemployed', 0, 'police', 0, '[{\"percent\":98.11,\"name\":\"hunger\",\"val\":981100},{\"percent\":98.5825,\"name\":\"thirst\",\"val\":985825},{\"percent\":100,\"name\":\"health\",\"val\":100},{\"percent\":0,\"name\":\"armor\",\"val\":0}]', 0, NULL, '{\"type\":0,\"time\":0,\"part\":0}', NULL, '', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 196, '09396836223', 0, 0, 0, 1, 1234),
(8693, 'steam:1100001361d6816', 'license:6e4543027cec70885354c3d87d3f985840c708a4', 'Mohamad_Nasrollah', '', '', 10000, 99000, 12, 'user', '{\"x\":2113.87,\"y\":2922.28,\"z\":-61.9}', NULL, '[{\"item\":\"phone\",\"count\":1},{\"item\":\"gps\",\"count\":1},{\"item\":\"water\",\"count\":5},{\"item\":\"bread\",\"count\":5}]', '[{\"ammo\":0,\"components\":[\"clip_default\"],\"label\":\"Combat pdw\",\"name\":\"WEAPON_COMBATPDW\"}]', '0', '{\"watches_2\":-1,\"mask_2\":0,\"lipstick_2\":0,\"eyebrows_2\":10,\"skin\":12,\"hair_1\":2,\"hair_2\":0,\"eyebrows_1\":0,\"moles_1\":0,\"decals_1\":0,\"bproof_1\":22,\"beard_4\":0,\"beard_3\":0,\"ears_1\":-1,\"chain_2\":0,\"shoes_2\":0,\"torso_2\":21,\"makeup_3\":0,\"ears_2\":-1,\"hair_color_2\":0,\"mask_1\":0,\"lipstick_1\":0,\"tshirt_1\":16,\"eyebrows_4\":0,\"age_1\":0,\"complexion_2\":1,\"chain_1\":128,\"makeup_2\":0,\"torso_1\":219,\"beard_1\":28,\"watches_1\":-1,\"arms_2\":0,\"helmet_2\":2,\"pants_2\":3,\"complexion_1\":0,\"bproof_2\":8,\"makeup_4\":0,\"tshirt_2\":0,\"beard_2\":10,\"lipstick_3\":0,\"glasses_1\":-1,\"bags_1\":0,\"pants_1\":87,\"face_2\":21,\"face_1\":0,\"bags_2\":0,\"eye_color\":0,\"moles_2\":1,\"arms\":1,\"lipstick_4\":0,\"age_2\":0,\"hair_color_1\":0,\"glasses_2\":0,\"shoes_1\":24,\"face_3\":5,\"sex\":0,\"decals_2\":0,\"makeup_1\":0,\"helmet_1\":123,\"eyebrows_3\":0}', 'nogang', 0, 'cia', 4, 'police', 0, '[{\"val\":745000,\"percent\":74.5,\"name\":\"hunger\"},{\"val\":808750,\"percent\":80.875,\"name\":\"thirst\"},{\"val\":100,\"percent\":100,\"name\":\"health\"},{\"val\":100,\"percent\":100,\"name\":\"armor\"}]', 0, NULL, '{\"type\":0,\"time\":0,\"part\":0}', NULL, '12/16/1991', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 12907, '09395850425', 0, 0, 0, 1, 1234),
(8695, 'steam:11000013b37558e', 'license:a4d4b394cace9e2675c54c909459cdfcfca97422', 'Parsa_Johnson', '', '', 1921802913, 112000, 12, 'user', '{\"z\":37.79,\"y\":-1656.93,\"x\":382.73}', NULL, '[{\"item\":\"water\",\"count\":5},{\"item\":\"bread\",\"count\":5}]', '[{\"ammo\":195,\"components\":[\"clip_default\"],\"name\":\"WEAPON_PISTOL\",\"label\":\"Pistol\"},{\"ammo\":195,\"components\":[\"clip_default\"],\"name\":\"WEAPON_HEAVYPISTOL\",\"label\":\"Heavy pistol\"}]', '0', '{\"beard_2\":10,\"beard_1\":7,\"eye_color\":12,\"hair_2\":0,\"pants_2\":2,\"age_1\":0,\"age_2\":0,\"tshirt_1\":23,\"torso_1\":7,\"shoes_2\":10,\"complexion_2\":1,\"eyebrows_1\":0,\"eyebrows_2\":10,\"face_2\":21,\"face_3\":5,\"arms\":1,\"hair_1\":8,\"glasses_2\":-1,\"watches_1\":-1,\"shoes_1\":0,\"beard_4\":0,\"helmet_1\":-1,\"watches_2\":-1,\"arms_2\":0,\"sex\":0,\"hair_color_1\":0,\"chain_1\":0,\"moles_2\":1,\"tshirt_2\":0,\"ears_2\":-1,\"hair_color_2\":0,\"chain_2\":0,\"ears_1\":-1,\"torso_2\":4,\"complexion_1\":0,\"skin\":14,\"pants_1\":0,\"face_1\":0,\"glasses_1\":-1,\"moles_1\":0,\"beard_3\":0,\"helmet_2\":-1}', 'GroveStreet', 6, 'government', 6, 'police', 0, '[{\"percent\":86.33,\"name\":\"hunger\",\"val\":863300},{\"percent\":89.7475,\"name\":\"thirst\",\"val\":897475},{\"percent\":100,\"name\":\"health\",\"val\":100},{\"percent\":0,\"name\":\"armor\",\"val\":0}]', 0, NULL, '{\"type\":0,\"time\":0,\"part\":0}', NULL, '08/16/2004', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 3451, '09397430928', 0, 0, 0, 1, 1234),
(8699, 'steam:11000013d0262b2', 'license:de3274b7f6a8abb936d1c51c6b3bead4cc7e6ea9', 'Carl_Dixon', '', '', 1, 100000, 12, 'user', '{\"z\":43.15,\"x\":285.06,\"y\":-572.79}', NULL, '[{\"item\":\"phone\",\"count\":0},{\"item\":\"gps\",\"count\":0},{\"item\":\"water\",\"count\":0},{\"item\":\"bread\",\"count\":0}]', '[]', '0', '{\"complexion_2\":1,\"eye_color\":0,\"ears_2\":-1,\"glasses_2\":-1,\"arms\":15,\"skin\":12,\"torso_2\":0,\"eyebrows_1\":0,\"watches_2\":-1,\"beard_3\":0,\"arms_2\":0,\"tshirt_1\":15,\"age_2\":0,\"hair_color_1\":0,\"shoes_1\":34,\"beard_4\":0,\"face_2\":35,\"chain_1\":0,\"glasses_1\":-1,\"age_1\":0,\"moles_2\":1,\"helmet_2\":-1,\"face_1\":5,\"watches_1\":-1,\"hair_1\":0,\"complexion_1\":0,\"hair_2\":0,\"helmet_1\":-1,\"beard_1\":0,\"beard_2\":10,\"hair_color_2\":0,\"moles_1\":0,\"shoes_2\":0,\"eyebrows_2\":10,\"tshirt_2\":0,\"ears_1\":-1,\"sex\":0,\"chain_2\":0,\"pants_2\":4,\"pants_1\":61,\"face_3\":5,\"torso_1\":15}', 'nogang', 0, 'unemployed', 0, 'police', 0, '[{\"percent\":96.54,\"val\":965400,\"name\":\"hunger\"},{\"percent\":97.405,\"val\":974050,\"name\":\"thirst\"},{\"percent\":100,\"val\":100,\"name\":\"health\"},{\"percent\":0,\"val\":0,\"name\":\"armor\"}]', 0, NULL, '{\"type\":0,\"time\":0,\"part\":0}', NULL, '02/09/1997', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '09392864902', 0, 0, 0, 1, NULL),
(8698, 'steam:1100001402db7a7', 'license:0884ef5361e0c332b6bac2ae932510cfeed70f5a', 'Fardin_Azad', '', '', 10000, 101500, 0, 'user', '{\"z\":30.56,\"y\":-803.56,\"x\":228.36}', NULL, '[{\"item\":\"phone\",\"count\":1},{\"item\":\"gps\",\"count\":1},{\"item\":\"water\",\"count\":5},{\"item\":\"bread\",\"count\":5}]', '[]', '0', '{\"arms_2\":0,\"hair_2\":0,\"face_1\":0,\"eye_color\":0,\"complexion_1\":0,\"hair_color_1\":0,\"complexion_2\":1,\"helmet_2\":-1,\"beard_3\":0,\"sex\":0,\"tshirt_1\":5,\"torso_2\":2,\"glasses_1\":-1,\"watches_2\":-1,\"beard_4\":0,\"eyebrows_1\":0,\"glasses_2\":-1,\"chain_1\":0,\"hair_1\":3,\"tshirt_2\":0,\"age_1\":0,\"eyebrows_2\":10,\"hair_color_2\":0,\"chain_2\":0,\"beard_1\":0,\"torso_1\":269,\"shoes_1\":77,\"shoes_2\":0,\"watches_1\":-1,\"face_3\":5,\"moles_1\":0,\"beard_2\":10,\"helmet_1\":-1,\"pants_1\":82,\"skin\":12,\"ears_1\":-1,\"pants_2\":3,\"age_2\":0,\"ears_2\":-1,\"face_2\":21,\"arms\":5,\"moles_2\":1}', 'nogang', 0, 'unemployed', 0, 'police', 0, '[{\"val\":911300,\"name\":\"hunger\",\"percent\":91.13},{\"val\":933475,\"name\":\"thirst\",\"percent\":93.34750000000001},{\"val\":100,\"name\":\"health\",\"percent\":100},{\"val\":0,\"name\":\"armor\",\"percent\":0}]', 0, NULL, '{\"type\":0,\"time\":0,\"part\":0}', NULL, '06/05/2021', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 951, '09399147397', 0, 0, 0, 1, NULL),
(8692, 'steam:1100001410e55b4', 'license:62bffcb569a4eea175d70f9420113b3d30b916f9', 'Masiha_Omidi', '', '', 20000000, 178500, 12, 'user', '{\"z\":57.82,\"y\":1977.03,\"x\":1863.46}', '10', '[{\"count\":0,\"item\":\"phone\"},{\"count\":0,\"item\":\"gps\"},{\"count\":0,\"item\":\"water\"},{\"count\":0,\"item\":\"bread\"}]', '[{\"label\":\"Pistol\",\"ammo\":0,\"name\":\"WEAPON_PISTOL\",\"components\":[\"clip_default\"]},{\"label\":\"Heavy pistol\",\"ammo\":0,\"name\":\"WEAPON_HEAVYPISTOL\",\"components\":[\"clip_default\"]},{\"label\":\"Carbine rifle\",\"ammo\":0,\"name\":\"WEAPON_CARBINERIFLE\",\"components\":[\"clip_default\"]}]', '0', '{\"skin\":12,\"eye_color\":0,\"face_1\":0,\"arms\":15,\"watches_2\":-1,\"chain_1\":0,\"moles_1\":0,\"torso_2\":0,\"age_1\":0,\"ears_2\":-1,\"chain_2\":0,\"beard_2\":10,\"sex\":0,\"eyebrows_2\":10,\"hair_2\":0,\"tshirt_1\":15,\"beard_4\":0,\"shoes_2\":0,\"ears_1\":-1,\"hair_color_2\":0,\"glasses_1\":-1,\"eyebrows_1\":0,\"tshirt_2\":0,\"beard_1\":0,\"face_3\":5,\"moles_2\":1,\"age_2\":0,\"hair_1\":0,\"shoes_1\":34,\"complexion_1\":0,\"watches_1\":-1,\"complexion_2\":1,\"arms_2\":0,\"pants_1\":61,\"pants_2\":4,\"beard_3\":0,\"helmet_2\":-1,\"glasses_2\":-1,\"hair_color_1\":0,\"helmet_1\":-1,\"face_2\":21,\"torso_1\":15}', 'nogang', 0, 'police', 6, 'police', 0, '[{\"percent\":43.25,\"val\":432500,\"name\":\"hunger\"},{\"percent\":57.4375,\"val\":574375,\"name\":\"thirst\"},{\"percent\":100,\"val\":100,\"name\":\"health\"},{\"percent\":0,\"val\":0,\"name\":\"armor\"}]', 0, NULL, '{\"type\":0,\"time\":0,\"part\":0}', NULL, '06/04/2021', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 46069, '09396194571', 0, 0, 0, 1, 1234),
(8701, 'steam:11000014534dc5b', 'license:0d7602df5b8fc7abd27c84c32ea046058450d0fe', 'Misagh_Aazam', '', '', 10000, 101500, 0, 'user', '{\"z\":29.27,\"y\":-1764.45,\"x\":395.59}', NULL, '[{\"item\":\"phone\",\"count\":1},{\"item\":\"gps\",\"count\":1},{\"item\":\"water\",\"count\":5},{\"item\":\"bread\",\"count\":5}]', '[]', '0', '{\"arms\":5,\"face_2\":21,\"eyebrows_1\":33,\"watches_2\":-1,\"hair_color_1\":0,\"pants_1\":5,\"torso_1\":5,\"age_2\":0,\"complexion_1\":0,\"glasses_1\":5,\"sex\":0,\"glasses_2\":0,\"eye_color\":2,\"age_1\":0,\"shoes_1\":1,\"moles_1\":0,\"arms_2\":0,\"beard_3\":0,\"tshirt_1\":5,\"complexion_2\":1,\"face_3\":4,\"helmet_2\":-1,\"face_1\":0,\"ears_2\":3,\"moles_2\":1,\"skin\":19,\"hair_1\":14,\"beard_2\":10,\"beard_1\":11,\"chain_1\":0,\"chain_2\":0,\"hair_color_2\":28,\"tshirt_2\":0,\"hair_2\":0,\"helmet_1\":-1,\"pants_2\":2,\"watches_1\":-1,\"torso_2\":0,\"beard_4\":0,\"ears_1\":20,\"eyebrows_2\":10,\"shoes_2\":0}', 'nogang', 0, 'unemployed', 0, 'police', 0, '[{\"percent\":47.22,\"name\":\"hunger\",\"val\":472200},{\"percent\":47.915,\"name\":\"thirst\",\"val\":479150},{\"percent\":42,\"name\":\"health\",\"val\":42},{\"percent\":0,\"name\":\"armor\",\"val\":0}]', 0, NULL, '{\"type\":0,\"time\":0,\"part\":0}', NULL, '06/25/2021', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 657, '09395719255', 0, 0, 0, 1, NULL),
(8691, 'steam:110000145d1e773', 'license:bec20ead50f5ec899ba2ae177ef83adb35698b64', 'Amirhossien_Azari', '', '', 58911284, 213000, 12, 'developer', '{\"z\":24.59,\"y\":6446.2,\"x\":1584.61}', NULL, '[{\"item\":\"phone\",\"count\":0},{\"item\":\"gps\",\"count\":0},{\"item\":\"water\",\"count\":0}]', '[{\"components\":[\"clip_default\"],\"label\":\"Pistol\",\"name\":\"WEAPON_PISTOL\",\"ammo\":21},{\"components\":[\"clip_default\",\"flashlight\"],\"label\":\"Heavy pistol\",\"name\":\"WEAPON_HEAVYPISTOL\",\"ammo\":21},{\"components\":[\"flashlight\"],\"label\":\"Pump shotgun\",\"name\":\"WEAPON_PUMPSHOTGUN\",\"ammo\":216},{\"components\":[\"clip_default\",\"flashlight\",\"grip\"],\"label\":\"Carbine rifle\",\"name\":\"WEAPON_CARBINERIFLE\",\"ammo\":0},{\"components\":[\"scope\"],\"label\":\"Sniper rifle\",\"name\":\"WEAPON_SNIPERRIFLE\",\"ammo\":200}]', '0', '{\"lipstick_3\":0,\"face_3\":5,\"watches_2\":-1,\"pants_2\":0,\"bproof_1\":2,\"glasses_2\":0,\"makeup_4\":0,\"makeup_1\":0,\"tshirt_2\":0,\"bproof_2\":0,\"moles_1\":0,\"bags_1\":0,\"arms_2\":0,\"glasses_1\":3,\"skin\":12,\"torso_1\":190,\"decals_1\":7,\"moles_2\":1,\"beard_4\":0,\"beard_1\":0,\"makeup_2\":0,\"mask_1\":0,\"pants_1\":35,\"complexion_2\":1,\"makeup_3\":0,\"eyebrows_1\":0,\"face_2\":21,\"helmet_2\":0,\"decals_2\":0,\"mask_2\":0,\"hair_color_1\":0,\"lipstick_2\":0,\"lipstick_1\":0,\"eyebrows_4\":0,\"eyebrows_2\":10,\"age_2\":0,\"beard_2\":0,\"complexion_1\":0,\"helmet_1\":-1,\"age_1\":0,\"bags_2\":0,\"hair_color_2\":0,\"torso_2\":0,\"hair_1\":19,\"hair_2\":0,\"eye_color\":0,\"beard_3\":0,\"lipstick_4\":0,\"ears_2\":-1,\"watches_1\":-1,\"tshirt_1\":130,\"arms\":0,\"chain_1\":1,\"ears_1\":-1,\"sex\":0,\"face_1\":0,\"eyebrows_3\":0,\"shoes_1\":25,\"shoes_2\":0,\"chain_2\":0}', 'nogang', 0, 'police', 4, 'police', 0, '[{\"percent\":44.62999999999999,\"name\":\"hunger\",\"val\":446300},{\"percent\":45.9725,\"name\":\"thirst\",\"val\":459725},{\"percent\":100,\"name\":\"health\",\"val\":100},{\"percent\":0,\"name\":\"armor\",\"val\":0}]', 0, NULL, '{\"type\":0,\"time\":0,\"part\":0}', NULL, '06/08/2021', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 57754, '09397440993', 0, 0, 0, 1, 1234),
(8694, 'steam:110000148adfa01', 'license:c737b98773cf945a51933035c8fdb35f3d2f0a6d', 'Arman_Mohebrad', '', '', 150000000, 88000000, 12, 'user', '{\"x\":-75.21,\"y\":-821.47,\"z\":326.18}', NULL, '[{\"item\":\"aluminium\",\"count\":0},{\"item\":\"radio\",\"count\":1},{\"item\":\"phone\",\"count\":1},{\"item\":\"gps\",\"count\":1},{\"item\":\"picklock\",\"count\":2}]', '[{\"components\":[\"clip_default\"],\"ammo\":0,\"name\":\"WEAPON_COMBATPISTOL\",\"label\":\"Combat pistol\"}]', '0', '{\"watches_2\":-1,\"face_3\":1,\"torso_1\":282,\"eye_color\":12,\"beard_3\":0,\"torso_2\":6,\"eyebrows_1\":0,\"beard_1\":0,\"tshirt_1\":15,\"glasses_2\":-1,\"beard_2\":10,\"chain_1\":0,\"sex\":0,\"complexion_2\":1,\"skin\":14,\"hair_color_2\":28,\"watches_1\":-1,\"chain_2\":0,\"hair_color_1\":0,\"complexion_1\":0,\"arms\":0,\"glasses_1\":-1,\"helmet_2\":-1,\"ears_2\":-1,\"arms_2\":0,\"hair_2\":0,\"age_2\":0,\"age_1\":0,\"tshirt_2\":0,\"face_2\":24,\"shoes_1\":77,\"helmet_1\":-1,\"eyebrows_2\":10,\"moles_1\":0,\"pants_1\":82,\"face_1\":3,\"moles_2\":1,\"hair_1\":8,\"beard_4\":0,\"pants_2\":3,\"ears_1\":-1,\"shoes_2\":0}', 'GroveStreet', 6, 'mechanic', 4, 'police', 0, '[{\"val\":931900,\"name\":\"hunger\",\"percent\":93.19},{\"val\":948925,\"name\":\"thirst\",\"percent\":94.8925},{\"val\":100,\"name\":\"health\",\"percent\":100},{\"val\":0,\"name\":\"armor\",\"percent\":0}]', 0, NULL, '{\"type\":0,\"part\":0,\"time\":0}', '1', '06/25/2021', NULL, 0, '[{\"texture\":1,\"collection\":\"mpbusiness_overlays\"},{\"texture\":2,\"collection\":\"mpbusiness_overlays\"},{\"texture\":4,\"collection\":\"mpbiker_overlays\"}]', NULL, 0, 0, 0, 0, 0, 0, 0, 82283, '09392221544', 0, 0, 0, 1, 1234),
(8700, 'steam:110000148d11f2a', 'license:3edef7588d15d1c5d057e98ffb1526fd6bd36d7f', 'Kian_Behrouzian', '', '', 10000, 100000, 0, 'user', '{\"z\":31.22,\"y\":-905.06,\"x\":-228.78}', NULL, '[{\"item\":\"phone\",\"count\":1},{\"item\":\"gps\",\"count\":1},{\"item\":\"water\",\"count\":5},{\"item\":\"bread\",\"count\":5}]', '[]', '0', '{\"face_3\":5,\"face_2\":21,\"chain_1\":0,\"watches_2\":-1,\"tshirt_2\":0,\"pants_1\":10,\"torso_1\":4,\"age_2\":0,\"complexion_1\":0,\"glasses_1\":3,\"sex\":0,\"glasses_2\":9,\"eyebrows_2\":10,\"complexion_2\":1,\"shoes_1\":1,\"moles_1\":0,\"moles_2\":1,\"beard_3\":0,\"tshirt_1\":4,\"shoes_2\":0,\"eyebrows_1\":0,\"helmet_2\":-1,\"face_1\":0,\"ears_2\":-1,\"hair_1\":40,\"age_1\":0,\"arms\":6,\"pants_2\":0,\"beard_1\":0,\"beard_4\":0,\"arms_2\":0,\"eye_color\":0,\"hair_color_2\":0,\"hair_2\":0,\"hair_color_1\":0,\"skin\":12,\"watches_1\":-1,\"helmet_1\":-1,\"chain_2\":0,\"ears_1\":-1,\"beard_2\":10,\"torso_2\":0}', 'nogang', 0, 'unemployed', 0, 'police', 0, '[{\"percent\":98.50999999999999,\"name\":\"hunger\",\"val\":985100},{\"percent\":98.8825,\"name\":\"thirst\",\"val\":988825},{\"percent\":100,\"name\":\"health\",\"val\":100},{\"percent\":0,\"name\":\"armor\",\"val\":0}]', 0, NULL, '{\"type\":0,\"time\":0,\"part\":0}', NULL, '06/30/2021', NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 158, '09391731873', 0, 0, 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_convictions`
--

CREATE TABLE `user_convictions` (
  `id` int(11) NOT NULL,
  `char_id` int(11) DEFAULT NULL,
  `offense` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_convictions`
--

INSERT INTO `user_convictions` (`id`, `char_id`, `offense`, `count`) VALUES
(1, 2004, 'Vorood mamnoo', 1),
(2, 2004, 'Dor zadan gheyr e mojaz', 1),
(3, 2004, 'Aloodegi soti', 1),
(4, 2004, 'Ranandegi khatarnak', 1),
(5, 2004, 'Ranandegi dar line mokhalef', 1),
(6, 3761, 'Soraat mojaz 80Km/h', 1),
(7, 3761, 'Estefade az selahe garm dar shahr', 1),
(8, 476, 'Dozdi az bank', 1),
(9, 6248, 'Dor zadan gheyr e mojaz', 1),
(10, 963, 'Zadan o dar raftan', 1),
(11, 963, 'Soraat mojaz 60Km/h', 1),
(12, 963, 'Ranandegi khatarnak', 1),
(13, 963, 'Eteraz be ghanoon', 1),
(14, 963, 'Ranandegi bedoone govahinam', 1),
(15, 963, 'Bi tavajohi be ekhtar e police', 1),
(16, 963, 'Beham rikhtan e nazm ', 1),
(17, 2487, 'Eghdam be ghatle mamoor e ghanoon', 1),
(18, 2487, 'Shelik be samte mamoor e ghanoon', 1),
(19, 2487, 'Dozdi az maghaze', 1),
(20, 6756, 'Koshtan e mamoor e ghanoon', 1),
(21, 5445, 'Dozdi', 1),
(22, 6795, 'Dozdi', 1),
(23, 521, 'Harakat e khatarnak', 1),
(24, 521, 'Estefade az selahe garm dar shahr', 1),
(25, 521, 'Bi tavajohi be ekhtar e police', 1),
(26, 521, 'Tahdid Police', 1),
(27, 521, 'Majrooh kardan e mamoor e ghanoon', 1),
(28, 521, 'Tohin be mamoor e police', 1),
(29, 521, 'Soraat mojaz 80Km/h', 1),
(30, 521, 'Eghdam be ghatle mamoor e ghanoon', 1),
(31, 521, 'Zadan o dar raftan', 1),
(32, 521, 'Bi ehterami', 1),
(33, 521, 'Dashtan e aslahe gheyre mojaz', 1),
(34, 521, 'Shelik be samte mamoor e ghanoon', 1),
(35, 521, 'Beham rikhtan e nazm ', 1),
(36, 521, 'Ijad e fesad', 1),
(37, 521, 'Eteraz be ghanoon', 1),
(38, 7169, 'Dozdi az maghaze', 1),
(39, 2008, 'Majrooh kardan e mamoor e ghanoon', 1),
(40, 2008, 'Dozdi', 1),
(41, 476, 'Bi ehterami', 1),
(42, 476, 'Dozdi khodro', 1),
(43, 476, 'Tohin be mamoor e police', 1),
(44, 874, 'Vorood mamnoo', 1),
(45, 3403, 'Shelik be shahrvandan', 4),
(46, 3403, 'Vorood mamnoo', 4),
(47, 5838, 'Dor zadan gheyr e mojaz', 1),
(48, 5838, 'Vorood mamnoo', 1),
(49, 5838, 'Oboor az cheraghe ghermez', 1),
(50, 5838, 'Aloodegi soti', 2),
(51, 5838, 'Beham rikhtan e nazm ', 2),
(52, 2834, 'Dashtan e aslahe gheyre mojaz', 1),
(53, 2834, 'Foroosh e mavad e mokhader', 1),
(54, 4727, 'Shelik be samte mamoor e ghanoon', 1),
(55, 4727, 'Tolid e mavad e mokhader', 1),
(56, 4727, 'Dashtan e aslahe gheyre mojaz', 1),
(57, 3566, 'Eteraz be ghanoon', 1),
(58, 3566, 'Bi ehterami', 1),
(59, 6939, 'Eghdam be ghatle mamoor e ghanoon', 1),
(60, 6939, 'Koshtan e mamoor e ghanoon', 2),
(61, 7034, 'Koshtan e mamoor e ghanoon', 1),
(62, 7034, 'Shelik be samte mamoor e ghanoon', 1),
(63, 6939, 'Shelik be samte mamoor e ghanoon', 1),
(64, 1334, 'Dashtan e mavad e mokhader', 1),
(65, 6964, 'Oboor az cheraghe ghermez', 1),
(66, 6964, 'Bi tavajohi be ekhtar e police', 1),
(67, 6964, 'Vorood mamnoo', 1),
(68, 6964, 'Ranandegi khatarnak', 1),
(69, 6964, 'hamkari nakardan ba mamore ghanon', 1),
(70, 6964, 'Soraat mojaz 120Km/h', 1),
(71, 6244, 'Dozdi', 1),
(72, 6244, 'Dozdi az maghaze', 2),
(73, 6244, 'Estefade az selahe garm dar shahr', 1),
(74, 4300, 'Dozdi az maghaze', 2),
(75, 4300, 'Dozdi', 2),
(76, 4300, 'Estefade az selahe garm dar shahr', 2),
(77, 5458, 'Eghdam be ghatle mamoor e ghanoon', 1),
(78, 5458, 'Shelik be samte mamoor e ghanoon', 1),
(79, 4018, 'Eghdam be ghatle shahrvand', 1),
(80, 4018, 'Dashtan e mavad e mokhader', 1),
(81, 2638, 'Koshtan e shahrvand', 1),
(82, 7056, 'Oboor az cheraghe ghermez', 1),
(83, 7239, 'Bi ehterami', 1),
(84, 7239, 'Tahdid Police', 1),
(85, 7231, 'Eteraz be ghanoon', 1),
(86, 7231, 'Bi ehterami', 1),
(87, 7231, 'hamkari nakardan ba mamore ghanon', 1),
(88, 7231, 'Ijad e fesad', 1),
(89, 6592, 'Dashtan e mavad e mokhader', 1),
(90, 6592, 'Koshtan e shahrvand', 1),
(91, 6592, 'Shelik be shahrvandan', 1),
(92, 6592, 'Eghdam be ghatle shahrvand', 1),
(93, 7000, 'Koshtan e mamoor e ghanoon', 1),
(94, 7000, 'Eghdam be ghatle mamoor e ghanoon', 1),
(95, 7000, 'Dozdi az maghaze', 1),
(96, 7000, 'Shelik be samte mamoor e ghanoon', 1),
(97, 3862, 'Ranandegi bedoone govahinam', 1),
(98, 3862, 'Ranandegi khatarnak', 1),
(99, 3862, 'Dozdi khodro', 1),
(100, 6195, 'Dozdi az maghaze', 1),
(101, 4390, 'Foroosh e mavad e mokhader', 1),
(102, 4390, 'Dashtan e mavad e mokhader', 1),
(103, 4828, 'Shelik be samte mamoor e ghanoon', 1),
(104, 4828, 'Majrooh kardan e mamoor e ghanoon', 1),
(105, 4828, 'Eghdam be ghatle mamoor e ghanoon', 1),
(106, 4828, 'Dozdi az maghaze', 1),
(107, 4828, 'Koshtan e mamoor e ghanoon', 1),
(108, 6465, 'Dozdi', 2),
(109, 3960, 'Beham rikhtan e nazm ', 1),
(110, 3960, 'Bi tavajohi be ekhtar e police', 1),
(111, 5301, 'Shelik be samte mamoor e ghanoon', 1),
(112, 5301, 'Eghdam be ghatle mamoor e ghanoon', 1),
(113, 5301, 'Dozdi az maghaze', 1),
(114, 7271, 'Dozdi az maghaze', 1),
(115, 4873, 'Dozdi az maghaze', 2),
(116, 6244, 'Dozdi az bank', 1),
(117, 7383, 'Shelik be samte mamoor e ghanoon', 1),
(118, 7383, 'Koshtan e mamoor e ghanoon', 1),
(119, 7383, 'Majrooh kardan e mamoor e ghanoon', 1),
(120, 7383, 'Eghdam be ghatle mamoor e ghanoon', 1),
(121, 6110, 'Dozdi az maghaze', 1),
(122, 5718, 'Shelik be samte mamoor e ghanoon', 2),
(123, 5718, 'Eghdam be ghatle mamoor e ghanoon', 2),
(124, 5718, 'Dozdi az maghaze', 2),
(125, 314, 'Shelik be samte mamoor e ghanoon', 1),
(126, 314, 'Eghdam be ghatle mamoor e ghanoon', 1),
(127, 314, 'Dozdi az maghaze', 1),
(128, 4062, 'Dozdi az maghaze', 1),
(129, 2004, 'Tavaghof mamnoo', 1),
(130, 4873, 'Ranandegi dar line mokhalef', 1),
(131, 3522, 'Dozdi az maghaze', 1),
(132, 3522, 'Majrooh kardan e mamoor e ghanoon', 1),
(133, 3522, 'Shelik be samte mamoor e ghanoon', 1),
(134, 5608, 'Eghdam be ghatle mamoor e ghanoon', 1),
(135, 5608, 'Shelik be samte mamoor e ghanoon', 1),
(136, 5608, 'Dozdi az maghaze', 1),
(137, 4873, 'Shelik be samte mamoor e ghanoon', 1),
(138, 4873, 'Eghdam be ghatle mamoor e ghanoon', 1),
(139, 4425, 'Soraat mojaz 80Km/h', 1),
(140, 4425, 'hamkari nakardan ba mamore ghanon', 1),
(141, 6756, 'Dozdi khodro', 1),
(142, 6756, 'Oboor az cheraghe ghermez', 1),
(143, 6756, 'Ranandegi dar line mokhalef', 1),
(144, 6756, 'Ranandegi bedoone govahinam', 1),
(145, 6756, 'Dor zadan gheyr e mojaz', 1),
(146, 6110, 'Tahdid shahrvandan', 1),
(147, 5301, 'Dozdi khodro', 1),
(148, 7525, 'Estefade az selahe garm dar shahr', 1),
(149, 7525, 'hamkari nakardan ba mamore ghanon', 1),
(150, 7525, 'Dozdi az maghaze', 1),
(151, 7551, 'Eghdam be ghatle mamoor e ghanoon', 1),
(152, 7551, 'Dozdi az maghaze', 1),
(153, 7551, 'Majrooh kardan e mamoor e ghanoon', 1),
(154, 768, 'Eghdam be ghatle mamoor e ghanoon', 1),
(155, 768, 'Dozdi az maghaze', 1),
(156, 768, 'Koshtan e mamoor e ghanoon', 1),
(157, 7670, 'Eghdam be ghatle mamoor e ghanoon', 1),
(158, 7670, 'Shelik be samte mamoor e ghanoon', 1),
(159, 7670, 'Dozdi az maghaze', 1),
(160, 7768, 'hamkari nakardan ba mamore ghanon', 1),
(161, 7768, 'Shelik be samte mamoor e ghanoon', 1),
(162, 5718, 'Estefade az selahe garm dar shahr', 1),
(163, 5718, 'hamkari nakardan ba mamore ghanon', 1),
(164, 5718, 'Koshtan e shahrvand', 2),
(165, 4013, 'Ranandegi dar line mokhalef', 1),
(166, 7315, 'Tohin be mamoor e police', 1),
(167, 6561, 'Dozdi az maghaze', 1),
(168, 6561, 'Shelik be samte mamoor e ghanoon', 1),
(169, 7221, 'Shelik be samte mamoor e ghanoon', 1),
(170, 7221, 'Dozdi az maghaze', 1),
(171, 7221, 'Eghdam be ghatle mamoor e ghanoon', 1),
(172, 2638, 'Dozdi az maghaze', 1),
(173, 2638, 'Shelik be samte mamoor e ghanoon', 1),
(174, 2638, 'Eghdam be ghatle mamoor e ghanoon', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_documents`
--

CREATE TABLE `user_documents` (
  `id` int(11) NOT NULL,
  `owner` varchar(45) NOT NULL,
  `data` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_licenses`
--

CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL,
  `type` varchar(60) COLLATE utf8_persian_ci NOT NULL,
  `owner` varchar(60) COLLATE utf8_persian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `user_licenses`
--

INSERT INTO `user_licenses` (`id`, `type`, `owner`) VALUES
(6024, 'weapon', 'steam:110000148adfa01');

-- --------------------------------------------------------

--
-- Table structure for table `user_mdt`
--

CREATE TABLE `user_mdt` (
  `id` int(11) NOT NULL,
  `char_id` int(11) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `mugshot_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `name` varchar(60) COLLATE utf8_persian_ci NOT NULL,
  `model` varchar(60) COLLATE utf8_persian_ci NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) COLLATE utf8_persian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
('Adder', 'adder', 9000000, 'super'),
('Akuma', 'akuma', 110000, 'motorcycles'),
('Alpha', 'alpha', 130000, 'sports'),
('Asea', 'asea', 110000, 'sedans'),
('Autarch', 'autarch', 7000000, 'super'),
('Avarus', 'avarus', 100000, 'motorcycles'),
('Bagger', 'bagger', 55000, 'motorcycles'),
('Baller', 'baller2', 200000, 'suvs'),
('Baller Sport', 'baller3', 250000, 'suvs'),
('Banshee', 'banshee', 500000, 'sports'),
('Banshee 900R', 'banshee2', 10000000, 'super'),
('Bati 801', 'bati', 290000, 'motorcycles'),
('Bati 801RR', 'bati2', 400000, 'motorcycles'),
('Bestia GTS', 'bestiagts', 400000, 'sports'),
('BF400', 'bf400', 150000, 'motorcycles'),
('Bf Injection', 'bfinjection', 130000, 'offroad'),
('Bison', 'bison', 68000, 'vans'),
('Blade', 'blade', 150000, 'muscle'),
('Blazer', 'blazer', 600000, 'offroad'),
('Blazer Sport', 'blazer4', 1400000, 'offroad'),
('Blista', 'blista', 80000, 'compacts'),
('BMX (velo)', 'bmx', 25000, 'motorcycles'),
('Bobcat XL', 'bobcatxl', 110000, 'vans'),
('Brawler', 'brawler', 300000, 'offroad'),
('Brioso R/A', 'brioso', 65000, 'compacts'),
('Btype', 'btype', 360000, 'sportsclassics'),
('Btype Hotroad', 'btype2', 750000, 'sportsclassics'),
('Btype Luxe', 'btype3', 500000, 'sportsclassics'),
('Buccaneer', 'buccaneer', 200000, 'muscle'),
('Buccaneer Rider', 'buccaneer2', 190000, 'muscle'),
('Buffalo', 'buffalo', 200000, 'sports'),
('Buffalo S', 'buffalo2', 400000, 'sports'),
('Bullet', 'bullet', 9000000, 'super'),
('Burrito', 'burrito3', 115000, 'vans'),
('Camper', 'camper', 160000, 'vans'),
('Carbonizzare', 'carbonizzare', 670000, 'sports'),
('Carbon RS', 'carbonrs', 200000, 'motorcycles'),
('Casco', 'casco', 500000, 'sportsclassics'),
('Cavalcade', 'cavalcade2', 230000, 'suvs'),
('Cheetah', 'cheetah', 9000000, 'super'),
('Chimera', 'chimera', 500000, 'motorcycles'),
('Chino', 'chino', 190000, 'muscle'),
('Chino Luxe', 'chino2', 160000, 'muscle'),
('Cliffhanger', 'cliffhanger', 180000, 'motorcycles'),
('Cognoscenti Cabrio', 'cogcabrio', 200000, 'coupes'),
('Cognoscenti', 'cognoscenti', 130000, 'sedans'),
('Comet', 'comet2', 365000, 'sports'),
('Comet 5', 'comet5', 1145000, 'sports'),
('Contender', 'contender', 700000, 'suvs'),
('Coquette Classic', 'coquette2', 600000, 'sportsclassics'),
('Coquette BlackFin', 'coquette3', 550000, 'muscle'),
('Cyclone', 'cyclone', 7000000, 'super'),
('Daemon', 'daemon', 100000, 'motorcycles'),
('Daemon High', 'daemon2', 130000, 'motorcycles'),
('Defiler', 'defiler', 150000, 'motorcycles'),
('Dominator3', 'Dominator3', 20000000, 'vip1'),
('Double T', 'double', 200000, 'motorcycles'),
('Drafter', 'Drafter', 25000000, 'vip1'),
('Dubsta', 'dubsta', 390000, 'suvs'),
('Dubsta Luxuary', 'dubsta2', 400000, 'suvs'),
('Bubsta 6x6', 'dubsta3', 5000000, 'offroad'),
('Dukes', 'dukes', 180000, 'muscle'),
('Elegy', 'elegy2', 310000, 'sports'),
('emerus', 'emerus', 32150000, 'vip1'),
('Emperor', 'emperor', 110000, 'sedans'),
('Enduro', 'enduro', 90000, 'motorcycles'),
('Entity XF', 'entityxf', 5200000, 'super'),
('Exemplar', 'exemplar', 210000, 'coupes'),
('F620', 'f620', 260000, 'coupes'),
('Faction', 'faction', 200000, 'muscle'),
('Faction Rider', 'faction2', 220000, 'muscle'),
('Faction XL', 'faction3', 320000, 'muscle'),
('Faggio', 'faggio', 20000, 'motorcycles'),
('Vespa', 'faggio2', 50000, 'motorcycles'),
('Felon', 'felon', 300000, 'coupes'),
('Felon GT', 'felon2', 250000, 'coupes'),
('Feltzer', 'feltzer2', 590000, 'sports'),
('Stirling GT', 'feltzer3', 1600000, 'sportsclassics'),
('Flashgt', 'Flashgt', 15000000, 'vip1'),
('FMJ', 'fmj', 6000000, 'super'),
('Fhantom', 'fq2', 160000, 'suvs'),
('Fugitive', 'fugitive', 170000, 'sedans'),
('Gargoyle', 'gargoyle', 130000, 'motorcycles'),
('Gauntlet', 'gauntlet', 240000, 'muscle'),
('Gauntlet3', 'Gauntlet3', 19000000, 'vip1'),
('Gauntlet4', 'Gauntlet4', 29000000, 'vip1'),
('Gang Burrito', 'gburrito', 270000, 'vans'),
('Burrito 2', 'gburrito2', 120000, 'vans'),
('Glendale', 'glendale', 170000, 'sedans'),
('Grabger', 'granger', 1200000, 'suvs'),
('Gresley', 'gresley', 200000, 'suvs'),
('GT 500', 'gt500', 2000000, 'sportsclassics'),
('Guardian', 'guardian', 600000, 'offroad'),
('Hakuchou', 'hakuchou', 400000, 'motorcycles'),
('Hakuchou Sport', 'hakuchou2', 1500000, 'motorcycles'),
('Hermes', 'hermes', 530000, 'muscle'),
('Hexer', 'hexer', 120000, 'motorcycles'),
('Hotknife', 'hotknife', 900000, 'muscle'),
('Huntley S', 'huntley', 250000, 'suvs'),
('Hustler', 'hustler', 625000, 'muscle'),
('Infernus', 'infernus', 5000000, 'super'),
('Innovation', 'innovation', 120000, 'motorcycles'),
('Intruder', 'intruder', 230000, 'sedans'),
('Issi', 'issi2', 100000, 'compacts'),
('Italigto', 'Italigto', 36000000, 'vip1'),
('Jackal', 'jackal', 170000, 'coupes'),
('Jester', 'jester', 7000000, 'sports'),
('Jester(Racecar)', 'jester2', 7100000, 'sports'),
('Journey', 'journey', 6500, 'vans'),
('Jugular', 'Jugular', 20000000, 'vip1'),
('Kamacho', 'kamacho', 340000, 'offroad'),
('krieger', 'krieger', 32200000, 'vip1'),
('Kuruma', 'kuruma', 900000, 'sports'),
('Landstalker', 'landstalker', 170000, 'suvs'),
('Locust', 'Locust', 35000000, 'vip1'),
('Lynx', 'lynx', 800000, 'sports'),
('Mamba', 'mamba', 1000000, 'sports'),
('Manana', 'manana', 300000, 'sportsclassics'),
('Manchez', 'manchez', 860000, 'motorcycles'),
('Massacro', 'massacro', 850000, 'sports'),
('Mesa', 'mesa', 180000, 'suvs'),
('Mesa Trail', 'mesa3', 400000, 'suvs'),
('Ford MGT', 'mgt', 50000000, 'vip2'),
('Minivan', 'minivan', 180000, 'vans'),
('Monroe', 'monroe', 460000, 'sportsclassics'),
('Moonbeam', 'moonbeam', 85000, 'vans'),
('Moonbeam Rider', 'moonbeam2', 85000, 'vans'),
('Nemesis', 'nemesis', 115000, 'motorcycles'),
('Neo', 'Neo', 30000000, 'vip1'),
('Nero2', 'nero2', 16000000, 'super'),
('Nightblade', 'nightblade', 300000, 'motorcycles'),
('Nightshade', 'nightshade', 220000, 'muscle'),
('9F', 'ninef', 580000, 'sports'),
('9F Cabrio', 'ninef2', 580000, 'sports'),
('Omnis', 'omnis', 400000, 'sports'),
('Oracle XS', 'oracle2', 200000, 'coupes'),
('Osiris', 'osiris', 9000000, 'super'),
('Panto', 'panto', 65000, 'compacts'),
('Paradise', 'paradise', 180000, 'vans'),
('Paragon', 'Paragon', 22000000, 'vip1'),
('Patriot', 'patriot', 450000, 'suvs'),
('PCJ-600', 'pcj', 150000, 'motorcycles'),
('Penumbra', 'penumbra', 390000, 'sports'),
('Pfister', 'pfister811', 8800000, 'super'),
('Phoenix', 'phoenix', 220000, 'muscle'),
('Picador', 'picador', 180000, 'muscle'),
('Pigalle', 'pigalle', 400000, 'sportsclassics'),
('Prairie', 'prairie', 170000, 'compacts'),
('Premier', 'premier', 160000, 'sedans'),
('Primo Custom', 'primo2', 150000, 'sedans'),
('X80 Proto', 'prototipo', 9850000, 'super'),
('Radius', 'radi', 200000, 'suvs'),
('raiden', 'raiden', 6800000, 'sports'),
('Rapid GT', 'rapidgt', 550000, 'sports'),
('Rapid GT Convertible', 'rapidgt2', 600000, 'sports'),
('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
('Reaper', 'reaper', 7000000, 'super'),
('Rebel', 'rebel2', 120000, 'offroad'),
('Regina', 'regina', 60000, 'sedans'),
('Retinue', 'retinue', 615000, 'sportsclassics'),
('Rocoto', 'rocoto', 230000, 'suvs'),
('Ruffian', 'ruffian', 110000, 'motorcycles'),
('Rumpo', 'rumpo', 250000, 'vans'),
('Sabre Turbo', 'sabregt', 170000, 'muscle'),
('Sabre GT', 'sabregt2', 200000, 'muscle'),
('Sanchez', 'sanchez', 100000, 'motorcycles'),
('Sanchez Sport', 'sanchez2', 150000, 'motorcycles'),
('Sanctus', 'sanctus', 160000, 'motorcycles'),
('Sandking', 'sandking', 450000, 'offroad'),
('Schafter', 'schafter2', 180000, 'sedans'),
('Schafter V12', 'schafter3', 550000, 'sports'),
('Schlagen', 'Schlagen', 25000000, 'vip1'),
('Seminole', 'seminole', 130000, 'suvs'),
('Sentinel', 'sentinel', 180000, 'coupes'),
('Sentinel XS', 'sentinel2', 189000, 'coupes'),
('Seven 70', 'seven70', 750000, 'sports'),
('Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
('Slam Van', 'slamvan3', 120000, 'muscle'),
('Stinger', 'stinger', 500000, 'sportsclassics'),
('Stinger GT', 'stingergt', 650000, 'sportsclassics'),
('Streiter', 'streiter', 500000, 'sports'),
('Stretch', 'stretch', 3000000, 'sedans'),
('Sultan', 'sultan', 400000, 'sports'),
('Sultan RS', 'sultanrs', 2900000, 'super'),
('Super Diamond', 'superd', 300000, 'sedans'),
('Surano', 'surano', 600000, 'sports'),
('Surfer', 'surfer', 78000, 'vans'),
('T20', 't20', 12000000, 'super'),
('Tailgater', 'tailgater', 270000, 'sedans'),
('Tampa', 'tampa', 200000, 'muscle'),
('tezeract', 'tezeract', 36750000, 'vip1'),
('thrax', 'thrax', 48000000, 'vip2'),
('Trophy Truck', 'trophytruck', 3700000, 'offroad'),
('Trophy Truck Limited', 'trophytruck2', 4000000, 'offroad'),
('Tropos', 'tropos', 540000, 'sports'),
('Turismo R', 'turismor', 7700000, 'super'),
('Tyrus', 'tyrus', 6000000, 'super'),
('Vacca', 'vacca', 8500000, 'super'),
('vagner', 'vagner', 35150000, 'vip1'),
('Verlierer', 'verlierer2', 380000, 'sports'),
('Vigero', 'vigero', 230000, 'muscle'),
('Virgo', 'virgo', 100000, 'muscle'),
('Visione', 'visione', 9000000, 'super'),
('Voltic', 'voltic', 3000000, 'super'),
('Voodoo', 'voodoo', 130000, 'muscle'),
('Vortex', 'vortex', 140000, 'motorcycles'),
('Warrener', 'warrener', 80000, 'sedans'),
('Washington', 'washington', 120000, 'sedans'),
('Windsor', 'windsor', 135000, 'coupes'),
('Windsor Drop', 'windsor2', 246000, 'coupes'),
('Woflsbane', 'wolfsbane', 170000, 'motorcycles'),
('xa21', 'xa21', 39150000, 'vip1'),
('XLS', 'xls', 350000, 'suvs'),
('Youga', 'youga', 60000, 'vans'),
('Youga Luxuary', 'youga2', 110000, 'vans'),
('Z190', 'z190', 900000, 'sportsclassics'),
('Zentorno', 'zentorno', 15000000, 'super'),
('Zion', 'zion', 190000, 'coupes'),
('Zion Cabrio', 'zion2', 200000, 'coupes'),
('Zombie', 'zombiea', 100000, 'motorcycles'),
('Zombie Luxuary', 'zombieb', 115000, 'motorcycles'),
('Z-Type', 'ztype', 8000000, 'sportsclassics');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_categories`
--

CREATE TABLE `vehicle_categories` (
  `name` varchar(60) COLLATE utf8_persian_ci NOT NULL,
  `label` varchar(60) COLLATE utf8_persian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `vehicle_categories`
--

INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
('compacts', 'Compacts'),
('coupes', 'Coupes'),
('motorcycles', 'Motos'),
('muscle', 'Muscle'),
('offroad', 'Off Road'),
('sedans', 'Sedans'),
('sports', 'Sports'),
('sportsclassics', 'Sports Classics'),
('super', 'Super'),
('suvs', 'SUVs'),
('vans', 'Vans'),
('vip1', 'VIP\'S 1'),
('vip2', 'VIP\'S 2');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_sold`
--

CREATE TABLE `vehicle_sold` (
  `client` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `model` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `plate` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `soldby` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `date` varchar(50) COLLATE utf8_persian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `warrants_list`
--

CREATE TABLE `warrants_list` (
  `id` int(11) NOT NULL,
  `json_data` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `weashops`
--

CREATE TABLE `weashops` (
  `id` int(11) NOT NULL,
  `zone` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `item` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `weashops`
--

INSERT INTO `weashops` (`id`, `zone`, `item`, `price`) VALUES
(1, 'GunShop', 'WEAPON_PISTOL', 70000),
(9, 'GunShop', 'WEAPON_BAT', 15000),
(53, 'GunShop', 'weapon_combatpistol', 100000),
(54, 'GunShop', 'WEAPON_HEAVYPISTOL', 130000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addon_account`
--
ALTER TABLE `addon_account`
  ADD PRIMARY KEY (`name`) USING BTREE;

--
-- Indexes for table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`) USING BTREE,
  ADD KEY `index_addon_account_data_account_name` (`account_name`) USING BTREE;

--
-- Indexes for table `addon_inventory`
--
ALTER TABLE `addon_inventory`
  ADD PRIMARY KEY (`name`) USING BTREE;

--
-- Indexes for table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`) USING BTREE,
  ADD KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`) USING BTREE,
  ADD KEY `index_addon_inventory_inventory_name` (`inventory_name`) USING BTREE;

--
-- Indexes for table `adminjaillog`
--
ALTER TABLE `adminjaillog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `arrests_list`
--
ALTER TABLE `arrests_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `baninfo`
--
ALTER TABLE `baninfo`
  ADD PRIMARY KEY (`identifier`);

--
-- Indexes for table `banlist`
--
ALTER TABLE `banlist`
  ADD PRIMARY KEY (`identifier`);

--
-- Indexes for table `banlisthistory`
--
ALTER TABLE `banlisthistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`),
  ADD KEY `license` (`license`);

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `identifier` (`identifier`) USING BTREE;

--
-- Indexes for table `blackmarket`
--
ALTER TABLE `blackmarket`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `bolos_list`
--
ALTER TABLE `bolos_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `car_parking`
--
ALTER TABLE `car_parking`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `code`
--
ALTER TABLE `code`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code` (`code`);

--
-- Indexes for table `datastore`
--
ALTER TABLE `datastore`
  ADD PRIMARY KEY (`name`) USING BTREE;

--
-- Indexes for table `datastore_data`
--
ALTER TABLE `datastore_data`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`) USING BTREE,
  ADD KEY `index_datastore_data_name` (`name`) USING BTREE;

--
-- Indexes for table `denied`
--
ALTER TABLE `denied`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `division_grades`
--
ALTER TABLE `division_grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fines`
--
ALTER TABLE `fines`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `identifier` (`identifier`);

--
-- Indexes for table `fine_types`
--
ALTER TABLE `fine_types`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `gangs_data`
--
ALTER TABLE `gangs_data`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `gang_account_data`
--
ALTER TABLE `gang_account_data`
  ADD PRIMARY KEY (`ID`) USING BTREE;

--
-- Indexes for table `gang_grades`
--
ALTER TABLE `gang_grades`
  ADD PRIMARY KEY (`ID`) USING BTREE,
  ADD KEY `skin_male` (`skin_male`(255)),
  ADD KEY `skin_female` (`skin_female`(255)),
  ADD KEY `gang_name` (`gang_name`),
  ADD KEY `grade` (`grade`);

--
-- Indexes for table `gas_station_balance`
--
ALTER TABLE `gas_station_balance`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `gas_station_business`
--
ALTER TABLE `gas_station_business`
  ADD PRIMARY KEY (`gas_station_id`) USING BTREE;

--
-- Indexes for table `gas_station_jobs`
--
ALTER TABLE `gas_station_jobs`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `granted`
--
ALTER TABLE `granted`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD KEY `name` (`name`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`name`) USING BTREE;

--
-- Indexes for table `job_grades`
--
ALTER TABLE `job_grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `skin_male` (`skin_male`(255)),
  ADD KEY `skin_female` (`skin_female`(255));

--
-- Indexes for table `jsfour_cardetails`
--
ALTER TABLE `jsfour_cardetails`
  ADD PRIMARY KEY (`pk`);

--
-- Indexes for table `jsfour_criminalrecord`
--
ALTER TABLE `jsfour_criminalrecord`
  ADD PRIMARY KEY (`offense`);

--
-- Indexes for table `jsfour_criminaluserinfo`
--
ALTER TABLE `jsfour_criminaluserinfo`
  ADD PRIMARY KEY (`identifier`);

--
-- Indexes for table `jsfour_efterlysningar`
--
ALTER TABLE `jsfour_efterlysningar`
  ADD PRIMARY KEY (`pk`);

--
-- Indexes for table `jsfour_incidents`
--
ALTER TABLE `jsfour_incidents`
  ADD PRIMARY KEY (`pk`);

--
-- Indexes for table `jsfour_logs`
--
ALTER TABLE `jsfour_logs`
  ADD PRIMARY KEY (`pk`);

--
-- Indexes for table `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`type`) USING BTREE;

--
-- Indexes for table `mdt_reports`
--
ALTER TABLE `mdt_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdt_warrants`
--
ALTER TABLE `mdt_warrants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meeta_accessory_inventory`
--
ALTER TABLE `meeta_accessory_inventory`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `owner` (`owner`) USING BTREE,
  ADD KEY `type` (`type`) USING BTREE;

--
-- Indexes for table `meeta_vehicle_trunk`
--
ALTER TABLE `meeta_vehicle_trunk`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `plate` (`plate`) USING BTREE,
  ADD KEY `isweapon` (`isweapon`) USING BTREE,
  ADD KEY `id` (`id`) USING BTREE,
  ADD KEY `owner` (`owner`);

--
-- Indexes for table `owned_properties`
--
ALTER TABLE `owned_properties`
  ADD KEY `name` (`name`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `owned_shops`
--
ALTER TABLE `owned_shops`
  ADD PRIMARY KEY (`number`) USING BTREE;

--
-- Indexes for table `owned_vehicles_headlights`
--
ALTER TABLE `owned_vehicles_headlights`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_app_chat`
--
ALTER TABLE `phone_app_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_calls`
--
ALTER TABLE `phone_calls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_messages`
--
ALTER TABLE `phone_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `playerhousing`
--
ALTER TABLE `playerhousing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `police_ext`
--
ALTER TABLE `police_ext`
  ADD PRIMARY KEY (`identifier`),
  ADD KEY `division` (`division`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `name` (`name`),
  ADD KEY `inside` (`inside`),
  ADD KEY `outside` (`outside`),
  ADD KEY `exit` (`exit`),
  ADD KEY `entering` (`entering`);

--
-- Indexes for table `properties_inventory`
--
ALTER TABLE `properties_inventory`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `propertie_id` (`propertie_id`),
  ADD KEY `owner` (`owner`);

--
-- Indexes for table `rented_vehicles`
--
ALTER TABLE `rented_vehicles`
  ADD PRIMARY KEY (`plate`) USING BTREE;

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`identifier`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trunk_inventory`
--
ALTER TABLE `trunk_inventory`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `plate` (`plate`) USING BTREE,
  ADD KEY `owned` (`owned`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`identifier`),
  ADD KEY `id` (`id`),
  ADD KEY `playerName` (`playerName`(191)),
  ADD KEY `tattoos` (`tattoos`(191)),
  ADD KEY `is_dead` (`is_dead`),
  ADD KEY `skin` (`skin`(191)),
  ADD KEY `loadout` (`loadout`(191)),
  ADD KEY `inventory` (`inventory`(191));

--
-- Indexes for table `user_convictions`
--
ALTER TABLE `user_convictions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_documents`
--
ALTER TABLE `user_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_licenses`
--
ALTER TABLE `user_licenses`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `type` (`type`),
  ADD KEY `owner` (`owner`);

--
-- Indexes for table `user_mdt`
--
ALTER TABLE `user_mdt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`model`) USING BTREE,
  ADD KEY `price` (`price`),
  ADD KEY `category` (`category`);

--
-- Indexes for table `vehicle_categories`
--
ALTER TABLE `vehicle_categories`
  ADD PRIMARY KEY (`name`) USING BTREE;

--
-- Indexes for table `vehicle_sold`
--
ALTER TABLE `vehicle_sold`
  ADD PRIMARY KEY (`plate`) USING BTREE;

--
-- Indexes for table `warrants_list`
--
ALTER TABLE `warrants_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weashops`
--
ALTER TABLE `weashops`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21461;

--
-- AUTO_INCREMENT for table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4092;

--
-- AUTO_INCREMENT for table `adminjaillog`
--
ALTER TABLE `adminjaillog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `arrests_list`
--
ALTER TABLE `arrests_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banlisthistory`
--
ALTER TABLE `banlisthistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1640;

--
-- AUTO_INCREMENT for table `billing`
--
ALTER TABLE `billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1306;

--
-- AUTO_INCREMENT for table `blackmarket`
--
ALTER TABLE `blackmarket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `bolos_list`
--
ALTER TABLE `bolos_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `car_parking`
--
ALTER TABLE `car_parking`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `code`
--
ALTER TABLE `code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `datastore_data`
--
ALTER TABLE `datastore_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52462;

--
-- AUTO_INCREMENT for table `denied`
--
ALTER TABLE `denied`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `division_grades`
--
ALTER TABLE `division_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fines`
--
ALTER TABLE `fines`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fine_types`
--
ALTER TABLE `fine_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `gangs_data`
--
ALTER TABLE `gangs_data`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `gang_account_data`
--
ALTER TABLE `gang_account_data`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=382;

--
-- AUTO_INCREMENT for table `gang_grades`
--
ALTER TABLE `gang_grades`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2288;

--
-- AUTO_INCREMENT for table `gas_station_balance`
--
ALTER TABLE `gas_station_balance`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gas_station_jobs`
--
ALTER TABLE `gas_station_jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `granted`
--
ALTER TABLE `granted`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2861;

--
-- AUTO_INCREMENT for table `job_grades`
--
ALTER TABLE `job_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `jsfour_cardetails`
--
ALTER TABLE `jsfour_cardetails`
  MODIFY `pk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jsfour_efterlysningar`
--
ALTER TABLE `jsfour_efterlysningar`
  MODIFY `pk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jsfour_incidents`
--
ALTER TABLE `jsfour_incidents`
  MODIFY `pk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jsfour_logs`
--
ALTER TABLE `jsfour_logs`
  MODIFY `pk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdt_reports`
--
ALTER TABLE `mdt_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `mdt_warrants`
--
ALTER TABLE `mdt_warrants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `meeta_accessory_inventory`
--
ALTER TABLE `meeta_accessory_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meeta_vehicle_trunk`
--
ALTER TABLE `meeta_vehicle_trunk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11731;

--
-- AUTO_INCREMENT for table `owned_properties`
--
ALTER TABLE `owned_properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3034;

--
-- AUTO_INCREMENT for table `owned_vehicles_headlights`
--
ALTER TABLE `owned_vehicles_headlights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `phone_app_chat`
--
ALTER TABLE `phone_app_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=353;

--
-- AUTO_INCREMENT for table `phone_calls`
--
ALTER TABLE `phone_calls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2224;

--
-- AUTO_INCREMENT for table `phone_messages`
--
ALTER TABLE `phone_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21864;

--
-- AUTO_INCREMENT for table `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `properties_inventory`
--
ALTER TABLE `properties_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=931;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trunk_inventory`
--
ALTER TABLE `trunk_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12660;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8712;

--
-- AUTO_INCREMENT for table `user_convictions`
--
ALTER TABLE `user_convictions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT for table `user_documents`
--
ALTER TABLE `user_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=470;

--
-- AUTO_INCREMENT for table `user_licenses`
--
ALTER TABLE `user_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6025;

--
-- AUTO_INCREMENT for table `user_mdt`
--
ALTER TABLE `user_mdt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warrants_list`
--
ALTER TABLE `warrants_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `weashops`
--
ALTER TABLE `weashops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
