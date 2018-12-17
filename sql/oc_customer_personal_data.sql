-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Дек 16 2018 г., 21:41
-- Версия сервера: 10.1.36-MariaDB
-- Версия PHP: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `svetodiod`
--

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_personal_data`
--

CREATE TABLE `oc_customer_personal_data` (
  `customer_id` int(11) NOT NULL,
  `naming` varchar(100) CHARACTER SET utf8 NOT NULL,
  `telephone` varchar(16) CHARACTER SET utf8 NOT NULL,
  `fax` varchar(26) CHARACTER SET utf8 NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 NOT NULL,
  `kontragent_type` int(1) NOT NULL,
  `full_naming` text CHARACTER SET utf8 NOT NULL,
  `legal_address` text CHARACTER SET utf8 NOT NULL,
  `INN` varchar(50) CHARACTER SET utf8 NOT NULL,
  `KPP` varchar(50) CHARACTER SET utf8 NOT NULL,
  `OGRN` varchar(50) CHARACTER SET utf8 NOT NULL,
  `OKPO` varchar(50) CHARACTER SET utf8 NOT NULL,
  `BIK` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Bank` text CHARACTER SET utf8 NOT NULL,
  `Address` text CHARACTER SET utf8 NOT NULL,
  `correspondent_account` varchar(50) CHARACTER SET utf8 NOT NULL,
  `checking_account` varchar(50) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
