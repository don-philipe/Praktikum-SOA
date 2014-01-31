-- phpMyAdmin SQL Dump
-- version 4.1.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 31, 2014 at 04:45 PM
-- Server version: 5.1.71-log
-- PHP Version: 5.5.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tobias90_bikesharingservice_oauth`
--

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `access_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`access_token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`access_token`, `client_id`, `user_id`, `expires`, `scope`) VALUES
('02bc66e150cbc330dcd444482b3624b509548929', 'testclient', '1', '2014-01-27 12:09:21', NULL),
('0c80fee3f0bca1e670f10f0ad8c181832ea73aad', 'testclient', '1', '2014-01-22 17:27:01', NULL),
('0d5071f979bed166af9094861258c1d7b20c0930', 'testclient', '1', '2014-01-27 12:10:34', NULL),
('147ae99891b243882c85e16d88dcb2c5faaa3d7e', 'testclient', '1234', '2014-01-22 15:30:20', NULL),
('14e17a3bfcc41af0489b6d10b9d2833443b86db2', 'testclient', NULL, '2014-01-22 13:41:48', NULL),
('1529a9546368a9727ab7ff97ecd338f1a2a99c49', 'testclient', '1', '2014-01-22 17:46:48', NULL),
('1ad39443446c26f5a5e98f2f01c633c8b55bbf84', 'testclient', '1234', '2014-01-22 15:22:41', NULL),
('1c9eca289882f6c157f884c154d8c8c600018917', 'testclient', '1', '2014-01-28 14:53:14', NULL),
('223a573887820fd42311aeffc560a590860fc395', 'testclient', '1', '2014-01-27 12:32:55', NULL),
('23f71f1a075eaa432501a21a82e4cac975204514', 'testclient', '1234', '2014-01-22 15:26:37', NULL),
('255b7b9f595bd21bcfbedd9299d2a497b484c3c3', 'testclient', '1', '2014-01-22 16:57:21', NULL),
('3609f2fa89133d238b73f4c1aa8d6aa844daed6c', 'testclient', '1234', '2014-01-22 15:51:27', NULL),
('3c5bed0b0f8652f7b16a9318beedc337b2ef2950', 'testclient', '1', '2014-01-26 17:13:04', NULL),
('410f5d9ce2f80decc4db785bef68a212a8229c3a', 'testclient', '1', '2014-01-25 15:10:28', NULL),
('474cfd0131677430cccb549160a3397f09cfdd29', 'testclient', '1234', '2014-01-22 15:29:44', NULL),
('489ea6c75eddd6cf7d90917b7b6e551edb4c4ef3', 'testclient', '1', '2014-01-22 17:47:33', NULL),
('4a908d5b0e7ea22bd984bbdcf69ae3040fce39a1', 'testclient', NULL, '2014-01-22 13:25:59', NULL),
('53a54e69f4b8c94f44777dbb2cc9d6d141d73dcb', 'testclient', '1', '2014-01-26 17:40:11', NULL),
('54c1e99891fbb4a221d33aa3f97d267a90dd6113', 'testclient', NULL, '2014-01-22 13:25:40', NULL),
('59e129bc154d074110c940c6348cfe08ca8a613b', 'testclient', '1', '2014-01-22 16:38:21', NULL),
('5bbc6dbcfb772c8eab295b1b80cf0610e6c84cfd', 'testclient', '1', '2014-01-22 17:48:47', NULL),
('5e5bd05a03cf03a10940492fd9aa8797487423b2', 'testclient', '1234', '2014-01-22 16:23:20', NULL),
('625eca764496deb07a888dc0a850d976079b286d', 'testclient', '1', '2014-01-25 12:18:06', NULL),
('681fbc2a86e6501c2f9debd0b761bf8f1fbe2cfd', 'testclient', '1', '2014-01-25 11:14:03', NULL),
('6f35f135a949f73fc0e954a080188464a7f2cb34', 'testclient', '1234', '2014-01-22 14:50:51', 'address'),
('7333df9e76cbc240804acc2d41862dfcbf89b237', 'testclient', NULL, '2014-01-22 13:01:23', NULL),
('73d217b14dc6605956e263c0b74a61e7374ae95c', 'testclient', '1234', '2014-01-22 15:22:46', NULL),
('78d5041240ec28e2b4f55ec90f0878ddf495b43e', 'testclient', '1', '2014-01-26 17:17:35', NULL),
('7dba7277c8515e5488bff569ab308276dda45188', 'testclient', '1', '2014-01-28 09:17:58', NULL),
('80bfd89201dbe9cefa9b0ceca58a49acf5e68215', 'testclient', '1234', '2014-01-22 15:52:08', NULL),
('8b2f4cd7a6fdd4bb62dc867fd08c271fd779763a', 'testclient', '1234', '2014-01-22 15:52:40', NULL),
('8b8424ef2048bb413f4c280557f2b1684ba1dc7d', 'testclient', '1', '2014-01-27 12:13:03', NULL),
('8e5eed805e776e2d249441073e9bc34022bee3b3', 'testclient', '1234', '2014-01-22 15:41:08', NULL),
('94ee23fb6ce8d0a69a4c8e6138c8bc8acc694f98', 'testclient', '1', '2014-01-24 14:44:05', NULL),
('959e37c7fcdc340d1286d1e980e88a81d09e703f', 'testclient', '1', '2014-01-22 17:48:27', NULL),
('964b8b7f89243bf47a3782c1ec345f0fc3b8dc58', 'testclient', '1', '2014-01-25 15:09:58', NULL),
('980d905de00f5e87070c163b9e337ed9f0fcf12a', 'testclient', '1234', '2014-01-22 15:53:13', NULL),
('9b8c7c10093394ac13dbf285095ae59773c06863', 'testclient', '1', '2014-01-22 17:47:48', NULL),
('9cee7f592c700940d4391c1ced9a6010405fe7e2', 'testclient', '1', '2014-01-26 17:06:01', NULL),
('a02baf0ff9f279a5c14b37b90de7e2cb3c9dac53', 'testclient', '1234', '2014-01-22 15:03:39', NULL),
('a534470a2c4b9079c1ccf9a984efe93b01d5360d', 'testclient', '1', '2014-01-26 17:52:46', NULL),
('a60317c543fce91cad950b2aa0502cf71bb08f4a', 'testclient', '1', '2014-01-24 13:21:48', NULL),
('a6d6300e0ce5b02591a113bac5698c1c3ae25109', 'testclient', '1', '2014-01-25 10:04:40', NULL),
('aafc7a68f4a2987175887bba3188efe9b7b76d9f', 'testclient', '1234', '2014-01-22 15:48:57', NULL),
('b2d48a4d426436fcce6735010ce49d1a3a7f3a68', 'testclient', '1', '2014-01-22 17:49:23', NULL),
('b53a9779534f9ca39e667e28b2895d2af62e1bcb', 'testclient', NULL, '2014-01-22 14:49:00', NULL),
('b668df16feb286fe4f2fbb4699b844b58f8272ed', 'testclient', '1234', '2014-01-22 15:40:34', NULL),
('bb86780010071b21efa09ba05fcd825123828777', 'testclient', '1', '2014-01-26 17:40:42', NULL),
('be2a09398f01e605dc4f9b9d3a483eaadba90ee5', 'testclient', '1234', '2014-01-22 15:54:15', NULL),
('c54bc478c433b79af7ed7c554d80e9a633258ceb', 'testclient', NULL, '2014-01-22 12:54:48', NULL),
('c6888da33e33c7a90220f5fe97272d8779244aa4', 'testclient', '1', '2014-01-22 17:29:49', NULL),
('c9aa6ed7ba751eeca0c9727a0f702c1ecb30290a', 'testclient', '1234', '2014-01-22 15:22:13', NULL),
('cca5136527f304b96516b9b7a9c58d9a23936006', 'testclient', '1', '2014-01-27 13:46:37', NULL),
('cdd6fa6872d69592f2d2baeb34b3c40fea68c008', 'testclient', NULL, '2014-01-22 13:21:56', NULL),
('cfc11eb33ea2d2075f3d31de6bce712a1b867eb0', 'testclient', '1', '2014-01-26 17:31:58', NULL),
('d0a767001fde0916a3982eba4023449b48de2bb9', 'testclient', '1234', '2014-01-22 15:58:28', NULL),
('d82752ae44e098cccddeb27c147201cd10f5778c', 'testclient', '1234', '2014-01-22 16:23:01', NULL),
('deb56807edc899e7ebaaed5286405aff82312621', 'testclient', '1', '2014-01-26 17:12:25', NULL),
('ecb8a0c4ee4568e9caf09969e9827b171682ed70', 'testclient', '1', '2014-01-22 17:46:31', NULL),
('fabc4f933eebab25c14f7d7f230c0dd17f51cad7', 'testclient', '1', '2014-01-22 17:51:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_authorization_codes`
--

CREATE TABLE IF NOT EXISTS `oauth_authorization_codes` (
  `authorization_code` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `redirect_uri` varchar(2000) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`authorization_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oauth_authorization_codes`
--

INSERT INTO `oauth_authorization_codes` (`authorization_code`, `client_id`, `user_id`, `redirect_uri`, `expires`, `scope`) VALUES
('0133949537f52d8263c59773090557a78d1ecf8d', 'bikesharing_webclient', '1', NULL, '2014-01-26 16:16:00', NULL),
('01b27fd848b7a74acc0568f19adcb6d030d0927e', 'bikesharing_webclient', '1', NULL, '2014-01-26 16:17:43', NULL),
('01ea09164fa08a2e58833b70a2310755a1d0399c', 'testclient', '1234', NULL, '2014-01-22 13:01:33', NULL),
('06767670b03450d6fe68bfe0c15fe35f00ca2017', 'testclient', '1234', NULL, '2014-01-22 12:07:00', NULL),
('0743156b7821fcdf2f0d00c4da13c69154289411', 'testclient', '1', NULL, '2014-01-25 14:06:44', NULL),
('0935ae4114cc94a4e2ff8741855a22dc6f34d1d6', 'testclient', '1', NULL, '2014-01-27 11:11:12', NULL),
('0af417242af4bea28e0df43a959701feb6da3212', 'testclient', '1234', NULL, '2014-01-22 14:09:34', NULL),
('10dbe9f7247deafd68ea1dfaadc6251a8d6e0681', 'testclient', '1', NULL, '2014-01-27 11:07:08', NULL),
('11d770c5367aff26df6bd8208d15d4da2a229ff4', 'testclient', '1', NULL, '2014-01-27 11:12:06', NULL),
('17e3666ea2d0d32660e6d629b2df4106b197cd40', 'testclient', '1234', NULL, '2014-01-22 13:03:37', NULL),
('29a91697bf633752c36dfa46e136644e608f46c1', 'bikesharing_webclient', '1', NULL, '2014-01-26 16:15:40', NULL),
('2e0424cf7d1e6a4c5d1a4ca0978a6c05d1d598d4', 'testclient', '1234', 'http://localhost/BikeSharing/src/client/', '2014-01-22 14:09:41', 'address'),
('2fbf85240ea6867e68b7f8cbaef29aa98def67b4', 'testclient', '1234', NULL, '2014-01-22 13:15:29', NULL),
('43476797aa102e6bc7ee3d1489f00e9b457be84f', 'testclient', '1234', NULL, '2014-01-22 14:11:11', NULL),
('43efa3c6b11843a41c0b30bf3986d0326a5bbc5f', 'testclient', '1234', NULL, '2014-01-22 14:30:27', NULL),
('4e968694cc2bd0392ecd8ea908e20d31c86699bc', 'testclient', '1234', NULL, '2014-01-22 14:13:01', NULL),
('4ef94ce525d9bd652de7ee8f331c03c4d2df3050', 'testclient', '1234', NULL, '2014-01-22 13:10:18', NULL),
('552a5a73d44cd3e70abfdf87f6727efb2018cfb4', 'testclient', '1', NULL, '2014-01-25 14:05:53', NULL),
('5b586fc5d75861f9bd5737e85c3f4f7580d00b4a', 'testclient', '1234', NULL, '2014-01-22 12:42:33', NULL),
('6fcb4b55dd77c8690a163833248296d7be31b44e', 'testclient', '1234', NULL, '2014-01-22 14:40:41', NULL),
('736e7ecfdb4d712d2b8f9390cb0e8f1e2358af31', 'testclient', '1234', NULL, '2014-01-22 13:19:17', NULL),
('830f1b2ac90b3b52d55d401fefa17f016cd98c95', 'testclient', '1', NULL, '2014-01-27 11:09:33', NULL),
('89a2c450fce29a100a39abf5a93d1c82e946973e', 'testclient', '1234', NULL, '2014-01-22 14:12:39', NULL),
('8bc00f7ffc24ccd51ccd4e9df35c964fef0053bf', 'testclient', '1234', 'http://localhost/BikeSharing/src/client/', '2014-01-22 13:42:21', 'address'),
('97737074219016be452abde42f94831181ded97b', 'testclient', '1', NULL, '2014-01-27 11:06:46', NULL),
('9eae3b81c45b3c60f230d9250660bb4f284face1', 'testclient', '1234', 'http://localhost/BikeSharing/src/client/', '2014-01-22 13:32:34', 'address'),
('a19fa177ea365c134f49c4fa99b2d33f97decf75', 'testclient', '1234', NULL, '2014-01-22 13:06:27', NULL),
('a1f676783dfac486d970bd4c261fca3d0904cd5f', 'testclient', '1234', NULL, '2014-01-22 13:03:49', NULL),
('a3a3e2eba46af23111fbb59a4b7340235204a6f4', 'testclient', '1234', 'http://localhost/BikeSharing/src/client/', '2014-01-22 13:45:38', 'address'),
('af6edc9a87bf082b9a60dd8bcf73f95d7627b74b', 'testclient', '1234', NULL, '2014-01-22 14:35:37', NULL),
('b4afc0a9662d752f8754effc3b62f4288c7b98c9', 'testclient', '1', NULL, '2014-01-25 14:05:45', NULL),
('b730652e0913ba40ad1de5d860ef8c9a2e62ceab', 'testclient', '1234', NULL, '2014-01-22 13:31:19', 'address'),
('bc4a29351d8b93676479ae521b3b8135ae77981f', 'testclient', '1234', NULL, '2014-01-22 13:13:44', NULL),
('cb5617023b20908d640b478099b60960bc20ba64', 'testclient', '1234', 'http://localhost/BikeSharing/src/client/', '2014-01-22 14:08:37', 'address'),
('cdd02059b542d87ce33c9c00190f47a0de37789e', 'testclient', '1234', 'http://localhost/BikeSharing/src/client/', '2014-01-22 13:50:14', 'address'),
('dc2e617f0bacec55447f8a9e64f4b525dc0e0d10', 'testclient', NULL, NULL, '2014-01-22 12:00:34', NULL),
('e64fcdb5411b65961a14bede216c134fc1bf872d', 'testclient', '1234', NULL, '2014-01-22 14:41:30', NULL),
('f0ab61bbb73101063defdef8a6f3ace0524119be', 'testclient', '1234', NULL, '2014-01-22 13:17:17', NULL),
('f0e5e0287a583f4907b6de5c04cf4c7c1a3cdbd4', 'testclient', '1234', NULL, '2014-01-22 14:34:17', NULL),
('f41238af37c0450e2c7ef31fbc8e8cb01d3b5813', 'testclient', '1234', NULL, '2014-01-22 13:01:07', NULL),
('f86f0f07ab2301b0faba8608cfd2450eb9ad5f0f', 'testclient', '1234', NULL, '2014-01-22 14:39:35', NULL),
('fc34b6c4fb811c3a7e6e102b288a71721f3c803b', 'testclient', '1234', NULL, '2014-01-22 14:13:20', NULL),
('ff068a98404de3e1d94582870a1777b8d7ee02b5', 'testclient', '1234', NULL, '2014-01-22 14:09:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `client_id` varchar(80) NOT NULL,
  `client_secret` varchar(80) NOT NULL,
  `redirect_uri` varchar(2000) NOT NULL,
  `grant_types` varchar(80) DEFAULT NULL,
  `scope` varchar(100) DEFAULT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`client_id`, `client_secret`, `redirect_uri`, `grant_types`, `scope`, `user_id`) VALUES
('testclient', 'testpass', 'https://tobias90.circinus.uberspace.de/client/', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_jwt`
--

CREATE TABLE IF NOT EXISTS `oauth_jwt` (
  `client_id` varchar(80) NOT NULL,
  `subject` varchar(80) DEFAULT NULL,
  `public_key` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `refresh_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`refresh_token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`refresh_token`, `client_id`, `user_id`, `expires`, `scope`) VALUES
('0287b7d455a07172e3d7e56a1c3f99e9bdca0b0e', 'testclient', '1', '2014-02-05 16:51:28', NULL),
('04342b64588fce24280a168100d0ca1c0cc64387', 'testclient', '1', '2014-02-10 11:13:03', NULL),
('0de57bd1a405567eaf010cdacf1ac60226bfcf21', 'testclient', '1', '2014-02-05 16:49:23', NULL),
('0e12e5c748228fe07f56985386082cb1f35f09ae', 'testclient', '1', '2014-02-11 13:53:14', NULL),
('0f9d220866c14bc92898f7836d9cbd6d08c07b8f', 'testclient', '1', '2014-02-05 16:29:49', NULL),
('16c6a502e1ef8ac6758db4b085cfbb58e6844e16', 'testclient', '1', '2014-02-09 16:40:11', NULL),
('20b6b6347886d79c9ecdda8a1cfdc1e8407a9296', 'testclient', '1', '2014-02-07 13:44:05', NULL),
('24bf2ae45c3dac70e61632240d9066a47618463c', 'testclient', '1234', '2014-02-05 14:22:13', NULL),
('29b48201f1411fd55e9ce57d27739e74cb96a1af', 'testclient', '1', '2014-02-09 16:52:46', NULL),
('2e3e70fd7098ec00444e3b8a97eeb0daceff2326', 'testclient', '1', '2014-02-05 16:46:31', NULL),
('38a01f2b393199e71324fdba31d7079a6588a7e4', 'testclient', '1', '2014-02-10 11:10:34', NULL),
('3bde6bd586b8798b1686c73c9fe37da716cdf2ee', 'testclient', '1234', '2014-02-05 14:58:28', NULL),
('3e243c8346fb3dda8c7293b08598c9efc888f762', 'testclient', '1234', '2014-02-05 14:48:57', NULL),
('414d346c3f2c1554be568d24b4ad63c657503bcd', 'testclient', '1234', '2014-02-05 14:22:46', NULL),
('42e16002829e42f60a4df54c940c5a53610d295f', 'testclient', '1', '2014-02-09 16:31:58', NULL),
('43c53764e24b265c3c6f4428b33b5e8b67d7ef54', 'testclient', '1', '2014-02-11 08:17:58', NULL),
('4545fae00716eb6efa53866db036706b6985ec99', 'testclient', '1234', '2014-02-05 14:51:27', NULL),
('4ef9c7db4f445e80055452533828d8e5c205e503', 'testclient', '1', '2014-02-08 10:14:03', NULL),
('4f480b411dda06c454d07a186ae6f35d219eee7c', 'testclient', '1', '2014-02-05 16:48:47', NULL),
('4f81723bce5e3e410ae883990ee34c34066d6f4d', 'testclient', '1', '2014-02-09 16:06:01', NULL),
('608b242c375b698a350407275ecb1c6dca91aa04', 'testclient', '1', '2014-02-05 16:27:01', NULL),
('60bbc8260bf4fe0155059d4e34c52d0008b10379', 'testclient', '1', '2014-02-05 16:46:48', NULL),
('620c0474f4ce3cec26c4ff9340d6f71995ce97d2', 'testclient', '1234', '2014-02-05 14:54:15', NULL),
('67ff4cebdb61e1e138cfadcf03b302dd6ccfa0a0', 'testclient', '1234', '2014-02-05 14:41:08', NULL),
('6a376885e046250a4f986afd4cc4541c791e108f', 'testclient', '1', '2014-02-09 16:40:43', NULL),
('6e5584f5be3c07eb9836b752d0a5a04604986735', 'testclient', '1234', '2014-02-05 14:29:44', NULL),
('753eed052e2997407471133120433d06a8d4caef', 'testclient', '1', '2014-02-09 16:13:04', NULL),
('7c61b130a8eb917ab4e8593921429b0a4df3c2b4', 'testclient', '1', '2014-02-07 12:21:48', NULL),
('7c67a97acc3fc044cf844e75acb3980f20b265cc', 'testclient', '1', '2014-02-10 11:32:55', NULL),
('85324749331376a952b7678e87d4375ac63d5903', 'testclient', '1234', '2014-02-05 15:03:39', NULL),
('86da5086dd779cc475221121a8b2cbc8f82ba6d1', 'testclient', '1', '2014-02-05 16:47:48', NULL),
('96990553b31669ca4cfe2a58f06efc30e01abbbc', 'testclient', '1', '2014-02-10 12:46:37', NULL),
('98bd08c7f804b168342f1437933422192dec6f15', 'testclient', '1', '2014-02-05 16:48:27', NULL),
('a5f3ee405c9d64bd0061f43cafdc9ccd932ee954', 'testclient', '1234', '2014-02-05 14:52:40', NULL),
('aac35c33857455a94c625b158ae31c7f7c989eb7', 'testclient', '1', '2014-02-09 16:12:25', NULL),
('aaf91cd43af5c9769c9e79d20c1d7aec4cf13fcc', 'testclient', '1234', '2014-02-05 14:53:13', NULL),
('ab34e66e9e8bd8536fcd6dcdccbb79e903efb7cd', 'testclient', '1234', '2014-02-05 14:40:34', NULL),
('aec24eab1ac1041a148a4c1cb880354785541937', 'testclient', '1', '2014-02-08 14:09:58', NULL),
('b2e191a0fd45916e73b0726574c73a0ea37b7740', 'testclient', '1', '2014-02-09 16:17:35', NULL),
('b377600c6a93ecdc53474e401d63269e040e5eba', 'testclient', '1', '2014-02-08 10:04:40', NULL),
('d4d096c9d2243735226a4e98f656a49338d0fa82', 'testclient', '1', '2014-02-10 11:09:21', NULL),
('dab57f57bc6c9529a4692fbbb445f4780b0f2963', 'testclient', '1234', '2014-02-05 13:50:51', 'address'),
('daf58a9ac96fba15dc04eacddd087f9b3fcd3318', 'testclient', '1', '2014-02-05 15:57:21', NULL),
('df56917cc1ae9438a3ea9a8788dbdf4add14aa56', 'testclient', '1234', '2014-02-05 14:26:37', NULL),
('e34d61c55b4a781ce48ca2da6da0ea67594e88c0', 'testclient', '1234', '2014-02-05 15:23:01', NULL),
('e352927dbedb321ab59cf8d0f4caaaf1256b476a', 'testclient', '1', '2014-02-05 15:38:21', NULL),
('eb214d14d292c43bdf23f807c90522d3d55f5259', 'testclient', '1', '2014-02-05 16:47:33', NULL),
('edfa96159aa8c13aa8a920e8c3d29820d37ea6b3', 'testclient', '1234', '2014-02-05 14:52:08', NULL),
('ee616537ef3c5029a00c89a87c5ed22dccd04b80', 'testclient', '1', '2014-02-08 14:10:28', NULL),
('efb0bb209d4381e9e5ccc751155db6b5e74653f5', 'testclient', '1234', '2014-02-05 14:30:20', NULL),
('f5005d1be51dea20e3a24eb48304d8a343964d66', 'testclient', '1234', '2014-02-05 15:23:20', NULL),
('f8513545d2d24eb2072dd53a01d2b667d0f4610b', 'testclient', '1', '2014-02-08 11:18:06', NULL),
('fb57ca358aa9ad8b3346d966ade51576ba724522', 'testclient', '1234', '2014-02-05 14:22:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_scopes`
--

CREATE TABLE IF NOT EXISTS `oauth_scopes` (
  `scope` text,
  `is_default` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oauth_scopes`
--

INSERT INTO `oauth_scopes` (`scope`, `is_default`) VALUES
('address', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_users`
--

CREATE TABLE IF NOT EXISTS `oauth_users` (
  `username` varchar(255) NOT NULL,
  `password` varchar(2000) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
