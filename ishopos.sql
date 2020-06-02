-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2020 at 05:47 AM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ishopos`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add User', 7, 'add_userinfo'),
(20, 'Can change User', 7, 'change_userinfo'),
(21, 'Can delete User', 7, 'delete_userinfo'),
(22, 'Can add Product Setup', 8, 'add_productsetup'),
(23, 'Can change Product Setup', 8, 'change_productsetup'),
(24, 'Can delete Product Setup', 8, 'delete_productsetup'),
(25, 'Can add product category', 9, 'add_productcategory'),
(26, 'Can change product category', 9, 'change_productcategory'),
(27, 'Can delete product category', 9, 'delete_productcategory'),
(28, 'Can add Stock Information', 10, 'add_stockinfo'),
(29, 'Can change Stock Information', 10, 'change_stockinfo'),
(30, 'Can delete Stock Information', 10, 'delete_stockinfo'),
(31, 'Can add Gift Card  Generate', 11, 'add_giftcardgenerate'),
(32, 'Can change Gift Card  Generate', 11, 'change_giftcardgenerate'),
(33, 'Can delete Gift Card  Generate', 11, 'delete_giftcardgenerate'),
(34, 'Can add Purchase Information', 12, 'add_purchasehistory'),
(35, 'Can change Purchase Information', 12, 'change_purchasehistory'),
(36, 'Can delete Purchase Information', 12, 'delete_purchasehistory'),
(37, 'Can add Sales History', 13, 'add_saleshistory'),
(38, 'Can change Sales History', 13, 'change_saleshistory'),
(39, 'Can delete Sales History', 13, 'delete_saleshistory'),
(40, 'Can add Discount Setup', 14, 'add_discountsetup'),
(41, 'Can change Discount Setup', 14, 'change_discountsetup'),
(42, 'Can delete Discount Setup', 14, 'delete_discountsetup'),
(43, 'Can add Sales', 15, 'add_sales'),
(44, 'Can change Sales', 15, 'change_sales'),
(45, 'Can delete Sales', 15, 'delete_sales');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$100000$qfRRUp9QzNSg$gqj3HmT51pItwGHhfVo4+QtrR4OLVjki8poTrVFaew8=', '2020-05-29 10:15:33.896114', 1, 'admin', '', '', '', 1, 1, '2020-05-29 10:15:04.161002');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2020-05-29 10:16:56.396237', '3', 'Chicken Biriani', 2, '[{"changed": {"fields": ["bdt_unit_price", "unit_sales_price", "remark"]}}]', 8, 1),
(2, '2020-05-29 10:17:40.375901', '1', 'Washing Machine', 2, '[{"changed": {"fields": ["product_name", "bdt_unit_price", "unit_sales_price"]}}]', 8, 1),
(3, '2020-05-29 10:18:23.564369', '3', 'Laptop', 2, '[{"changed": {"fields": ["product_name"]}}]', 8, 1),
(4, '2020-05-29 10:18:52.338624', '2', 'Electronic', 2, '[{"changed": {"fields": ["category_name", "remark"]}}]', 9, 1),
(5, '2020-05-29 10:19:05.933362', '1', 'Computer', 2, '[{"changed": {"fields": ["category_name", "remark"]}}]', 9, 1),
(6, '2020-05-29 10:20:25.024711', '1', 'DiscountSetup object (1)', 2, '[{"changed": {"fields": ["store_country", "remark"]}}]', 14, 1),
(7, '2020-05-29 10:20:48.357596', '2', 'DiscountSetup object (2)', 2, '[{"changed": {"fields": ["store_country", "end_amount", "remark"]}}]', 14, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(14, 'isoapp', 'discountsetup'),
(11, 'isoapp', 'giftcardgenerate'),
(9, 'isoapp', 'productcategory'),
(8, 'isoapp', 'productsetup'),
(12, 'isoapp', 'purchasehistory'),
(15, 'isoapp', 'sales'),
(13, 'isoapp', 'saleshistory'),
(10, 'isoapp', 'stockinfo'),
(7, 'isoapp', 'userinfo'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-05-18 06:02:44.795510'),
(2, 'auth', '0001_initial', '2020-05-18 06:02:58.241465'),
(3, 'admin', '0001_initial', '2020-05-18 06:03:02.588802'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-05-18 06:03:02.690792'),
(5, 'contenttypes', '0002_remove_content_type_name', '2020-05-18 06:03:05.030174'),
(6, 'auth', '0002_alter_permission_name_max_length', '2020-05-18 06:03:06.350824'),
(7, 'auth', '0003_alter_user_email_max_length', '2020-05-18 06:03:07.903824'),
(8, 'auth', '0004_alter_user_username_opts', '2020-05-18 06:03:07.954795'),
(9, 'auth', '0005_alter_user_last_login_null', '2020-05-18 06:03:09.115640'),
(10, 'auth', '0006_require_contenttypes_0002', '2020-05-18 06:03:09.170605'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2020-05-18 06:03:09.237557'),
(12, 'auth', '0008_alter_user_username_max_length', '2020-05-18 06:03:13.394593'),
(13, 'auth', '0009_alter_user_last_name_max_length', '2020-05-18 06:03:15.370569'),
(14, 'sessions', '0001_initial', '2020-05-18 06:03:16.842784'),
(15, 'isoapp', '0001_initial', '2020-05-18 08:47:14.493808'),
(16, 'isoapp', '0002_giftcardgenerate_productcategory_productsetup_stockinfo', '2020-05-18 12:14:01.736805'),
(17, 'isoapp', '0003_purchasehistory', '2020-05-19 04:42:50.433940'),
(18, 'isoapp', '0004_stockinfo_update_by', '2020-05-19 05:11:14.981143'),
(19, 'isoapp', '0005_saleshistory', '2020-05-20 05:40:07.204850'),
(20, 'isoapp', '0006_discountsetup', '2020-05-27 11:33:11.319617'),
(21, 'isoapp', '0007_discountsetup_discount_parcentage', '2020-05-27 12:44:13.019113'),
(22, 'isoapp', '0008_saleshistory_invoice_no', '2020-05-29 15:57:24.989249'),
(23, 'isoapp', '0009_auto_20200530_1148', '2020-05-30 05:48:58.684907'),
(24, 'isoapp', '0010_remove_sales_sales_price', '2020-05-30 05:59:17.154012'),
(25, 'isoapp', '0011_discountsetup_discount_month', '2020-05-30 09:16:51.114188'),
(26, 'isoapp', '0012_auto_20200530_1517', '2020-05-30 09:17:51.016011'),
(27, 'isoapp', '0013_sales_paid_amount', '2020-05-31 04:28:13.122063');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('5cimv4ri08aikrpuox39t2qvc6livetj', 'OWMwNDg1NDU1ZTMzNTUyM2FlNmNlMTk3OTMzNTk5ZjlmYThmMzk0MDp7InVzZXJfbmFtZV9pZCI6MSwiY291bnRyeSI6IlVTQSIsImZ1bGxfbmFtZSI6IlJvY2t5IGpvaG4ifQ==', '2020-06-01 00:44:49.781061'),
('9elc66rdr4mbjgtq47h025s7jp6kx3hj', 'MjMxODcxYjllZThmMDUyZmVhMjBiZjhkYThhYzMzYmJkNDk4NmJmNTp7InVzZXJfbmFtZV9pZCI6MX0=', '2020-05-19 12:12:35.707714'),
('b1z50q38sxjufeiv5ge1x9c4kj863soo', 'NWY3ZjFhZTkzNDZkYzQyZTJjMjU2ZTJlMDMwZWE4ZTU5ZjIzZDdhOTp7InVzZXJfbmFtZV9pZCI6MSwiZnVsbF9uYW1lIjoiUm9ja3kgam9obiIsImNvdW50cnkiOiJVU0EifQ==', '2020-06-01 20:13:46.504474'),
('cxgmwmv8d76eb33ceaofq1t8zuzbur6j', 'ZTJjZGYyZTc3MDk1MTFkNGIxYWQwZWUyNDg5MDRjMjYxMGM5OGQ2NDp7InVzZXJfbmFtZV9pZCI6MSwiY291bnRyeSI6IlVTQSJ9', '2020-05-24 11:31:31.501040'),
('evibwkbsfhk7zldil5n64ifbhlxed4gr', 'ZTJjZGYyZTc3MDk1MTFkNGIxYWQwZWUyNDg5MDRjMjYxMGM5OGQ2NDp7InVzZXJfbmFtZV9pZCI6MSwiY291bnRyeSI6IlVTQSJ9', '2020-05-28 10:39:58.342994'),
('hyu4r21fygq9niszjvf1nxph12kf4rtc', 'ZTJjZGYyZTc3MDk1MTFkNGIxYWQwZWUyNDg5MDRjMjYxMGM5OGQ2NDp7InVzZXJfbmFtZV9pZCI6MSwiY291bnRyeSI6IlVTQSJ9', '2020-05-26 17:05:23.251194'),
('o3ddp2r0udmi1ls72xeftrbe4dyq8oh3', 'ZTJjZGYyZTc3MDk1MTFkNGIxYWQwZWUyNDg5MDRjMjYxMGM5OGQ2NDp7InVzZXJfbmFtZV9pZCI6MSwiY291bnRyeSI6IlVTQSJ9', '2020-05-20 15:01:05.789544'),
('ojfucvd44y3trk2eaqaqnop4x47dv4np', 'Y2UzZWQ1NmIwYTA5YjIxZjYyYjk5MGYxZjc0YTkwNGU4NTNhMGI4Yjp7InVzZXJfbmFtZV9pZCI6MSwiY291bnRyeSI6IlVTQSIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzMTZiYjU5ZDBhNDBkMDg4N2E1ZWQzZjhmMWY0ZjU2NDRiNTNjNzBlIn0=', '2020-05-29 19:15:34.011081'),
('u1khcur52gceswcschufdu0hono6qsee', 'ZTJjZGYyZTc3MDk1MTFkNGIxYWQwZWUyNDg5MDRjMjYxMGM5OGQ2NDp7InVzZXJfbmFtZV9pZCI6MSwiY291bnRyeSI6IlVTQSJ9', '2020-05-27 15:37:07.565309'),
('vgahtk6dxqossduawso4ouecrda3ev9n', 'ZTJjZGYyZTc3MDk1MTFkNGIxYWQwZWUyNDg5MDRjMjYxMGM5OGQ2NDp7InVzZXJfbmFtZV9pZCI6MSwiY291bnRyeSI6IlVTQSJ9', '2020-05-30 18:46:24.892250'),
('zl4jcaepjlo94j4e89rw7olunpge3nv1', 'ZTJjZGYyZTc3MDk1MTFkNGIxYWQwZWUyNDg5MDRjMjYxMGM5OGQ2NDp7InVzZXJfbmFtZV9pZCI6MSwiY291bnRyeSI6IlVTQSJ9', '2020-05-23 18:56:47.491888');

-- --------------------------------------------------------

--
-- Table structure for table `isoapp_discountsetup`
--

CREATE TABLE `isoapp_discountsetup` (
  `id` int(11) NOT NULL,
  `store_country` varchar(50) NOT NULL,
  `start_amount` double NOT NULL,
  `end_amount` double NOT NULL,
  `remark` longtext NOT NULL,
  `added_date` datetime(6) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `added_by_id` int(11) NOT NULL,
  `discount_parcentage` double NOT NULL,
  `discount_month` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `isoapp_discountsetup`
--

INSERT INTO `isoapp_discountsetup` (`id`, `store_country`, `start_amount`, `end_amount`, `remark`, `added_date`, `status`, `added_by_id`, `discount_parcentage`, `discount_month`) VALUES
(1, 'USA', 25000, 49999, 'Golden customer offer', '2020-05-27 14:57:18.951052', 1, 1, 10, '1'),
(2, 'USA', 50000, 10000000, 'Super star grahok', '2020-05-28 01:41:28.496087', 1, 1, 12, '1'),
(3, 'USA', 25000, 49999, ' ', '2020-05-30 09:33:58.153875', 1, 1, 10, '5'),
(4, 'USA', 50000, 50000000, ' ', '2020-05-30 09:39:29.325320', 1, 1, 20, '5');

-- --------------------------------------------------------

--
-- Table structure for table `isoapp_giftcardgenerate`
--

CREATE TABLE `isoapp_giftcardgenerate` (
  `id` int(11) NOT NULL,
  `card_number` varchar(50) NOT NULL,
  `amount` double NOT NULL,
  `remark` longtext NOT NULL,
  `added_date` datetime(6) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `added_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `isoapp_giftcardgenerate`
--

INSERT INTO `isoapp_giftcardgenerate` (`id`, `card_number`, `amount`, `remark`, `added_date`, `status`, `added_by_id`) VALUES
(1, 'ISHO2020-05-191', 5000, ' for golden user', '2020-05-19 03:23:52.082987', 0, 1),
(2, 'ISHO2020-05-192', 5000, ' for golden user', '2020-05-19 03:23:52.152948', 0, 1),
(3, 'ISHO2020-05-193', 5000, ' for golden user', '2020-05-19 03:23:52.219902', 0, 1),
(4, 'ISHO2020-05-194', 5000, ' for golden user', '2020-05-19 03:23:52.369552', 0, 1),
(5, 'ISHO2020-05-195', 5000, ' for golden user', '2020-05-19 03:23:52.427760', 0, 1),
(6, 'ISHO2020-05-196', 10000, ' Diamond user ', '2020-05-19 03:25:17.362080', 1, 1),
(7, 'ISHO2020-05-197', 10000, ' Diamond user ', '2020-05-19 03:25:17.421176', 1, 1),
(8, 'ISHO2020-05-198', 10000, ' Diamond user ', '2020-05-19 03:25:17.487029', 1, 1),
(9, 'ISHO2020-05-199', 10000, ' Diamond user ', '2020-05-19 03:25:17.643167', 1, 1),
(10, 'ISHO2020-05-1910', 10000, ' Diamond user ', '2020-05-19 03:25:17.687292', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `isoapp_productcategory`
--

CREATE TABLE `isoapp_productcategory` (
  `id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `remark` longtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `added_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `isoapp_productcategory`
--

INSERT INTO `isoapp_productcategory` (`id`, `category_name`, `remark`, `status`, `added_by_id`) VALUES
(1, 'Computer', 'first food type', 1, 1),
(2, 'Electronic', 'All kind of fruit', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `isoapp_productsetup`
--

CREATE TABLE `isoapp_productsetup` (
  `id` int(11) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `barcode` varchar(50) NOT NULL,
  `bdt_unit_price` double NOT NULL,
  `unit_sales_price` double NOT NULL,
  `remark` longtext NOT NULL,
  `added_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `added_by_id` int(11) NOT NULL,
  `category_name_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `isoapp_productsetup`
--

INSERT INTO `isoapp_productsetup` (`id`, `product_name`, `barcode`, `bdt_unit_price`, `unit_sales_price`, `remark`, `added_date`, `updated_date`, `status`, `added_by_id`, `category_name_id`) VALUES
(1, 'Washing Machine', '0001', 15000, 17500, 'good food', '2020-05-19 04:27:42.661379', NULL, 1, 1, 2),
(3, 'Laptop', '0002', 10000, 11000, 'best food', '2020-05-19 04:35:06.933251', NULL, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `isoapp_purchasehistory`
--

CREATE TABLE `isoapp_purchasehistory` (
  `id` int(11) NOT NULL,
  `purchase_quantity` int(11) NOT NULL,
  `remark` longtext NOT NULL,
  `added_date` datetime(6) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `added_by_id` int(11) NOT NULL,
  `product_name_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `isoapp_purchasehistory`
--

INSERT INTO `isoapp_purchasehistory` (`id`, `purchase_quantity`, `remark`, `added_date`, `status`, `added_by_id`, `product_name_id`) VALUES
(1, 20, ' all the best this product', '2020-05-19 05:26:15.243120', 1, 1, 1),
(2, 10, ' new purchase', '2020-05-19 05:40:15.036899', 1, 1, 1),
(3, 22, '', '2020-05-19 05:41:56.315652', 1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `isoapp_sales`
--

CREATE TABLE `isoapp_sales` (
  `id` int(11) NOT NULL,
  `invoice_no` varchar(30) NOT NULL,
  `total_price` double NOT NULL,
  `vat_amount` double NOT NULL,
  `discount_amount` double NOT NULL,
  `net_price` double NOT NULL,
  `remark` longtext NOT NULL,
  `added_date` datetime(6) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `added_by_id` int(11) NOT NULL,
  `paid_amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `isoapp_sales`
--

INSERT INTO `isoapp_sales` (`id`, `invoice_no`, `total_price`, `vat_amount`, `discount_amount`, `net_price`, `remark`, `added_date`, `status`, `added_by_id`, `paid_amount`) VALUES
(1, 'ISHO30520201', 52500, 3675, 11235, 44940, '', '2020-05-30 10:11:53.115611', 1, 1, 0),
(2, 'ISHO30520202', 52500, 3675, 11235, 44940, '', '2020-05-30 10:16:03.606790', 1, 1, 0),
(3, 'ISHO30520203', 52500, 3675, 11235, 44940, '', '2020-05-30 10:23:47.249886', 1, 1, 0),
(4, 'ISHO30520204', 52500, 3675, 11235, 44940, '', '2020-05-30 10:25:07.945100', 1, 1, 0),
(5, 'ISHO30520205', 74500, 5215, 15943, 63772, '', '2020-05-30 10:31:01.024870', 1, 1, 0),
(6, 'ISHO30520206', 74500, 5215, 15943, 63772, '', '2020-05-30 10:32:23.313195', 1, 1, 0),
(7, 'ISHO30520207', 35000, 2450, 3745, 33705, '', '2020-05-30 10:33:47.605960', 1, 1, 0),
(8, 'ISHO30520208', 52500, 3675, 11235, 44940, '', '2020-05-30 10:43:22.383277', 1, 1, 0),
(9, 'ISHO30520209', 52500, 3675, 11235, 44940, '', '2020-05-30 10:44:02.156645', 1, 1, 0),
(10, 'ISHO305202010', 52500, 3675, 11235, 44940, '', '2020-05-30 10:44:54.711748', 1, 1, 0),
(11, 'ISHO305202011', 68000, 4760, 14552, 58208, '', '2020-05-30 14:16:31.517406', 1, 1, 0),
(12, 'ISHO305202012', 101000, 7070, 21614, 86456, '', '2020-05-30 14:17:45.175601', 1, 1, 0),
(13, 'ISHO305202013', 188500, 13195, 40339, 161356, '', '2020-05-30 14:18:34.760282', 1, 1, 0),
(14, 'ISHO305202014', 28500, 1995, 3049.5, 27445, '', '2020-05-30 14:19:10.801557', 1, 1, 0),
(15, 'ISHO305202015', 28500, 1995, 3049.5, 27445, '', '2020-05-30 16:08:13.485287', 1, 1, 0),
(16, 'ISHO305202016', 11000, 770, 0, 10000, '', '2020-05-30 16:11:53.838430', 1, 1, 0),
(17, 'ISHO305202017', 11000, 770, 0, 10000, '', '2020-05-30 16:15:08.212485', 1, 1, 0),
(18, 'ISHO315202018', 39500, 2765, 4226.5, 38038.5, '', '2020-05-31 04:41:37.046681', 1, 1, 38038),
(19, 'ISHO315202019', 17500, 1225, 0, 18725, '', '2020-05-31 04:44:36.363377', 1, 1, 18725),
(20, 'ISHO315202020', 28500, 1995, 3049.5, 27445.5, '', '2020-05-31 06:15:55.452858', 1, 1, 27444),
(21, 'ISHO315202021', 17500, 1225, 0, 18725, '', '2020-05-31 08:06:57.568534', 1, 1, 18725),
(22, 'ISHO315202022', 17500, 1225, 0, 18725, '', '2020-05-31 09:00:12.887719', 1, 1, 18725),
(23, 'ISHO315202023', 17500, 1225, 0, 18725, '', '2020-05-31 09:04:18.981934', 1, 1, 18725),
(24, 'ISHO315202024', 17500, 1225, 0, 18725, '', '2020-05-31 09:36:51.151953', 1, 1, 18725),
(25, 'ISHO315202025', 57000, 3990, 12198, 48792, '', '2020-05-31 10:54:24.054208', 1, 1, 48792);

-- --------------------------------------------------------

--
-- Table structure for table `isoapp_saleshistory`
--

CREATE TABLE `isoapp_saleshistory` (
  `id` int(11) NOT NULL,
  `sales_quantity` int(11) NOT NULL,
  `sales_price` double NOT NULL,
  `total_price` double NOT NULL,
  `added_date` datetime(6) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `added_by_id` int(11) NOT NULL,
  `product_name_id` int(11) NOT NULL,
  `invoice_no` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `isoapp_saleshistory`
--

INSERT INTO `isoapp_saleshistory` (`id`, `sales_quantity`, `sales_price`, `total_price`, `added_date`, `status`, `added_by_id`, `product_name_id`, `invoice_no`) VALUES
(1, 2, 17500, 35000, '2020-05-30 14:16:31.591646', 1, 1, 1, 'ISHO305202011'),
(2, 2, 17500, 35000, '2020-05-30 14:17:45.239558', 1, 1, 1, 'ISHO305202012'),
(3, 6, 11000, 66000, '2020-05-30 14:17:45.456874', 1, 1, 3, 'ISHO305202012'),
(4, 7, 17500, 122500, '2020-05-30 14:18:34.830239', 1, 1, 1, 'ISHO305202013'),
(5, 6, 11000, 66000, '2020-05-30 14:18:34.973148', 1, 1, 3, 'ISHO305202013'),
(6, 1, 17500, 17500, '2020-05-30 14:19:10.861514', 1, 1, 1, 'ISHO305202014'),
(7, 1, 11000, 11000, '2020-05-30 14:19:11.094840', 1, 1, 3, 'ISHO305202014'),
(8, 1, 17500, 17500, '2020-05-30 16:08:13.545000', 1, 1, 1, 'ISHO305202015'),
(9, 1, 11000, 11000, '2020-05-30 16:08:13.714030', 1, 1, 3, 'ISHO305202015'),
(10, 1, 11000, 11000, '2020-05-30 16:11:53.895397', 1, 1, 3, 'ISHO305202016'),
(11, 1, 11000, 11000, '2020-05-30 16:15:08.278053', 1, 1, 3, 'ISHO305202017'),
(12, 2, 11000, 22000, '2020-05-31 04:41:37.109847', 1, 1, 3, 'ISHO315202018'),
(13, 1, 17500, 17500, '2020-05-31 04:41:37.270693', 1, 1, 1, 'ISHO315202018'),
(14, 1, 17500, 17500, '2020-05-31 04:44:36.423412', 1, 1, 1, 'ISHO315202019'),
(15, 1, 17500, 17500, '2020-05-31 06:15:56.158495', 1, 1, 1, 'ISHO315202020'),
(16, 1, 11000, 11000, '2020-05-31 06:15:56.887084', 1, 1, 3, 'ISHO315202020'),
(17, 1, 17500, 17500, '2020-05-31 08:06:57.739304', 1, 1, 1, 'ISHO315202021'),
(18, 1, 17500, 17500, '2020-05-31 09:00:12.947700', 1, 1, 1, 'ISHO315202022'),
(19, 1, 17500, 17500, '2020-05-31 09:04:19.043895', 1, 1, 1, 'ISHO315202023'),
(20, 1, 17500, 17500, '2020-05-31 09:36:51.296585', 1, 1, 1, 'ISHO315202024'),
(21, 2, 17500, 35000, '2020-05-31 10:54:24.176113', 1, 1, 1, 'ISHO315202025'),
(22, 2, 11000, 22000, '2020-05-31 10:54:24.805518', 1, 1, 3, 'ISHO315202025');

-- --------------------------------------------------------

--
-- Table structure for table `isoapp_stockinfo`
--

CREATE TABLE `isoapp_stockinfo` (
  `id` int(11) NOT NULL,
  `available_quantity` int(11) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `remark` longtext NOT NULL,
  `added_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `added_by_id` int(11) NOT NULL,
  `product_name_id` int(11) NOT NULL,
  `update_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `isoapp_stockinfo`
--

INSERT INTO `isoapp_stockinfo` (`id`, `available_quantity`, `stock_quantity`, `remark`, `added_date`, `updated_date`, `status`, `added_by_id`, `product_name_id`, `update_by`) VALUES
(1, 10, 30, '', '2020-05-19 05:26:15.175039', '2020-05-19 00:00:00.000000', 1, 1, 1, 1),
(2, 1, 22, '', '2020-05-19 05:41:56.244086', NULL, 1, 1, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `isoapp_userinfo`
--

CREATE TABLE `isoapp_userinfo` (
  `id` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `user_img` varchar(100) NOT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_mobile` varchar(15) DEFAULT NULL,
  `user_country` varchar(50) NOT NULL,
  `user_pass` varchar(200) NOT NULL,
  `address` longtext NOT NULL,
  `added_by` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `isoapp_userinfo`
--

INSERT INTO `isoapp_userinfo` (`id`, `user_name`, `full_name`, `user_img`, `user_email`, `user_mobile`, `user_country`, `user_pass`, `address`, `added_by`, `status`) VALUES
(1, 'rocky', 'Rocky john', '', '', '35436466544', 'USA', 'pbkdf2_sha256$50000$salt$dBaYlVY+Sxo8JvR220pZ+j1nDAwxPNrUcQ8UyK4SL98=', ' ', '', 1),
(2, 'sakil', 'sakil ahmed', '', 'sakil@gmail.com', '018479679967', 'Bangladesh', 'pbkdf2_sha256$50000$salt$5J22P1jGzvdX4URXVjneM7DR5iBlhzwE9os/jaI0Nvw=', 'dhaka, Bnagladesh ', '', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `isoapp_discountsetup`
--
ALTER TABLE `isoapp_discountsetup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `isoapp_discountsetup_added_by_id_a7a20bcd_fk_isoapp_userinfo_id` (`added_by_id`);

--
-- Indexes for table `isoapp_giftcardgenerate`
--
ALTER TABLE `isoapp_giftcardgenerate`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `card_number` (`card_number`),
  ADD KEY `isoapp_giftcardgener_added_by_id_3fde7b1a_fk_isoapp_us` (`added_by_id`);

--
-- Indexes for table `isoapp_productcategory`
--
ALTER TABLE `isoapp_productcategory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_name` (`category_name`),
  ADD KEY `isoapp_productcatego_added_by_id_241a463a_fk_isoapp_us` (`added_by_id`);

--
-- Indexes for table `isoapp_productsetup`
--
ALTER TABLE `isoapp_productsetup`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `barcode` (`barcode`),
  ADD KEY `isoapp_productsetup_added_by_id_944d46d9_fk_isoapp_userinfo_id` (`added_by_id`),
  ADD KEY `isoapp_productsetup_category_name_id_49fc0b6c_fk_isoapp_pr` (`category_name_id`);

--
-- Indexes for table `isoapp_purchasehistory`
--
ALTER TABLE `isoapp_purchasehistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `isoapp_purchasehisto_added_by_id_327ecc9c_fk_isoapp_us` (`added_by_id`),
  ADD KEY `isoapp_purchasehisto_product_name_id_d9127fcb_fk_isoapp_pr` (`product_name_id`);

--
-- Indexes for table `isoapp_sales`
--
ALTER TABLE `isoapp_sales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoice_no` (`invoice_no`),
  ADD KEY `isoapp_sales_added_by_id_71b98d8b_fk_isoapp_userinfo_id` (`added_by_id`);

--
-- Indexes for table `isoapp_saleshistory`
--
ALTER TABLE `isoapp_saleshistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `isoapp_saleshistory_added_by_id_37569361_fk_isoapp_userinfo_id` (`added_by_id`),
  ADD KEY `isoapp_saleshistory_product_name_id_96c7cc88_fk_isoapp_pr` (`product_name_id`);

--
-- Indexes for table `isoapp_stockinfo`
--
ALTER TABLE `isoapp_stockinfo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `isoapp_stockinfo_added_by_id_00886f31_fk_isoapp_userinfo_id` (`added_by_id`),
  ADD KEY `isoapp_stockinfo_product_name_id_c033c2f6_fk_isoapp_pr` (`product_name_id`);

--
-- Indexes for table `isoapp_userinfo`
--
ALTER TABLE `isoapp_userinfo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_name` (`user_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `isoapp_discountsetup`
--
ALTER TABLE `isoapp_discountsetup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `isoapp_giftcardgenerate`
--
ALTER TABLE `isoapp_giftcardgenerate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `isoapp_productcategory`
--
ALTER TABLE `isoapp_productcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `isoapp_productsetup`
--
ALTER TABLE `isoapp_productsetup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `isoapp_purchasehistory`
--
ALTER TABLE `isoapp_purchasehistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `isoapp_sales`
--
ALTER TABLE `isoapp_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `isoapp_saleshistory`
--
ALTER TABLE `isoapp_saleshistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `isoapp_stockinfo`
--
ALTER TABLE `isoapp_stockinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `isoapp_userinfo`
--
ALTER TABLE `isoapp_userinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `isoapp_discountsetup`
--
ALTER TABLE `isoapp_discountsetup`
  ADD CONSTRAINT `isoapp_discountsetup_added_by_id_a7a20bcd_fk_isoapp_userinfo_id` FOREIGN KEY (`added_by_id`) REFERENCES `isoapp_userinfo` (`id`);

--
-- Constraints for table `isoapp_giftcardgenerate`
--
ALTER TABLE `isoapp_giftcardgenerate`
  ADD CONSTRAINT `isoapp_giftcardgener_added_by_id_3fde7b1a_fk_isoapp_us` FOREIGN KEY (`added_by_id`) REFERENCES `isoapp_userinfo` (`id`);

--
-- Constraints for table `isoapp_productcategory`
--
ALTER TABLE `isoapp_productcategory`
  ADD CONSTRAINT `isoapp_productcatego_added_by_id_241a463a_fk_isoapp_us` FOREIGN KEY (`added_by_id`) REFERENCES `isoapp_userinfo` (`id`);

--
-- Constraints for table `isoapp_productsetup`
--
ALTER TABLE `isoapp_productsetup`
  ADD CONSTRAINT `isoapp_productsetup_added_by_id_944d46d9_fk_isoapp_userinfo_id` FOREIGN KEY (`added_by_id`) REFERENCES `isoapp_userinfo` (`id`),
  ADD CONSTRAINT `isoapp_productsetup_category_name_id_49fc0b6c_fk_isoapp_pr` FOREIGN KEY (`category_name_id`) REFERENCES `isoapp_productcategory` (`id`);

--
-- Constraints for table `isoapp_purchasehistory`
--
ALTER TABLE `isoapp_purchasehistory`
  ADD CONSTRAINT `isoapp_purchasehisto_added_by_id_327ecc9c_fk_isoapp_us` FOREIGN KEY (`added_by_id`) REFERENCES `isoapp_userinfo` (`id`),
  ADD CONSTRAINT `isoapp_purchasehisto_product_name_id_d9127fcb_fk_isoapp_pr` FOREIGN KEY (`product_name_id`) REFERENCES `isoapp_productsetup` (`id`);

--
-- Constraints for table `isoapp_sales`
--
ALTER TABLE `isoapp_sales`
  ADD CONSTRAINT `isoapp_sales_added_by_id_71b98d8b_fk_isoapp_userinfo_id` FOREIGN KEY (`added_by_id`) REFERENCES `isoapp_userinfo` (`id`);

--
-- Constraints for table `isoapp_saleshistory`
--
ALTER TABLE `isoapp_saleshistory`
  ADD CONSTRAINT `isoapp_saleshistory_added_by_id_37569361_fk_isoapp_userinfo_id` FOREIGN KEY (`added_by_id`) REFERENCES `isoapp_userinfo` (`id`),
  ADD CONSTRAINT `isoapp_saleshistory_product_name_id_96c7cc88_fk_isoapp_pr` FOREIGN KEY (`product_name_id`) REFERENCES `isoapp_productsetup` (`id`);

--
-- Constraints for table `isoapp_stockinfo`
--
ALTER TABLE `isoapp_stockinfo`
  ADD CONSTRAINT `isoapp_stockinfo_added_by_id_00886f31_fk_isoapp_userinfo_id` FOREIGN KEY (`added_by_id`) REFERENCES `isoapp_userinfo` (`id`),
  ADD CONSTRAINT `isoapp_stockinfo_product_name_id_c033c2f6_fk_isoapp_pr` FOREIGN KEY (`product_name_id`) REFERENCES `isoapp_productsetup` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
