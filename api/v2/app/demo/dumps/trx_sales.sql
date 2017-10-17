-- --------------------------------------------------------
-- Host:                         192.168.56.5
-- Server version:               5.5.54-0ubuntu0.14.04.1 - (Ubuntu)
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table wssales.trx_sales
CREATE TABLE IF NOT EXISTS `trx_sales` (
  `ts_id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_ticket_number` varchar(30) DEFAULT NULL,
  `ts_tl_id` int(11) DEFAULT NULL,
  `ts_mc_id` int(11) DEFAULT NULL,
  `ts_tp_id` int(11) DEFAULT NULL,
  `ts_segment` varchar(50) DEFAULT NULL,
  `ts_amounts` double(15,2) DEFAULT NULL,
  `ts_products` varchar(100) DEFAULT NULL,
  `ts_date_opportunity` varchar(30) DEFAULT NULL,
  `ts_date_submitted` varchar(30) DEFAULT NULL,
  `ts_date_negotiated` varchar(30) DEFAULT NULL,
  `ts_date_po` varchar(30) DEFAULT NULL,
  `ts_date_closed` varchar(30) DEFAULT NULL,
  `ts_expected_date_closed` varchar(30) DEFAULT NULL,
  `ts_revenue_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ts_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- Dumping data for table wssales.trx_sales: ~12 rows (approximately)
/*!40000 ALTER TABLE `trx_sales` DISABLE KEYS */;
INSERT INTO `trx_sales` (`ts_id`, `ts_ticket_number`, `ts_tl_id`, `ts_mc_id`, `ts_tp_id`, `ts_segment`, `ts_amounts`, `ts_products`, `ts_date_opportunity`, `ts_date_submitted`, `ts_date_negotiated`, `ts_date_po`, `ts_date_closed`, `ts_expected_date_closed`, `ts_revenue_type`) VALUES
	(1, 'SP00018', 1, 1, NULL, NULL, 300000000.00, 'Product A', '2017-09-21', '2017-09-21', '2017-09-22', '12-9-2017', NULL, NULL, NULL),
	(2, 'SP00019', 3, 2, NULL, NULL, 150000000.00, 'Product', '2017-09-21', '12-9-2017', '23-10-2017', NULL, NULL, NULL, NULL),
	(3, 'SP00020', 5, 1, NULL, NULL, 230000000.00, 'Product A', '2017-09-21', '12-10-2017', NULL, NULL, NULL, NULL, NULL),
	(4, 'SP00021', 6, 2, NULL, NULL, 170000000.00, 'Product A', '2017-09-21', '12-10-2017', NULL, NULL, NULL, NULL, NULL),
	(5, 'SP00022', 7, 4, NULL, NULL, 240000000.00, 'Product A', '2017-09-21', NULL, NULL, NULL, NULL, NULL, NULL),
	(6, 'SP00023', 8, 5, NULL, NULL, 250000000.00, 'Product A', '2017-09-21', '2017-10-03', NULL, NULL, NULL, NULL, NULL),
	(7, 'SP00024', 9, 3, NULL, NULL, 130000000.00, 'Product A', '2017-09-21', NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 'SP00025', 10, 3, NULL, NULL, 20000000.00, 'Product ', '2017-09-29', '29-9-2017', NULL, NULL, NULL, NULL, NULL),
	(30, NULL, NULL, 1, 1, NULL, 1000000.00, NULL, '2017-10-03', NULL, NULL, NULL, NULL, '2017-10-04', 'One Time'),
	(31, NULL, NULL, 12, 1, NULL, 2000.00, NULL, '2017-10-03', NULL, NULL, NULL, NULL, '2017-10-04', 'Recurring'),
	(32, NULL, NULL, 12, 6, NULL, 3000.00, NULL, '2017-10-03', NULL, NULL, NULL, NULL, '2017-10-04', 'Recurring'),
	(33, 'SP00026', NULL, 11, 1, NULL, 234.00, NULL, '2017-10-03', NULL, NULL, NULL, NULL, '2017-10-03', 'One Time'),
	(34, 'SP00027', NULL, 9, 5, NULL, 1000000.00, NULL, '2017-10-03', NULL, NULL, NULL, NULL, '2017-12-05', 'Recurring'),
	(35, 'SP00028', NULL, 9, 6, NULL, 1999996.00, NULL, '2017-10-03', NULL, NULL, NULL, NULL, '2017-12-05', 'Recurring'),
	(36, 'SP00029', NULL, 9, 2, NULL, 2000005.00, 'GSM - Prepaid', '2017-10-03', NULL, NULL, NULL, NULL, '2017-12-05', 'Recurring');
/*!40000 ALTER TABLE `trx_sales` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
