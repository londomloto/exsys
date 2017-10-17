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

-- Dumping structure for table wssales.trx_products
CREATE TABLE IF NOT EXISTS `trx_products` (
  `tp_id` int(11) NOT NULL AUTO_INCREMENT,
  `tp_service` varchar(255) NOT NULL DEFAULT '0',
  `tp_sub_service` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table wssales.trx_products: ~0 rows (approximately)
/*!40000 ALTER TABLE `trx_products` DISABLE KEYS */;
INSERT INTO `trx_products` (`tp_id`, `tp_service`, `tp_sub_service`) VALUES
	(1, 'GSM', 'Postpaid'),
	(2, 'GSM', 'Prepaid'),
	(5, 'NGSM', 'Revenue - Tracking Systems & MPLS'),
	(6, 'NGSM', 'Revenue - Leased Line');
/*!40000 ALTER TABLE `trx_products` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
