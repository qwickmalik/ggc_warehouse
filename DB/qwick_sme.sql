-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2016 at 10:48 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `qwick_sme`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounting_heads`
--

CREATE TABLE IF NOT EXISTS `accounting_heads` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `head_name` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `accounting_heads`
--

INSERT INTO `accounting_heads` (`id`, `head_name`) VALUES
(1, 'Revenue'),
(2, 'Expense'),
(3, 'Equity'),
(4, 'Asset'),
(5, 'Liability');

-- --------------------------------------------------------

--
-- Table structure for table `balance_sheets`
--

CREATE TABLE IF NOT EXISTS `balance_sheets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) DEFAULT NULL,
  `fixed_asset_id` int(11) DEFAULT NULL,
  `cash_account_id` int(11) DEFAULT NULL,
  `cash` decimal(11,2) DEFAULT '0.00',
  `injections` decimal(11,2) DEFAULT '0.00',
  `deposit` decimal(11,2) DEFAULT '0.00',
  `acc_receivable_debtors` decimal(11,2) DEFAULT '0.00',
  `stock` decimal(11,2) DEFAULT '0.00',
  `total` decimal(11,2) DEFAULT '0.00',
  `property_plant_equipment` decimal(11,2) DEFAULT '0.00',
  `land_n_building` decimal(11,2) DEFAULT '0.00',
  `description` varchar(50) DEFAULT NULL,
  `sloans` decimal(11,2) DEFAULT '0.00',
  `lgloans` decimal(11,2) DEFAULT '0.00',
  `interest` decimal(11,2) DEFAULT '0.00',
  `depreciation` decimal(11,2) DEFAULT '0.00',
  `purchaseofppe` decimal(11,2) DEFAULT '0.00',
  `acc_payable_creditors` decimal(11,2) DEFAULT '0.00',
  `taxation` decimal(11,2) DEFAULT '0.00',
  `other_liabilities` decimal(11,2) DEFAULT '0.00',
  `owner_equity` decimal(11,2) DEFAULT '0.00',
  `profit_n_loss` decimal(11,2) DEFAULT '0.00',
  `drawings` decimal(11,2) DEFAULT '0.00',
  `flag` int(2) NOT NULL DEFAULT '0',
  `fixedasset_status` enum('available','not') DEFAULT 'available',
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `balance_sheets`
--

INSERT INTO `balance_sheets` (`id`, `sale_id`, `fixed_asset_id`, `cash_account_id`, `cash`, `injections`, `deposit`, `acc_receivable_debtors`, `stock`, `total`, `property_plant_equipment`, `land_n_building`, `description`, `sloans`, `lgloans`, `interest`, `depreciation`, `purchaseofppe`, `acc_payable_creditors`, `taxation`, `other_liabilities`, `owner_equity`, `profit_n_loss`, `drawings`, `flag`, `fixedasset_status`, `date`) VALUES
(1, 8, NULL, NULL, '0.00', '0.00', '0.00', '198.00', '-198.00', '198.00', '0.00', '0.00', 'Sale', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '68.00', '0.00', 0, 'available', '2015-08-26'),
(2, 8, NULL, NULL, '198.00', '0.00', '0.00', '-198.00', '0.00', '0.00', '0.00', '0.00', 'Sale', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 'available', '2015-08-27'),
(3, 1, NULL, NULL, '0.00', '0.00', '0.00', '130.00', '-130.00', '130.00', '0.00', '0.00', 'Sale', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '30.00', '0.00', 0, 'available', '2015-10-31');

-- --------------------------------------------------------

--
-- Table structure for table `bank_balances`
--

CREATE TABLE IF NOT EXISTS `bank_balances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `amount` decimal(11,2) DEFAULT '0.00',
  `amount_chg` decimal(11,2) DEFAULT '0.00',
  `effect` int(1) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `user` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `bank_balances`
--

INSERT INTO `bank_balances` (`id`, `bank_id`, `account_id`, `amount`, `amount_chg`, `effect`, `description`, `modified`, `user`) VALUES
(1, 29, 5, '0.00', '0.00', NULL, NULL, '2015-11-16 19:04:36', 'Qwick Fusion'),
(2, NULL, 4, '2445.95', '0.00', NULL, NULL, '2016-01-01 04:24:54', 'System'),
(3, NULL, 4, '2480.95', '35.00', 1, 'Revenue from sale point', '2016-01-01 04:28:44', 'System'),
(4, NULL, 4, '2980.95', '500.00', 0, 'Testing Journal entry', '2016-02-18 18:35:19', 'Qwick Fusion'),
(5, NULL, 4, '3080.95', '100.00', 1, 'Uncategorized income of 100 in cash ', '2016-02-18 18:46:58', 'Qwick Fusion'),
(6, NULL, 4, '2980.95', '100.00', 0, 'Uncategorized expense of 100 in case for testing purposes', '2016-02-18 18:48:53', 'Qwick Fusion'),
(7, NULL, 4, '2780.95', '200.00', 0, 'Uncategorized expense of 200 for testing', '2016-02-18 19:09:12', 'Qwick Fusion'),
(8, NULL, 4, '2680.95', '100.00', 0, 'Testing', '2016-02-18 19:15:32', 'Qwick Fusion'),
(9, NULL, 4, '2530.95', '150.00', 0, 'testing', '2016-02-18 19:25:45', 'Qwick Fusion'),
(10, NULL, 4, '2480.95', '50.00', 0, 'Testing', '2016-02-18 19:32:27', 'Qwick Fusion'),
(11, NULL, 4, '2380.95', '100.00', 0, 'TESTING', '2016-03-12 22:08:17', 'Qwick Fusion'),
(12, NULL, 4, '2480.95', '100.00', 1, 'Transaction deleted: Electricity Bill', '2016-03-12 22:08:28', 'Qwick Fusion'),
(13, NULL, 4, '2380.95', '100.00', 0, 'asdfaldkj ', '2016-03-12 23:52:50', 'Qwick Fusion'),
(14, NULL, 4, '2480.95', '100.00', 1, 'Transaction deleted: Water Bill', '2016-03-12 23:57:22', 'Qwick Fusion'),
(15, NULL, 4, '-519.05', '0.00', NULL, NULL, '2016-03-31 06:43:28', 'Qwick Fusion'),
(16, NULL, 4, '-719.05', '0.00', NULL, NULL, '2016-03-31 16:22:03', 'Qwick Fusion'),
(17, NULL, 4, '-451.20', '267.85', 1, 'Revenue from sale point', '2016-04-21 22:46:35', 'System'),
(18, NULL, 4, '-351.20', '100.00', 1, '', '2016-06-20 10:48:58', 'Qwick Fusion');

-- --------------------------------------------------------

--
-- Table structure for table `bank_transfers`
--

CREATE TABLE IF NOT EXISTS `bank_transfers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_date` date DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `source_account_id` int(11) DEFAULT NULL,
  `dest_account_id` int(11) DEFAULT NULL,
  `payment_mode_id` int(3) DEFAULT NULL,
  `cheque_no` varchar(35) DEFAULT NULL,
  `cheque_cleared` tinyint(1) DEFAULT '0',
  `remarks` text,
  `user` varchar(35) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE IF NOT EXISTS `banks` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(75) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `system` int(1) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `bank_name`, `created`, `system`, `deleted`) VALUES
(1, 'Bomark Royal Enterprise', NULL, 1, 0),
(2, 'Access Bank', NULL, 1, 0),
(3, 'Agricultural Development Bank(ADB)', NULL, 1, 0),
(4, 'Barclays Bank of Ghana Ltd.', NULL, 1, 0),
(5, 'Bank of Africa (Gh) Ltd', NULL, 1, 0),
(6, 'Bank of Baroda (Ghana) Limited', NULL, 1, 0),
(7, 'CAL Bank Limited', NULL, 1, 0),
(8, 'Energy Bank (Ghana) Ltd', NULL, 1, 0),
(9, 'Ecobank Ghana Limited', NULL, 1, 0),
(10, 'First Capital Plus Bank Limited', NULL, 1, 0),
(11, 'First Atlantic Bank Ltd', NULL, 1, 0),
(12, 'Fidelity Bank Ghana Limited', NULL, 1, 0),
(13, 'Guaranty Trust Bank (Ghana) Limited', NULL, 1, 0),
(14, 'Ghana Commercial Bank Limited', NULL, 1, 0),
(15, 'HFC Bank Ltd', NULL, 1, 0),
(16, 'International Commercial Bank Limited', NULL, 1, 0),
(17, 'Merchant Bank (Ghana) Limited', NULL, 1, 0),
(18, 'National Investment Bank Ltd', NULL, 1, 0),
(19, 'Prudential Bank Ltd', NULL, 1, 0),
(20, 'Stanbic Bank Ghana Ltd', NULL, 1, 0),
(21, 'SG Bank', NULL, 1, 0),
(22, 'Standard Chartered Bank Ghana Limited', NULL, 1, 0),
(23, 'The Royal Bank Ltd', NULL, 1, 0),
(24, 'UT Bank Limited', NULL, 1, 0),
(25, 'uniBank Ghana Ltd', NULL, 1, 0),
(26, 'United Bank for Africa (Ghana) Ltd.', NULL, 1, 0),
(27, 'Zenith Bank (Ghana) Limited', '2015-05-06 01:09:58', 1, 0),
(28, 'Bank of China', '2015-06-29 13:57:05', 1, 0),
(29, 'Jandel', '2015-11-16 17:58:56', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cash_accounts`
--

CREATE TABLE IF NOT EXISTS `cash_accounts` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(40) NOT NULL,
  `account_no` varchar(25) NOT NULL,
  `bank_id` int(5) DEFAULT NULL,
  `branch` varchar(35) NOT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `random_salt` varchar(20) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `cash_accounts`
--

INSERT INTO `cash_accounts` (`id`, `account_name`, `account_no`, `bank_id`, `branch`, `zone_id`, `random_salt`, `deleted`) VALUES
(4, 'Bomark Royal Sales Account', 'Sales Point Revenue', 1, 'All Branches', 1, NULL, 0),
(5, 'Bomark Royal Enterprise', '122344', 29, 'Spintex', 8, 'Qwic564a1ab40197e', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cash_flows`
--

CREATE TABLE IF NOT EXISTS `cash_flows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) NOT NULL,
  `operating` decimal(11,2) DEFAULT NULL,
  `investing` decimal(11,2) DEFAULT NULL,
  `financing` decimal(11,2) DEFAULT NULL,
  `net_cashflow` decimal(11,2) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_name` varchar(100) NOT NULL,
  `client_contact` varchar(100) NOT NULL,
  `zone_id` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `client_name`, `client_contact`, `zone_id`) VALUES
(1, 'Default Client', '1', 1),
(2, 'A-LAWMAN', 'TEMA', 7);

-- --------------------------------------------------------

--
-- Table structure for table `closing_balances`
--

CREATE TABLE IF NOT EXISTS `closing_balances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `balance` decimal(11,2) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contact_types`
--

CREATE TABLE IF NOT EXISTS `contact_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_type` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_type` (`contact_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `contact_types`
--

INSERT INTO `contact_types` (`id`, `contact_type`) VALUES
(2, 'Cash Sales Customer'),
(4, 'Contact'),
(3, 'Credit & Cash Sales Customer'),
(1, 'Credit Sales Customer');

-- --------------------------------------------------------

--
-- Table structure for table `credit_payments`
--

CREATE TABLE IF NOT EXISTS `credit_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creditor_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `creditors`
--

CREATE TABLE IF NOT EXISTS `creditors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `supply_cost` decimal(11,2) NOT NULL,
  `amount_disbursed` decimal(11,2) NOT NULL,
  `balance` decimal(11,2) NOT NULL,
  `supply_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_disb_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_name` (`supplier_id`,`supply_date`,`last_disb_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_statuses`
--

CREATE TABLE IF NOT EXISTS `crm_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(100) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `crm_statuses`
--

INSERT INTO `crm_statuses` (`id`, `status`, `created`) VALUES
(1, 'NO EVENT DUE TODAY', '2016-05-29 22:44:23'),
(2, 'NO EVENT DUE TODAY', '2016-05-30 19:35:35'),
(3, 'NO EVENT DUE TODAY', '2016-06-16 11:37:22');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE IF NOT EXISTS `currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(20) NOT NULL,
  `symbol` varchar(10) NOT NULL,
  `setting_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `currency_name`, `symbol`, `setting_id`) VALUES
(1, 'Ghana Cedi', 'GHS', 1),
(2, 'US Dollar', 'USD', 1),
(3, 'Pound Sterling', 'GBP', 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_categories`
--

CREATE TABLE IF NOT EXISTS `customer_categories` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `customer_category` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `customer_categories`
--

INSERT INTO `customer_categories` (`id`, `customer_category`) VALUES
(1, '-Select-'),
(3, 'AGRIC WORKERS'),
(4, 'ARTISANS'),
(5, 'PETTY TRADERS'),
(6, 'GOVT WORKERS'),
(7, 'PRIVATE FORMAL'),
(8, 'PRIVATE INFORMA'),
(9, 'EDUCAT. WORKERS'),
(10, 'OIL FIELDS'),
(11, 'MANUFACTURING INDUSTRY');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_id` int(2) DEFAULT '1',
  `marriage_id` int(3) DEFAULT NULL,
  `idtype_id` int(3) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `entryclerk_name` varchar(80) DEFAULT NULL,
  `customer_category_id` int(3) DEFAULT NULL,
  `discount_card_id` int(11) DEFAULT NULL,
  `registration_date` date DEFAULT NULL,
  `customer_photo` mediumblob,
  `surname` varchar(20) DEFAULT NULL,
  `other_names` varchar(35) DEFAULT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `fullname` varchar(80) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `id_number` varchar(25) DEFAULT NULL,
  `postal_address` varchar(50) DEFAULT NULL,
  `mobile_no` varchar(15) DEFAULT NULL,
  `work_no` varchar(15) DEFAULT NULL,
  `work_place` varchar(50) DEFAULT NULL,
  `work_department` varchar(30) DEFAULT NULL,
  `work_location` varchar(50) DEFAULT NULL,
  `position` varchar(40) DEFAULT NULL,
  `no_of_yrs` varchar(40) DEFAULT NULL,
  `guarantor_name` varchar(30) DEFAULT NULL,
  `guarantor_work_place` varchar(50) DEFAULT NULL,
  `guarantor_no` varchar(15) DEFAULT NULL,
  `guarantor_signature` enum('Yes','No') DEFAULT NULL,
  `last_school` varchar(50) DEFAULT NULL,
  `religion` varchar(20) DEFAULT NULL,
  `religion_location` varchar(50) DEFAULT NULL,
  `email` varchar(35) DEFAULT NULL,
  `house_no` varchar(10) DEFAULT NULL,
  `street` varchar(30) DEFAULT NULL,
  `area` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `landmark` varchar(50) DEFAULT NULL,
  `emergency_person` varchar(50) DEFAULT NULL,
  `emergency_no` varchar(15) DEFAULT NULL,
  `cust_signature` enum('Yes','No') DEFAULT NULL,
  `contact_type_id` int(1) DEFAULT NULL,
  `bday_msg` int(1) DEFAULT '1',
  `ny_msg` int(1) DEFAULT '1',
  `indep_msg` int(1) DEFAULT '1',
  `easter_msg` int(1) DEFAULT '1',
  `xmas_msg` int(1) DEFAULT '1',
  `eidfitr_msg` int(1) DEFAULT '1',
  `eidadha_msg` int(1) DEFAULT '1',
  `promo_msg` int(1) DEFAULT '1',
  `visible` enum('alive','deleted') DEFAULT 'alive',
  `modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `surname` (`surname`),
  KEY `other_names` (`other_names`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `zone_id`, `marriage_id`, `idtype_id`, `user_id`, `entryclerk_name`, `customer_category_id`, `discount_card_id`, `registration_date`, `customer_photo`, `surname`, `other_names`, `first_name`, `fullname`, `dob`, `id_number`, `postal_address`, `mobile_no`, `work_no`, `work_place`, `work_department`, `work_location`, `position`, `no_of_yrs`, `guarantor_name`, `guarantor_work_place`, `guarantor_no`, `guarantor_signature`, `last_school`, `religion`, `religion_location`, `email`, `house_no`, `street`, `area`, `city`, `landmark`, `emergency_person`, `emergency_no`, `cust_signature`, `contact_type_id`, `bday_msg`, `ny_msg`, `indep_msg`, `easter_msg`, `xmas_msg`, `eidfitr_msg`, `eidadha_msg`, `promo_msg`, `visible`, `modified`) VALUES
(1, 1, NULL, NULL, 98, NULL, NULL, NULL, '2015-12-01', 0x57616c6b20496e20323030392d31322d3031323031352d31322d30312d31365f34352e706e67, 'Walk In ', NULL, 'Shopper', 'Walk In Shopper', '2009-12-01', NULL, NULL, '00000000', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, NULL, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'alive', '2015-12-01 16:49:45'),
(2, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-01', 0x417070696168342d31322d3031323031352d31322d30312d31375f35312e706e67, 'Appiah4', NULL, 'Kwame', 'Kwame Appiah4', '2015-12-02', NULL, NULL, '02430006709', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sulleyamalik@gmail.com', '', '', '', '', NULL, NULL, NULL, NULL, 4, 1, 1, 1, 1, 1, 1, 1, 1, 'alive', '2015-12-01 17:08:51'),
(3, 1, NULL, NULL, NULL, NULL, NULL, 3, NULL, '', 'Appiah', NULL, 'Kwame77', 'Kwame77 Appiah', '2015-12-02', NULL, NULL, '0243000670', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'malik@qwickfusion.com', '', '', '', '', NULL, NULL, NULL, NULL, 2, 1, 1, 1, 1, 1, 1, 1, 1, 'alive', '2015-12-04 01:12:28'),
(4, 1, NULL, NULL, 98, NULL, NULL, NULL, '2015-12-01', NULL, 'Appiah99', NULL, 'Kwame', 'Kwame Appiah99', '2015-12-02', NULL, NULL, '02430006709', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, NULL, 4, 1, 1, 1, 1, 1, 1, 1, 1, 'alive', '2015-12-01 17:14:39'),
(5, 2, NULL, NULL, 98, NULL, NULL, NULL, '2015-12-01', 0x417070696168342d31322d3031323031352d31322d30312d31375f35312e706e67, 'Appiah4', NULL, 'Kofi', 'Kofi Appiah4', '2015-12-02', NULL, NULL, '0243000670', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, NULL, 2, 1, 1, 1, 1, 1, 1, 1, 1, 'alive', '2015-12-01 17:19:51'),
(6, 2, NULL, NULL, 98, NULL, NULL, NULL, '2015-12-01', 0x417070696168342d31322d3031323031352d31322d30312d31375f34392e706e67, 'Appiah4', NULL, 'Kofi', 'Kofi Appiah4', '2015-12-02', NULL, NULL, '0243000670', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, NULL, 2, 1, 1, 1, 1, 1, 1, 1, 1, 'alive', '2015-12-01 17:20:50'),
(7, 3, 1, 2, 98, NULL, 3, NULL, '2015-12-01', 0x41707069616834323031332d31322d3031323031352d31322d30312d31375f30382e706e67, 'Appiah4', NULL, 'Kofi', 'Kofi Appiah4', '2013-12-01', '34343', NULL, '02430006709', '', 'erere', '', '', '', '', 'ewer', '', 'wwre', 'Yes', NULL, NULL, NULL, NULL, '3333', '3434', '', 'accra', '', '', '', 'Yes', 1, 1, 1, 1, 1, 1, 1, 1, 1, 'alive', '2015-12-01 17:25:08'),
(8, 3, NULL, NULL, 98, NULL, NULL, 3, '2015-12-12', NULL, 'DE HAAS', NULL, 'Kwame', 'Kwame DE HAAS', '2015-12-13', NULL, NULL, '0244354451', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, NULL, 2, 1, 1, 1, 1, 1, 1, 1, 1, 'alive', '2015-12-12 12:15:40'),
(9, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-12', NULL, 'Apetor', NULL, 'Karl', 'Karl Apetor', '2015-12-13', NULL, NULL, '0343434343343', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, NULL, 4, 1, 1, 1, 1, 1, 1, 1, 1, 'alive', '2015-12-12 12:22:46'),
(10, 4, NULL, NULL, NULL, NULL, NULL, 5, '2015-12-12', NULL, 'Sam', NULL, 'Yayra', 'Yayra Sam', '2010-12-12', NULL, NULL, '0245678987', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, NULL, 2, 1, 1, 1, 1, 1, 1, 1, 1, 'alive', '2015-12-12 12:33:53');

-- --------------------------------------------------------

--
-- Table structure for table `daily_defaults`
--

CREATE TABLE IF NOT EXISTS `daily_defaults` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dashboards`
--

CREATE TABLE IF NOT EXISTS `dashboards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_name` varchar(50) NOT NULL,
  `path` varchar(100) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `debt_payments`
--

CREATE TABLE IF NOT EXISTS `debt_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `debt_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `debtors`
--

CREATE TABLE IF NOT EXISTS `debtors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `sale_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_cost` decimal(11,2) NOT NULL,
  `amount_paid` decimal(11,2) NOT NULL,
  `balance` decimal(11,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_name` (`customer_id`,`sale_date`,`sale_id`,`balance`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `debtors`
--

INSERT INTO `debtors` (`id`, `customer_id`, `sale_id`, `sale_date`, `total_cost`, `amount_paid`, `balance`) VALUES
(47, 20, 192, '2012-11-09 16:34:27', '675.00', '500.00', '175.00'),
(48, 10, 10, '2015-12-30 08:31:47', '70.00', '45.00', '25.00');

-- --------------------------------------------------------

--
-- Table structure for table `defaulting_rates`
--

CREATE TABLE IF NOT EXISTS `defaulting_rates` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `monthly_rate` int(2) DEFAULT NULL,
  `expired_rate` int(2) DEFAULT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `defaulting_rates`
--

INSERT INTO `defaulting_rates` (`id`, `monthly_rate`, `expired_rate`, `modified_date`) VALUES
(1, 10, 10, '2013-02-24 22:47:06');

-- --------------------------------------------------------

--
-- Table structure for table `discount_cards`
--

CREATE TABLE IF NOT EXISTS `discount_cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discount_code` varchar(20) DEFAULT NULL,
  `discount_category_id` int(11) DEFAULT NULL,
  `discount_rate` decimal(6,2) DEFAULT '0.00',
  `points` int(11) DEFAULT '0',
  `issue_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'inactive',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `discount_cards`
--

INSERT INTO `discount_cards` (`id`, `discount_code`, `discount_category_id`, `discount_rate`, `points`, `issue_date`, `expiry_date`, `status`, `created`, `modified`) VALUES
(3, '15045', 1, '10.00', 0, NULL, NULL, 'active', '2015-12-12 11:44:05', '2015-12-12 12:15:40'),
(5, '64509', 2, '0.00', 9950, '2015-12-13', '2016-12-12', 'active', '2015-12-12 12:30:25', '2015-12-30 10:43:37');

-- --------------------------------------------------------

--
-- Table structure for table `discount_categories`
--

CREATE TABLE IF NOT EXISTS `discount_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_type` enum('Points','Percentage') DEFAULT 'Points',
  `category_name` varchar(25) DEFAULT NULL,
  `percent` decimal(6,2) DEFAULT NULL,
  `amount_per_point` decimal(6,2) DEFAULT NULL,
  `min_usable_points` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `discount_categories`
--

INSERT INTO `discount_categories` (`id`, `category_type`, `category_name`, `percent`, `amount_per_point`, `min_usable_points`, `created`, `modified`) VALUES
(2, 'Points', 'Classic', NULL, '0.50', 50, '2015-12-12 11:24:45', '2015-12-12 11:24:45'),
(3, 'Percentage', 'VIP', '10.00', NULL, NULL, '2015-12-12 12:02:00', '2015-12-12 12:02:00');

-- --------------------------------------------------------

--
-- Table structure for table `eods`
--

CREATE TABLE IF NOT EXISTS `eods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eod_date` date NOT NULL,
  `flag` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `eoms`
--

CREATE TABLE IF NOT EXISTS `eoms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` date DEFAULT NULL,
  `flag` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `eoms`
--

INSERT INTO `eoms` (`id`, `year`, `flag`) VALUES
(1, '2014-03-16', 1),
(2, '2014-04-18', 1),
(3, '2014-04-17', 0);

-- --------------------------------------------------------

--
-- Table structure for table `equities`
--

CREATE TABLE IF NOT EXISTS `equities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(25) NOT NULL,
  `beginning_balance` decimal(11,2) DEFAULT '0.00',
  `Owner_Investment` decimal(11,2) DEFAULT '0.00',
  `revenue` decimal(11,2) NOT NULL DEFAULT '0.00',
  `expenditure` decimal(11,2) NOT NULL DEFAULT '0.00',
  `net_income` decimal(11,2) DEFAULT '0.00',
  `withdrawal` decimal(11,2) DEFAULT '0.00',
  `net_loss` decimal(11,2) DEFAULT '0.00',
  `balance_end` decimal(11,2) DEFAULT '0.00',
  `flag` int(2) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=61 ;

--
-- Dumping data for table `equities`
--

INSERT INTO `equities` (`id`, `description`, `beginning_balance`, `Owner_Investment`, `revenue`, `expenditure`, `net_income`, `withdrawal`, `net_loss`, `balance_end`, `flag`, `date`) VALUES
(1, 'Sale/Service Revenue', '0.00', '0.00', '45.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2014-02-25'),
(2, 'Sale/Service Revenue', '0.00', '0.00', '43.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2014-02-25'),
(3, 'Sale/Service Revenue', '0.00', '0.00', '40.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2014-02-25'),
(4, 'Sale/Service Revenue', '0.00', '0.00', '72.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2014-02-26'),
(5, 'Sale/Service Revenue', '0.00', '0.00', '72.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2014-02-26'),
(6, 'Sale/Service Revenue', '0.00', '0.00', '72.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2014-02-26'),
(7, 'Sale/Service Revenue', '0.00', '0.00', '72.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2014-02-26'),
(8, 'Sale/Service Revenue', '0.00', '0.00', '72.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2014-02-26'),
(9, 'EOM', NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 2, '2014-03-16'),
(10, 'EOM', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 2, '2014-04-18'),
(11, 'Sales Revenue', '0.00', '0.00', '174.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2014-10-11'),
(12, 'Sales Revenue', '0.00', '0.00', '1463.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-05-30'),
(13, 'Sales Revenue', '0.00', '0.00', '1463.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-05-30'),
(14, 'Sales Revenue', '0.00', '0.00', '1463.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-05-30'),
(15, 'Sales Revenue', '0.00', '0.00', '1463.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-05-30'),
(16, 'Sales Revenue', '0.00', '0.00', '313.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-05-30'),
(17, 'Sales Revenue', '0.00', '0.00', '313.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-05-30'),
(18, 'Sales Revenue', '0.00', '0.00', '313.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-05-30'),
(19, 'Sales Revenue', '0.00', '0.00', '313.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-05-30'),
(20, 'Sales Revenue', '0.00', '0.00', '313.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-05-30'),
(21, 'Sales Revenue', '0.00', '0.00', '313.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-05-30'),
(22, 'Sales Revenue', '0.00', '0.00', '313.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-05-30'),
(23, 'Sales Revenue', '0.00', '0.00', '313.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-05-30'),
(24, 'Sales Revenue', '0.00', '0.00', '313.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-05-30'),
(25, 'Sales Revenue', '0.00', '0.00', '313.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-05-30'),
(26, 'Sales Revenue', '0.00', '0.00', '313.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-05-30'),
(27, 'Sales Revenue', '0.00', '0.00', '313.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-05-30'),
(28, 'Sales Revenue', '0.00', '0.00', '313.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-05-30'),
(29, 'Sales Revenue', '0.00', '0.00', '313.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-05-30'),
(30, 'Sales Revenue', '0.00', '0.00', '313.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-05-30'),
(31, 'Sales Revenue', '0.00', '0.00', '313.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-05-30'),
(32, 'Sales Revenue', '0.00', '0.00', '313.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-05-30'),
(33, 'Sales Revenue', '0.00', '0.00', '313.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-05-30'),
(34, 'Sales Revenue', '0.00', '0.00', '313.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-05-30'),
(35, 'Sales Revenue', '0.00', '0.00', '313.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-05-30'),
(36, 'Sales Revenue', '0.00', '0.00', '313.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-05-30'),
(37, 'Sales Revenue', '0.00', '0.00', '313.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-05-30'),
(38, 'Sales Revenue', '0.00', '0.00', '313.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-05-30'),
(39, 'Sales Revenue', '0.00', '0.00', '1224.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-06-04'),
(40, 'Sales Revenue', '0.00', '0.00', '1224.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-06-04'),
(41, 'Sales Revenue', '0.00', '0.00', '1224.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-06-04'),
(42, 'Sales Revenue', '0.00', '0.00', '1224.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-06-04'),
(43, 'Sales Revenue', '0.00', '0.00', '1224.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-06-04'),
(44, 'Sales Revenue', '0.00', '0.00', '1224.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-06-04'),
(45, 'Sales Revenue', '0.00', '0.00', '1224.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-06-04'),
(46, 'Sales Revenue', '0.00', '0.00', '1224.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-06-04'),
(47, 'Sales Revenue', '0.00', '0.00', '299.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-06-08'),
(48, 'Sales Revenue', '0.00', '0.00', '299.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-06-08'),
(49, 'Sales Revenue', '0.00', '0.00', '299.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-06-08'),
(50, 'Sales Revenue', '0.00', '0.00', '299.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-06-08'),
(51, 'Sales Revenue', '0.00', '0.00', '299.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-06-08'),
(52, 'Sales Revenue', '0.00', '0.00', '299.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-06-08'),
(53, 'Sales Revenue', '0.00', '0.00', '299.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-06-08'),
(54, 'Sales Revenue', '0.00', '0.00', '299.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-06-08'),
(55, 'Sales Revenue', '0.00', '0.00', '299.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-06-08'),
(56, 'Sales Revenue', '0.00', '0.00', '299.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-06-08'),
(57, 'Sales Revenue', '0.00', '0.00', '299.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-06-08'),
(58, 'Sales Revenue', '0.00', '0.00', '121.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-06-08'),
(59, 'Sales Revenue', '0.00', '0.00', '121.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-06-08'),
(60, 'Sales Revenue', '0.00', '0.00', '455.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-06-08');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `event` varchar(30) NOT NULL,
  `event_date` date DEFAULT NULL,
  `modified` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `event`, `event_date`, `modified`) VALUES
(1, 'Birthday', NULL, '0000-00-00 00:00:00'),
(2, 'New Year', '2000-01-01', '2016-01-01 01:59:59'),
(3, 'Independence Day', '2000-03-06', '2016-01-01 02:00:17'),
(4, 'Promotional', NULL, '0000-00-00 00:00:00'),
(5, 'Easter', '2000-04-01', '2016-01-01 02:00:20'),
(6, 'Christmas', '2000-12-25', '2016-01-01 02:00:22'),
(7, 'Eidul Fitr', '2000-07-01', '2016-01-01 02:00:24'),
(8, 'Eidul Adha', '2000-09-02', '2016-01-01 02:00:06');

-- --------------------------------------------------------

--
-- Table structure for table `expectedinstallments`
--

CREATE TABLE IF NOT EXISTS `expectedinstallments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `zone_id` int(2) DEFAULT NULL,
  `expected_installment` int(11) DEFAULT '0',
  `paid_install` int(11) DEFAULT '0',
  `balance` int(11) DEFAULT '0',
  `default_interest` int(11) DEFAULT '0',
  `payment_status` enum('no_payment','part_payment','full_payment') DEFAULT 'no_payment',
  `defaulter` enum('1','0') DEFAULT '0',
  `installment_no` int(2) DEFAULT '0',
  `newinstallment_no` int(2) DEFAULT '0',
  `due_date` date DEFAULT NULL,
  `previouspaid_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `expectedinstallments`
--

INSERT INTO `expectedinstallments` (`id`, `order_id`, `payment_id`, `user_id`, `customer_id`, `zone_id`, `expected_installment`, `paid_install`, `balance`, `default_interest`, `payment_status`, `defaulter`, `installment_no`, `newinstallment_no`, `due_date`, `previouspaid_date`) VALUES
(1, 8, 1, 86, 2, 1, 50, 50, -148, 0, 'full_payment', '0', 0, 1, '2015-08-26', '2015-08-27'),
(2, 8, NULL, 86, 2, 1, 50, 48, 2, 0, 'part_payment', '', 0, 2, '2015-11-26', NULL),
(3, 1, NULL, NULL, 1, 2, 130, 0, 130, 0, 'no_payment', '0', 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `expectedpayments`
--

CREATE TABLE IF NOT EXISTS `expectedpayments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `expected_amount` int(11) DEFAULT NULL,
  `expected_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `expenditures`
--

CREATE TABLE IF NOT EXISTS `expenditures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_id` int(11) DEFAULT NULL,
  `expense_type` int(1) NOT NULL,
  `expense_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` decimal(11,2) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `paid_to` varchar(50) DEFAULT NULL,
  `prepared_by` int(11) DEFAULT NULL,
  `userdepartment_id` int(11) DEFAULT NULL,
  `remarks` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `expense_name` (`expense_id`,`expense_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE IF NOT EXISTS `expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `payment_name`) VALUES
(1, 'test'),
(5, 'GENERAL REPAIRS'),
(6, 'FUEL'),
(7, 'VEHICLE MAINTENANCE'),
(16, 'OUT-STATION EXPENSES'),
(18, 'ACCOUNTING & LEGAL FEES'),
(19, 'BANK BALANCE'),
(20, 'DELIVERY EXPENSES'),
(22, 'PHONE / INTERNET EXPENSES'),
(24, 'ELECTRICITY EXPENSES'),
(25, 'CLEANING EXPENSES'),
(26, 'TRAINING EXPENSES'),
(27, 'STATIONERY EXPENSES'),
(28, 'HOTEL EXPENSES'),
(29, 'OFFICE NEEDS'),
(31, 'PETTY CASH'),
(32, 'STATUTORY PAYMENTS'),
(33, 'ADVERTISEMENT EXPENSE'),
(34, 'OFFICE UTILITIES'),
(35, 'TRANSPORTION EXPENSES'),
(36, 'RENT EXPENSES'),
(37, 'POSTAGE'),
(38, 'AIRCONDITION INSTALLATION'),
(39, 'REFRESHMENT'),
(40, 'SECURITY EXPENSES'),
(41, 'GENERAL EXPENSES'),
(42, 'SALARY EXPENSES'),
(43, 'STAFF WELFARE'),
(44, 'BANK CHARGES');

-- --------------------------------------------------------

--
-- Table structure for table `fixed_assets`
--

CREATE TABLE IF NOT EXISTS `fixed_assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `asset_name` varchar(30) DEFAULT NULL,
  `asset_type` int(2) DEFAULT NULL,
  `dep_begin` enum('Yes','No') DEFAULT NULL,
  `description` text,
  `cost` decimal(11,2) DEFAULT '0.00',
  `status` enum('sold','expired','alive','deleted') DEFAULT 'alive',
  `depreciation_rate` int(3) DEFAULT '0',
  `year_end_deduction` decimal(11,2) DEFAULT '0.00',
  `purchase_date` date DEFAULT NULL,
  `disposal_date` date DEFAULT NULL,
  `disposal_amt` decimal(11,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fixedasset_extras`
--

CREATE TABLE IF NOT EXISTS `fixedasset_extras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fixed_asset_id` int(11) DEFAULT NULL,
  `asset_value` decimal(11,2) DEFAULT '0.00',
  `year_end_dt` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hirepurchases`
--

CREATE TABLE IF NOT EXISTS `hirepurchases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_name` varchar(50) NOT NULL,
  `path` varchar(100) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `idtypes`
--

CREATE TABLE IF NOT EXISTS `idtypes` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `id_type` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `idtypes`
--

INSERT INTO `idtypes` (`id`, `id_type`) VALUES
(1, '-Select-'),
(2, 'National ID'),
(3, 'NHIS ID'),
(4, 'Drivers License'),
(5, 'Passport'),
(6, 'Social Security'),
(7, 'Voters ID');

-- --------------------------------------------------------

--
-- Table structure for table `imprest_accounts`
--

CREATE TABLE IF NOT EXISTS `imprest_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `zone_id` int(2) DEFAULT NULL,
  `expense_type` int(1) NOT NULL,
  `expense_desc` varchar(27) DEFAULT NULL,
  `expense_date` date DEFAULT NULL,
  `deposit_type` int(2) DEFAULT NULL,
  `source` varchar(15) DEFAULT NULL,
  `amount` decimal(11,2) NOT NULL,
  `principal` decimal(11,2) DEFAULT '0.00',
  `scd_type` int(3) DEFAULT '0',
  `ln_months` int(5) DEFAULT '0',
  `prepared_by` varchar(50) DEFAULT NULL,
  `paid_to` varchar(70) DEFAULT NULL,
  `remarks` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `expense_name` (`expense_id`,`expense_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `income_statements`
--

CREATE TABLE IF NOT EXISTS `income_statements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) DEFAULT NULL,
  `cash_account_id` int(11) DEFAULT NULL,
  `description` varchar(50) NOT NULL,
  `revenue` decimal(11,2) DEFAULT '0.00',
  `expenditure` decimal(11,2) DEFAULT '0.00',
  `loancash` decimal(11,2) DEFAULT '0.00',
  `interest` decimal(11,2) DEFAULT '0.00',
  `actualinterest` decimal(11,2) DEFAULT '0.00',
  `saleofassets` decimal(11,2) DEFAULT '0.00',
  `proceedsonassets` decimal(11,2) DEFAULT '0.00',
  `taxpaid` decimal(11,2) DEFAULT '0.00',
  `net_income` decimal(11,2) DEFAULT '0.00',
  `flag` int(2) NOT NULL DEFAULT '0',
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `income_statements`
--

INSERT INTO `income_statements` (`id`, `sale_id`, `cash_account_id`, `description`, `revenue`, `expenditure`, `loancash`, `interest`, `actualinterest`, `saleofassets`, `proceedsonassets`, `taxpaid`, `net_income`, `flag`, `date`) VALUES
(1, 8, NULL, 'Sales Revenue', '198.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, '2015-08-27');

-- --------------------------------------------------------

--
-- Table structure for table `investment_payments`
--

CREATE TABLE IF NOT EXISTS `investment_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `investment_id` int(11) DEFAULT NULL,
  `investor_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` decimal(11,2) DEFAULT '0.00',
  `payment_mode` varchar(20) DEFAULT NULL,
  `cheque_nos` varchar(100) DEFAULT NULL,
  `created` datetime NOT NULL,
  `payment_date` date DEFAULT NULL,
  `delete_status` enum('dead','alive') DEFAULT 'alive',
  `deleted_by` varchar(200) DEFAULT NULL,
  `edit_details_username_oldnnewamout` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `investment_payments`
--

INSERT INTO `investment_payments` (`id`, `investment_id`, `investor_id`, `user_id`, `amount`, `payment_mode`, `cheque_nos`, `created`, `payment_date`, `delete_status`, `deleted_by`, `edit_details_username_oldnnewamout`) VALUES
(1, 12, 2, NULL, '300.60', 'Cheque', '777-99-fgt', '2014-05-28 17:55:51', '2014-05-28', 'alive', NULL, NULL),
(2, 12, 2, NULL, '40.00', 'Cheque', 'rrtt-www-333', '2014-05-28 18:12:31', '2014-05-28', 'alive', NULL, NULL),
(3, 5, 1, NULL, '60.70', 'Post-dated chq', '55-pp0-ii', '2014-05-28 18:20:45', '2014-05-28', 'alive', NULL, NULL),
(4, 11, 2, NULL, '480.00', 'Cash', '', '2014-09-08 12:16:57', '2014-09-08', 'alive', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `investment_statements`
--

CREATE TABLE IF NOT EXISTS `investment_statements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `investment_id` int(11) DEFAULT NULL,
  `investor_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `principal` decimal(11,2) DEFAULT '0.00',
  `interest` decimal(11,2) DEFAULT '0.00',
  `total` decimal(11,2) DEFAULT '0.00',
  `maturity_date` date DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `investments`
--

CREATE TABLE IF NOT EXISTS `investments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `investment_no` varchar(20) DEFAULT NULL,
  `investor_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `investment_amount` decimal(11,2) DEFAULT '0.00',
  `portfolio_id` int(11) DEFAULT NULL,
  `custom_rate` decimal(3,2) DEFAULT '0.00',
  `amount_due` decimal(11,2) DEFAULT '0.00',
  `amount_paidout` decimal(11,2) NOT NULL DEFAULT '0.00',
  `balance` decimal(11,2) NOT NULL DEFAULT '0.00',
  `interest_earned` decimal(11,2) DEFAULT '0.00',
  `investment_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `lastpaidout_date` date DEFAULT NULL,
  `details` varchar(200) DEFAULT NULL,
  `status` enum('Paid','Rolled_over','Cancelled','Part_payment','Invested') DEFAULT 'Invested',
  `old_status` enum('Paid','Rolled_over','Cancelled','Part_payment','Invested') DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `investors`
--

CREATE TABLE IF NOT EXISTS `investors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_id` int(2) NOT NULL DEFAULT '1',
  `marriage_id` int(3) DEFAULT NULL,
  `idtype_id` int(3) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `entryclerk_name` varchar(80) DEFAULT NULL,
  `customer_category_id` int(3) DEFAULT NULL,
  `registration_date` date NOT NULL,
  `investor_photo` blob NOT NULL,
  `surname` varchar(20) NOT NULL,
  `other_names` varchar(35) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `fullname` varchar(80) DEFAULT NULL,
  `dob` date NOT NULL,
  `id_number` varchar(25) NOT NULL,
  `postal_address` varchar(50) NOT NULL,
  `mobile_no` varchar(15) NOT NULL,
  `work_no` varchar(15) DEFAULT NULL,
  `work_place` varchar(50) DEFAULT NULL,
  `work_department` varchar(30) DEFAULT NULL,
  `work_location` varchar(50) DEFAULT NULL,
  `position` varchar(40) DEFAULT NULL,
  `no_of_yrs` varchar(40) DEFAULT NULL,
  `last_school` varchar(50) DEFAULT NULL,
  `religion` varchar(20) DEFAULT NULL,
  `religion_location` varchar(50) DEFAULT NULL,
  `email` varchar(35) DEFAULT NULL,
  `house_no` varchar(10) NOT NULL,
  `street` varchar(30) DEFAULT NULL,
  `area` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `landmark` varchar(50) DEFAULT NULL,
  `emergency_person` varchar(50) NOT NULL,
  `emergency_no` varchar(15) NOT NULL,
  `investor_signature` enum('Yes','No') DEFAULT NULL,
  `visible` enum('alive','deleted') DEFAULT 'alive',
  PRIMARY KEY (`id`),
  KEY `surname` (`surname`),
  KEY `other_names` (`other_names`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `invoiceold_editions`
--

CREATE TABLE IF NOT EXISTS `invoiceold_editions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `custom_rate` decimal(3,3) DEFAULT NULL,
  `discount` decimal(3,3) NOT NULL DEFAULT '0.000',
  `zone_id` int(11) DEFAULT NULL,
  `balance` decimal(11,2) DEFAULT NULL,
  `mthly_install` decimal(11,2) DEFAULT NULL,
  `payment_term` varchar(20) DEFAULT NULL,
  `hp_price` decimal(11,2) NOT NULL,
  `rate_id` int(11) DEFAULT NULL,
  `tax_charge` int(3) DEFAULT NULL,
  `cash_price` int(11) DEFAULT NULL,
  `last_date` date DEFAULT NULL,
  `payment_mode` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `order_date` date DEFAULT NULL,
  `delivery_date` int(11) DEFAULT NULL,
  `invoice_decision_date` date DEFAULT NULL,
  `customer_id` int(9) NOT NULL,
  `mobile_no` varchar(15) NOT NULL,
  `work_place` varchar(50) DEFAULT NULL,
  `category` varchar(10) DEFAULT NULL,
  `sales_person` varchar(50) DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `cash_price` int(11) NOT NULL,
  `interest_rate` decimal(3,3) DEFAULT NULL,
  `payment_mode` varchar(15) DEFAULT NULL,
  `payment_term` varchar(20) DEFAULT NULL,
  `quantity` int(3) DEFAULT NULL,
  `tax_charge` int(3) DEFAULT NULL,
  `hp_price` decimal(11,2) NOT NULL,
  `mthly_install` decimal(11,2) NOT NULL,
  `discount` int(3) NOT NULL DEFAULT '0',
  `approved` int(1) NOT NULL DEFAULT '0',
  `status` enum('Pending Approval','Rejected','Approved','Deleted') NOT NULL DEFAULT 'Pending Approval',
  `delivery` enum('No','Warehouse Processing','En-route','Delivered') NOT NULL DEFAULT 'No',
  `invoice_no` varchar(15) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `first_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_person` (`sales_person`),
  KEY `invoice_number` (`invoice_no`,`due_date`,`first_date`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `order_id`, `last_modified_date`, `order_date`, `delivery_date`, `invoice_decision_date`, `customer_id`, `mobile_no`, `work_place`, `category`, `sales_person`, `zone_id`, `cash_price`, `interest_rate`, `payment_mode`, `payment_term`, `quantity`, `tax_charge`, `hp_price`, `mthly_install`, `discount`, `approved`, `status`, `delivery`, `invoice_no`, `due_date`, `first_date`) VALUES
(1, 8, '2015-08-27 17:36:05', '2015-08-26', 2015, '2015-08-27', 2, '12342', 'test', NULL, 'test_sales', 1, 160, NULL, 'Cash', '4 months', NULL, NULL, '198.00', '50.00', 0, 1, 'Approved', 'Delivered', 'BOM008', NULL, '2015-08-26'),
(2, 1, '2015-11-26 18:25:24', '2015-10-31', 2015, '2015-11-03', 1, '12342', 'test', NULL, NULL, 2, 120, NULL, 'Cash', '1 month', NULL, NULL, '130.00', '130.00', 0, 1, 'Approved', 'Delivered', 'BOM001', NULL, '2015-10-31');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(200) NOT NULL,
  `serialno` varchar(70) DEFAULT NULL,
  `supply_invoiceno` varchar(70) DEFAULT NULL,
  `transaction_mode` enum('Sale','Service','Rental') DEFAULT 'Sale',
  `date_added` date DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modelno` varchar(200) DEFAULT NULL,
  `item_item` varchar(200) DEFAULT NULL,
  `item_type` varchar(30) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `brand` varchar(30) DEFAULT NULL,
  `supplier_id` int(11) NOT NULL,
  `cost_price` decimal(11,2) DEFAULT '0.00',
  `selling_price` decimal(11,2) DEFAULT '0.00',
  `item_photo` mediumblob,
  `delete_status` enum('deleted','alive') DEFAULT 'alive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=514 ;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `item`, `serialno`, `supply_invoiceno`, `transaction_mode`, `date_added`, `last_modified_date`, `modelno`, `item_item`, `item_type`, `description`, `brand`, `supplier_id`, `cost_price`, `selling_price`, `item_photo`, `delete_status`) VALUES
(343, 'Adult Hair Cut', 'B0002', '', 'Service', '2015-11-27', '2015-11-27 21:38:14', '', NULL, 'Barbering', '', '', 4, '0.00', '15.00', NULL, 'alive'),
(344, 'Comb Twist Long Hair', 'B0005', '', 'Service', '2015-11-27', '2015-11-27 21:38:14', '', NULL, 'Barbering', '', '', 4, '0.00', '50.00', NULL, 'alive'),
(345, 'Comb Twist Short Hair', 'B0031', '', 'Service', '2015-11-27', '2015-11-27 21:38:14', '', NULL, 'Barbering', '', '', 4, '0.00', '40.00', NULL, 'alive'),
(346, 'Company dye', 'B0022', '', 'Service', '2015-11-27', '2015-11-27 21:38:14', '', NULL, 'Barbering', '', '', 4, '0.00', '35.00', NULL, 'alive'),
(347, 'Customer Dye', 'B0023', '', 'Service', '2015-11-27', '2015-11-27 21:38:14', '', NULL, 'Barbering', '', '', 4, '0.00', '40.00', NULL, 'alive'),
(348, 'Cut & Color', 'B0014', '', 'Service', '2015-11-27', '2015-11-27 21:38:14', '', NULL, 'Barbering', '', '', 4, '0.00', '50.00', NULL, 'alive'),
(349, 'European Hair Cut', 'B0003', '', 'Service', '2015-11-27', '2015-11-27 21:38:14', '', NULL, 'Barbering', '', '', 4, '0.00', '25.00', NULL, 'alive'),
(350, 'EYE BROW', 'B0019', '', 'Service', '2015-11-27', '2015-11-27 21:38:15', '', NULL, 'Barbering', '', '', 4, '0.00', '20.00', NULL, 'alive'),
(351, 'Foam Twist Long Hair', 'B0030', '', 'Service', '2015-11-27', '2015-11-27 21:38:15', '', NULL, 'Barbering', '', '', 4, '0.00', '5.00', NULL, 'alive'),
(352, 'Foam Twist Short Hair', 'B0006', '', 'Service', '2015-11-27', '2015-11-27 21:38:15', '', NULL, 'Barbering', '', '', 4, '0.00', '30.00', NULL, 'alive'),
(353, 'Hand Twist', 'B0004', '', 'Service', '2015-11-27', '2015-11-27 21:38:15', '', NULL, 'Barbering', '', '', 4, '0.00', '90.00', NULL, 'alive'),
(354, 'Kids Hair Cut', 'B0001', '', 'Service', '2015-11-27', '2015-11-27 21:38:15', '', NULL, 'Barbering', '', '', 4, '0.00', '130.00', NULL, 'alive'),
(355, 'Ladies Hair Cut with Scissors', 'B0020', '', 'Service', '2015-11-27', '2015-11-27 21:38:15', '', NULL, 'Barbering', '', '', 4, '0.00', '60.00', NULL, 'alive'),
(356, 'Ladies Hair cut without Scissors', 'B0032', '', 'Service', '2015-11-27', '2015-11-27 21:38:15', '', NULL, 'Barbering', '', '', 4, '0.00', '40.00', NULL, 'alive'),
(357, 'Manicure', 'B0012', '', 'Service', '2015-11-27', '2015-11-27 21:38:15', '', NULL, 'Barbering', '', '', 4, '0.00', '10.00', NULL, 'alive'),
(358, 'Pedicure', 'B0013', '', 'Service', '2015-11-27', '2015-11-27 21:38:16', '', NULL, 'Barbering', '', '', 4, '0.00', '50.00', NULL, 'alive'),
(359, 'Pedicure', 'B0039', '', 'Service', '2015-11-27', '2015-11-27 21:38:16', '', NULL, 'Barbering', '', '', 4, '0.00', '30.00', NULL, 'alive'),
(360, 'Permanent Lock (short)', 'B0028', '', 'Service', '2015-11-27', '2015-11-27 21:38:16', '', NULL, 'Barbering', '', '', 4, '0.00', '20.00', NULL, 'alive'),
(361, 'Permanent Locks Long', 'B0016', '', 'Service', '2015-11-27', '2015-11-27 21:38:16', '', NULL, 'Barbering', '', '', 4, '0.00', '60.00', NULL, 'alive'),
(362, 'Polish', 'B0021', '', 'Service', '2015-11-27', '2015-11-27 21:38:16', '', NULL, 'Barbering', '', '', 4, '0.00', '55.00', NULL, 'alive'),
(363, 'Polish', 'B0024', '', 'Service', '2015-11-27', '2015-11-27 21:38:16', '', NULL, 'Barbering', '', '', 4, '0.00', '80.00', NULL, 'alive'),
(364, 'Polish', 'B0025', '', 'Service', '2015-11-27', '2015-11-27 21:38:16', '', NULL, 'Barbering', '', '', 4, '0.00', '50.00', NULL, 'alive'),
(365, 'Re-Twist (Long Hair)', 'B0007', '', 'Service', '2015-11-27', '2015-11-27 21:38:16', '', NULL, 'Barbering', '', '', 4, '0.00', '40.00', NULL, 'alive'),
(366, 'Re-Twist (Short Hair)', 'B0008', '', 'Service', '2015-11-27', '2015-11-27 21:38:17', '', NULL, 'Barbering', '', '', 4, '0.00', '40.00', NULL, 'alive'),
(367, 'Shaving', 'B0011', '', 'Service', '2015-11-27', '2015-11-27 21:38:17', '', NULL, 'Barbering', '', '', 4, '0.00', '75.00', NULL, 'alive'),
(368, 'Spotting Waves (Long Hair)', 'B0009', '', 'Service', '2015-11-27', '2015-11-27 21:38:17', '', NULL, 'Barbering', '', '', 4, '0.00', '50.00', NULL, 'alive'),
(369, 'Spotting Waves (Short Hair)', 'B0010', '', 'Service', '2015-11-27', '2015-11-27 21:38:17', '', NULL, 'Barbering', '', '', 4, '0.00', '70.00', NULL, 'alive'),
(370, 'Design', 'N0012', '', 'Service', '2015-11-27', '2015-11-27 21:32:26', '', NULL, 'Nails', '', '', 4, '0.00', '5.00', NULL, 'alive'),
(371, 'Dissolving', 'N0005', '', 'Service', '2015-11-27', '2015-11-27 21:32:26', '', NULL, 'Nails', '', '', 4, '0.00', '8.00', NULL, 'alive'),
(372, 'Dissolving & Polish', 'N0006', '', 'Service', '2015-11-27', '2015-11-27 21:32:26', '', NULL, 'Nails', '', '', 4, '0.00', '10.00', NULL, 'alive'),
(373, 'French Tip', 'N0002', '', 'Service', '2015-11-27', '2015-11-27 21:32:26', '', NULL, 'Nails', '', '', 4, '0.00', '25.00', NULL, 'alive'),
(374, 'French Tip', 'N00012', '', 'Service', '2015-11-27', '2015-11-27 21:32:27', '', NULL, 'Nails', '', '', 4, '0.00', '20.00', NULL, 'alive'),
(375, 'Gel', 'N0014', '', 'Service', '2015-11-27', '2015-11-27 21:32:27', '', NULL, 'Nails', '', '', 4, '0.00', '30.00', NULL, 'alive'),
(376, 'Manicure', 'N0011', '', 'Service', '2015-11-27', '2015-11-27 21:32:27', '', NULL, 'Nails', '', '', 4, '0.00', '15.00', NULL, 'alive'),
(377, 'Normal Tip', 'N0001', '', 'Service', '2015-11-27', '2015-11-27 21:32:27', '', NULL, 'Nails', '', '', 4, '0.00', '20.00', NULL, 'alive'),
(378, 'Pedicure', 'N0010', '', 'Service', '2015-11-27', '2015-11-27 21:32:27', '', NULL, 'Nails', '', '', 4, '0.00', '25.00', NULL, 'alive'),
(379, 'Polish', 'N0008', '', 'Service', '2015-11-27', '2015-11-27 21:32:27', '', NULL, 'Nails', '', '', 4, '0.00', '5.00', NULL, 'alive'),
(380, 'Polish With French Tip', 'N0007', '', 'Service', '2015-11-27', '2015-11-27 21:32:27', '', NULL, 'Nails', '', '', 4, '0.00', '6.00', NULL, 'alive'),
(381, 'Refill', 'N0003', '', 'Service', '2015-11-27', '2015-11-27 21:32:27', '', NULL, 'Nails', '', '', 4, '0.00', '15.00', NULL, 'alive'),
(382, 'Replacement of one tip', 'N0015', '', 'Service', '2015-11-27', '2015-11-27 21:32:27', '', NULL, 'Nails', '', '', 4, '0.00', '3.00', NULL, 'alive'),
(383, 'Sculpture', 'N0013', '', 'Service', '2015-11-27', '2015-11-27 21:32:28', '', NULL, 'Nails', '', '', 4, '0.00', '25.00', NULL, 'alive'),
(384, 'Stick-On', 'N0009', '', 'Service', '2015-11-27', '2015-11-27 21:32:28', '', NULL, 'Nails', '', '', 4, '0.00', '10.00', NULL, 'alive'),
(385, 'Tiding & Polish', 'N0004', '', 'Service', '2015-11-27', '2015-11-27 21:32:28', '', NULL, 'Nails', '', '', 4, '0.00', '8.00', NULL, 'alive'),
(386, 'Bridal Make Up', 'P0037', '', 'Service', '2015-11-27', '2015-11-27 21:32:28', '', NULL, 'Parlour', '', '', 4, '0.00', '40.00', NULL, 'alive'),
(387, 'Bridal Make Up-Home Service', 'P0038', '', 'Service', '2015-11-27', '2015-11-27 21:32:28', '', NULL, 'Parlour', '', '', 4, '0.00', '80.00', NULL, 'alive'),
(388, 'Bridal Make-up Home Serives', 'P0075', '', 'Service', '2015-11-27', '2015-11-27 21:32:28', '', NULL, 'Parlour', '', '', 4, '0.00', '50.00', NULL, 'alive'),
(389, 'Chain Waxing', 'P0049', '', 'Service', '2015-11-27', '2015-11-27 21:32:28', '', NULL, 'Parlour', '', '', 4, '0.00', '15.00', NULL, 'alive'),
(390, 'Contact Lens fixing', 'P0052', '', 'Service', '2015-11-27', '2015-11-27 21:32:28', '', NULL, 'Parlour', '', '', 4, '0.00', '10.00', NULL, 'alive'),
(391, 'Dura Lash', 'P0044', '', 'Service', '2015-11-27', '2015-11-27 21:32:28', '', NULL, 'Parlour', '', '', 4, '0.00', '20.00', NULL, 'alive'),
(392, 'Eye Lash', 'P0060', '', 'Service', '2015-11-27', '2015-11-27 21:32:28', '', NULL, 'Parlour', '', '', 4, '0.00', '15.00', NULL, 'alive'),
(393, 'EyeBrow Trimming', 'P0027', '', 'Service', '2015-11-27', '2015-11-27 21:32:29', '', NULL, 'Parlour', '', '', 4, '0.00', '5.00', NULL, 'alive'),
(394, 'EyeBrow Tweezing', 'P0026', '', 'Service', '2015-11-27', '2015-11-27 21:32:29', '', NULL, 'Parlour', '', '', 4, '0.00', '10.00', NULL, 'alive'),
(395, 'EyeBrow Tweezing', 'P0045', '', 'Service', '2015-11-27', '2015-11-27 21:32:29', '', NULL, 'Parlour', '', '', 4, '0.00', '8.00', NULL, 'alive'),
(396, 'EyeBrow Tweezing', 'P0046', '', 'Service', '2015-11-27', '2015-11-27 21:32:29', '', NULL, 'Parlour', '', '', 4, '0.00', '8.00', NULL, 'alive'),
(397, 'Facial-Acne/Problem Skin', 'P0003', '', 'Service', '2015-11-27', '2015-11-27 21:32:29', '', NULL, 'Parlour', '', '', 4, '0.00', '50.00', NULL, 'alive'),
(398, 'Facial-Own Products', 'P0001', '', 'Service', '2015-11-27', '2015-11-27 21:32:29', '', NULL, 'Parlour', '', '', 4, '0.00', '40.00', NULL, 'alive'),
(399, 'Facial-Problem Free Skin', 'P0002', '', 'Service', '2015-11-27', '2015-11-27 21:32:29', '', NULL, 'Parlour', '', '', 4, '0.00', '40.00', NULL, 'alive'),
(400, 'Hydro Bath', 'P0011', '', 'Service', '2015-11-27', '2015-11-27 21:32:29', '', NULL, 'Parlour', '', '', 4, '0.00', '40.00', NULL, 'alive'),
(401, 'Hydro Bath & Massage', 'P0012', '', 'Service', '2015-11-27', '2015-11-27 21:32:29', '', NULL, 'Parlour', '', '', 4, '0.00', '60.00', NULL, 'alive'),
(402, 'Lash Refill', 'P0041', '', 'Service', '2015-11-27', '2015-11-27 21:32:29', '', NULL, 'Parlour', '', '', 4, '0.00', '8.00', NULL, 'alive'),
(403, 'Lash Refill', 'P0042', '', 'Service', '2015-11-27', '2015-11-27 21:32:30', '', NULL, 'Parlour', '', '', 4, '0.00', '8.00', NULL, 'alive'),
(404, 'Lash Refill', 'P0043', '', 'Service', '2015-11-27', '2015-11-27 21:32:30', '', NULL, 'Parlour', '', '', 4, '0.00', '10.00', NULL, 'alive'),
(405, 'Lash-1 Pack', 'P0028', '', 'Service', '2015-11-27', '2015-11-27 21:32:30', '', NULL, 'Parlour', '', '', 4, '0.00', '15.00', NULL, 'alive'),
(406, 'Lash-1 Pack Extra 1 Line', 'P0029', '', 'Service', '2015-11-27', '2015-11-27 21:32:30', '', NULL, 'Parlour', '', '', 4, '0.00', '20.00', NULL, 'alive'),
(407, 'Lash-1 Pack, Extra 1&1/2 Lines', 'P0030', '', 'Service', '2015-11-27', '2015-11-27 21:32:30', '', NULL, 'Parlour', '', '', 4, '0.00', '25.00', NULL, 'alive'),
(408, 'Lash-1 Pack, Extra 2 Lines', 'P0031', '', 'Service', '2015-11-27', '2015-11-27 21:32:30', '', NULL, 'Parlour', '', '', 4, '0.00', '25.00', NULL, 'alive'),
(409, 'Lash-2 Packs', 'P0032', '', 'Service', '2015-11-27', '2015-11-27 21:32:30', '', NULL, 'Parlour', '', '', 4, '0.00', '30.00', NULL, 'alive'),
(410, 'Make Up-Day', 'P0036', '', 'Service', '2015-11-27', '2015-11-27 21:32:30', '', NULL, 'Parlour', '', '', 4, '0.00', '25.00', NULL, 'alive'),
(411, 'Massage-Back', 'P0006', '', 'Service', '2015-11-27', '2015-11-27 21:32:31', '', NULL, 'Parlour', '', '', 4, '0.00', '30.00', NULL, 'alive'),
(412, 'Massage-Extra', 'P0009', '', 'Service', '2015-11-27', '2015-11-27 21:32:31', '', NULL, 'Parlour', '', '', 4, '0.00', '85.00', NULL, 'alive'),
(413, 'Massage-Foot', 'P0010', '', 'Service', '2015-11-27', '2015-11-27 21:32:31', '', NULL, 'Parlour', '', '', 4, '0.00', '20.00', NULL, 'alive'),
(414, 'Massage-Full Body', 'P0008', '', 'Service', '2015-11-27', '2015-11-27 21:32:31', '', NULL, 'Parlour', '', '', 4, '0.00', '55.00', NULL, 'alive'),
(415, 'Massage-Neck', 'P0004', '', 'Service', '2015-11-27', '2015-11-27 21:32:31', '', NULL, 'Parlour', '', '', 4, '0.00', '20.00', NULL, 'alive'),
(416, 'Massage-Shoulder', 'P0005', '', 'Service', '2015-11-27', '2015-11-27 21:32:31', '', NULL, 'Parlour', '', '', 4, '0.00', '20.00', NULL, 'alive'),
(417, 'Massage-Waist', 'P0007', '', 'Service', '2015-11-27', '2015-11-27 21:32:31', '', NULL, 'Parlour', '', '', 4, '0.00', '20.00', NULL, 'alive'),
(418, 'Own Lash', 'P0048', '', 'Service', '2015-11-27', '2015-11-27 21:32:31', '', NULL, 'Parlour', '', '', 4, '0.00', '10.00', NULL, 'alive'),
(419, 'Piercing with normal earrings', 'P0035', '', 'Service', '2015-11-27', '2015-11-27 21:32:31', '', NULL, 'Parlour', '', '', 4, '0.00', '20.00', NULL, 'alive'),
(420, 'Piercing with sparkling earrings', 'P0034', '', 'Service', '2015-11-27', '2015-11-27 21:32:32', '', NULL, 'Parlour', '', '', 4, '0.00', '25.00', NULL, 'alive'),
(421, 'Product knowledge training', 'P0051', '', 'Service', '2015-11-27', '2015-11-27 21:32:32', '', NULL, 'Parlour', '', '', 4, '0.00', '0.00', NULL, 'alive'),
(422, 'strip lash', 'p010', '', 'Service', '2015-11-27', '2015-11-27 21:32:32', '', NULL, 'Parlour', '', '', 4, '0.00', '10.00', NULL, 'alive'),
(423, 'Tinting', 'P0033', '', 'Service', '2015-11-27', '2015-11-27 21:32:32', '', NULL, 'Parlour', '', '', 4, '0.00', '10.00', NULL, 'alive'),
(424, 'Waxing Chin', 'P0022', '', 'Service', '2015-11-27', '2015-11-27 21:32:32', '', NULL, 'Parlour', '', '', 4, '0.00', '15.00', NULL, 'alive'),
(425, 'Waxing-Back', 'P0025', '', 'Service', '2015-11-27', '2015-11-27 21:32:32', '', NULL, 'Parlour', '', '', 4, '0.00', '60.00', NULL, 'alive'),
(426, 'Waxing-Brazilian Bikini', 'P0018', '', 'Service', '2015-11-27', '2015-11-27 21:32:32', '', NULL, 'Parlour', '', '', 4, '0.00', '40.00', NULL, 'alive'),
(427, 'Waxing-Eyebrows', 'P0014', '', 'Service', '2015-11-27', '2015-11-27 21:32:32', '', NULL, 'Parlour', '', '', 4, '0.00', '10.00', NULL, 'alive'),
(428, 'Waxing-Facial Course Hair', 'P0024', '', 'Service', '2015-11-27', '2015-11-27 21:32:32', '', NULL, 'Parlour', '', '', 4, '0.00', '30.00', NULL, 'alive'),
(429, 'Waxing-Facial Fine Hair', 'P0023', '', 'Service', '2015-11-27', '2015-11-27 21:32:32', '', NULL, 'Parlour', '', '', 4, '0.00', '25.00', NULL, 'alive'),
(430, 'Waxing-Full Arm', 'P0016', '', 'Service', '2015-11-27', '2015-11-27 21:32:33', '', NULL, 'Parlour', '', '', 4, '0.00', '50.00', NULL, 'alive'),
(431, 'Waxing-Full Body', 'P0013', '', 'Service', '2015-11-27', '2015-11-27 21:32:33', '', NULL, 'Parlour', '', '', 4, '0.00', '180.00', NULL, 'alive'),
(432, 'Waxing-Full Leg', 'P0015', '', 'Service', '2015-11-27', '2015-11-27 21:32:33', '', NULL, 'Parlour', '', '', 4, '0.00', '60.00', NULL, 'alive'),
(433, 'Waxing-Half Leg', 'P0050', '', 'Service', '2015-11-27', '2015-11-27 21:32:33', '', NULL, 'Parlour', '', '', 4, '0.00', '40.00', NULL, 'alive'),
(434, 'Waxing-Lower Lip Fine Hair', 'P0021', '', 'Service', '2015-11-27', '2015-11-27 21:32:33', '', NULL, 'Parlour', '', '', 4, '0.00', '15.00', NULL, 'alive'),
(435, 'Waxing-Normal Bikini', 'P0017', '', 'Service', '2015-11-27', '2015-11-27 21:32:33', '', NULL, 'Parlour', '', '', 4, '0.00', '25.00', NULL, 'alive'),
(436, 'Waxing-Under Arm', 'P0019', '', 'Service', '2015-11-27', '2015-11-27 21:32:33', '', NULL, 'Parlour', '', '', 4, '0.00', '20.00', NULL, 'alive'),
(437, 'Waxing-Upper Lip', 'P0020', '', 'Service', '2015-11-27', '2016-03-31 02:36:20', '', NULL, 'Parlour', '', '', 4, '0.00', '8.00', 0x32303135313032345f3134313931392e6a7067, 'alive'),
(438, 'African Queen', 'S0034', '', 'Service', '2015-11-27', '2016-03-31 03:31:41', 'xxx', NULL, 'Salon', 'xxx', 'xxx', 4, '0.00', '60.00', 0x636164627572792d646d2d676f6c64656e2d626973637569742d6372756e63682d322e6a7067, 'alive'),
(439, 'Afro Kinkey', 'S0026', '', 'Service', '2015-11-27', '2016-03-31 02:34:41', '', NULL, 'Salon', '', '', 4, '0.00', '45.00', 0x32303135313032345f3134313531392e6a7067, 'alive'),
(440, 'Braids', 'S0042', '', 'Service', '2015-11-27', '2016-03-31 02:26:36', '', NULL, 'Salon', '', '', 4, '0.00', '50.00', 0x32303135313032345f3135343835382e6a7067, 'alive'),
(441, 'Braids', 'S0043', '', 'Service', '2015-11-27', '2015-11-27 21:32:34', '', NULL, 'Salon', '', '', 4, '0.00', '60.00', NULL, 'alive'),
(442, 'Braids', 'S0058', '', 'Service', '2015-11-27', '2015-11-27 21:32:34', '', NULL, 'Salon', '', '', 4, '0.00', '70.00', NULL, 'alive'),
(443, 'Braids - Big', 'S0031', '', 'Service', '2015-11-27', '2015-11-27 21:32:34', '', NULL, 'Salon', '', '', 4, '0.00', '45.00', NULL, 'alive'),
(444, 'Braids - Kids', 'S0048', '', 'Service', '2015-11-27', '2015-11-27 21:32:34', '', NULL, 'Salon', '', '', 4, '0.00', '15.00', NULL, 'alive'),
(445, 'Braids - Medium', 'S0030', '', 'Service', '2015-11-27', '2015-11-27 21:32:34', '', NULL, 'Salon', '', '', 4, '0.00', '60.00', NULL, 'alive'),
(446, 'Braids - Small', 'S0029', '', 'Service', '2015-11-27', '2015-11-27 21:32:34', '', NULL, 'Salon', '', '', 4, '0.00', '100.00', NULL, 'alive'),
(447, 'Braids Afro Twist', 'S0025', '', 'Service', '2015-11-27', '2015-11-27 21:32:34', '', NULL, 'Salon', '', '', 4, '0.00', '45.00', NULL, 'alive'),
(448, 'Coloring with own Dye', 'S0014', '', 'Service', '2015-11-27', '2015-11-27 21:32:34', '', NULL, 'Salon', '', '', 4, '0.00', '15.00', NULL, 'alive'),
(449, 'Coloring without Dye', 'S0015', '', 'Service', '2015-11-27', '2015-11-27 21:32:35', '', NULL, 'Salon', '', '', 4, '0.00', '25.00', NULL, 'alive'),
(450, 'Corn Roll', 'S0032', '', 'Service', '2015-11-27', '2015-11-27 21:32:35', '', NULL, 'Salon', '', '', 4, '0.00', '35.00', NULL, 'alive'),
(451, 'Corn Roll (Kids)', 'S0049', '', 'Service', '2015-11-27', '2015-11-27 21:32:35', '', NULL, 'Salon', '', '', 4, '0.00', '15.00', NULL, 'alive'),
(452, 'Corn Roll Raster', 'S0033', '', 'Service', '2015-11-27', '2015-11-27 21:32:35', '', NULL, 'Salon', '', '', 4, '0.00', '45.00', NULL, 'alive'),
(453, 'Corn-Roll(kids),with extension', 'S0059', '', 'Service', '2015-11-27', '2015-11-27 21:32:35', '', NULL, 'Salon', '', '', 4, '0.00', '15.00', NULL, 'alive'),
(454, 'Custom Service', 'S000014', '', 'Service', '2015-11-27', '2015-11-27 21:32:35', '', NULL, 'Salon', '', '', 4, '0.00', '0.00', NULL, 'alive'),
(455, 'Cutting', 'S0013', '', 'Service', '2015-11-27', '2015-11-27 21:32:35', '', NULL, 'Salon', '', '', 4, '0.00', '25.00', NULL, 'alive'),
(456, 'Cutting & Tonging', 'S0010', '', 'Service', '2015-11-27', '2015-11-27 21:32:35', '', NULL, 'Salon', '', '', 4, '0.00', '40.00', NULL, 'alive'),
(457, 'Cutting, Tonging, Side Bonding', 'S0046', '', 'Service', '2015-11-27', '2015-11-27 21:32:35', '', NULL, 'Salon', '', '', 4, '0.00', '45.00', NULL, 'alive'),
(458, 'Flat Twist', 'S0017', '', 'Service', '2015-11-27', '2015-11-27 21:32:36', '', NULL, 'Salon', '', '', 4, '0.00', '25.00', NULL, 'alive'),
(459, 'Hand Twist', 'S0027', '', 'Service', '2015-11-27', '2015-11-27 21:32:36', '', NULL, 'Salon', '', '', 4, '0.00', '30.00', NULL, 'alive'),
(460, 'Jelly Curls', 'S0061', '', 'Service', '2015-11-27', '2015-11-27 21:32:36', '', NULL, 'Salon', '', '', 4, '0.00', '50.00', NULL, 'alive'),
(461, 'Lace Front', 'S0064', '', 'Service', '2015-11-27', '2015-11-27 21:32:36', '', NULL, 'Salon', '', '', 4, '0.00', '45.00', NULL, 'alive'),
(462, 'lace wig no washing, no cornroll', 'S0086', '', 'Service', '2015-11-27', '2015-11-27 21:32:36', '', NULL, 'Salon', '', '', 4, '0.00', '25.00', NULL, 'alive'),
(463, 'Layers', 'S0024', '', 'Service', '2015-11-27', '2015-11-27 21:32:36', '', NULL, 'Salon', '', '', 4, '0.00', '45.00', NULL, 'alive'),
(464, 'Leisure Curls - Long Hair', 'S0040', '', 'Service', '2015-11-27', '2015-11-27 21:32:36', '', NULL, 'Salon', '', '', 4, '0.00', '100.00', NULL, 'alive'),
(465, 'Leisure Curls - Own + Add-up', 'S0037', '', 'Service', '2015-11-27', '2015-11-27 21:32:36', '', NULL, 'Salon', '', '', 4, '0.00', '50.00', NULL, 'alive'),
(466, 'Leisure Curls - Own Products', 'S0038', '', 'Service', '2015-11-27', '2015-11-27 21:32:36', '', NULL, 'Salon', '', '', 4, '0.00', '50.00', NULL, 'alive'),
(467, 'Leisure Curls - Short Hair', 'S0041', '', 'Service', '2015-11-27', '2015-11-27 21:32:37', '', NULL, 'Salon', '', '', 4, '0.00', '80.00', NULL, 'alive'),
(468, 'Leisure Curls - Touch Up', 'S0039', '', 'Service', '2015-11-27', '2015-11-27 21:32:37', '', NULL, 'Salon', '', '', 4, '0.00', '70.00', NULL, 'alive'),
(469, 'Microstrands', 'S0036', '', 'Service', '2015-11-27', '2015-11-27 21:32:37', '', NULL, 'Salon', '', '', 4, '0.00', '100.00', NULL, 'alive'),
(470, 'Normal Braids', 'S0047', '', 'Service', '2015-11-27', '2015-11-27 21:32:37', '', NULL, 'Salon', '', '', 4, '0.00', '45.00', NULL, 'alive'),
(471, 'Palm Branches', 'S0035', '', 'Service', '2015-11-27', '2015-11-27 21:32:37', '', NULL, 'Salon', '', '', 4, '0.00', '60.00', NULL, 'alive'),
(472, 'Pony', 'S0016', '', 'Service', '2015-11-27', '2015-11-27 21:32:37', '', NULL, 'Salon', '', '', 4, '0.00', '20.00', NULL, 'alive'),
(473, 'Pony (Kids)', 'S0051', '', 'Service', '2015-11-27', '2015-11-27 21:32:37', '', NULL, 'Salon', '', '', 4, '0.00', '15.00', NULL, 'alive'),
(474, 'Private Room', 'S0057', '', 'Service', '2015-11-27', '2015-11-27 21:32:37', '', NULL, 'Salon', '', '', 4, '0.00', '40.00', NULL, 'alive'),
(475, 'Setting', 'S0005', '', 'Service', '2015-11-27', '2015-11-27 21:32:37', '', NULL, 'Salon', '', '', 4, '0.00', '15.00', NULL, 'alive'),
(476, 'Spiral Tonging', 'S0012', '', 'Service', '2015-11-27', '2015-11-27 21:32:38', '', NULL, 'Salon', '', '', 4, '0.00', '20.00', NULL, 'alive'),
(477, 'Tiding', 'S0055', '', 'Service', '2015-11-27', '2015-11-27 21:32:38', '', NULL, 'Salon', '', '', 4, '0.00', '10.00', NULL, 'alive'),
(478, 'Tonging', 'S0004', '', 'Service', '2015-11-27', '2015-11-27 21:32:38', '', NULL, 'Salon', '', '', 4, '0.00', '15.00', NULL, 'alive'),
(479, 'Touch Up & Straightening', 'S0003', '', 'Service', '2015-11-27', '2015-11-27 21:32:38', '', NULL, 'Salon', '', '', 4, '0.00', '30.00', NULL, 'alive'),
(480, 'Touch Up (Kids)', 'S0054', '', 'Service', '2015-11-27', '2015-11-27 21:32:38', '', NULL, 'Salon', '', '', 4, '0.00', '15.00', NULL, 'alive'),
(481, 'Touch Up / Straightening (Kids)', 'S0050', '', 'Service', '2015-11-27', '2015-11-27 21:32:38', '', NULL, 'Salon', '', '', 4, '0.00', '18.00', NULL, 'alive'),
(482, 'Touch up with salon cream and tonging', 'S0060', '', 'Service', '2015-11-27', '2015-11-27 21:32:38', '', NULL, 'Salon', '', '', 4, '0.00', '40.00', NULL, 'alive'),
(483, 'Touchup and Pony Salon Cream', 'S0079', '', 'Service', '2015-11-27', '2015-11-27 21:32:38', '', NULL, 'Salon', '', '', 4, '0.00', '40.00', NULL, 'alive'),
(484, 'Touchup and Pony with Own Cream', 'S0063', '', 'Service', '2015-11-27', '2015-11-27 21:32:38', '', NULL, 'Salon', '', '', 4, '0.00', '30.00', NULL, 'alive'),
(485, 'Touchup and wrapset', 'S0062', '', 'Service', '2015-11-27', '2015-11-27 21:32:39', '', NULL, 'Salon', '', '', 4, '0.00', '20.00', NULL, 'alive'),
(486, 'Touchup Client Cream Cutting and Tonging', 'S0084', '', 'Service', '2015-11-27', '2015-11-27 21:32:39', '', NULL, 'Salon', '', '', 4, '0.00', '45.00', NULL, 'alive'),
(487, 'Touchup Salon Cream Cutting and Tonging', 'S0085', '', 'Service', '2015-11-27', '2015-11-27 21:32:39', '', NULL, 'Salon', '', '', 4, '0.00', '55.00', NULL, 'alive'),
(488, 'Touchup with Client Cream and Setting', 'S0080', '', 'Service', '2015-11-27', '2015-11-27 21:32:39', '', NULL, 'Salon', '', '', 4, '0.00', '35.00', NULL, 'alive'),
(489, 'Touchup with Client Cream and Straighten', 'S0082', '', 'Service', '2015-11-27', '2015-11-27 21:32:39', '', NULL, 'Salon', '', '', 4, '0.00', '35.00', NULL, 'alive'),
(490, 'Touchup with Salon Cream and Setting', 'S0081', '', 'Service', '2015-11-27', '2015-11-27 21:32:39', '', NULL, 'Salon', '', '', 4, '0.00', '35.00', NULL, 'alive'),
(491, 'Touchup with Salon cream and Straighten', 'S0083', '', 'Service', '2015-11-27', '2015-11-27 21:32:39', '', NULL, 'Salon', '', '', 4, '0.00', '40.00', NULL, 'alive'),
(492, 'Tracks Full', 'S0044', '', 'Service', '2015-11-27', '2015-11-27 21:32:39', '', NULL, 'Salon', '', '', 4, '0.00', '35.00', NULL, 'alive'),
(493, 'Tracks Half', 'S00014', '', 'Service', '2015-11-27', '2015-11-27 21:32:39', '', NULL, 'Salon', '', '', 4, '0.00', '30.00', NULL, 'alive'),
(494, 'Treatment & Setting', 'S0006', '', 'Service', '2015-11-27', '2015-11-27 21:32:40', '', NULL, 'Salon', '', '', 4, '0.00', '30.00', NULL, 'alive'),
(495, 'Treatment & Tonging', 'S0008', '', 'Service', '2015-11-27', '2015-11-27 21:32:40', '', NULL, 'Salon', '', '', 4, '0.00', '35.00', NULL, 'alive'),
(496, 'Treatment and Setting', 'S0045', '', 'Service', '2015-11-27', '2015-11-27 21:32:40', '', NULL, 'Salon', '', '', 4, '0.00', '25.00', NULL, 'alive'),
(497, 'Treatment and Tonging', 'S0070', '', 'Service', '2015-11-27', '2015-11-27 21:32:40', '', NULL, 'Salon', '', '', 4, '0.00', '30.00', NULL, 'alive'),
(498, 'Trimming & Tonging', 'S0011', '', 'Service', '2015-11-27', '2015-11-27 21:32:40', '', NULL, 'Salon', '', '', 4, '0.00', '25.00', NULL, 'alive'),
(499, 'Washing & Blowing Drying', 'S0053', '', 'Service', '2015-11-27', '2015-11-27 21:32:40', '', NULL, 'Salon', '', '', 4, '0.00', '15.00', NULL, 'alive'),
(500, 'Washing & Tonging', 'S0009', '', 'Service', '2015-11-27', '2015-11-27 21:32:40', '', NULL, 'Salon', '', '', 4, '0.00', '20.00', NULL, 'alive'),
(501, 'Washing (Comb Stretching)', 'S0052', '', 'Service', '2015-11-27', '2015-11-27 21:32:40', '', NULL, 'Salon', '', '', 4, '0.00', '25.00', NULL, 'alive'),
(502, 'Water Curls', 'S0028', '', 'Service', '2015-11-27', '2015-11-27 21:32:40', '', NULL, 'Salon', '', '', 4, '0.00', '40.00', NULL, 'alive'),
(503, 'Weave-On Long', 'S0019', '', 'Service', '2015-11-27', '2015-11-27 21:32:41', '', NULL, 'Salon', '', '', 4, '0.00', '40.00', NULL, 'alive'),
(504, 'Weave-On Short', 'S0020', '', 'Service', '2015-11-27', '2015-11-27 21:32:41', '', NULL, 'Salon', '', '', 4, '0.00', '50.00', NULL, 'alive'),
(505, 'Weave-On Washing with Tonging', 'S0018', '', 'Service', '2015-11-27', '2015-11-27 21:32:41', '', NULL, 'Salon', '', '', 4, '0.00', '20.00', NULL, 'alive'),
(506, 'Weave-On with all Round Secret', 'S0021', '', 'Service', '2015-11-27', '2015-11-27 21:32:41', '', NULL, 'Salon', '', '', 4, '0.00', '50.00', NULL, 'alive'),
(507, 'Weave-On with Half Secrets', 'S0022', '', 'Service', '2015-11-27', '2015-11-27 21:32:41', '', NULL, 'Salon', '', '', 4, '0.00', '40.00', NULL, 'alive'),
(508, 'Weave-on with small Secrets', 'S0023', '', 'Service', '2015-11-27', '2015-11-27 21:32:41', '', NULL, 'Salon', '', '', 4, '0.00', '40.00', NULL, 'alive'),
(509, 'Wig Cup Long', 'S00012', '', 'Service', '2015-11-27', '2015-11-27 21:32:41', '', NULL, 'Salon', '', '', 4, '0.00', '50.00', NULL, 'alive'),
(510, 'Wig cup short', 'S00013', '', 'Service', '2015-11-27', '2015-11-27 21:32:41', '', NULL, 'Salon', '', '', 4, '0.00', '60.00', NULL, 'alive'),
(511, 'Wrap set', 'S0056', '', 'Service', '2015-11-27', '2015-11-27 21:32:42', '', NULL, 'Salon', '', '', 4, '0.00', '15.00', NULL, 'alive'),
(512, 'Gear', '234345', 'sal2345', 'Sale', '2016-03-31', '2016-03-31 04:43:28', 'asdsfa2342', NULL, '', 'adsfadf', '', 4, '30.00', '40.00', 0xffd8ffe000104a46494600010100000100010000ffdb0084000906071012121414121414141514181819181717161919181a1e1c171c191c161c15192828201d1e251c181822322225292b2e2e30181f3339332c37282d2e2d010a0a0a0e0d0e1b10101b3225202635343832373437373435382e2f32342c2c2c2f362c342f32352c2e2c2c322c34342c352c342c2c2c2c2c2c2c2c2c2c2c2c2cffc0001108007c00c903011100021101031101ffc4001c0001000301010101010000000000000000000506070402030108ffc4004510000103010405070b02030705010000000100020311040512210607315191143441526171921317225372738193b1b2d132a142c2e12333356282b3c1244344f0f116ffc4001b01010003010101010000000000000000000003040506020107ffc4003811000201020304060a03000105000000000001020304051151121321911431344171b1153233526181a1c1d1f00622e1422324437282ffda000c03010002110311003f00da100401004010040100401004010040100401004010040100401004010040100401019e69ae96db2cd6a7450b981818c39b0135233cd53ad5a709e48ea70ac2adae6d954a89e79bef20bce05e3d78fe5851749a868fa06cb47cc79c0bc7af1fcb09d26a0f40d968f98f38178f5e3f9613a4d41e81b2d1f31e702f1ebc7f2c2749a83d0365a3e63ce05e3d78fe584e93507a06cb47cc79c0bc7af1fcb09d26a0f40d968f98f38178f5e3f9613a4d41e81b2d1f31e702f1ebc7f2c2749a83d0365a3e63ce05e3d78fe584e93507a06cb47cc79c0bc7af1fcb09d26a0f40d968f98f38178f5e3f9613a4d41e81b2d1f31e702f1ebc7f2c2749a83d0365a3e63ce05e3d78fe584e93507a06cb47cc79c0bc7af1fcb09d26a0f40d968f98f38178f5e3f9613a4d41e81b2d1f31e702f1ebc7f2c2749a83d0365a3e63ce05e3d78fe584e93507a06cb47cc79c0bc7af1fcb09d26a0f40d968f98f38178f5e3f9613a4d41e81b2d1f31e702f1ebc7f2c2749a83d0365a3e63ce05e3d78fe584e93507a06cb47cc9bd0dd2eb65a6d6c8a5730b1c1e480c00e4d2467de14946bce534999f8a6136d6f6d2a94d3cd65dff1345574e5420080c7f599cfddeee3fa159d73ed0eeb00ec4bc595655cd9080200802008020080200802008020080200802008020080202cdab9e7f17b327d854f6ded11918ef6297cbcd1b1ad23830802031fd6673f77bb8fe85675cfb43bac03b12f1655957364203d31849000249d800a93d800da81b4966cb9dc3abab4cc03a73e41a7a29593c3b1bf1e0acc2da4f8cb8183778fd1a4f6692da7f4ff004baddfa0377c4338cca77ca7157fd39378056636f05dc6056c6ef2a3e12d9f0e1fefd4ee97452c0e143668be0d00f10bdee61a15e389ddc5e6aa3e655348b56ccc2e7d9090e02be49c6ad3d8d71cc1efa8ee55ea5aaeb89b365fc8659a8dc2e1aafbafc19a3d85a487020834208a107710a91d5a69acd751e50fa100400a008020080200802008020080b36ae79fc5ecc9f6153db7b446463bd8a5f2f346c6b48e0c20080c7f599cfddeee3fa159d73ed0eeb00ec4bc595655cd93bee5ba26b54a2285b52769fe168eb12bdc20e6f2457babaa76d4dd4a8ffdf82362d17d13b3d8db568c729fd523b6f7347f085a34e8c61e270d7f8a56bb793e11d3f3ab2c2a533420080fc4063dad2b008ed81ed14133038fb4096bbf6c3c4aceb98e53cf53b8c02bba96bb2ffe2f2f975afb94f55cdb08020352d5bd82c4fb1973db1be42e78971d0902a708cf60c343f12af5bc60e1c4e431caf751baca2da8f0cb2fafcf333bbed9136d13084d620f76023653b0ee54e796d3cba8ea2d5d47420eafad971f138579272cfa17a2adb7794c523a311d3f48049ad77ec53d1a5bccf89938a6272b2d9d98e79915a497736cd6a961692e6c65a01752a6ac6bb3a65b5ca3a91d99b8972c6e1dc5bc2ac964dfe5a235782d0404f68768fb6dd33a373cc61ac2fa80093e9014cfbd4b469edbc8cec4ef9d9d25351cf3791f3d2fb99963b49858e7380635d5752b535aec032c92ac1425923d61b772baa1bd9249e6d70f810aa22f966d5cf3f8bd993ec2a7b6f688c8c77b14be5e68d8d691c18401018feb339fbbddc7f42b3ae7da1dd601d8978b2aec6924002a49000de4e402ae6cb692cd9ba68868f32c50068ce4750c8ede77770d838f4ad4a54d42391f9e6257d2bbabb5ff0015d4be1f964ea94cf3cbdc00a92001b49d887d49b79228ba4bac58a3ab2cb495fd73fdd8eeeb7c32ed556a5ca5c23c4e86c700a9532957feab4eff00f0cfadda456c99d89f3c95dcd71601dc1b454e55672eb674d4ac2da92ca305f3e3e6691ab1bf25b445247338bdd111471da5a46c3be841cfb42bb6d51c934ce571eb2a742a4674d64a5ddf1456f5b9690eb544c1fc1154ff00adc72e0c1c54374ffb246aff001ca6d5bca7abf25fe950bb228df346d95c5ac73dad7386d009a57355e29369336ebca70a5294166d2e0692eb268fd94e07989ef1b7162948efa5437bb25732a10e0ce5155c62e56dc734be1947f19fd4f1a4ba176496ce6d16201a433180c3564800ad00e834d94f8a54a1171da81eac717b8a75d51b9e3c72e3d69919abed14b25ae17cb3b5ce21e5b40f2d14c20e78687a77af16f46338e6cb78ce27716b5553a4f2e19f567aea455c5a2dcaed7346d77938a273b11daea622035b5e9cb6951c296dcdaee45dbbc4fa2db426d672925e5c732e925d97158cf9394425fd2253e51fde46787800ac3851870660c6e315bbfef4f6b2f8705fefd4fcd02b44125a2da6cec6b22ab03034610400462a769a94a0e2e52d9ea18bd3ab0a145566dcb8e79f97c887d66720a3f060e57e5198ff00562a61e1b30a8ee777c72eb2f605d2f38ed67bac9e5d5975f3d4e8b8742ec9059c5a2dfb708716b9c43180ec0437f53b30299e66802f54e84631da9915de2f715abee2d3e9d6f5ebea5f63b3ff00cb5d56f89ceb2518e1962662143b9d1bba3e0bd6ea95459c483d2588595451b8e2be3a7c1a21b55f667456e9e378a3991b9a476891a1476cb2a8d32fe3f52352ce138f536bc991dad1e7eef751ff0032f173eb96b00ec4bc5fd8a92ae6c966d5cf3f8bd993ec2a7b6f688c8c77b14be5e68d8d691c18401018feb339fbbddc7f42b3ae7da1dd601d8978b212e2b4323b4c0f93f4324639dd803867f0dbf05141a524d9a3774e55284e10eb699fd04c7820104107304660f6d56b1f9ab4d3c991f7ddf767b2331ccf0ddcddae71dcd6f4af13a9182cd966d6ceadccf669acfc978991694697da2d84b6be4e1e88c1dbdaf3d27b362cfab5a53f03b5b0c2a8da2cfae7afe3f732b8a135020353d58d9859ec735a65f41af25c09ea307eaf89c5c06f57ad96cc1c99c7e3d537f750a14f8b5c3e6fbbc8cf2ffbccda6d124c7f8ce4373464d1c02a939ed49b3a7b3b656f463497779f79f6d19b8df6c9c44d38452af7755bddd24ec1fd17da74dce591e2fef636945d49717dcb566816ad0fb96cc1a2d0fc24ec2f9cb49ee6823e8adba1463eb799cd53c5b13b86dd159f8473fc964baecf676d8f0594874381f8087170ccbabe91a93e912a68a8a8651ea32abd4ad2badaaeb2966b3e1969dde057753fccdfef4fd8d50da7a86a7f25ed4bc3eece7d5bf3bb7fb7fcef5f2dfd7912637d9a8787d914fd3fff0010b4fb4cff00698abd7f68cdcc1fb153f9f9b2d3a9effc8ff47fca9ed3bcc7fe4bff008fe6425ff087df4e69d8e9a207c11a866b3acd7c4d0b39b8614a4bdd979b34ad298ac4f8432d8f6b232e14abcb0123302a29c3b15daaa0e394fa8e530f95cc6aed5b2ce59699f0222e2b55cb63c5e42d11371d315662ed95a7ea269b54707461eabfa976ee96277596f69b79757f5cbc8e2d1a9e292f8b5be1735ec7c208734d413fd903423b415e69b4eb36bf7a8b17d0a94f0ba50a8b26a5dfff00d645635a3cfddeea3fe650dcfae6be01d8978bfb15255cd92cdab9e7f17b327d854f6ded11918ef6297cbcd1b1ad23830802031fd6673f77bb8fe85675cfb43bac03b12f165595736495b0e91db616608a7918ddd9103bb1034f8291559c5649952ae1f6d565b53826ff00743d5d962b45e1696b0b9cf7bbf53de49c2de93fd3a4a4632a92c8f35eb51b1a0e596497525decd52c5a0977c6cc261121e973c92e3da33a37e1457a36f4d2ea38eab8d5e4e5b4a797c17ef1f9992e90c104769959673589aea373af78a9db43515542a24a4d47a8ed2ca75674232abeb35c4eed11d1b7db65cead8586b23fa29b7003bc8e1b57aa549cdfc08312c423694f59bea5f7f0f32634f34a18f02c96520411d038b7638b72c03fca2833e92a4af553fe91ea28e1186ca0fa4d7f5df57c33eff17f4290ab1be5db5536f8e3b4be37900ccd0184f4969270f03fb2b36b24a593ef303f90d09d4a119c7aa2f8fcfbc97d3fd0fb55a2d0268009039ad696970696d2bb3150533af1dea4af465296d22960f8ad0a1477557864dbcf2cf3cfc3bcb15d10721bb8367731a6363f11afa3525ce001e9db453416ee9ff632ee67d36f9ca926f36b2fa22235403fe8dfef4fd8d51da7a85efe48f3ba8f87dd9cfab7e776ff006ff9debe5bfaf224c6fb350f0fb229fa7ffe2169f699fed3157afed19b983f62a7f3f3659354168687da195f4886b80de0541a7765c54d68f8b4657f2483d9a73eee270e9ddd76982dafb6067f64648dcd78737686b4612dad466d3d145e2b42519b9f716308b9a15ad15b67fdb269af9be3a77974be6c91deb6106170aba8f613d0e1b5aeddd20ee5666955870306d6acf0cbc6aa2eae0fc355e650ac5abbbc1eea3dac89a0e6e2f6bbe2036a4fc68aaab69b7c4e92ae3d6718e716e4f4cb2e79fdb324f57f65365bce6b3c87d211b9a0f43bd263853bdbe9715ee82d8aae2ca98cd4e9387c2b43ab34fc3ad7d1f03c6b46e5b419cda432b0e0634b811e89048cc56bd233a2f973096d6d771f700bca3b9541bfed9be1a942554e8cb36ae79fc5ecc9f6153db7b446463bd8a5f2f346c6b48e0c20080c7f599cfddeee3fa159d73ed0eeb00ec4bc595655cd9080d4354362688a69b22e73fc9f706b43bf72efd82bd691e0d9c8ff0024acdd4853ee4b3e6f2fb1f1d61e98b9a5d65b39a1194b20dbec377769f82f9715bfe3124c1709524ae2b2ff00d57ddfd8addc5a265edf2f6b7727b337325d939e3735bb7e3c1434e8e6b397046a5de28a32dd5badba8f4ea5e3fbe27d74874b03a3166b1b7c8599a29964e7f7f481fb9e95f6a56cd6cc3823cd9e17b33dfdcbdaa8f92fdfa7715455cd8080fd6b8820834233046d0474d50349ac9963b3e9d5e4c6e1f2d8b7173185c3e34cfe35532b8a896599973c16ca72dad8cbc1bfde4455e97cda6d26b3cae929b01a003b9ada01c17894e52eb65ca1694282ff00a514bf757c4fb5d5a496cb334b2094c6d271118237674a56ae693d01235271594591dc61f6d712daab0cdf8bfb3479bbb482d7039ef8652c74a6af3818711a93b1cd20664eca246a4a2f34cf55ac6deb4631a91cd47ab8bfb3f3392df6d92691d2caec6f7d313a8056800193401b00e85e6527279b26a3461460a9d35925fbde78b2da6489c1f1b9cc737639a684226d3cd1f6a538548b8cd66894bcf4a2d9688fc94f2e36541cd8c06a3666d017b9559c964d952861b6d42a6f294727e2feece7ba6fcb5594ff00612b995da322d3ded7023e2be46a4a3eab24b8b2a171ed639fefc092b5e9c5e320a19b08ff00231ad3e2a547c085edd7a8fbcab4f06b283cf633f16dff00840b6d3207f940f763ad71d4e2aefc5b5459bcf3345d3838ec64b2d3b897b6e96dba685d0cb287b1d4ad58d0ec8823d2681d20291d69b593652a585dad2aaaad38e4d7c5fdc83511a059b573cfe2f664fb0a9edbda23231dec52f979a3635a47061004063facce7eef771fd0aceb9f68775807625e2cab2ae6c8405874474aa4b0b9d46e38df42e6d686a3f881df4cbff8a6a555d333312c3217b159bca4ba9fd99d32e93591923a582c4df2ae7176399e640d71352e0cd9b7b97d75609e6a3c48a3875c4a0a9d5acf6570ca2b2e0b5641deb7bda2d2ec53c85e7a06c68ec0d190514a7293e2cd0b7b5a36f1d9a51cbf7bd9c2bc96020080edba2ed7da24f26c2d0685d57569414dddea0b9b88d086dcba882e2e23421b72ea2619a156a25c2b18036124fa5dc00c8769e0a8bc5e8249e4ff0005278bd049707f83cd93436d4fae2c11d0d3335af6803a3bd7aa98b508e5966cfb5315a11f573644c975cc263006e2901a506cd95ad77533aab91b9a6e96f73ca25c5714dd2dee7944987684dab0d6b11775711fad295ffdaaa2b18a1b5964f2d4a4b17a1b5964f2d48eba6e396791f18218e60f4b1572ce94c95ab8bc851829be29e859b8bc851829f5a7a1211e85da897671800900927d2a748001cbbd5678bd0497595de2d4125d642f2097ca9843499012dc233cc76eeed57f7f0ddef5bfea5edf4377bc6ffa92d2e87db1ac2fa46682b8438977d29fbaa51c56da52d9e3e397029c715b794b678f8e5c3f3f438a5b8e76c02d070f93384feaf4bd2341953791d2ac46f694ab6e567b5c7e84f1bca52adb959ed71f0e07ab3dc333e074e30606871dbe91c3b68d1ddd257c9ded2856545e79be5c4f93bda70aaa8bcf37cb8914ad96c202cdab9e7f17b327d854f6ded11918ef6297cbcd1b1ad23830802031fd6673f77bb8fe85675cfb43bac03b12f1655957364200802008020080202d9abb86b2c8eeab00e27fa2c6c6a59538c75663e333ca9c63f1256e1b6c92db6d357b8b19935b5f44674c86ce83c553bca30a56b4f25c594eee9429dad3c97167edcd6b965b7da2af718e318436be88cc0069b2b91cfb52e69429d9d3e1c5f7f78b9a50a7674f8717de7dee489aeb5dae5e90e6b01dc03457e9fb28eea4e36d4a9f7659fd48eea4e36f4a9f7659fd4e0d16b6cd35aed0e739c5a2a30d4e11e951b41d1903c558c428d3a56d4e2971ff0038962fe953a56d08a5c7fce276dc2d06d96d78d989adf8819feea0bb6d5b518bd1b20bb6d5b518bd1b39b456df2cd6ab4973dc58320d27d11e91028360c829710a34e95bd3492cff00c26bfa30a56f4d24b3ff000e9d1d89867b64b957ca9683b80daa2bd94951a54fe19fcc86f25254a953eecbea729bfac966f28e6caf9e490d69991d82b93400a6e857171b3171508afdf126e85715f662e2a297ef89e2ea71b45db2b36b8794a0edc58da389fd97db84a85f465ddc3f0cfb70950be8cbbb87e19fb6e3c8eee119fef241869b8bb37701ff00094974abe735eaafb75736297fdd5f39af557dbab9b288ba13a0080b36ae79fc5ecc9f6153db7b446463bd8a5f2f346c6b48e0c20080c7f599cfddeee3fa159d73ed0eeb00ec4bc595655cd9080200802008020080b1e8b5fd0d959207b64739e4105a1a4500de5c0edaacbc42caa5cca2e2d64b5cff000cccbfb2a97128b8b592d73fb2679d1cd206598cae7b1cf7486b569196d276f695eaf6c6571b2a324923d5ed8cabeca8b4923de8fe90c56774cf7b1ee74aea8c3872152686a46f5e6f2c275e308c5a4a28f379633ad18462d25147cee4d24304d2bdcd2e64ae24814c433c88ae472c97abac3f7d4a314f2713d5d61fbea518a79389df3696411b5e2cb01639e492e7068ccf4d1a4d7f655e386559c96fe79a5a67d5c915a386559c96fe79a5a67d5f348e5b8348e3b3c5235ed91f248e2e2e186998a0ad483b54b7987cebd48b8b4a289aeec275e717169247cb45efe8eca24c6d7b9cfa66da746fa91d2bddfd94ee5c765a496a7bbfb29dc38ecb4923f747b49393be42f6973247171c34c40f6572297987efe31d979347cbcb0dfc63b2f268eeb5de5669a29b9358df8dcd20bc46c05b8b69f44939aaf4edeb52a90dfd5592eecdf778e457a742b52a90df55592eecdf778e44868359a48a291d282c6b8d462c8e43371076055b16a90ab52318717f02be2b52156a4630e2fe056349ef7e533123fbb664c1f577c56b585af47a593eb7d7f8356c6d7714f27d6faff043aba5d080b36ae79fc5ecc9f6153db7b446463bd8a5f2f346c6b48e0c20080c7f599cfddeee3fa159d73ed0eeb00ec4bc595655cd90802008020080200802008020080200802008095b92fd96cb8b00690eccd7f2a9dd5942e32da6f8152eaca17196d37c0f57c6915a2d030b886b3aadc81ef3d3dcbe5b5851a0f6a3c5eacf36d614a83cd717ab2215d2e84010166d5cf3f8bd993ec2a7b6f688c8c77b14be5e68d8d691c18401018f6b35c05bdd53ff006e3fa159d73ed0eef004dd92f1655718de38aae6d6cbd0631bc7141b2f418c6f1c506cbd0631bc7141b2f418c6f1c506cbd0631bc7141b2f418c6f1c506cbd0631bc7141b2f418c6f1c506cbd0631bc7141b2f418c6f1c506cbd0631bc7141b2f418c6f1c506cbd0631bc7141b2f418c6f1c506cbd0631bc7141b2f418c6f1c506cbd0631bc7141b2f418c6f1c506cbd0631bc7141b2f418c6f1c506cbd0b3eaddc0de11663f4c9f6153db7b4463e3a9f4197cbcd1b22d2382080203e5259a371ab98c27796827895f1a47b8d49c5649b5f33cf2287d5c7e06fe1365687ddf54f79f3639143eae3f037f09b2b41bea9ef3e6c72287d5c7e06fe13656837d53de7cd8e450fab8fc0dfc26cad06faa7bcf9b1c8a1f571f81bf84d95a0df54f79f3639143eae3f037f09b2b41bea9ef3e6c72287d5c7e06fe13656837d53de7cd8e450fab8fc0dfc26cad06faa7bcf9b1c8a1f571f81bf84d95a0df54f79f3639143eae3f037f09b2b41bea9ef3e6c72287d5c7e06fe13656837d53de7cd8e450fab8fc0dfc26cad06faa7bcf9b1c8a1f571f81bf84d95a0df54f79f3639143eae3f037f09b2b41bea9ef3e6c72287d5c7e06fe13656837d53de7cd8e450fab8fc0dfc26cad06faa7bcf9b1c8a1f571f81bf84d95a0df54f79f3639143eae3f037f09b2b41bea9ef3e6c72287d5c7e06fe13656837d53de7cd8e450fab8fc0dfc26cad06faa7bcf9b1c8a1f571f81bf84d95a0df54f79f367a8ecb1b4d5ac603bc3403c422491f1d59c964dbe67d57d3c040100401004010040100401004010040100401004010040100401004010040100407fffd9, 'alive');
INSERT INTO `items` (`id`, `item`, `serialno`, `supply_invoiceno`, `transaction_mode`, `date_added`, `last_modified_date`, `modelno`, `item_item`, `item_type`, `description`, `brand`, `supplier_id`, `cost_price`, `selling_price`, `item_photo`, `delete_status`) VALUES
(513, 'Large image', '123123', '500', 'Sale', '2016-03-31', '2016-03-31 14:22:03', 'large234', NULL, 'Test item', 'Test item', 'Test item', 1, '10.00', '15.00', 0xffd8ffe000104a46494600010101012c012c0000ffdb00430006040506050406060506070706080a100a0a09090a140e0f0c1017141818171416161a1d251f1a1b231c1616202c20232627292a29191f2d302d283025282928ffdb0043010707070a080a130a0a13281a161a2828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828ffc200110803c9051403012200021101031101ffc4001c0001000105010100000000000000000000000602030405070108ffc4001a010100030101010000000000000000000000010203040506ffda000c03010002100310000001ea800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003cf40000000000000000000000000000000001e1eb4fa75e60e79a99d3ac62708c2b6bf41e57ce44fd194fcea3e8eabe70cc47d06e35bf8cba3343beae20800000a740990a0f833a746735c94f4142fd566687e5a24ac0cf8a000000000000000000000000000000000000000000000000000000000002831b228be00000000000000000000000000000014c0969dc4796e1dfb2611caf68eb8da6d971bc0aae838d130edd69fa0452178f338ba3655c994b45ac4c3c9880ea3aac12f4d16eb7916b56692ce27e4e1f48389f4ba71c851fe6274e824297eccbc4d86d9d1194ef2ab3ce9d2630476e4ca470e534759b49e57b4996a26b9b38e3bad9e7fa41c47a7d78f7e23179edb31b2addf0000000000000000000000000000000000000000000000000016c29ac7aa8000000000000000000000000000536209379c42e0b55baaee8f6f2c75c5e419b465d82bade8af26f33b17bd3386ecf6b069cfa173ae8b1a4c86ec425f120944a5ba498f35d45d573b1737769e5b63aa6a34409bfd45abb893e1efb2b3c2b6011e90ea51ad9442a6d31e28c08b6c9acce2f6ab6839fea3abe8b5ad7d3be7adedb8bb4f9859b4e0f7df2b0000000000000000000000000001479e9e5ca292e7b67d2ea9a800000000000000016cf7caa90aa93daad5d3d0000000000000000000000000341a880dba32e35912b9f4f47b6dbebf2e88b4e61b358a5fb37f36230327df00400874c71d1a7dff003a9f4c4333e55194496be73924fb5513a4cacbdae86637fb8d76c2b704a2f282398eee4506b53a4fb199356e09636541263599fa6c8de9629bf62c7be0deca79cfb49eb1e4326395bc87cf306728a755e5d469cbd8ee62e4d387d0000000000000000000000000280560a6a0a6a16ea525c53500000000000002d87be1e5ca69155374f3d000000000000000000000000787bcf31a296ebf28bd2a8f4e8cbf72f3d31f4f23d6308dccf4bba022f7f070b453949f2b9cd0b74941b68992ac5f8b69633d063935df5de792837566ed516b4d542af593c4adb5aec6bd5d52dc6ca3127a4c872f132f1ba2127814d2ccff0049a7989fbcf6ba0f481ca747b19a6fad5ca22fcda5518e8b7a42b49d523f3119da66e55b3d8eda01bfa4e5c1ba368d7c5eb5f37f66d3865429c60000000000000000000000280561e515545b5c05158a6a16eaf056000000000016c795079efa5152a3d000000000000000000000000053c9726057eebf9b9bb98eca73a09bdcb79665e3e7b16837f1e9c6bd8606c235f2de76ac844eb51be5546b238d24da692e4279b4ab67059a74515d3063533f51ceb166d00d69e17b559ca944973b46e417595a295c8e0aa740c2825c3d9457b74a073cd1956ea0f38022da0d74a20134e91e79ec5e37bdb99135f23b21d633d3cae2b295bdd4eeac14d7e23484e1ce39a6d9fd155c36655f1c15000000000000000000000a1ed25ca6a05350053553e1578f4a3d56000000000016fca87be5170f28aea1e800000000000000000000000034db6e273b47f71a693dbd7dfe561e6e1bea22b3daa73d0cbf984ad8ca22bbd8c233e4ba7dd2a87caf9e9beddea36f1b5b884c79f4c48a43819f13850f90eae6b31f08bb17279dda30ace64db5ac7e5d90cadef98daa89df231ecc499a3da44d57886347249ac9afb7f43aa98aba27329a9b87bafadf379d6c3a26dcb00dd743bf6e1e7763a65558e3b67b2e82378a6e62db2af6ed853501099b6a6d1a0edbf387d03a79b9c2bc80000000000000000000014f81582857e0a3d1e5c051ed40000000000b23cac2ba692aa6e07a000000000000000000000000031481f35c8f75f5b6144baac3b2172ac38fb2e9d662f2d8a6ae09d2a269926368256a636de2d2011c91a3581ef6ad74d70b3b67ba3df08bc376916e8334bc5a8bc6b5bb394695a6bf6374b6d62b5f50db8e032495dfb79fa5af78a56191aeb08d786caa6dcaddd2ff00225bfcfab3bcb77a261da0ea11cb535b4ea7b6edc95e4ae3cb7bed79e9e7b6eb14d5516390767b53af2edf42a415f5b6af7ca5c0e5bbfd3e1f4e3d3e67f3e5eaf3fd14804fe9c20a8000000000000000002ddc16ee5bf4ac14d54562856000000000014d35783df282ba2e7a7a000000000000000000000000001069cf1d9da23288bf419f66e9ee3d37eedcf5cf05ae6d109c6678b0e9ea39af47896d2621fd161bb28bc8845c001a7dc4166be4ef4fb8022c310d46bb59d9ba38722f7994f2de99e8000f3d1cba05f46f25bf6c56e6e64f9f6c36dc9617674699dacbd3c3abcafccad5d3e50574dcf4f4006bf88f7ee756e9c9b91296e5ea3cf7511305e9d03e81a57490599e911a39ae4422f4fa12f710ed15f32f88c80000000000000000016ee0b772d8f7da6e0000000000000b574514fb58f400000000000000000000000000035bc0ba5f33d3d06d326f53b771b2e793ccefb22dc56e233bf444af4ab9e5abb9cad4ef61b480749d427233b9ccc4dabdf22c558c60c56c4d269b211701059973bd2bd1a634646be0dea8cac000000b57470696c9394dbd597eaedef2627b9b8998f2162ff94bd1ed3707a0000c6c91f3df498f64cfb3bb196ad56740a6b4f40c6d81e60b5698848f75cf76cfe8df6073ca7900a80000000000000000029a80000000000000000000000000000000000000000d4a76ce670cb74770d5f13c99dbaae173fbad69d66d312dacaf611a91e1d9a1c09ac09cfd2631b28d4463674836a8452571d898fecfdc0b567cf15d35f0ee829ac1a40d3a36d1ccd90a35f20ae88b82408d51af986fc932cbc5cd79214b80000000e15dd79fdba39af4ee57d674de5b958d939f9da9e795e83bf8a753a8cdae5e8960c37000020f0fe91c92de8f437b8d8f6c533e3dd16695c42596226075f41d6cc6af170e6f2e6bdef80746d793a20a79e000000000000000000000000000000000000000000000000000000000a7de3f3a6d79f5f97dbd68e6eb6ccbaaddc2b755e5631ef64ab1990e6273a22530d1b3c1f3066eac326117d34a7d09b3be32e2dd139f43a0b172a2e00007b551e9e2ba0039c74de55d67a7cf91e5e2e553cf0ad96aec12f4f3379cf4deae593fb0e98f275056e034bbaf13f39750e7b2dd7bfa465e16653cce298dbcd1fabe6ec33b43b3adbb10f2bd3000035fc2fbdf02b7774fd2ee31f1f422536e75d0a69588bd716bba19cf632eb37a2f10d44d79c6f4fa41a7dc53c6040000000000000000000000000000000000000000000000000000000105e61b3cfbfafb6be61e8025eafa2ddebd5317be1401afd85a39df4ae5fd2a6977df117f7c045257ab462efb9d7459808b00001ed547a78ae8398f54e6d3be9e19be4e364d3cd0ad9c9bacf2be9e78f4b624eee3daf5ae21d7797a37038bb000386d79119d7d4eff0097a8d94791a1e61dd62fb63cca597277a6794387b40000d5712eb3cc2de8ceeed9bd8f7c57553fd44e7a5d5cab60889cc323c8b574f9594f2fea1cff00489e4ef947579f242310000000000000000000000000000000000000000000000000000006b765045f954ae3bb19f6a555422419edb7f59917a6f8c06ad1b4446448cc3d4f9ef9e9ce661a6f6d4968adcf6d17626d0cd36736c4cb58c5824a5f870ad869597ee39e49e93bcf62da4aba279cdf3d13aaa3bbe8b4373f2627be1dd72b0b363c60add0d99516a70d6fb43eb79aec9ce7abf1750727580071a8cef33afececfa0f06edb7f3371ee2e5658044800002939b4073ef5bd79a64462518ede04800015c1e6b14bd68ecdc53b5dfcc0af30000000000000000000000000000000000000000000000000000045a013b75ae610df2fd7b996c6a4b97a7851c995fad6273284ef986ec8f45ace86e4eed4d047ba35a8b4725106c944c3d7917c18174b8b4d36789a1ce959d5caf704465b92ad96aec4a5a394d123bc441b48fca790dde44338cf95e45516b7addb083e0747d64d6dc2f270748ebd26e45d5afe3e58cea079abdaa628ac8900053546d3c7a730b9b3e83454c822534ed17b97f4ad3c0ce636466f44480021122e313d39921ab654f6b9ef45804ae39f6822e000021d31845e327b371eec37f2c2bcc00000000000000000000000000000000000000000000000000d5a72b946935da7a177ddfc8abdd1db125c2a6b1a9a73de8734af32dd19c4324b09e93395ae7b25c52479645c0a6073ec5469e47cda7f319222def80000d2ee8018300e93cb35aee24d19e8148f056e0014426758736e67d879de0f471f79bfa9d853c9bc2b6000000729e83c3edd720de519197b57b0b69622908d9ee621ae5d92ff00099ce9e4742bb1fd94736c183ac899169a11168ecaa47567d3d8f72fcf6948cd3b48c4e73a11700001cefa0f2dd2b3ee9f13964f901190000000000000000000062c4569c2192d2f0540000000000000000000000005b30f87e76974f4ab98d79797a214d6edaf6fab1592d19f34b91992f3961b797ebf61130bdd68e4135db1158b4afce71b1989b3172a2d1cd74cf9dcd3a2b0b362e0000000398f46e63a565f2782ceab228acd7ec275335e99e739951bcf3df62dad81f47e7b7b6775ee3f46de7f6ebfa2d947999ac6ae93796fd89ad6edcc6458c6e576d313618324a7bacfb5919dfcf7c33a203d079bcd6538b20a5bc42c4ce9b21d9329a91a9d964dfa4d9be33045ae71d379bcd3a4796aec5c0000d141f6f9bbe5d8324a78c0000000000000000000309c5e76a33f61218f563daf98c68eaf7b9bf4878e0a00000000000000000000000e733be016e9b331d2cbe3d80cb77aad0b6191978d98c35311dba72957845e309040669d1a25b5db45b5ba398422636922d3ee627cd16f7c21735e77379ae688b80000047e1520c2d33c3e81a4d75eb3a8fc834986ba49b4127731851c987b13e7be7a9c381efbd9a6df5324c574c0e73e6934e6e919dc61a79dda3ce4544e7d8233ceb2ebd167376b9597a7e64d77a92f06607bccba6f339a74cf08b80000001ef3ee81019a4cf2f0b362cf7cd19bda79aad5e98e75b689bd13e8912d23aa487e7eef53e5df15c0000000000000000a602b4ff57c5b5b7ea904839fec5dbd1da8da61ad783546274c3e85c9b3f7e1ee19ff003e76ca716dc460000000000000000000001cfb98ef70b4f56539873fa4f558b603d4e75cf0e5866fe15d2a73f0468c2cd1cfeecef5734d6c7a459f2d9d656e06874d37e7b34e84d66ce2e00003cf75841e6b169fda917b3a9ebbd1c30ade7379f61df18d7f42d6d635fb4d06a65d0adf39c9863f408c4c454a22d66ce69a6baacfa53acab654a702e66fa8c7bfef8a020001cefa2599ac3363b1c146565c7b0c9b5fe6949d39ceee13f40ea4cebd82524f79f3066bd0f2edddae98fcff0069abbd25fb3e6bd153ee8e4aa4f3ec4e9b8735e65d8f99c9b6e6ea629e680000000000000c4ab894ed97a39249de9c6f759ccf4c7d1c9072f9c68f57ace5df92ec6918f93e2931fc197f3ed72ef023c6000000000000000000018d931b4f159146f7f7f724fed8cac3a96c012b96f255c9f473f3d9bc7ea9a4b2dae45ad8480000034db9b68874d79c74898f04580011197c6a6a9242a68427a046e9db9247cdfb6412dcdb0f61136e7f57df7c44dbd7ed3d463e52801203578d169adfa25bb39af3ccf9969e26e6de0f8c743f359b48bf8000003df03da2a18f6f306053b1235d5678c4b97c9615505b46bf2b3e71a571738c6e03d544531f5d23df9bab0a794000000000000073cd0dbdecfabb01974fb4ebf1663762263570d2b2119d9ed36137a099b23d70e8a23c700000000000000000001059d73e9d798c8f43d11ecc26b97e1676d76d351af26283ec5695e76836d15c97be2b6b9ff45d54d723379e4f8c9b6b9136c240000515ea086f4a834e26a11600053508562cff005534c58c6c743a57bee3eae25a78f0fd8cea9772f7379963dbb7a9452412034f99039ad73cb59e7822ded547a351b9a11ce64bba82dabd05139556d5048000000001e6865be8bc773b4aea7d99e995995e32d007aa869b6d6a639676be2fd6f7e3990cfce000000000000038d6ff005f913ebed865bc7555378910a4e8713670cd227f444ed46b258edf94a9cd7a561c234e6fa194d54f24000000000000000000042a6b119d3924ae1b209f66475c2eacb499235b58be5e26c33d114d5743f670e7d3b8b5f449fdf1178ce1ccb9fcd3a0355b58bdcb6b88b61200f0f39fe5e54d371b5f7c8b80000000d66cc73ccbc3e91d1c92664589f1f57cc7b1513bf25976be0f9fabd311991e5bd76eb8444624a75f2a9a845c003daa8f4f2d6450886e2cf61b35975717944581200001aa8eda2671b8bee6f1aacc986c61a9da99da33eebb7d34dc08bbd6b919fa28b6d66b7f26b8ccb33332a19ad3e8e61e653c7000000000000020d19e87c9e7d19e0cbb75da79440ef59e8a5a8e6dd3201a56619fef99d8b38ebdfe632fc6d72ec17c8f0c00000000000000000004425f1a9bf15e8dce3a2bdef6d5d65b6a35b294d2152bcb8cb9e6e8b4aa271207d1e05359dfbaace8b5fd767569e7bd022397349288bdcb6b88b660a726158bbdb53126456c09000000000d4e9e5d02d33eeb6e372878d874e6e3e995ae25d7f99dbaf2e31ddb5f13c96b91432bddd39ceb6f9ef2e6af6549a80a6982a37b8989b3b576fb0e6bd1a27dc0d960c4c1fa1f38e9135f0c78be4239a7bc4eb5506b36ac974122dda60fbf95ab38f90524002052f884be699e551740e73129aecb771dc725717da5c89d1c676d56b49f4cf90f5e796118800000000002d96fe7c92ddb7a528f4c7b11893f9311096c3f55a44ee039f62535a39ed31a4ef57159d4e713ed393b08f2c239c00000000000000000006bb63e1f384f227bab7bdbc18f518dae9aca6b86625b9bddce8f3ed5cc8e4a76713cf7613e1acd999dad403a2604d68d973a91123f753a389dc446f4d6d4c4db95d00168bad360225284e24c4ff1a119689259d4df4e5d362e22baecd09cfc4b78731a9ef5c0e67af1f4d14e080dc8975abf4bccdb53c58f4dea2623da09fa75e51a5ee5ab74721ce4dabd702a25b850cdf357e5748e4a3cbf35f3036fa34e8f672b924e7c8aaeddb58cb92cc2548e7c7e29dcf92ce9bfaf073b1f5400000215bcc7c59a4b3c22ec2cd1cdf2e7c9a516ef588bc0f7fa1995e9ce3ae722cfd72fa05179467e502000000001a44ec38f63c92de8e248fdf32ec081a3de48203c1a0b181a67b9eab8f913e4846600000000000000000d71b142b533af4bf38e6ae75ec5a4e7f991b6ab0a5d9f3d70bf7a1d55b4276fbf55839beab3ef94eb8d9a39acb44d9ce29b4748aa252ca4844d88e4a8883eda4498a6a22c0010dc69da6b16d86e5138797e93ef81ed3ee42b8953d1ef8580a39e746c2b46d64dc17a0e9e6c33bb72cea6a0579c0f29ac8b71895f3eb6b8bd22233189f3d23200040e79109d2f4a61d3140450041675ab9bf3edec3a634f682b2000063c03a3c566b26b90b9a4482406ab6b0d45a9b6877f31ca65f1bdf6b7d5f558b45231ef08ec8a3c7040000a4aac4479d4f44c621bc9247a18b9467b08ecb7106c8ea5a72f2cb1def513cfcdab92791bc375bd5e4739f2fe93956e3931f2e8bb1980000000000029f03da7c2e534fa5c5bb444f96de965bd8d3ee367979f4d8bc568f7135d2ddfb12d55abd06d733ca999a6ab176116d5624e32a69cf3653144e873f3d55bbbe22400000000003cb06430c8cc635e4d6568bb62ac86766d554ae7be2c03df068e0bd5a33a56632de21daa7caba23000071bec9c1edd3d7f73e7b5e70400023724d2ad1d9e738e8f3708c800385cf62b2d7af45376acf4b0bf518ef7c5812a6a108f66d199a482ff0036d8138f62382991453d9bcc655456fcf736c60ef138b55ddc3aa1dd4751cff5f3bbf20f388f2cf3448df51cba336e8e91cf73a491d91596df53a3df1abaced75310da699ebe5d35dadbcfb574af28001e507be7951e554dc0000000000050f0f6a7a0005b814e78d4f45c927b979fb5e46715a73d9d7f5a90cf1f2091742308cee7355cb9843775a6d3d49adc82ccf1eedbf857100000c08c226fe73895cc6f0458000079ec791a0664d2d583275e44c071ba3910da67b893946edc82c987aedcd88be25fa7196cdda46758743f209348b5ff007c261b9f23846b976ef78f7587959223302c716eab03b7575715e500001aed8e3a79af52e3bd8adb0570014073cc295f3e9f4a6232ec02fdaa6fb3b0f7c5c12f7c16f55b9223f93b71e7a24082ebf3f77be11f997b14ae939b17995e0b4cf17a416fcd3c4e9773eab63dd643658713dc69969abea1beb71c5e50578c10000f3db454783df69172cde000000000145548a9e9e5155451e5c14d5447d310c3d34bdee66ebf3e2514767d4ee2de50464023b22e453ac467d1f91c7bdaab7b956db0aac5fae43d57c69f4f31288aeb64f358f4ab6889a20b3db11385b4804d2632c458001cf675049a4e32c8b8ad172bc6c89cf1e312b80cd289b64d11a845c07be0d06964b10b53a18adc08e47ba26b34a49e49c06516f3fab30f32bc906f74736b74ef85798000079e8e21dbf8a76bb74857996eaf056189c7fb4724b754bec60e829d9becee77336db014b5fb3e5f676034000000039fca61d3ddf93a1736e95e57cfe2933d6455eacf986cf6cc68b513133d2c6e5f6c62525e839f3c5859a4728000003cf6d879596ee7941517000000000002857415a9a8a6aa2b00a3874e2216efdc6d327232ef874ce1fd674f36b11c60016fe79ed7c66fdd31caf7cc3d904deccd76c18fbef86719cfdb914d424003061f3ed14d7755c366713e0481a7d1ee35f34961762ded346433c7f152f5c1e716a6bceef4f2ca62193bcc6317db9498dac90e790c9967921160006837e97349afbcfb5c36fdbbe7ae9b3cdd0587994e1000000e27daf8ef56b74e68af350b5185a5fafe5715b74f5688d5256d1a906e94d2311f9cf38b5fa333bdcad875d56120b8023489060c2367359566f3d1d09acbd16e73d6790f7cdf8b6829e7a17342dc5f37adadb40a4bb846411400000001e7b68f7c5478ae93cf7cb80000000000002ddcb45cf69a85bb82de267f299d233d0355bfafad7a2f22e7f349f4d3cf5e502a00109e79328a5bd5940c7d31e23dcbd554aee9e7ac0034b8689334db22f9ea7c043373b581cd3a0acde8b81a5d44aa0334e9966ce6c459b96f24b16eeda482e000f7c0000000001ec1275a79ae2e0599bcb97ef26500d293996f11b13cdf443e7acf8cbbb3866323bdd8f9f2ccde652fe3e9dbabc4f4323898ac86539f4d61fbdcc5345fb088cab766a5567649aac2c45850d2e79a0dfa1ef9a84eb75b8fd026945e22feeaf6839cdc9df38d295fd05c6bb2dbce0af2800000000000016cf429acf28aae0000000000000029a61eb4c2ae65b29d27a81fa890f2ef77d3dbb6bde6365d31ddc417b96bc9982be780001ce61f2183dfd5986bb13619756b3165d989857b36f6261bd0e012165be11686e467eb66973573ef1301ddefb42890d5cfa669cfd16f1130f98c0a5d319c7b13e6937d4a902dceee3f68937b05c53a2b9cde8b740f60f9699623d9113b96b6f996b3713500000a6d979878a8dbf91bd4cc4de3f19dbcc693a661e6c4b5fb045b9dcf749a79a4ae8d917d7d59c31eff00a853a4dee911832a89cb263caa944deb355c56c9eafe66e16733585801a2cde1cefa273b9f4d2ff3d9dc0498ecc8bfb835c026b7e993d135db405afd266dd6a13368f2823100000000001e2d9e795d479ed3e8a2e54000000000000008c5ce376e9cbb921cdafafa1bfb7575c6c3dc67328cca2bb71447247a5963f5ae6bd2afe484600000714d7655bbfb32c187780061c5e6b159c273546e4919f9cf7a1c5a624de6936913e6673fdecc6e6153de7c8e89e79ec5f5f189c416693aa30f3a2736d58bb34a29b96a2c0bacde1acc5de911ac796a6217627639dd9e95ea399ba60e64e9a3993a68e6973a3881654cfc4c6363b644f9578480021535b488fc979c74298ba22c034fb8d623492f854d26022d85a3c6bd34b9a29c65cd209b2956b4c5dec0f6d17933df22e043371671e692381744e747446166c5f511c96432d4e85e15bf3cc6a669d1874bbe67e40000000000005bf2a15db52554d75800000000000000f0e27b489cee7de1ee5d4c8b9798f81980f7c106e818d08d70ee281cf23ca0540038863ed34b7f626660e1df9dec2699c66e876726478f4e5c6b05e870fbf6e598e3ddb959e7d3e8e63cd2551b93a2d01ca9af9303c8b5514f75934da4a2d5d895cb6016000000007a78f7c001e1a9b9a6c19a4d6ef38daa664b37a2c00000111d961df9a48445c061e65041a79cd7a5cd3c1178c7bbe80da9d19819f5b81473be91099accabd36e62413ac8e4ba0d34e83a0dfa2d079c40e4335ddf35e97084ccf57663366abb672ceeda707ad5682bcb3441675100a8000000002cde16bd5c00000000000000000e0f2f8b495efdccdb5959dfc0cc00001648d64c8a25a65d93d80cf9e402a0737e7dda38869e8f46c2a72b0f56232d854ee71c4d6ef55d60f21cc885b09943a75128bcab611bdbc5f630f94df630d94eb343349dd1cfaa25317d8c84d04b2af22c0900000000f710ca69b1912245ed4c4c298756896a297532669b6f13504f91f9091ce66972136af446ab6b5b80016e1e8c39747a6935f045d508f1e13ce3a0c424334da08bb5db11ce655b5d7cd36e22e8a4ae2535ca91c7e411209738e8fce269d1d6eec5b0215d1207359dea5756e7f61b7deb5e36f36b4b4337923cbadb9e74dd2c7efc9d9c57cb00000000000000000000000000063e468d3c5e770e9cbdfc919d4000002d44af6def5dae266466b3a9ee7c83afebe5857980a7e7cfa1799dba63925e7d3eafb30b96e9eaa53778b5c71a6f63356f672dcea76d66bd11a95c1675392fd846db1f75f92caffbe19ae2da0120000003566c23ba0ddcd34feceaf90ece9193a2bbb8f62752da8d5e26feb442f59d170e631f67cee709cc11661e60e75bfdee8669b1ae3f6cdfea68cf235bc92df4d3e91654214890233eece2d349dbdf22e03df00f4f39ec83513495e77be45c04067d059acbf3b5f9d12d2ef23f28f60e1e56f4aa71acc7cfa37b7e158b11d29069cd73739e8dceef1df18b94f0c0000000000000000000000000014d4381ca7a340ade8ecbd866babd3d13cf7ccf40001e9cf7a073e92695c888e4f64b72dbd995f34001add90f9ca47b9825fd99d43a67a9c7a36f7a11be4ee3dd461c5a4766238f39d5328c4a0bc23a00af3316d29b2f75b794cb5abaa0200005060437c9bcd3dcd22e308cd413d9ace9abdac5bc0015d3e568d2e826fcea6bd17cb7722e000f7c0000a842912000e6fd22153599d51fdc44e42cd84e6b47a89acc231a1dd23533daee2422c020b3ae7f3598e342f1748da604966f7e7e3b95ddf3a31e1b22ea08ca1da9e8fa28af1ee8dce3a3c7ac854d62513d237b0f984f8a0a00000000000000000000000000000e65d370a6f03d8c125b5f6739ee0d2d9a07be0e5db1c6eebbf2519e53cc000000b1c17e818bdb7e5931e75258f673b572667a45efc848d66cbd45c1601756906ab652ac44fb918c46cfcc4cb600a808c49b9d4d7772bc7c88904b9e4b7413490dfcd45a07badfc1a6b3c6977517000ae1b2fd44d69dcc5a52908900001562c566261e69f3636ce0c8001aed8884e2742f26bcf6f4f3d443f67bcf56b773c448000a4b7ccb67636cf2bae6666c7961188003132ec9c1fa3739e8cf711993682b3b3e89cabaadfc808c40000000000000000000000000000035fcdbaca74e1da9fa1f593d102dc423774efde7b62cd2f0fed3c73b76be6847180000001ceb9a7d21ca6fdb87b8e752aa7abbb7be67b0002ead201319a24d0cd709b23923cf508b2e5b236156bb25964067ab8de6664d243e117022d9ba4954d3370b371e2fa9dac66b9a6a27581a126c22e030f36821737e673d9ae7b53a9692cf21f54c4b288e5717dde369f4368f70f3bb3ebc3c2e5f542637ea37e0f33c75ba22000000000003dd499f04c4bbb6767b5f9bb79a15e70000166f50700e95cbba8bdc6af698d4b46fb2f04ef7af9615e5000000000000000000000000000000000b10a9e16e4eeb0b6ba6dc95c41000000003cf472982fd2100bf6c3e49cf72e3d29c303618f47975680480a2b10dca93c3b5c2648c6da9a6c54d55bd88fc9e2f7ca5397cfe5908bcda03d0631c951722de7be1104dcef23b34dfdd845a2418162526741275ac4fbb282cde26b6363b5c9c7a4d2255ec227af3e45d9a74cb7070ac6fa0519fce7e7d194ccfcfb23ec3ec575fb02bca864ccb7cf967e81e797eed648b9ad98ebea884ee73b6f562fd640007a78c5d3cc48b0e19a6bc4863fb4e91a610aeb59ca79e11900000001f3a754e69d2dedf87b9df96fd11f3ff0075dbcecc15e20000000000000000000000000000000000000000000000000341c9fbbd33b7ce5bc9df3bbf7c8365ce6ed3afa0a21975d2488fdb84928886bad592c7ac48f4e78e3b8e6472706d9cf6233b646ca076ebd524d0d95a9b499739de52f2aaf5d9d9745eaf188ccab04ae7b0067538632add92d0d94eafc9c77c511d15e3eaa35a657e45575cbf9773d29c00000000018f109b96e2d1bfa36cdba7e75cbec5a1b6d05bf22c58d3534ed6b4e831269b25397dced7bd65c7a6d2f579e8ac8c40000000000f9e3a8f31e993edfaabdcad01eabcba79b714c857cf00000000000000000000000000000000000000000000000000079e88bc5fa8275e1da7fa253b7ce173e8b4db84c93a92328e48cae00803163d2b2d0ab9314da050cee05fe6fcded30bb75c7f65a4d3bafa1d7ce322ba4ffc845c8b4d3c865b26f44131e6b27d2e1ef6d859d5ce256c7947489ad71c615e700000000000000000000000000000000003e7de93cefa24fb573da3ccaf14dd6159db9fae0af9400000000000000000000000000000000000000000000000000000000000000000000084cdb954eda2da79b5afbd18b1b2915f935d7ba7a3cde7bb59694c5ca233000000000000000000000000000000000000000e1f2e8a4827d8dabdf32db458b9911d79fe81b3c761b1e4f6789f3af4e95d6789f6c0000000000000000000000000000000000000000000000000061e47cea74ac5e7fb33af6f7e5febc742000000000000e09daf855bb6697eaf71f6a25d1797763dbcade8af9a000000000000000000000000000000000000000001c77618daa9f577d148c5eaf1796e472edfcf8249e4fe6fc78bce3a7f1fcf6ed538d6ecb9bb8a22e4adce75a75871ecb3ab39c6393de6308dc9afc1eb9b0389ddeafa1359d57815b3e9d4366400000000000000000000000000000000000046b8074ae7677196f0994997c83e81f9fcfa66ff001deac66000000000020d0cd866dbd5dc78c7c7a79a7d01c2be80dfcd0a71800000000000000000000000000000000000000000728a6ac69f57c80cbe195e29def20136eef0f6a36e6d5f3c9bf3be3f4bbd73f8755875538d3fd1cc682f747bd7cf9be4cae437cb9560746ae9ae774cf59ec001abe0bf47694f9f3e8bf9c3ac9d20000000000000000000000000000000000034671290413bd92986cc8702d7f4b83df2d7da986934cbb06ebe6cfa1b0eacd00000003cf63a9e47d12093d7b4d3ee2235b53da39874fd3ca0af38000000000000000000000000000000000000000c7322d407991ba8a53bbb35334bb22e9f3b9d6eb79ceeba756b1aa87ebcfe6cfc90727a1834eee21d1c9d3219892bcf4d36c7d86dab9934b387b73427bd72bec3c3ea8458031f10d9b5778e339f5c6cfa194d4000000000000000000000000000000000396f4ef9b4cdfa239ff4100e4189a59174722ba1bf2c5a5b811de4effa3c67b00000039a74be096e8dfc93073b2f55cffa072ebc75699ebb62f18140000000000000000000000000000000000000008d710eebc28d7eeb4dbbbe5bbcbb773af828bfa19be3d1542ec4d6f8f32e8f9772f9c721bd4bc8bfb83b16bcda6dedb27df2e6222fc4ab8a61d7d3f6fcce5bc9e8ded3ccb70722f3b95470ecdec839059eca38245bea4e0a4b7a6fcd7f4a0000000000000000000014547a000000000018e40b93dfea073a9875882137d3f26cb34d2462f679d948b6567aef209b9d1535fa7323805396ff0040be75c23e9770bee80006bf83f59e756f4278f7cc7bb1f9c4da3bae7dcbd23c50000000000000000000000000000000002ddc00000016ee0e7bcbfe92d31f3ceef4b66d4ec1d1393f58ade2d0193e8f6e5de0edf305a2efb198f65d1d0341119de1d312b9d86418f572e88f7fe3116ec7735bb20000001c7fb070a227f50fce1f478000000000000000000f1418f7fdb800000000000e55d03e7536ff00434525a01a4e09d5a217ca5dcd3a3c4f7e5ed19272f7c0f9a76fe2b7cb329db3ab8b4d1c9ac170e9ea1d4f81cbf3f47a6a3121ae378a55e65acc490cfadb4197446bdc0966dcd3f15f2800000000000000000000000000000005baa931b2d50000000059f9fba4f192a9451bbe8e3d0572bd9df286cc9635e7c8c5896bb3df61a6e9d3ce5eee192b9544eba74ea800737e91a334b36e25db41aa36ae771f3b260f098f9dd63fcc24a63c73a5494d4f4b000000000000000000f293c5370f3c5c00000000014d5ca88be9b17aa9be957258b1f4363c4f4042ba247e49dbe5a0f38b56ce7b5f16f38fd49647b5d35df914d4e9e1866a2c4dfcef7f2b493367edf32c5eb18f78e7376759539f3ae8d46652d63dbde5279c756e4fdd36e2c815e100000000000000000000000000000029a4f69f2e94554dc00000000e2b069bc2913da8eff2f3f3e2b1aa5e4512e93ef3773a843a6b4d00d6f27ed5c10ef6c5c82a4521c75cd2708c42dcaefc9ce6981f41ee8f9e77fdb073ddfefc537291efbe0ad6ee0000000000000000f3db47a0f69abc3df6d5e3d00000000c2347c1f364249ba6f9e8c0cf1c2b4d2ac9d30dd7a77f9263da89bfcee6b18c3aecedb6ba28990e440f04c2ecfc727bc7ee4a5859b5f495ab53db02c79ea5afd86826303b172cea7af95716ee579c000000000000000000000000000052a0abcf43c0f6ab578000000039bf24fa27e7527fa0d54db6e7847d03c83b9e3d176252db0734ea5c07be9eb120074ae4d09b06eb552a9c1c4a6dd86e90896e5000050f05c03cf40285541714560000000000003cf6d1ed547a51714157be5c3cf400000000f383ef39c1b9fa039bf530047b79c1514f41c6c9eff2034ca159d5744e0f5b88c9bcf6d494f9ebb7ccd66048a394d6298b87ddf83d7e5573bdeaa7b79adedcc4dd12bd9f38d945e756e2b5d637d05af577bf469f6bf615f26dae5a52ebcf4000000000000000000000000014d568f6aa7d2dddf282b7970000000000e4dcd3a7f30277da6212f3974a363c9cee0c0e58571ed1ce082cafad6e4864c6a0000000b7ef82e053e7b51e517079ed158051e5741700000000000f16c7be81415f9ed600000000282be5183073dec9b0941f3dcbfa77133b9b9c64117c8d14f3ab807bd3c3a9f63bbce4f43751dccd1e98c7323554f27a3d918391e8f8b6f96e5c938bd3ccec3457974d1e5cb65c53516353baad306c4e889d20b2dca454aca51e5550000000000000000000000000029f6d1efbef83daad953cb800000000001aef9e3e9884105ee3f2df413b1f2c8f454ae63329c1abda000000000050aad977cf479ed1580515d1e1eab1415800000000005aaaaa0f54fa7be7b5800000000d19b2e21acd70eeb4ca8016ee639c1313266daf3e656777940463a6c6623cbdf4c4f7f87cfd736807d1dc7e2faf8febe757cacf6d574d405abb6cb8a6a1456285741e5c050ac00000000000000000000000001e7a2daaf0f7ca2e1e5355600000000000001cc7967d436cf9f7b3efc00000000000053e7be15a9a8f29ac51e5cb62e028560000000003cf6d1e7958a2f2d1553780000000063f1e25dc7b1e6a473b86df2c005053c33266672a96756e037cba6dac4cdeff00279aee32265c1eb598de9b45bf2d8eff000eea9cbded36e4736e920000a6a16ea525c5351e3ca850ac0000000000000000000000000145568795fa5373ca0aa8bbe8000000000000000000000000000000a6a16eba7c2e3cf4a6aa2b142b00000000000a69aed15d5e5b0aea3d000000001c421573a119bd440018c5fe318b2f2ae8408b4a47cffd039d744ebf3a3325d2f39cb7cc9251dc31eab9e800000000a6a16d5523df2e00000000000000000000000000016e9afc2e5aaa93d7b58000000000000000000000000000000000a2b16fd783d5600000000000028ac59f6bf4f40000000001f386ce59cacfa91ceba285a8012ae2d63b31ac9b800071a87f46e548afa64a25a9a6a0000000000000000000000000000000000000000016ae8b5efb58000000000000000000000000000000000000000000000000000000000000000059e0fdfad9f3049a6d073499177547d2b9bc5fb1178001472d35f00f6f9db65fadd900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000235251f363e87e586ef7dc370cef11fe4e36fa8decdce77dbf79920000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005bd1c8046b6bb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007ffc4003610000104010204050303030501000300000301020405001112061013201421303132224050152334243360162535414270438090ffda0008010100010502ff00f635d240dc4951dd88e6ae2bda99d51e22a2ff0094ebf90359c30e138861371fc4ccc3f11c97e4894790eed4f2c1cb903c0df4d1e03895322db4392be8b9c8d435cc116138923263b89931389d71bc4c3c6f11c45cff005143c4e2184b8cbb80ec04c8e7ff00115c1fc7f14f7b58d997f182b238826130d28e7e6d639d8e11189181d67a56b7264340b21c7698a95a2cfd2c78b52cc5a87616b64331cd563b225a4b8d81e2522642b88b2bb675b468892b8864930f24c75eed8ecdae4e60b0960c8dc4666e42b48b2fb97db19f1ff04f96235157f12aa889677ec664994692ec1c333f075b8d8606e346c6f2903ea898aa22b1a8e6ce1a2c4ac76d99db689fd686100f125467c7268bcab6de443589710e424eb68d11b3ede4cb7721433970752f5c655c74c4811933c1c7cb58ec11297fb3c9cc6bb1f063bf0d52986847172836f2a2640b58d33b34d71add7fc17e4bef9ef89f86d70d206064ae241b7275ac99889e780af739031c62ec46aae20f111132d83b0d527de354d51c8a09027a107d972cd0b50fdd16ebfbb5ac6920c9aa6ae184f0bf9c5ac21323c2083bae93f66957be44109f25c028311745acbf70f06f6919ef9f2cf35c45d7f0dbb3772d7eeb55c45d315bafe1cc568db6579d3c74d791ead1973410f2380288e6ed5e488ab8d1a2764a1758114aa0908baa5bc7f2aa92837765bb758b4efd0f75f3a9fe263d8d223eb23bb26d7a811bf4ac29ed2f7da3758750ed25e3ded623a7466e24f8cb8c2309d932b8654289e27d64e930561ca14916dcf7fc32fd5cb5cda99f4a6688b88bf6fef9ae3bdbe38a9e68bafe12c2c871567cd791caaaaa08047e3a38c11c49a971aede8ac54568fbed63f4c9527dc372239b3622c7743b0d8d639af6f2b373522557f32ebfbb55fc3ec975de6a9a2c19ca1c6aa393b253774611ba453591c98aaaabc9174c8f6661e4598291cc919876c8fd83024be09a0cb1cb07c7f0befd9b5392a67be22fdaaf9e2fd4d4d73cb4d153135c4f2fc1dadb6c71cbb70227c82468830f29eba45889ac94455c41e357722a6d5ee902430beb8d223950c27351c926b33f7a3aa4e9098e9921d8d01ceb021f87cb67ee955eddb0fb65c46486946e13ea246bdb3a518e4c4019514244ed45d161d9b99837b5d844556bc2d90c991ba6b5f20b5e50910a344d13f05f2e5eddca99f2c45fb3f9668d5cff00bf7c4d173454c44fc1dc5aa91cf7205b1a2be4398d68dad1aae749b96625e854b3593cdabb90c560159202feeb18bd76c390b18a37b48de4a21ae358c6e11ed1b64dab511ef73dcd9b21adf1f271b65253056f91a40e43795ce9d61bd46f8a76c81f659b76ccae5d616136ed633a852550970b5676e3d8e1b840f203ba2e892985c5f6309a6199c403f872c54323f05efcd73455cdb9e69d8a99f2c45fb1f777be37df445cf3455fabf06b97173d557b902c87154ca888d4137935bae597932033cf9cf93e1d89be5b1e02b306478f196121b82b44c095866f29f077e479048ce05888988a8bca64f183241c877f36b55cae1b9ae895a22063c71c74c9054089caf93225c06b634291e1cc9e69cee9bfbd4eed6363d37304ee9986f691993c4deac518a50db59b1a48ef01604eea2934d6c627881e70fcf59917f00bd89d89e4bcdd8bf61e6b8a98be69f2cffd2fcbf04e546a5d5c3a4b83e45909f5c690c2a60be0d6f2b4f781fc7e4f7b58d5ea4c3802d8e0c731afc7c18efc9158e4cfdc01204eeb2f2911447c35695aaa03b308f7a7602390eb1aa988831b069723faea6422264892302483924beb62f4599600e81ea8bd48fcee5ba829c9a1b94cafde508da11a31572e86a81a35447b9dbb069ae49802715a9a265bc6e992ae63a14b6b91cdfbff00fda7be3be3d8bef9aa266e4cf967bafadeebf2c6e37d973db13f07c4b62af2e4187ae1e2f542a8ad589332327972b3fee42fe3f9aaa31132c9e88280d4eae59bdc38c09e61a80ad30b250d840c4fe4f6594bf0e355d57042799d12adadc44444e451b4a39310805eb1740c729f21c26c7e76ecdd1aa9fb65f3903ea842fe89d1754cdcdc1a6b8e76ecb25fe9a95311372b976a73922eb01ed563b8665a1a17dfbb1792e37db9ff00ebdf11a899a27d87cb93bd97c9334f344fc1dbcaf07055755af8fd57e2fd013c7619a61382fad9abb90899aa65b99ad2542abc0d4d132dcdb4f529fd363d8d225a88627d2ebd1c9abb62573774ce724c800948e29321d6b89810b02deee90f948334034b576a2b20bf253c6589117495cdce46a4e7b164c58d6321a940576270e3745a194c4d2ca33ec65b88da71ff004abf4bbb6e85b0f4123c3d97dfbbd979aa66e4cd735d7b3df3dbd7d33df175cf927b62269f837b918db9b074e9390e531a3f923beb18dbae1c2c3b0e270095927aacd132d47bcd52d46c7c7bb4cb54d26d52eb0f1ee463659bae7822e946cb77ed8d4cdd4fc957449f27c41e3c62487438238e9c8a710b1f6804cfd5d9896ecc659c7760cc32f328066c25685d8fac2a61639458d556ba1ce61b94b9438cd08a5da920d5c788dc4666dd33e5cac6a23cc64a69ea9614d1c8eeb31756222e8b08e9262fdf3b17c979e99b533df9fbe7b7acabae6b88b8a9ae7be7fda7e138a27aa72870facd3c6787026785614a695ce6ebca6c7f1016b9c1284a850d8b74655af93dda72b702b9b0a5ac65fd505a4c98f919591372f2b87eb229c7b63f2b99190202c8c63518dc9528719a69e790b1a80e4c1514366320456a3eb633d0dc3d11f92b87a40b033a446745963929cd511526c051f20d9bc43ae864b29421b02344d796ec45c54cf9626b850b0a2b7ab257beb66f5fb8cdd85aeb83c11038946b916506533ef7e39f1ec77b72f7f5d7cf3db3779b931ab8a9ae227e12499b1c120ae39a30bac66b51adc3c26bf083785f02c95ae5d1edcb80e8eaa3ed7d83758d08e833f335689f9fa5935057086bc97c90efeb1c2ce98b0aed83895eaf72792658587496bab8d3cb12206231135c4676cc84098cb4a93417c3b3c6cb8eec6918ee765119d28a07c991180c8c044e49e588b8e4d31171531134e451b4a3b880eaf955d2bc407b26ff002f908af0be9aefabf7df1cf8f377be7be7b7acef66e33e2ef8eb8be7f86e2c3ec879542dace424c28da564c84f8f90273a33be92b0c343082c72188a840a39c23b5c8e6f7da97646ad1752576dacce9b69eb5d348d6a31ad6eb89e5dea9aa5ed3f4b1174c56aa230a46e0e7c8664d9cf92ce1a8bd38b8a9a67fe131d9bb13dfb274564c8dfb90668ded23392ae89fdd339ad7249ae0951eddaeca8bb7c6c111851fde7c73e3cbdd7dfec1df16fbe99e6ecf6c44fc371348eb58e09bb07c91344c54454b085d3caf98e8cf4e9912c5cd09eacbd48d6c1d87a991b9bdf647eb48ab174e3764a3200114249d323019180d4d57d154d53886b122bea65f9ba389f87831919145d7923634631a63b1bede699e6fc5c44d3bb8a60f9521fcf95ab9ed8756152cacb397b12be3f8834aae1150a3709f5566480f0158617de7c7344cf7fb254d337622f92269f86b191e1612aeab8190f1282430c824f3ecb189d17554846bae53f7a97e12048717d71cd1243640fb6c4fd1041075cfdb6e7ea48e1c87d18f889a27a446348cb288e8332ba4f890dabf642e1a16fb0c4f65f3cf65d7e9c44d3be4090e0fae24a6391ece73e4f871846f90608da21e4b8cd923309e17d1592c33a79fdee89f69b7113f0fc5b2341e56010992616d44556ac03a183847a0c6cb5f30998661188419c6a134e375d94ea9e1b27c4490d1bc91cb126b0fd862b423391d20d063f8717648220431c6b2653511ad1a7abc4313c4c08123c3c8bc7eabc28cfa13df92f9e6dc44d3d1e2a074e7d3937c3e4722044aaf947871fc30b0f2840c1d9b5c59f1525095345e19b0528ff00c50b3238b1f750198ee218498fe250e59cc59d29a8ae580cd91b2c23e9908dd09197065c04621db5e02f88cba67d6217523d33f43f295147212446281413cc2c15881c85b21350e57cb5ae85d3eebc7e81e190ef9b8df6f56e227839c423889c30dd2bd9f2cb19ad8617dacc73abee555e9e69e87160b742a27fee72b591d42d4c7d13df2d8a6618318a6c9110806d41d572e2368b18ef8c78866c88ff00e2132c2344495c48e5c3cd93231135c6c72bb1211d73f4f367803e15aa2c0582318d5dcd6351d861f48b5a5eac5b4fe6d5a2243e575fdaa76ee7c1fdb9dd922bc45c75619319585558b1591f3dfbae9dacae17669093d7e2d06a0ce1bff8c67cb2ecfd69f922200f59c3f27ab1fd0bf66fa9ab76d9d920a810c7675a472200667e58222c3acfe6918841946a22709cad59fe1ce72352d6fddbdcae7b810484c1c00b718c6b39a79e2e118d235d5cc739a3f26b76e5c0f69e95df55c057757cbe82b08c7a10e3124e93e249522d91ccbd3969e69e87bf6d83b7cde1e4d2a9bf2ec23da361ef551f0ee9857a79f7dc07af5ad4572f0cb93c1b7e5927f938c987647a42a8ec7d0b06ef830d749796dfc4a9fe673f7cb79194c3d4b9761d16b8fe1a6ff86aae89796ab31e003cee8f18614ec4f3c5c4455c68f3db9dc3758d56edb31c88e6c9ad7a2ba399aac8c67644aed1727a69322bb746f47dfb24ff002287fe259f2ece243f9e428403555495d1e4f7cc6f46470a3ff7395c87a361cab7f9fe849f28f17f92df8c91f5811c8a03b1c8f6e2f924cb06b500374b7844d0b32c07d5879506ebd6ff0086713cee88423529002408fb13cf9347dd60ddd0c2eda6eeb91e8fa832383e97bf395e52787975aa1fcbb2e9fbec72aad5230e64aeb4f0bfaa2eebd6ecb6a12f4acf19f1bc84b243cb87e37524fa16afd95b0935943f8e59c4f38b2c91f16d0b869053646af2970226847efce4b3a72384cdba2ff865c1fc458d5876b3b13cf1135c4444ef2b770b04ede2edb34458715ce6c8f4fdf95a376cee177eb087efd97a3d961ce9d75adeee254d2d98e563e19d24c61af9e4fa814858f46557c603238bd0e2526caaabd3c48be3c895e07aa56013051822ecf7e56cddb37849fa4eff000bb1909161646983d8d723939279e35be94a1f4a4563f7c3edb5928fcab0f524725f242584762feac1c158c722f77be5e3343f0b9b64b67cbb388e3abc5ceb87d283ddc4dff2ca3720f862526988bafa9c5c7fa82aad7c7723c3e8fbe5e2692786574b6ff0be2d26d87187d631a2107832bc4b1e6b5f89e78d6f973973191f19684dd1e48ce9d9723d0b4e5d09cdef68d25d8aae046e312285238b241d91c72e6964728911f291d024a655b4a2049b25d5f24cfc698adc1d81d980b263f1aa8a9722ea45af37879a9daf6a3d96901d10b9510bc51fbefddbedc4042578dcf8d2229db263b174f4dca8d49a77cf9d323a05298be9dde8e7f0f795cff851e6478f9c473c1356a9bac8c3c61970b188374499d056391ede5613b00024873ead3a441100f8561d9343d7031ce193f508fb5f6834c2589df8e7388e8f5e52600230370af688724cf967835cd1b6f59f5d12fd796927a8f83094f8c8e11e2b18b86800221e0187823102e8b31925a61e8fa6949260b17cbb151153f4f89b9ad462772ae8925fd794c4dadb28fbd28e7f843e35de97134e40c7aa16ae30bac28c4e948f4af7fbbc3abbad7fc227dd468b936ee549cf7e551f2c4f3c6b5152c82c09ea1758b9672fa69123ba410236847851b4ac9b0dd1d6ba674d79d9c45ded8521d8cac2ae0eac698108c29ceecf95117a6ccb766e874cfdb2ec4fd18f140b20ad6a31bd92a18cf9223123a95ee71282520a635745f57880fd0ac80cdf2b94f8bd35a4b640a635da622ebdf63347040bd4b098c6a31ac4d1278ba52ab5fbe27a376bacae176eeb4ff069271471d9dd9a4bbfbb81010b82ae6a65901831d73f6ca4f3c4f3e566fdf32b19b619c8811395c62c603402e6e6a39b3632c725549dcdf48b0bab3794e4d61c47f4e4ce3f5cf560e903b9ec47b67435662792d2ccf19118beaf154aea49ab1ed166cfa1c9aa4c86a3caab87c6c094666623f37266bcec6c0308526448b393182d00c4de574cfa695fe959bb74de101fefff0082d84d1420d84d2ce335aae745808dcf7e5359d48c1d50baf90d344904e905ad7148c6ed65c93e8a716e276c90a1c2e4780d1ca860fa846ef1aa68b5e2eb48f40a9e73a1edc8329f12446332405aef4ece5b6144131d24ed446b469abb1ecd795931ad380c78ce89c40dd036310b88e6bb155130d61103936ff541c63497804d0b18cd79d937743ac7ec99e811c8363ddbdfc322e9d5fdec89028c32f11c66a83886211c2230acfc1ce943871e74b24c901138af8d19806f2f9669bb16bdc8d03795c1be9a716e2e5baeb2ea5ba44eeb68fb9b547e99bd595fc9a244e9fa0a9aa2e4a6ec915562f82501587123b4c45d7d07911a97160e9c7811fa2cc6a6d4e4e6eec9cbaca8ec4f0a4802763ab5f9e00e99e00eb8cad5c14310f9347d856ef10ddb49e85c176456b55ce8c24047fbc97219163d94f2cf344acded355895b5f3cd5720246945f8123da365c4f59d286c523e301a06734f3c5f3e4c4d1b9249d63c01746365b27f5754bfd165b95ed2f54a980b028dd1cec3b315354903501e1990e0f4e413a2172eaea7374e4f27b918d953c8477d6ec19ca2c853d0bcc8dd7242ee3c882ad6574f2c12429a198ccdcb9bf37266e4cde98afc29118cbab4f16eaf89e7836f6c85d4ed126c51ae6d5cd17345cd8b883c44d3ba43761c2bb85df6e473e670e85a6b2fbc972451436338b6322ba07479dd0370f8525aafe0b8a67a6990237459cd3cf17933eb765897a51608fab2b95c8f298a9cae58bd5af0b8516d8431ad2ff6b95b07786acfd237a772fd02ef7789e26c23f888f972ed01591d0e5f6c91187213f4d2a1794b2f463c76750f92a1b4cbd3347344bd4d22cb04a4e7ed92eea283264e916248907672633b97e7eacffe643fe2f622ebcee63ee68dee192a2c993c5f7522c2281b6b3df632204348ede721770ea24b624f4e2389ac4961963fbe94648f1cc4718b5c0ea939a79e2f31267be5d3bce947e7c8e2698446be31e14d69d1511795a937caaa66d89c9511c9244b1cf0cdd78fe95b3f74a3036c1822f1b4f5327a26cb61ef8d5f23a064f3edb8379d30b1cd45c562eaf46ab49018aa58666ab2c270712ee6e3ae273f1eb36560abb04118b111571acd3bdfe44f56c7f990bf89cace5745bf59176bdb8c926660ad1e9829403a59c4f0ef8325f124848d30bed9551a965c40d1ac99d264af20cc38720cd6c9c5722639fae4f99a63515cbe0a46d8b20b10d593593a37def15cada3c882e8839279e2f633c9b964eeb4bad66c87ce5466486488a5060271859faaa6d08dc7331a8c673b6075055923a46f457c908ede4901ff006de182ec9dc4113c3ccac94861e4d80f63a3ca2814568c5c64a03f911e836395c6346174418b8a345c562e79a67cb36a73462e20fd196ddb2856076636d71b6405c6cd8eec6946ef467f9cc89e5170e5408937c83ef0d7c70bfa8220044c355a61621858af7ecce193f56b7ed64c814615bda9273c2021963d5226362476e7405932b5af4139426ea33a72a5b8f91ab08fc084616e59c342b78724f42c7ef6f0fd7b3af66f93c93cf17bcffde6a7d3da5820263aa9320c348ddd303d03d7c8eb87d0b12f4a2c01f5252f9e01fe0ec66c51cd8ce42419718ed902c3c309b0956ec2c530f18478d492cc41d40779bbb44cd8d5cdadf50821931f5f1dd8faa4c7561931f0a4331c37a622ab71249d33c6c8cf1f273f50939fa849cf1d273c648c72ab9469b4796a7de68f27a19fb924d146a28fcc918255b18dd193c2c5e9ccfb49266c70594f2d81a255f90d8d1b7b2e848d3018594e890c71bb589d1b6fbc92540c772ee75437cb13cf17b59f2e539bb25c57f523fcbd5b4123e354bf6caf42e5dfbd4ccfa32e45b24509bad5b755e92c10242c53b551c9cdec63f1f023bb2385a11f74b98c021261deaa523f1b24c983b13370360126279a7aaa88b8a012e785067838f9e0a3e7828f9e0e3e7860620869ca61ba11dcedcb1631243e246646676debb6e70dff00cb7da71649d074d1d36f345d79de27ec5222785ec7391a9111655bfde71093654e4194d10c4561717b849cee45f5539b97cbd42a6e1c676d91e85c05552b65201c9e696e3df13858da173886bb72574ee8e279fa73e6f470227c82458430a222263c222216b42ec3c0309234924758b30723eda4481c76cd96e94e81016420d8d1b3b7db2d0bd597c241dd2fed389975b6af4d2172b02f4a253bf743e577fc5a4fe2f255d31499632fcb85e039bf7bc5afd21279abebdd846b858c9456632c319204fe6d4d579946851fd71a44490d902cf97a645dac026e37a0e6a39b360a8723cc2830760233611d624dc905680245eb1e14e7c7c1158567a1612ba0c089f20b1c0c0339fbf2950466c28c91c90277517ec9ca8d49967a2b9cf2bd8c573823410bb7db2ccc40c7ce1f8a91abbed389934b683fc3e579fc6a3fe372bafe1d33f40f5315eb863304869c42639151786ac5c4fbde2f4fd80a6a55e448a27e3ebd71f18acc691ecc1ce23701601d067113b27c5f103015f18c2234a3cf97a566641c6ab1ef97e9498223616b8ccc231cc7519d24d77124d423b87a0f423dad3b6466a78278538727be5486c71a6f3961c748e2edf7e46134c39519f1dd0ac3623551c9eb2aa35245988792241643a2d714d928438906a99be5f6fb722b10827b558fe1793d581f69c5a2db32a9dba0f2bb4d62d1ff001795ab77418d25d1f3f527675a5c8c0d595eb1e30809671d0d1e2954121aa8e6fddf15337c1576dc1ce13b1ae6bbb0836133f4f1114956f4c2c630b052cc2c13d083e56d1b2b24f4c9cbe5e839c8d6cb3ac835747e807d4b1075e3c19c58594d0fc6cde53a0866b6c601a0644b473706f6919cc8f68d928eb20b5d13a0deff007e441b4ac995ea24852dd1dcc723dbe9bded1b4f6c89879253e46af29d234008172e9fe54adfa7b08f689afb31262dabb21d8294b701e9c8e1b93d0b1fb4e2d1ee8546ff00dbe560cdf0a89df4f22351ec6311b2db0e3b7b1efcd35747674c1f77c51ff178f8044c704acc6c82b7193de9839827e7be31346f2b70ed253179fbe4d0f4245748eb8797cbb9ca8d49f2faeeac89bd7d6b20f46570b74bf4f7379b9a8f6d95122e238d14b16d1aec639af6aae89612baefab89afa5efced22a0969cde8af961a7c71e1ad4aec738877c6ac23f010c20ecb65d6654a690f9ce949146e710e40d695d8dab16481a80f2ffaaab6aab5d10dd78bf67762ead5d39364ce4a9aa447783b0e761a258f252262b9572c0e82170ec5f1161f79c529fed69efc9e363f1f006b848456e0c8f03e2d8309ce50bad1e313a2745d5394f075c10cfe1ced5473797cbb0a468993663a464182a5cf6f5ecc1d78dc3b3522cdc7375c54d39cb5595652e84c3463cd14b22c0a71d78124953c93b9ca8d69acd898db57eb1650e467bf29eddf1213b6cbed55d10b611c785b672e18e43282298f81a9c084616f6d97f3602690f97b65a2ff005b52c6a46e5723ca87ee430d445e153752bfece42b1008bd32a2ea9cae63eadafb041b18e47b65c964618f53cb572af27986cc35831318c34d935509b062fde711b7754622ea9d9d019926c2506574d5ddcac45d295584ea447184cc639af4cb58fd37d4c9f2e7f2e52e4b63b241c921f0abfecaca2f4a4504df15171535c7374c9c6f0f138781d6b1c950c1292670faa218068ee14e903c1dbae0a7c72222a3b9bded1b264a74874482f3e12adbb44f700cd76adf7c96ba458dfc8e44388786b51b7096677639e53395aa8e154e060c717a365fcd82bac3cf6e5702d094c5d473e6bda7af794809eddf12b1db665cb36cae1793d19df6447b46cb8b624d756c0f2e6e44724cac7355a092d51d7c9338f00e25d5edc5739795650bcc912182233ef6c45d783915dba37633e2be79600f0e68d643e83ed86992a53e4b86333d075b21f9062f8566158d2b0e27c63c294d90ce73a7b478d6924161426813d15544c59014c59d1d316c63e7ea61cfd5039faa073f530636781cb3a4463c6ae94b0e58ded23397169b6c6e1902b20737351c86a7845c370ea6168a6330b16546c64d90cc65a9d3264e749c86f0213f518b8b631b084de40d98461fd583936c90c1611cc7ad9495c7c933f031641f2370ec92647a28424104424bb674ed58bb99e8db3749752ed6273981ebc77308274686532b5a8c69bfb30ff9578cd408aa8b436be2dbf612640a30adac89606aeafe9fa4a9ae599421170d57a90df80b0174275513517221c43c7d88931d6c4c59f2cb8d8328aaca87e0ea80dc1c500fba6466c962f52298166d5475847449362f22458cf90e8d1d91dbdaf23198fb20371f6b8eb23ae2ca90fc6c690554ad3ae2559312ab3f4c667e963cfd2c78b54dc75668d5ab2e4a8a58f9c3564a8ee5c4723af650c3d08aa9ae6ccdabdb68bb6ba922b25cd25044763f8771dc3b2b1787e767e813b1387a6e270dcac4e1a365b563ab929e9a34b82ca280dc1574312f67158b6cf82edd0fd1b966a2a627d7df21740424d65cf1f522639848cb49669385eb5958860324c9936922141647ec5f247d985a5ec5f2c97668995900b6720236047f7aaba616c620b0dc430d99672926cb019c172cc90ece8cb360aa8aec65501b8c8806622689ddaa76182c334f56b9fa748c8f58d6e35a8d4ed96c96856c090ec1d52e32b4098d8c06e2269d8bc93b5ed47b2647745370fd9f8b1492a063d58965d9f6e899b533626711aa0eab8445aaed4f438b9bfd270d2ffb4777168b743a676e87e8c81f5401238061bd08ceeb326c8954ddd2d7cd1c9b5d0b42c238df0cf4f66c9c2f4ca5605967c41808c79a58f1c71dbce448181b265165b9f5535838f34d1f196edc75b8f096c55cd654d757f0f91ee10471c38df8fdc4a9b1e2e1788a2370bc4cb85be9c5c50cd938daa3ae36a31b5414c1c18ecc6b51bdcf73588f9f19b8fb61263ed8cb8499209880905cac84519fed9111a9df2c092029d48926dac9b228f8483ba57a1c5c5d03c2c3d959e8714b75abe1576b59dd660f11028c9a13d2b68fa2d74ce8af75b1b79aa03b4593536cba95fd97b51ed7b0b0245459b278fd0554449f7e00e14b26ca445ab6333dbb25d9b0791214ab22d655060f2995d1a623b86e32e270d47c051c112b18d1b734c6b7ecb5cd571171574cdc9cf886d1f0f3f7241475b81ae02630431f7b88c6e127c7663eddb8fb532e2ca966c48728aa3a87e32ac098d871db8d635bf7034f273b5c467977d943ebb755d38644d1d6fa1c4c5ea5a530fa557e871126b51c22bfd27783fa6b6f7cd1dcb5ef7223927c3503a1ce707045615bce7cc40b6389d20cd6a35b96a9a4ea85e451b4ac330d5f269ad19387dae723527df47064cb29739625639e811302de72a70818697225baae835410da2677a79e7be79ae35754f5d573db3eac5d173cb35cf8e482b40092624d971828010dbaf63e40598fb38edc25be3ec24bf1e423b234553a32b5b8282047363859f6cbe58a712678a0678a0621c2b88f6af2d8ec63b6e6d4d5cedde8da41dd94f60e81206f6919df27faab64f24f42e53755f07bbcbbee63e97084d5a8f5cfa1d9b9a99aa3f1536f72f9a4baed71508178ec4edcfd55fa1671c991e390ee8a06c71f2b8fe6c33f40ad7239adf9184c332400b0cf4b7292396ba64ab6871f2671115f8e74b9ee8f54b818e20f6499c106489c63e57d2c99790a04786def55d3355c6ae6df3f97d82ae7b62269dbf1ce2790a81ab0688c6eb8e546b4b6cd457da9d714b2652c7a19a540f0d330547047818a00e714c3463e11ba06454546fcbed557449921d208c8721e9fa7c8cfd3e462c19098b1cba8b7476a589d1e69864602d4a98f9afcfd51f8db54cfd50589661c09c46edb587d3ca1b6f0ca9dc77f4c3443eadb7a3629ba0708bbfa9eef7ce2a4562d3937c4ec6aee454dbde46348d7d701d9fa58b195e06e2222273bafe6458c494b0a574147e6ec30da61cbae20b1967386d73ac26e0ea48b82ad0331111139c89228ed936452657d4c99b902963445f41796b8ecf6cf8faeab9ed889a77482b42101dd326387b711344b795bdd575069d91e9210706360dbd9c4333c54d0c521451a43e3b844691be848962061ac4cfc7295c95d2faadf46dcfb59540ea97b11745544237c3b171fe0957f4f8a4cf063d3f4d063aac78b54b8eab2e16298391e7185812b0cce5ef9610144ea7b8244700c3902ecba274eaf8487acdf44e9b81c2efdb69dbefcb8885bea68dfa13b5abbb1536fad73fcce124febb882a776564be993d1913420c24e9325d0a80e6589531237a7af9af9e7cb3c9715171355f59573db1134c55d13455cda99b711797144eea16003a428eba65a1bc38686078d94d446b7b6fa5785ae1b148f63518c9b13af95c02071bf1ed318616cab079323442c8c8f084147b51ed991dd14d06524867a1309d593145d18fcd111a9e4f4d762c890b271b0642a819d20f758426bdb585e9c9ec9d5c84c8b2a4403d65b026f6716936c3e1316d83e954fecdd762fd5ce5b3ab1ab848295d36e11118d04a11ddcdabb91536afa96cbfd770827ef65fd46995d3fa489e69d8aba21ec823c24a9330907875ee58d183199e92ae99a6688b89e58bec888a9a3bd65f24f6c44d397bbb9bb2f6778287043e20a89aabd5a3605493cb570990a3777144aeb4ca9176097cb99ac02352d991d8d69a4be3573199edccc26986f6921498a74902ee90fe9821b3a92b9b1513157556fd084da4145fd99af5477a1326300d86d57caed97087270f18d15f5dc404164692292cce2d26b2e899d3aaf48dfb5c41cddd899319d296f9ec6b4c67996422b1609fc447e6be62f52c1774de106fed62e5e536dc873df1f07282f6ba501b85b30330b6c45c6b26ce587c399162022b7d4d792668989e59ffaf59decbcdbd8f723596325f613003408869a65abd48ea288808bdc47231867a94d147d20731fcb9beaf520abc0cc6a2353b664749018e57c390c723dbdb6cba43a84d65f2d89a399a222e8aabb9469e764078ca924c98936426258c84c6da1312d533f556e3ed5d859a72602294eb122b23b7be5d6b0b8bd6886aee217372de424ab08ace9c6f4afbf6ee53cd392fcbff792a602321ee936148f3104121723c16b72f069e1698db24eb9ae353763d7bc8460f167c6c64a03fb0aede4e1566dade76d48c92bfa14fd47c3b2dd91b86c2dc056c307acaba668ab9ff6be4a9e78df927cbec131bed9ecee7c4d3ba62a902aa89889847a0c71d8e9b39a88d4eebd274aaa2377c9ed4f34f4ece2f55b5927a6fedb8fe2d2ff007318a888abae37e91e37472bddcb6b714225c7418eec5ad067e962cfd2c789581c14508bd3b18e8702a67b2c4e241ae4692192cf478a134b584edf0f918831b245d81a3977b2ce8aaae58110a518608d9ce5b50a38c372484444e4f777ccb1daa88f2bd2ba42a1a298591e5100b12632464d274a2e5607a103ed533df3ff0009edeebf65ff0094f6e5e699bdb9264b23817ab61304341b1a9a25d4b46270cc4e946efe2c7ed81569acaed12f97a9671ba4fac93d61f65b27f494ced2431a8ad726d54f371718ddd8ed377dad903a2784d14b8b26a9cdc734a07c6ba9a0c89c46376479f1a47738c26e7143d849f5b65145592788a3b124df4d2e3de433d6219c10d4a6023043c9099bdb8a4c6a6ec74312971eeefb396bac288b21c21304de526108d860923be44c2163c1175e67da2e69ae7fdae2fbfbe7fdfb7d97bb517b6fe6f8d3d681063627998a836401ad85aa7a1c60b951fdde6aa8dcf102c6c916a8a8e4e73a6f877b6d719640760cc32f6958851fee4394122145cce342842f58f206e4235abb917563bc9e8f77dbda8f7c5aa2f4e4e3911c9611fa32411487c3048151c938b12d67267eaf3f1f612df8f23dfd91a3124286a5a98308c48ffa9bdad4dd89e5c9eee6f7231b0e6a9e4f2b291d10c503a4158d4637b0a36959287d191c32ddd6bf6ba67cb3fed535fb554cf7c45e77127c2d7c10efc6371cedb9727560f84e2e8cf438c13caaded63c9344dc7cf7ae3a499d9e6aa8222e744b914ca0373b86e9262c209e33ea97090a40d472e40941668b8c735e9cad41d415548d84ec9b0d84c6109194368d5c14a0993fefed9ef6b125588f6b155af4f34c9b1d240405747309ed309d0e3bb3c0c6cf051b3c247c40093344cda996e9fd2d2fbf245db8e6ebda9e498f776199d41447f4e4f29a65348af07463f2952591d869452a864144b18c871583f7cce131eb3fec973df355c6ae2a67cb133dbecc8f68db2788630d5dc4aed477ed235788c6d54e258f97765e3cb5a3db1d576a3951ad90f74c990c091a37a1c5a4dd3188aae6c433b075f8d8a16e222379cd174cd527de2e56a2ea47a72e84e441b08926b117114d0cb124b643395807a12619d0e0cf6c46aae2a2a6102c261eafcdd064b314066e750ccc6cc9098963213196aec4b41e259017127475c49205c428d7354efdc98a51a62ca0263ac23a612d1b849e77e2210ce0d695d808c20765ac5dc95f2bc3913cfbedff00894bf3e6d5db8e6ebdaf7774b6ec9407f50265da188ddf279492f441f598b0e0345965137a08ef072e1506c83f62b9eea8be48b8a988b8a9f696b6e28393a69e710500af44ad66320318ab04056f800a625709ce6fd099745da1e178bd597e8f11bb75bd6a6b2fba58baa18e55015ae473715354f38b2d8e47b08f68d91a4324372485a71477ba24ae5383d78f566e9c84f97fe53d8bf1dae5ed7086ec7408eec5ac0e2d5262d53f16b0f8b024262c63a6289e99b1d9b1d9b1d9b5d9b5d9b1d9d27e24732e360487636b0cb8daac1d7819888889dd671ba24a993af7db7f0e97fbdce5486c61feace471a4988d74832e01c672bec8a3c8b60c22f6dbb36c9a876b14e9b8309db6572b5fe1d5ff0037959b1a3970e3ba549009021fb177bfff008f1d9aae27bfd9de4ff05106c7c82c78cc02736ebafd0b9ab51395ac7eb47e16983627a37bff002d55fc8ef9e1e996a246ade5701f3a82ee0c98ec90c208d10912c5151ae4724b76f949edcac43d09108dd607b66aa98c6eb8f76bf8128d0a3faa39c4f428fb6c9358550bfd573b855f130210cc114608b3a51b1c835424103f2644747755ca55edb96fecd2bbcf248fa32219baf1f27337c482edb2f94a2756470903748fb27637dbcd3113762f9e7b7da5fc8f11650c1d117368fbece33826a4b66ca67a1c409a5bd57f27be40bac26ab8440150a3c903eb042f7c492d7239af6b5ed9159e6b1a48960447b8fced8e37a52eee5e78e77daad8c7456cf8eb8c231fea5cb342d43b58bdb31358b5aedb339dc8f298be5d8f623d8e4700ec723d9cec9bba1d4bb49796c0de2ae93d02f27a288a3723d9667e8c6ce1f8fe1eb3ecfdb157cbdf3dbed17049be5736374f41cd47b66437c57535da1bd0e2866db5ae5d25e4d73991d4c55cea931b28c98c9ef4c09d85e5622da4ab2e8ac76e4cb68dae564bd9dcaba24db0c8515d21e31b44cfb65f347553f1f5f21b8ad285c0b2233045615be8dd2e52ff0067b5e9b9825da5e7204860af5231e1c96c81f65b336caa976e89ce43774782bb65e2f9a5847f0e6ab91d51e5b0f64aa936f05948ebc8a88de2e7e1ec22070dc45118a0e22110ff0063b713cbed8ade8db726374f4ec2bf292e1d1de9e69dbc5c15c0bb61b26a6b162e9e23a43c7460bb0d031cd709f064f53240fa811b946463b7358ed794f84ac5853d4582388bc9ce6b70d601661e4964ac3af572a22353ee9511525d735d8d7123161cb6c86f7fb64e375e4578945179a7392dd9202ede1e7322b6431ed2472d74c53f65d7ce97fb7d8cf2772981eb82217a3232cc5d48bbdcde50ac1f086799264a8e219f91aaf27c458afe1d9de2a27e1eeffe586edc3137d352b10b96d0f385a6f505db7c1eb55e417f523193709aba3b9ca1a100c76d7e4e1f4cf5afdc1c6bf94aaf61549024333a52131b1643f055845c8d1471fec092023575881316d198b6b8b6a4cfd50b8db422e7ea656ab6d53196407631c8f6f64b8cd90c28c918d065b6437b48f68db3a729b2b62a91fcd3179dbb749758edd0fb0c26199121f86373ba5fdea64fd8ec929a4802ee072b2174a5561bab1ac0c818d8082f2b195e24c631ac46335e53c7d589c366e95a7e18e56842e574a94c6fa657a0875bba4cec96ba45a4238769dae4473658563c9a927d587674cb15dbe395e83636585d928ecf0e26ef26593350d79361f935fa622ebdbf1f55ef68d2459e12498aac8877e32b0ab8954cc4ac0e25747cfd3e367e9f1b3f4f8ea8faa1e16b0adc610b1890a5b6437b24c7648639a48c60da6258475cf1d1b1d631d30b68f5c790a7743ae55c44444e498bd974df2a57fd3e8cd2f564c21746376582693627f17df95a8b7c6852bc33e5487c82450a98ad446b706dd7b00be1ec7f0d76d57d55669e2849e9de172b05d287973211a3e188ca59fddc5917470dfb08c723db66cfaeb4b92c6e289d10cdce89720c751f2333789abb5fcd174c6939fc7d5993191d1ef2c92c7ac5c10862f4e48187194648a68874387b0e0199afaac5ac3267e9d231b5665c1d5b1306218bb1317b6c47d4895afd933d0b397b5b5d1d4c6edb4fe6c2fe267be4e9e21b70007994648f158fb262612c0aecf17232ba415d33959b76ce8a4eac6fc2b911cd9617c19d0e7088cf4a72f5ac513449d31b19b1c26b0975f0c70a3f758c64970ded731f567d50e3428daae110444233b1e463309a7500ba87b11ca9884d3d59d25238c437c93458ec8ecf56c81d6055994723d54c5eef7476a13b57737b5ef6b125d96b9180f904009a11f6da7f3607f0e558083926798f88bbd15345608e541544e2287868ab80e1f86cce23800042aefe6f2bc4d24d1bb7d4fe1a4c50ca64be1b5d4957620c090a299e847faece7cf6852be09ec8d0e28a207d0e2984ad28dea37848d28e74657284af0b993d9a2cf16127ae3e415f888ae564433b02d560bb3e3cd08b88f45f45ee4630cf7493c48e91c5ce54964761279deac9f21b91668cfe8c9674250ddbc7e9a62fa16ccdb2a04c1f87430973aa3c74b0371f6614c35919f9fb877c6ad72a8c6d1b7bac5dfd63a495c36b55ce89452cf80a0863c1c48e3edbb1756aebbf9bcaf53cf859fbab3f13c591747c091e201dee5569aba01671a1466448fe89c4d38674674493024745f8788c2e3a0133c0171b5eb8c8426e2222777c7b98ff0042e0d9511f55e6be49208b2644386c034f144649711f196be76ff42e59b4f544df17d24c7111318edde84d8de258fae3b7162484cf0a7c6c190b8cab22e0eb42dc635ac4ef291a2195fd4256d71a792beb8105bdf2d3745adfe772bd4fdae107fd1f89991d92a33db22aa5479423a6489428fdb35bb264418c71fd3bdaf4991bdb2ba4ea9e97c791e6b0446391edec63f4ee55d124114e78e3e9079d993a712a85be4f27b51ed9d1bc312ba57599dd6ad47c5a755697d12198369ed9eae01986631745fb57391adb098b21f0221264989199141e81ff00b35dfcde5749ac4e1176933f153220a60a570f491aba2d9330c12896ace858bcee13fad889b62fa9c4756ae5c832faa9e87c79da0745ae928cee6bb6e35c8bd9664d912ac5d495d974ef3a86691b25486c718ecc4e57b47202f6be2c98e669c5db31bbe2d593495dbb933a898a4c7bf46cb90a77ec72b044709f165b0f837797d9948c0b27cc592e8b1c924d55019001e89bfb3057499cad1bba0f0cbb6dafe367c214d0c98f22a6502cc24c428d70d24226806b696beb5f54741517458533a9dff1ec7b51ed971963be14def6939dc9357d33340f65abb59909bb6261c2c3b25d774874e55ea5947eb06acfd2376bb4d3cc641955ec3c84023ad533f55c4b266258033c703167b17254971d604424d91160063c2b7a47466e46b17314446959f633268e364992490e830cb34d595c2803f49e9ab00bb4fca4a6e8d544e9597e38a261992f8702f57f0dc9c1f0dc955adaf14017aca9aa5dd3281721ced311754e7f1ee7b5af6cb88e0ac197b7b4efe98a3d83b731fe4844c9afea4a86ce9c5ecb34549b1ac47b1b204fcdedcb2923f0f4ccd4d9620e81ebcdd68dcbdb1c4c55d7270f64849aac8dbf7e0e29cabfa64dc74294dc731cdc6a6e5463c990a8a51d61c40c31f2b5a41c9c9514d15e13102e8d68d54191844f54f2420c9766f262f9e55d39a5ba24614517a8bf49797be27ed1d3fc0ee28face7b558e8d25e058f2866e5f1f4153549b1ba0b0e6a0c6d9a0763551c9ca64256e4394a05eab54024de542623d17b0a2619a5abc7409099e0e460eb4eec88048e2cb10f5a3569ba5255c898a4cf7e7689fb39494bd46b5a8d4e7b53bce119c73b8755324472c6231ee63836a56e0ed00ec11865f40b2022c2da89b922c4e5e5060489ab5b4418ebeb17ea2f39e9a4d84edf13fc0ec6ac135b635c782fc14d2030330444ee739ad43d835b852bcabc98f733073cadc15809d8d28dd9361a68d2bdad80e4f15c915533a8b9d4cea266f6e6e4cdc99bdb9d44ceae291725b3a7223bfa81e673342c90771dd4557e34889a27aa608ccd95c3b1c992e926015ed731d8d9266e258494c4b4919faa48c5b3918eb092b8f9067f2631c4743a2947c89431038c6b589ebc9fe4a79a72b4441cda32752abfc11c88e49d42c7ba5c093179308f660ec0cdc4b3cfd49316cf0938cfc7395cb9029e54bcaeab04261a0c5364ae1c0bd64d24d0e3d8e62f647b0731052824f52cc7e556ee4e735887b06b71ef711d534c494e10da21fd8906c221a9a09709c343c770d1b178725e7fa766e270e4bc670d1b07c343c053c112318c1a7d94cfe5e7be7b65e27f55c2afdd5bfe0ca88a92a8e19d4fc3454c3d44d0e38246f268deec8f5730f91f86caec874d122af69e38643494305f9fe9c899fe9e8586e1b02a4fa9930f90a514783b25c1cd0bf1ae4777b9ed664c96178a3c85091f6065c7bdc45870cf2df5f4020fe467f94e4f6f6cf7cbe6e70813fc72556449392b86de8b22b26039a18adc49674cf1d233c748c59875c718aee488aaa0a99a6c0f0d9d72351c20e35ad627e46cfcac47fdbe5749ba3f0aaab6cffc7b8a7a6d815a161116001725c318435b0093cbfe9b918de192633868782a084cc0c70853f2b6e883b38aedf1b95d7f0f865ffee78628c2c93c470459278a4eeca6bf92497fe33c59237caac6e9172d9dfb3c203fdbfcd710b76dbd5aeb0795c7f0aba73614c91c472e4648318cfcf6ce118fd5b3ff0003952831052b89c4351f15b75816b1277d9d997c458019d30e5b3b5370bb36d5fe6b8a134b4a7fe14ab38f1d64dc1888423c8b80ae926c054315071822cb227566f08c7e9567a33a682106771399f85b29a5c539573ac54c49521ab5fc432e32d6d9c69ecfc891c83659ce2cf930224994a7a1b013515e37f0eddf895fb0b0378785159be468b9b5727bb74ba366caafcd71627fb88d862546086e2bc55e990e3044ce4576825d75ad1742bf1ee6b1b26fe00149c551d31fc564cff5549c6715bb1bc540c3f15376cb945967aba5936080e178ad4ff4e57685e168aec91c2c76a4a8c58a5095e02d05ca5827e4388a4247a9ce17120a9f38be1b1d0d8e563a3bfaa0f5f8b0cac89483d4fc88edc488ce9c5fcd716ff3a93f8b695a86c6ab8440910a38abfb7cacddb600742be65ec18b92f8965970e729dd88c72a468e594524438a4fe9b2f1d0e437950d02235134edb08209e1b2824812405780d5b252642fc7f1a48dc7089e62fe996b5eb59c4c8ecbbda5a67b76e547113a3b22c914b0fadc546df61543e9c3c92ed91ebc7d69df9be2dfe75491828736e75c5f35ae36c7c5768fe578ed20e27ee6163182ca5a21cc874e069a6593b640e0b8fa0ad17a9c5397127a11b84eb1a65efb682d9f0ded563f82cfba37e3ee8fe26d383e3f52cb2de881310332557257890ae9501c24af9e7805aab015847f517261165cf6351adcb676d85c363df6df9a2918265fd9326cd5739706279562548db96b1bc349827ea0f0c560593e73e5ac1a7748afa38cd40dfbd1c960e4aee1ca116d8d79fc0e1d9a289454e8f91370ea4b1b2851db162fa1c56040db706134b1fc75d49f09599c3713c2d5f2e3341f82ac6e806ae99610f7657cb242950e48e5c7f4efcfd0aba817525f2bd7fd5c203d4df983186064fe2600d274f9339e9e791a0ab958d46359f09f1bc5478c458e749830c6729eca4d8c21c585612101c2d5eddb0aff005f176f3d2d4c11f443303e22346aa33de21b04cb12f461f06c7df33b5e610f16c21a67ea10f125c6767192b5d2e8e5361d9a2a393f1bc692b29e1ace9e9e5cf8d0dba5c76ec0e3574cb28fd227074c5648f4f8b8ff005520f4072b57ee9bc2a3d95df97bdb2fd362cd987985c040739031c62e4e723507691718e6bdb750f6ba2c724a2438ac8a2bd6eb0f534b731bb593618e5b61d78a2bbdfb38808a83e1624789566e22af1a978a82984e2a90b8b7d6665d9753719c3760ec6f0b4ccff4ac8c770b4cc91433c0cce13b3713f1a47b4639d21d2a5f0745e9c2e720cb3ee39ca4d63c227849de9da1bc45841674e2723bb79abc5d085f97baaf4b1893219e1913c963ce56e31ed7b7071cb67606e168eac900994b204f64900c6c1b71ed6bdac63589d9ef8630c3926e06dc952cb2963d0d81f23f0ab74170ed7b3055d0c58888d4eee268e91edebcaa09df8ce2db1e9040121caad9d5aeafe2722380619c57b27c2d5d533eae6f4d5ad76991d7747f46797a10a38faa7e521fd3046675647e65ec6bdb61c3202e4e847825191c372587edf0589121e712c743d4503b58ddc528c4d35c05b87b4905c8b5b32736170b6710c51c3b21aea3f4b8d1bfd6b3e7f74aed313cfec2415800cd92f972b84abba42735ae6da70e00cd833e5d2c8e24b46ce5810f6449c5f098264cb073ebaca320e7bb4c65e58b18b7762b8eb59cec7ca90fca5b49c393dbc505d9594ecdd3395bbb48546cea5b7e3b7a7ab6ad86b14db3ab9c1f3583e5c593da2894c1e942e642306922dc2cc35a4926063ca9af85c2ce5c894f062f3e326e9675afea57fa5c4d3db366d587af63f72aba62e0fdbd7e319daad34259d3da88d6f2b5af8f3811c3d596aa88826becace38071c39c4d5812c38201185e0439e0039fa78b0cd46978322f7717bff7a899e5caf1dfb3c2a3dd61f8d7af9637e3e91cad086e2c1f6129a8ae58b0da343c07b9fe26d91b02b1ce7f239c604976ee76063cb9e49b47221c1e138514f0dad46a76719c6dd1f84a4f5ab3b8f2e3830fc455e2c3f15a64fb9993999c2758f12fdc2ae9c93dfd7b498d8308a4718bc3507c1d7f3e2d9ea08d451bc8adde2e13d12e795caedaaa9e667f4c5ef90a7c984d8fc4ae4c8f7908ca328c898aa8897d2db2e7d60fa70f95e3bf7b8447a47fc62ae7c71a9a27a7c6327a5032b8088cc89f2e463302c9370ab9161ccb4340e1900b0226047c46cdf4dc124fa7b6ec3d7aae1295d0b1e52ec6244491c531db86e2894ec3dc4f3f218de558f416064170a1572170e438eefb94f377fdfbe37d67391adbdb37584a84f08e546e20af3631ed7b72419b1c05216dac86c41b324a3abad639987115e831f15ce6b20d181c20668997ef44ca80788984ad8efc3d53d30918c3e4920edcdd22427857aab536272b476e9bc3a3e9d57e31bec99a637dbd2e317abad13cd5a9b5b913dc8f68db36dfccaf791dc354f1a445631a36f2b24dd038409d3b5ed97650409aed793886c1cd3cd947c6b55ca1ab9c5c8fc35348a0e168cdc054410e31bb11151737266efb855d33cd73cf7793b17cd7d6e2cb3fa86c7108ce151f46470a99a8d74ea793517c19b9c5f608b9491fa60e451b4ac48936138b2ae9e3895c6248e7645eb4da3074a1f37844fc6c18ee55085b8d1b5abbdab9bd133aba24812bca062083f8a55cd1d88ba724f3f538c1ba5b33e7c9f3db15cf21e71eab86975e308cd103845dbaa3b2735f537b14ec931d551a92afe0032571495c92674a9381110e48dc3738b91f8542981a7801c18d834e5f2cf35cd1c99e59af2f65fb555d3979ae7bb73e488beaf10597e9f11ee57bf856ab6b794c880982baa62d7ba1b1d3672792733bfa615b396aa3b790dc1dd317073e33f0e5448cd4dce63518ce6d4dd8e769db60ed90e83f767fc7f14ab9f1cf34c767b62e279a7a5c691f746c45d5b2e6e46621a557d6c68299c502ead3f051fb78bd6297205d49831254e952b02129dd0b86649523f0d411e478e18ecedf7cf977a797daaaeb88bae68b9bb4cf27679ee44d3d499247123ce944992787aa9671d1344e7c5b3fad2aa62f878fc8c6185052c055b55db5f4224798d5f1c985ad1a63eb9d8e8a7663751103740760e580bc9a9bb1ced39ea9cee9da44e1266b37e39f1fc42ae99af9fc934cdc99a63535f52e9a375563a411c2a1a27485e230244b613d083c38d0c1a832d6dca2ea926486332c389c6d497632a5e46892252c5e18964c89c3d041831b06deff007cf973d53b17cf97b7d92ae9c9171744545c4fa736a62269ea2ae89c4166b612aaa03ec25c40322c7e7793ff004f835319649f9d98d0b6d61c3678ec24e2922f0fb7fa7c54d70a0d39591379a2462ca3c88878cb13a88aeb520f076a2c14911b1a3cda98e1a62f965aca4904e111691f3e39f1fc32ae7c73df97c91336a7abc652dfd6ce18abf165ce350e70dca49355cb8c63359263dd4d0467bde67d7f0fcb94d83c3b0e32a22353d1f967cb92ae6dcd1336e988baf6a792fd82fbe266b8a9a679afadc4d71d65ce15b08a3673291a21d8cb35bd8460b63879de47ea028a678daee2d08053b87ddfd3f3b82b402ce1dad4850dfec68118b92786d8a87a79c1c8e256634af663669d31679b273de66448c49468119b0e2f24f827b7e13db3db3db3c9d9e68beebeaf1a46fab3851cd5a6cb78be32bf85e5be359cb98088cb2e25311dfbb20b59c3663642ac890bd45f75f35e4decf67735f6ff00cfacaba6699a22e7c93455cf7c5f35f57882f508d004872c6e1e8edadb5aa3d73b872ed1a9cb89ad7c49aa61f871f2953c319d167824ae00cea6b09f2165ccac91e1a5729266c709cae397862a54cfc77b2f92f2d8d7b4f5718b84a35cfd1646368fe98b185187bb3767be7bfe11573444cf6c5cf6c4f74f35f5ac22b6643971c912470cd8f8397cac2c61409920e5905ade1c912120c08f099eaafcbd9d8bec9edcddcb766ecf967bfaded9ff00af7c6e371cbaf2f6f51ee6b197b7cf90e089e72d2540eb998708ce2bfa85804e1ab953e713daac5653c2eabb9c48c291796fc3fe1435b2bc547e203635aae5c824eac3315811ce96e945e1da759a463518de49f16fc73d979af9afbf3f7fc26b8df2cf6cf667b2792afcbec7896afc6032b7890b1c5657f2a5e044f31296885113d75f345fedf26f9767bafcb9fcbd74f97b6397e977c7df3fefd49320518375705b07844f39692a475e1e64634a3b7824ad9b14049f258c41b39dc4776b57359610cba53dac82b8e6e11aef2b18fe12756ce147833259253e8699f35ec6a31bcd7e1cfcd337679af67be7b7e0d7d91134f655f75f97be226abf65c4144e211cd563abeaa5ce5aaab0578fec1decbcd535cd55337679ae279f3f97d82a22e7c71c98d5f5ad6c835c1b3b03581c0279cb4554dae0f648332386ca692d27428cd8a1ed2a16a665f58b2c6454407d84b1b1a31f1947d93b2829166631a8c6f67bb517b7df9af9e7b7e155b9ef8be59ef9f2fb5563557ec9dedef88baf6fcb9fcbd65cf75dbe69e4bee9f1cd3eaf52eaf8715a73124120c23cd2d4d502bd9d847b44cbdb37d8c997064c3ca89bd76e15e831a9a5c8240b576e4f34bb908c8ed4573a86024083969007631eab86d046f6ee54cf7c45e6bec9ed9eff008472e2266dc45c54d79226bf8a5cf7c45d79bbdb97cbd7f355cf34c54d73d97dfd439871c5757cf97ca9e84d3323471461763dc8c6df5b3ac8bc3d4c91593a28e6469f0cd5b2a0c84931c8d47b387a47e9d6dc434ed922aeb1f0c290671cdc2756bbbd354cf7c45e4ef8e7be7b7e0d57979ae26a98a98dcd35fc62f967be22ebc9ded9f2f5ddecdc6e2f9226aa9efeaf1359ba5caca1a04d3b555113882e9d2dfc374de1d39710d7f8e85466564acb885d56d6df8bf4d9a74932f87ea167951344f51533e588ecf972f6fc23b3dc78f5cfab113f1da69cb7267cb3e5f60be688be6a9ae6dd57df13cbd52ff73846104efed9071c715ddc12c5fc3d46804ecb06781b945dc932c820c72eaea3a67cf7886c08fd654cd73cd7f0cec6e2a63533e5f905cd73dfec9531171313cbd6b50f42cb87a7a409dd967640af1ce9b2ade5d152360f77190b6583e599c06b55cea8e1b5d5ad46a7e61c9a66baa7cbfc19511713cbd7e3185e59c316e8666148c132d38904368c732da5d4d482bdbddc6e89b3387a245640fcded4ff001730da615cd496b8a8ba28af6c0639120b25f5e209e5c48c18a1efe3192d2cdce14d7f45ff00e2646348c9dc3027a9e8ec02efd367639aad7525f3a2204ac30fb1ee6b1b73c44b8be6a0090e5ad8c90e0fff0017b8a91580a7433c22c29b221121f1401cd6ded72a13882b9992b8a988936c654d5c870cf30b4d522ae1ff00f19951852833f860ccc9314f15dce2d4cd9590b8593238071c5ffc71ec6bda4a6af22b68eb9b8185183fff001aff00ffc4003011000103020503040202020301010000000100021103120410202131134151223032501440426152602333710580ffda0008010301013f01ff007314dc780861ea1ec8613c95f87fdafc4fed1c21f28e19e110473a4349e1741fe1742a785d17f85d27f85c7df3185fb04cc20fe49942380ba251a5b265bdd18b948f191d91683ca76198784fa0e62a741cf4cc3b1bca03c28444201422c9e53f0cd3c2a941ccfba6532fe1370e1bf254c7f884d6b7b646a784492b829c819c9dc2ec80d9464333c26f1a0855b0e396fdc53a176e552a5e1581a151e117dbc2baecc894d2a238572b97643222570819c8e8952a2772aad2b84f7fb6a547bb952a5dca73bb04f7ec9864644da76572b86447741d94e971436cc739353b65bf2a6545c1626947ac7da61e87f272731c3d499567629e7784553d822f4d176e512a015f1ca1465191d8cab9009c13723ce4602713080ee8093393db3b14f6da63eca8d3bdc9913ba7f655403c2e794e6eca65421c27208f3912a1465399952534e55b12d66c9d8ba8ee10af53ca6e267e498ebb32b16ddc3beca953b042e90846e66c5074270ee9e64260950b7080f390e728cab62833609d88a8feea5de536bbdaa96243b62a722d589afd31039404f3a295534ca63c3848cdcd0ed8a7e15a7e29ec2c307ebf0edb9ea90de727194e6a0e84ddca6edb68714d19e2abd82072809d387ad3e972b51f4f29eeea3a7561aa5a6d43208a7d30e10555a4699faec2b21b2ad745c10ab223294764394e081cf939b8c27bba8e9d787ab7b5629d14ca6eba4eb9b3938c201484f6070829ec2c307ea402784dc338f2860c21836f856da2130823655441d913b20d4ee332d95b8504a19e2dd6b0a6ebc33ad7c2c67fd69aaad525d0130969b5da7087d390df7455a86e1629922efa8a74cd430a8d00384298199202ba384edd0dc29216e53b6f631bf04dc9eeb04aa6f7bca6bae1983065627d54a5353c414d71b869c1f74537227c20213c4ec88831f4f86a5000cc9845fe3433329a75e307fc69bc6589f8a6b8b4c858774b8e802fa5086c6156a376e152a2665da70413b944785050119158810f3f4d4db73804db86e136a83ca73a113394e6363993e1010895281572b972ab36e6109b93db7084e696982b0cdfe5a283658163295aeb903aa930b58a674958af9fd2b283dea9e1c30caa5f155180a1e1130a2516a07b1c9c149507ba0211402ee9c7b2021422df1956674df9900e868b8c2a0202c4510f0aa53752742067461a8dee9445ad84df1a4ac57cfe8c09d82a3870dddc9b4bca2c11b2a47684e29be51dcc6644a69d6537ce8003b6589a1788436d8eac2d393721e96a6bbcaaf41ae1baa984737e3baf5379424f0151c2b9ff0024ca629844caefa4aaceb9e7df6b1cee02731cde7f4e851b449e53191ce5c220306c9c5043944c2bb23b6faca195c83b2a8e90b1385bb71caddbb1572952a930d530150a5604f74ed93ced085a42e930ae9b02b80e113393b4d47409f7e951350ff49ac0d109ec0e10554658e8fd1c353b8dc5526f7d0f3ba3b9c8ec65728f08708a6f8d47954df24828f09aa32e4a90ee555c28a89f813d97e13d53ff00e7ff0092a745ac09cff19bb5bb22ae5722157a5d33b7b8c617f09b84f25300688086ea2ddca7d16bcc955a8f4f7edfa14190d010db4b79cedf0a09e733b6fa9aaabba556eec534c856f85242bd37ce41e42ea2ea05d444ce8225415255cae572b913391dca0a15ab12d967b74691a8532986880a1426bed5cee72aad969f7da24c2a700eea7c66e30321b15c6a29ba1dc26ac63258b0b5edf41d64ab4a82aef3ecc28c894068ae6187dbc336183477c8025621e18df7e87cc2634397448f89573dbca158774e75d938206571a9ba4b7c270b8414ca24d4b50c5343ed41c0e8250119f2be2819f667562a6cf6f0e65832ef96d3babd83845e4aad4ee6c7bf47e6130b87c575bc842a34aa8042b50d8c6476df2e34133ec573634908854b10ea7ff8a9566d4e322613477d44470819d32a5465df2254f85b8551b708f6f08ef4c6472390612ab90c1efd2f98547be46934a702d40ca76636db2e32994047b15197084e6c1828b5617d0d73d53c611f34caaca9c1539930b740ce4cca55ca0951a1bce4ee14ec8ee17655db6bfdac3522c1be739757fa5531368dd56afd4f7c18545d917008b9050a322250729513a242b95c56eb75badd626948b865505b4437cab5709b5ea3782998c7cc14fc4b69bad2862699eebaecf2baec1dd0aed718051c4b5a613b17e027577bbbac29f5eae0e76e4de155a5d409cd2d3075804ec150c3dbb9e753de1a24aa953a867dd0250a0f3d93708e3ca1836f74d6dbc2dd4672a738956e8b540cc98406642ab421e23bac51f5c68a2d97855f7a87451d9e155f99ce9bad70286972067329bc2a5cac4e1ae1213816983a69e1dcee553a219c67571018998bff0020bf2d89d8cf09f51cfe7dec3d0809d68d867720678563942851ee130b829b3ce82157616ba4e8c28f51289933a19f20abff00d874537c8d9491cab90339911c2b95c173934c3b2ad443d3985860a0d2784cc2b8f2a9e1dac5193ea06f2aae24bb66fe961e9dce95203764fa81a24a7630764712f28b9c792b0e1c1a135f7692610769261012ad08b5421e134397a94940ce552987882aa5234f9ce96d4dc748e5627e7a30865b9fc50339c28ceabad692a8d70f6e4580f28300cdf55ace53f173f14e71773fa4d6dc602c35214daaa18dd56a9d47674597bd526c09560994ed8e5705b941a8840e87644c2213b74d1a0f39b9a0aab852376e4ef4d11fdeac4f63a30ce890ae84d74e5f13af13f02a9bcb0c854aa878db294faed672aa629c7e2b9fd4c252fe453eaf60b135276d1836f273a83be503411dd03399e5130b708f956ceead5057a94141b1a6a526bb955e992006f65c69adf069c834bb84cc29fe49b483785086dbabd0df739930ae57658b3e98c9ae2d3217e53d3aa39dc9fd6a6cbca6ec11e24a7bae33a3063d23374119ca9cf8399e56e3744ef286fbfb6e086e9cc0794ec2b4f08e11de57e23bcafc3fed1a00b434f64cc3b022d8c8b655a0226535ba06f9c42c59f547ebb58e7708d078ecba2ff0a852b46eb958b7c0b74e1a5ac0a6a397489e4ae804363197756a821033937c225402b71b21b2b95c14853aa55c1492808c86db683c26f0889536e4f4d6e6d4ec8985054caae65e7f5a850bf72994005d36a20314dd96226fdf4d01b374566ff24374e5d9072764ef2bba88424f39c2b42b55aad56ab55aad0a06822537329bc6477d9410ad27740f9cfba76479caabad693faf876003273fc68ad445409ec2c307461cecd44c2eb842b356ce08083694421b1444ab7226760a36513cfb7255dabf9686e476339b90c9dce4df09ca7658b7ff001429b8f013985bcfeae18cb53dddb554a61e374f65860e78574b572d5478458d2bfeb72ac3f92f984e6f95b8572dca023d890ae0ae0ae19c4af8e826137ce81ce71193b8438c9e827795c8404f0861f7928b5a16269dcdfd46ee553f4b6757745628faf3c33e1d0a9191099e97c27b9c0ecb7a8edd38488544ed08894591c65ceb927856ab4280a142b7c207382385256eadd279d2edf6cdd915fd26c3394eabe14a7891fab4b14221c8540ee34855f1166c3944cef9830a8d59172a8d9f504daa0f28d46a35bc2a20ce65a1c8d344469f9677693e7db729cae0a4940466e529f88604719e0238a794caaeb81250455410f23f569bec74a6b811b68af54d31b2e74d0ab61dd527f6469b4ae9350681c67ca90722251119b901193bc28511a1c9bc693b2b046da6d56ab74b9d1baab58bff00f3404d456207fc87f59955cce137167b84d7870db2c63b7035e1eb7f172a752763a39c9c2d3704d70766e678cb9398e729ec570745312888eeb6f2806f945ed6fc555ae18a9560776a241e3da73a3955ab5fb0e35372c50f57ec35ee6f0bf25e892773ec51c47f17a655f28195ce8736cdc20f0727ddc840b5e98d9dd4650470ae286e65384a6ee853f280013a5ae30aa62434c357e5bbc2fcbfe93b14e3c226535c5a642a78a07e483a54e9952aa576b154aaea9ceb6658c1c1fa3a75dcc54eb877050ade5755aba8d46b0ecaa55ff228e2c4f0998969e0a158a267854de1bb15b15685d30ba6174c2b426fa5f193aa01c2c4623b0f61af73784dc59ee8629857e433caebb3ca38960ee8e2c7609d5deef659c2958b1e9fa56d67b7ba18b7770bf33fa4ec53cf08b8bb9cc3dcde0aeb3fca6621ed4cc534ff0049b5a785d65d60baa11ac9f577929f8b6ffea7e21cee3f669f0a1623761fb0a025e131a2d58a774c7a57e4d446b3cf7fdca3f1196208b4fd860dbb939635db7ef5274530554c53ddfd2a98a6b53b14f3c2c20925c7ebb0cd860cb16781fbd873e80b126993e955d96e5841e8529eeb05c551abd412abd734cc0546a1a8d93f4155d6b553af3b3b5b45c61304045624cbff0079f5a1b04aad8871f8a69eb53fec2a742edcf0a91696fa3854cdf5e4ac5ba1b6ac3556b59baa8eeb3d345a207d0624f6ca8bae6eac3365f28272a8eb9c4feed4ba3d29c4cee8618387a916bb0ceb870ab573536eca9623a6cb5071064273cb8c9513c2a141c1d71fa179ea3e02fc63e5516164ceac237d33954303f7dcc0ee72c59f466cc33dc998468f926b0378fa1aafb1b2b06393956d9b21755de5502e7728e19e11691ce5876c30658930c3fbf5aaff0010bf29cdd93ea3aa954f084fc9329b59c7d2626a5ce8546af4dd285561eeb1358116372c0d1e02856a23c21215c5629fb01f40cc317993c26526b38fa5af53a6dcad312a8068a65ee0aea0fecba14c9d9cb08f63667227b0404645627e7fbeca1064fd370ab55ea3a72c3baea61621b14cc654e5c6d4d16884317e42a75987ba2f572bf6dd5475ce27fd17155bf80c8611a5ab0f732a5a9cdb84145a66d5428f4c49e740711c2eb3d39ee773fe8b5eaf4c7f79e16b7f02ac1376429343aeff004cab4c5410a2d7414ea4c78854b0c43f7e07fa8631b0e9585badf57fa8900f3ffe88ffc4002b1100020200060104020301000300000000000102110310122021314130405051133204224260236180ffda0008010201013f01ff00b3a34b341a0d06934bdfa59a594caf9fa349691f90fc839335335335b14c524cd28684acd26a48fc88fc88fc87e435a6526355f354691ca8726f6acd1e4d4d0b13ecd68949bcd0ca284c589f635f3090e4a239363dcf2a28f3b3bce2aca59b82638d0a5477f2c91295759bca8a2b245651858a291487a4623bdb6d0b119a931c7e884a892f948a1c8ac90f2651677959057ce4f13e86dbca8b10f6a1975941daaf934ac9ba592792c964b6463639288e4d94cd0ca79d0cec8c28e11a8e071f39c5d325f25d21cacef2593cb82f2796aa5484ac50a1ba351a994a438d6498a34375b13a251f2b6692be3e3d988f8cef263d8879c55127b53be07c10e46eb7446a988c46465426a4355f1d126f9a1ad9e04359f59e1af23e37bfec88744b7cfabc90c427a97c5e934a3fa89af0493108b167671b61d13df1ca5d98382946d938a92d51dbdc7279589d325f10958da88e6dec6db165d9d0bd044b2c386b9518b878705d138e975b6641dc5138ad2f6ae843c9650e57c47eabd079a1ef5d12ef2fe2fee4e0a6a99fc982515b112e8c0c7d3fd6463e3aaa8edf19d97961f64bbf8644fe8ad95b921918d9a122515e0a2b28744b284b44ac8c9495a3f953bfebb2e964d56e7c2add0ec977f0b42893ecb1e5d165648e0b2c4ad9297842e6222f2b203e734daeb6e27d109783b1aad8bec6ed8f6c3b25f08a239fd0a4ecc4c9ed7b6eb2c3e87f5b13a13b1add1fb1bbca33fbcb4a349544a57978db863efd7a2bd9a544a579b9588678cab25bf0c9f79515941d09d8e2696514cd24e5e1668ba35b35b2ef35b63c2f5d2b253f088cbc31fb18a3125e36f8d88793dd0e09ab5932f34e853fb2f2724873fad8b7ace8a212f0c6abd4ab34128bae06a84ac75e46bd874b73cef62f4271a2ce0a1fa48e0e0a28a284b248946b2b1f2bd34ac73ae8726c4da1ad5c9aab85941df1ec27d7acf621907c0d0d56ea2cb2bd48c6c72d3c2d8b88fa72e239571797f8ce2a95faebb311967056687bdedb2193564a15b10decefd14ac514bb1cfeb6225e9cbacbfce495c4d0ce109ea5ebaecc428acaf35bbade9d17e44ef2942fa1aac9ee5b945b34a5d8e7f45d9e36c795e9f71c972ab2c3ce1c2bf5d76626567792cdecebd183f0742966e23832b3e0793c9418b0fecd515d0e6f63c9670ec97a5faae724e8d29f24691f8cd097637ec27d65a59a1951f25c5747e4c91451d6ca28a38383810f9e72ba46a2f3d28d28d112a228c4e0d45911edf19de5e47e8f111bbcaab38c7cb1bbf5a99a4fea6b46bfa1cde546867e31aacef6597be32a1a25b10dec5d8f344fbdab62193e84f56e4872aeb24ac4944bbeca896974377eb37a51a9e54cd0cd1f67f546a5e11ad9a9fb284bc125b23b50fbd93dd6514759771c93d59e93524393650a1f65fd7b24376c8c576cb4ba353cbc724a35b68addd16597970719565195f0c6ab35d6e96c7fafa6bf524af9596b35b2ecab143ecbaebda4df822ac6ef344df8353aace8e8bc9ec5b10def8cfecafacbc6e96c428128d7a3fe44c71be5142833425d97f5ed7a567674ab6476dec5b3c6db3838382f627426a435b9e7a4b487223caadd45652cf517ed9224c82dbfe7756f5eb22da14d3eca4cd26934947f5439fd0e4dfa70e592f6f4696533f55974b6ff009382cb1e5e0bcab27b28a28af428a1bcbb2d96f37e83164965044bbf6c90e7f46a65b2c8f64b6bfd762c96542c96fb2cb2cb2cb2cbdaf63cecb2b3f02c965d2f6f3fadc9df0f6bfd72a2b27b2f25eaf056ef1b1ed59ac9888c6d926515ed67be32be1ec8f593cbb16caf4e8a2b677b5ec79de48792c965fa8e6873627a97b5c4ddd448ab64b38b311739f593f4e8b2cbcacb1ece0e0bdbe36acd64909244ae47e36495187ed5d4bb346d92e91faed7fd908a28a1fa5d675b57a6b3a28bcd0b0fecb48d46a2f9313b21d8fdaa64a3b2f745d138f92cbdb5b966b2ef621ed516f75965ed8c686ef6e27647b25dfb64e8d44a3e5143eb7c59287d6e8bb54c6ab6f8cfc67dec628b66866962831ba1a521c6bd1ab231ae58ddeec41764bdc59a9fa2a44a1f456d4f570c716b28d791c687b2b243ce0acd46b359ab3d57d8e17d0e0d6d49b161fd9c446ef7e2652f834e8e18f0fe8d0cd0c58624a26a3867e3425f64a1f457a1187d8dd70bd0b35168fea7f52d1a8bf47132ff003f0b6cd46a356cb2d9a8b4cd099f8cfc6cfc6cfc66948e10e5ee71325fafc847b24f913e2cd4cbf793eb28febf211fbcbfcfbe97ea244705b23811463f14be39f11ca5efa5fa88c396acbf90ff00b14456a74624343a30b094d5b3122a2e97c061ab64f0bebd0c4fa23d92efdf24e5c187829763ff00c73ffd13c5aebb2777fd89ad38660479b31a0dcb8231fc711bbe7e030579cb1234f744972cc3ec7ef61a6ffb0abc0f19a7c0a4b19518784a24f0754ac6935428a5d1662e2aaa5f0315a23c9f99189252eb72e1650ebdfa9359607ed9cb1a28963b7d0e4e5dfc0e1c754a8fe478cb0ff63447e8c5497469ce5fae4bf5f7f8787e58f013e48c54113c74ba25372efe130614acc486b43849783070ebfb3cb16572149a3f21ad1295e4faf8096328929b977f0b850d4f2b462db928a2b123e4fc93f287b63d92efdfcb16f85f0f870d2b2c5552305dcf9ca5c2b1bb766a2a2cd06864615c8ffe17030ffd3cbf3c93316a50b13a765f1662e26adb65ff00c2e14353cf1b0ffd2353aac9cdb55ff1909e865dab429ca2c9e35c78ff0090fe3be28c6d37c7fc8dff00f447ffc4004810000102030308070702040407000203000100020311211231510410202232416171132330425281913340506272a1b1c1d11460829224a2e1f0344353637073f105938090b2ffda0008010100063f02ff00f91bad1a18e6e0a91e11fea0a84155700b6dbeaa87ff000cebe510e780aad5e91fc9ab532771e6e92ea990e1fdd131a2b9de7a545d5c788de4e5ace644fa9abaf81e6c28064501c7baea7653710005edc38fcb55a90e2bbecb5725ff003ffa2ae4bfe7ff0045ad93bc7272ab630f25b31bfb57fcc1fd2bdb4b9b4aea634379c01fe513f0cb4f7068c4ab30818cee172eaec421c04d75b19eee673eab49f253731c3985667655621f441cd71359555971374e8bfe62effaaa39cb5628f30a803c7caa4e041c0e6eae292df0baa175d01a7e9324007f46ff000bf44cde1f13c0c5d435b047a95d7457bf99d3d93e8ae39fab8ef1c2734065109b10622850e8e249fe0750ff0026f0470f854cd022cc8b59fe3dcad4788e79e39b625cd758ff00ed5b13e6b558d1e598b77ee40dc5a5074e60a8921ba69bc69a4fe3250cd993a578565d5c08ce1b3e921784fe8875a21bbc2fa2abedbf73595445b30e1781b9f561996268bac88d1caaab69de6bd90f55ec5a9861b6408513eacfacd69e6156101ca8ba97cb8396b3263115cc05ae921f85c8063acc4f03b42bfc8dc02e0a977c22d453642964f05cee2ea2b311f661f81b40a8a714d9186f5a8dae3a1455545d20b9ff009461baf65dc948ae2c726bdb71d163f112567c2543e4acbda1c266f5380647c255988d91d00e89a8dfba9b5b3762ed286ec0a8ade474e65b65d8b55a1aecc4298bc2b196cdedf18bd073082d37119b82a7c22b4f7ca0cf21f0625ce0d18956324fee2ad459b8e33535c50d5d7c7428aba0e66fdc9aef22a62e5d337939744f3269bb467e129ccdce0a1722bfab349ed0e1c55039bc8ab6c25ccdfc1022f0acc5935f8e3a6ee122a5e219a6f706f32ab1479557b51e8b51cd7723a05d085889f62acc46c8a1666e83bd8ad4175a6ae0a9f0696e5268550a873528556ff77e0a972985c14c7c16c0d68b80dca6f333b860a66f537ea0fba885a2b2bca60e39acbaf5255d3e95bb2fbf9ae88dedbb9220dc54c5619b8a0c8d70ef2b4c3319de1c6a6e439150c704de6744bb27fed5237ab112b0ff00081171d18a3e529af6d64a40860f954c999cf4403fac6f1bd49a64ec0e7eb45d770561d71b9d8ae9a1d41a3db8a6c48668570f82d14867bb352f5c571f75a7a6695ca4a87d5480f8218191905fde7f85124da79c54879953da762733943e6a8aaacb9574dcc76f583da535eddea4e00845d00ff495df867d17b4fb2ac53e54530d7bb8945ce3379fb2fa44942e53d2c1fe2458fbc2e85dcdba2e86d04327b237e69884f23e95586f1e5a3308363eb37c5bd070336e2a88b1e3555876c9b8a9c3d784769883986d0371f8252e521a74bd715c7dcf866e39ab7aa7c11d93646ea77e20fc0526dead3a8cc55960905ad45bd6a9de892364685972eb5f25ab11beba56d9ed1bf753eef782b4c3319eb0d9e8b55ad1c82b4f7068e28880267c451738d4a0044320bdafd82da07985d6c3f36a2619bb3b3c52aa0e6de15a6f98d17f1aa87989700658a0ddee2bab739a7d56a597ab2f690702a713d14e1fa290bc5e305445ae9cf1c13a1c41ac37ae8633bab8974f71f81cb7290cf52af2ab51a14bd60571f71aae0a79e97fc13f87c89d4b9d13f65217ae922ecfe5485029e76288fe43429579b9789e56b4370f25a8f737915b41dcc2eb592e2d56a1ba633989076b7b715a9e60a01fa8ee372a19e62d6ebc4c15a887fd3424d049e0a4e041e29b11ef719e08884253cc5ee53bdee283a1edb0578a9f70dea63421bb1124460ecce6e2249aef099a0e6198399b14e124f0e171be68f46ff272b55644c5747169102a5ead37da36ee39acc4338b0e878fc064a433cf425a13de81f70c02c5092e0a887c0c9719009d072732818ef726a6ba530a428ec33055cd0fcd44e79cb89a0533bd060da37e6d6683cc2d89725382eb5c0aef31e1588b47eee39f5c6b621757aed5ece20f25649768756c254e39b4ec05ca4c6868e099106fa15d0bcfd39b5dd5c16b79342b6f1d61fb66d5d9350ac9bd94d06bb029ccdce19edc2ef1d6418cb82ad134f1516775170441136f141cc2e86e1e155bf374ac1aaebf9a6c41b37387041cda83f00f24731d119ef0b82e5dbf25c33c8290f827f0b09c6c376f89c3374918537044b287055a108322ff0072ae76724462e5219833c489036734d84833dcb58db18141edb8e675b139050bea1a326fb475dc14cd4e6b30db68a0e8e6d1f0ee5202433963c50a3313678829748f97d4b51b3189569dacff00c67b5e1280f109683d87784d7784a98bb36d0f5568aa5c996b7a8a796693741f0cef45ae12217424f590bf1f00e281d3e4a415cae521dbf05239a4148203e091224f5ee6f353352adbc6a0fbe7ad0e2acbc7faa6c2887e972ad15e9b2a9927636b3cb7c9171bdcecd27b438714ce8c489bd44c279a29e0a1fae817bbcb8a2f79993983a36a370deacc368034f61be998bdde98ad68625cd6b4d9cd45b0f6bb577150bea1a137100714f30764a686748d662e36429c6caabca6bfe20cfe94440ca072d9566336259c4898f54d0e0072531de35543a4220b9ea1f85fa87e0206798cfaaa43d73c87b8528a454bd33487c10b9c64054954f62dd81fae66c37d25bd52a8494cab2f1fe88b1f7ae8de75c7dc2b943960881e2cd4bd3b8809bc09cc5ce320139fbb72634df79cd677b8a73b06e799b9123606ca9431e681203a2639fac7b42a5b7792f647d55613bd556d37985d5bdaecfd636d2d4b4c5a8e6bbecbac611c5070bc20d7eac4fce6d6abb73553646fee843543e278dd9aab5571555368e8e26e7355914c08b8a95d1378d274af6eb298bd438adef0f804f46e521ee77fd957348ae3f05fe0e1efabcfe998b9c481b956adc42d4f452b8ef0a6dcd2ef0a85314734a6c41bd435102a5f98461dda146969a772d87a94acb3042344d9ee8c7386f8422f3de39fa06f372b6fa43fca0d689019a6f35c02b10416cf736a55aca22087c2f2b583e27d4549b9342fed9ad6c9e17f6c96a17c33c0a2ec9ded8a30b8ab114174b73ef5ab47784e84889845f06acc30cd65edb67719a2e884d8bdeefd10643686b46e19a8af0aaa62fcd44e87105a6baf9ae9219260ce87785d1c4f683efa4f6f84c9744c6b1cc9ceabaf82e6f1699ab5022070f7ee0b869c87b852a5542985c3e0cf8afd9689a7c57ed38cd359ea835a240669c3d577d949e0b4ab31f67c4adc3acfef98456efa14611b9d50a7819ab1bde34270cd8fc2f68c929ba6f3c6ecf54e7788a6b30199ce02640b918b95de7baa42ecdd1c1917ef382b712d085bde77ab30592c4ef39aba3663b01c0ef0ba48569f06fb42f6f356729fee548ad5aaf69e473ba2b355c2fe29b0997bbec9b0a18935ab82a2c7370cd319dcc882d34de16a4fa27558e5aded05fa31bea39c3e138b5c3785d165ae022775f8fbf705c338cd21ee071cc5504fe0ec85be23bec331887bd7679ab2f130ad6d43c548eb423bb042242330539877ac0b4ab23bc14ced35c8385c6bd859defa26e0dae97450ceb9bc8dcadbe905a6bc7820d689345c0764eca3251a97b99872cd32080b55ee1c8adab438a0c9068df2de8c776d44bb9660891982b8afbe8ba144df71c0a93b6e199118a0f619839c93705c5ce527004715a83a3770445f2de3308594cdf071ded41f0dc1cd3711efbc170cdc1487b8145533487c1ec34cdb0c59f3ccd6e034646a1749086a6f18291ac237841c08334e0cdf555bda64ad8b9ff95d0baf177614d96d02b46f7d745cf3bae4193d679a9c1361431aadecea847802505d78f0942044d93b2b5a1b3d139d648909d0a870877dd24d63049ad12014d0e79b155b948698cad9bb55ff00ba7413cc677747be879269eeb2b9ba287b46f382aec36f5360e8dfc2e45af122178e09bd89b1219b4c75c7df782bd49bee5c3f0aab8fc1e2c5ded14e6a66fcd43318154a1c14f47a460eacfd974512e3b2a1fd2a29e28b1de5c1785ed2a636b78d2201d7750200ec8a9d2b00eab3f28c778d789772ed4b1e2d34d0829d0f75ec3c1576db429df3515bf0367a1c51521d83e13f65c24b07c3726b9b7113d0937da1b9591571bca0c60a0cd65db5b8e0ac4412284388eff0eebf87154f7dbbdd29f0885938bceb9cce7bea0511742a8c14c5ebe6178cce7bae0b5e1d38156a19984e63ae29cc3b94076fb35440bc3ab9a6da441f7531aaf0a4756261a05ef3445c6f370523b66fd17443b82643def72005c3b6716edc2d60838ec9a1509a2e95a5943f881a3bbb26c417446fdc203c0659dcf76e55db75cacf7fbd9b5dd5c0293996598aa51e2e2883785fc2c4da60d5388fe55eb23c36f372f6f3e4d2a9d29e4d5a90221e6648c62db3490135209bc6b9ba460fa935dddb8e66c21cca7186276577981bb59a1bf1a28a7bcc91f24e678867d6a3bc416b369e20aa6d8f996b92c2bab9bdcad1da1dd1fa21122edee1869319e233462ca90dbf73fecfb83e18d83acde4996bba2ca71c5e73da3579d96a9f4b2e0020ccaeccbc7d94389bd8f5159889e7e8c6c37f2ba678a9d9cd62d10c22e0b51848c5073e52382309c6eab574ec14ef264585b4d50e2b2e709ff28f5d145af08a952c9614be67aeba33ddc274545486ef45b1f75ddf554683e6ac488c4e29ad7b2ea4c20e1bd19dc9cc3b8a13bdb44ff24c96f9cf3c3e6a2e1664a1f3968cd9d59e0b55cc2b59cd014db57f8b4c0f0b5447789fee10638ee9b2730fa8e77cb659ab9bab6b449969ae4613b6a1ddcbb1ca3809fdd43e34cce79dc9adc4d73b1d104cb6ecd126a1cb8a731d71124e63af0544c99c6a359bfc9e4b8c80de53a1645297fd4fd912e25ce2a6ed41c56b4ddcd6a340e5a120a4f130b51ce1c2f58666bfc4144679a1185d71561feccfd94d8e07929bde02065268b95a37bd3c8eebe7f7ede29e3250f893f94344b9e4068de51102182dc5dbd06476f464f7a74ec23b37d998f2520a231b593eff00243345facfe733a0079e8cee50e573f54f6394371867f0a0fd4337984391d1e81b7f793a26e025999146fa15062e06bcbf93a65745049101bfe65260f3541ad8e9482a2ae803839378d110e13054e06b0c15613fd15213fd15aca247e5cd179a847e51db45fa8a81e7f93a50e003f31cd0dae60d6139ef9a8990c674cb760f611a13773882b288788073c4c1dac33e4ff58ec621f94a85f50413d98a6bf03541cd330734ca2d8066ef160acf7bc5fba0c609019a20df78cd93bf7d991f2fe4dfe199b71054e010636f418dd2935574a2f29a63b03a6c898d0ae8bbcdeda2fd4543e04fe74a270a66e86303605c46e4e8f0e95167c931e2e709e9e5038cfeca1e0fd4ced7c3f68cdd88cfd31d987f9ec72977fdb2a1f3cee8d0eeef046cc8b4ee2a8d605d6389e0a6ed46f1418c14d088dc0a89077b1d3f5fe4d8cf9d27647208c437baed290bb154d37b7112ccc76227a4f9eeb9432dbe7db44e35511be17e93be616b42072d389c40fc26b9b78330a1c51de19cbe11e8e21f42baf735acf96a50870849a3b178f190d55be54d09c8b7e95df3e6b52189e3a4ee322a2b3167ebfc991629dc29cf3358e166424a6d331a1c3f3d9446f14df969a5d130ce47595beeb2b9eab6ed7d2b622294cb4fcdd831f8b53e16e88d9f98d26466f72879684169bece9bf9041fdd2649f9338d7699db4080376b941c2f09ae171ecd9f4a671047f264287e27a6b31531ac382d43256626a9d296d3f05aec696f05a8eae07458fc4493a11ef54684dee0d1c516c0a0f120c60aa0c1e6735a887fd5489933c2333ec16eae2bd9cf914e6c7165a2e9a2d803fa8ad688ef55ab11feaaaeb5cc2945160e3b94da66310adb6f619a83137075796916b84da68429b66609b8e19a6e07a26de71e1d8651cc0fb26b0ef134d70a3d85322b2e70ed093704e7f88c9a382658bb7a7423cc767081a3a542a0037eb7e0ff0025f5d198de04a82327717064e749227019aa24ec42ba631560cdd0d0734cc1cfd1c03cdca4c1cca161fd671b8ad605a771419947f76816f7af083851cd281b5e525a8c71e7454218382d625c502fd46f1bd4a1b6599cf7dc14eb835a83a300e89860a13f849451c066e8d87505fc4ab6fa43fcad586df4556b7d151b60e214c0b63829c3710ac3b55f8629e3bedbc7ea9867aecd57694889853e819e8a4d000c069d54578efbc941b8092e9182a2f56223ba87dfc0e39abd97f0cc3d644bf804629dd409ede144c7e06bd9c2e4a04ef1391f2fe492d69e9620dcdfdd101dd133067ef9e2634cf2eeefe28747711392e4ecdd13368de70521468bca0c60a0cc5af130ad0ac3c508714ea6e386874b084e7785eccf9d16b39ad5aef73beca50da0683608fa8ae99fb4ebb96627c266a5e21254da75020c1e6506b6e1a33d97e216b8a6e215b275b152341128e1faf6f1717ea04ce15ce623363f0ba0ca4ea775d8765d244e4d6e29cf75ee3327041adb86678dc6a133e5d5ec9a306a9f8584ff0023db8cf0c6f14e640261c1e1795ff73fff005feab51be6bad7127009861b655926f1a66b23cce67f0a26fcd54e79dca77bdc506b7cce3a05ae13057c86e2ba279d61b3d9f4afd802ec73c6fa542760e44f7451aad11acfd32d700422e87b3bc60a62f42d1eb59477eea5dab2034eac3a9e68bcdeecdc548856a10259f84d851f5a0e3bdaadc278737119aba24bdc0bfbacde54dd5c00b9aac8bf7953cd0dfe4a233cfb289c28b288983437f91ba48a79377956e29a6e6ee0a4d132ad46a9f0ae3f9ccf1e69a45e0cd48667bf0080bdce28345c28990f1aa7443ddbb49cc3e4a468f694d78dfdab99e212524d1dd153d91890b6778c1362b375e3109b16119b4aaf66f8a6fb9a312a53abaa4a0d170cf4bf36a6f132adc17399faa032a8641f1316a47679992d520aa9016bc76720668b72467f5b95b8a4d6f73b7ab2c55bb3bf85537e6a7625ceb85539c7799a6bb7c425defd6e33c31bc54990e23f8dca4f1121f122883e1b839a778f823a2c5dd70c518b16fdc300acb2f54abb79cff37e54b1565af6f138a13dd99b047329d10f76ecd2c1aa789d3e99b78da5d19d97fe7b68bf59510ef9f66f02e9adee82769bfaa6c48466d3d913b86f54f62dd81faa9bb6dda4fe144c6b80224b566de4b55ed3cd777d556cfaad778f25395a389cd5d07b71124d76067d8d9def3241adbcd143842e6340f7d7c58bb2d56a251a365a3720f8e4b41ee85d512d7274378b50e7accfd426c4619b5c263e04e7bcc9ad13251709f44da3020d6de5485fbce8c85ff9d07bf1344d0768d4e6e6026f9e6635ae70129d0a987bfd56b9b6de2ad333106e4e6e1720edf71ed1efc0224deac1b9f4f3ce5ce320111089633eea7ac56a3dc10644a44fce7a5ea21e2ad43ad2a14d9561da6156a0babbda6f1d817c4749a2f257450091007f9908b147219a674621f98a03866b95caecd554d288dc1c530e20760e69b9940996c8d4d60313efa62467596fe56fb3dc62e92348c4dc30ce233455b43c93f2579a01699fafc0bf84866b7bff006cd69db6efb68c866e3f9ccec5daa1306ebce78713fa53a11bef19a1bb11256625e4ce49858d9175f25139e7e906d33f0acbb65ff9ed18cf11cd0a26e7d5a535fbee3cf335be22897ecb3762a8b5c57108098b1e2cef7efdc98dc4e6b4dd57a6ca6d7ee2159ca1b322f7337f929c0881dc37e85510c3d2bf06ddea834ddb98d56e2d5d86699d23cfb68bcd42fa468d3388cddd4726bd864e69982b08cdda6fbdb8be3b263703542424c146354dd58a77e1a0e6ee92871a24ec09ce5c96c46f41fbab701f687e3dfe24575cc134f88f33738ccab4ed96e8c8679ae2a1b7cd4489fd39cb1d7152b9cd342acbb5627e5098bb3485cd1240f88cf3906e28b3d0a6bb7dc7b3b3e11250e36f2e51e1df120badb3f6561e751ff639ad0ee95adb0ea154d16c21cca7c53c867b3298dea709c5855a60a8f0af6d107d55fcaf68d3fd217b5972685ae62bc7cc68bad77905a8d92a76079f6d1142fa73d88675cfd9779c56cb82d588e5d6343b9514ad0af75cad33d9bbec991a1eebc62132232ad7098f77249900ac64603cf8cdcbae8ce3c3767d57996051045978dd9fa38479952689953e89c83e138b5c1088ddaef3703efccc99b7bb59dcb335bbf7e848680cce0369b4e699c6ba12750ee2b586af88294edb7072f67adcd068bcef4d68b80968088dbd9f8564ec3fb373b133461ef6b3f09d0fc6d5d23475712be6831c7ac6fdf31742169980dcb54d3c26e5d630b79556ac46f9d3339ceb8226f738a6330cd20b0cff00a2b86857b18a3e657870e216bc2f42ab6c792f6a3cd6ac461f3ec62f350be9199cf76e58bde506b8eb7dca63fc426b5e1b4a9c27cb815acc32c455165a3670cc19de866cfbb18919e1ad565b3640f0e3cd4a1b49538ee9f00a9059e617b267f6a2e81aaef0ee283b7b4dcad9326deba3820cbee54e36a0c37a94368198c5863ac17f14d69d98babfb7bf463b9a6c0f24dc05742434e24fc4501bf4b66c9f956ac53e61389369c748b775e1576db43d8bb176aa60dd7e66bbfe9bebc9186fbaf046e441a4486507b3d334cb64ec42eade0f35ad0cf3155a8e73791561ef9b51886e66690d2b95dda758c6bb9854696f22b5229f30b55cc2bd993caab598e1cc2a1217b57faaf6a57b4fb05ed3ec17b4fb05ed3ec17b52893529a3012cdd18d967e539cc6cdf702772acdf11c98c719903426f8609c55986355d704f837db6cfcc7babe2c4d9689a9ba8c1b2cc1076507fa42b2c01a3868b620efde9b081a0fb2d5abfc474592b9b147e7df62453731a4a24de5447f96790d119e28e3350ddc171ed4ba5accaab3b9c25d8b1bb83669f137ce5983c5cf1f750e66acd42ad4303a76ddc782d69d8347040b6a0e86bb5aee616c4b920c6290d290d689829f4847d3453111f6b789aa457faad693c715274d878a98bbb6a80556133fb57b267a2f6417b20bd905ec9abd933d1521b3d3339fbf773cd260e670526ed6f76942036ab550b91fc7bac3c9da6a759c8c670adcdd0a67867e64e3bed68cc950e5de8b3f2f7d8df349bf7cd61cd3cd756e04a90d29e76451c8a304f319b8f68e6e224a1bbe61d8b628dd428b626c3b7e0a614f7b0cd4682778b4331caa08a8db1faae8e2fb3c7054d190d2e8e1d5f8e0acb6a7795501eec4aa00ab0da7c96a5a6298d76f05a8698152d97e1eed3887cb142624d17056de650ff002835824d1a6e95cdd55162ee6365ebeeafe0d0142e59de45e68101e132cedfad3bebcf55446136ae379472b882f1267efefb099e27e6ea9d6b815664462ec56d4f9ad767a2a3c79e9b98eb8ac1ec2ad0a1de30cdc7b371c02863170ec48754156a1cdd0ff0a4d336e051646162625c132234d1a6bc4667c489b2d1329ee86c95a24d96ee565dad0f0c15a86e98cf21a5659ed0fd948549bcab2c1cce3a531a8fc4293a608b8ae8e36d6e38fb9cdc64159c9ebf329b8973901bca6b06e1a7386384f0ccc3de89ae7dd5fc5a141fa73b3ea4ff00af38fa93c7ccaecd37b959820b7f2b581078afe1231b86a1fd3df7273f314c0315219b664710b51e0f35561f25aae216b00e5af69a56a4469f3d09b7da0fba9ef17841ecb8e6e3d916f79f440ee6d7b39ec3b10b564f1c149c083c543aebb355c864d08cc36af96382e9e20eb625dc02e93260191778dce523698f178283766260a434ad1bf70c5789ee567bdbcf6058f145ad56ee28323d47894da663b79b88038a943eb0fd9758ef2537756de29c218a9d59ef281f0d7b0730f7849169bc5174476a119797bac289b9cc97a7ff005338533b4e0e4ffaf3c4e1546c8041c57b30bab0e97c814e33837ee5756df3de89035db50a1c51dc74d022e3ef90e57889fa1526799c5566de6b5483cb435da0aa4dab51ed3ce8b5e19fcad579960535e2e2279fa667f52e89db0e3e873f1ec09750045dbae0abb6ea9ed48ef0a8517a1efb65cb8a93eb0dbacfcf28ada8b9c2f0b1867fe60deace51ac3117a0e619b4e8173cc80568f9056dfed0fdbb22d789845f0f599f70b187bc20e69983da5a7b834715280c9f172eb1d3e0ad6c3712a72b4fc4e686cf3511fe5a337380e2b51ae77d96ac21e65588a009dd256c6cbff2835c7562eaf9eef758713c2f5119819e78a384d456f9e7735d7112421c4a80fb2552137ceba326efb9436785a07be1fa866d421caac72a3cf9ad6682afb278aa6808a051d7f34e844f119ea8b7bb785adb6dbf3f1d299320acb3d98fbae9626c8b863dbba4355d508d81d65ad754ce5ae0083b8ab79150f809fc2205a86f17852ca354f8829b08238299b949becc7dd08d12eee8ed44487b26f1827422788ec6ab6ad1f957560307aaa973ddeaa71751bf75a8dae2740f0010e249d0936462955b4f72eb0860f52b59ef29cdc0d1749de6d7f7408bc2851477db3f74ca060db5e8a5e212cf2372b2ed99d93a0eb388cf4cc5a0ebb935c46a42d63fa7bef278433eb3415aa4b56ac9cb56870283626a3fed9decde6e4d7e081171cf21b62a1076eb8a045c73f1d0b4f320a4290f056e2cc33f2a9db996d36a159799438baa74a258bdf12415ac9dc228c2e28cad31e2f055870006f96f5ac683762a9a64b8c805d534bb89a2d686d9735a864e1bb3c41c26a11f9b4a66e5b76be95d5300e254e23c95386c32c54e344f26ab30db2d289fef7285cb41fe4adf79d7e7644fe92a24176c9134e61ee94619ff0096ef7489d2993255281699d9342a79c466eea390871ee17395a619b710ad3afdc31409bdce9957e6d67b42ea85a2acb05b88e4218ab8d5c713efb1b848fdf303a27a46cd5a64dd0ff08428a69b8e7760ed609b8b7556b4460e654d8411c33088c1aaebf9ae85e7e9d0e39a66aedc14dfe4020f8ffdbee5d58d57d42b0e74e242a1e3c7422c53dd6d39a0e3b30c5acdd7430e38ef45d92c4b5f23bf7528b0dcc3c5522123e6aaeb61ff006adbb2707516a998ce5cf320160cdc15a76a33f2bab79b5c5070a39a8386fae68bf4950bea19f5e23479aeada5ff0065ab659c829173de70bd59224ebaabae89e4d548609c5d5ec627fbdca172d06c5c6853a1ef150acc07c836f56e319ccd28a20e134ce3456bc41184e3ab147dfdccb9e435a2f251870f57279dde25d2c715dcd3a041a82ad64facdf0e0b561c51c815389abc5c56c170c5aaf70579cdd26564c36f87795660430de3bcfbf47862f730cb3433c3442aaa6c9a843a671b6385eb521b8f3a205f212c16a35e47055018389445ab44e62c78d52a5bc5415ff705e340b61d62fe1526e79537c9d131c3b2a992ac567aaf69f657b8f92b9fe8b6622d989e8ae7fa29027d1398d895e45438c2e06bc426bd866d709839e14217bdd3f44624bda3beda1270047153e8ac1f90c97511fc9e16ad87f2729be144671548aef3aad60c779268b365a374d4f289cb705ed3fca56d9f429cec4cd318444a095ca8d889cc63089ef28385e0cd6dcb905ad15e7cd7550623f905d739b087a95acc315d8b8a94286d60f94496503e69a0711d94f10a581d07337de1488734a1aa5acc4a0d6dc13fe92a17d4131f819298a15d0c7775e2ef9bdc4c48cf0d6ab2c9883dd6628448db7b861d955160634c470c2e5fc5456f56dd99ef3f018f0f0794e67873eb3c2d50e2b521b473aa935dfda15a2dbf7b8ad788d1caab58bdcb521374ab470b8af0bdabae6c8e216dcf9056616a0c77ad5d9dee5260aef3a5aef6b79954b4ee416a42f52a965bc82f68ff0025ecde78955b23cd562355637f957b577a2f68e5ed1cbda9f452645e7ab7aa39854de2877843248c687d99fd33b836e87a8a142f0b40ec3293f21562289b03492b54c46f22babca3d5ab51f08faaba19fea5b2cfee5ff287f52ac483ea7f6558f0fd143b5103edcee0a1c78a625a74e80f155845dcdc54d993c39f29e8b2278d8a11f965d931f81927c3c6bd8443f2950bea510709e687158ee2d705662523b2fe3c7b7d7ac43730201d5c1a2e0ad3b5a2638685506099ad5dbb46a8b727abbc489738d81b6f4d850e8d68901efd55af9443f2335a9d244e413a3361d89ee9cd4d8b6bd02d98a79aeb0860f55ac5ce5ab09be7554d3bf42511b35d4ba7c1cb647aa9c736b80526890d22d9c47b77496c4b995d644fed55b4ee6552133d153b32d789b4adf2bdae5d146775edff003051229eeb495083ab375a77e7b1898b886aca221e0dec60bb07cbeca1f33f9d385177b1d2f552f0ba5d93d98841c2f69b907b6e3a6ec5d440f844d4911826b5e262e4d8908902f6b948c8476ed37f5ed0be2b835a37956321f38847e15b793226af729436cb8e84e23bcb156776e6041e7277cb85eacce6df0b96bc23e456ac3795a8c6b7eea43a48a70015acb3519e1179421c1686345c06613f79ebe2b5a70deb51915fe525d564e3fa9ca4d2d67d0d53788aff00acfeeab61be6b5e37a05ace7954860f3aad50072d29bc868e2bda8f25a8c73becb51ac6aac5779516c447735d2456d902ef779bbb02c37ee281d9890ca6b9947453648c3151a2f85b2f5ec6042c5d6bfdfaab5e3793fa7633c1e0a3c1e74e343c5b4e6a243c6bd9f4cdbbbcac3fd99df869860b99f94621bdf9a30f98a70c1c8b5d714c8b0cdc66d2a5b319bb4dec666e45b930e99f8f754dc4bdd86e0ad4736ce02ed1b3035dd8ee45cdba7579b8298d78a7be7375d0ebe2142b562c61e8ab1a2fd94fa32f3f399ab2c6868c0669b957dceed26c1c9c8e95d52700bbcf79de5758ff4537349e656a31ade434f59ed1ccaf680fd355a9089e656ab58151cff00e90ab0ddcdcbac88d1caab5ad3bcd52137ceab55a0721ef13cd377616d9ed07dd4bec839a4173ccccbb1737731a1ab266fcb3f5ec63f091fba8c3e7fd3b0b18442c540aeec4870985698270ff0acbf5a1fe15a86e0e1a166190627e14ab5bca0d6dc3344f2fc28839662d78a20e86f23c2e0acbe4d8e2f6e3cb4a6e200e2acc0eb9fc2e565ef364f71972b51cd8186f5661b401a129da7f842b0d9c8dcc6a1132e9ffeb1faa0c86d0d68b80ec26a66e53bbdc641482bd6b2a0550b827c57ecb44d3a21abde6e41a2fde54ce86b4560f3542e7720baa87fdc56dcbe90b5dee3cca9b5cd125aef2792136cf995ab0983cbddaaab159fdcbdab3d57b567aaf6b0ff00b951c0f9e6bc291535c3b131a08d6ef0c556660bb69bfaa6bd866d3507b07cbfe64590f5521d8e53f42ca9bf4febd84575cd3272161573502911a7556b27fed55b4c72a90ee617b36faadab23e55a82989565b7ef38e73c829f74de839b5050566209840824785e10839510d8db8ee767d68a1cec19552c958218c5d52b58c48bcee538eef26aead8071d0209b4ff08557596e0107387450f172ea582d788de7b1d952dd9b87b848290d2e0bf8687bf59eba575e6e5c14dc6402eaa1dae256a8637c9599c489f2b50b41b0c7cc575f1dc7e9125ec8bcfcce5d54186ce4d4dca99ded570533b26854c5421eec49b8299d91705310ccb8d16c0f55b03d57b22ab09ffdaa769c0adb3655a989f252786494dac6cd561b56b42f42b65eae78f25d5bc1e1a3d3421abde0864f1fd89343e1d388ff000b495027b8daecb291ff006ddf851db8b67a7450a2337ea92a47ba65a365dd849ed0e1c552d37915b6f5505dcca90a0d0fe95104213735b6e58ab0fd8fc2198b2209b4a9c3d767dd586c77d31565ee8af6f1a05d63dade555505e78a90121a1d63ab80bd4a1f56dfbab405887e2720f20c5883bceeca655d45cd48ae1dbc8290bf4df1226cb44ca3d2f78cf92d41ab9ba1867546d7341e752078b1e4bd9f487e7335286c6b46006896b0ce143a0fd517b7cb8af977b50730d3b1d63376016aea0e0adb8bc8c4ab110f583efd9084dbdd7f256dc355bf9d19e69c4633d1597185ca6ad431e8559139735dff0055ab11c39aa451e8b55ec2a6e6196215f6db8156a199e7aa2f82270ff08438e4be07dda84482e0e69de347293f2cbd5457f859d94418b4a978d8469514828921b12705119889e949ddbff48514ff00dbfd42394e4adaf7da3f283229d4dc70ecaaeb4ef0856208227b997ab5951e89beae5ab0839de27d7b39df9b866c42976d20a433d7d15ca9455bf30c9619d566df12a6769cb5ae46c6d3beca713d8c3abb8f04034480d2791b6fd46a6b45e5068b82b4d907fe53ba4a03b90d29c47495985a8dfba98a37c455d6dd8945ae13055366f695234882fec5eee344c66fdfa1376628d976aee5b1ea9b0c1bb4cc48424f1bb140775f4d1b70241f86e2bab25a41d669b8a0cd88de03a10a1f8dff0084f89bdeff00c7670460fb3fa68cb7290cd161f8da5a985c782b9174e9c516b1dac37685972976aff25941f94667655930a5ef67eaba38db1b8e0a634666e5a9d61e0ba3860d6e63107658fb2df036f5660436b070ed26e545c15335f4ede5bf3f2d09a9b0f5afa37f746244a8066789cc4ba8d0a529971901c10632a4d5c71d3105bb30bf29d10f21d8484de782eada19f754b4f38a062ebbb0dca99cb5e28b88b8e283c5311869bdf8050dbc740cefcd54f960a18bda4a1d84b6a260a181e29e94ceabfc414eb4b9e1066563a56f885eadc07878e19a0c3f0b67ebff00c5938c45af5eccf0ca27f7d09290cf3515b8390b22d3a4b5cf926c464c141c76ae3a13ed62f392ca5d8903398f91b29de86377241aed687860a6d88df5558ccf55ab37f25d5b1ade755aad8b13f0a795c4fe967eea5021b5bf9ed493b94dd9a63353dc01ce741c5c640054991b2c1c135814e4536036ebdc83acebbfec34dce75c04d3deebdc6698ddfbfb02444937092a82f3c549a001c348b7bdb8aa8e0e6a0e69983a47890a78373eb29853532a6a6d07a31bc2a457faaf6a55ed3cc2d686d2ab08ff0072f647d56a430399557c870a2d56d312a957ef3a755383263fecaf743883782ac65a2d0f1b428b15866c346a84cf0b40ece31e20fd8207385cf375f15acfca964adfea722f8866e2b51a4a9c5d6386e41e06cd1583b2ff00ce7e0ac8d3d7706f35ed3ec56ac56f9d341cec4cd17789e4e818b93ca1c6df815ec873b416bba137cd7f888ae89c0517570193c4d7b7a955aa9ee5328cae47dc48cfcf43f8666d3f69189e43339c6e08337bb59dc0290d3ca0e22cfaa8638fb9748cdb6dfc5744ed875dc0e90fa944e59a66f532ab9e4335c1561b3d17b39722bbe3cd6dbd7b472ab9e56ab04f135eccf8db519c0ca61167ccdaab502235e3876478b4280ec580fdb3ce2bdac6e24a9c20e88479045ac94269f0dfeaa649250b42c735376b9e39dd08dc4204d2c3953348699640bfc4a969eef55701e6b5d94c4556a1a6054b65f8288ee19a043c1b5f76b454dd72ae69290f729e8555e9f15e755a8b9db4f35e0835b70cc20b76af28e511075917f1d831be27ae434a5daf48c1a8efb1561e75dbf71a3c9c13862d58cf30402adca9eedabb2eaa94568739949ef53806d0c0aa8731cbdadb183eaa595432ce2da85d54761e13ae96b4460e6531d0ded70e8f71e2564fd34760706ca5bd7f8763a29e340b55cd843e50b5dce7b8e266835ac94e95a2eb624f835756c00e39b5a8af5aab82b75e59a434fa1847ea2a6690f795286d00679cacbb10a4f123b8a109f5ace6a0c2f1380f77ade80525c14bdce4ab7e888104f550cd4e255a95f9893b84d32ddce75a772ec7251f57e89fcb42a64bda37d57b46faa98331a0d6b5a09bccd6b42f42ab69bcc2eade0e8b98eb8af99bf74d7b6e3a0e61de1026f69a841ec342a46fcf21eee4ef65559dcfa669380238a74b64d42774729b774d75ac2d5d5c688de4e54ca622ff008977d957298bfdcb5dee3cce8110c0a62818cf9f00bab635bc902dd2e19e4339738c804e61a34ece79376dd40ac8bb7941ad120344b5e289ec9ce49bf2b49f76a15c57119a43dd38ae3a11620dab9bcd35be65485ca42f4210357dea2654edfa8dec7253f50fc27da2051526ee4b51a02abcf92c5518ef45ecdfe89aeddbf401c5a9af9b83b7c96a44f50b609e2d5b679394a336cf10a6d208e19fa46ed33f0ba276cbaee7a174d188c6badef18ab5089b3bda50e95a5a710a5d233d51b2ef779bdc00e28b21b6dce9337205b7839e5df1715685e2f083855a556137ca8bd905ec9abd8b3d1521307f4ab95c10978945f2cfc15a6e9c8683d877850ddc73b8ee14084c6bbaa73cddb5b9ab59e65805363cf241e3cc60a2918c93dfb9acf74dfe4af3e99a97ae28fba173dc1ad1bca22135f14e370536e4c3fbd4fa0afd4a4ec9e24f9aac18bf64032620b6e0714d26f7290bd1738d3795a952e365a14382db9a25d8c287e164fd5002a56c4b9aeb1fe8b627cd50019c9eebaa1186e3acdbb967b42f67e13a11b8d46793da1dcd4e01b3c0aded3f9531470bc673668d35083bbd73b37154555acd054e03f57076e5b1e857b378f25b711be6bdabbceaaf69e616bc307915586e0bbc3c97b4fb2f6acf55488cf5578d3bc2ac467aaf6acf55b44f20bab867cd6d59fa552d3ddeabac9307dd6a36b89bf43a560a8da5277b337f0ec3fa945e434382b4dd190d28838a63f109e706950871cee7e0b7b9ee56a2c9cffb05d2421ac2f18a2586f12cce8a7fe63bedee9aa3de2c37ac8de1c39ab518f268b829ba4d0aaf729873d77a7cd48833e6a96bd55333618efde9d1dd742bb9f651b8487d93786991bc5420f6a0e171ae620dc5716390736e3545cf32014d9e873163bc8e0abb8d976723bc2a159373e9a52d0d686c3e4bd9cb91542f1e6b5629f30a911abb87cd6c4fcd5613fd17b377a2d93e8b64fa2d93e8ae2ae2b64fa2d877a2a427fa2f672e6554b079ad78be815c5df5290121a76dbb0efb2e85fbb674cf309e3e5d0b4eacee0b5618015a86f9720ab15feaa7d2c4b3f52b21d6b9ab3105877db4ad78829784a883169508f1ceee6133cff19dc1b75e990597b8a64366cb4487b90ce1507ba9b27ae7d19fba90ab8de5504dd8e86aaeb16a0cf69a35d89d933e4d738cda71ecb29e7fa23f4f6169bb2e5d0baf1b39db186fa14619bdbf8565fe4705bc1dce0ace5143e253690470510b6e9e84dbb2ea84c79bfbd9a855a7290f80963ae2be6614d7b6e3a513fdef5cdba006e0d56df6a73546514fa387e8a4d637d16c5938858b0ef5d0c43f49d163b0728adf3ccf6dd2344d76fb8e688384d423c659e23f12a2c62364591ee63352e532a43dd624b659a810f11bf42ba7d2c3d82674dc5360c632ca00feeec728f2fc23f4f605be8a628e6941c37e6730ef551514210736a0ab2f008e28980efe92a8c7ff004a06230b5adad468086dab81bf05129a98f152377e149591eebb47d17b49730b51cd7723da31e3bc14bc274a2fd2543e34d0645fe929f08dfb4344b5c260af9985070b8d741fc2aa588966111b7b2fe4a4ed877db391bda535c2e22688ef3e83343b424e7eb9f74fd571521eecdb5bdd5d0e3d816b84c15d2c126c833077b574596383626e7f8bb027c4d05378e62e61915588ef55b6ef55ed0f9ad7682b54d70cd6c5ce461cf88cfd3307d484189b3b8e1a5328b205de255a4317941ac1268cd7fbac96a4469e6b643b914090e61c6e5289ae3eead43331d9421cd44fab49c31098ec0cf41cc3bd785ed53b9fbc68cfc426a5e132d0883e52a173966915abb0ea8561db6cfb8cd6b7384d161ee7e1196c36814286766f772cdd647860e1352636244e2049318611635c65689bbdcaff0077737c317f5cfc7b3e93276f368420e526707713dd54d281185db07fdfaa63b0399e996ae9c96c37d17b31e4baa3e4549c082ac3f6bf29cdf441c2f0839bbd71cc62421d5e182b31a6e67e16a3c1cdac40e6b54db3c149c69e1083a3d1be1dea40487b9c8f61222615a81269c372a4daf0b089bc761545ddd1409a1db46a74e2370298ec46860f171559b5e15878d7159e842e4544e7a38381a1cee6cb5af09aeddbf3132ab6a886994e8733864ed6888ebe21aaeb62bdfc377a2d8973538cea7caa95866e2ba37fb5854e63e11944bc49aec44d4fb310e7ae44e598c787fd413b2688759956f2d28c05ed16bd33331144f18840e1a0e0775420e1bb313b9d5567c39ab9ad43d477d96cda1c16c44f45ec9de6bac706fdd6a0ae27dc24f88d07054b4ee41521b95217f99521b56cb149cd673527436ad685e8556d3798569a66311a323476e2a468e1504291a44c34ad3cc82b10e90ff28447fb31f7d1a5d9e7e2099c29a365e26139c1d3044b421b7009e71768c51f3150f1b233bb0754291da65138ef3419838b83415ac4b9498d039299cd106f94c260dd1059f83be23f65a2651276a23a6834766e7bae09d19fbb34527c2564f677bace9106e2a2c23dc7493a19df5199cdc0a61e08b9d705b52e69d65ed24d28535a379cc1de12a5b9d4cfc153478f6b37b834715280dfea2b59eee415219f3a2d7735aab11de8b69eae71f35b1f72b63ee548870c2aa8f78fbaeac87fd9526d38152ba261a327dfb8e0bc2f6aeb99e6d5b44792f69f62a85c7905d5b0379d56b173ce0ad65141e152141a14bb421bfc944679f64f76eb82634df79d18bcd42fa467b5bd954e2e9969172b4ff21820dddbd002e19ab76833e489fafc1f280dbeccd09e1453ecd9087d4533176b66e846d3af5d2cb5210fbe9c3ca5a2fd5726b86e41c2e29afc688c33cc2b2d979ad99f25ecdfe88be20aee199cdc420703a1455cfc7b596d44c1566e71dc818eefe90bab601d8c8e6b2ebf71c148d1c2a0841fbf7e8ca2367c56a44f50a8587cd5cdf5557302eb1e5dc051756c0dd1a5da2f95e2a99c69d89830ceb1dae08388d46dfa4ff2fc285f4e77c36ebbee966d5bb795643c7192d4612b564d5ed5feaa1b5f11e5a77139e271aa8513c4d07e0c41b8a732e2c3aa710a4e361f81ecdc3e6b2a41486b443b9596d5ce3538210a1f324ef3a71209ef0a7345af1270a10ba23baa116953b9cd2839ba3ace013acdd34c3c3468abb5dad36cdc14855c6a4a936fde7b491cd686db2aac775fdbd2ed338b1c81171d29bc8038a2d814f9949be650632ed27f97e142e4b54db76014a765b805276d6e2a45010e1c478e026a993b87d545d7476b7e9135afd244e65437e4f09acb2e919285cf3b0e2d5931f965f07b31e187853c92289785ff00baa437cbe472862298824e130eec5a7fee4d1642338bf846469de7b908705b21f9ec4654c6eaba8fe6839b7841cdb97490fcc29b0ad769055038ad46cb9aabcad504ad99734d69bc0d1f9bf19ebd9173a802277b8d02977bbc7426ebf705b76792dbb5cc296cbf03a72399e0524689ae1bc4fb5a5dd85adce134d6447d9736955488cfee5ed19eaab15be555ab69cb524c0bbcf77aa063eab70deacb04869c5e6843b46c0dc100d0493b829bc082df9aff00442d87443f315a90618e36747281836d7a5542e79e09e6acf85e47c2a1e542e3a8e40f7850f60e20c882acc3a346d3f04d830ee1f7ec9f0dfb2e1229f05f78df885276c3b34c6ab951cd2bbab59fe8ab37735412d2f9bf1a523d83608e6574cedd41a24e26402aeb3f15acdae214ef6628428c75b71c74e4535d88567c065da4876204e4e17154b2ee457b272f62ff0045ece5ccad77b47dd6bcdea4c000e1d817bee09cf3bccd757486369e772ea9bac6f71bfb08c316150b9e78478aca598107e14f8312e77d916bc7ece085876b784df9bac7570d18a3e69a6080d0d64a807685cc1d7b3678f0cc214435eef67f37e33589138a0e6d41d1ae94cdc9cfc4d131980d032bdd456b732b9cb5c260aa6c1b8ab0f3d60fbe9eb774df828ac384fb29b8d14a1340671bca9b4f31eee4b8c80526fb21704d850fcce01361421aa3efd8c4fa4a85cf38e0e519b8b27f7f85d88ed98dc7044e4ee6c56fa152e8f29f2995d7b1ec27c4249ad9ebb28740f20a0837860ed7f8ac99b5efb47e73063f6ff3d8fcdf8cfd2b7cd74710d371d3a683b176aa04dcdae8c3679a2ef11cd69c27332527b5cd52a39877af99a507b74a28f9531aedf4070d2bf351173cc80deb066e08bc34d91bd0730c8a96cbf052f74b710c8290a431b9361416cdc5586d5e769d8f64ff00a4a83f56789ea983c4d23e1d6230e4705c373b7396bf5678aa3da7cd4def1e48486a135e0deddd94e4e3aaef37c2a88322ede38e9fcdf8d02d75c562c371421c5f2769d73b21e154f7f88e8918001421c279acc41445f0df303714e85dd355686db1583b2fd2adca97b4a067785d63a4b55ae2b60ff72d6639778792da3e8bab693c4d005f28dc84285e6705fc359b4c3b53ef231b279be16f6ef6e6022d78ab4c331ee52da7e014e21e41747047326e0a4c1388769f8f66e1c1433838678a3e52b2777ce07c3cb22b439a77153c9a2185c0d42d58b08faad78b09a384cab30eae3b4e3bfb791463e4ad9c2dedf0e6b11aef1298bb43e6fc69597098568561ab114eaee3868b9f29c94a3d463829b4d1554476e9a86d37cb45fc535b101690253dcb56237d56d0f5458c78739d827bf7012cdabb0ea8427b4da1d0a662773aa8319b78a9443fd58294382f7fd226bfe1a2fa2d6c9e30fe82b59a4735faab3061bdc380bd03147430f8dfe8ac406591bf8e7e93279438bbf02acc7865a54e1b8b4a0328123e20a6c7070e1db758f13c37a9419b1bf75541d101870313bf92e8e0b035bdaf23a03163bf911d1b249079a96628b5e24e14216ad5b829032760737cdf8ec246e536ec15622ce9715b72e6a6d208ce5f0b670c156ac3b9188d33129a68c4aa8d1b311b30baa7f9396c4f915ec9cb5a4de6558067bc9cc65b4da8427b2ea1cd4d06bb78399994655b06ad663cd49a00180d0b86998715a1cd3b8ab591be7f23ff0075623b0b1dc55a6120f05d6343fecb5ad33985d5bdaee5d875911a0e0bab6b9ff65206c37e5cdd4329bdc6e083e3f5b107a0eddcd76d0343a11bea505fe2603f6fe4425c2cc5f185d609b373c5d9a4fd7771dcafb2703a7371007152842d1c54dee9e7d5711c96b49c16bcd8b55ed3e68c48239845a0d0de13279efcd766bd5eaf57e6bb33879a6bb7efd09b8f962a6ebb705d245a4069fee521db598ac6bdbc429c073a11f50b559d2b716293c169c0e6d58aff0055ed3ec15edf45dcf457b7d17b4f40b5a2bcf9e69436971c005378e85bf3dfe8818938cef9aef4526800603dc22fd4741ee3526440593b899994bf916444c2744c90884ff0ee5d742701e2dd9b51c42d693b9aac2fbaf647d5521fdd50d9e4a6e249e39a767a387e27a12687c4def217590219f244e4f10c3e06a14c33a418b149ed2d381d194416f8aa3a4703da3627914f679e69b88038a942168e2ad3ccca112382c81f7726b21b435a2e03dca5118d70e226bd8d938b28babca1e3ea135a91e19e624a8f827ccfecaf85fdcaaf823ccfecb5e3c31c84d759943cfd224bd8871c5f552635ad1c07b9c6facfe73d6f4d38b516f85e47f23c8a9861847e45d4466bb83849560170f92ab5a1bc7319b558e3c82d480f1c5d45d7c66b3836a83832dbc779f5d294686d78e21518e67d2e5b71fd47ecaf8bfdcbaa8d11a7e6aa9b9b6d9e2666d57d302bac67a2dab3cd6a907969eb380e69cc6cc956809aa596a9bdc49566030bb8ee083f293d2bf0eefc4728ff00d8efce7adea11e616510f93bf97098905b6bc4da153c9a282307ad780f962dae7a447faaf6856dfd96dfd97b42ab11deb9a404cad580e68c5f45d6c686dfa6a812c311df3a93400301f12cabff0063bf29a7119d93a1b5429ed3ff004cfe47f2fec37a4738006554f2f6cc2b88f345ed73bcd3990dcd6d913995eda17dd6b650df26ad7ca1c79364b583e27d4e52850d8ce43e2d9493536e60284ec5a33ff526837d9201cc5f15ed6346f715a8e7463f285fe1e0b218f9b594381943445111d298a11fcb50e00b9827e6503899e66b712b2889890df8dc7e323f650fcf39e613234add99d07245b0ace4f8115538ef7bddf31cd55d21ba1367e7fc89d26511031bc50fe1e03a234f789b2badc9481f2be6a50626bf81d43ee71e20deea26370199adc029f89e4fc6cf160439952b56dd8354a1010863795388f738f139b62c8c5d44dfe21f69c30a2d484d69e4a2bb74e4ba596b4574fcbb2e93287c86e1bca2dc9182137c4ea95af9546fee92ac579fea5ed1feaa6d8f141faca9463fc433e635f55d53a4fdec37fc49cf75cd1328c48a69dd6f8422dc9e0ba237bdb87aa2ee86d3478489fa2989b5edf50864d959ebbbaef17b8c68bbdad3250c71572b944e145930f967ebf1b87ffac7e4a70c9dc410e330378cd65b7aeb1d3e49ae870da1d8e779ded134677ac9e1f858334de4346254ba5310ff00db135d5e4f14f3202d4c95a39ba6bd841fbad7c90793d6b64f1479847a0c98dac5e518b1dd69e55b6ca1c2f13b7f25d7458b10f0a05ecdff00de5757162b3d0a9c08ec89c08b28c38ec2c784d8909c5af6d4108c38a03728689d2e77c463d6af16079e68477be6e3986521bd630804f041cd3270a850e2789a1dee10e103ed1d5e4139fe119dcec4cd416785807c6e17febfd4a77d68c58148bbc7894ee734a0f1bd72cf18f09263221919816911d2748f1dd629400d803854ab51a23de7e639a61a64ba380c2f7e017f0f121ca37866bd97dc2ac17fa666e5197366ebdb08eee7a5d1c76cf03bc230a2dddd778826c584eb2f69982a1471de15e7bfe2103271dd16ca6c3862d3dc6402e961322365be1ba6843cbdb64ffd46dde61650769b62d53d54c55a6e299072a65a84d16439b78422c0787b0f6ed87ff4da9b8bb5b344760d2a043dc5e3e390bff5fea544744706b6d5e516e4a3facaadeac3ae729639e58b80cc1a76b71fd15a8b0dcc17557f1394c47b1b3320dc139d2ead9500a8c7e5928f949de6c0521dd97e33596edbe8bf8c8c261a7ab1c71ec1d08ed5ed38145ae1270322a3c13dd75af5ff00e7c432889bad591c8513a29ba137ee7fd9cce8907aaca31171e6a2e499435dd13816ba1bb7724f0f9d89542b50cdb62b701d2c5a6e28448747f799bdbdb4478efbe88345c2999df35143f94177c6cbe23835a3792ad4106c345904ef553452609a0e8e6d9c372d4d875426bbbc2fcc5f11d20a5b30c5c144cb1f144386d048a4e725d3384de4d3828508993af561b47746218e67fd94e79ef947ea0a3c48846a3cd31a28d9544a9c789cc21c3acdd618a1c187b2c12ec5c5a2422343d45678a1febf0f8f10193e526f339a1cc49f135dd9e112d1d297c9a7822ef115c17490affca646846ebc62304d8d04cd8eed22c8d5fa8103b995cf0e1f9a8f130686ff00bf4f8cda8cf6b1b8b8c939b91b4c57f88d1aa794442ec06e0a8a71a8dc149a24137922cef5ed5ad395ce0ad3ccf096f54afe1a13255885d572c8e034eb461f6bca823e54dc2c2830a0da01a3567bdc990fc2249f0f79b975da90c1af14190db65aa2bb7ca41458e4521b64399d2d788c6f32ab95c0ff00f605ff001793ff00fb02a65104ff0058593b9a41d4ddcd428b1362e7298a8f8741c95bff00b1dfa7eaa1c2ee5efe5a1060ee636d7aff00f131bc337056dbb0f4fc91db31359bcfb483007d653dfe239dff002d117f8dff00180e6b43a23cc9a0dcba4ca1e5c7770cd3886c8c37ad56d71cd3719041b6c8f256984386211ca19b27695887ea6e0acb2fde7140e0e50a1d5d65b61a3009adc04900f9822e215a1373f13a3099b899a2f8d1a1b0c4793ace52111cff00a5abaac9a23bea325d54084de732a50df2e0c6291fe288f9b542ab61b79bd562c01e67f65ede17dd6ac5807ccfec8bba20f68f019e6fe0a319c87567f4f86b9ef326b44c951633af799a7e5046b4534e4341f11d505d4e42ed0782262f92c9e3833607ce7c37f691e24e96a439284384f3bdd899a810c6e68f8c74739441561e2ac6510cb78ee2a8a51aa31536198cdd042d86de7018aea63c56bfe691085ad976f1b2e41c2ac78b95986d0d1c3316bc02d3b8a931a1a380d1e2bad786f35280db671340874a4485c005ec7a318bcc90fe232833c181561b9ff5396a64b047f4a90000d3896449afd7502203b2f1f0dfe0e1edc41371c0210e0b4bde6e010244781f69a0dcb9a1ccf1b4553624270731d710a3bfbc4591cca7bfcb408e0883569bc2847168eca345f0b4a633c473c476014287e2701f1a2d7b439a7714e7648ee89fe13b2ba3ca1923b8ee2ad30c919b64fdd251e2f79cfb3e83fd73469df0f5c27b70769ce23c34715d535d10fa0526910c7ca816c177088ea02a79646fe987fba74282db30ec820269e1d9c07630e5f7439fc31f1621931a265448f12f79f45fc5c51af106a700a4e008c0a73f24eaa2f87ba53a14461b3de84efd14164071e8436d1fa932baced6523571b82220b1f13e9b82b460c503e5afe1111479e66b1b9449a0486a37f65ff14ef40ab95c6f27496bc78aee6f299061131c3ccac3eba45be3700a7e113ceee2405938f9a7e9f1c3fc7d8e8b177e89dd0dae8e7ab6afcd132588e02d1b4ce2737f0ac775b136b80409bdfada1388e0d1c4a9420621c6e0a84307cabab871229c5076591acfcacfdd6a406b9de27d4e786ec610fc95933f186dfc767661cba385aa1d8ac9e1e2f13e5f0c66470cddacff00d143872d4bdfc9000480ce4650245b73f7b5361b758175fc14cdc1359be2bbd026c282d0d6377668b94c3606c766b1237846d8d6071571f55def557bd39ada80546ca9c3e46febfa6964f0f0692a2bfcb3c36e2e9a73f7319f101d9be244326344ca2f3310c6c370526d4a9c4939cad64c38c9747d26552f35d2e59fda77f3cf38af0d56726167e62bab6448cec51ca23b9942354553a2c582c7c56be5375549a243460e503b86c9f35d19da826cf969f5d1a1b39b951ee89f4351e83263cdee56223c361f8582598e571db2244a183f9f7a9b95af70891ddbae1894e8910cdee332535cef6b1759dfa0d06e4d0cc9f176be9472875f7353db88926dabec9973cf95ff00ea77e145f2cee760335981124df0de1019440078b0a95b30cfce24a70ded70e0734cdc8ba1ec34590714cc4eb6786dc04d4789e274bd3ffbf0da5eb8f6ac822f8aeaf21fec66e94ed1bb31cf6a23a414b276cbe6722580bf17bae083b2a798cef08a041909818c1700b291809fdd6550b93b4b2967c93f4aae89db3184bcf767ebe3b1a70bcfa2ea20c489cf557550a133eeb5f297818375734a1b1cf3f289a07a210c1f1992ebb29637e96cd0744b519c3c577a7bd1e0aab8232bbb625c6405e51b27fc3b0ea0fd531f94b1cf840ccb46f40188619f9c20e63839a778ccf8b10c98c1328bcdef3fda1358da3453343ca58356d5afdc26c484eb4c75414e79b9a26864cd70e9624ad0c0273df4b7bb866b828709b21de29a1c26c6eb154696fd25752e0e181a2d786e19b563441c9c56bc47b9bf3390025341b74866aa89c28a0e2e9bbe1b3c54f7a9b957b36b773618cc00dd99cad3c86b712ace4bfdc55b88e2e2779432aca0748492034dc8358d0d68b80cf943434bcb9840037a2c3df611a4e6c6ca21f168332a6c26868548446b393575d944570c0ba8a4d049e0b53258be6d92eb7a3843899aeba2c479e140babc95878bf5bf2a4d6b40c07be5f2cf2edff8280ebbda1fd1358c13738c804db71de22cb5a42889811d8fe0e1654b5e0bf0dcefdd361c6eaa39a4b73b9219143bf6a27e8174aeda7fe339644136944e411dd23ba724e8711cf2d7091d56ae972ce7ac665da111c2e9c82b676a257cb435e1b0f30bd8b64a4c86cf4530d6fa2d60b542d7b95a6778a86c1735a07c2e97abf34d4fb407c50c26f3ce4016dd820dd67bc9d5684227ff0090321ff49a7f25648e84c0d86d9b2414bc2f2344bdbdd7f48de20a871a1ecbc4d4c9905ed7a57610ea88c9a0867cce335d7c788f184e88320b1cf7e0d0bacb1087cc7f65d7e50f7fd224b5725867ead6fca943635a380cfc152e57cd542a0527291bbdde6e586698bfb7eac8e9df46f0e28b9e66e3525372d8e358fb36e1c73f4794430e1f85d242b4fc9fc5e1e6874a4ba75712a9a0f7f844d7b497f485ad61fe4bac84e1c8cd52337ce8a23da419349a20314d6b6e6896870526e8c53c24a1b1f5035970f8552f5c54d02a9b2a63b4831c0ab1d64f2398156209fea50a1bcc83de012ba887adbde6f39a2e2c21cb2981c9e3fdfa68c2890a3437466ea96b4ce88c0836489cc177757f888ef78c274f45660c37bce0d1341d943db0461795d674914fcce97e159810dac6f01a5c170d291523eebbf9a9152dd9e53ed5f1a31935a9f1a29a9b860305d2c51fe1986bf370521a032586eeae16d717205c3ac7d4e79c5786f3528715a4e0a372928a5cd0406caaa90da0f0a2b9cdf35a8f079ad83e49ae22ad33915d635ccfbad48adfc66e0acb7480f139457e0c92e0b87c267bf3573528b87699574db360faeecc21cf54211f2c696c1dcc37b91e89a18d21ae681fef826bc5ce13cd121bb65ed2d29bd3ea804b222a2b71e2358de2516e42cb6ef1bee5d7c77b8786e1e8a593c17bf9040c77b208f5281730c677ce7f45661b1ac6e0d12ec382e19efd191523ee769da1c3b69952867fc3b3678f14213282f73b00990610931825a0e88df68ed567346344d9699f33a1061c475963e42785518993c4e99a2a44a4574112a31dea23b174b3554d9e99ac8eea10a036d3ca94684e67e14daf735bcd59935cb5d8e6f2aaeade09c16b555ca9446d5248359b0ddf8a8f17c4e97a7ff73705c3e0d4bd71cdc7f39a47b687920a300b678e6fe2637b186683c47364d1b9b0ff00bf550877a17567cb3c3ca1a44e20939bfaa1021c5d51406550a6f739ef3bcd4a0f7ca0b3e7bfd107449c678f1dde8a4048765c170cd4bd56aae5aba322a47dc67b94cfa29bb3cbb6fe17247f57df70dfc337f0cf6b61453dff001e839f11c1ac68992549bb339436e01361b3768088d1accfc286f26711baafe699d0b435ee6da7c94466f0e9e86afb575d983dedff0011104ddc382962a46134716d113934670383d7b12f18b2a8db690ee2b55ee1e6b6a7cc2ee8f2537b899210a0b66e3f64c82cad9df8e73f06e2be6cfc54fb681950ff00d6efd3f5cd0836f69703eb9a34194dd29b79a10644b62eab86055aca22060fca733221d1c3f11da5df8b11de64ab79613059e1ef1fd97510807788d4f680296ecf3ec47b84dcb55715acb876efc9b2234b9d131e49b0e0b4b9eeb805d04700c6754c41783c1759ad089a3c26e4b9638e0c79fc1ce72680eea1875be62adbfda3bed9ecbe65d835596193bc2ecdd2013c922d1c06e5163bbbe66813b0ea1ce623ee09d11f794dcb238ea9a750788e79e793da1c3885465838b5757187f505b50bd4a3d345f2685620b03466b8e690bbe094bd6b2a298532a6a7dbc580fef0bf029f063093daba2887a98b7f038e78f1721688995be85ddd6a3123bcbde7794d7e507a186777794b27861b89de7b60b9e98cf715c170ede654ca254d70dea43b52e790d68bc94e8191bacc0b8bb7bd361c26973dd700a675e3baf77e8333a1c5607b0de0ae920cce4ceff2f04324ca4f5806a3cf7b82193e4ee9467ed11dd0ba689b0d3418e83e065a5d279323395772394e44f79b152d37a9bb6c50a87047d4549a26734276f922f8864d0a668c1b2d5d3650d23276ff009d06b400d17019c843373d09290cf4f82d7694ce7e0b87b8f4d047f8887fe619ba3ca98630173a7545b0fa885836ff0054d8709a5cf75c021172902247fb37dc679e5a1c970cfc3b7335c153352e54ed5d163bc35837ab0dd4c9c5cdc79a6c384d2e7bae010240765046b3ff0041a0e64401cd709105484ec4e70de8da713bdee2835824d1a0cca606db2f926c46ca773db815944374fa2356cbec9d11f794fcae3328e16593fba8d03731d4e5b91110eb34d062a6f3abb9b826c68c259283fdc835a0068b80ec315bd51486790f82f355f541557053ddee6eca7226d4d5f0f1e2149e0b4e050e8a190cf1ba8175627148d679bcfb901a150b7ac02e19f87b855705c334876b6a2d5c76582f2ba48b41dd68b826c384db4f71900897c9d1dfb470e1a2f8b14c98d132a77367658d9dcac36a6f274865792fb326adfd143890d85b6592aa109b460abdd804d63049ad1201438fba2365e63308f94cc64fb878ff00d106b449a2e03478ae3a3219e43e0f2767e1eeb32d04fba4c6970cfc3dc2ecfc3b6742c94889945dc1a8c48cf73de7795632761389dc16a6b4537bce897c4706b05e4ab10e7fc3b4c98dc78a67f1108b2d542e8a29eb05dc7339eeb9a269d119d2997827aa8332a3abe2530ba21b6ffc201a264ee09ad23ae7eb3ff6cdd1452448cc386e45f9696c4b2755a2e3c4e9f15c571d290f8252fcd77df3c8fc2e614c69f0edff00dd1482c7b77448ce0d636f25745925a870779deecc22479c281f7772421c0606b061a25ce20345492840c9c3ba10692ef95d3e54d0639b8783fd53e0c51aaefb7156225f7b5c37a0fef5ce1c53986e70927418d40fd49f1dc9d1f266019436a65df4e87141206ca7447de57f1b1db21ff2c1fcf69c560571cc73487c1782c157e1f30a6dd1e1ee054b35f257f6aec9d948309d2fa8e399994e5c38b611fd748934013b27c98cb27b89f1a6e55948eb8ecb7c39cd9f6d0f599fb2e8fbaffce6e9e1edb4578a73b2b775f0a92def5163060876ccec85d2c612c99a6bf370521776bc56056b50aa5ca43e0a3d33857cbe1f30a6dbf3705c3dc0e7e0a43b674ef9a891e2c9ce8664d69ddc749d1233c3583795d1c1b4dc9fc3bdc9b94e58debaf6b0f77fd7462814b112d0e57a045c516b75df8044e28448b36e4c37f8b926c386d0d636800edf8aa854a7c1e4b0532b87c42615c7d170f72e39a5dbe530f0795389eca26abb871d19c676b1d960bca6b644ccc9909bb974d1e4fca3ecdd28713c6cfc26c12ed46a0d68249a001362e5f75fd10fd549a2406ef8cf0cdc3f95a1e56c6ddaaffd333724ca0f5add827bc3317447358d1bc956321eb227888a0448b51621bdc6e08168b51e558874f243be6efd33408f0618e91edab8d4cfff0009ba1c41363848853abe01d97feea62f560479f17004ab71e239eee2543879445e8a19357210f27606b3b08509867d136bcce6853c5df9ff00c285911a1cd37828bb2489d19f0baa14bf872f18b2abfe123ff6145ae04117829b0329d781703bda83e1383986e2344b9e4068bc94617ff8f34df17f65337a6c382d2e7bae0142802b60579ffe18340c8fdd7feeba3ca1964ee3b8ab593c42de1b8a032b86e86fc5b50bfe247f695ed8bb930a232580e2717d17f888a4b7c370cd6327865c71dc14f6a39da7fedff868c28ec0e6945d91bc446f85d42ace5109d0cf11a00c380eb27bcea053cb234fe587fba10e0b0318370ffc3b27b4386042d6c959fd34fc2a64c3cdc4aeab2784de4dff00fa6bffc4002e100100020004030802030101010100000001001121314151617181102091a1b1c1d1f030e14050f160708090ffda0008010100013f21ff00e8c50ce2d4bf051ca638485b33833cce99fe1e6483c9ff00a9419a1fd7ad4692b334b9d09ed2ef5a85f2cbd8c0a84df3fc794bf37a383c32ef255a4622345bb529a80fa61532ce731e4fccc20ac0deff00125c602ad04c01d90be9c2275c5901eb3543ce5a064df2c1f88178a9f99fe43e6671d6fda6ab7c37b446b641bf0ff90cb38edb7f583205cd288eb749d78fe25c9d4a78b1e795ad7876f9335a1012ea845c3f05e3acd59e54967aac8666049b25d7f52dd074446479a3edd9818cee85ed1a19e614f627f58d9e5d2521c5d7d5731f4784f4727ba740b0b2debb47eb70fbce1e52cdc01d3c3bc17941f289ce1733b069b3399076ea3c19bf84ff001a1201bea6bd3bca924d78c4a2ff00e11c339599e8de784061865fd4bb500b574866dab98796f363916c0e46902da3166568ef866b7487bcdf0e2b9e4620eca7f363cd17838a1ed0e14165417c428e98c3bba5ef29b773c898b975bf5984fb17a82200a20e5d8885bbe5cda4a190e2be26169b155bf50a4864b587175edaa6fb80f39930ec60131dc69e932aeb27de7f9b038e5c6e421467f0edf57526745bfc51edbf51e72ed51e0bb1cbe2e38f8707498fafc07a6fdab45b1cdc068420ae532ff8431373c636d3219f19b300d63bb1ccfe992359bb11c56cbb65829dda787f91b0938a73de050625d216e124646f1317b994a1eab9902a578ef70868a026c84a6360da3ca64e0df77ec40ff65c6e4e8e3f30637de30a648c2e5875f278c40c3edce069bf1ad5d3494546e33deb7807c4fd4c7fa18f7efac7c296bc84c4e6463544b134955b472bcf7fb9c01eb68c121adcb49f5de5e6e8f59532ad3fa640d16bc256f03cc4ce20cd082397f21c3397ecf3809722f11d202bbabcf8ccfcc80051fd28f639e84c50570316335466acccda5f0618001f13309183318f48d5389a3daee09b81ee1ebc2f9b48ccb01a786b001056224b01b7e468c503c5a747bb5dac5f68fbe1ea7d67dc709ebbb38774171b5fa36b0deec0c62eed1ac76800f913477d77dfe657bce644f7f6eca00b7a221e4cfa23747511ed08b339ddc05199841930f46270636fea6cc245c8d938268c3155f2c7464d58005197f4ba0e665d40a36b79666870663656f8ccce125d8647f19c339bde425f316262d518cfaed28d5ebc610b3fa46d95dfbc988bb9394324b5051edde2fc77998ce2413ce7ac2ff4135287267e99000a32ef6f01d106cfadc5021d8524c7c3391c1959d7081a738282f927681029a6edc2b5e89e51724df386b8c9e7dc71292c8ed1638afda330a0c11d2525ba4ebfa452ecac77eed83afa118f59df381281b31f197a5b8bda8ad23b901a41f4b8bdaeafda433313d60a42f4a8ad59e2d07e78cb93606398ecf199b77e533fe916f5935678666c0a28ec51b440aca5d8e08c384f94bb0701fc5622c359da6229ab89182c672a0b9986d082f40e90d377fa350138679c06ecc5862d55abbb312aae664404a706cb976730d1e7281cde11dc10cc55b0a90bf58d464727bf91d0c1d9de27dc5f139bd0d9da3773cc48df4ae0cfd9968550fa87da601f49b4ba91fb5b30344ac32102b3218a16fe637de48a1a63df7806535312cf9167a9dd34fa9463cd29baac61b74c4453cee1c4a71ee202226a4e04ad8f98518f90ca7a0bbcf8c1de1156e71035965ad976bc4e30450ef46a1007f4779398c7966ac0051debb1c119363e52f69c07f09c3395ab0dbbcab4042c5588cf8c1a590d81e39a8df0651cf57fa265288e1f71d61d2e025cb6cc56bca0908e4104b54d8985f294059b5e50f3e9cf7ee0eb1eb0b001ca660ddb34ccc3bb5a38196cda05c57c223c6fa9d8965316b47333d1149c5caaa8d1fa61d22995ad604705051940f57d384cd3977da61063ee7b311b26044a4ed6c8c9fabde24f4f633262986c3ddc38515f2ce5d13cdec34da1705cc2a00987161fd5d825aa83834f9c7a07a10e2203d1ae8618a56639feb2f7cee91d01a35287c1c8ddc6236df99f7bfe8dd2e6674420518455ce6c8e04fbd97e6899f6dd8e08c06cf94bb0701fc1723219718f4fae6240a3d628bd7719cc3eb2a0ff000fe8d516e519583686bc3838c2e3c13173b77fd2193030025caf4c0ec4e58429aac20bc4f3ee09d747db8c0e510af84f17ec9e317e9344cf41b496d2f117e529a3ce3b6df1df61c63cb60f04cc4837d2e1b643731ec2686c3239cc54eb234e4ee04d801728dde82a54a2dd608b2752d5becc9fcc8ddda61e644137181dbac6076e01e110096388f728ff00027f7388f7671d0846cc451c994bc563d8cacbb7256be71f8555445931558b67cd2ae74c5c185c8a68f12605e642cb07f44c98c704d5d1a3fd0dd41ae71e5eeed028a3b31e2d7b9c89c4ee0d19266fcf3867356e0f58e1db598c6233a9c187ae5000d267531f071945dd62ff004425056ae84d39ba70fd3188778e3c068e4c15457f676bbf1c908b03eb28317b0a19b293436c68b95561a1b1083c0c7d9eb564b8c2f77505f24df189ec0194156a8fbc7b71da792636c3a58d314ce6e38b233a8af7289bcb907580d1b9509c86e2521603ada7de11ed06eede9d8968da73609d17c24e8c9d9d82e0c3fd131dadbc1a773927f47fc25fbaa399f5ed4340300e9c483c578cc2ad724b3f6615397ea186f3d6650fde0f1a0622e62363159310443a90abec32a0bd1198bb9ed719005626a7f41eb8caeb77db0ee79dec73084ff525d90e6664565f9d9e39689f5de6576bc278571b6663acc9a90573fe8d1199b1ff0021d982dc3dd60d168e4be11281f250292de47ca6439c3b7ed718f8af6081e68da1795bbb280e2ade44202c1e6f65e4b25aa9f52eef3a8b9a3d959e111d4e52cd79fbdddc4fc2e86f19d14c55d7b2eab370888db0f56f0908320edb0449b134b23aed0c2b86b47ed2cc708f18f586fd61c9db5873f29c3e26c722f5f6ee0f0d5cf48d46de29eb0012d16334b72ec91832b48b995bb79686a5f97ee72fc1eb1e832d582458fa770ea183076749658749b32f5b271d5e5f1fd00c2cc91e5f60b1378af16660f733e085be86acc8845b44cdc90cd81451f98d77c32b13a2ef1560cdc0981d4c22f3fd239e5fa92837757fa310008ebbedf48ccaa62aeb396078a3813a84f365405391ce3ca1b3a0de2311649e8c6618d3849d351e713353b76c08351d87471240da6b9215f2ecd7a850b983dd5065f7382c37a7e1d9cf09e384a9ecbe03b9a7b64ddb4bf52ec3edf8b7c4dee956bdfc4bc7deb0c0a23d3cb52da155bd1488d55fea3ca19e207332c65ccfb3dc4e659aa889e5b5df1d66067e8651ef0de6d4fd691af3597db16cf555dbd62589af0542bc32804ae62b6d2bca06bd0ce7af76966063ccfa45b6d2f8b979d7f41a66b8438f5bb50757537823574ecca6e4d2f1690c76f580028cbb155e23001465f9dc6ab14d478ca8b628da661f4c27593985cdfe8c2c1ec6411d29307dc761a3a40ca096b03a9058e799530e31cded9d57087460c9dcde5bdad761c2460e12d6ed8cd07fd87664ff004444ba8f28423303e37efd814056b333341742218aaf51ec21be0f0e063f1365aaeabfef682200c558cc1c91ef31a13559135092665cbb7315d971f0993f914f58e93ce84f20ccfbf7349e1c838f876d5574caf483624e0d9e72fd0fc509b17a8f18e8d358f19f128e4ecb4bb7233629d7e2b0fdb1842f30b6f86d015c3b20b3b034880c301e5171298999c2530e98c3a90a821dc4851bbeebcbbcf53784e99f94404a188c6b8435e0ea78ff003f28ecdcc2e9aaee21cc19c345b686ac0028cbb16d47560028cbf2b867132586819b2d95f9669bab37a9d46f07166ca4c1fb415cff00a4e080f347bbb34b674d598d085795839ac9860f1df6803eec2121c319e3b42974cca645d6ccb5f319d4833270f59a04a9e10af7bb54e29da8f98298437473e72b8e0ccd5bf6d1f979efd2270a5c8faf6d60b9e27a1289b1faf241e58203b3122796732afcc96af594209c51fe73388e4fa5425d50faa51ba30bca09e268f3870231faebce52399ae0f5f998d746799dc6624c11d6716d3afe5d980606362ebbc3582fc17dc218e3a02679c0de65a8e01705446fc3370d67d0633016609e533305ea6d0008a86a821ef8b767e653c10b07ef3eeb894e538baf819884f50b675b8d87271f680759a9c4e669fcdce6c7af69f5dbb9a066e1028a32ec55788c0a28fcb945730c3437e30cc0dd65b0d17933986dbca6ba394e4135941bbabfd231f9a4436d4e20192f4132b0208e2539429a76b54ab1389fa819ed7d5c00400bc3281b827b0f1ba4747e50cb2d97b2621650e79cf5ec41112c638a1ed9c7ad18dc26e2d95e0ed422a8335881e2e0fb402b48ec750c206aed2da56bc59f3800001801d970bcc3fee5ca5b79ee03795c57cdc798c4584237400cbb9870bc1e4319d2707a43d629b5a13d67aa36bd679088f6d5631bb3f680aab67b3565428573e2cbb3c06b17101c8f7622d42f5602d64ed331cef0e32fc1cfd635db4ca1d8194749ac20f5c070bdc805632cefc7baaeafb311332bb32a8f2d3058c4d51470bb3fcdce6c7f59f5da67d9e67b155e23001465f9bc2d679c990ef2b89b4bc01b954a57f4d43b987e9ba7620dc70727df4edb5b6444877de580713a39cc65a31f50820005e1aca2da158e8c095a9bb246a9b6ed7ac03bfb98cc65429f82cc677835fbc633ab5fede7deb3dfc32fccb119f757b214225028089cb0028ef82082329ed95e7e09620448c452798f8450be10dc4112dd9155316b80fefda05b5301fb730c42d3160000ca6b6a33850e106cd706ddd39f0e634998a3ae053f72b70ec7b4b2c16c6ddff533820a171421ba70f08f7e595a0f65a5c919fe621ae3b467fccce6c7f59c1facce38559338b6f1181461fc08ba989ca5855e7a331a9c0368b833251cf7fe98a8391ba9f8e9d827e447605b442a8ec6422663316a7ecf282d5472789119cc88e72a42f0fac4af1b13bcc0ed6f74dac6dee6df82c877d7b765606b3969ddce5860ddd25ab621cba6aca85057178b39240a30fc208011d1970334261f03106c730e8ed33a5d311f7656e9174a16d8d594208d81d83cd8c6c7ac32c29012f01db58b9be92877892f1a056669ecf0896783fbceda00b6b4d354708dd778e9d96cd8184e4da649d6e3e128cb4118b9912be9a578b4e33e671828c161fcdd8e3e99c557397c019b000a32fe14006938ef2820629537757fa604dfd10f38ce8a9b5758670b5fd1a632eebce597647739cb9c5391afe220635ce8ed084e4f385da50fbe30ec31316ede71b18de10e9bde3acba26eca3d7e1300000a0eef09d579a31953d3fbfc4316611f8cdd8f4048d2b2fc6e8988fdce32b374a0fde572ed183f5387bbd86810029ca3755f03bc4b4609bcbc0ccaf0943be525adc3385a09ca65b48768014150ed3d17182ad4da69c594e0f338f635001d747745f38b8adc1be100558ebfcdc6ba5f29965fc3770ad92ea506eeaff4e69f17a2607bf8762c03051de59a4315e7d2197a188c0ee06171b7ecca43b6166cdd7794e32a6e73995874c7cb179ef2c1d639ae288c476304e2c1f43311b8147d1957cebaf2ed0b30cf695621e7c20958b41a6c4d7cc57edddc936ee6e92fb6185e6e2c10e828384c4bfcb4eb3b8e6a787a4d285d197baece6946f7c1dbef0d9ed00a7296bd4ee98c01f86816abc0f4a960e69eff007edc98865bc72bbc01a72e10ed62b15c7b30eb39e65d72605eeb9c116313ed46314949192e7fca7a7fcae777b05cc33178cf6992bea6ac3796df29418a312a08242d80329c5635ecd86d07ac5b0a5e0f612de09f1cc8386179f28fb96b8b2e9d8204c42ba7fb083bc17d5310b0b7a9f5edb50af2cc8aae4e5884c3380e6f182f7088be91faf438212fa781731f7e302f8dfbc7bd49baae47fb15eddba079760d1fca965394f9ba2fa9d2182bc372b7e671377904caecab395dc7e2213cb344af92c00553c62011b1fc353190e89f2128b191e1ff007b515f17c62ff405b6de1829cf46660d86078c0af7830216b62ad5d32f79a626db4d7430e7de3154f671e1325afc9c3fe45151fa125c046edbe07cc61a6781e03088a82bc3b09b667310d910df48f010a714cc2bfcfde4c528e23da1df285972b46e9491b6751acedefed1ad9a14f022f56d2e6bed455adfd254d31d9d63a4f1fd3b8e253893ca0583d23980f349d196b61fd499f4da382ccf53bdc3f0f7f89bf34f403e582d0fcf4c317e4397a79f63b1343eda88af07d33f3ec32b4022b22f3e32f5dea35797de5f868db1e10c4e24af0ecd239873d22b78e7386b00000a0ec22034b64f395585556936dc5f9cbf887833500c9a55299cc38db399f77ff8f2680b528259107073dfd6b15a0dab8ab0bf0563e13252f143e83e0aed0aa2203c57794cfb4cbe411e864348030958e553ccfa4e6e03f7aca5b6ce4ba436b6cbbdd2bc7e28d695a5e3e1144a3a2e71d8e92fa69133328e90a84c9fc060e11c1667a9dde1979584bcee7cc7b77a08d5b53021910d0de89a586625bda2059977ea62f02e38bda091b5975336eeb19708ebb0be2e7eebb2826e9e0d42022ccfa73afc37ee87cd2e1f6beccfeb406270bb860a73d1821b8be1e12d3324e6fdf3ec2175e7f48e6b41f5b07ca189ff001a489418ab18acbc7bf2994019ac882ab75bcfba15444068eaef1dc100df001815dbc0dbefa4ac2d55faf08293048c56c2eb6925009d713aeb2879ce9d01f5994a6f3f8e338dbe87e130708e0b33d4ee2b6fb5f64d91dd7305557bedefd8e3ae4f816b72fcc2f735af0c7c7bee5085a0e37a72e5f795287213928fa90ce18930815e7d9f9df695abe8fe142d90de53e8378ad38435731873d2506749c3587c856276211003561a4da65c9bc3be3f6fafba7b8d076562593ac765c0dd1cec0fa7fc6f15d7d9ce66faf2991419bbbdd0aa275af377fd4d4f0c3030eed0b6f21b9c2a5f3efd2a603ada7de12c6dd389f88c1c2382ccf53b451dbd6959d8f99f7ef096787d8016bb5f1509c75b3c95e90f25b3d4eff1d8f883ef31eea2eb979d762b1031bb7d876bbdfa5c51f1edf87954f8952adcde11df65cc6963b1c654b5249a7972fbc4704d34784a0f573d2570878b0c14e7a31c1c7b3605c39437b45e5fb0ff00c6be3c3e54952f4393ba154671c755ba65aeff00123f2767093f277b82d3cd7119aace7f8cc1c2382ccf53b38369e326f6af821fb9e8f76efa17d7877118f0f829dfb9eee1e2a32712601e5e9b3a9e328a6fd9987171b89303a37593d4f238bf8717a91bc6fda1b9a51f54f5fb1c4a657cbe2a2318bccfd22165dcc5f3ee1829cf463838cb9edf22620617f80f9ff8c41eafe6581e735824552d990383707b42a8ce60f9beb4fc488e8ab9394e31b3fbe1deaaacb11bed1c17ba74ed4228033595eb2e0b8d9821c8f9862d5b2bce089636774c1c2382ccf526c155d47f72d3d03e9b2ccaee9156aeabf7ebdc40f40d9c5c7beef83e9c439880f186a3a711cf73dfc60d372a59f90143108f91ef33532c9927b7f88c14e7a32f1bd7cd94dff3afdbfe3140de7907ec98a958b1e930d38fa3a4b8aee3463201bb78305a8847d63dcf26d72e705ca0c092cdc661277685cae73268c3c41faf4ee71ee0aa52ed1be6f296c27e5316973dc7b185434355c222ec3c8ebbc44ccce5019a59aaff00c8be7e2062624ddc606b0c4a8c3e2279732879452c4f0712c03b49e3c4c8145cc125586701b6acc65a175307c98a91865dc3dc5b1a91d0e2be89ec43cd3d25f8168d0f0009843341e39ccd8bcbde6b1cab67525ac727f1a96016ae92b3e3c31a23e5ac57345c761feff8c24622ccb93f3f4b104b047fe2e21b3388f0ce629b0959ab7e53889f602b02a63b4397ea01eea75be1c3841ec2b1edcd6de45e84736b7322541299fd150b1a7c7d199a381f3f986259976d3f93c5998c0759521da5d1593cd1c45c1c21f79645fbb6c5c1f7329489b9d5e7d8a051db304d5b431a369999c5b12290182bc3fece724f5ece8f942b2df3608a371c4f8c129471114709f865af15e7f09702eda3d2674729b7923d682a1ebc1f1ed9633845f9d9af59772f759093319bcfe0f0874ef20a0ef922a83158f8a923ab29ec821722587723dab236482259892ac3f1162aacbf5c7e6281c3c4ca74c71736934a0f01acccc313f12c0e37ce063b5f297c1fbfaff887d4c33943c631b6f84f5cd1556e2bd95e4bddd81544548bdcfac21a60e488ea3920793d8c8f83ca4df70da2530bceecbfb331637e1a8e716e4799f78771698326637bcca4ba3d53d5aad940f08304e692eaf5ee6268f17d0980187876fdbb37b0bdbef317ebfbbda5c0bef2cc0a4cf608465151ddbdf7b7385f31c132d8f2716130a47d217a0f738de59722fcc349af3ecfcae533477e9daa42db89f59422fdfe3caf086259945c0e2401677ef8aae0337133f2c843a6828273f738d418bd2663ecf13a7eabf17051f5656fd107bffc3ab35d757299505990f8b3e9f5fb73cd1c74e82143a8b0082d89654aa68580aa20b68f89000a3298432a9fbcee5d5cd339259bade275ee5092c7c4770b00a91957c5ff003a736e1d4dbf195f8939df1db40e365c8d016f0d62dc7a66f321d8d8e869df6e4344808d47321208831134986a70fdf68d574fcb40e860effd7acad58d8723b1b034414bc38231cdf2337f48925cbd870dce105ab6a414ca27141b594dc82394b25398e0389f1c6670c6192208c5f10cb1be5a765a1d15fa9ef3cacfbfb7e2bfe88f0111a3800f36fdbfe197e2b22cde116e199593c21662e411029f0873801a0afb78f66eb053a63102d83c11189b1cdde66f9b01dde39e90837e61032a20950b55fa4117661e67ef9f7b382736cf620ae7a636753f29bd9278a322cc6997d17e0e7e1a6fa32e8370fd6111d716756f129e06f94d3fc6a0bafa0097c2595f9b30d90a2639a1d99d83838cc320680de1a6eea65ec62f9d483d20662dd2ef9c32c4e0dc36c0e2c373fc57c0979c595b3c8f98dc931e298181cdd58947b4e3faf858405a03f87937768d9a194b68af621e9fce606bac2d146c030c5f775e49928f96c7fa472b0e61ec44d7160196d10395af29ac8e6f6fdbeb38d4ed54c184e83f47de5827154bec210c5f0f49a4a35ccf6566c0f7843bb7dbdbbf863835c9bc4b4d2e5a3f300332f76705f3a57e1ba182946187abea630b1fd0e307a9ec48f9b120e4fc0fc402d591317916b778a5b71ce06d0c5986769f03bcadeef24b6d0544df18fddbe2b213cb0916607445cc8e71a3470dc7cc178b015a09563e1ee7183f24aaf43f0b0afb218b09cb701c67b4284fe6be541a66bb1005580c90f9e31f1c40ccebb477b1adb19bd80100d4226e7f446caf06846e0631d0df9b0e3b9663df53b8154441eadfbff7b29b7738e05b94d743c069147d789bd953775f7c259c1479f662975145e3fa8606cdef0e71b3378cb9eec8e63d8466d14931da5ed70d182be178fe415778e7a46c5a9b662cd1fc1da3c856accb624ac1759592e2e710c974bc3c2374db274ed52b105980b87afa8dde92d85ad83f0ca39e55d0870817181d4671e71e3c48ba10751ed1411b500395be221c40debd95ee69dde25279c08b0a040e54c4f54e33c271de107d2b9c3d7e10322bbd536403c6715d797e0d0020e9716ce1bb99655ebd3f9a4b830e2b638cb2b9f43a7ee650e60ff7dbf4605f79c7ad390b1c1e77e3fd150de554e9b7bbc3b300b0b1e0dbb815444078aefd82afbfdbb03fd71fab97be47c2ed6c1cb37a9ef043a93cedfb2b12cf137fb800cb1a9570fd5ea64c2b49e47e9db4e3b9c6095aa83d9f9299cec791fef62c4c0ea7069eb2c1ad2f6143cb17a4c59aa5dc7fc800ac06d2abc3e712a4c75e2c7c37eda0321e2d22138b89d97a389a3ce5bab9b7575b8ab1260ab9beb8d6d80479e41cccfb8a054018aba4b952ff0057c2e10b85da7ee1229d0ce1d953e4f7b1f1bf30d751e515fdec3b8e19c0cc1e5dae0f13d0d18e90c068c3a606fde70fe55ca115caaba4775e3ce3abc61fa818fa077075221660f14536e2a26a89bc955d92e8f31fcfcebcd77e12f2ccdc61aef3cdee0551101e2bbf6e131f7de72f8afbe33101c1eafb76f3170d228b3681eb03521a5e1c91440aacb32ec2b2bf14d65d19a7b3dbb48bb0a48e272c770d25c3f37f1e1c702eace6086287969e8f8ca57a91498f553012a6e760c018ddd2676f21e3100558ebddb97cbf5cc4065fbfda7057781a5466c3ea339589db352622f8cfbcf8fa60386d24198f312c18fb6da601b713d584769a7eb9c368b73ab1dc10b1b8bdfc17650c71fcbe6cf4279576a0d4cf4d116c2f54c718f4293cbfad9e72a83b7c49495829c0ff00600f05e2da2b18bf5023974cdc1fe399205aba463aeb96e46b10a1ba5af01876d65a3c721a363b1666e4d7a39a3025048a947e841a84d02e62b0e78f86716b36268f0494aa0c3f9d5f1b9991e3e90150315960f1f3768551101e2bbf707623ca187ef5c7afae30cefe3fd5773290e4e645d6de60fd4c75d61e70b16ca61562e20f6f8af366516877100de754627e83c1d1fc4845c8ce2b376d17d6c03d714b49c1eb998fa5c741186ac8d47bf5986dac6f46f10444b1d258fdc7523317ae00a9adf0256e2b65ee82258d912aa3b654872737616a231e7ac0b68880d0d5de6518a0f8f294b788c405863afba2b9f8500322a05e444e95ce119ae001415f8199352729463b57c53e6239639bf09900f51eb3c980c31cb1fc0bc0e1a3f6aeccae865bbb414880592e6a3360985034da7880d63e310be29f9cce97228865adf87612ce2d72ccf5f2fe31a27abaf022d52e05fc5177eeae87583095d3f19ee80f5983583c92b8e8fa3494e9318bcc8912a9898a50b6b08d6b78e5f139ebbabcdecac80d834fcc65d85738fed875fe725ff90307adcc5dbbe9da15444078aefdc317b5ab667d4849b201cff7ddcf3ca2cbce2afd46e53a9101705615477504a71257ff0016627eb1e3f8709ec3afea5de586fd200239319ad9e2b53e5183c5c59a3327a0e0fe926554e0ad1ec51b5f0d87c4fd8d317caf21e51f5e6b8112dcb709c03873602b445a3c477eee35d171c406f527030c32fc60f9813342fbe73423a93d70526680e323cd4123f8ef06a1b878f80e5d50807dde93e8f8a7d1f145beef48b7b38452d46d5d670ccf2763ddef718b2029a04292c8540d94ca77182a72308d140e7748577982386c1d171faff11aeabc864f2058fecc1535b8fccc0233a0aee9ab547a88be9dfc8ef02b1818e67ebba04cec72fe6b3150f422a3b4b598a0d87df0ec0aa2203c577ee9bedb0c33f3b198cb6a6f9eb3ebbfe534e88f0d6535b15d59fe167f781fd43b59a9e59fbf618ed4727d256acbfa197954659d6f6c282ac819718a502b135ee7aa213797775083c0d5cde2c5a3c477ef3e6340e9ce5b1c3ac1e1044c188bc789f1f4f73563e5f8453e51c13c17c620905649f9bcde09991e88ae7d285b3f367fb8cff51806500b2f0f3271c8f663d1a64c8adde3ce642c66e514c6d6666f74c5c200af62fb0c302170b4b7c5fc5ceb1ab81979df84a965389a1abdc01684dcede50a797ea0006262f43ba80404a1375749b7c8fe6f1ad0ea3dafb07845ad718dd6c0c9880d1d5dfbd8fdb53204eb693eff00e2767d77fc96f64be49c1af53f0e2b61f8d8d55637122010471197c7d87266d62e860faf976656d61ea461f19387d7288028471b3b816d1168f11dfbc69a757eb9caeb6e29a7165bd8e61e84c9872220bad44cb552706cf38e880d739d228c479e532a0e4e7f6fe361df790ce3ec477181b19d619c004c201dd31708e0a33d5837b786e99f9c457ded7e9fe2a91d2bc2fde5579fc71ed67d45e34bb357ddefdbe5de8c783c5e87680b553f7d842b90dae13092c2ddb5fe69c8dd7a0fcc141bc1e47410fe8e57470fbcb2e676c73e69c34c66d81edc3e051476e552d44fdb0990970bf3767d77fc76ae48ce1a8f3fc20902a4637ef0e7851d4f9132628b8c5c828f807ca0d966245aea41ab182574ce385bbecf921223edd816d1168f11dfbd5c868f06f31beab7d38b01fa83b460e11c1667a9d9665c033e64ad8b60ebc463928723c9cff86a4819ab5505abdcf2e9183266b8b0d25a506f328fabba62e11c1467ab11e396debf66009c74e391e1fc5b0ee7cbf51df23daf077f6b3cd3d0ed37c03e8cc3ebcde517a08bd6b945831daf1667b4db151b9ac4cd1ca0b8f6747f34db003ca318b69101a3abbf616d9e530be102a6648df146fa18c12b8ce4cc186a9ab3ca66c1b66f0ee150864be895b8980f85f0882595f67d77fc570b4070d63684afdbf1e06382e7cc978f851f08cf6685452c4755ed9794b4cbb160fc1f728001a2ec63fbf3f097d9e993f0305038227e48866baf2793140f11dfbcc695f5d0572d101e0563bcf74c1c2382ccf53b2e80b5db8cade232726620870351ce09226227e772019aa89782ee9878a5a112f0391d2511f14e2f2201d2bf34f79b241f6fbf74c728e0a33d5eccb5d2005a754b84bf10627bf87f153e5757e938c6ebc7b5c4d1f462f11e876e00ce9e695dcc921af0b78b14f90078ca475cc1850c87578aeb00e5766b5a92d76c30ebc238f6163fcc759b078400dd67d5cbef2a1c73b3086d9bc57dcf1454c65c2b96dfacf06d86997730794ae14788773752c2ac4c07bc72d85da7d77fc0c952b58c5c0e0ec4c5b4bc0e1f944e0cff00da634038d7569cd9f8caa043cce1d5f78000180760dc35584854817b98d9dbef4c047a73e61e7ca2772818ad635c332da26d03e0dbbe60e11c1667a9d851df4898d18a30a1b6cf278929fcac7f23c11d554baf018f08d97832c81d21454bcd79109145d3e5d981f557e87bce7a43f7a9dc31708b04ea9f223a9c47246e47a904e57bdfc63d36afba1d4857fa74ebfc5a4b3aba27e897edcf1ff9dbc28f2f19c9a9f5e1db9ad650dca01df1a8cddfe0f74002828ed10431e33265da8447db6c791fcc7af333994978317b0710b9e56d5facc9af860ca2be13e7041684dc951be7db94d54bebed4574efdfda8041639914a1b62f08b53bc2e2d9edfaefde5260c55d23e347d8ca52c4c6d5bfe7a6512f1b22d1eaba74af797e3da286d4858c22bdcc27531d066930f123951b060f320a6bc9570994062ac7bfdbe2de591607135e3f84c1c2382ccf53b438a7ad051ef06ff7fc2816803565a9cbe2f3ca599bf334c592cb545c5e16718d5bcfbdca46dbdfde5a7ee57b7698b84bc9909b4c4d5e4672958009e4144b5a98cb868cc00c4075b9842874d63b30b28072e1fc4c2db6879bda503686ebcfb49b11149155eac676d1f4ee73b8eb44738a19a109b999fbe13008141c378b7b635c7478fa7f36c4ee679eed0539f1331ef1262b47860cc78433f7095a6cc2f57c76ed49e2d22d738f1386b09d5858f6db07d5a8942b95e1153b0b1edfaefdc4873d629554d9a9e72b7699afeb0000283003f3e02f9f6e4c86923a3a3f77ecd060c454f6e7195e3d13964afea60b256b05e24036a5c4f0a4edd50000506477c420ad5d22f5d1440625c08805b6217991c1667a9d82b69e56339143c70ef02200cd749bb3b0bf3ca5f06eedb391d2e47483596fe043c3e83795b477d5ebde57d3f44a2f3f618b84d867ab19b3401e10d8311b726abb72f3e967bccc37c23ed319f68bde6aa143938fcff11102fdda158cd710ee532a06497db5cf1f09a32f0b4ac68d983c2d96212c0dbe7c2f98596ccc97667f9b5e305a4dc7021042f23ee04fae299c3f9bc43e99d9c642fbb84bd23af8c6f106baf34c4b960f9f27b7087cc4a839b6f6f28e53bb0938a6b56761d299234fda5d9a18db5e1dcfaefd999d357165a0f2442a3e398fdff854fb11a1b90073bad4e9ece9d81988b93121bca53d8f39519549e391f3d3b36670ca3acc0d4c4c17a413d17a5783284d810ca0bc557930935fa0da1961b837dbac1133578fd5825ae8298f24d37ba596e08a4f521655008e0b33d4971fb54fa2dfb739bd9c5e1164e3ce099fc398f9c1ca5959f244aa06c60a63e0d1b87bcc4240645197e015d3f44baf2f8431708e0a33d5eca8b23d63ef9404f37a4fdf398722a4036cc665a0184158caae98ce03b2f095e7237a987c4a442b63b72f7fe180d1b450111e4306ae27e2103814cb8bdc12c0523ac4a166ec7e529cbf013280e2989f91d716528dad2668dd666c368f913fca7180b3731fe730fb239ab0ece554ee8a90020b1c1180b737dcb8438652c160de5e75b10706901280fb6352b38f3e297b35dba1d3b2d31991035129ea68c262d07ee3b82d2ca5d39b8ca0ea56052f02e4fc596dcccf6f399d179260b2e525d17e8f99fe11f33fc27cc1330e8f986ecdddc17bac52b4e994b29c113a8402040353b413673cbf67ca39f132726079df71bbde60b230e29aa79328c6d0389f33e26493e57ad445a9e91af12674bedaca1a0e347ca01a814b5bbcab4c64162f18701f4da0f26e5204ef1a1a493583e654e6b91f33073bb8543e0984d29c8ccae36c91c318d56bc6553b7fe2c3ce1aa87d4184e0b1061b26bf34bf7949e83f8b2a606fb7b4aadd9efef06b2edaa2b7bbcd3eded331831c2f084651504163bfa11d7dec65047ceff202541b1348626d7655f9fe09327abaf02611235adc4f1815639bebcff100c0271948c950306f0987f7cf4f5fe819b615395e1e52e8d56727b44c3f01b67c0292b57323f08c5a2f4fbb1d2c713497de33cb6fc2505cf3a220214d52df3ef523c8b835a8cf7f92571b9e8cb28b812e381573b62f894e343332266c4cdcdef1f00b2fb0e33e425f6d1d6607770c3e92c02393eb32a73fe31d95e42cfd27ed0369e847d927f924d046b45c733f265f791bcfacf6949c5c592e7b9c68f681d59839ebe6d748476b9ceb1819889d189718959f73921f89508d1e5757a7bccc3f829e643d5e5fbe68978a3da032e524d9fa6233ea7e91b93ea43f2dc931478285557ccb08cb003046d3e812e0c1018d5bbce51dcaa322f11af89caa7830fc54ae77393fe4a95a03d3f070393ca54f819bde53d31ec51858690cc33030edd9f9efaea6f1f823c199cb0fdd61851e1b93b88450066b2885c019218e5dc4054019ac3f655b2396f08412d3d0e30bc3940fe700b407197f5d332d78100719c93ce61d4c1cc56be91fd76958c768af008664af1879c6bd7899c5f1689e96dee81500363bf8d54be7dcabc1a3a902d98e43e3056a8e3595175ca21720e4077af2762ef49d2637d52254b21d85f9cc8ff5349ebb2deb0050038771512f0c30f6980ee9e4052328e52f4bee73014efe7b9ce54ed784935ce36f58bbdc2270fb1a5f015e37ecc12d954f8afb4362006477ecff007a5f12e1d8fcddfa40ccb90f909cf27bbdff0015f3c0e7a403b58bcc8d6d9d9df02de8fdfca71d8f67bc022c9c23a39aa848056879c3e79a1a3b424e27338387e4cea3cb444bd1ff0008fbcb86e3b5dfcce61cd4f7287074d507408dd4dfcb1ca19758873339872961b1f118615e7409887142035c6dc51a9388c1d0871f5afbf83b24243597dc7f2737d16665d0c6608c6e01e6c4e4b8dbe41086ff00ccf3b8ce28d60cefccb7a47d0e5fb67af187b45ed4e3f740e8de0aef714d0aa6629c8b3ce4a846704e56c5309c1fb263411d435e704982d146dfe372ce3bccd6016a1cbbf87ee6da622982a73985c9efc63e83c65c3919e6bf5f84c57166722a2e3f40af67e1b2faa4f7950db790fbf7c9bc5479189e64b474d7a7fbf8f0df161c0ef372cbe2fc4ccb3bc4ef41e69c2d0723b39e979cb78f3ca0d165492863fa0b1ba027ec387e176a0315749d75050ebacbe2390c07da5478067cc0000506876b816e52c00f0af982d5ba61fe9b10b5d0523e9b766109d3ea91ef1157b42b8d3853da1b61701e194382b90d1168c6621ff181561bfe1356815e13eb60bc1d981999c799f60040353fba0315c5d4b5e6cd4e99f784702c3ca303bfe5fe102b5bb405e2554f4615660cee157a4bc59752bd623c96fc257d9f8d0f29e9edee9e8fe7f20f8ecb36e4692e583c36878f1ef965c7e1da216ad0df345d3b75970fbbfe16b6c11e17ef30829abf37bfe1fae5865bb7bf88f8efb05990f38480e618967878411ca20823de1289823103975f4b29eddad79272b01a772f50f593e6d6bdb3784c515076731dbc931b9ef5ecb0228acb31c15c12baf1e3ef1f9de6aa08ea5c6587aebd2620cb02a5f3d60e46ccc5f13935ad7b81bcc9cb9ed01e31a0e7eecc1c2f11abc5f1302850283f06b7a43d126e382621fc045d4d5da7532b407a445869e304eb729c913ebb478694a00ae0634343c21c079e67047733d8db3784fb4bf398498ba3ec130de9d11e6eb8cc5f646239cf2582a0c2f393c622b7322bf8a81680e332b3d1109059324f093caead3963730f53688b24f496e1e32ea69f3fc347718f98e32f1910bd1c61f33d0d4fc092e2f0668420050601f86b7c4f86339115f80a4628535c3e6e02e9483ca0dc891ce687c265eee4432c1e31d5389a3de0202c731876a8754fa4c3c0f48180ff006ca392bf9a0c98cd057ee53b8aca209c4f14ed349bca85db804da3200ac482f991c95fca54806f0bf587f210fec97102d6897273c58f3f718323ce64c6dd83d88a41875bc6138cf8bc7b98089f565c1d07ff0060168f3d3810d06a538dd6fc002d9bb838328ae83298adada36b6f5ccbf3a2eaeaed3a9943b1c73ec71ce6c7af6869304700d0f1c7a4e431cbbcbf8e48b882b5748e441b95e501ae28599d2805f911017e3ade043e3c1cfccdcaabdc11f2ca6631b90cae42fc53583296024944c9261e67f189cd05ac5781d2c842dd960f543f599fe666769c91810587752c96b4da4f3c0c663a437843851a70f38d3ce78c0df54cd427d7686af867cc7b8f1d4f9825a1d0f87747204e0e8ef11e5f38df688411ef7f820928b8855d0bfc5c552f34ab6cf81fdf7d6f5935602991da5627ab1052d7f77bf7183ac7ac754e268f7f833413267d0d66369f4f88fdaff6ca13103003b991cbeacbcb5ee81303c62d1ab7acd526267dac803b7708c1d21e2cc0005f32e016268ff4cca5361695ef1870f08484190155dcbc06cc65d25ef4c71758317f76ef91acc7b04648f03f0aa2d95f7ca5cc5a4004d952415780ccd6731b431fcc8bababb4bc38ebedf7c2654c820eb9bb36f6982e80d21104aa0b9a35d9d23198b179f22572b1d7d265380a341dda51c8f92eaf6e904ecb242c0c6d892c28bf0e15d736248cdbcde30e0a383357ce61ff004174fcfe2b75a9c302b6bcfee16b394e3954c22f282ec83711b6e75a089e8d716bd604ea8c3095b51f5c22bc8833ddafde00f502610c388794441fb5ce1baad4d4e7da80416398c4cb9a867facc91077e470e132c4b774c6dab7e97bcb34d2eabfa7f170c4794aebfe85f6ef2deb26accf4c3376879d178ac7c965eee41e9fef784eb7ac654e5a3f99f86166d11067baf59c06f339de09abe3f11c823c57f506e8d15aeb06df71abb3e2627ce67e087e170ce2301019d39434131ac79cc7710e45ca15063b3781451f9517575769d4ca13106703364e1a60cef0692ec300ecb42b2e8e1b1d3ee530df5de06d29ee6032af96c2bcf09c2e80dda40a41501801deb895926ee6f85cce2da996bb440182fc2067b05efac76dc3bd5a45c8d586a0eede2f898264d38a767f420d2c123012db3b9ff665a0e0df8fe1a9b130721842a0005f36bdbcb39aa898dd486759666f2ee83ca69295878a08ac7429e3bf7c0e12d061fb45bed49c74eedf0eab2fc11c3e88109294cac75793af7144751e20f94835792be1fb5fe2726635d7f5775a0e667402001441471a4ea46156b7ac33c270730db19c590b3114f6b0758f58f631347f2ddc307912fdb8f8afc7611ab182d38215dbf5ce5100823889dd044018ab30e4f82f180f45ea2140ceb2d7374f39bb80a62f375fc602d98b2796d125e07448d375c46d2cef4c8f55e3343adac0028fcaec665066943b3c0f5773014cc8952bb97bfd708ab5b01c655045280e2b1c8e45d16768b39aefdaac3a78bcfdbce034b2fdddcc61dc5ac5db878c3a88df34b585e6b4eba4b75e41f3000000343b6e8cbc4e24c0962700cc4a596e3bfc5ad39e92e6c4c6f231ee5fa4d739e8402af3ce0028e2f4974701c19868cb1bfc0882686de7364d60d8c7bd812e87b9bcbbc02bc8f8e90247a379ef02f135973dbb31e70f1ea3ee892fbfe2662c6007ab0edd0358e795bc0a28ecc6be0886617d72bb25e62d9d0196c5ad064476ade66130fd4c9dfb58f199d5fe5bcfd8c257fa2c3f3d804471198d65e47c436e13de94e4981af8d13c67a112cc3aff00051e7303277c487805d8a3ed0f0bff007cd293dd50c5cdfca0b4e3a3699ed684c22b85e32ed077226fb6a6d33b75bf9f3f8631d3a1af6fa9dc248a2ae84b7bccbd3eb199c00635ab29dace5151438fe84a620ac7c1f1ce05147795aa7278131727be6b2c5281e2ee3ae7ee535bb662a79ca678e3ed0480640aef610038ed3160c56235253f958f7a91b2f7f6979ba7dbb3962c0b17e26b88692a0171b4032232b4d573970ac8d287d529cbba80ccf3ec7486f2a527b35fa4fb7f888316dec8052ed4822f7e1135143175efa0882c74857296af88307902979c62d68620e66b2db004e0153427c94fc629b670609925f6e15e9325c1d9674ab017174ce38272c3e29ae17310c337d3c652b1e09f32b40b64da25d60574652b29c7c25ff5ef0dd833ef89677154035e5f8a395638bdd06cb3b788df9a6027eb0f6ee2eacc43e7eccc860f25eb32c5e65f4988a5b35959c91bf8b000a3f280b6601a381128385bed33ac7d1061c8d080fa173121ca0014147f00f20988f6781eaee6df96b6368e933c4f5665865e732836e5ed06b3e9ca190c0efd619f9e57bcd91c7e18f7469b23a1dff2353d860d91cd713bc3cafd199fe1f5ec6b233d1db6981d8432868ae1eb2dd9d5ec5336e933ddd334e73045e4f23f48e91784ff002486f523e23f7d7079fe3760d77da29c61676623932c58d705e19face6ea189ccd3f15a77feded3eebc3b5ded422350a589a11dcfbd7e951aa9e6b8acc0a075a728996780f08005051b766eb0bda5ea50be6300a01d9eeeeddfc022305e5d2604279a970786645b4e9133b3af189c3ae7d7943d7f01cdc3b00ccc5e6717cdfe322adfd4ada6c9e84c8bce36990338e3a619b000a3f8234f5b8c140ec4129979253727012a8016afa449376568207f415280888dff8236cc37a69f1f8fc18af89e1c01fd4c5375f6f7ef63367e5d5c5a4152d7fb1ddbafb8f69f43a99646a19af461a1a6717233998fdb05a65d79ff182fd9f86e431d384d319e51cdf1822ad9388c08307a3eacfce6385fb867eb022ede0781c65f72e792ea4aad20a4e302605abd8ac3231958fa55bf94b118e98de2cb06bd3295c2664860b2d42bce7554317c6637634c0e26fa4e1e5d97ab15799982831ba383d9cff00576861debda2645e931aa3d4e04e468b5edb5fa7e64b18270727933195166b660c58e72bc7ca57f1150b2d8d69d2b4803818663772623a3365de8e6605bb3864edc20028fe105b953097618069dc659b2adbfd335759394bada1196cc5c08718b116cc6bda0a28cbf03568e2818ff78f70cb21c5a88cc529311126a7719999c010b58e31ccbf43499f1ec38f772e06a50acc4e826466df2ee6c2d727481f65bc8496dfc4120b0f240073347da1c692ddbd581451fc6a7733c3aca45f3f4fbc7b38300172b183c3f686e3e8b54b94cb2caf27acf38bc9eb29bf58a7c3f09e85d9e93cd8c7b9bbc05554611df8678cf06631f1833926306fb95156da9801460766bb8eac30ec1ec2b5609b46ced5db89d5d10d58630463b44aff002a0eeded979719ae27078435ba17857bff001ae37ca34980d8794b6966e728156fc238e8866c0028fe1d989927844bb3c1dbb6fcd33acfb7d2616d4b664050843fc5358d1cbf7d26a83c26af8fa7e1e4d605735d4f199ad7826487c7167c4b7a45c55a9983e4e219f898655c747720d96623da9a194bd0d659acd07ca572c0e5892956d713d63e789678412f7aabedc14f7a149b1fa3b5eb103043d7623ab2976e1fb47835a8b93c4944e68c95723b60838161b9aff1f89c255308a8b604648d139c5439597d88286671b68786b0135e128fc3938f48cdf4ef640fe7610808fcae840b21e13fc484540c3e8cf2feeed75663a895753d7b8e5000191d98bafabb770320312c6c288f2c9ed45b6dd19954ff0007b5220e81c58dd2686a082e837363d261fabd4407567a587b44aec597c54f87f86a8b62abd1a27e8a345e8ef312e180d87940b81ac71fd40051fc3c5a40a5043ccb47a8fc449079fe909580dbf595e4e0118e1b95bde2e65fcf3b98a4b087a432cec1400c5260121f9226458f99d5f1fc359b878c5fa2112a6144da0e2a988381b7ce65a3c487511c0aed720afd84c61355da70cf2fdd2f860d1c7efa76d29dc1333ce71e332e6bc72f94f43a3ed5a0d0fa4b9583038cf59990e676e10dba07188d6bc92634e785cb292dcc5b5c42c4f1288e3c75e7cc0264a9f4d6679f63a40fa311de554cce9e77c66547aa2649d733301c8c1f24eb2c966f2cde61d966f11ccbacc98733339e95a65fceb04365d17532e236153049dcd4745f8981307aeee391e86a6f12c2d7f644011b1efe572fa31e07d31ee2ab398957eac31ec74e67673fd5da187774ee9a75c6000dd6caef347943571137da6d974c0e3a45d7378c303d119fc92dc9a568f98ed55cbe7b18ed385c461eb7fc2545b31e27a4dc06ecb5a446556996a12ec1c767797b634c0028fe1e185a6470fa6906d9d307c8218556f8be12a63b901312b7331f2988f03c11753f361cc3acf44a099f4e13d778f9c95f210f28fd4ff15236f94978d8be5dfa1bde269dd99b919db1a7616380a6739e28ff0022ad674ecd2258ad99e61d986c39ee264d5d470d7b6b73d5e51ee5e7a4c03c255235308842651863dc812f039c7028de36bdae39cf36031abc4e211fe8cf89a51d585cf7312032791fa4f6e8cf79766643cdf735e57f973fc396c56e4fd73de5e7b1013d5b50b53945a15bc52b4b602bbf8098be2da263b25af6ef8be0a45cf5bcfb86014a83586285cc5b94c49d8c6259de72598038b198525ad32832e59378baf7aa740bd4c3e2737a7bfbca5730794b132a9e3876fd46f3c8fa9db9e7aa9b2cd0975ec6accac9f4bf856e835ce61936c7b35b5b976a90df2b6ff102a6611ebd12fa2db4f5673ac3cfb871f3401323b33023e753d7b2c2c63159a6a4e6dfd9db9e1f8bc97d10f8ef53f0100562726023ea726a76980fd752fe62d9cd28262646704d7a20ce4e3060f39c4ed2b858f130ad66003daab8591e8eb2f7d8c39a55a9e77bc039511597b1382757fa1296cea72b2e590df7b9469f24a99b8799dc73dc051d585dd5850e1324dd42afacb1b59c4cc307bd60cf50d4b970ded6385cdcf4eeddc35e27ea73a80fbe1d8d8ae23934971a7adecdcbc2e98cfb65787bf6ec42d72d2641869c5cfd3cff00879b65cd3d4ce567078a58314d225788c005197f1317afc973f3b846ad67eddcd6f0c0028ef3b04c522c3d916e5c671fc3cccaf2c55c45ea7e00473cd6cc1367984d3d17d83a3b83b3a4bde33c51190a5631425e608a9407a3c996813be2f49b4fad5ba1dccdaf9197045716bd3b22c0849a16b956b193c57f8a80b388a7b98109beb87e41394a0f4ff65f3d53dfbd4fe240bd95bc47732efa627bc0b0cdf2774b70a92233fc332df41dce33a79a55eefddedd8c4a4631e9aeedfb12c47266c9ff0083325b4215f613ef3d8a4c461cf2f2afe1a094e5115e9ec86b392a2be61800a3f8991885c48f9bb42da20e371fc02a42a461b76a0ccd3fd850499981c0ecc3bff4bfc3da75e8f2eca44098f599e9ea8065e3e6429e295953b983073afe7d9565bdce2adf4633987655b8a600db7969059c6f277811003358eafd8fc7e666a750f026d061d98d508368607e74a69ee8b1649508b41c15321270a1a3b9218aa1e3e504c3e873fc45c6c5e906269f0ef714427063f3773013a60ecc14315e7010a0d7cbf5ddc27a3ecf68e0b57ddefdce358794bdf0f8b0ec02058e093050f84f098bf81d8580f74c99843bcbcd3136fa9f194a2efd27daeb0c088a18cc5df0319d00a0f3981de03fc12594e52d7b3ce005197f1596de029d3b55edfc44b11c465ebf56cbe226f7c335fac4028476ef61b60b5f3236c057b3a06fce31485603c6299f8780623e0f482e35fd7395c0f28975b388ec9b929e299a230d3602c826bb17fbcc8fbc2726a39b020f0eba7c3b0db377550746dbc9e30e66180e1fb831f9c73da193060069fc31b3c076888d3df7424cc4b9cd52f37c4b2ea51956ca3f69f8140aa8336534df80c272b02e7f4ee0b6357865d8a8156f84e112f97734d7f99653b3209ed1370c60e49dc38bf4c22c3e1f4ee2594ca57afa3861a3f3f4ec3a420b78c46ec0d726b33ca5556c3f2d654641c0d4ecdca2f15a01912ad7dbfd0c253d21be182b6dd983ce08b3fe598d736025e83fd4307daf1a2684511a9e9f8d02708e0eca34df662b2237baede9efdedba4f9bd2fb2d5a17e938aa9389618365997690988b366367c57d9586dbde5abcd793f5ecbf0cfbf62c4bb32b145303b8ee381a7aa21873457ac7c4bd8c5026c5e78cccbf3d680dd6f84cfdf47587cef3422e8f5fd2680f3567f8efccc394d28e1e79459b7e0b3509d5f68953fa9a40827cb23bb91d327321a4cc167c49823131ddc4ef3f39eacb1b75b7fd61bd4b671f705b1615fb3b79357dbda7175fcddd517cf1265938b313b96f10f8bfa95f06797efbbc1cf5a5f5cd43d23838f65a02bf7d181753cb48ae70d3ddecca197ab2b6ebc095e0f04e10ec1a1b1d512dbce3f53ccfe9d9ea5f4a665c575606d4c081401f896bc3b65ea70af5700ec3ae56b728c5be1b8e0f78c3b0a4971569cc692953dc6bd88b1591cb49be581e984b7ae04dfad854153250b338a62da3b2ac31f21fa4a1fb5976be0718016afbbf5dbf2f1ee0a08b73eb94af2af8078131f38ebf247f02f16133dca9079af53e20b3e624dcfdb8ce27edc6219033193f5322c71a8c606f146d63e7adcc9625167bf89dda9d432738a8b68b1215537d3499f738e70bf6e13ea8bce59856f8901ec9cde04a1274353ce131030034ed16c5857ecee61ed157afcc0bae2213cbe3f1518ddfa04d644ea3dda87379477f7b09b1cf463838cc2c637835fbc2118c84df4962f2c03210597ad6c410e8283b2ddf69998cb0e55f941fd37c7281b7d27125baa633f8d9bbeb87bcc605633ae5e5d9987a1e025d78837c4507af7f2dcc59be8faf846ce4ee21b6164ac390b738439e7f64b5e1b18da2e2b98d5e663f40f0d8ecdcfa08faddd06cb3b515a80ed618e5d9f5dbf2d014995f2e72e5a1869ca2b043eb8c12b9198f8fe11b3c076888d3150f238a9e20207180ec321d9eed0a6cd472617b726bc017c7647208e6bed181e0c52195c88ee0b62c2bf677509b1f4fd4c6195fefad7e12de0868da6290ed6fc3bde4fd09e5dd974a73d1990c0b191cfb300ab5b913129eac4af49e306b5302a7c0b7ce29a5ca92fe29694c9ed4e340ea4ff006ed3fa631ec291d49569b14390c3c5d65a1e4c1b2ccbf1307a83e908f000a21a03217cb8b0703795e07765e8b8eadb9dfcc5311b0c4f38eb5f63319639f89f6986d398ecc1038846eb04cb6e1ddf37f65d7aeeae5389c7d3bace285870fa3f70472c7f264b3fef4bbd66ce9c599a979b9bf906cf01da2534cbc1d071352184e93cf4fcc2d8b0afd9de410726018d87460e422cef711d4aa251d32be6f29a2bcd7220b1835dddfbde4fd0ec10e837dc0e6cb277f0dfe7009a860baf07e7e888089823348041c40403bd6be32a5e16bf194adde59e551da382731357984fbdc3b7ea2e2ce18792a7b7f4fb764b31393a4b9fb0724b7b9beef2318d8db111ae23f87106abcd70cc655997ef14f0ade58f965798cdd56efe1c0356019685e7ed10ea4b8a9daf2e11815ba5af198205e639316391b1213d0a2f03e25734abb184ae23b05cd91e2a8ef8d0c3bbf6facfb05326a1374e0dcff0bef4ad65355a9e910a10bf51ee589b7939b2c981b1a8ee206d25cc7e35cbbe36780ed129a626a37cb990f2917e40b62c2bf67e0c1860bab28505d506933f7d113cc3a67a917b26577e051e710a3c162c5c678e5395d17142e33d0ef829c9e0463115651d66067602d61838fdbf6a8553f9b49e04af5d0aa0bf195dcc2dc687d384fafc3b7c20f499f3f50fbff54969f00731f5f08394e1bc77ef99c6c4ae24af16b132fdf84bfddf735bbf8883b74b37970f00c17e39c1de18e51e71acd327a4138571b20ba9eafc4d06725c6c421ba0344360ef7dbeb3ef55b3a3f830becf296794e9e3abdc422e018c1a8af29692d445cd1972946339260cbe36074e73940bf91e3df1b3c0768f4da7d4ff004958b34e8cff0018b7b2ca1b7e01c516e8b99347e99c531e99707f973577204aaa3e18a63a9b65a2704d42bf033d478c6cd8d4e72a02e5643e4ccd96f35f1f8382a7c99f4b876d9b46789fa977ee9d9edfd51a3859eab4653d1ff44761166983b288a968c582258d8f730e70b53838ca26b3c47e436e85a331ac2291293483808c13af0fc7f6facfb2de6998d22514ac7bb92c90c4c3ba0c940b59411bc270d0826f1b9ebdc7b3a4fde6352cbc5a768f2c1231336ff9534e1f837ef8c70535c6c3c26006a3ebc7f13438336271f70f30ccf5ba84c5f4d7f8c59b1cac4ed49cce2c04f3c74b7a55f07aaddfc3f51b4fbdc3b6f5b2f933eab81f3fd5d72f585b8cd32005fd7e703bd7b54f285736cb93e332802ae1a7708435663e4217c3f2aab34c2e7f59c30708180c983f79fe1fb7d67db5a583873ef2e6a36db47bceb86ddd17438f7f2b9402cfc7a7770f682fd3e65d1fa4faf6126600108710e647490701ea4a365687726b23826cf7b98a7c3183952dc63da2534f751cc4472b62e8a8551ab56930d587fa30742d4d701e72808402d5e6794bacccfe23909c3f6e537716791c386ef096f33b4e6f8fc5f79b4b8701db80732bcc4fba117edfd7626b589e6f725b1c5e4985b7ea5517ea8f184d9dc0c57cad5af4852a01e13ef9c3f2b182af88e7c470f4880aa4d48365590fa67dff00b7d67dc1a2ca92614fa0a99df0cbe4ef0d3660cd0f1f6d2b91bf366ecd1d0ff7bbf6a8c7de72a3e2c7b3104b59598cb0cc7a38d43a310af06129e059c4d498aba5c9d3bc83d6977dd611e2463600476968b5b66b0af89512ce7f7728bc8f2462337991fef6389405b80378145acaf74380bcd723bb2a004cacce6b1d50e2991ee41470840d4d39c0877dbf858a6e9c34b9ed32993232215bee79038cc0aa6267f03f1f1b1138c03cfb78f3e9440f71c9c3de1fd76751e1b258a5a9fee8170be28f69cc94b1e84682f16bf4fce4802382318536279f270f4ecc0aae8d9ce0120ac93b9f6facfbca06ba3190d8e0edce5fbfb8fac2189665dc53ac175099c74118032b12b2630d0cad1bc0391847215889c5c7baaa8d511df0214f2282e33a7d113ccce48c7d00dee88949eacff9d8760ae89b92e2afb6d416b53f6622b5b9caa3ef016c385b426ab5d162fe9f79bda56768f188672f9ca7c113a4f82a3d05018ab20981e3baab76a6f9b1d3e1f2959c98acd5c5ec65eecf65f1bc621d26530793ace40e358f936cc19c43a2bfcc6343671f04ea73d5f112955aeaccdda92a4f07bc3daa1baeebf91856129a6baf6a511d65ee7e8331027fc1eaac1e02e1b317e36c66311604cdca7ec1df6facff0001305ac1257b5e55e8ed2ba33218e1b463d0241a81a8df6b27bceebfd251c398d9ca610ca11f6727e926a58f1ee5447a531d70fe98cdbfdc2176124701f33d262b15c055bd8a0370a8abeb135e8fa2a2aadc7b4f10600e37d83e532b4783843e77905076d4ff001a51de136d4c2d39b18f48e10b7572de120bd554c083df34ab2e730f29e058b1fc0ad71131f096c21e082206d3378c5b6d8a4b0b580ea455cc7056372d7ac3f351a0245e793f3ed9659e7db5ce27c719febc43fe136b1c78f5de502ff238be1828d99c1c4e066ebdfd39e47acfddc60d9665dee3a6954bce38e52fe969b1da95b7c552bce645330909c7127948099c8188fb467e72c6685e675aedc91407661bfcd0d7b21070d387ec09e56c764272a252592d3acc7fc478bb8931da6a8beb832322351bb167dbe600000641f99bb8697429d9bf9b1f39e723fcb38a0b730a60d364cad9b5ea6ffe7f140e6bce785f6e71790f29d9fc83da6411b2ebb0e37ee9985adfccfade5212f27d38dc127790507f00d07dae60073d18e0e3d86003432cb37e3ea98c052f053dbfe154993044b1891ce48c2ee6d11784d8f88ec77c1d80d53e0f88df17ebd996d339ce549e19c6c52bec40e4d57819b39b116e9b4112ff005a8f8cb43fa5fba5a84f56fcb39c0f2b4f732ca0570e2c652d69c17f25c0d3f54cdb97ef87671cb4aa0dcd0c08c12bab33f46c70e47cc08875903f85c3719086b6378ff1177d05f454379a1f285614ff0045f11b0a2bcd4f843f94bf38280ee67da19db9a8fe1e0fbf8a19430539e8cad2e4653f4b6cdd4f1ca7dffe1d0008e631220eae8f0ca58236e9795cc7f7b7b2633cee5253b33cc04625826cd7ce63456c5fda35fc70981e594aee983ecb1aa38bce8f7b85f28559bd1f115f498fb4f332c75dbb28c44710990178bf68b0593b6a0562f15f7cab2f8aa294ac90c250ae0aab9e8b0bf59cfb13301b33c9cc63d54e35c9f302bfb01476f59322182dcf425eb73328dfc4f298cfc2f31f6ff8ca257e77812fa0441a3d849d48ab786857ca2234e6414cb09964eb993750186c7c3380f0cccba004cd29cf1c612526404adb07d378ca5a9e05fb4ad35aab3c32864ef20a3fb2143ed68f1f98a11c5c7b06f81a26593832c00504773fe78a95cab4d54d73e90df6105cca3968bc40aa2931d50f261adf47289c9f31f786f2fbe51f1fac695284ce19fdb568aad85eafc7d5d46db0f4ed16381f4603e4b8564f87dd266922a843d36ad678b52e4df895ed2b8489165f0aff009a4d51ff004d8f39c48bd9edd95714f87fb2adb27417dffbbfa158663fd29e6f6d71d0f92335818aabb4672c15db872572e7fe88475a6e53c7b11c84e7094ad679b03d5f0ff84600baeae46b34e1ea6f463cf177a04231d3cff5e9fc3cf40e710607912c1cc079f67309f1955f775edfdddeb7bea7b4563b1448d0f1eb9b1f6dc3d49c471dd01500b59903fbade581e4329365ff003e19c29ae6f19433780e9843b5895b5a607bf8fe2640d2315d822fa18f43c8f388362f418f0308978928650b939c7861f24c401d309cbe57053cb59f9fec968a627022adc79f86c4da70981d580cb95c662bc06fc21347304c12294fdf1e3ebfc1a0b32e6d3ce6b6dd9e98cb35784e2a7383cb38d9e697dffbba93791afa02d5181129a61932dbb078badb0928a034dbe3db6ea090ad646b082285c6f3b9be6379d63e7d8a0a734a08b6a7a7aacbce7d418e71d7d6ff00610b71a3eb786cef1afda2cc53824ad6d5813a11b3e13806c6c4a2b66b1fc0d61adc363c2cfce294a3890ba5ee287a47698d52f79a1dc1d789bc68cdb14c04c864373e3fb162695bddc0f95f61c2afeadc3c83b09b873d5e18f5a8979221a3040cbc60bfe0527b106ffb125d66148f17ebdbc6e7cd3fc64cfeefcb21e7de8434c6668fed0d81c81f49902e8d99657776f1a3ce6bde57c501655b3f3ed96c1cd378f3ca5fee2fab7e2717b6af624446a10e2f17c08650d5886b963944b5f4f9a7a7fbfa4a6eb5976d700c38b8b84000001b777043189e0bb8c2fb7686e47d54c3494b978734c83c7fb0dd07cd703d1f188be896acdd0845e20ce3446455fa1d264b3d56cc3433049f41d60ec3b248dcd661c20b34767f3d51908f371f4a9737355ede5d9c521e52d0c91e578c3fbbf2c81b65e508d818ca9c7a1128a558abac366dae72c748edfb68cfdbb1d703977f8bd9f6c8830b4ad37ca5c01c0058d6de371257d40d70b9f782f0f787990b8418bea78421c5c17a5fb314b45c0d588304e99233e8fc157e4b2d9c41b246d0d1e42beb8ff618ed77f823d2510b4a78079760d028bd4783de3fd60c788ab5f465c3b2875d1e79cbb46e18930633bce69158035b13e38fe5402b94c431ab96e8f2a990ea0eca7ea8f7fb4b2e9e555eff00dde6b3eac12c89978cce3e70da4735692e2fd90db58bae1fb43b0d74ddc89a8f503609930f91efaf2845026fdf6078f46eabe928b521ba0dbce66280ab86c0f9e3f4f4d8014bea946a9c1e47d624a35b25e855af8b451d6222aaaeeec184e880bcfde6eec5bbabd5fc38148837c47d2598e0de20fdff005ef9cc6e81f3d9e70d18e5e55da167de128df4ca7df00facc5096f3250a6f557d631180bf5a528973a8ecf1fc971a2aea67e572d1cabf3d3b7073802cf23de60be50f36ffb93c2e8196468347bbe5001c3270e4102802ae84285e75830c1a13c82160c1c4d99930b40faa8cb9b9261c3b082add40dc9ca55388a1c5ea54e475f1c7de0b4e615e2ca9d2830099df953f38181a515ba0389d19553b82de486c034250ad788384c79ad3f4d07c7bde59f93203f5de0f97d1e33cb213de58cf65abfac65bbd6d8d04ab865442c4d7faecc9f4a856f5b5db1cfe3ac000323b697712b9afaeb38382f9f66284b7992bb1db076758a4613c2263e27a7e4b1ec87d03de5d39d3d0ff7b6ada00f84bcf367a187cff71eb1c4c2cd84db206c1a40b68c581ae50c4f9de2f637206ac60c8a0b5d4149392591c1ec767787328c5c82673962f9a8e669af827bcae2d211f4ce119917827305344bc5a2d0e506b4e7a3129a73ed2ae79f4ff6609f420d1865d224566ffab52d3a03e9b9e749f866764d1becc30f3f44b78d131167ed95c4796247f8f043c5421e38c1a578671c2298a5fc23eebfad200a3340998d906c687840c922bedadf6ad1310277ea681dc2aea3c0db8cc300b8ba1cea197e37c489a70607a4c35a71b9b8fbf6f17ff3431158ee758f9ff70bea6ddd38b847c9f4f40eb120a44c923c7ad8848bb87603b2ee1eb473483ca808015d0c41f98671882f327011a2bb3358a058ce0e72aee8d69e4600bc0d63e13105f44d6302b400254345d17933f28767eba41d5f89577a6afed53368deabe2ce1c402bbe535109cf3f31951e51d2f1f2feb43469c53975af09c45a69d62d4570710bd1995f6358714c9e95003b5eaa05bfb1cfdf4963342bdce23225707d0759c715e5f8b7e9473ac3ce70251814019765cbaecff54d6a1fdce77081b1802ef8e67c898f5588623c185d0bd65e38462c973e02b03eeec48c057f2cfcae32d961f53bfcd5a339766e0818a0f578c4e9b2f0836573e0fd04cf7df37c4cd0462f49c480fe3abfce17ccb34e74fe593aa588167f0049b48c463395b343a12df2e0be2f5f4e71d3de6163031d607815a4c684e87aaf795ae027768f23d63d8a858ade0d293583e6ca6a5982b99a4fb779c71425d70aa60df1eca4910640467fd03f69eb41f44f3661ef07cc2d34e2399dea25c7a6e7ed2a77fecf7eda37fb17ed30cb03c92fb7f5e83ad6f0c72fc990f7983e6be538a8701a5f638e38f3a149e4763833921f1f9fcc40b4d83869f78f7388eca232c2061bb6863e32d0dda6aa7560600714edf17ee00243e93974955d9b61218f96b1e74fc4a02a804176af16bd5e58463cb3a61b7c87f9442d8ad5f581317f00b832f7d1efe12cc92ddb1cfc7282185406876800229e1fa213ec13055eef088f00ade5044b81fa6c4242940ec10b3916f5f4f48e08d0ec6994e81753e226ad20b0dce0c7f3fa71ef5b730a1e6d7b4e6443efeddb57f981fb8f598cc78b41effd7008bc6a6bd614073fc7666a6e117ec2df47cb05929801291ec7308eec6abd5729c80b778ca28ba896adfb5451696e2f486583ae6bc8d22275c670e6b81012a838e2f762794d4c94260e1ac0a40c80a0eebeb7b9793ccf3989589ea627b9d3be4f4d21f09803fb27bd4a214e943c8f98e14b3a879eaf66e2fb0a73fae3fc9216c0e77a41896054cff3e2228ade322349699aac10193c23e0f5ee3860aa34d9d7d986138af95ab291c17f1101070fdee57da2b763c69320facfb798646d5b9b2f0f39408f2671a06a793f30a2674a9e394e2a089971d280cd637f66e10b8f9c0d9b6ebfaaedbffda9fd4e12be17f5aab0c4a5031c579cc030fc888ebd50f5ec121bf047666f876b731f9f297d5fcc7c23a7b595d6f623dc981fbb32274ba09bbc3e10fb4c51a25e63e8778ebb1b1e781e92d5bd378fb8ebda81d817c8631d453760f761d5c55b72f841f5545555c573670ea8abca6eb457bc339e100deba99c1b194747bdff002b127808e2f418d4def44cff009892415a6410a1701bfc5c59ac2143fa4511fa57e661321142d8f65d385a14b594d0605346876316caf1fa3e307f0284ce34be411da2f06638f9b504e53116cc9f3946c45fe094e11c93c3de0d3029fbc6a6743bc17be6a1329edeb0f1828d8d33cb0d46a78ba482052c2a068e8097b5bca38644e7383abe1264eab5eae1e55fd6f598a22af8ac2bda229ccf496e27e352b961cd58280d60e4214767968b46334a94501353f43b1ca0432a8b0d3596b08b450683b54b43bb5251130760aee23ecf7af24aaf20883339b8b078307510ab3b7c6e5a88b51e4ca702002e50e15d68f8b0edb56dbf03e6063c9cf79f398b346e7b928ca746a6a98eccd8c794058623c7f9042d8058f4234175795e8c2814cb7d267781eb32fccaa40622d76f9c64c61b55ca2f5d0037e04d883a7e538b017897a09833c3138dc5ecf9c21cd113e9cfc25f86cf0faf6ed0e39c19b7916cea3831e678f387071098dbabb160e3dc24967a2308605bcf27cf5ee2b68ee2ccb48d6b3865557354056a70ca1ec44956f94422281771705b8e7159965a7a1fd5d58625353c352c3861a9b4a2f063bcc7b6991b7e4567249e293ca3b70e4358b039cc892bd9117aa0cc3f4d2386da9a0ba4f46189cd6f27dfbb50ae0191a2f52333651c38472202d5d25c820d0f565e72f5fe56be197aceae853c0611c2acae32911cf2f85a52ad6c47cee555c1a98700044769a9c3d72f375ba58c28d98ab3af94b3eee12ef00c60a588b27f8c42d81cef4958b6ec9bf0c4c1dfc661b0fa466ef330fcb896415f17445d8d519ac1c04310c9f7876bbd13755b8e93198b12b8f0fca5b2eafad4377ca000001801dcd5fb6bc88e508d8a3d22d8438d3d2355c67f5206555d3e6942f3157a440735532da8391dc55e6654caf6eef15bcec3de3e2f6e5979d4faedfd5558625301baf38d167a4a1cc839f17a20e7fac543bfe3cc3037d353ce0d243d152e32b82d47b4707ae296d5cc1f0cac4f5be3b2f41627a34f92cce5d8793dc2816b84bdb2acad58d6cfac3b9946bc59d475e24d3c0c271c1661783fbccbce62bd087a27015d577befbcda7ef32ee2094cebde4ef3174347f88a19b0868aca902f99eb2ec4c21552f232958c789016d0c508028fc951577c57638c7e6ae661a421ea19aebd9ef000283003b8b716832fd1f30295e721a1da3c1b95b39cec0a97a32d1b8f1213023302f37f50c5e8b3ca612ec52c40dd1744b8c438ee37c80a1594a11fdf27cf9428577a2dbc199c55e666d0ddda1876710ede0c87bcb68b3cf27c4343facfaedfd40f36d1c859929d6616183e904b7a65ed330e2e287a665f8c2105eb74fd95d882a9551af399acce13e1257d15341857aa990693c93b3cbec04a962b95a32f0ba6002847112713bd9dcb78e9368ae9337ca36dc743e4b09c621708eb94b00999757430f3946535b8f06107886401f83efbcda7ef32ca3867384f1ee00533f5bbc15e868ff0885b03e994b5a44e70e22c33384bb073f599839b58b3660ee40147e404400cd65e20b437ef8d95660ae583601c78f730c0b50f9ba45656daf9ddc5166e1ed207a0e40f2358910b8a7b3d655fe247efb0050b22db10ec0e886bac45b71a36273f393d5944532db34adc373c2aa3807ba12aafdba9f0806389e53072446e708b49a8b94c59ede64b3344f4467363d7b4cdc7e5fd355862500c4e2bce085b20d383870a8c3062d3076de73ab6fcaec2178e6c3d3b0690cdba38f81840a9843bfa820a0e153e4f2aedcf1b931b32a72c3a41e41da286c3372c0548182f2436fadea01de3cfd6b70c083203f166b7f799e8fde6534200cf1b8ce122b32b8692876a094cebde4ef2d716393fc1405e3bb68f4cca35617b40ad225ee434560387263561addfcac25b273b9fd9d8e92b65b07c5d1876e9760004059159037df784460317777ee25b8b8d40d303a4f9c1eb2ee8c2b0bbc1ad1ce0bf0893f5dc0b6ac1a6dab3378ca34585cc69f5acc5d24c7aa9b8f29a604e29e24bcbdc1f4e7e52cd62aa1493caa63351c8441874216b4c55a44f1e106ec72a9996a737b1c7399072c4991fd22d6706ed96bce5f32981c7366022746022b11e642ca941bfe6a49693dcec2863a9367d13b06b09ca9c49667754c4327a6bc25dfecaf3e4358183282b5ec45c5f529a9f428630543f7b2bf931f50ce48ce65d992d9bdc701df07b8455e51ce73c3f390b6623c9d0802d53b93a01f3822f4692ee564d6608321b7f2b8450b7c1b9353838c66ad50654285d5363ce0f41559779ecccd38b6bafa67dace180469fb1f748ee38661b76edbb79daad2014ae85339c44c5fd6e9e92d90540e86878543b1f81f1ede1ca1bbb47a6dfc384a5d587d0d791d9843b330ba327b5c7ec70ba0d89bcd796533ace1479cc7fb1e12fcaeb1f74fc41dc1f3179bac40d16bc3b1de52c3563c933fe92ac31288b15bbb2b3e5d481b31f8709a9f1f498edc3098cd191f9f0102a29c87c65e50d3593c49976704f4fd8f6338d2cf3aa6ebc26621c59989f5b1472d3af84b37aab379cfe6c0ba650c4ec664cbe5dcc9cc4ca534b794fa09b9c90c63a3cff0032999a8a1630d1da02f4342627416647733000f225deceaed00147e435a368a023200c1e1f011a2256a22360d9791e8760029a160caf8e60e77dcfa310d680f138facabb0bcd7cacab3d45afe3b95870059abc9037eec8371368d810b87eb3327d28f7976142d06816f65c6da23ccc3b24a31f5d01fb9618580956d8e1bc0a6940a03b45a32ca2b476ecf07b8f5062df43560014762daba981451fd1a069718a9b9e72a8e23328d6aa1476e04c1abc13ebbff073ee191e1f3da64c3011a2a72bbc1d56617e2e7f0a89c72858b1dc7c712f97c78ff00583158d59f6f81cb9773c1f544b7ddf6fd77fce8533995ed2af666cc99859e1730534f69b398c4120cb38005057e4ce40abd39c756ab8bc7f08f11ab5539098d7b1ebdcd38a4048ee9ba6db9ee46a4173afac2981a03b8b09cfd4c311e91e2c1f30128c23ab50e3ee22898b7cb844cc54f50e6f6f199ed60b75792a38eb35e61facc008646519ece2f0784e1c60d35a0501dab42cc00d5c21818762094cddc1e72bb7825e52b8b33d9d5814519762abc460028cbfa3b5ab38cc58b9ae1e808c45d6229a0c66f7908094e5fe196470866be98478539852450d5786fcf4818c18f246c70fe0e7f1c266d2eda1370712576f04c1ff0048294607cfb7ebbfe6502d6882258d928297363d7b4a06b15992dc1e8ef1c74777680051f90169747d0e32e6d38649fbac5394423a0160e436776e2b4d0b3c40bc06fd7786d2ce69ef6e51acb1d5c3685ad07ad73f096b9f4075840000681288d7be9b2763a113b2c02d1681407712c495859097a8e034eeaaf4356051465d895e23001465fd1a866d7602de4ef07258facb52dcb25f7821e53ebbff0014b0a64a4afe115759c7019a4a9dd3ebaf6fd77fcc80b623945fa4b68bc6ea5aaaa7632609b84cd4f5ed28d0cb36b780051f92f872ce7f3bc267d345b80daffaacb71ad59e796c774ec6dae80979700067dc6f2e411b5cb95efc22a5bcf3a7e7b335e0ba45f5b1b903a6500515815c478c40208e492f56e9b428475016aca5150bc7e1f3d97d0ea6283dcfa60e90000141deb31308df919760e033ed549da1a2762dbc4605147f474e1894b7129e299cb3a7ae09567971d2509777feb0ecaa9a713faa08ea6a6f138bf59430edd3df0edfaeff009968b675105b7821acd55a6b00e32d6bcfd66037180051f8c8ab5c0f29bf6be33b11e2727847d6653c53d5dd1b6b61404c0b4e2d7a4d7a10d54b5cbac58d830755a0e332ec76f1b90df87408cd642eb3742fb2d8b97ccc1e880c9f30b12b29a3b4cc41be46d026905133fbcbf258d91970c1f29660e1b3b31722191155e23001465fd1d1ce188abc4ef0aaf26d1253bbc9976267eb1561a65ca23317fd6057884eabd650c3b329e2767d77fcf89c78ecce65750c622cacaa03c65293168bb7e5482db039387619705c032d9f8779d9016ae44a362d0cd7c4c988b732eef1f4ed170cd4df7eaf897ab8397065efd971b33b3e48fc2a5bc2a71de1273165842a8ea4ecf7844000a034fcb6366119367ca0e505aab06fde67a06f001465fd21c60de0794112cca114d6e522e9d12e6f4cf9ff005cd94f3378e321aed3b30bc4e1eb9f5dff0080696e4ad5e1bf0838b5dc866151bc55788ed0028fca95f5172b3b58959fbaebdeceecf03266c0d4eed7a4002fc92fd5775c4529389a793095d858cb11e1a73660c05ae8c8858298e5783e50c926841f9ecc4c911af7cae5e00a6ec0a28fe9743b31e07838c205b7754af7bd266fbbfec023abb6f2badd18e72b66ff00c2bf1218c29786a4b3630c717680147e66675472713c92639aaf6dd106cc3b81af1b98f879ce02009fb718edac30af278f1ef56f963f35f0915c8554617ce36a7a0b56607c18331e6f681c82a0141fdce21eae114a6fae90faebff000ca5b9c00a32fcf76f6679bdbc3b00b814ee8733cfb335395608d69cab9fbe081c3a3c74087c1a99ce46c77f8233a762ba30f0c1a74c6ffbcf0b6d3fe5c65b48d495859e465c38bd621220c448b927408eafbce351aeff00261926a3cb87384d16daf15d7f0065b985c932f23b12d01578bff143f0742b123af6c7de733ce305ba557de6357dee51b1350291836a15a37dcfbc206ddb5d8f745aa5a2808e69f2519f27bc4a22ac558cd5aa051b52dd62f9affe30f80a64f96e25ac66660ee32d1fd737309adc205fee4b301cc7da0d8376f784d2a0dc07433f1267a758707a7612d66f50e9282a2fead87fe35bda1b3389b315d05379b93e508a265857cb7ee1c5f18c8b7c6093ee5abe207e9a3ff1d39bb5446c8578bda8fdafe962ca3bb3511f1fff001aff00ffda000c03010002000300000010f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cd32fb98e093debcf3ce33cfec79e7cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3ce28f3cf3cf3cf3cf3cf3cf3cf3cf3cf3ceff006c4411233d4c5f84ae0d61c68c5fe27b4d34f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3ce30f3cf3cf3cf3cf3cf3cf3cf3cf3ca23aa5e7d346b37f688ab3960ddf6a676d8ee06e58f3cf3cf3cf3cf3cf3cf3cf3cf3ce30b34f3cf3cf3cf3cf3ce10e08f3cf3cf3cf3cf3cf3cf3cf3ce3829ecff00b3df7e21becbe4ff007f09ff0063d4d43351cc50f3cf3cf3cf3cf3cf3cf3cf3cf3012c334d3cf3cf3cf3cf3cd1851cf3cf3cf3cf3cf3cf3cf3cf3c28ab2ff6c6bbe7cd8582dcc579ec55f39fc8d3b57f648f3cf3cf3cf3cf3cf3cf3cf3ca24d3cd2ca3cf3cf3cf3cf2463c73cf3cf3cf3cf3cf3cf3cf3ce1a757379e08fe5c11f5a3c561edc33a9f7d69ca0bc49b1adbcf3cf3cf3cf3cf3cf3cf3c528f3c410c3cf3cf3cf3c70061cf3cf3cf3cf3cf3cf3cf3cf3caa03b40a65afd927eb76a2bd633f2c46cc32e3aa5271cf6f4fcf3cf3cf3cf3cf3cf3cf3c23cf3812073cf3cf3ce34020f3cf3cf3cf3cf3cf3cf3cf3cf3d5574545ff5bbfb763ff15d38074bfa6f8933964b2c61ad7c4e2efcf3cf3cf3cf3cf3cf3cf30f0c81cf3cf3cf3c42c03cf3cf3cf3cf3cf3cf3cf3cf3cf3f7f811ba286bdf7da75f7e98df3cf2c149b1d72483cf095fe46caf3f3cf3cf3cf3cf3cf3cf3cc0073cf3cf3cf3cb1873cf3cf3cf3cf3cf3cf3cf3cf3cf39d1ce3381e430d74b9df7a3bcf3cf3cf0822c72073cf3d03d729f3adfcf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cc01021c25fb7ec636d28ffbdf63e3cf3cf3cf1c978569f3cf3c774cbf5df5bcf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c830bdda49d38fc453f53df7d63cf67fbce3bdfcf3e2c7f6af3cf3ced05f8bfe854f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3891ff0038b6df7e0ad76ed7df7df58f0cf3cf3c27cf3cfeada5f3cf3c57cfabdad457f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3ea9cf3de3ae6963cd06f2c44781b70befcaf5efcf3c48573cf3cf381b3f7df7df35f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf38e93f21eff00658ce56f811efed30fd9f2c03fcf1c73cf3f9a57f0f3cf27a1ef7df7da34f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf20d281612aaf3d3a4f5df7dfbdd21f7df40e76f3cf3cf298555921f13e8a4ff7df7dddef3cf3cf3cf3cf3cf3cf3cdfff003cf3cf3cf3cf3cf3cf3cf3cf38117f1a69dd9afd2f3ef3df7df7dbb6f2e669b29677ef515902d6f99357ddf7353df7d315f3cf3cf3cf3cf3cf3cf36388fbcf3cf3cf3cf3cf3cf3cf3cf2f33ce5d2567624864bbcfdf7df7d258f82aa9cc13b171679977d4ddf7df7df5b5ef74ccd5f3cf3cf3cf3cf3cf3fe53dfe676f3cf3cf3cf3cf3cf3cf3ce07ff00977cb5ff006cfe8f3ddfcf7df7c024bc3c1b1e58210e997df7df5e0bb0fa88de9c36fd8ff3cf3cf3cf3cf3c8b77dd467380f3cf3cf3cf3cf3cf3cf3cbf4c1df3986e67df7df7dedaf7df617476d7b5f17df6af7e798f7df7d75cb1ff00dcead7bd925f3cf3cf3cf3cf3c4fd4fdc7da65f3cf3cf3cf3cf3cf3cf3cfdba82f82d59d59f7df7daa6f7df7c7de7e1e65f7dd09f58778dfdf7df7df7dd1017cf64e60f3cf3cf3cf3cf3c43d5bc2f82c5d3cf3cf3cf3cf3cf3cf3cf68cbb1e84ed8b467df790b4f7df7df7ef11408d325fdf7d63d9bff7df79de04decfd866419f7cf3cf3cf3cf3c4fdffd762f0377cf3cf3cf3cf3cf3cf3ce60f5c9f34d3bb2f59f3c3bdf7df7df7dbb6561bbe5bef7ec10ff003eb8ace39cf7da84b311817bcf3cf3cf3cf38cbca58211a16f3cf3cf3cf3cf3cf3cf3cb7bf32a5445d7a962a17cf78d841fa0e641df1c56af30ee32f38e44cfaf6f7df7d1bcb0360ccb7f3cf3cf3ce88539f3df6973cf3cf3cf3cf3cf3cf39fe59c8d0ef92cb11fd38df3df6cbbc7595ecf5ece5f3c7fc7bcf3ce75f3cb3df7df7d29ef7de95ab8dfcf3cf36c9ec1bdda02c33cf3cf3cf3cf2860cf4e03c921a8ff5c3ecf7df7df7df78cf0f1ebb5f6deb6f3cf215bcf3cadff3cb09fb2f7df271e851d022dbaff957d79255cf3cd3cd3cf3cf3cf3cf1cb1c6d2431f5e44977df7df9df7df7dedcd3694c5f789ab71d7cf22f3cf3cf9df3ce0ff002c1fdf6d7cff003d8a871f58cca142ff003cf3c30ce3cf3cf3cf3032471b37dbfcf2f11d539e28d6e47df7dbfcf30744f7db4cf7de5df5373cf3ce31f349087c0b13f7df7df7dbec570fe7ff00df3cf3ca18c0c73cf3cf3cf28f1cf05e3773cf35dfc56cbbcf7d23af7d0f8cd2f07dd798df7df4c1cbc7cf3cb2ff000afd19f11b6f7dff0037f35bc78d35cf3cf3cf2ce1c61cf3cf3cf3cf2cd1cc0b83ef3cf12f39bfdf7acf9f5ff3dfd649bf7df6df7df7df7d67e27538bf34a769fd1d6a9c7eebbc0281bcf3cf3cf3cf3cb28c3873cf3cf3cf3cf33fb053047cf3cf1464c68af5e94b64f2b88d123797eefce34e30ddd33df1691c3ae26ddb85a2f3c6dff0de78fbcf3cf3cf3cf38d14c1cf3cf3cf3cf3c977b34d095bcf3cf32f3cf065d8af65dc0ee90ff6c7edf9b0e34f392e37df6a6bdf7f37d88cc33d7d7d3f3d73473cf3cf3cf3cf38f30f3cf3cf3cf3cf2c77c67df6c933f3cb03f22e6a9713ef53c4cf0bdf7df7df78f3df27db4f7df7defdf7c4fd174f465fd7fb6d6574e37f3cf3cf3cf18c1cf3cf3cf3cf3cf2c889f7df7db0f7fcf0da313dd4ab9eb0c61fdf7df7df70fb1575cfd3e8f3df66efd96cafdb1bf79dbdbf98e08bbc41f3cf3cf3cf3cf3cf3cf3cf3cf3cf3b85df7df7dbe7b3cf1c56fd8dbb3b74b65f7df7df7cf9fb6a7cb7d0f7c3bf4e0725f3dcf5f6de7a53db9323d467fec77cf3cf3cf3cf3cf3cf3cf3cf3cf2c52557df79eb577cf3dfbb2672fbf3c109f3df7df2ef3cc30f7d65f73df6df7d97cf7d6bfc391a5f7daa7600b6e77cdfcf3cf3cf3cf3cf3cf3cf3cf3cf3cf19532d6d1bdf3cf3c653f7cbfcf24f3c31cf7df3ef5b3defbdf5cd3df7df6f1bdf7df162d833df78dc7f3cf3bd6d5fcf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cb724ee6fcf3cf3cf345b4f3c93cf76f3d73d69df63e3b3bdf75fca4c2dd1df3f7df7df7df7ddaf33cf3cf29fa86bcf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cbfdfbcf3cf3cf2cc1dea4f3cb1cf3ce68bb0b474ff0035292da1fe8dbbd79203fd3df79def134f3cf3cf3c8a8efcf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3b667f33cb519503beeef1df3d73bf2c45cf3cf3cf3cbdeb6f3abcff73cf3cf3cf3c409c7cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cb0c790b4ff003c38daf220d614939f1c73cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cd2513cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c784d8e76df3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c7752a0434f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf2c338f3cf3cf3cf3c0b6f7cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c398006a9ce38d3cb30008d3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf24e0443cf3cf3cf3c01847cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c4f86fe866a9c978f3cf0c93cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf28b0357cf3cf3cf3b97973cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf20c77718a48fdd0b5f3cf3c83cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3ca1ce280bdd3cf3cf35ded7bcf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cb210e5cf5b2fb16f6452c31c61cf3cf3cf3cf3cf3cf3cf34f3cf3cf3cf3cd1c5202d2730f3cf3e546d3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf34f3cf3cf2cc1c8fef603daa1cf3cf3c934f3cf3cf3cf3cf3cf3c914f3cf3cf3cf2473c05d732069432d23f6cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cd24f3cf3cf10cf66d96f473cb1ce3cd0091cf3cf3cf3cf3cf3cf30c04f3cf3cf3ce1c120d7b7257aa74002cc8ef3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3463cf3cf3cf2f23063cf2cd3ca3871ca0883cf3cf3cf3cf3cf3c83cd04f3cf3cf3883cb33f3b7b7de6da753cff0f3cf3cf3cf3cf3cf3cf3cf3cf3cf3ca0c33cf3cf3cf2082ce3cd1c82c73cf20734b0cd3cf3cf3cf3cf2c33c53cf3cf3ce3023c9d7f9e8feb7cadbd7e957f3cf3cf3cf3cf3cf3cf3cf3cf3cf24b2c33cf3cf3cf08300d3833cf3cf3cf1c91c72c63cf3cf3cf3cb30310f3cf3cf3821481413a97f273dfcf3c3ed6a443cf3cf3cf3cf3cf3cf3cf3cf3c934c1cf3cf3cf3cf3ca0c33cf3cf3cf3ce3c53cf2c13cf3cf3cf3010401cf3cf3cf1073ca0d7fe37b93573c43430812873cf3cf3cf3cf3cf3cf3cf3cf3440053cf3cf3cf3cf3cb14f3cf3cf3cf3c43cb1c724f3cf3cf3cc34d3073cf3cf38c1cf3881dc00e0cf0cf3cf34f28c1cf3cf3cf3cf3cf3cf3cf3cf3cd1851cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cb34f1c93cf3cf3cf3cd2cd3cf3cf3cf3873ce3073c49721cf3cf3cf3cf1873cf3cf3cf3cf3cf3cf3cf3cf3cf1413cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf2ce24f3cf3cf3cf3cf3c73cf3cf3cf20530c3cf3c694f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cb34f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf38e2463cf3c834f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf2cd1880cb3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cfffc4002c110100020202020005040203010100000001001121311041205140506171a1308191b1d1f060e1f1c180ffda0008010301013f10ff0099eec9e911ea08ebf195ff00cffdce97e13565fda3b42bc59a170584a3eae21b7fc44763e7cb53019570633b194a6f32e1ef1814623e8441ea105c371b2138531ad59ec993aa3dcca64ffbd4a4a12f285b2d2f89602e7a73326e4f7f3a4a8ccf6706aa8218b850dc2311b463bbdc165928702e16e4111f58e3708e4e4dc2b8b9644be15743ea2234fcddbd18b54288aa8420d65dbcc8bcaf9a92cc316ae0f723628225559a1c06d1177285f0a8863072226b6445d330aa69f99af9ab945f6385718288bf09a5fb209371ae901dcc449a8b7b96c15c10bee62a8974f3838c03772a6e253394fba26ca9fdc3e680017da080973b65684d66cb29cd465211a632656384b1038783de006a06846fa267b65845671887859602cf7002d350e00ba18aefaf993fd2370d469337d223ed034da096598822d2dd4d52b50504c89c504130a45094963c64c440a484622d6666d97d443a904e6dfb4b60601b1c722c9483bc7cc415a2109dff00f62d4ee1ec09a8ea742504ad6c6c540c445bbe19a782cdb1408fee7fddc4ba1f485976fe66a9b3eb1fd0c03373b88bdb3f111df82c06bb212d1c8f4d904b54ca23f2fa1fa665ff00438b773b08c2981a9d4c9e0a0941c6a7bcdf826e3e385fb50b1631215622abeffaf2ceb4ff0071591c10c45d12a4cca35efe5d91f702114b9be00ea0b5932bcb724bf0f1643f6b9316c757dc31e3a9907661964fda1efc851b2577b714aa545c743186a621f94c8d0b99fc277559ed20c89a8205a817c6e40a19b218a780e13b38800a39551de21efce93a32dfc89a4689410625d987c6dafa63886d685ac4405f130ad9f28acb505a35f59d55c00d45e885d3296ad4b8b60c70c148b860a10f04837c3c7eff00e66bc5ecbda75d42b39621d4360fa335a88a319935e39d3ed0ec8f15c75c54a8215dcb25d7c9cbda6581451c84d7275e0364b0f148372eb7a7903fcf8d0f63bcf8562ecffe40ba88bbe5595078e3bf6cdb16ee2edb0635359f7767e4e2a1af13138300c4da28658175ce8f37e22a4a25d89dc492bdc13227dbb8b15c03be00282bc1c9e8982e9fee58791baea1b7c7121c1fa7c9731547d61e6da415055e98d1b4016c166c07514782cc92dea0db418545cec6388b30830867642ae1dcb9ad3ced095ca88ee693ed10d9865e1ffb07c080cc1f9607bd315f16b3a7e9f2345d9293231b7890cc12f517b325e1015c569661f14be3782db7867112d6cd44aeef27fa6d7de02a99eb49eaaff7533f83f3112846f5646ac51ebbff00ae2ceee38bf8b972fd7ed69a1d7c16e628ca1e7b70ba1ff9feff00b8d7b5194150d136ca1703dc1bd436a41bcf93ea6bc27a80c1a6e10b1badfda37d100ca44934d0ed82146b52e5385a2d44418c04a9e8c5db8eaf8dbfac5b6dfd782a0288d431119fc0fa90fee77f85e88152aa744d1e410388429c42ca8bb792b53b4035fe26e95a89785a495ea0cc9fe60dcff985bb3fdfda32dabfc41456bf89663975f3d61a8a8b9f6c0bb849f4999d1fd45a8cff00a6838304f44a88e755c5c19f8057bb7ffb00288bd102b85b6e6c784bdc51b4b1c8da906f3e0b45c376c737a2983711ed1de2520a2d379e032d90f4457445dbc753a94ec97ec9595959d686a3c1d47710c6ba961eccfe9fd144a01440110c6b91b7c0247bfd7aff006620b14602b8b0e3427e1e42ca8f15e021152cd3accbdd3d41be10ee073d64b33702d30462047279d129ea5251282a5b02b85809fa7e987f338bcd7834919673ff00dfd71723119b30eb2e2f02a1ac38e2cc9c6fc3c568b8717e286611236ef4e65bba31708b9be6ac137bbe1263688ab35034fd0508b70446eb95958850ad5e7f4ff6078045f49d05cc59820b2df5f7955facaabf72e6970a62a9dece8a27a8b23836a41b2e7e1e16688147925ca219717106335bf4825bff003046549d8f049b9bd142fc504b3a87bc0a8678d106c2e660bfbc4469fd2bbe83c608f30f536188f5f445b6ff005952fd4e241dcea2a23436401643dc1b23923b5b8fc2284562401fa04ebb8edd510d4c87a26385ff00732920cb1e0e05e67ef22d934784c7a93b103e1b22c1002dc022f7eb9fd248ecf096411862ab7006a02ec233a307ebd81f52e44ece36cc05b811b229df10a9bc6e74312416fa801838ba894acb344b7d4be357b237746fedc7b0b28aea539708b000dccd1b89dc7d2c32833340c799627fdb4ddd3ed34dec86bc4e14bc40cea0b505cecee22dc79bb45b07fde20060e06f5ca0d1195feaa2a09a28d86a13658e030a88b6c0ca972bc46f84ed00785160528e7559e6c27a457f12da7a39a200abb8ae782b7f582bee7848ecf11d92a72e882a3a58523b41e39dc085d0e143731465f5147fa27d47f885d6fef1db7faa16d10c8efb60c270a1104474261b967b9594fd1b964b83b4bc8c1b3c3ba3dc83e190f44b8f6f0749f521af010fd827512fbac401672aae0f7e205dbae0896349986fa7dca8319a1732f8ccb55bed8022d41ed54e983f316f2fc0b60e08556d2e4513a1b9ab6bed36a32eadc029df88c58d78d0b9b4f150620695732d56600dcb12bd907830d11aad3df2ff008df174182afec3c069f5ca2acd4016728772beb9627a9fee31c6bd731210022d6e09946c07eec4addfc1206e65a25f4cb44d75cd41d199f784fb9c161c212f4c025c625d877e19d102a54b2519771580dc1ab4f0a02b9169221d3ea2234cc17b7964fbcf0450b692ae784d1af355feddf0bac916449364981c0fcc555bf09fed75102ac47a1f0b0f635028a38c9c2af0ea4a97ce99523815803285b69634ca7b9516ed81e041dcc09ff30ecb21154f8e7f4dfe38d722b2aa6850130da5bd40be4016cb3a25cd92c4b948f678bf3515f536c7c33d3d77097e88e96a8aefbf0fe6385adc542f948d403ae5ddd7388636f6262748556fd3b084198763732cd20b420bb10f6fc63351950bfbc045ea006a14390bc4b32f023922d1705ed9a883b8a58d4b4fa1f0ecd1b9b68ef871ece5817bea615dff005e2d09d42a135f52059f086f133a1349896545da518371c05ccaf789659257b212fad292c972e5cb220ee253a847da25e22bda512895377000a60953ae362599797b2742051535898ae6298f758f86fa5ffb8483fc4c15517d591b305113188d3fe1e388fa1e1d08a97062e0dd89d0ca149c0a4811fba2ddb0e4e1529eb8132bee7df3ef9f7cafbe20bc2a458a79d1e6bba4d360eb451ae46271a60d97311c53316db7e1b13eb8b71e0a03b9447c325f694167d088de274324bd821862c4c0da047981a9975fa6fa30eac1bf13a72ea3c57202393838b8acbe300c4b2a2a6d0e2e30d07ef37646e8d7c2b05fa25d879570465eae70be98b9bd92aa19bd22254e194d0940b17503ba5bd4adb0063cec9577c147008eb846d32be9047272020edc2f4718a3841298358d726ae3a45705611483aa10f08b6624cc057b33f08011845137e2e6915109a1d1ce6fdcfb22652ee63cb26252a5cc5c97500531f28a9f879286f88cf6c21f4a53d449d47b45f8784bc711f46670ecf0bd102b8c2fe2ad4814571ac0b2212980b84ad9660d5416980894d7c27487f537cbf1556c0ec7f48895be51092a87ef2a1b487560c1772dc0804a6f9d84435136f1cafa40a8b5b95823ae753141e6bd102b938b80496442388786d635233576fd27fe84d56221839e3acfbc0fc2d4cd894bae48032c555be38bd194651db481f5342e7f0832878334c779e55152a57192453514ec83659c8c4563c55a9f124b8995803c482b447d0c783626934957c31bfe22935420ac4b80877e7a5bede20fc3879a059c2094c533c1e5c9b1d620ae06aeb9abc45b041d84071d9822b68cd6d61965918bfd12d6e08bc08eff00f5789b8b11d4a8bf4f88deea61dc76cb7f42ba4fde5006440164fc394bdc45d70edf15574c02dc312e228df162e3e840d89425ce2231ad87da238c8c3b04bffeff00ea0946a22b5ccbf3531783f895acc903e2823eb360dbea39d0f5e6b1c7e43e4789d9ea74e7d231a41371f74069282e82068613a83ef2a6730d58a844047198bf5187d48403ea67f465d4c664ca2dededfd0daea0706e6f2c82f1bee93fcea77b47d3f47213d25b6f4fc974d00ec8affdff00d4f408d5bbe77113eae2996c9bcb51c64301d93e8b1f5cf4100b60903db18fc0f8958fd8e0683f307add450b25c3833ea7e26cd455cbf17927d0e28cbd7cc2dfd8c102a5df73f1cc61744b0cd2640cb3d788cc2faf977de998cbdf8e0067d4fc8fea2b4fe38a9bed881a582bd119ab50f88dcaa75f20754dcb9f93cd44f704822a25e9ebe390b08ea09581f998a60e95a1dcc010e89abafea568ee371d5316d3bc104341f20d3fbe6a3e6d9e5f6a4144589f511f8dff00773fb447b61d566184b530cc46105b2ff532ccdc1aaca1c1a0f90dae5ea1467295cf254bd9e2e5f43f1eb58e00abdbc02b44cb251f59b65c2e8d7c84ddff00ac27ddc2552b8578ab865999af5708478fc23e3d55d30cd172e6ff00132789f982d1f9263ba3fb8dea3b86d825e0bf72e597f596218da0dd02e76f33b6a124efe39d45b6e68c41347e4a6a9b753707a06a5ca2a1b156053fb4cb53ab822591d60638d23d0ebe3cb73ebe4ca0b637a86b82a1d62118d64e18c770c8751aabf826932facbf06a14d4a36c2a57bdffc16ecff007ff1c05a5b7b83f3f0175300c6eea7bc1e1b1540bb9845ff0005c69b6a2ab6f169fc3fe202e9978744cbff000cb5b7d31fa4dccb08c7515bf49f5ff88521ee2c631d7fc4692975ff00e88fffc400271101000202030002030101010003010000010011213110204151613040507160818091c1b1ffda0008010201013f10ff00b313081f267fa9fea7fb88444df505d4fa27d13ea96f8fef89d409b8ce8344baea79e154fbe03ec75ccc0c535148b0023e88c04f234753ee437a7922ff00682600dc0389b8e8648fc894f1b4d408c41868c4c03ced368274451b221927940b93fb16ef80533c77d06982b306f0cfac29b8661df0350484ae15cae09e71a88cf31b1f2202cfeb7bb34b69bcb03336e0b6e7d62b85e315c264ea6827d509dca5e27ca34397508ea32e531c46559d258a753d0fea7ab0ee88fc38da6d022ac1049641134e0444c92ea1188da43254fb47c1153053c192b8cb369b4169c649129afe95c894109444f48b31dcda3be2ee1ae2efd422a6e60da27d312d9c15ec0790c05513618b054b5b23186ba41f7fa404955cc4245e40a660c1a6e5adc7c1c605708908e885b4085f9083f5188b3c5986169358e89047c1c8085c4f9146ff009e2e28a725b0c4a9a5cc8be82d8ade02da209a94e0ebb899a98457285f65e331d05b502c08a33058bfce1c5c161470890c95185e4a39d39b1854bee7fd61a87a3b8b1c05c572c648743129afe485c1b28db2be5118500db15e20cc6368e6f82932983516f91462f3baa66b88a0dac68754e4ebb0e302a0e60ae64882cb3f9162610df00b7c0d6a6d19831c32880215bf80609bf08461bbdbd8becf8fb391a66f3066e120f883c7b3aeee1bf03d62db1e1638fe3ae58b7d8e954c14f7563999ff00d3866ca798e9a105c11f0f22db5af530de04d3286a29e1e4415fc60b6a31a869c85c51cb939a3315b16695b005a82e34915c9cdf0e07c9e6a8481e746b4332e76407ca2535fcbe1b006f8c4418b81717421f28db270bc94250d45331d2af8a2b483d62996c3e51d38869ced15d02da8b247b225298bb743eb533933cf533bff0c2e019619885058323c6054305f23507bd45a7192263d0cac806c9ee761ea5cbe2ec46e293fdc4e4b348d7067a8e563bfce13a8a37fa642d8f81ae5b786d8ad8c05cbf0acaefbb053e0951c58822c80ea212df10687cfa06f06b0c26cd5b7e08cff9ff00f14a22cb014d7e8d8dcf075316e0c950c33266d0699f2ecad329f10dcbdc11c182e22b20b0074f1b06338fc6ef1817c57c15efc82d21f288a422a632c41b453fa06f8b6df5d2b9fb4b0d7391512ba116927dcb166a1f294b5c579d2decaa5a94b8de5e5e5118eea013e60a42b1643f200c6360cca10090d515bdca0afce6e5b13b393b937e9b4da590094c774f17d0f4ca4a3b9475f82e5b2de15fd438155b791b3f1aa03def174bf3ea9454a3b94b8d3c2adc15d89bf507b2b90837005313235d07b2ce752cda257e05d26566c3a1536cd6ff0019b2f4dd04f9a7feec0fcf6a80c5cfac512d25e392f85654d750d98b7d9159135480254182ed02e2f0ecaf0c4aec867a94e04564c79506e14ea2c2fe3ab0e33782d92d78362fcfa279e044b212a7c65335322fa01b45bfc161799501df0970531882d451be02e6105426f01751703d4f0a2b588b7ce871bca561862a6414fe2b2ce176e3866a0c5799fea19116e0d7e7310ddb813443da24653c8b8af08aadb1547d104cc45df369794f65722836415a718503ec03ae54d91127d916963114ba943445b1e60a6bf123458470c4ac3dc2e2e477115bc2b6e50858fcc37930db2c6d8d752a6913ec55dc13a20be4fb30950f02914f4bcb721d2efd4ca2459ae6d23548d7d354d9e5537053eabc895c8b62ccd2c214ee2561eb6e58384ade588a89b0cb2b80e1341136fcc1f745bd9b8368834a85a9ff00b4aa0f94536fe2ae8f4a72943d37b8f4dbac2e9952ba01c31f8cbcb07158664618a77111a602c3e51d3ccdcc138209971a95fa43ec6b194a3e0460ab318427f9ea2634ea1717425a1c567c4be0a1d451c008272c53d49b7417fe39df4b496f2e830443507592e3e588ad982c09465ca8a11577fa4178941597add4b9c9b65efd3a009946d14c1a83d3a7ce6f9f94b3a1699e68c6912e7838edf1d331223b94acd71beee29288725b5513e436131c7ea8dc95689474602c5b6fa5ba2f2253c9d03529f12f82c6a36e89a4333b988a95d751e0161f38ceaea2b54ae817286e7d6066a6257029a978a7f5ac65ed1e4b1bf88b6df470b9ae6d29e4c95ce457e654c1b898013c0cbcbcff0072a957176cb749b078b829a8bc2540b62d1471753d1e479fd713ae0faa3ffa4b958fad5d25095f388b2f8b74969631a41a83de05258ef96d2d29ed4c1ca1b964d47d13ec9f74b61b9b71be08bcfce7ce6e599966a56ac57fac2db3c67ef9f7453b95a5cb5f5c3a1f912a2cd44a63f09f0e32c717d2d9697edfbcb741a87de4dcdf8282d94948fa39731f0e34e0fd7dd00ec67d2226fa650678ae6a645f0e4b829c85658b6dfe4087e3d9e47332572fc8ef8c8834c17923cd711e504c51bfd5381fc004a6b9ca9129ae369348fc8e20d4a19fea608b7f829969696955c0d4c425721717874c8e509c6d36e977880dd130332d58456b1363b3f50dc590ec19bd65011e79a194da392e00ee604370e7f105ca1b9f5969696cb43e507a71a963b951847e1d4cf50acc78de3b88b8995659c18826e5ba62ca7eb07d5eacd10038dcdf2350470c31f84b4fb7e3692e6e5e2574c8afc6fc892a0980371b726d9e914688fd62fc828d11d48a7f5686e50d9a80bae5a824df5b12ec2089697d1416f616c5b78c0b9707462572b336eba988987ade5e29eb56d8bd04d135feb89a43eb12fc25a6007bf8b2acf604a754f5d727104a36470e4e3a027d33e88e7300d105b8dbfe112a20f6988324541873fb0235c0b7f83c996e61434f4b8620a6b8bf10ce7c79112994980a22a60a79a56c41825a7f88bf26e0a6a03081ca3c2955d3487030622f778e341fe1ac58e60fa89cfa627af09597be29a65252b8ee6146fb392e198afd200fc008d41fb2edca5e4a8a7513e45bf87438d87f8a141cff00316c55df22353ee82373d8474a3f167ddc07cd81a997aa23fb3a1c3bfe845c2de98d9b816fee697865bfa180c3962503f785883a26ff001320e63009fce7ff00a40b6793f7db998607de2c07c104964503ec00b5c4092f45ff00004c6505f785b516483663bfde639325930e6f500d64a13f340103e25cfe10322165f22257f03770d5fbd8db7158c19315bfbc0410e0d62158499172cd9712d0d40685441b8d6d9fe0d4b0dd82563d992f0693fbf8f1e0adce1432cc1ddb34ca8c5abfe0a14370f382204e257822a5270aa9c63fbf20960cd4c3a61336256bf899b6d98df6294c3ae1ba67ad0f991f8b8353107ef1b86080d1963f6bf8b47f04224d5e6268a9e6b448a815889b8722c1fc0987f180568855fbc3bdfb102dc5594be528e1388fc5e00cd15b7ff0bffe070b38c4ff00f898c420585da3474b4978a7fe172ce89558e3ff00dc8a0f3c0df27fc63586a10168b854ecff00c85ad790e579f7fe44469ffe447fffc4002e100100010303030305000301010101010001110021314151617181a11091b12030c1d1f04050e1f160708090ffda0008010100013f10ff00fa304540195a74399203ddae20f39f0d738305a7214e12866ccff1ad0f6be06a6a7ffa7f378c7fae9a00aa01bd03c2c498d9951a523ac85e7490e3df84a10bd6a11e8b142a1dcae0f436763d1a2d8b7a674f15cb0018ad28100fb262a1b64a0853acd494dfc797b7457e7205d84d97a2d0fd85a072d0e06eae2a486b76770f95285a6113c9f1427ba45f0aa460f1534446bf9929255365fc56fe7e94d60ebcdf8551c4869e4acf3415849968f954db4a9fb1378ffe1941280e695525b8da75d3a50485a06d1e7ccffabbb88c32eab6a1e44c22765ccf6273508f8077653d82968f7561d250762b4f482b9e26f85383a8022ed72ae76904cb0d037ef4709ee0fda8e2502062451b46d4aa682d15108b8eed42f708a00b7f0b6a22fbfc96566746a4771a971adcbee87c53cd38403a8fa02055a4b1b05ddc28bdc7f191f2ab9cb821676f0033c54faada931a4026f298efbf0d24d2501ed9fc66904fd9801e25076a55fa5140578a02efa2a224ee52b5a404417132547c7710bf74f151a42cb60de2e9ec56ab4e0176058ee34327d2c725050dea739b989d6f79a43bdc4ee68fff000880a8032b4250c1c2f269a0145a44ea74a000101a7fa965f64e00655d0a0582673b723af9c6b7a88ecd9ec25bb0298814b004ad40bfc3f0dfc5188b4d62797ea9f1096afe131e2bfb22363d21b104898173fb9ab980f644615e4a5927bd82248d0ed67d12921781a337049f292790a9f49b7ac9048067522f91a6eb2d3063654c3736bd741411224f18c5656e0481e9e822db0e3fb8f45ce35ac1112813b0b77668ac47005375981d5e834ea11110ec286dce9c1ea200b80d8de613da9e1d7085e60f9ab2dd9633d81f340c23f8af4b14d507e6689af13c250480827d9ff6a5dea58a2908e0f9145b24dc87b82a2598db4f41f8685bce38cded73b87a1108a5d9a8cfc321b500e0a5cff2c7633c153e808901ad65e86a4473d6a5059410409bff00e5a8000001603ff84c9690371bd45b2a85aad8e285bbc487c14a982b0a6bfe9afdbb24b53bfc50cbc0175e0169211b11faf095ef4cd8001f705d195284a5500257a53a24b852bae879a1c4248cef771da3e86740d5c50616e058a3607a291622946033ee43ef4cf080bd55a767c250192e0dc734ff006726aa91ef66919929e371e464fa63ec3beaff009daa52c91ec3cb4837ecf65fba4696620d3da8f67308af064779ed5a32b1b89b8964e4f505004ad8a819c8224bf8cfb5241dd6b7b9a1d83eab2597ccadfda807483f27d6c6605a4bc987e79a2411719f075b943b58b428b88e8d43e35883d1e9e7343e8c9a2308d5ed2b66fcd652d8ff007b56441e14fe4549324329fc7fa66802c8262a1860af6284022237129b09cdd8a02509b8ff009080a8032b51265d0b09f157c4b2c86ebd1a809010070a59630b234e3ad1a083fd24d65c7ba0e3cae85220026b1f70707292ec56488e5077f8a8a1bc607bd4174324a06973400ebc0a0922f7787d6008eee9500f758a0020b1ea830ba5d0dd7e3a2d5c7d68bcec1e99ea516b510911d4a18158131a3f03db6a45412f06dce83f273f4843e49c32bca5349d0f908f0d0757f25317f38f44bb12c79a7253a59f60d6200d5c3458c8ef516e81b74612ad8e4863f5bc7b6d51f54104a27b3e0aaf96087e48fc9e9c18147dda7c25360f70951a678bf745475aca11f6f5eb4e5058589b2693b9e6bb9d383712c9d2b2e12a88e757a16759a49a185a4efae1e725408395faff005496b41b07c144840687fa59a51036b5e2956062cde02a4a2de2e5109dab6ea62019bc12a04c9aa084ea5248232063a9fe3202a00cad02c18374d79696997214cbd37a00b5883b9b50d8dd5fded49d80d07eeaeb0d11221ff46e28035b1105c2f49d0bbc453dd72cc5b87e72d23264ad108ba8128e9a77ae6fbcc48b685dd2a71fdd0a4644505c4c94d44b3ff454482cb467879a4cbb6e7e689080c07d50a4c9877bcddecd1168d9751b9d97d936a00ee3b089094512050dd67a91aebee5183617e4680d7a97e1ace63dc8d36cdbd07ec076e41b1ad20e0a74b3e528d997f74ff8a947fee0fc7d004121089226d4b74248443cf1d9f7a4baa850ad9283bed017e9efc3db6a02e41b01247e92600425c0893e2a342f058371dca1f6d11043aa53b452654ca95eefa8f3bb8909de899b45e90f9f71a1111cc50b78d1ed7a8a5025ace4102c9bff00cad1b6fc7f8d3fa28c8e12091b33a071a276929880a4081e76879212cd5d51720ddbf4a100888dc4ff004888d06c1f054cb04580d3839a22080f49b039eb402001b14a86870e8f0d10884dd72bf54921d41bf271fe2902ee7514003411264a107108c0714806911113a5124c9969f6697c7163dd3733ed56559195ddff0044b699a94d5041f3706dee872e1e478b44329ad40852456775fc52806781ec69f3cfa474cb2f67eab5ba0fb0bf8a1023ce8545206e25a1a585330639144a653fe2f3f5d9030094b03a35109c7b91fda3dc6a0600659de5d1a1fa30323da81793225fa7e07dea1ac21bbfc1a93186e5eed0f819e0bdc0d104a43287c1e6858be9975082e66d7831485c50f5957e6a41214f71f97d46811697e9b1fc55827464764dc6a0e5990de27bb993bfd0669565a66d398dfb60f3492480c245ca15772689b8851f276e7f9292008ec9f4363691211eb50a59012b3cff001e5c5086d96cf57f62a16a757636a93926ea421bb44de9b1130101f92982304883d8261f7a160001090329bdf158123fd1eb3c1d783f7495c25834e0e68c8c07d4a86830e8f0d5a427deaa923d41b9b9fe1202a00cad4ae9e861ddc7152289c50d242188efd68e57df46af9d94b2f23b522611a7eda29b95932ffa2704d34362c7ba9e7d9bd1f463ff0046bac206de7ed8f8ab6e00797f2d4a8a5f53bb584f74e9cfa41d6416b53ba9d03090f85a002000d8f4498ba25c4c8d24118f61b957e26b65539096a147d884f637a101423a9f4b8848e59fbb6ee53526bcc378dcff009ad633be9e1d9e3d01004746a506dd5f8a545cdc3e14b062d1c2ec4e5e2b02240c73193de3bd2465e34ae6857bf1a0406292b77da8b915b0be0525c5aa1ff1d694340ad2e8e9edea3793e7c4d8ff00325255339dfafdd1b9952f3fab67fe9f48ba2001c897dc6a4b32a3d88f1e8a6f541b0275a82ac128060fcd7b6c5f62cf9a101f824fb59e6b306e40d4006491580e6afe0e4193e4df92f4e6d10f269cf3c8a73890cec69940645eb4fd6d58538760381b8d2365e6c2b67830798e6867fd135bc0dee0acf10534e0e6800101424cab0196a64a9fe6f50b20273698ef28173a9ad0804446e27aaa181c3a3c349aa4f75faa569ea0d1e4e3fc1d87707cbb6d4a0ab0e5fe62840ae416879349838c64140b8c33b47f654613b52cee9ff462e802eae94cd9d6c731fe074b5d11ea20efcb52b8b644c7476e5ed446cc020034a22732fdafa216b6a5a1beea5de03f741c029ca96ef8fa21b25498865469f3ef4cbc8362faa7016a71883323ec5a97486aa0f50a408d687e487cd08fe704a3e5a02a990b26c993d4c2425d32caece1af5cb180963286e647a5698d354be1de2b93eec3c57bd2a306c97f99f05fa55f4361905b0d3e846ef0c4f62981d05722492cf14f219f191c22c2b089a513058b5113197971e9730181cb607f6f4aac91866806c01ec51b2b30b9151b92a716daa3646392bb8373f66b428040308e1f52a19c3f749f854f3921d104f33e8e530ce7513f34eadd58b713c51041bf01d9dcf42c5a82e13cb98f0a1b3965085b58891d2a570e05c11b3f54933a4d588e89b9494824a309e1dcd3a60cf2fc0c26ed6682a8d199fe39eb44da911e894dd14aaef33f36479275ff0042d392e51a05497002c68d8e680020296057146ecd87069f419862836dcfa21318ccee6cd622ccc767efa02a00cad134168daef3c50ef32caadd8d084469a1255c92751c3c3a546d5c31046cd580254ae084a010064633fe89f841f002eaae0a4842df43acba71d75dab09967bd018284590661e1a5f8425dbfe8f40116a4bd6b054d06f4000080aedb54861dd01d81fcfa6103ab437956e026dbd427b0024d22fede89e8582e9c4fbf97d0e81f8be451d26b551ed8f152344ca1d8b07c5079179321fb3c51d8720d05979dbe5e3d6e5a281fdd70f71a7759960fa8dbd9a90bfc0285001963c9c43f4353031e54ac526fd77a21397c50832b4093d77a7ccb23417f70b4148cdec19cf5cdcde5f47cb4cddf6b4eada9f5ad805a5a06579cd22463897b7d5cbd8de92446e3937a6085f7a5efd8f84a65d59333bfe4763e88789673b07ee8474581dff0087d9ea3d9b282f6fbdaa9edc3f0d439355dd6a340b884b1cd1640bb430acfb28059813a0c997de9dae9bcb3ff349111d879141aca091259867d84a2348c216f12c749a29342d1d33f9bbd47a52df29910c9ee224e428ac8de910913b7fa08893180ecffda70d23dc09e8a20da840063e8b1ccc8f0fa465f312c50880cba42960a0b1b9b85365952bcedf7ec9493b9dda66c24dc59ff8ab0458a24ff6b359108493a4d1a009eed02ac432ef7f9684b7957575ff0044d3da7886379bea6ef4f4c39577aedc1b157f0abc88355a7f6291a64236553b5baaf3c7edefbd5fe4195a8ebeaec6cdf7ff008a30992bc050632b9d028801d4b8b44a2e31b0fcc7b54d33200589017b0d065555babad1e9fbe28856e74a97b3e565ed91de69c16e099064793d03e28edd0995a62804e3f0d5b7d011095bf417f8e7a34b3c54254e57d0c4592300dd701cb4289df4cf2cf458eb428220700707a9622c26a3a2726687986ca61a7275f343d95843f3529f20abbd59ed2d4c2920b5b9ff005f17f587d6eaf71e7c296590db46d0f3e5f40605c13a64bb214f3003ad1303da4a0f010308dc6942406e7144f04d88852b4399990e5e69c473c0cf2e9411d9473a82fd2ad45727e7faa40d03b1d28325b6341bb4112aaab2ae57d62e0dfb46ebde29db2afd06128d3987a82b3a5e1c1bff00a05636a9f92bb801e8ff001e80e6045209b239fa1b5182fd5ff9f34c8882c3f07340403b5010a76a5e0c069c1cd000407de7aa34061796937c62d2fb1febd247110ea344b1b0f1bd38908085d0fee880294b767907ac566993b8ff00a384f045bb688358bf42a5ba2a12a72aead1a317b12db3d0d7b5211d026b00d27f1d68842704b387738a629aa3e81411a04a5e74dee1edd08e1ef87a356e6cf5a0353da6196b4acbec00a7dccae57d0139c902597de90515835081e47d0816b0301de1ead1c832bc048434fd282c4842e2724f73d2ef44cde7fe95221663ba9e629cfac5f3189615c0fec4d204965d0d8360da81580969126dc041f7c3adf8d6b5734ae56eaddeff0052488dc6c8d7e7f8f78a00000580d2a4651627803fad4d4bdb180e5467d8a045b93d999790a80850494d8b1c94d9241ee0fcfd18049a0755a06f1205944c27499a8e3404085a1b23a0d418593f2af814dcc25f1b7295dc680dd11f9142a136c71c27e75a89a061308b4b0f40a210c38e8b3aa25dea2aa6e32b6c94112aaabab95fa4e06f0f0fb8f9533d9496088cbdbe553fe7a659103bd021b032e87f1eac0bfa3de9c3839b0d224a475a5a81675967ee841460e6baea1cfc51200180f476b01dbe0e68c8c0fbe323573185de84206e22cf2501400299e1e6b9a78551001977bfcb47265ba4cbfe8d43d518012abb522275a449a86ec7620de6ad25a0aebcdf66f9c5436959247bd3dd0900de3254a901d065a022218cea17f4d42416471a438a6732c975dee530f10def5ff8345780405841f7bd06d022eecdcf4d34bfe2d206a92bad87c8d29d66b665f01e8a284bd0a7040e334383e5ef532661ec930f21076f4b26006eb87dfca91f26e1b023c1ea2f4aa100195acdd15b5b586ee7d8d2a65c36fd77f05e8ea3bcb0b8b8eb9f5398d1317c177da9d8e7483ee1f1446d5ba0fc34e48ddff085290875cf268e271d1fec3dbd6f1e3092238469cec1f86bbcd4600c0aa766de6834ab12093a24a84d1c6980c8d1b1a30873f2df8f69d3a533282ffbcec73f38ad9a4ec6919bb4977b504d31eb20b63b45f96a3455a189bdd8a3400c4cf134054b2ceaaa5d8f8a456a718a60097845b836477cf34a846311eaf3c30d486f2539eaad7a678d7ea3305fb261ee69bd340644c351bf4ae8f68276ff003c92e60ff0fcd6013791a5f3d3e8f3704d03af68b934ccb06c3f051200180f444780ff00c0a32303eea02a00bab4bdcc3401bf0526c05cca54735183023cd1026c3032504141c9b9b943c32065c0e79e684b7957575ff48eae00eb78581d605c4734e66a27c364486567431ff952869e0c1dcd29f1748cf637e4abe93756775ebd3343e35424347ee9092541d5cbe1970fe9d2b4a5f32223713c2514513d2942c9d9128892e2cdd41fc352ec7dd4feaa25a5f8e5a0caaaaeaeb57d54205efb3d959ebc52b2c4de04d47fa6d4df4bd27de90a51862ad15afb564859060d5c1a6ef05fd0da584fb8f8a0890f9c8797d4f162033a7f2bda8a68e16b479e073ed451fa1a00f403b119ed6872d0b4dc74430bfb05116c52f72e07bb512e6d744f43e534d021695bba16939e3a98ee07cd2674879626f92ac00329ec0caf674a96288070b2bfb1a74bed29e4dce7e3e835c70720e4abe01dc6f46cf27313431099a7848e501b6a87b35674ec6671a33f0ec267990803f2eee56ede92490e682c043169279694033a30abd8a6821324701c530a31a8f8356292bbad9a16a0c130b738e2921c0e9bf5ebb6da518458326510f81e18a791905900658d9b6bf4810255937ad4ff002e1f8a32045949890008b4e1cd4d3db220e6191e696370466f4c8ba9fe6a011046c8d0cc915615fa1e2825267a7f71f434090a07fb89a22001603d1dac076f839a22080fbaa05500bab4b024aefe4e292906e03a7fca003cd92494ad918c2b036a2009be1242f668c175120c959a64bee3fe91fc0b8b2c6039580eb5c3c1c8ae0e0c1c15219748d1bafb798a364085a14040156475ad7c847e0d3b7b50dbee313ca3f150a3d042e3bc33d7df7a8c0e0b90d11a0124ed7a856e37012eee49da89744aba25cee1e0dea2825fe077a064282700b17d9f7a0baaaababafa12204224894846e83c4b27bc7158d93a3c11f9abb3c8001df7775ab0004069e8390cb8006ad0d8b09d62607b41519b0ef285deecfa23f224574806ec1406c26a726eacf83bed4389002003007a017191882d8d1f03ae0720174437729b4e0f0ce9c3fe843d30685400ab574b9b694040038f58a90a703d9373a61d4680c661bf411d0746d51b7490f2cf133d43b6b448c57fbd951d7afe41a8f48b4a88b1aeda5ddfbd1bb38c24d43602f5623a375aee2b7689abd4511bb35f4a190d5b66b4aa0892a21abd04ca032f65481c912263a294741b37128a0255bab95f470772e40d3bb2a7374cb1a98dc8e681309364691e78d678fa49787e753b0cb648f441b92a87b69c515c85c3bb36e4b0f0e464ff00310088236468572abb0be0f14b95df77fe28402223713d3f8f87d1dac076f839a32303ef6ee08f44d6aa6417734ed1514d744aeeeb455bc4a9c4882ecc13b52482dccc1aafe3fd349710d1c84bfc714d18c139e397bbea9731b04ef5a7e8321dc7479ab8b50090cec074da71d2c545bc83bad797735a88638e07f744dc9f827a8c3daa08a12da8c75b55b2574bc45974cd49d3284e6e0f11484c3aee249f3f609f242c5acbaf6828829def4130f0f67ea2700cb439624c2f8bed481829c217b092e92511991008800305313819684041f580608449136a3b2c92b1cbe6269a5b0db8347fec4a09a2350291c2786a264b4f2ee43e6a1ac2111693380bdbf5445ba46e94f327a1463195a1020dd89d616fcd59784dc9c78a06201050006c187ab09486625a8b3d2992085e93cf5dbe92491491618793c926b40e9440db509d85c791a27027e03c98f54ce10db012f8a514ca8e7fed561390047b35a1d55e7ae3ed14883acc981891dab15059125a1fc1b64d3015750b080ff31008823646a6648ab0b7e878a056a793fb8a100888dc4a991c2caddd8a55480c1a7073400080fbfd845fa6b410b95d4818a4f085295a78daa12e2aff00cd7fba0009658d037680b7957565ff004b34d84abb2097ba48a80a8196a32705d60bbef7f440c8b0509c479f416a30191391a669694efd7fcb567c9ea6ff0036e6b4618a6ce2837508181c95eb34113764191f663b545c23921605bdd67bb52af7ce756fd93edd3ec0dc249a29f23e0286387bc5cc07b4bdfe984a602b9ec3fb41a2333628c8a6c1a5b42ad4ed4e5d7715bb4d13865a320407d920a108489b35daaa2a51b686836c2147f093ad27c378e6da91353aeb03ee134055544b05d54d2a4a0530647c04bda8c3889a04054b2ba14c10d803e5fc546e8658a6ade3cd03227856138a230600b2a5108b7b0de8a0255bab95dfe96a1791164599e185d76500cc09ae1d0f9ecfa8d2c40cac32e960ef51b508f6861d663b0fa3176f51b4729ec78509ed369b3bfe069d8a1633a07c97eb4eb0a15af23a9cd3d2904043bfa783ae884fe2cd93f0984d1ff312487142bb8b873d0f1cd480859c16d19e8b43a707346c607f83964df36cadce2ad894244dba292429907ae5d8ac832dd357fd31f411175767dc52cf5212a5957bd0906f51c05ba4a38dbb55e10e4d9c9b9cfc54e06c75fa104412391a702093a869d4e3db699c889c196fdda73cb441017070bf74364ccdd415f855fb8153a23fb134ff00c024f913dc6a0063935ff53a3fafaa000911b8fc06bba54caddf8b349e58289b0200c07d2cc846d36753b58ecd11009dc773a4afd0a0402eb4443bbf6d65cc094646a2e2f31b2a7730f2508b1684d5d21cfccd45dd4ca597c285251b5d223e3d8f4e3c2948caa8d8245ec1d9e69c54284b11d2a61f8a761cd1404ab7572bf59d80aba4913d4cd34133be2522746e7469a29e98a49eb1243301151831c1898eacf8e7bd25082f7099528d51b6bad56ebe8164163bfe8dcfe1cd5e6e0d11d4ab701d891ec0d8dcdaf928ca0840c89bff009bce299dd4000001603fc342c094d83a2b34c9dc7fd3dc1248d011eeabb3d08f94348a2ef63e78a622ac80396bd2984b40646812a70b4d8e1fc269e8f0c2e2cb1a1cb8a5c39411dc1f345c4960d9761a3420caf8a75393352a2b4368248f712ac0ac3e307de27bd47f3ae2411f6b76f4005126b03f886a5a388f9dc1c9ff00bb50b1a0ba5badaf4cfcfacbaa45de1b9fdf98c6538175680d569ff24bd4301fd75a3651b1303a0e0bf75fa61d6501e80eea1533bbb73e0097b51ae3cd80101ed52b7a58fba32612a2e079ee8dc55c9cc32f76b1b8c3ee6b5013740da480f87de8962e6bd09f1a88eefaa1115a53099058b41f9a8812add5cafd86821c1bcae29925e28d9f876f5bedce865603bb5387708cb4e2d27de2e87204fe08e0fdbad156e3a03ef863bc50b6388996e301d31cd144e6ac3bae182ffcae66159132512244ac8312e6476e973ff935829743ba5fb26696500d3c990f3531dac27d8a9be2bf074d2fb5acde09965c6b520679000baab600955b0148e2489224b0937c067d053156058e8f9ffda44cc03a2dbbdb3da8841111c455a72daca4c0e922fb51de902a0ce6d2b49152646482dd6d733f17dbd2074b7d427cbdaa45cc01ca92de207b52b5089374b787d46102889d8ee7f114a495632ed7d1e1a8239eb28e997bcd2140acecf087f144c86204eea83ed4614836ad35f905dd4b49485755c84727f91d71f4ac50a01a8e3dc7b54ee988b05a3f8c7a73e6efdd26014423ad10b48d1d24b764a121e0ab9821ed6740a384bce707e33427889f42e0422622caec2d2f6d69481590d2d8119ef34c10fece9c43b811e430c2911913ec94e816ece1a324d821ca87e1edea14ec98dabaf498f7a9352d031ac75c1c4ef48270364d787f0fe311100e63911176e36a1cfbb5db5b3da9396f2f80d8e6b278b294167a2e277a72c6c0d3023ce1e637a28b7df030ae1147869571306ed7a8647a7ff20d4312246936b6e7560e69cbfa0ee81a0eeba539e476fc17856c40012d0d2d37507bb51d69767f9a497e13ff0035d39437cc526756f5070498b835497428e7e102b8105daf7a3801e2430924d305bb4619b27b4d378ab15d4d1ee43465702d50057b27b501e00e8fdcb4244923590bf60f598b363a177c9571228b8658f61a54708fac8fcdfa00802108e1a52d6aa6f5acf114a760aa3da3f342b7f297b101e68f03aa7671b1fcd01840dc35e4fc9f8c7d312b650e55f83491c854b786f347223145adf798ca530bc729e061e83ce1cf71f869000d9bd340aa02fda72fb93b7a09bd86842e1a4119de725322ac92bc8f064e9f65646e3bb4c781a5418016f2a0f78f4e0536eac3ba94fbaa7d4725ec344d81006036f417ea31bd100d622db4df4865e22c88e288e302574409faef48ef01d151412ab1a26688dbe7cc6138487bd16261ae22e8c3ddff00c7a51e4201955c1579077127ac5b07299d232b94abea4dd5cab5d104b4fa59e628a10bac27b11f9a5eb59865d7d448cad2b691ff009fa7ce5d01537b3061dc7276a3825658423630fcd0d106032429c0956ead202f8c67c3eca710d867461f850d886c6864f096edcd4e0ac8bbacc6a3a942d7f517ff003bd45274c8ab83269113db932b1ab07b523c1c8978c9ee95e8956e9eb2227c50e0409dfec2414897134a03081b86bc9f93f18fa1d0c21e84fc280bb4ff005fd4519ea51f45acec4072d345b2291390441d5f6a3b1601276320f91cd085157130fd6eff003804ab043ab0ef5d408a002eaad802ead8298a4322c6406490c4dd896260907314d5cf34bd7d03c64341859190750fdd1ec226ea249e1431f6071cf7ba27dc127b3d256f1ed2ff0098a6264275447c2fd082502426bc3f87f1842f81383275cc2f6a472bae2ce6f60f417d5701904a79813b14bc475d1361f734c0464499ff00e341c1d4200355a8e621462273f81ddd02f5dc11e5fc5309220729d636ede7e91232b4ada57f7e3e72e810057e0aba396c62a304383d6162ec5d844f9a0430ebea49e451c40869139a6145274cc5b27b3d6a6023590f708a16b2eabef40a89182f384f233d0b7c50000003018a4648947b0fcaaf04a25e403e47eca414897134a03081b86bc9f93f18f5e627f3af16919efbf4b461213ba0f87ede8ce9488945865258ed157c102c0890e14034a1f5094452647f10cd8e06083549742837c38fa812809a528130951d759cdff27a85a7325b602f828fb19d5174151903fa15bf08a15057d26fe414ac262d5d03ac2d497d8523ff0078f41c4d2a401cb4c59d9b9f98f1d7141d54dd9d0d8bde1ce8da1a6ad1039752f3e8f6bec3324db9493bd6b53eaec396f4f553ff00c6b93245cc5d88ea84e83b945012e5c02ead04bab81d65fa448cad38e987f7f92e8025d9e1f9a00000343e9dc90f61f8531ac4ff00402f8f4d2a7e87c9c8365fdc2d142c2a1baccf658ee7da482912e26940610370d793f27e31e8eae7e5e889cbb406ee9f4e94d1d00ffafa31b642991944d495c5f869e0402b040263ba3b559b813601fcfd515191052c865e03a83f83d1cd0b50f39c305b239104efbd222888991d3d0a2128f4708ec97bfd9418c201e547969c6d3c05fc544f0a7a0c7323977a9dcdfbbd151a132527721b34c853791422caac58f4169a04f2c322d71fb456a600b9755756904a06c9af0fe1fc6028044b23a7a477f2618f11539d17a15bf967ff008c58abab7a98c08e185ef5619b9ba16ef77e0fa448caac297ff39c7feba01b173772fd7ffb4923f357e8d466cf920fd4d7096eda13e14ef4e290f1a1411e11fb6905225c4d280c206e1af27e4fc628485943b0be66a646508da0fc9477fd2488600ef323e7e82a728bb44f07d76d3f463f15c0cf91247dca3ec00ace9f60276a914d879a49cd38898809dc641773ac2d0dd7e5fa1900eafb57b91a2b54d57ec945b94197c3a62a122eb2263b4d085caf402008d91c34c12ae829d910ed1451e3c41f60d0f26c045de49f420940d935e1fc3f8c0500896474a318804f60f91a7620b8eec5f0bff8c9a08dbec1ee8a554aaae79a83cf1b322f173da9c3fc4a3d448caa320e59443fa70d72e80000000687d92ae276d6f782508665b850c9e1fa876d8550b0378baf31b51e50c253a23e7b73ea311a51006eb4fa27921fbd8f34786e0868ddb708c2f428774a2424244644f58dfd120a44b89a501840dc35e4fc9f8c31c5f7785f029d3e03d47f8e94a3984fa653e51979087a03e84d11ada048f75fac40646fb5fcd760a6047efc3436912da5be6c4395a5200c8cd00d19fb733f04389fd3efa55205d41a6d660f89c8f236edf6904a06c9af0fe1fc611711043b9fbaafbfedbffc6096c4c7baedee9daa7366e0262138ed41723357ab2f929b3f7920dc6cd23065b35b5f1dfde94aeaff004f4a3dacdd623ff1c77740f57a01af0bbd78e99a60bf73a4eaa8fb7b5150449f096a724fd314f28fe3227b55bd4734e0ae77fa069b1a03c1396a5d9257b80d3ab7e94f41bd86aae81bd2d772da27cbe03a1e9a3503bec07f4523a66eb4625abadba50a484249326e53c5e514c91103456241b027ccd05a4e584e86c4efbb5288cc099e763acf4acba1d57b50285e42ff00d54721ba27c90f9a6ac980fbce4f3d69c74ca07a25220a2135d80db0bb44e26253819bfc325439a334a426bf42c388322591a6f3564b966dcb43afbc50f23112c1203ce5e0d24a3eb8cd113ddbc8d11571da350f9f6a97918ae80e1dc7c8d3ee45729de39193b559d7e068bfda626c72005d5ac4d2218ac7daef3345b5da559267bdfda94c98225c5e0791f7fb67ea0d10a12e69c68c36bd09e1044238934bff00f1534d19d03ed37762a618f345b310172d2ad0d953b2a1fbf49d665ac33c9ad049e309eb95708bde30d0610a0fdc2e9dd13961808ed38ea7a8c140bf26fe7daad43b2b8ebbfcd59e9df99b004f9517a0ce4390fc5442ab32f436feb9de904828911c9ea7192e4e874ee49dea45610242070feaaca189a48c2c479a9215d103f35357305d8ea9f72287da50b3704dea40637731c7ed15094313df9d6be9395c4df839583bd3494de45606aeed34e4c3b0e30bcdcdb7ac920534949f2f6a027de03a23f3e974abdcadf903e678a6a3b588614d0d89d78b70655ee1ee25f35a69a841e4abc279300f384748a8f01bc761ce7ed345819b967a8acd3a8302048857bf1939cd447a4901323b45dd19322927a48d020ec433baed5004decfa45e4c0644d929492fe63ff078a2bfb00f401f583c32860035695a798f3a1e6870c47408a1665d064b0f53e3a503252059444434d9e2f7828120848971ab76b68ed433f6162a12afd5ef3cc2236a59332899597b16ef4a20cc8e849f2fcd3b4a3f76de0b420284244c3cfda97527beff008a112a30d61f63472445c8ff00e20a62696d029d95912c6a5a5e2891aca454db23b40ed4c5144ab757d1455ba238997e3d048cad0806b216e30f86baec1549ef4b94b716a9ae7a3c9f22fa10639b218394f63ad4ce60419e2396f1deb9444655aababe801f3c6c8ee3a34c2550d55c1fb61a728b8664e9fcb53eab3542686100c8da79eb6688f757f20a8746d845d823cd2e8c6444f97cd4199a827a8aefbfd0acd04370dcf91f6ae66135af3d7e1d5f43879ec6997f36a21c63f523f255aea5e123c0794a6ac32769a4bd6f072d1452ccd0083e9b7d3162f06bf3cd1194b7529d7478681a31b6c4800c9ac05e98210058329b0174d0b16251e472b343249f76db08bb12feaba4809ed2b8f307a8de923cb7f6f6c507b16255cffcee9d308041584bd7fe48d4f89fad7b9f61b8363774f62a5a5131b3038000382a07bc0fecd418ef52c30cdb527c3276abb9337c0f2fb48c74cf553f54d036f75ffe1dd97a3365b0caf05e997352ea0c84ec45b33e8832e3c2acf76d51fc52885da72f8a5aa0ba5649157a3ef53230e7b92790a1232b57c65687f23e72e804c6010542949f644a7ba8c72101d583c0505f301289603bb054b45ac354d83e28b85a3ad0dd7f1b7d08e9034894e4082b5edaae4f34cb386517d7e49f1d3ed8f841e48cd9f675a2c018f425b4ee824f8a1149cd8131e0b4539b2058bbc9cfb6d510a84f568bf3dfeb086f79454e05d92777a9f14fe944214611de8ec100593b1c85f91d2b1bf57dd38f16a9361e407ba8e1d84d2fff00667d8ae99a1838291e76a0d464691364a978173b9f97969aef44a1a042e9381dc18da8047da51d1d9e1bd21291e28e800719adb9d685244e8d1b284a4329ef4cac3467456d259563960a8a5099638b38e56efb1424c976cfead8ab2367b9f4219767d4fc1eeacb3b0f1f68039903c403e46910f6c2ac8f1f7ffe1a672e55e8c7cb82a00b20f784377575f629d7ac0a569588d20ba72d7a63ad121060083f8f7eb9a807e7df9013bd25a00bc652aad800556c141fe20e38f9cba042b65e7f550c37037c07750a62c712dd5375f9a0de0238082a6ea2f0ed61e57da8f4809fbcf63ea41c832a63c3f8e8b49813191984b88edf2350620224c7fc744fbaeac2776827e681d8506c95b9d030a16eec1deb5fb1609bbd699954c27b8fe47c45ce00c125dfeb20e942be19a2b513446c94083df45d7edac2824b94f635781a0b76d437653dfdda11218b808a8046abd74f48097ed4140226f42514d80b9bf82ad3c28b16889070cd020c030721689d97a5428b078c45a9c1da98f14b0c328014c588ff00d0ad488a8089e577b2bb52c00997940ddf8a87a997cbbad3a28f95001069e90c0900e209f1357c523a4a49e43eca8f0b5e026bca140abf9a798c5b5e27e22f7ff3ad1f09b2ec195e0bd7e265d04b3ee15829a805d54be28ac4c9bde1fe9090c50283713657c12e0a24aec14c16c7965accac2b606ebb510084b2bbc1b1ebfc7f3febae54e2645d22fda920d0661660b583a6a92e85106c825ba14d2a29ce9241ef2f628404de5de7b13efe8a860a3aafe54482ebbd23eb1089641acedd937e3a51b5c9016da8ef8f6dbef6274046d3a09e169e048f2bedf543ea7aab0ecd293b9646a180403433150d88a170e2ee01ee59d131a752751344c2695187e4145cbedf5ac0d20702900655da9dcf4411b10dddb420de5851110ef1d5bffca0805d6c5088cb75ddf51a5b38148d336f1c21f234f20e591750ef4e997a7807f094db03fc3135746e44f98a028f24f1ec34d7a797c98a2c3548b63c18f14694ae85022ebb315105b1ea2afec91496a270708d5bb7d88d7b0fe47077ae6e824980f7a53a40bbc04f789ff3582ca464ac06aac14b8cbe573e5413aa34c51c2000866927c227a5439b267bb91bf73d9a74aa26c1b5cd188e12277045b9f5093fd12150290012b5a01e55b128dcbf4834a93dc80fcbc1474600be5feb63e81232b4ada5ff007fedcde0f420445ca211005d5d2925d4aed0d87b055e2b01cec3c841dbd11eb0279280532e7593f9f4bdcd44128bc37a1423301117699a094c508ed8cfbcd03861868d93e8191a4611212a5aa5d7772ea7e4ab290e8097ece4ebf70031901c380eea5260a68eaacad024161b03f2b9dcf57bcec114026d8b4eee44ec79ab91a96ef73476ecd77b95bc5039641b3f1b3c7b6dead7e0d0ca502303e4962962043dc317771c67ad59ee14774e0d7de71415404b0eaf67249cd266ebd46930e6b423cd0da8ecd735ecd0f12e852088bad5ba7890a0506d6147aa641a0f57481b801ab4e88f8f7f48215d86df4a8b7f9ed48eb223162b441d62b25db26bff00554363dd5695ea5019938a050038fa8c54007128f152032fba87ec28701c1213dd7da29eab110c0070b41fe6596e6d7401aadbf15d699d0adac65eafe2d52796680df67a31eb7c86902ea6cbd1a4b6d24fe1900ff4258a01d52d6042dd6cba6eacd00aa2c1ea776fff002fea2465695b48ff007e3e72e814217165e07f3af5cd28cc0c1c867da88813d99747740efeae02c2786808ab86ec007b0fbfa48f2660d120eff0a912c2f000879b79a971e6c2193419d28b368c5d7f87a882e48174c9d9bfbd5baed5c01f94a773ee4a8b9e93fb1ed463a8a87f557d5c3809e4de8a30bc5a0cfbd9efe8fe421e40c7ba7b50864a0dc40f174d11206c0203b55b006dbbda9c3343a60618007bbe1cfacff2dc73b793347640f6175f61a446121c45242b1704f45bf3f35a6837d6ba3000bb38266d5afc2a002e5258bcc2306092a8d60925ea581edf4194290806eed578068860f25a3ff0a294213205d5d546ae2f1145e9ae573bbbbe3afa3905cc7d23359ed4f2d3663eec5ffa43f9a96f07b03e8b0b606ada92857642d1798bf4f4218900d65e058ee6d59158180c8d2211284f4e74f7261d17fc9419628e9d0ad6340b2b4e0a263324704adc1017ca79ef881fc4baf4fa0fa9d31223448a0504004126a9449aad363c26a04530c2ad92e7f9f0e5364c482dd4b077ae4e42099b71a071408cb108b699d357b6ff00409195a56d23fdf8f9cba07a14ecac15fd7f73f3d7288db06e540f8f75263802f5fd1ea9c586d91644e669eb051449a0e13f25460704e1cbfa54d8f083284936617d1d1c2b5eaf9076a8c51d9f61fcdfd4c8b8cc224253d847ce6ebafe46a67892c6db3ef67bfdbb486286ebbe43b55ca4bdb463caa46a9684912838c3de36a940709b0d07a387b6de8e51130df67cc3da8c6c47f03b2fd9684a0a40c89bfd244296c38701ecaf728d93b74986251da1ef46aa70a89de9c263ace956575dd1c61d3ff760196c41811912f2759a688ba1c4f1909cc2d92d25218e120b78b1a8329bcaf01422696817deea807cbc07608a0977449cbeefd352372465ea2dea008efc52c751d0fa8cd092c9bd9a5006b7ff0005d623f2e557dfe174eeed495132aab46c20d5894c1083fe1a45409ab2ddc8b8f8a8bdc21133921b764d03cccc73a97eda9df69a491af206cbc27b30e956d8996424f9ff001de35170019574284f6b115b6287ab1d6b6f6e1f822f0f4bd247a587b5f1da28681cae1ad27c6940b25762ed24e87ab412500a4073c9bb4a97a0727a0568da9483e697b5429c5721d75471f0852c631325d8e8e475399ff3a7db28838448390b526d4401ab50a4b273559f6b1dbd448cad2b691fefc7ce5d03d631ac4fbd78a44d80a6d0ba1c55ff005478e8553aade1f420bc3b6bbf938a50e4dbcaebdd45e010230e991e4e2957dcb5b0b4d8b53e45db88329f34284748023e87a33a22eacfb37e8b4c70d09b1fc877e3ed28704ab60a9ac4735bab151094001a02f787de8232104e5e14a8d163c0fe66cecd29da59c98ec077c0fbeb40c850a244d9a51c873b8e35368ffb406517215db4792836e3a75344f66b306c487b428909308c9531616e0d0e6866c497952c1ef140c8cf9abbaf75a6209690dc5fc38fee8d4f698f6ac381e5489033231094c4c1248b26c3e4d325b0b4addd346c10e08a4b117826b67b9453d3d216281081a1f62345648d4c9e12a24d801adde0d632eebf849f9a8719d524f25f15e2a1f08a85ba6f3f3481281c7d89d1a2f601f8a75b327b8f4bb1db6a6c0ead65a6ace25d7803d82805b0b1e531a1825dab2062d37131db143b35b89ec5fcd3eb9dc181c42f1d9a194efec2d8ef14a5514a694c3181a6cdf352dd155bc99ba443fc5356016eaad8cadb0558168ef8b2459716c1cb7a89b582dd4562b2ceedb1c393da28906c727de4d29dad6fe28c21ca364e3778e99ad9a441b5936d4a17f30d16493bf143772e7820c1c6b43a2f807b2c775f8a18002127e71a9a13d005833ecf788a5e25e6b4eea37f91463fcc6af18fe1b8f70bbd09cccbf13cc7a89195a56d23fdf8f9cba07a9803562820030538acaf53d654c0a8c966211fcd7ae7e8402014423a94a14f9f85fd29c51f40fc84f8a12eb188cb11395cf43e96422108ea524ba775d5e3dae76a8792cc9aa2ddd7ee3f6646adfb265f2f1436e0de2ef281de8091044dca501898d43c897bd6340bd2c2c3bd96da8b47488acc3bf28f66a450dc42c8ff00613d27f865799e747b934dbb90bde247c532b4e879251de98173912eb148bd62825864b84e4a201250bacdf04fb9448256891247f871fdd3d269be7156508322108d0e9a6e040f27e4fc6026decd0040038b7db3442d8411d1d2a4245aa7c48a5aa1e81f989f15288db487dc8f3474efaf103352643ff0254e086adf0a1847345be5af9903e4a13575a1c0a9c0a9aa0e8142e133a3e052d33212a72d7fe3bc0fc7a2e4cd006daabd31ef5ade1985ca1aadbdb59a7a090dddb803d8ad33521ce9d31eb359a8d424ea90d45aed254ac2356e79a1b957d852db99382e2c4ff8a9611c796301cac072d32e62ac0b1ee412fb455a302544719bb1ef58729444efd79fa4d6410358afdc4f6a005b6ee8bfa5b1411ed0ce6f1b3a79fa6c861a680a1ed1463fccc48c5b88c78a6f8b3b55656a3c815797e7d02465695b48ff007e3e72e81f440b379f5556021e9ff6a13a047c2de435fc7f73f3d73f70d229b8dae910f6a5720a0d2163e13bfd97ead80e507e1473048da8017bc3dbd22412b6581f14bd4690e32f2d607260908e5baea93aed2d4ec9cab91b371f1341d40f481c27d02c09c5f22935bed5c3a131e29572cac123753fac512248ff000e3fba7d31383180b77a74ce3ad59e36481f93dda3ee88900c9cf77464b494464bc24f65a3a02dc183861e469781e337a2def1470d2512270fdef188b4ccf525fc5635f44f8af8270f8695fe3f34163baff9af9042fcb4ef94df253d3d3d7e3d0050044932ac5b5dfb52de494b94e56b225680b977e3347cc4b4bbf838fa420055b01ad3611c2cac24d9b8badcc4cb1848be8fdd1fe23469a42af117864eca3bc3a0983072b6eceff4177bc24998cf53d418f75f7268634d702101e5f77e90e4d2aed4aee2022e78b25183fccb1d82f7028d692d06adcbaa5a2d06b46b355f06ea3839c52b695fdf8f9cba07d292582439a73e8414f490957724ed5961177d7f8bfbfa7f1fdcfcf5cfdb1cb15dd1f9ae6c8f484d39fb1165046a0bec4a9dca94642c70cbc3af428601006447094c3e4166bff40f6a9cd634e8b83b83d0b9a3031e9e433c13a339b95caa9e3597b78a128404911b9f43104ad12248ff000e3fba7d32a04bd8963aeae3c50154966c26e9de8609ace875263ae69d15464808ab69cd41c8c49d3f18941783c1dde6a6396b3c06ae5ed34f457f31e6e1e4a9c2dc2f98cab5f9a8ff00160754b3ba47e714fd7304ce72ad5a6024b83cc681a4f8a157105fd7fa420055b01ad21945901a707eff0019b702177932f73ed41c609e2478f7bfc5c637427ee54279127de7f2f565803191b27b12f6a45531fd2dea195da8e6db7a9c780e688105e86180bac751cef40dfbe496f62600e2744ff350c8ee45b7b8a8df28289840c04e3ae3bb14f892d2294661681c19585d0a4582743e79f34361ff00861fdd451d6b76a1a1904c3e8c5a72bc50004060f520a66b71d139187b5360702c586fd11f6680108c83fa1c8ffdf4fe3fb9f9eb9fb40b212f61694999f7014e7ec34500d6474a6c2e95627821939f7e45a06941d353b31452564261212424ee77a339271857ca9f140082122323527df4ccec06aac01aa9442d1205c801a04fb38296cc492c6eff0018e99ad455da1d9323c3e8c412b448923fc38fee9f4b310eecf49be877dae0f24810add3fa68ab0c5d2f6ebf8d3d520a44b89a501840921af27e4fc62a04ba33e475cd5da1124218a0c56916c2dda7e5d73fe1078f9180e568df72c39ec6bd5b71538e750a47e0f1482c63e52c0502c06b75757bb2f7fa420055b01ad21945d834e0fcbf8cc85f7582606f369d18cd6596eb4c4821a12c224d08775ff11ab61fa194179887d88fc7aa006c33f44ce51bbf0fe6b4eeb931907e29781d59afc1c8a105092f748cd3305b47daa31dafcd65ad009dc343a5bed9667bc17381d8a31fe623546ea8fd352e01b80195760255d0a56d2bfbf1f397404111046c8d4890e49ed67b95720374bdc9f8a9e8870fc540df1ba03b946cf1abe72de2a35a5b9e75de2a105da41ee5fe88c4a98a21bdf8e7ab537689ec137468f3a35686f1d4dc791b7a7f1fdcfcf5cfd92f98a337dce91277a81f2e1cc47923dbeda8cd15490bd87c343c39becf57e16b3d7d257b343001b24db0bbc19de76a3cb7da064246729e50cd3778801c06ce4e3850c479832f3d3930ebbd21d61c2749309bfb52924975c197537bdfda698248ff000e3fba7d2de04925ff0041abf98a878fdbb972f40bf01456c3b3b07060efbfd2905225c4d280c206e1af27e4fc628d516d0bbd06c941cf43fb1c3c53cba21b23a03286f9eb43a3e4e44e1fbf7a2b081d569718da481f976239a5d71d6fd3fc9bd0292eb3e67bb145cf5105c727a1662a5c25e49ae1e43dbe90a00aac01ad21945d834e0fcbf8cd44a4d149892cf66fdaa11c276461a07f5e0b2df5f787f886a09ea9c95f14096653b669e13d40491cf021faa04353d4d62261fb19f134722820726c8f3582bb953f14ac3e3081d7fea8c5c1481d74ef2f4a915647b83f816a75e894b85fb84f7a7bc5e4880dfa124ef42d0736a248ff0099bf80500a655b0112ad80a197c0c08b190350a58ca92e85161b924f7135caec1f87ac1a94393463e43341071c49f77cd4da49805789299406dbcb228bfd70f5ee768ab05081b4e4ecdbd4f4e823260edb0f6e69e5988dd4b1d9b1ecefebfc7f73f3d73f58554118028d66e0e8ac776eb50334614c62ddb2cf2bf76174e512c99ee2dd636a35cd684c0c81b061a52e0ce95b6609ff000142640400401b7a232989dcece135864a3101adc4170324b41aa4cb0140c0eb04770b1d59eb42d3255e13478fa0da4b0f839687e8779b675d5e6a54c44446687ba73d3afd6905225c4d280c206e1af27e4fc62b3d6356be88971e69a78f423f273fa5a18fc8af80f1af9a22031b51fb99984107fd78a498461bd8177dca9db69105745bbe68f95ac281bea77839abcf84b92dc163cbcfa1885c174fd9485b951d057f8d3e8080156c06b50f388307e4ed9d2d968118409ddbf8a9c83e5fc0ab0c484c1b24b9d39eb40620760807c3dda2597b304a57bff88350b267f854f9a26c6e67410fc7dfd6d1cb13bcf80d12f6e39d447e1efea39a889984862ae2b40485eb97a2f14c3fb0a0420b00407ac73e87414337284659602a50566e409f1fe6405224a0737684837b536ecb17c4dbcd5b0dd703b950e47361f695441bda5f98f145057d280f851d4bb89235078844bafa4d3c264360189ea47baa521040b8d01ee3efea650508489b51a275f3d3a8c9db9a62149bc3f25fb9ebfc7f73f3d73f483a392806ed4f85e41217bb8d8fe193c984c1ab81f77a5fef2b63a48b4390e8c9d228b9110320bfbc239eaab83bea6f50cc45e96083de9e938401d11b3496e19be0df01e163931515d23376c967bd028e8852ddc4ed274ac615103ed43f5d420032ad487cb6dcb177e63feb42c7704c8d7c0e39bfd9482912e26940610370d793f27e315d6a62b60e491b0deda47429187215f61e18ebf657e6b24077a552269ff4ef53dbb10b3d5b78a2edaa0cf4034ed47f1ef285ed83bfb53e14ff00e1cd8ec1f45e9901f6a2cec3e43d4080156c06b5140a9348357a67ae0b4d0e70982ba0183a54bafba7e02de6971ea217c3535c6935ca4de22987011088f0112c70522f28d90647de9322441a9b8ecc9dbfc400e49b928b7dd419adcc603e23bfa858248d44b95b42e124dce2653b5183d4a48ce8d243e6b251f3d61a0e3f0aad16b6b0a32c46d9159e1b1cf4a6170985a3e484f45460ff00310ec21e4fcd59d07cd39f49c93a84fbe4abf6c49f9afe6a7203bfc0fe169eaab6cc3c5098c805caf5fcbdfd440d4cb6dfc88e8d0ed2c9e5440eb0bdea1c404d4491f51286e3aaeb2d9c758da99e80872bcc7240f6a33e71b51247d7f8fee7e7ae7d721e35abb06af14ddd7c1870fe9f315036c5c7fa396ba6f465040100180fbef72273c0f21e42811009209ef712a7fc5172882c3e4a8030fafbb8b33f1e29b046501e92f9078a803a19bb67cf72a259c811862656dc51fd38cc5ec06dbbd37a108200200307d6f900b40375a54d862497a657c54836131eecd2101616fe792753c501840dc35e4fc9f8c5199763c3ff002a4018b9e8a5f3f506359440375a98047fca8f2ad2861dd5041f35305e448e80b1ed4250d8b3efb9ed4066b73fcbf546b5345fa993f55e3a26811353ee57f3e81002ad80d6942a8b2034e0fcbf8c9663d3117e5685ddf9cc20e8b4f7f42ad6ec9eff00c38a3b9c49d607b8fb298e948b468f721a44d3edb7f2fb7fc410b27b69527b500b108885e0c38989a038821243093ea96f700332f02c744da9622700780650d12b34cd1277a762030b09f8377fe52285e069361d09a1b53b5a996e8d2e84330bec2f4f74fcd1fcbe2a03b30a00f803d8a748587d906384407e57fcd971907b4fe168619d4a23301ee3e94f05c01d05ca9e725289e1869cff002e317bf63a26a6839c76f48f80c21624c9ee34a86517342fe40ed4c052d24f65a06dd83a773d24ce1016cd3f2ea340e02755865edc9dfe8fe3fb9f9eb9ab3fc3e0bbf07346a7830049f40df9cd1922acd8d9fd7df528000000c069fe0c15237014bccd802f2d83828e8467da0e06f199376e4260a0a09aba7e650f449c958f7414e9a8624d2aef2c3d1043c5840e0c3da62b478822f0165ea1d6a52df2c3e07a8b50c6b687bb7f668a9c9bfc8f9a0a3d9ba3bbf068ab76041ee7a9ab3ca7f5de2928aadb6dd773f1a514410657a0db97cd4d250908bc1608eb7ab94b5db165f8699644933082340610370d793f27e300f620f745058f2fc3f4cd49c4b22fd9e2973a5a69fa48be0a7d11e81dc65e029d39dc42f1fa52b4485206111c334e055bb2777e9a4413e47b363b1400000200d3ec305d574189a0f793f141002ad80d690ca2ec1a707e5fc66b6e28db03dca236104df27b2510822046be4718eb357c5ada369b0659f6a90c2dc4ff00ca92e63ab254790f6a30b76bdc783dd5644065112bef11ca9fe1b97245032ad5b04ae489b70ea68b4ca536f5b319d13aec3ff9ea84c87481b234f99d90ed2e1e7ae69628ebe502954bad38e812fbc51301dc514e42e77291196522ac0772da040095da97d749c16ecc87845e0a3e6531f70ddf8ff3a1a09f799f20a666f66ae0ccb1e421f23f4c7b5497bd094120488e46858168268d519b3875239a65659ca43161131679275a8421a244f69a31b9468b31655671499d771ebac5a9a4a2f03e24cd116a9621898877bbac1b7a435ac0987a8e8999a20ceb05cb1edd928401725a5c743e3cbea9b42430b6fbb87bf3069e9465eaba05665918cf04fe73f68391b722a76326833ec35976fea82a4fb81f98a3f82a0e935635429f982fc5438ada001755c005d70147a4433c1072447b2e084b79866ded6390da9c891964244edeb06c419b510f51690f16ad5fe679a44612feb838222751cd23b5082f4c1ed4f763879451c5d2d71e341846651f179a1ad46e3e2692dd2913ba8f14e5caa237d634c1cb565e97dc7131c6be17177c1a1fceab90a3024a7757f34d40f0854018d93494c35c61a296a2604022c06f1565dc96448c944a06767f2344a30dd3d85aa14c567bbe10776907a6651f65420c312b89ed43a8d5a5f4403c150a307daa89f484f727ed32b40f7789fc1452b2c7f58a12528923b7ad90ad4c038f724ef48a1e70526b0ea74a5a9811e01c1baf4a3885ed808289bc01f7523ccc1e0565a1d3b03f63de8ce892851711d2809019400ea71d4d4b9ac7df6ad8e3c8ad032bc15631f064d9329c178c179546c6d77393bfc3ae3ecc5b6d09a5b8424286485b8a6f09f8a6206a5d7e118680307f9e246a2720ceba7c8523f97df0b7b8fbfacb1aff00c012d2a8fe8c0ddd67c5208d08963c5106048b3ef0f95327d8323747f0a83784f94a4804644b7609f358d0341bbc9fa82ba560d4e8ee36abbf1c0586e68850134b27ecb279a915749b7b80776ad21ef024f85f9a4b2258f63978f8cd3f42649987e0e0fa973104c00fb66a209cb16c7ba296e5ad3f043f353b6dd58f734ca52e52eec4a70d1907ca351e01d68f635fc971b8505a49a5204dd10f96bff27f4a62b1f5fd15a1dd43f9295c668c6e90d82d6d5bba14bdc66e4f952e4c96bc365d3bd5e2cac3595bb374e6da945e9ab2f356a55f3282fc9646a04bbb2d0d69a666386f58e01c52604ea7d12231e6afe452d201d58817112e1ed4caa6c003dc7cd5f22da5f93f0a0af2c77e679a57d80fc8529bf5142e4b997f0aa2bb4d60171fe6c50dc98bb3f32ccfc2a30490cc04176035a58523afec056244060e8c9a080080c0547a38a879130eee5e1adff94475ff0087da329769c1fb1ef535bca543f27b7d22840a14b2cb77d051c7b72a6234f60cfe28f5babcfe688efe92da6dc310c7093dfde9931d8203001f268f09463eeac55f3e17f7df91e625b55b3482cb65f60952f82ad3e6ecec1fce7a7d0391a510072d4d47110728e50e9ef4802846e26bf4094694401cd1677947de1f26dd681e38b955c6f20e817d84c5986e07cbbbabfe72100caa02a2d8010fdd7c5450d1dfbaac4f669a6cda99082506859c526d3ec32448fe2a40d36067e269c3713cc40a1ef0e7c25bcd103a901f6827cd43324c328ef2a28778080f6fab04b8a140558213f44032e05dc7254869d583a021f62a4236e83c33e29200ef2bdd72f8a07fb10c074fa5248c53a5da82e41609d3e699910fed04af8a41d48f9a47c564dba67c2a32e8c24fde4d7166841f41dc616c521b40132fbbf0f6a1097d6274fa7474a992a5e266974192e605be76a470ce6cd073187b3ad3a12cceb221df14d7b7734364eb11de8d3e841cd299f6a94fd5ae07de885dc039928f6a1c9d9d4a078a874f7bd6103a151515151515156d2eb2da4543ff006aafcfd7731966d79fc735743728e18f92fb4514961ba0baf70a833b8b09d13b49c543e05bf0f263eb7ec183de6fe06ad248bfb42985125d1ab06a5f518ae9b62424f0943c86adf79ff7277a3e0d7107196ead3b2c6cbf6968c1e48a1ddd78a528ac4b8cedf2876d6954c830b744dd69b54524826bbeebf8c7d0de129367a47e7151fda1593498bff01566b1a05e160f115c3aa548e86bd18e2a19bc825d988a4bb6427dc5a7013750f83c55d386523a1075a8bcf103c25241eef4cd0728406aeb7baf2cad30c2545bdad1bb5d10feeffe49c1360b03726476a55d02f920f14d26daef01f34407b4351b2d4f4a28dae167b48f14d1cb0e8f63f353041d5f947c50c4a6b68fb4bcd163bd5bc1278ae38608f63ea441ba71eed64ef6f32114733da2d1de57c524d8577bcb1e2ade2d227da1456744c2ef654ae861108c0b002e758ff1af2015580d69401442d03628500164390fadda3b13c3d347869705c5320193a89ee3505d2357b5ba4f5034a0af93c8f03f7fb24222464224f597b54e25cf781f23fb3ffa0650d4df2ff5a0a5fc607428f0835e6c4f6f0fb6ba1b10e03bac3cc6f453fdd89afe5ef420208dc4c3f54e50d435827d803acd2cde487666fdd9f63d3662074527cd4dd9f608fd344fda4534251b331a1c9226127989c8905b262fe651c8b0e8a3f5cd02d55080195742ac8098c8e9bbb6dcd29b8dd9258c0e75d65a50b06444eb6be075a32c280200d83d5088009558029cc04578a3e16e5a6cb34f2b6374b460b60a8dd61021a874775e6a28a816f64f664e192a6266df85d14e2df98aae18d27ee185dc6b080612e816a29bff0054984e31a1fdf3480c4949fd7f847bb19a3ad5cb88e2fa462fab61a1ad1c6b4966378b894201111b89e88016e0534103693377118b909c0250cdd3e5a7820eff009cfd51e80eaafca10476a33b939ee1f5cbda73f94693806094f72de69a4db03e20fcd4a87eff0024c78a5193dbc25b341504bf9594d40a26a29eed015ad2f1d80f9a8a9d1fc2ea2a02d83e14b3fe3802bebec6d48ef0906cff00b472091694437eb4e4b309b4224dfeb5632f0060bcb9d9edb44135922c182c6f68a9a8a189d81ec8031bafb0b5741149b0b2f9f1a555210e464fcfd91dade076fc3357d6c71e8287d42446e52671b1d90fe1a6a3993055c5acbaa6a7657326a5200b7742f5846fb367ea1e1f07227253f0b985d53ec6cf66f9b5696136f96a70f68add6c4afc11b9dfe8632c4b201ba6fb1fcabd80d37ae9dfe5a2da51b4020f4861881dff0025293b40f0fd7a794a71d11d1adb555cea3a3c8d9ef56621d9403139372e9d21a3e89a0f03220395c540a91c77e7f113929c58020cda0bf79a4091b5a1ccfe0bd286016617e4b97bfd0e885680ab963c9e2882b91d78b1ec638a17eb9005f477d977d2875ac1c1c07d8b06a92363f756450170fcb48b040c37e52a0d8174b33863fc0fe8e1f34410a5dd5d39692badb301a10436cf86b3b3764f9a6d276625843ad3284bedfe62a553acca060e5c1cb533d05c68070009e269001021deedb54a8edc0eb5f1eb2610ca2fb17a9798d90fc299262d5a3f8deac585d03ece7cd1f63c9f28d16ea06b1d988c3d74a233c23f2668adb3caf6429c15cd1e444d000000c07f8bbb0a5414a433b32fcd65bb25ac277c95969fcef5e11af855d802ac035acdc2d0d2b365d7fb6a8981d3b75a616c909aae78fb216c33a0363c8d7ae70ae50f60d9e4b6c86db6bc8848fd6d301144dfe09147e0400800d3ecdb598fe674a090dc13ac1f828faf73612244c76d06f72dd024c75a0d0d5410d261f512cbbd03c2ff00535cd603f0681bab975e1e7ea108280489b25421bb6387adc746dc946cbf8377d93274a0c03adef07de91006f50f6ffb4ed168fc8dfcaa54aece3aceaf05e8f616186fb9d363d79c1784fc521b0a225771c8d49c40164a886e2ae6f08d56e3a357505c3246c8981b7e2849db381743638e1d36a024d351012ab0150ef3f52c58ee957303b43d01d5d56967ef1e2acf35b7ba1763b0f5a83bc2184b3957f3f43dd5228f2c1f3c536f2ac3c2365cf75b8a2c0e18937d9deac1cb5f335448b4e0838a8faef336032bb14193cc2568ca64c37c3cd6420dc9da68422755d78f4a000000580fbff88d3feaac42977574e5a280badd5cafa002011c8d004c0137635a004023646a542cab0bc1a69c981a2cf700b686f40e5653db07bb1d3ad24fc8e78a9de78a005164b623de402c7b52e91e101eea78a4058ea43db8f1469d7663a0a3c31489d0b9f23d8a1118df5d427855fe2512975425a6e9cd2823626b621e86ed5d1c501a1bf67f342c42512275a52f87db8fb639184600256940549a5b8f2eafea81d00529071914bc8f5fdf49e17a7efa98603fbc681ada0fc88ab3beb11380a1897310451bdc6a3e5a5cee2c431142d76d8296ceca64f42e480fbd42130dc0bf74a60ade5f08f9a8766ec2d01066e40f6a6e15a50f557fa5a70d859b470becf5b0ac8676e8d79acbb4ad0a0449135faa7dc7bc0fe29ae226eec7c851f6a68a49ff008cd4fa911a0d83e0a8a08698761d53d8a46928b94607e1dbd10727a098c8971323480459d86e548553b9c75fad767982c74da9455de73c1afd813a1e00de8f680d0ad38280360fa0843496033cc0086ae51ac56fc01c9ab1b6e7f29244b11b244fa43505cc23a23a2542baba7bd8cf53c50c868aae253cab2874a53a8c2a8e77b2fc07969b1feb99d107bcd0bef8180e03e86056c5d068eac146857b2cc1ce8e87bd09880660357375639a808040728ec7794de8034fb03fd0d0058c42c683f7565386066e7529c1249ba9c3d68dac8f7f879a45055dc3c8fd52008c8dc7ef7e234ffaa440646f1baa216badd5cafa49bfd014df6ec18e5701bb525cc24c9cbd82076a0240044563c7158cb35de8550a5360756a7cba54c5e21c39353696c72914843c5e07b63c28610604bb04507aac17abfeb3b9b3877be5b0de81fc385cef8e9e6a569b41bea9b3fcd03cbf1d4e1d9a19277fb12ad13f73a1de951cc0cc3ab5e9143578291a216b44588d97dce46befbc7d96880e61c0d8ee8f639a86c5104b260e6097dbe8017054699724429c4d17641bad9e69e5fcdd4bbaa62a0d5b0171d9a6abca15e9dad49646b9543618a3acae0d0e66b81f01406f0e528e95767f4b416545a2ef28ef14ef872d2c7191e4e28e02db02ec347d4ca0901223a34f739393ba465e5a6bbd604f43631677fc18d9383f28d764c89b373e9cc01af5150cc843761c78fb55a79b2f5450b70021d53f6e8fa511a0d83e0a596c80f039a57938e200a86210c72a1f1e1f4a4c5d12e264a5265bff00a28dbaab6ef0f3f7a486cbe5fcd594fca7eaa61add6e637f9c0ce7333621be36d22745e28b925ce3d60998277faa43404a49b3a775234ac5fb613ed159689909e72752af151c71fb107c0140082c7d940540195a8b2145c75c53c1d280e297090591caedd28cae4978184a2350d91b3ef4f048185e4e237fee288c20083eeff428f9ab10a5dd5d3968a02eb7572b44d341a196a2cb5b53e5a0c82a6ddb19ba7d94ed2d51bf2535965698b18b727c9de8476712e743f27fe534375c5a70d2215586c8367f5e6aec70dad3d8615e0e68e3f0f80b00183ea943be1420bd080a778a02ec4ec73d0cd11b05ed6b431c085480d9e79a4c2c48571c2c6d5fd536fa804d8d487632d33ccc26c7653c0f7a32e8336077832fc73448cb2c887d83e79a0cfd0d64ab1269b022f0f0b7cf486702e9e98713a69f65df3f0a11d627bd1a085432eeb9dba07ade402ab01ad4fa1dfb70508864874469ade8dbd10dfad1127e22c374dff750e23924a6f0b3e291d0e8de5ab7259a0020c7d4ea051e12eb1a65d7cd31d6a6b4b2f7b745fa41ceaf7c9a2f1d281bf09565bfe567669662f244d85f4b768e6df429618335463dcf6a5689837101e553ec910491228b63abf73e468fa2f2881b5af159e30a69c1448002800914dd53f34e50e05020c3dd2972287403c876ecef57cfb9788ca0e4f5131744b89929008b3b0dca0d22e5d7879fba443fee5f9ab2facf514492285d4a260194f6d53ab44999e09790fe1f02a0c4244709f496259080375a1dd252d3d57e068bf75929d652ef2e2da559d990b8987b3d9538eff214bf72d18fb5da60195d8a8eada2c0a1d185e920b1340673c9c7c54c4ee2cd0004946c19df9a0a6256cb3fb7a34101f7614ce0eb4e1b2d97572b450175bab95f4c93c1d5ff003e7e8306f3d4d4a586dd40e3303983cb4cd5f02466eb9ddffb486e5694d956580a58e9641a43c04cbd5a4cf625b89e0b58d0e65fa9a954950b608fb0875a287aa9530e51d90eefd0cbf464eff432a144b07694789a64cdadf948f14b5940a5382ac29786af221ba7e56e28ca340100707a8e52d9d5d1346822e5d127e48964d3ad1406ab9434fd7d652c0f603f28a32320275b8f8fa08901989d49b050f154c1e9ff0068cb8a95a1c5050a9d8845515efdb24b6ee3488b4ae10cedf61a752059bb5da7197cd028cca86124fb1f54d1091065da1a3cf3428975d03a20baa16d20200f836f1796938d896e2d8657093e91f49281c41f81ef431d0aae7f023ed615b3c4f08f83587aa5188b853435ac164128d0e39a00080f4133adb81539cd2f10a47b25445207245c5d7b7bd3d527365d23f39a0a285f94e89e4ab623a78475ee23dfd44ea89713234c30d8eefbb74e61fb07e15d411ea3d20d80844b254f40267fa27b8634b588f29b936b9fe1b74a0d634a17584128462c68a7b13528bfd7187c3523b843f88f0d3b63ca754d8d127f53f021e03bd1688a253aaddeefdd8801125687fdada40cff002f342d792c9c52d9794abe8238bcce3e2843d0b161d8ebf7cdee1ec66b6af65b0ebf1ebeece7e86ac674004abda9690b8083579725f80ab9d4861771f7ab4a337dab13b1510fc912c7235710b1256f95dca4da80020083eae3fccc12bec5284cbddc2fcd293498e577cb1dbe88e1c04fa0a523840749a2a04336e7a20f79ac395901d03ea4c122ef63a387fe512b94a7b1a4ea3f868e90c2d4faae1c7ccd1662492d953e0be97900a580d6a6922d9260714112dc2efdca5363109ac71583bd8f979a7010e09f2e94a568a6924cc2e918968f9a2c0a63dea1649fcd2525ed27e9565e47e666a0593c0d112c8f24a2d34d2e3d80a7ee39387b97f3410297f7d973da6adf4519dc03438f7fac9a0a14489cd3c29d2823b665d3da8fe5f6126e0c8d499380c3a5c03921e1a754c809260837ba2f7ab25876d09f8fb4d25b711dd6f99a746401e1f58a7bbee3fe51998087934f46ed1297e8195d8a6289106c1b9fbbda9c5345c09820b16c05426450c607556a8f2570f93f87151940304026dd87e690455c1c412bda4ee522c4cbb04d2590f554c892061f80a20d124608c1f5877cc272e939a9182ee8283a458243e1400823713d1409580cb489ddf724fe6a7c825bb81f2bf5491a640f050bab03b86752f343bb73bb7cbc53e3ab87db8879a68d2911f0dd5ec953a18c417a4a9da8d0005803eede66c0657628942fa358ee36c7b8fcd34cd822d2caf78fcd23e57f334242110831d148c2004f344841a047f8161ee90744c5365b2844ef16f49926d89fe6df1f44c35885bcbf28bf11bd2d010a8b07f01dea3a08b95caacc1146fc776d4044210c1c4bf0394a114047d6caa027b0fc2a92ae8238b87b14fd08161192847d13f70048107237f73e278a9e7474ea63b38eb7b5fea975ebc0c2b814508942714ca31b239360a71606340fdd3519ca9f8a30473151971242b72f06c1f05001016af3bc5a1dbbe67e68ab9acfe9862bc6d2fcaa679a5fe289af58f8f1110fb52789c90e8ca3b5631f68d5c090bb19ee3cc505259c549a33306da340e2ea6eeebb0e8d042892f902eba9433f61287ff315a19abbefc9e8d0ee19323d5d694680a91e4df4da8daa444edda4c9d451db0cad472b768c430999a14cbde29490ec8feb95a3661b0080f4879903d94bba8dfb514c2a585c23daa1443629072542b65307875a0020faa11a0c421d63af56dc540926f023ad1866e8a7c4d75ff803aa4c77ac9b2f70f6d3b4540c5192927535f9a405c33ec3cb3e86b47452f90fa63fc162249834e3d6961908925106ed0c166eb9e9450f004d313390d5e9497b2034e0e68d0c07f830f1320e571f8a123011e8e824686203c5e7b943151807ec02c586eb600de94e78608e02c705411d09ab16adc48bf5a98c103a1b1f9f6a59520bcc7c252f4fb08d6127b927cd08998bf1f512a1bdc74fbaea62f0164ba747277e2ac69b773a1c91b3db7fa5987fe8fe542db950dd0fc2d4ef51774382a322236fc2f346fea9731fc53ceb25731a52a0a060fee29b331d18385001063eb9fba5292406cd94d8e96ec94e7e3140cec5e22ddaa595acc0f4b07c77acc9d21d50fe4a01e9c19f5b6a5dd3199bae0ed46fc0cc78af0a8384a9a9a58a404a815a417f22d284c7f4161473095ab97ef8133601a53b906c88cde515d3dd581f28567799e48a16c489857965a50f1024232b7bf8acb3a433a4aefb1428ed4bcabf62a408ce1a3801ee3dd481367ad3884674a03f74ec160f3aec54fab8330c6b1137d6fe8b2af07c0e68020c7d4085a3915daedbfb6f47c1db3657c9ce9ed5be7b85f92e5efea1dc258025f61f0f34564412d8d7f84a5280f428303ddcf077409824e29769340000b1fe24982c13054419926fe353f22e24d9e62b8edcf43f8ae14ff91eff0014a4541835e0a8d1c167dc9d68c8c07f857c5ddae461f8a7991952cf271f428da897882930adb9703aaba4346e00a1b9dcf57fb34b37f63416018ec12b4612de5034ba200752848001001007d814ab97ea44f96a4d813dc7ebe8e6bb10f359bec87e2adf837104957c300b23dcfa2f6cf86244023561a5a1be4af087cd4449f5cf26bb4bac3a99f1f48972d76c6c9c8c274a50912cbddfe127ff004a7c30039584791b7d118a0817a8bb20d275172a1427d8494f4c53969e4ded09d687210bee372afe819dee5480a1361d1abd58161f82800203fc6884450c747833daaeed0d58cd7c9e854959207b3504c6c016168e8c9d22ad0314803389b69aa668d30c87d8167b547829680fd86898474be268487b65f14191a3a07ec8a5d5d72fceb56d2a4dca99c78ab66118d4b1cb87052a046432712ba762a06e064451be4f76ace2c04e6d728049dcd4fa003207b52b0516c6bc1424c0b01e89789a0d3839a00831e8f69d860a322a40bea0eea4bdbd6650350b3ff620e5e2b0a6b43f99cc1404061687ac55c6f9a2f87eeb40e89bd323010a42a047d928a717aabf4bff001a690065f75678a9ceaa998c940d56a78a0c170a8936a4bdb01a7073468203fc36d1859df8698324bfdbf6524c10e7d49adbbc3844e4268712037ac377e428e239810580a224596366ed665cbea9483bbf22a3ce514c1466e40777d99e6e89d45f8a0ae58489766f56ae9103bb1e26a7859853f88f14c5b1b28fc2a649fbb2d08437f0c509223f8d28bd840b65b36f2721444e0244644f5bef623a8a27c7bd32ad20a414c23a43de852ab927917e291a25ebbf922fe2a05d70e3d351da2a4bc58661e5c83a4d0334b107a9dfa5782f35ced9e93470320ba56f7888de39f55b802ab01969280dc9ec1588c91106cf0f7e357402e005a683cd9a6424e58b986e7426924677613c830f8a2854f0c2c36ebcd0010583fc6604da11e6912d19541b3065f1532964f3064a8dc40412127d0e602a8b9f81c7b3a5374536f86ab6fc250a1326283aa371b55d87fc30ac0771ff00342c77e5fcd3b64ea1f9a89b1620fe282819c5146fed2b53d1829feeefeb8f8a7fe85005d45c3f97a112deb3b0616c3d6d46980407a3c97f820e680083d4781bb7452cfbc5258094e89f817d5a8aa6602b11d73de827412621170ba1e67d550b27ff002139a5c15940db419ef2d43c26577095ff00b51576124baa3fd84a0bd644b8c09526da690b10c7b7b1fe18e91f34d3516503bb76a4024f77bd230a2a4860fee991103d9366b92ceeaa3da3109277d9464603fc304950f26ead8a7a63108fd2e3e151117715366dad40baf23b468a8a425ec5e4a8c17bbfc0a1ec6810517216fa1760ead46e639a90b1f9ef50a094bc72d0cb759800cad3c960d9858789cf76a2a6509fc0c9eff66ea0a66c89f1ef52211804af42a2d136a50ed9f14d12dc777bbf557e5b76f8b6f15c61a21e3d589aa40b4e8ecf84a670b992ebc7b36ee7a9842e7babfe07b5325dd6c4731d4f56c462153a3a52686e4babd323bcf6a9bc161dbf81c9ef4ccb091bbdcdc77f54445cf66570da1f115182998084bbd1cffe52e0054c01ab532398c1e383f745761a267b51f0138078a9c4321721b497a45d3f34e003f1564770d4f699f152c7b67ce1426089a7ef56839b8f81a2cec27e9513cf2df39af3d5fca5417bedf26b06dfea92be260f96bcb88fcd78dc0d7215c4f7ae054ee2a4de90c8f7af3f00af022bf3475e74fe1348a2a69f210286b4590ee133ef52e23d0f932f9a6ce5043b86b598a2463a163bbda8e4c19bc77d3a107d097b9c02fa50dcd78e952cc30776dfcee74284b0a44644faccaecb445be4f67f6fa1182aff00d0a03415ba181fba4093d327b7cc7a2cabc1f039a00831f4b864046c28784a170114de2fe66997409791250172a0ea0ca7b15d73e936641bc90ec94a913b66eafc1e029295ba9ec5cb9f6a3250282e5a9c3cd4e206b4b8c750dca6954aab7470ff00091d23e6ba71ae87f7561d7489a0b31cc3a9c356c55df227739ab641248606fd69097894d4da8d0407f84da8a49200cd9569e4f05e99892c8f7437e5979a111931387f9aa50eebfe899a2f1ab2310d9a44bad095d8c52728ee74a2c82854186d735a8b58c0746ed05d5bacacb4e6c213a6c7753d9a3e1489d0283cc02f54a3ec35b100fbef95a263ff001df9fae29fc1b4ee494664ae1f5f27b54489537124f9f41ee40b712129351d0227f3f2a8ad0aee24947fcd2aebc1bbc50ff2c18399271cfa71a02be83fbe2ac1c849b32887c9d0f52928a4d6063b927b54d8b6706a7ba9de94d6c333345b0d2d32c28354b544ec8b45447260f7a38237006681ec49a9a1ea01171b340a48ef9f78a64836d1ec315333bc21e68fbf0e1f04a90febcc4d79be4f9158f239bf9af8d9f0296c5ecbf15b3efabff5549e4fbaa1d3efaffdc51683f751e1a37e29606f68f255ea437fcb5618b947c11e68e8a8d61795fc51f778653d883dca04298303a07d64309c81d57a1c9dcd28a6628acc19edc9c4edf5cabff723f35fce503f7f45a87c895adf40fc953e76b9bea4453e274c123d51669190564b4ec3421899cedb34982f686f4490cf7a2d088492790f5f7fa9e1f3cee3c149b4dfb3b1f25498927aa8a07d94fe39f52b1e927b69c4dea12ba02e924a1c5e7bd40717d168a538017b505d13a66044bcebfe162ad20ba2df9a549103626637fcd1000634a897801bbb6be26b31345589ed4818b91605307f88b050b6e98b1b07a4c14c9107e72ca9d5efde8645a0eee9b1c1f4401a9cec9b351b0d93f341dc46039e68d55557575f49e7b4c7e496bf6e69f292eb4c02dd908de7dcfb0fa4899f6fb117829b31aa7e7deb201a7d72ec67a4edea88a570c85dec2762af0f1d7393c33ee53481339471b9c535c259b6787f0d0e802043b230f8e947987041ee534e36708584eb145cb001ebea444f5acb961d1f095104bb460da639b3de97935b344b5a68216f0dca0ca596d39a64b41b06bc14004163ee77a9e6a79a9e6a5dda9776a79fbd73f0371d139334ff00cdd23f09e1ac77323a6e7664edf540b51ed51fd7327e3e85d13da42c8f83da932883cb3b4f9a8e3f3a64953145ae13ded5b3aae31b16a2e8a6a51db1e28f157445863068fcd3b271797b19bd31edb7d31e92a4f84fc8aba1c1ba28fcfa0b802af3651dbcd48a2362d0736d26cf7f486890ba9ff2a99981f01f41405580d5a591953a76f00ace3222d3cc39087f86712ffd22de6a2164580efad16a530667134f6197116eb4a96031e9c1cd19181fe1ad2a9d514c97b23abf0a4e90cd64fe063d4158096918b27f6f40000343ea8525b317a624c5ee3faab70c90d9d4e04a754e064fada70a61fbad46b65e4fc7d11f434b0ae3430fe3a55c19db206e5584e184fbfb36f48e62ca685d76428c3c54fea1f09d9a2f211b08d6140a88d300a5b9d973cfbd2dc1f3b23ab6960d0e48cd892f7bbc1cfd0ce1c4c08cb559bc622813f0d80686f23e0a2e4c9b2656e7146bd1a10b729a3090041fc1400418ff000d405580d68a2718961e94d8123a79688a8310258a1d631f70a020cd565dec0ed4f9e086c21f25faa2d2589d89fc539b845ee8798fa1e436052319fe1c55bc2c0ea400f07bbf4cdc8409fe6a42c59b89559e8c530b3d2849fa2d326038813e26ae7478a8f427112002eafd37eed035c04ab6874defc74ac92511b9084dca970880f361f14807b009343050199b9e01f74ad69e1292212d83cc7fc332115a342e5c5b8a72fdd2becce59fcf5a42780b1e9c1cd19180ff001243198b5314c98eb37fe6b9f462095b057ba86df61c43b1c8d0f9322c26529ce3dd1a88ee079ed83c2f0e5082333f534b00c18f41ae06d81e73f21e88a638024906bd6bf97aef4cc95dcfd949cf050f9cd443773fb8a8b8112d93db5ede8aa50df160fecbfbd4142d7f4747e7b343720393d10044193663b70f11b5113183a24de5c2fb2f36fa4b1b4a203ab4054166dddf8ff0dea75b30ff00d1f1e12ab8819eaaeafa016fba1b5000307de094143974a66084fa4e792946cd5ea4da671da69e621afc261a7299782787f551ae3d077c3dfde9fae2e0dd6c347ed313c26e9551b900ec3f67d536e19ee453e214bb07f14fabeb0e925c7de9dcac11af26e27b8d2c044652dcdd7fcfa4a32cf3c93f014a54a17463f27d168a533aca2a354bff0043afa0a01282447468a040646794b58b764a95b400bd01ed87b7a4296171858f03de9164a8539913d993a454dc24c38037ee7c454f28e3db3a3d6dd8a86c05615be07ee78529e1a7cb1f146be2da256148c4c4ded4321fe01304a21ac321181891c4d09181fe28b3441213e258f11e84ac17680c2ecf1c7da0200211244a604decbb9fc3b6d48b6af0be0bebc74d36a348522a44dfea632a5b42d29ad8e8a093e2b49315150941ec0fe287a5f04461059e528085ff001b53c26b67eaa49c5e691e9fb54d03cac7713e4a2871d9c7fd0a28a1992d0dcf353e40546d3b8f92ad8a0c6c9439310b9bf4a4111246c953b2b5f56b6f771d0a0068707d9df27c69b53f09d707aabd43b35c0ff63cd1a0360625cab4749a6a0abb89696caeb34fb06e35367838cf4a21470700d83fc320480fe1c7f7574109f5d8edc307a8d12e66f84eef1d29ba3900c9b26a3533c4926bf21f1f60ca095180376952acb88b75eecbde982b54108e13cc1f4162200bab80deaf2fd939f4b6b0c3a94f11472b2bfd50bf412b818bff0043e3e478bb2d126eb53ff2ae9f7060085cd1bf478fa0c0c4a2f67f669b662fbffc1f403059b3d2aef4b1012b52c5cb687366682a0a23b2427a4f911590e3df1de91e81bced23cf52840284709ad0832e58bc30f6bf62ad5d1546261e2de8c6ea0309cb589bb333d8aeaa213b20f0a963fd689d9bf8ab3a1b663d47e29a9459327e4e75f709c54992dfefc10f24eb47fa6714c4e1a4eabccd2344a3369063cd0367187e7ed81bab528d78d7d9dbd259c1c2261c47f3efbd4d15232c90f71238069f521e9177d2f01de9a9c59ee1b0f10f7a52f2175462a3cc8bd464a0249449ea18a6ea009a6d10e6387d1e0173895b3dfe4a9498e7713cd0511184a302868d0fa01fba0926f1a3d3da99c2b070f661f1571e9e08fe2a5697f9d8565035ff009a796972d92e5e0743a52291112c8fde8a4194961ec96a5acdb87e14f5974ffb15a5dcc9447f107253a67d6b2445d057fc973ba2e649c288232024c88ca225c4b253d02b57e123e6882258ce793597df895dfe9dc1935cd9dce293130b20689b7f3429f8764cfe434fab2b26f88d568bba9736ea6dc3df6a4ca14a61c06e0e5edbc7aac440175701bd0e502f7caddfeb7bafa609697e49fc15095945eca3c27d24eb01c26e3a34561b582f0b3a382fe3e81232efd8a2205a0761f4a49304e938f144ec134c326cfe1fc6028044b23a7a24c0a6d2ed9ef3e2814286f20bbdadd9a0d53c72844f619ffdf4bef482284e62db6f52e0d9146ec5fcd0ec3d609eaeb5656730dfd1d612dc2e11d613bd3388ea7a7c09de8ff4cc99606604db9abadc67a2cbd89f140810416c1ff28cc4060fb51885f37072b077a0d64ca300107809b71e936801182a83cb4d5b202d1dce833d428b9f48ad79d84484a064035d06eee43de849cb4dd4581da1ede8830212ee5ec9579640eb7fc2acbc8984aca16f7a03df3f2c79ab5b1a0b42c1c4d34c02cda6efb4fa5c92e1dac3e68cb609f5caf723bfac1fe70a8f01c7d3fc7f73f1d71f71890e607febc5132268b0f4cbdfdaa08cb079bd89a34d0c20f8518787afb401e68c2778be535e5ace9e558fc450b2bd6a2858aa4cd025567a5e72bc68ca65902f42c780f9a5d03263f0b6f3434ef68c75192a148b24d8790f8fa671243987e4dca9bdbc08d1371ff9c5471086319ea9b767b5133c2cdf034913403193d90fc2a6295877a9a079a2367887d87e0a850c89b1d4e8719e946b440a01b1eab11005d5c06f43940bdf2b77fadeebeb29993750078a2baf5b0927c7bbece0a28b8926310f7bbde9c139169713b58edf4991a8f787f3537e1f0a108a0484d787f0fe3014022591d289270cc6676fc1a3f148e54dd71a9de9f8007b103f74580167fc4e85126309a0107a02130f2d05a0b1e882024484a4256eebb1cf82b03fd34922260d45e0559d1ab70fd4d5eda58fb6b29842039d03ecbdaa0201c377ff0007a114c26d8d907953d8e68daa52cb2eea215d8dfea49a83306232256ea4278562ce92730e3be2a12ccdc34a5332e173dc7c53670af3dacf03ef4a565924109b58758a7dbf78bc33e2868a6e7f451dc34c451aaf2fefd22a895268e9e62a24203dacfe2801246e3eb26034300e430d200a11d4f4fe3fb9f8eb8fb96d6966ce4b43cbe6ae1220aa0d868530066525787476f7a85e6216e3aabbddfb260901fc38feeac821289790b5d40fc9ad1d5562cc09b07fb6a8911b5d1cf6c270fd28a144011e70f8ab85cda5791fc53c87e07cd06613e514c1d3c8a1fe4650270b77e2989872de7ab97bfd0b11005d5c06f43940bdf2b77fadeebf41973117b9f9519141af72c7b3ecb4818bff00d0f83adad68aec22e739b4f1d4fa8c41aad0e5360f4012812130f0feff00188007c89a432d7a1d2d4b2cacbbd432158b3ebbbf145593e47377b5348dec8fe6a4ff0091932f8a32239a39f151114a42f165de3d4541055bc0fccd19ac9edebf9ff4c7dddc62108d4a347511de133dca0d57009dd2c9c37a024157130fda4cb43e911f296827860d8082af12bd27e0e35f3474bc9d95830069c015073ee0402b6c006807d71d65cfac97d84f134a9b63c0984699990b2324dfb267de9dc93a230d11ec84684b23f140e1148657aae4fa4c95b6bbed9a6cc83bde4c53a6caf7ac3e999406a68d2607318febdbae09940dc7ee3151d0978e46c797bc4f4217504dfdcf26f51ca39ae7f071ff00bf7081203f871fdd598212afa60eefe809edcd691f6742323e3bf1f7962200bab80de872817be56eff005bdd7e930e411371acb1793bda7c535f236dc493ea6a1f900f352792ba2371a756fc15059bb4677775db5a6f995596cae5fa9cf00d0a5787cb4b6634fd503b4b4010395b06cb2fc71400482900d1fe1630da1a261740844c8946d0e2a7401a6d535807321f1406a32e3a4ac3d9a5d81c92dd8af2d4d3a2dd7af918813bd386379e5ea219887940f84ab813fe9b49269846b745ce175d1ab9c972613a033dcef4201d7845ee7c28a17434493d07d809637a7967ce7f0ac91c027725c3c37ce214e00925934358307ba51b9be7beb9757e3041f61a77d09da0edb28413b8d5a8a2307f1d1c56a062395aae4ab685dd43476cd28d3029ea15690b789f24f8a06e1a413e5a1ceaf5f6223cd4a939ab1f622a7d4ea978a1c629a97867c51001255bb7d3fc7f3fe3ae29d965c52d81f669c055bf6428d6568546560b742603fb334fe82237e2e85e3e88a435f5dfc1cd251b7203be7cd1341e911ee43e6af1499085cb5f0f1f5902407f0e3fbabb0deae449eda52fb2561ff9c4931f7162200bab80dda1ca05ef95bbfd6f75fae7e008785df03de836422e00ca71883b5092671fb68593b92fcd4dcefe5aaa6cd10cb7753e29468ac0f7d23d82a72d763c03629703233b814b1ef3d2b433f19775caf3f5ceb9827b07e2a0eaaa484ce19ef4c91a548d80bb4bab33363b82fd951f8509147721b70cd280d0582101226c019a00405aa3d228e2ca38967e4afeee5eb143c8cf47f76a55498fd87f2ba3fd3c5255b54841827ba21d94ddc29fa0f073ee69f5d83ad0a204684652d44a3a45b4fcad06782f42ca366398cb06abf834fb50d7b1ac2449c991deaf7f8540d71ea7b326953a93132f163a37ff0094802846e26b484384e791fd22929a4249ed0fcd310f5d51f71b65f2529c1a4e97b11e68c92e041ec7d5fc7f3fe3ae3e9b46d9b1f62347389d2e0f97da8b2a8a330f00c7bedf4286094ba06b45d85b6940ebf95a084f2f870960e72f8a88a9818fbebd192af224278ad01a36f1514a2c4a38fe46bd73f5102407f0e3fbabae04ce533edec5379cc558f94edf6d62200bab80de889142f065777fadef20ac4861267ec45fb08d42e37c36f6a718c6d8fb42a34b7fada6b081d40f350d69bf8259a5d22c930ed63cd38077fc597f34383f001e3ec5f978b5760e56d43842f9624b1e69c10a0b9a03306871294d443046e8dd1c105047d7ff00b00955dd47cbd7f95d1a4a8e14e84f8ffaa970450605c39186808a18659d60ff00261d4a2e11601368d7a96f4709c33b3ba183ad1310244c27d00d5802dc81ecd220a5104019775d56ed1f69a8889a00595d6494e63769c92a14423b576c044deefb7b75fb5fc7f3fe3ae2a67249b04efdd8a11700353e968bce9752900a91c27d257924600cb422485aa61d488a2849011aabaf79fa0a61b299865f013bd30e589c4ec3e5edea71da0ac94759ccb64754ee7c509eba2e9fcb7f7d6df54b5264530b93aa9498b992709250393230e47088592c91f65b12b06ed0a9f94c076ea625b86b5822115e4060e86275ba9a12425cbb3fba8e59da85cb7f8a09624e00a7db8fa178fd469ef51205c924197fad5828f1c52bd436aafd9120ff000a9c69de797ad83bf4220fcd5d382cb749f9d1fea5a4b7a90b38e81f0ea3428edc9e843775874a5c01b41f32517083cd8a409a4d04496f0b2e916ea3f44404f5c447c050f7024ee11fb89251650d5b0bc432e9d03bd249488c89a53e04423686bfa6bf67f8fe7fc75c7a68b3c7a685d4b7637a5ee1c166c8f0ff0067eab12fae80cabea393e8828c29dcfd1420749ce347933dbe995ec13aa0f8a45ebba720079f43b9c2cf2c2e74b0d0f05b4e0bac5fc548594918744dc6812610f8d27a27e4a58d0b9e4b23fd88fa9c025407221e4a462d6b10287298b68dcd459c21a8f550ca15817de6b5e1c14db0f26ed1fd965b0fe820cb06696a55b8dd8f266d825dd52826335d81c058a4a0bd309b26a519dd69b7535e99f9a20e2393fc4d7126e5760d5e2801cfeddf06bc69cd220758ee9341ab5090e1c0740361a1d5cafdafea6ea9b181f7cc7e7d584247da67c4d0bcd4b3fd5a4d454e3a9af0c224fc61a0e77830ead6cdaf2934d1a0169b45cf41f90a0099859f0d025060bd30bd4d3e28d08cba296ea2840060fba24a5d66d705b8737ff186c8e91211dca2c1ceb1d7b7cbebfe3f9ff1d71ea4fdae051013266cf2b9f9a61230738d8fdbdf7fa9c950d4a36061d94220888ede9be30ef60f607de8502c4bc1fb5edf4b69867b5063112ceb73e7d27aca52881123dda8bc0860370967a41489a89ba103ee7c518b98d17cff0090e7ad298c71ab6d57e1ebc7d456c8113728907d3c4b7929558e7bb3261e2fdb26a2b07a0436101939c5598bbafdb5330b8a15fe21d5289ec5fa5690244e0fd34913917903776b44aa04a853e7549112ee37d8960b5e5517c446b17307b06adaa5886299107b0236036a6d63093bce0df2199bb409488c88e29855b476f535f9eb43ea72a61d9d9e3fc2cfaa4a3a27ff004f1418ccf0e0dd8f6bb7a14024f46e97e32d597083dfcc1c980ef2dfedcc3fb829357f640faef890eb28ab6a875867e1561feb8dfbc189d9d79aba00543b5283bad2eda8baf69fcd0f358a0bb41e6a0298e4e1e04b073ab7a3ef07b740911c8953c2a1e577197fab605192cd2e8b0d7786e39f9a28692891387e8fe3f9ff001d71f4e775a32537ab43767a7ed4e6f2b3e65b2ff0e984020ab89afd084db07579e3578a6483ec71ec3279a9ccbc8a428c5fd29283351f7087c546723b2b83ddfa48526a2c2293b957ebc8141136b98c43d68a17f689f66f41cef443f3460e286032ac740ef4f0590e41f85e8a61a4745f81f095bb081ba987b91de7d63086ed09632eea40a5bb4d00699bb87599f7295e5d6524d68ddbc76a1c9d956a86f0eab7264c9a947d538423518090888cc23347cc0e1bf140a9fb88f7a4218d1579a54804a46e9f739540950a34654c637412dd8300eaaac8d84735ab507b3bd4b4049586ca5df8348f4023253617330363a81922c2fa9a85dba921cf80746b71e1a3a86cf7ac645b2b9932769ed5c0d870eb18fbd082c9924ecbfbdaa6eda867e73e1ef4b5112a4ab5278870644cc9aadd7142e933097742ebd7ee60d38e79221130a7d0c5482129b5202bd7fe74c512248fff0004825e8d5cb426acbc26cd97529a8d41813089a51c496707a9b3fccd1134f5a7870fcfa7f1fcff008eb8fac2f1541223929579b095f79d8b3409c36a7512e9a516029d3ce445614ac60f73d1044491ace1237518dfc8a46c6926eb7e5f3495c88e41b3ccda8464a267adfc4d2cdabeb48b022d2cfa1eaa5c9b2b71c8f4a683ec2fc3f548b1c86f133e293091c81e56826ff4147497e2a7cd545c20c6960f4915a8cca85cee4f78a5542329b4addd9f0b56566ec5e9162e4dda70aa757d64908e2e02e1ec3575be5a19644eeee433b849b590f8b04036031e914848412afcdce9a0b0051f4c4cac1275364d12e54f51ca23b023b21d69a81121586e8b0e492b0f3c62a1414d3f8ede2a486aec1de5f142b225d0a3b64facbb4c4b0954fda97c515a1d505eedfc5646d120bae7ed14888aacaacad2759e39db3a9e0178a6da4221c65973ec2801069f75c34938ae408207f8d1870688d810591d3d6d5c0ff53ad7febce3f3ff00c20c18ad45a5a1a787b252b9c21c67d17c0f692f40d10322372862165a076d4f5cd0b81b8543db07e78a004157130fd5c0cc23cd30585b0f6997c50836c1b7402c569e9aaf295f85598eff00d83f2348f29fca09f14290ee8a7da669ed86cb89aa34e95695f7e02a50892138920f3eb869deb35dc2bfe3d1983749a56cea3ead89697a0d601daa98f2ad649d12a07c6d5b5d6e8dbb54e81830d967cdfbfd07f885b6e6c558da4d13f979a424b49ec6ec6ae60dc24040080363ef68b3cc7b4e1e69245b8df0aa15b66924670bcba0d654a065d46f48088984a2c096037b262ad423b32817b09f88ab5f934f0c27e66a405974f2d750a89bfe026295556eb58f2529bb17a4d18c13d817f0aceb02abbc0b470a80fbe02070163fc0e023f3a63f02026bc3f87f180a0112c8e9e83002691691eb8b6acb6828d8812255bebbff00f0a1d5f0606c8e686914cd6b21bbd9b8640611f8cb00cfef07461f49370ce0f6af68194ef0a0040bbc3e29d73a3f54d19cdd9fc156dd8b13eecb4b54350bddf453b6ba899fc8d8e6ad60d825ae4178f0775a7607e9910f9a6e3dc469d8541dd68bde78d3ae3d834e4cf292ecfa4bbbe82a1488c89a502538b04d99cfcf3468fd2557b3d96b4fb690d87c90dd7bcfbd5b46a0787d0c0c7402982b6b47a197c565b189e3838a252e2621e60e41f06d3a120395007f849dcb3edc25112ec259d8fc29d8638953baa4dff2f628ba1b82f9f41d5ec9cb7c520f94fcf51722f53e51a657288aea1f8051925821763fc310f63a148e948250364d787f0fe31afc52c729f8fc651796295d526fc51b6e15b007caff00e1cd1b40244d9a96794dedd623b056b3f880b69817b1413b8b1fd1c5268e991d3dca49841da297069c0a782a1f95b61758cf69a50ceb2d7856079a42024901a96076424de80183e88a64f920e6dc5b9da9d82f0bda2a0c9436ac2828ddfc1578d290f6a0bcd357d3604ba227b88e6af19a2ec9461b89c76a1024e2f94fcd3e702227bdc3deb933823c7d11ebce1a1f954027ec6111cb1b6957a01b5091ff00a144a11de77c8f14e374a68e9b54ba973d872d8e99e28f7b8c25e8dfbe0e28000006dfe3c1fe438ae1135397dc280422ee9a72fe0fc674f88d9e17f3f8c2a710244c647e6a17340d01ff00c44541506d4b642a1b541b547da8f441c959511c936eb097acd3ee6c8de3448fb159a18c4f799c778a4008908971a42528d4628e014d083da684857f05ca0193afe9a58c5d3f4d0165fc1628047d9183da692a55575695a544b2bc054faec4813b41761a514e2e413b8290dc97cf4c7b868cbec041d02a3fd8f5d3f74a2041666920cbf83f194a2956eaebe91e21b429bc698b3a586d70961528442137cd1eb353ff00cc454282fc03124a48496877a35591cacdd71dabc8cff99a50970a42a8681a4d3246e2ea00b0deefb34b6cce25480fe75c8a744ad4f94689443460f6343676444cf542fde823fda990dae10418fbd9672da0a22e748caa0157a8facab73e0fcd0bab16e512e482c72045c8a0d604bc05dd68355b0a979851c934ff00e5072440ee3479a6adb241086d0306588a3ff985a508c35ce83d0287190f9ef421a62f3903f914089749b487c7d22a3fdc5a45907797ccd2254a7d923d51788625896cfcd06e81c00385d37a20ab0a270f12b40087366877e647532461d3d1e04124045aa666922c7e197ff845898825dec175c02d288a595122409249b8c37188452c92dccc3f8af51e4425f650dbb8c7f84e2a7e2ebcfe965343adc70bf99f48c992670a7f454ec45c2368ff007781b4235f3e627f35607ba04db4807499e294016e929d441d89e6b9ea59fbb4ec910012ad302e38decddd8ab34e98030eba181b82d88a44adc40c7895fdda384a9f368248f69a4c71bc6e54fa48cfb4bf891e5225f06a94dae30214dcfe4d6900ec973b87854c98ddbf2d313d29fe68c976064ef45ef858dcf0aff16a34664bcdcb1367249d1b7fb2e334a80abec50fc9474101bd89757b02bd68042346c0658796c8a2011d740a37093525c4e685ff005425e13511a04c842d801d02267e59ff0001d44764b1e42ad6a04372e781a3017ba8ff009f4acc46074843e46acac7fbbc2117fe6ad041c1d74999e0ce291011184488a65499c001966803f9085bbec5201507a0b74a7a80a06c0c8826c632e35b6199402104ae26f340011c831abdcfa0adb90fac5b51491c283d9c3ed49093d2e3ecd130768fc251963b00bef58e379478afe6ba2006f94a972b20b137645e9275ab5ac0b61600b06df9a80c904637404c37b1a4c94ba4b045d834440de4bcb152c17013ed07cd5d1403c702227ac55ebdcc70370b0e452a73234bafced0d916a5be0580c09ac8937e526a1fec02cefbad03a4fdbd055954337829628b37470e2b7428ed2ef4ae162841913b950bf0c8d8bf2ff027416164031ee7b57b0e68bfa3dde9d5b56b1f7a94fe6ac044c1d13f1feec5daa721b539e362283938e7875deaedc70c2230a3dc4ac3c979750ecd4f6f4ecdff007eb7da1f02a037126c2904fb063461c1a9c69ccedab4626fcf6a3d5ba36ba71ec3ad3e7bdb3c12d8e0f41428aa50379a40e48e586556c172eef56f62a46c9b0e47345cac72e85c94dd0fbcaa4b0dd1117a6e56628b41d796c6b2d802c100200fa585d04ff9048d9d469ecb24e449b0e77346db28aac65d7e44911b230d47782e11f801edfec093da21bb0750a046c8d029825b1dea1105d460bc2d46e22529b2fc93272647050077a56580427691b98b38a997bf6e263226824939124451ff0059c0d048c100d9eb4d0ca1308641b8dcb3b9f79a163271b3ca98511d006de03dfd2e4c24759479a12b22bd07c06ac0ff00786173de52096339782f574d457bc69757d8a5689212a756a33ca2dc18f9fc14c87ed17fdfacf4afed93f83d091020e602585f6342c3835cb2c61416257d36a377e672c560c582234e6a1e95d64c0ee825ea50056144eb2a8004af607bed269485268cbf98f446593b8c36fc0877e296ff00274886a240e47628facd5113cb9967a38787a53284972884ec94c34b3ddd20e8cbfd79c530d190191b81d4977a099d9258fea38a49a67b9018e31abb2f79671528fbf506cb466649f205842581536186060f519146e9248912e4bdcd63ae11a6cb490a11a6e72426f41e7614bc9dd6485ce643ee23000957052f127a9741f0503d053c041f1e91d301bbb2f0aa5d2567bc79347fba29ff002575cb458e30f0a24c8384c36bc51b3c613b1dc37b1ed4c1391285ba9c14e380268a93773e1d1a3c935ac31b2f164e129de8884d535ee7e689d4808f0d010b72256c35782939843767126ac76297f980032c5c014466e36a2e410a654742a5dc5048b1f0a21171a0c0886d7a4e2227c2905cc3d9a6cf844cdb1f76871380f4cafc8503e2ea46b3e509d97469430230b96380923493d05b220e0a7c653b74a0ce00210e65e515ebf643eb2841355d55af2d589120dd53c3febd8c3cd91a43927d94b2aaaae55ab1ebba2366f4c5a2bea15930227067c18946a502ea8ef60f34ea0af13b23a268fc8a3165594591e9a1b49aceb248e4212c1276087661d2875c80e3541a06c9f72700c91855fe174858953760eb2cf6f547aa4b4b278f7522f675025f0ff739f390474272f150d40ad46f0e2da25bd386d9f659b0f39dda5285004ab491c2e063afb1e7a66b067f082bfa1b56bc06e8e9d1c779d2a5604a2decc326e34155d7c32e9dd33b5219e9e7ceae9cb97c53232f2bb7d0602639dea4833a85291eac732d5bf8f2c4a91d5807a6bfcd1b5616498a6c5868433695013815b44a177bb2d41647422893c49e6b8cc860ed273bbbeb581149f977796aea0b6338c9d267b508c00cd1db9d09431f4bc8e1923fdda4a12d9a89c29a91c3ae2f9ed4386a23164e4a30c1af09eec0a2f4a21e64a40dc47fd70a9ac488e325f2f6a889319aa9bb49b0e450960100687ae8f08f0a3b01a68bbdf177cafa7505789d91d1347e4519103c95a1b84d1bcc7c90aea9017821d19eddfee35b823cbfafdf4412c4f47f6bdbd6f578124f95a8416dbc21f27bbfdc2aab516084c2850b584993148c2e44bb330ac3e759a42051802ead66c5004aebb7cf150a2811f95d3b47a0b7e9520280d445f91198ac30e8d3a250da54872f6ed6d3cf5a2726451e52f3b6b45268e3755c06869eed137e3cfc81513d10102adf6252afc5327203a08fc5370a334b992f91829ac7a967148606b1ade801c09098787f0fe30880818474f505e1d7748079d2e6a041809265ba7bd2a8c8660bc407acd5d85a552eb0fce1ecd5d05d926ed29e68e7207dcd5a9a9e3312f8d053a74378511eb6dff0a44f04b3e540ac55201b5abb0d05224268d1cbe330315d6f05f80980ff005b857a886957a053accb0e9f60076ab9a2b77208eb7fa1ea48ac065a4583c182d0fe12fd17b8e650ea95a0261e6e228a42650220410d2444e449115084b893f6962a7226aad2d9e203de8b1e21dc7aa776496e1495622f1e615dd2f7ff0070b6b97d112442f2187b3a5494ba3123b9d874ef4a10a5108e88d4d06309ef6ff3d69727d4c70ecf1e983d1824c836ecd835b1bd43c216983ca1e6b56b0c486e5e106c824ecdec104992f64e8c8d1313bc713bdb2f3e918748880cdc7929b235e017b1f4803802175e1fc3f8c41cfd19d993da85356c90e865e29ad0a992731ab832b4608313c7535396d73f884ebeca9372f1f663c51e4135fb60b4606b020763eb0165c900cc8f56f7a7b4ce9ac0078523c3463fd63545123bc3a97b0ee54ceee0cc02a3a02f6a986be139a4f86f4ef52744736380bae2a47484904c7644446e2344482e3ce1a7416870d63ea2cbf07bfa17c56b1ad03c598ee453443615898c23a0961e5191467dfdd96a7d24dfebbe51ca7687b8a50d4916a0b77da680840203d097443758b798a702efb1bf951800ff007229920d26c8d9a7490879dd8fda86d401275480ca59d392490a34676c704d4a48ad79cf448dcf34a2b853ac03cd5168a89609a61c5dd0ef52d0c9ec2de27bfd649df089d865ed45e8021e66fe28ef1420bcebb9da2b4b3e196c3d04a61b4348a5ebc0771f00eb4d18102578aaaaaa8bde883c19dcfb6f19679f55520e603acd18ff0028c247116ad1073fe03381aa2c18eae0355abc2ade9300f001da9a0c8117d5eb611c280b1e0806c8d9a26d7f31ff00192c6d538582c84ed2414d12268c10b28034370837b5b5d9b52a19cac5021ed1dea3bb6d01ee07cd1d21eb8b025077669f1692aa21c100eb4395c81c10d18f68ef43150a124481012c9b1ad0885fe8b1a93873fc10a95be66f3ef429254249bdc084ab80151a317fa54c48dcdd0afe3ef40d1277363d47298ad049c94f885f228ff5d04bb6092900508dc4fb8a91259220b1239632acb9691cfa1698cc7a19672c4201f28a1ac3436a8a1e5d9145e0a803528d8136884407803f43808e8bd2685ffd0dcea92fb77a9c7ed9fb92fb455aeb00a796c7768742106f86c09c039abe26a1bdb971d828000002c47a59e6e8f207c4565b1aee3ccfda36412ab005422fb1999127900e93ad33842026820c1fe4f658065762a708bcdacd7fbd8a5288988e79fedbfc09168c35dcf4251caa14839e41964e8d839688700e800800dbd538054584aceba91b74b2623ab280cb0c962c5228309a0096a102a5efaf417da8f510d8eeeeb956ed24d42491b65892ca49989c2693ecd222c8258ef4a68f4749c27a1fd53fe52a23116618b3e69a1d41062c21ee27a28fa54c52be441f3a89e649d05f97a8266e90ec55fb35dd8fe078d07fad55c1ac0b1ed4b6166c635e22b0a23db8fb619533d012f578a5464b76df42da8b7da6029ec9ea0b4616ee23a3872f34155441099aa60eded498c61126d634cc77a413c7354c9b66d37d764008080f496f448f68177b14caec8212ee1d4cbd28b4461a783e5094fd045207130008c62739a4ec5e14b726d4bc4d008f8181b018fa423984c5ed2ba1054c6630bdd45fcfd615305aadd132f6a7119ca5e627b3434f882e0f24cd3344aee1a543858e3d1e1e290e60d24809bc3a127fc8ecb00caec53cac00b1a1fdd4910f0875e5a100888dc4fbe1413dddb74a6ef02d6518922257fb151373525d8f029795f42e1212e767bb2740d691a4a1db0ee36ecd23082dd943f34378243a021f5612e1b9dd0794a6eb0154f6f43761580eae87bc524a2a4aeed05477710181858c90d07a1e8b8ef4fb2b0b74f00cf95005ed1bee3e80428a8800d574ad9f16d308e154700d158429776e3d482db3f741f8d4ec5c37897fd69d05a236e5a1164dbeea80941958349d0fb9bb38998d1eef63e97dd0bfa53d5f8f43d147cffcf52df9376fc0657828791b44ec0b1dd7a54908070c0786c2f140edc302ae61f206e50e0880fa60a8b0907c4ff85533987f53ea8226447e987b9a38a3a112a773bc28a58cd00396b97dcf0a08cb0e3d3f2052a16e89fbc878a309a46011b5a2f7a46d54a32aeed7fe3298034c0bc0101c993dca88df9f225f1a97462c147b9d10a083fc90431601b5a67fb6a409c0c161e68160c1b8b5e5a8e6dd6da758e3ef24ef33022557402834d1060d097c982dbc9ea126085c19b5d126a5aac0441a4eb31ee947d124d36e259f4081c41060dd701bb5148062cd9809d03dd7768b987b20c7a4dbd306136e291ece141d7e8cc8e8ec984c8d23c0eae885f0527f04d394bb4009c93478dc48606c732ec1bd2f96ed5946ea2a17cd8214980c74f61434de5122181eaacda6a4ddde0f0c9e297409385ef87dca9341599df62de681a8309668d018c101ecd0024777702b4c85402d774a3e8844d800a0ac15d84d24c8fb882ade65038824f79abbbb81965ecff5a03ae527f142d8a6ce14889e8f87356775ce62626d8e3edb4d43d0149ef6f6297224051ef052e023d3c27cd03d190014ac6995cf37cbed48d0492acc686d138315635c0a2f11948d9638a8e038a7d80b1eb2b4a88b81dd2fa674a67dd353e721e4fa5433400d25a4364674ee548819682320e470d47be5d952254dce6d143661535ef87b5037ac317b1522560727b279ad938809c4a3dc51e3d927bb45060c1c391dc1784509135844e862ad84066c255e84f4a4a4a256011fe47658065762a4849d04c7bd4f1076603b3b3570054c0baa57eb72de1e27e68000001603eeb8a87272f1349e861ec344acb24c07403aad58df9909d10183133789b4c527102501e044fbc55d4e60844a5f984f529a0382c516e05ea5e069087bc60889e4c8ff00ea23e48d9971c7be7a7a8ecec0bc9b3c9427cd28d3f94bec51a0aea0242e0916e346a7c6704c17306267a450463d6e9fc7486e38517bd0ad1e70b8243ed3f40c12b283dd2690b22bc84b62a7b4b252385e889ef0c4cf085a90ad26f23b352850e2141f544190035abbf3b674dc4b4e58b198400f8ff56e82d11b72d41857708fdd24d44ef5d96a7143c624505faca375cf3f70bc66ade15f156cdfc256be92535a105d25f83c55f8681505d34baf12d0a406123802c744f5315198d3e320056e24f559fc27e84a2b7774059ec42bd1a70b2cf32cae464791a79d64e0065570527b383be3515282473c8403d515283cd6f82f0acb00418de0d39a93664b17f6354a04e175eb8991ed1426f26aeb737ae1f0f7d83d2c13829361b239e4f14b508ad6ccbc55c0f6187de9eb21bce831306ff829c0da1191ad1a06a8ecff008dd860195d8a79620163435a0dd11e5fd50930c9a6fb9513650b0d518692dd4189185544c82c91b36cfdd8d51d8e61aa392c3aa649a693f0ca9955ddcd4a8956b92d29d527a19bc91e99c076b6d95d74ceb4add4817524438ba0582ecd1acf8512325ef04b92862300400600fa01b0872d5443c53364c918e094fbb458d417fe41e28a70143d9fda9b351199c61517e6044892e731574d29eab441401ec1078fa35d07b9c141628594f039a0820fa20f6153de500754a15e2321a0256957f7b7faa761688db96824aafeeaa1a7b37d3daa6a21105e1a01309b5fb38f8a5990b2e683fb5a106604dfed84bc4234245e086aca2c8c944940f35b424d44030cc78e1cff0025a65c489abb293341c1021df2c0ed038f4b76278d84a5603ddbbff410001755c532e7940721b9172cfc69d0c593d009085bde6eb6bd4a8066c178807b55da984a0eb05aae2edb2339083cb8a001d449d924f75a125da79f2a5d797e96c4b8aded87f3b52a9903653c0e28000001603e874123431a2b13c1e69248a9baf87fc4364839a8324a1c01de8c116761b94e41f34d9a8ad066f77525149309094905fc09b3ced50040f9fb9734283a2de4c075a740d92523a00fdb95a8948d86cdfa5896cc65b162300400600f57148811255ce4e62c757650a0008fe8305de576f540e5191d065ed44ddac294e205ed574e3f9139a16ca8313261ebadc8bca9d90157423a91ef34dad0005f89a1daa88a533a0cc50d12aa94a61f6a968a5c01bd4a34a92967b0f8a100888e12b5d05ea70518b28b0781cd00418f449849eb423847d2246eb1c03f20a1235eed18de1d2512aac2f835c494e9bbf145cb7fa7cd3365976fc512074062338eb4c6441b3aaa20e2e01839abc1670a59e949499376d23d6a4ae92c4b3d1da8000001603ed826f20c04a398c37629bb6c54500a2420c4b5ff009456e970da2e1e5b2e96bd63646e1c218b8ef4cf8ba9a813e7d06b910e52f9a3469e43092978093628b2b08488ea53abb5001e032b805ac40c0d2e653b9eea29429b53d8f09a944c6117ad83bb43e42946a1703226f9d7043846b124243d000fad609715bdb0fe76a552886ca781c5000000580a405401ab42b02b3110fa14048d0dd191b27f2f44115597e1ff000bb2c032bb150aa8216343fba834a926e2af7e400b2d6a55bd8981b950692491c11c3fba6123eac501183acfdc2c0d2880375a60c94f63021bba6c72b57d5e580358d554037e06a30c12c4ee5bab2aeefd0518a1d248591a805eb06b46658e2576c5f2f537b7ac6ec5c9904c36b37a709e923179913b51d868f33d90530bd976f6cd11f92ec17f3f44e45b2266805224aae9d37f4231ae69aabbf83b34486418202555403abb1ad1e15169eba195ef498e66f03da30d478a10ae8da4b4f6adf4091d69b3e28e1869f9686aec4da38742b02df4a0d67a6e1dca832c0944037974a4965c21962538b5bbd3848ed6927dfc290089236468542aab0bc1a042194eb2fd7fa6741688db9680b8fbb12aa06421847235339892b40fcd4ac4936771e68d904b1a0469faad011394b67eea4729059711e0131bbc1e85d428298001d2f277c626830a74fb0b46f1f1d2db82ad104f91776f3b7a9f35808c60324612d21bd2f4a6e270d0d266348829a2f6148bcb2b5a6ddc96e67ee955ebab30ea06cf4543ad10300701f65b12e2a1948383e6f14aa481b29e0714000000b014c210abf01bb4a8477ff02942fec500b3732bafd5148088c2391f574123431a2b13c1e6afa32aba70bfe036cd3a44300665bfc529214d2af3bbcfc5045428b1361433412c0d315c20ef613aeb536a4645248e28208fb8a09abc15ce06ddd4ea965b60bd1953a1e4409826030cb17ca92dea9714f40aead4d0accc84bcc80abe20c15ab3325db2b95fd7d0cd9279b97b20f04b40b4119b96e5e8a19b833450dc1098cd98bca784be9ac00f2fe8502721a3527c72f14cccca9eb2d45efb26191da089396c409e032cf673e2afd8ca111be12f59acc01086e2013d9a5519d007a0a0d7ba9f019b372f455a3660f6a24073447921a8f26dee795ab5cb49886b62d4c682ec721b40febd3e9329a152a1a5dc6841e8008046c8d1bcc88175058a6aae609ff48015006ad14d13225f8deae5e0981c7fca194d5e582ebc14284e421a94f60dfcdc9bd5ca3e405d623b7de743290c093ef4fb0f4b2c2937927d04d89a6d1d9749485d96af4b42320c3a4a7825d289cfa8b9634097b0a65af057b933ecaf25069351a8795a0523084173a774bc5002c21bb6f9927620e28fb7ae619e40d3e28a858d2e5e28000001602960968cf31e8687d060f1ff0027f73f400697b535b64df793eff658065762890f066fb1f96a09b43f2525867dabf22f4400340c4ef4c34549773b15b5c9368c1f75025a942662679130ea242ccd42b7552ae5e805d5b04b4c2575f44b097e26d7297b3478673c80cc42c3b30b14a9846380d86d034d18602684714b147bca46ccbf5620d16f7ba8135d917cbded97a069ea460b9410e26503de6a487d1218bb1747b334822011c8d076d00dd3321bc94dd266f4092314b8e6e00ed4e2c0b4e0a47621da7d55e6080cb6072fedd2980a0c4c866c38314ec61a0bc49ceb16dd3619a5619817a5213cc936d9f5677502199d9a5eff000d54f850d4568df02fc516719bd548a4e1707a502ff82733ba5d72d3c01643314b057da3f74beb4843d0a828341e9d3fd23b0b446dcb42136d5f8da9ff00956372b30e80cacf0f7a008565dd06c7f5ea4c49600e63769229889bf3f7da21354a0bc7c01a3fb731210226a22275aca9545b1710cf7074a19ac28b9eb9475e60852c533323aab2918d8d0382d45d2200d5ad8cb949492541258eeddde31b07de9f225df1f15627170f264f4bcccc34854c43e8bc0cfe6a502a805d5a5db7a293dead49337a448086924857f0524cb349cbf5f78c9218bd5c999c5420282eff002f3569ecba169abf911d34a36a5e8b23878cd3b18c1e073460203ee2a32940aeaae0a904f4cee21cf0d94cd98a8cd9fa55fad57002b50f78db1b469b9cb178b055c4c617fd0c8e4a2efd2e2bc2b7338c929cf605d41b99261d05ee5ceec984aac06da0e4092e8d04cf682c3abc1f77a3f439506e6dc2364407245428e8b003738c2e898167449945db058b4349f91aef098f5fe7c56abf8a64246c02f43d124633bdc3ee3406892ae5740355da9b2d924b1dde5abda880a4b977936c5c74358198a2816002c1c7a2490d05c4143c5334950af6f42f8e491e753e8b4183fe0532221b1fc144840301e888d0160d3839a00080ff004674a3c0d0a019ae395faa837b3edc140b170072d40000095a9960093a2eaf5abbbdb6ff0071f3fe0c70f035c2ef3177b8d4845044471b546590d202d291d56779a8c63549374b4f682f79ab8499a4fd6ee0896808f009a660b91bb6b46583ef9e0099da9182480ea3eaa4afdbff001f44dcef7f34a8299869bff540041629e6aef6fefdbefb030e82c0964eb4ca39490d392a6626400eec54624968c18d54ab9a0583e0ab036c660230ef5124360fb86d1a539740655a05da6527a4c4188f2ea6072de88d84cbafc1aab6015a8bdd82524cdcc0b13944ba07ab8121d2a211a946fb0921903a31d70ea5496146a85bdf55783f03455518e03e81f1710c91433759e236a5f6875f1dc36726e77829758f9505f6cbd6a7e96ed0601c0014b1110bae04d92c751a44571392ee3dd470682737023626e5ff00957be2e293f2f2d37e499159f2acf505f013804022000c07af121341358865cb96800080b07a3a091a92b13d4fc35ab1f9f5890e6f97b1413590bcebb1cf344400301e8ed603b7c1cd19181fe8d043246077a6b2d6325ab722add174d96af7c5fd91fba24a0044eaff00e4d02b18ba6bcb5a2c2cb0bbc7f84946a3db0c9be82bad92dc958a69b70db3646e53b2290206e2dfa43428c81e535395a3626527fc1691661ee628c8754bd0fe3d420644b8991a8d0c0e59ed9ab19dda74ef18bbfcb5080ecbf98f9f5cb6fe7dbef32106ab15125b8334aa1862685622ab0bc1a65845674e4a8a38a96307f7b94958c60f039a34101f71ca5c8a177be06ba2d9505498334f0cdddf27a4005ca1f755f06aad8056d46359164185498ddd58d8fa46c2e7b060355c06aa1ad4f6de9c9027496574d0292332490b9e02203eabd0c0726f01ab2b463625ac54c26aa2cc4160eef05a540dbc0c72c06f7c0d614ec60200ec529d894f6dfe387d3532e971b393917706e1d5890088003047d13061228525b3ec986a09eb371b9f4b044363f8288800603d240c1ecf073464607fa385824c12e7d134258b32544416df6e4538c174ba04d454f542eb8e8944adbf9f6f9ff1126b1a20353a34031fe10a6284e619a4f4b0f91a164111844b8fd293309cb3ff00145b14d8bd5dedfdfb7cfde5490152160e2490fe5a6d1e1207a9ef5340b5e6b3c73526212c8d0a48aac2f0697a7da2c59877a34101f6d62872483390ae0365866710e5b44ea340d8340b153cc408216f8c3cba0d4aa8239cc0ded0be2560fa5ef88c6ecad4abe508716a15a1a1a4ac9076c2956990b0355728e0026d986fd46bb97ddf49b84e8ca058f156f7a6531b1160b6b98ad3b185a2b6c9cc4ead0e3614488e11a5c6607246caf7483bed47964e126000baad0990270b32d2d8b1b4cb5f43a4c42c3130e466135dc61a41ad86c6625dfb775c51920400401f54cb61877366a08839b91fd5314740fc9c7af1f96b8e8cefe8aa8c1834e0e6800203fd1c908c236e5e29a726e674b8d8a41120688f614ed257c45cbd9e39a281912e264680464c761bd44946136b1aee4ebfeabf9087cd582db931d0d1496688e476f5cdb87b9a0000c158cd65b0fef6fbc4f8026885241d327ecd090ce873575a62b175170e2a23d42647728842d258c1dce6b820ec951240d8fb739e4158e395c0175a20a940c645e396d37d76f4d743904b8163911b0e82f3acb2ea9cabaaddfa5bb240044aab80a20c64b26429263a8de5bc01ad60ae8394ddd306b2339921187d006fe1b2d1755a2492acda36b991f7a8f40b0d0cf6644eb43ec91f021f9a21b9798222bcb1d2747e498b5ab885b191cb866d13b4f3ce4bb9c1af17de9a79b44db4870105211421ea730748b2d657414fb718f00b3bf0d5994d8f2bf546b019fcba7a142655f14e58c253b580edf073464607fa38a412ac1519b07b6d0e2a08269425ef444c3008becd69d0917c0d9ab7bc9c072b6e9b5150439ff58e6ff94e39ab018617341b345259a2391f4b360de7d32d87f7b7df2c3c849d4bd225aa0f7d3c52046649de669c92235d684dc20312f2be2afa9858c03639682083ee4001024b84b82e07575b02d8a5938552eea77ed99b80407d2c948bc019574a1039131399d261019897315797b154c60de38d0ef8f43f40464b6f8c11c9ca96def15a02af6877f441d1648c9ea4684f50e093681c8e85aeaa23622b02534374a25cddcab2ac175b157c078c88ea6dbbb17c0df501002c07dd8c7835dcd9a4c0bee57ea80cc0666c3c8d5e4433f01c734cdfc16469c1cd19181fe9246bc32b89d7c525c012d1aa1bc7b51b494494435d140cda9966b60941d5a416d8ddabc4f4ff005cc92159f91d6826408423878690592ca42524b8381b3c9e2aef6fefdbfc070625026a4860c12cb8d78a68521204868956583294a70f11ff0011cd09180fba92aa6966659a3bcc4204910d96d1b11641a0231f4894d9741d032ae817693b21bb387b224ef9c2ab697004587e1c35c0463d5c524f8666900ed14740c36112468604c4105fd83a12f4a6bdf63c48e0342b1f5f52c6fdece06097042e6240b43efb416303bf0f152820b6828b93aa10c705000407fa52db14990cc434225262e9c37a109897fe142b5e5a59851326063fba7fb07106ed1ff54ab319d54196df67ab8ff0b4a808be13678a9d821be4bb72734b31292dda1cd09180fbc4cc0579eb0394050e43072cf0b400a11244fa12b200ca3c0e50756d52084c0acfcc32b9c160c4751324e49674bd41aafd2026047260b460a245f1d05a860316c50312a04ac0065a6b0b0b4a681583713ca6288de0500c0060e3fdcc6199dc197b9f9a6292880e46f4104e1fdedffc31a16169147c509181a7df7bcd66e8e5ef32e47a0835e29166ba58d9c8c9471c24aeb96d4ee255185b830bdb06b2e14c1e60682585780ec4d46550974e47e2bbaafd6bb780fa84f90a325691737ab298404105a823fddaa9640cc1bbb7ff002e7d30cb210d3218a7c258f0c8d41ada88422611a8a928e8ca12fba962deba1c06070414c7a28861d24da589484cb462ba42f5f709ddfad62851d9a8325721375f4309414f69be57ff00c5152709a5a239a7c59037a46075a0429817400f9050d049dbf7a2393300322371e1a7afa0b33e2316cd32189b5232e8083a9f4b8bf160b2ab60a0380cb93b862c72bed1655d2aa12ab95756a1782ebaefc012ab6016894a8070c54e1fff001816be9982bc1d0dcc9a8a971b27c823c9a85106073c3d9ecfc9a45130204f0d509ec43d5a3da9a1c3b357295d757b81e6925c11f2de651c50d3240cad20dadbb2f3e8fa820440ef8c7ce92d1f03e29de2ff00ab12e81ffe32662d10dddcc86e5ea4b56423363ca69807dd875b1d8d5eb8de9b66d470c60e6d8612749ab49b7c23d42638075a8e691a3bae55d56eebff00e3ad9bb206ecdab387cb1f642a7b6e23d94a49616f1e26a0ff00fc6affd9, 'alive');

-- --------------------------------------------------------

--
-- Table structure for table `journal_entry_logics`
--

CREATE TABLE IF NOT EXISTS `journal_entry_logics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry_type` int(1) DEFAULT NULL COMMENT '1=double, 0=single',
  `head_id` int(1) DEFAULT NULL,
  `category_id` int(3) DEFAULT NULL,
  `effect` int(1) DEFAULT NULL COMMENT '0=decrease, 1=increase',
  `affected_head_id` int(1) DEFAULT NULL,
  `affected_category_id` int(3) DEFAULT NULL,
  `affected_effect` int(1) DEFAULT NULL COMMENT '0=decrease, 1=increase',
  `deleted` int(1) NOT NULL DEFAULT '0' COMMENT '1=deleted',
  `system` int(1) NOT NULL DEFAULT '1' COMMENT '0=No, 1=Yes',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=73 ;

--
-- Dumping data for table `journal_entry_logics`
--

INSERT INTO `journal_entry_logics` (`id`, `entry_type`, `head_id`, `category_id`, `effect`, `affected_head_id`, `affected_category_id`, `affected_effect`, `deleted`, `system`) VALUES
(1, 1, 1, 70, 1, 4, 101, 1, 0, 1),
(2, 1, 2, 49, 1, 4, 101, 0, 0, 1),
(3, 1, 2, 23, 1, 4, 101, 0, 0, 1),
(6, 1, 2, 26, 1, 4, 101, 0, 0, 1),
(7, 1, 1, 70, 0, 4, 101, 0, 0, 1),
(9, 1, 1, 62, 1, 4, 101, 1, 0, 1),
(10, 1, NULL, 62, 0, NULL, 101, 0, 1, 1),
(11, 1, NULL, 63, 1, NULL, 80, 1, 1, 1),
(12, 1, 2, 59, 1, 4, 101, 0, 0, 1),
(13, 1, 2, 22, 1, 4, 101, 0, 0, 1),
(14, 1, 2, 24, 1, 4, 101, 0, 0, 1),
(15, 1, 2, 25, 1, 4, 101, 0, 0, 1),
(16, 1, 2, 27, 1, 4, 101, 0, 0, 1),
(17, 1, 2, 28, 1, 4, 101, 0, 0, 1),
(18, 1, 2, 32, 1, 4, 101, 0, 0, 1),
(19, 1, 2, 33, 1, 4, 101, 0, 0, 1),
(20, 1, 2, 34, 1, 4, 101, 0, 0, 1),
(21, 1, 2, 35, 1, 4, 101, 0, 0, 1),
(22, 1, 2, 36, 1, 4, 101, 0, 0, 1),
(23, 1, 2, 37, 1, 4, 101, 0, 0, 1),
(24, 1, 2, 38, 1, 4, 101, 0, 0, 1),
(25, 1, 2, 39, 1, 4, 101, 0, 0, 1),
(26, 1, 2, 40, 1, 4, 101, 0, 0, 1),
(27, 1, 2, 41, 1, 4, 101, 0, 0, 1),
(28, 1, 2, 42, 1, 4, 101, 0, 0, 1),
(29, 1, 2, 44, 1, 4, 101, 0, 0, 1),
(30, 1, 2, 45, 1, 4, 101, 0, 0, 1),
(31, 1, 2, 46, 1, 4, 101, 0, 0, 1),
(32, 1, 2, 47, 1, 4, 101, 0, 0, 1),
(33, 1, 2, 48, 1, 4, 101, 0, 0, 1),
(34, 1, 2, 50, 1, 4, 101, 0, 0, 1),
(35, 1, 2, 51, 1, 4, 101, 0, 0, 1),
(36, 1, 2, 52, 1, 4, 101, 0, 0, 1),
(37, 1, 2, 53, 1, 4, 101, 0, 0, 1),
(38, 1, 2, 54, 1, 4, 101, 0, 0, 1),
(39, 1, 2, 55, 1, 4, 101, 0, 0, 1),
(40, 1, 2, 56, 1, 4, 101, 0, 0, 1),
(41, 1, 2, 57, 1, 4, 101, 0, 0, 1),
(42, 1, 2, 58, 1, 4, 101, 0, 0, 1),
(43, 1, NULL, 59, 1, NULL, 101, 0, 1, 1),
(44, 1, 2, 60, 1, 4, 101, 0, 0, 1),
(45, 1, 2, 64, 1, 4, 101, 0, 0, 1),
(46, 1, 2, 65, 1, 4, 101, 0, 0, 1),
(47, 1, 2, 66, 1, 4, 101, 0, 0, 1),
(48, 1, 2, 71, 1, 4, 101, 0, 0, 1),
(49, 1, 5, 74, 1, 4, 101, 1, 0, 1),
(50, 1, 2, 105, 1, 4, 101, 0, 0, 1),
(51, 1, 5, 74, 0, 4, 101, 0, 0, 1),
(52, 1, 3, 68, 1, 4, 101, 1, 0, 1),
(53, 1, 3, 68, 0, 4, 101, 0, 0, 1),
(54, 1, 4, 80, 1, 4, 101, 0, 0, 1),
(55, 1, 4, 80, 0, 4, 101, 1, 0, 1),
(56, 1, 2, 106, 1, 4, 101, 0, 0, 1),
(57, 1, 5, 86, 1, 3, 67, 0, 0, 1),
(58, 1, 5, 86, 0, 4, 101, 0, 0, 1),
(59, 1, 4, 102, 1, 4, 101, 0, 0, 1),
(62, 0, 5, 104, 1, NULL, NULL, NULL, 0, 1),
(63, 0, 5, 104, 0, NULL, NULL, NULL, 0, 1),
(65, 0, 5, 88, 1, NULL, NULL, NULL, 0, 1),
(66, 0, 5, 88, 0, NULL, NULL, NULL, 0, 1),
(67, 0, 5, 90, 1, NULL, NULL, NULL, 0, 1),
(68, 0, 5, 90, 0, NULL, NULL, NULL, 0, 1),
(69, 0, 5, 91, 1, NULL, NULL, NULL, 0, 1),
(70, 0, 5, 91, 0, NULL, NULL, NULL, 0, 1),
(71, 0, 5, 96, 1, NULL, NULL, NULL, 0, 1),
(72, 0, 5, 96, 0, NULL, NULL, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `journals`
--

CREATE TABLE IF NOT EXISTS `journals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `head_id` int(1) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `paymentmode_id` int(3) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `effect` int(1) DEFAULT NULL COMMENT '0=Decrease, 1=Increase',
  `amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `debit` decimal(11,2) DEFAULT '0.00',
  `credit` decimal(11,2) DEFAULT '0.00',
  `cheque_no` varchar(35) DEFAULT NULL,
  `cheque_cleared` tinyint(1) NOT NULL DEFAULT '0',
  `prepared_by` varchar(50) DEFAULT NULL,
  `paid_to` varchar(70) DEFAULT NULL,
  `remarks` text NOT NULL,
  `random_salt` varchar(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`,`transaction_date`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=79 ;

--
-- Dumping data for table `journals`
--

INSERT INTO `journals` (`id`, `head_id`, `account_id`, `category_id`, `paymentmode_id`, `transaction_date`, `effect`, `amount`, `debit`, `credit`, `cheque_no`, `cheque_cleared`, `prepared_by`, `paid_to`, `remarks`, `random_salt`, `create_date`, `modified`, `deleted`) VALUES
(71, 3, 4, 67, NULL, '2016-03-26', 0, '100.00', '100.00', NULL, NULL, 0, 'Support', 'adf', 'adsf', 'Qwic56f624871f895', '2016-03-26 05:55:51', '2016-03-26 05:55:51', 0),
(69, 1, 4, 106, 1, '2016-03-12', 1, '100.00', '0.00', '0.00', NULL, 0, 'Support', '', '', NULL, '2016-03-12 23:41:21', '2016-03-13 00:42:10', 1),
(70, 5, 4, 86, NULL, '2016-03-26', 1, '100.00', NULL, '100.00', NULL, 0, 'Support', 'adf', 'adsf', 'Qwic56f624871f895', '2016-03-26 05:55:51', '2016-03-26 05:55:51', 0),
(68, 5, 4, 74, 1, '2016-03-12', 1, '677.00', '0.00', '0.00', NULL, 0, 'Support', 'lkjaldkfja', 'asldkfjadsl f', NULL, '2016-03-12 23:02:14', '2016-03-12 23:02:14', 0),
(67, NULL, 4, 74, 1, '2016-03-12', 1, '1000.00', '0.00', '0.00', NULL, 0, 'Support', 'adfadfasdf', 'zxcasdfadf', NULL, '2016-03-12 22:57:53', '2016-03-13 00:02:45', 1),
(66, 4, 4, 101, 1, '2016-03-12', 0, '100.00', NULL, '100.00', NULL, 0, 'Support', 'qlkaj sdlf', 'asdfaldkj ', 'Qwic56e49dc247c96', '2016-03-12 22:52:29', '2016-03-12 23:57:22', 1),
(65, 2, 4, 23, 1, '2016-03-12', 1, '100.00', '100.00', NULL, NULL, 0, 'Support', 'qlkaj sdlf', 'asdfaldkj ', 'Qwic56e49dc247c96', '2016-03-12 22:52:29', '2016-03-12 23:57:22', 1),
(64, 5, 4, 86, 1, '2016-03-12', 1, '20.00', NULL, '20.00', NULL, 0, 'Support', 'adfadf', 'asdfadsf', 'Qwic56e49dadccff6', '2016-03-12 22:52:00', '2016-03-12 22:52:00', 0),
(63, 4, 4, 75, 1, '2016-03-12', 1, '20.00', '20.00', NULL, NULL, 0, 'Support', 'adfadf', 'asdfadsf', 'Qwic56e49dadccff6', '2016-03-12 22:52:00', '2016-03-12 22:52:00', 0),
(62, 5, 4, 86, 1, '2016-03-12', 1, '400.00', NULL, '400.00', NULL, 0, 'Support', 'asdfadsfadf', 'asdfads', 'Qwic56e49d903db75', '2016-03-12 22:46:52', '2016-03-12 23:57:06', 1),
(61, 4, 4, 75, 1, '2016-03-12', 1, '400.00', '400.00', NULL, NULL, 0, 'Support', 'asdfadsfadf', 'asdfads', 'Qwic56e49d903db75', '2016-03-12 22:46:52', '2016-03-12 23:57:06', 1),
(60, 5, 4, 86, 1, '2016-03-12', 1, '400.00', NULL, NULL, NULL, 0, 'Support', 'asdfadsfadf', 'asdfads', 'Qwic56e49d1220a65', '2016-03-12 22:46:52', '2016-03-12 22:46:52', 0),
(59, 4, 4, 75, 1, '2016-03-12', 1, '400.00', NULL, NULL, NULL, 0, 'Support', 'asdfadsfadf', 'asdfads', 'Qwic56e49d1220a65', '2016-03-12 22:46:52', '2016-03-12 22:46:52', 0),
(58, 5, 4, 86, 1, '2016-03-12', 1, '400.00', NULL, NULL, NULL, 0, 'Support', 'asdfadsfadf', 'asdfads', 'Qwic56e49c987aba1', '2016-03-12 22:46:52', '2016-03-12 22:46:52', 0),
(56, NULL, 4, 85, 1, '2016-03-12', 1, '50.00', '0.00', '0.00', NULL, 0, 'Support', 'adfadfadf', 'asdfadf', NULL, '2016-03-12 22:46:22', '2016-03-12 22:46:22', 0),
(57, 4, 4, 75, 1, '2016-03-12', 1, '400.00', NULL, NULL, NULL, 0, 'Support', 'asdfadsfadf', 'asdfads', 'Qwic56e49c987aba1', '2016-03-12 22:46:52', '2016-03-12 22:46:52', 0),
(55, NULL, 4, 58, 3, '2016-03-12', 1, '100.00', '0.00', '0.00', NULL, 0, 'Support', 'fadfadf', 'adfadfad', NULL, '2016-03-12 22:45:41', '2016-03-12 22:45:41', 0),
(54, NULL, 4, NULL, 1, '2016-03-12', NULL, '200.00', NULL, NULL, NULL, 0, 'Support', 'testing', 'testing', 'Qwic56e48b062c7ce', '2016-03-12 21:10:42', '2016-03-12 21:10:42', 0),
(53, 5, 4, 85, 1, '2016-03-12', NULL, '200.00', '200.00', NULL, NULL, 0, 'Support', 'testing', 'testing', 'Qwic56e48b062c7ce', '2016-03-12 21:10:42', '2016-03-12 21:10:42', 0),
(52, NULL, 4, NULL, 1, '2016-03-12', NULL, '200.00', NULL, NULL, NULL, 0, 'Support', 'testing', 'testing', 'Qwic56e485e5979d4', '2016-03-12 21:10:42', '2016-03-12 21:10:42', 0),
(51, 5, 4, 85, 1, '2016-03-12', NULL, '200.00', '200.00', NULL, NULL, 0, 'Support', 'testing', 'testing', 'Qwic56e485e5979d4', '2016-03-12 21:10:42', '2016-03-12 21:10:42', 0),
(50, 4, 4, 101, 1, '2016-03-12', 0, '100.00', NULL, '100.00', NULL, 0, 'Support', 'TESTING', 'TESTING', 'Qwic56e48541b2983', '2016-03-12 21:06:53', '2016-03-12 22:08:28', 1),
(49, 2, 4, 26, 1, '2016-03-12', 1, '100.00', '100.00', NULL, NULL, 0, 'Support', 'TESTING', 'TESTING', 'Qwic56e48541b2983', '2016-03-12 21:06:53', '2016-03-12 22:08:28', 1),
(48, NULL, 4, NULL, 1, '2016-03-12', NULL, '500.00', NULL, NULL, NULL, 0, 'Support', 'testing', 'testing', 'Qwic56e48217297dd', '2016-03-12 20:54:05', '2016-03-12 20:54:05', 0),
(47, 2, 4, 26, 1, '2016-03-12', NULL, '500.00', NULL, '500.00', NULL, 0, 'Support', 'testing', 'testing', 'Qwic56e48217297dd', '2016-03-12 20:54:05', '2016-03-12 20:54:05', 0),
(26, 2, 4, 103, NULL, '2016-01-01', 1, '1100.00', '1100.00', NULL, NULL, 0, 'System', NULL, 'Direct cost/sale expense from sale', 'Syst5685f186969ab', '2016-01-01 04:24:54', '2016-01-01 04:24:54', 0),
(27, 4, 4, 101, NULL, '2016-01-01', 1, '2445.95', '2445.95', NULL, NULL, 0, 'System', NULL, 'Cash asset increase from sale', 'Syst5685f186969ab', '2016-01-01 04:24:54', '2016-01-01 04:24:54', 0),
(28, 4, 4, 77, NULL, '2016-01-01', 0, '1100.00', NULL, '1100.00', NULL, 0, 'System', NULL, 'Inventory asset decrease from sale', 'Syst5685f186969ab', '2016-01-01 04:24:54', '2016-01-01 04:24:54', 0),
(29, 1, 4, 61, NULL, '2016-01-01', 1, '35.00', NULL, '35.00', NULL, 0, 'System', NULL, 'Revenue from sale point', 'Syst5685f26c45099', '2016-01-01 04:28:44', '2016-01-01 04:28:44', 0),
(30, 2, 4, 103, NULL, '2016-01-01', 1, '0.00', '0.00', NULL, NULL, 0, 'System', NULL, 'Direct cost/sale expense from sale', 'Syst5685f26c45099', '2016-01-01 04:28:44', '2016-01-01 04:28:44', 0),
(31, 4, 4, 101, NULL, '2016-01-01', 1, '35.00', '35.00', NULL, NULL, 0, 'System', NULL, 'Cash asset increase from sale', 'Syst5685f26c45099', '2016-01-01 04:28:44', '2016-01-01 04:28:44', 0),
(32, 4, 4, 77, NULL, '2016-01-01', 0, '0.00', NULL, '0.00', NULL, 0, 'System', NULL, 'Inventory asset decrease from sale', 'Syst5685f26c45099', '2016-01-01 04:28:44', '2016-01-01 04:28:44', 0),
(33, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, 0, NULL, NULL, '', NULL, NULL, '2016-02-18 18:35:19', 0),
(34, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, 0, NULL, NULL, '', NULL, NULL, '2016-02-18 18:35:19', 0),
(35, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, 0, NULL, NULL, '', NULL, NULL, '2016-02-18 18:46:58', 0),
(36, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, 0, NULL, NULL, '', NULL, NULL, '2016-02-18 18:46:58', 0),
(37, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, 0, NULL, NULL, '', NULL, NULL, '2016-02-18 18:48:53', 0),
(38, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, 0, NULL, NULL, '', NULL, NULL, '2016-03-12 21:14:49', 1),
(39, NULL, 4, 49, 1, '2016-02-18', NULL, '200.00', '0.00', '0.00', NULL, 0, 'Support', 'Testing', 'Uncategorized expense of 200 for testing', NULL, '2016-02-18 18:08:38', '2016-02-18 18:08:38', 0),
(40, NULL, 4, 49, 1, '2016-02-18', NULL, '200.00', '0.00', '0.00', NULL, 0, 'Support', 'Testing', 'Uncategorized expense of 200 for testing', NULL, '2016-02-18 18:08:38', '2016-02-18 18:08:38', 0),
(41, NULL, 4, 49, 1, '2016-02-18', NULL, '100.00', NULL, '100.00', NULL, 0, 'Support', 'Testing', 'Testing', NULL, '2016-02-18 18:15:10', '2016-02-18 18:15:10', 0),
(42, NULL, 4, 101, 1, '2016-02-18', 0, '100.00', '0.00', '0.00', NULL, 0, 'Support', 'Testing', 'Testing', NULL, '2016-02-18 18:15:10', '2016-02-18 18:15:10', 0),
(43, NULL, 4, 49, 1, '2016-02-18', NULL, '150.00', NULL, '0.00', NULL, 0, 'Support', 'Testing', 'testing', NULL, '2016-02-18 18:25:20', '2016-02-18 18:25:20', 0),
(44, 4, 4, 101, 1, '2016-02-18', 0, '150.00', NULL, '0.00', NULL, 0, 'Support', 'Testing', 'testing', NULL, '2016-02-18 18:25:20', '2016-02-18 18:25:20', 0),
(45, 2, 4, 49, 1, '2016-02-18', 1, '50.00', NULL, '50.00', NULL, 0, 'Support', 'TEsting', 'Testing', 'Qwic56c60e3bdbd08', '2016-02-18 18:32:11', '2016-03-12 21:16:24', 1),
(46, 4, 4, 101, 1, '2016-02-18', 0, '50.00', NULL, '50.00', NULL, 0, 'Support', 'TEsting', 'Testing', 'Qwic56c60e3bdbd08', '2016-02-18 18:32:11', '2016-02-18 18:32:11', 0),
(72, 5, 4, 96, NULL, '2016-03-26', 1, '200.00', '0.00', '0.00', NULL, 0, 'Support', 'adf', 'asdf', NULL, '2016-03-26 05:56:23', '2016-03-26 05:56:23', 0),
(73, 1, 4, 61, NULL, '2016-04-21', 1, '267.85', NULL, '267.85', NULL, 0, 'System', NULL, 'Revenue from sale point', 'Syst57193c2b6fb39', '2016-04-21 22:46:35', '2016-04-21 22:46:35', 0),
(74, 2, 4, 103, NULL, '2016-04-21', 1, '0.00', '0.00', NULL, NULL, 0, 'System', NULL, 'Direct cost/sale expense from sale', 'Syst57193c2b6fb39', '2016-04-21 22:46:35', '2016-04-21 22:46:35', 0),
(75, 4, 4, 101, NULL, '2016-04-21', 1, '267.85', '267.85', NULL, NULL, 0, 'System', NULL, 'Cash asset increase from sale', 'Syst57193c2b6fb39', '2016-04-21 22:46:35', '2016-04-21 22:46:35', 0),
(76, 4, 4, 77, NULL, '2016-04-21', 0, '0.00', NULL, '0.00', NULL, 0, 'System', NULL, 'Inventory asset decrease from sale', 'Syst57193c2b6fb39', '2016-04-21 22:46:35', '2016-04-21 22:46:35', 0),
(77, 1, 4, 62, 1, '2016-06-20', 1, '100.00', NULL, '100.00', NULL, 0, 'Support', '', '', 'Qwic5767adfa373f8', '2016-06-20 08:48:35', '2016-06-20 08:48:35', 0),
(78, 4, 4, 101, 1, '2016-06-20', 1, '100.00', '100.00', NULL, NULL, 0, 'Support', '', '', 'Qwic5767adfa373f8', '2016-06-20 08:48:35', '2016-06-20 08:48:35', 0);

-- --------------------------------------------------------

--
-- Table structure for table `loan_expectedpayments`
--

CREATE TABLE IF NOT EXISTS `loan_expectedpayments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loan_id` int(11) DEFAULT NULL,
  `cash_account_id` int(11) DEFAULT NULL,
  `principal_due` decimal(11,2) NOT NULL DEFAULT '0.00',
  `interest_due` decimal(11,2) NOT NULL DEFAULT '0.00',
  `amount_due` decimal(11,2) NOT NULL DEFAULT '0.00',
  `principal_paid` decimal(11,2) NOT NULL DEFAULT '0.00',
  `interest_paid` decimal(11,2) DEFAULT '0.00',
  `amount_paid` decimal(11,2) NOT NULL DEFAULT '0.00',
  `principal_balance` decimal(11,2) NOT NULL DEFAULT '0.00',
  `interest_balance` decimal(11,2) NOT NULL DEFAULT '0.00',
  `amount_balance` decimal(11,2) NOT NULL DEFAULT '0.00',
  `payment_status` enum('no_payment','part_payment','full_payment') DEFAULT 'no_payment',
  `due_date` date DEFAULT NULL,
  `previous_payment` int(11) NOT NULL,
  `loanpayment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `loanpayments`
--

CREATE TABLE IF NOT EXISTS `loanpayments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cash_account_id` int(11) DEFAULT NULL,
  `loan_id` int(11) DEFAULT NULL,
  `interest` decimal(11,2) DEFAULT '0.00',
  `principal` decimal(11,2) DEFAULT '0.00',
  `payment_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE IF NOT EXISTS `loans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cash_account_id` int(11) NOT NULL,
  `loan_name` varchar(70) DEFAULT NULL,
  `principal` decimal(11,2) DEFAULT '0.00',
  `interest` decimal(11,2) DEFAULT '0.00',
  `amount_balance` decimal(11,2) DEFAULT '0.00',
  `principal_paid` decimal(11,2) DEFAULT '0.00',
  `interest_paid` decimal(11,2) DEFAULT '0.00',
  `principal_balance` decimal(11,2) DEFAULT '0.00',
  `interest_balance` decimal(11,2) DEFAULT '0.00',
  `totalpayment` decimal(11,2) DEFAULT '0.00',
  `schedule_type` varchar(30) DEFAULT NULL,
  `schedule_duration` int(5) DEFAULT NULL,
  `first_payment` date DEFAULT NULL,
  `expected_finish` date DEFAULT NULL,
  `actual_finish` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `marriages`
--

CREATE TABLE IF NOT EXISTS `marriages` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `marital_status` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `marriages`
--

INSERT INTO `marriages` (`id`, `marital_status`) VALUES
(1, '-Select-'),
(2, 'Single'),
(3, 'Married'),
(4, 'Widowed'),
(5, 'Divorced');

-- --------------------------------------------------------

--
-- Table structure for table `msg_templates`
--

CREATE TABLE IF NOT EXISTS `msg_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(1) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `message` blob,
  `event_date` date DEFAULT NULL,
  `system` int(1) NOT NULL DEFAULT '0',
  `modified` timestamp NOT NULL,
  `deleted` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `msg_templates`
--

INSERT INTO `msg_templates` (`id`, `event_id`, `subject`, `message`, `event_date`, `system`, `modified`, `deleted`) VALUES
(1, 1, 'Happy Birthday!', 0x0d0a202020200d0a20202020202020203c7469746c653e3c2f7469746c653e0d0a20202020202020203c6d65746120636861727365743d225554462d38223e0d0a20202020202020203c6d657461206e616d653d2276696577706f72742220636f6e74656e743d2277696474683d6465766963652d77696474682c20696e697469616c2d7363616c653d312e30223e3c696d67207372633d22687474703a2f2f692e696d6775722e636f6d2f314c627368734e2e706e67222077696474683d22363030223e3c62723e3c62723e3c62723e3c62723e3c703e3c666f6e742073697a653d2235223e4861707079206269727468646179213c2f666f6e743e3c2f703e3c703e3c666f6e742073697a653d2235223e3c62723e3c2f666f6e743e3c2f703e3c666f6e742073697a653d2235223e0d0a2020202020202020202020203c2f666f6e743e3c703e3c666f6e742073697a653d2235223e576520686f706520796f752068617665206d616e7920726561736f6e7320746f20736d696c6520746f646179213c2f666f6e743e3c2f703e3c666f6e742073697a653d2235223e0d0a2020202020202020202020203c2f666f6e743e3c703e3c666f6e742073697a653d2235223e266e6273703b3c2f666f6e743e3c2f703e3c666f6e742073697a653d2235223e0d0a2020202020202020202020203c2f666f6e743e3c666f6e742073697a653d2235223e48617665206120677265617420646179213c62723e3c62723e3c62723e3c2f666f6e743e, '2016-01-01', 1, '2016-01-20 10:10:15', 0),
(2, 2, 'Happy New Year!', 0x202020200d0a20202020202020203c7469746c653e3c2f7469746c653e0d0a20202020202020203c6d65746120636861727365743d225554462d38223e0d0a20202020202020203c6d657461206e616d653d2276696577706f72742220636f6e74656e743d2277696474683d6465766963652d77696474682c20696e697469616c2d7363616c653d312e30223e0d0a202020200d0a202020200d0a20202020202020203c646976207374796c653d2277696474683a203830253b20626f726465723a20736f6c69642031707820236561656165613b2070616464696e673a20323070783b206d617267696e3a20313070783b223e0d0a2020202020202020202020203c696d67207372633d22687474703a2f2f692e696d6775722e636f6d2f694b4a4a3131502e706e67222077696474683d22363030223e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e3c62723e3c2f666f6e743e3c2f703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e0d0a2020202020202020202020203c2f666f6e743e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e57697368696e6720796f7520616e6420796f75722066616d696c79206865616c74682c207765616c746820616e642068617070696e6573732e204861707079206e65772079656172213c62723e3c2f666f6e743e3c2f703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e0d0a2020202020202020202020203c2f666f6e743e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e266e6273703b3c2f666f6e743e3c2f703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e0d0a2020202020202020202020203c2f666f6e743e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e4861707079206e65772079656172213c62723e3c2f666f6e743e3c2f703e3c703e3c62723e3c2f703e0d0a20202020202020200d0a0d0a20202020202020200d0a20202020202020203c2f6469763e0d0a20202020202020200d0a202020200d0a0d0a, '2000-01-01', 1, '2016-01-20 10:10:15', 0),
(3, 3, 'Happy Independence Day!', 0x3c696d67207372633d22687474703a2f2f692e696d6775722e636f6d2f3644497a7159362e706e67222077696474683d22363030223e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e3c62723e3c2f666f6e743e3c2f703e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e446561722056616c75656420436c69656e742c3c2f666f6e743e3c2f703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e0d0a2020202020202020202020203c2f666f6e743e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e3c62723e3c2f666f6e743e3c2f703e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e486170707920496e646570656e636520446179213c62723e3c2f666f6e743e3c2f703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e3c2f666f6e743e, '2000-03-06', 1, '2016-01-20 10:10:15', 0),
(4, 4, 'Promo Message', 0x202020200d0a20202020202020200d0a20202020202020200d0a20202020202020200d0a202020200d0a202020200d0a20202020202020203c646976207374796c653d2277696474683a203830253b20626f726465723a20736f6c69642031707820236561656165613b2070616464696e673a20323070783b206d617267696e3a20313070783b223e0d0a2020202020202020202020203c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e446561722056616c75656420436c69656e742c3c2f666f6e743e3c2f703e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e3c62723e3c2f666f6e743e3c2f703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e0d0a2020202020202020202020203c2f666f6e743e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e57697368696e6720796f7520616e6420796f75722066616d696c79206865616c74682c207765616c746820616e642068617070696e6573732e204861707079206e65772079656172213c62723e3c2f666f6e743e3c2f703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e0d0a2020202020202020202020203c2f666f6e743e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e266e6273703b3c2f666f6e743e3c2f703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e0d0a2020202020202020202020203c2f666f6e743e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e4265737420776973686573203c62723e3c2f666f6e743e3c2f703e3c703e3c62723e3c2f703e0d0a20202020202020200d0a0d0a20202020202020200d0a20202020202020203c2f6469763e0d0a20202020202020200d0a202020200d0a0d0a, NULL, 1, '2016-01-20 03:21:03', 0),
(5, 5, 'Happy Easter!', 0x3c696d67207372633d22687474703a2f2f692e696d6775722e636f6d2f74646a7943344e2e706e67222077696474683d22363030223e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e3c62723e3c2f666f6e743e3c2f703e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e446561722056616c75656420436c69656e742c3c2f666f6e743e3c2f703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e0d0a2020202020202020202020203c2f666f6e743e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e3c62723e3c2f666f6e743e3c2f703e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e486170707920456173746572213c62723e3c2f666f6e743e3c2f703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e0d0a2020202020202020202020203c2f666f6e743e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e266e6273703b3c2f666f6e743e3c2f703e, '2000-04-01', 1, '2016-01-20 10:10:15', 0),
(6, 6, 'Merry Christmas!', 0x3c696d67207372633d22687474703a2f2f692e696d6775722e636f6d2f6472556a6868702e706e67222077696474683d22363030223e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e3c62723e3c2f666f6e743e3c2f703e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e446561722056616c75656420436c69656e742c3c2f666f6e743e3c2f703e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e3c62723e3c2f666f6e743e3c2f703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e0d0a2020202020202020202020203c2f666f6e743e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e57697368696e6720796f7520616e6420796f75722066616d696c79206865616c74682c207765616c746820616e642068617070696e6573732e204d65727279204368726973746d6173213c62723e3c2f666f6e743e3c2f703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e0d0a2020202020202020202020203c2f666f6e743e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e266e6273703b3c2f666f6e743e3c2f703e, '2000-12-25', 1, '2016-01-20 10:10:15', 0),
(7, 7, 'Happy Eid-ul-Fitr!', 0x3c696d67207372633d22687474703a2f2f692e696d6775722e636f6d2f77725256574d712e706e67222077696474683d22363030223e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e3c62723e3c2f666f6e743e3c2f703e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e446561722056616c75656420436c69656e742c3c2f666f6e743e3c2f703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e0d0a2020202020202020202020203c2f666f6e743e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e3c62723e3c2f666f6e743e3c2f703e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e4569642d756c2d46697472204d75626172616b213c62723e3c2f666f6e743e3c2f703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e0d0a2020202020202020202020203c2f666f6e743e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e266e6273703b3c2f666f6e743e3c2f703e, '2000-07-01', 1, '2016-01-20 10:10:15', 0),
(8, 8, 'Happy Eid-ul-Adha!', 0x3c696d67207372633d22687474703a2f2f692e696d6775722e636f6d2f386d63465363542e706e67222077696474683d22363030223e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e3c62723e3c2f666f6e743e3c2f703e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e446561722056616c75656420436c69656e742c3c2f666f6e743e3c2f703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e0d0a2020202020202020202020203c2f666f6e743e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e3c62723e3c2f666f6e743e3c2f703e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e4569642d756c2d61646861204d75626172616b213c62723e3c2f666f6e743e3c2f703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e0d0a2020202020202020202020203c2f666f6e743e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e266e6273703b3c2f666f6e743e3c2f703e3c62723e3c666f6e742073697a653d22342220666163653d2276657264616e61223e3c2f666f6e743e, '2000-09-11', 1, '2016-01-20 10:10:15', 0),
(9, 1, 'Happy Birthday!', 0x202020200d0a20202020202020203c7469746c653e3c2f7469746c653e0d0a20202020202020203c6d65746120636861727365743d225554462d38223e0d0a20202020202020203c6d657461206e616d653d2276696577706f72742220636f6e74656e743d2277696474683d6465766963652d77696474682c20696e697469616c2d7363616c653d312e30223e3c696d67207372633d22687474703a2f2f692e696d6775722e636f6d2f314c627368734e2e706e67222077696474683d22363030223e3c62723e3c62723e3c62723e3c62723e3c703e3c666f6e742073697a653d2235223e4861707079206269727468646179213c2f666f6e743e3c2f703e3c703e3c666f6e742073697a653d2235223e3c62723e3c2f666f6e743e3c2f703e3c666f6e742073697a653d2235223e0d0a2020202020202020202020203c2f666f6e743e3c703e3c666f6e742073697a653d2235223e576520686f706520796f752068617665206d616e7920726561736f6e7320746f20736d696c6520746f646179213c2f666f6e743e3c2f703e3c666f6e742073697a653d2235223e0d0a2020202020202020202020203c2f666f6e743e3c703e3c666f6e742073697a653d2235223e266e6273703b3c2f666f6e743e3c2f703e3c666f6e742073697a653d2235223e0d0a2020202020202020202020203c2f666f6e743e3c666f6e742073697a653d2235223e48617665206120677265617420646179213c62723e3c62723e3c62723e3c2f666f6e743e, '2000-01-01', 0, '2016-01-20 16:11:51', 0),
(10, 2, 'Happy New Year!', 0x202020200d0a20202020202020203c7469746c653e3c2f7469746c653e0d0a20202020202020203c6d65746120636861727365743d225554462d38223e0d0a20202020202020203c6d657461206e616d653d2276696577706f72742220636f6e74656e743d2277696474683d6465766963652d77696474682c20696e697469616c2d7363616c653d312e30223e0d0a202020200d0a202020200d0a20202020202020203c646976207374796c653d2277696474683a203830253b20626f726465723a20736f6c69642031707820236561656165613b2070616464696e673a20323070783b206d617267696e3a20313070783b223e0d0a2020202020202020202020203c696d67207372633d22687474703a2f2f692e696d6775722e636f6d2f694b4a4a3131502e706e67222077696474683d22363030223e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e3c62723e3c2f666f6e743e3c2f703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e0d0a2020202020202020202020203c2f666f6e743e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e57697368696e6720796f7520616e6420796f75722066616d696c79206865616c74682c207765616c746820616e642068617070696e6573732e204861707079206e65772079656172213c62723e3c2f666f6e743e3c2f703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e0d0a2020202020202020202020203c2f666f6e743e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e266e6273703b3c2f666f6e743e3c2f703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e0d0a2020202020202020202020203c2f666f6e743e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e4861707079206e65772079656172213c62723e3c2f666f6e743e3c2f703e3c703e3c62723e3c2f703e0d0a20202020202020200d0a0d0a20202020202020200d0a20202020202020203c2f6469763e0d0a20202020202020200d0a202020200d0a0d0a, '2000-01-09', 0, '2016-01-20 16:03:13', 0),
(11, 3, 'Happy Independence Day!', 0x3c696d67207372633d22687474703a2f2f692e696d6775722e636f6d2f3644497a7159362e706e67222077696474683d22363030223e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e3c62723e3c2f666f6e743e3c2f703e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e446561722056616c75656420436c69656e742c3c2f666f6e743e3c2f703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e0d0a2020202020202020202020203c2f666f6e743e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e3c62723e3c2f666f6e743e3c2f703e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e486170707920496e646570656e636520446179213c62723e3c2f666f6e743e3c2f703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e3c2f666f6e743e, '2000-03-06', 0, '2016-01-20 16:03:52', 0),
(13, 5, 'Happy Easter!', 0x3c696d67207372633d22687474703a2f2f692e696d6775722e636f6d2f74646a7943344e2e706e67222077696474683d22363030223e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e3c62723e3c2f666f6e743e3c2f703e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e446561722056616c75656420436c69656e742c3c2f666f6e743e3c2f703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e0d0a2020202020202020202020203c2f666f6e743e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e3c62723e3c2f666f6e743e3c2f703e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e486170707920456173746572213c62723e3c2f666f6e743e3c2f703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e0d0a2020202020202020202020203c2f666f6e743e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e266e6273703b3c2f666f6e743e3c2f703e, '2000-04-01', 0, '2016-01-20 16:04:22', 0),
(14, 6, 'Merry Christmas!', 0x3c696d67207372633d22687474703a2f2f692e696d6775722e636f6d2f6472556a6868702e706e67222077696474683d22363030223e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e3c62723e3c2f666f6e743e3c2f703e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e446561722056616c75656420436c69656e742c3c2f666f6e743e3c2f703e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e3c62723e3c2f666f6e743e3c2f703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e0d0a2020202020202020202020203c2f666f6e743e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e57697368696e6720796f7520616e6420796f75722066616d696c79206865616c74682c207765616c746820616e642068617070696e6573732e204d65727279204368726973746d6173213c62723e3c2f666f6e743e3c2f703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e0d0a2020202020202020202020203c2f666f6e743e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e266e6273703b3c2f666f6e743e3c2f703e, '2000-12-25', 0, '2016-01-20 16:04:52', 0),
(15, 7, 'Happy Eid-ul-Fitr!', 0x3c696d67207372633d22687474703a2f2f692e696d6775722e636f6d2f77725256574d712e706e67222077696474683d22363030223e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e3c62723e3c2f666f6e743e3c2f703e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e446561722056616c75656420436c69656e742c3c2f666f6e743e3c2f703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e0d0a2020202020202020202020203c2f666f6e743e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e3c62723e3c2f666f6e743e3c2f703e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e4569642d756c2d46697472204d75626172616b213c62723e3c2f666f6e743e3c2f703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e0d0a2020202020202020202020203c2f666f6e743e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e266e6273703b3c2f666f6e743e3c2f703e, '2000-07-01', 0, '2016-01-20 16:05:26', 0),
(16, 8, 'Happy Eid-ul-Adha!', 0x3c696d67207372633d22687474703a2f2f692e696d6775722e636f6d2f386d63465363542e706e67222077696474683d22363030223e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e3c62723e3c2f666f6e743e3c2f703e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e446561722056616c75656420436c69656e742c3c2f666f6e743e3c2f703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e0d0a2020202020202020202020203c2f666f6e743e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e3c62723e3c2f666f6e743e3c2f703e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e4569642d756c2d61646861204d75626172616b213c62723e3c2f666f6e743e3c2f703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e0d0a2020202020202020202020203c2f666f6e743e3c703e3c666f6e742073697a653d22342220666163653d2276657264616e61223e266e6273703b3c2f666f6e743e3c2f703e3c62723e3c666f6e742073697a653d22342220666163653d2276657264616e61223e3c2f666f6e743e, '2000-09-11', 0, '2016-01-20 16:05:54', 0);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `order_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `invoice_decision_date` date DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `mobile_no` varchar(15) NOT NULL,
  `work_place` varchar(50) DEFAULT NULL,
  `category` varchar(10) DEFAULT NULL,
  `sales_person` varchar(50) DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `cash_price` decimal(11,2) NOT NULL DEFAULT '0.00',
  `payment_mode` varchar(15) DEFAULT NULL,
  `payment_term` varchar(20) DEFAULT NULL,
  `rate_id` int(11) DEFAULT NULL,
  `custom_rate` int(3) DEFAULT NULL,
  `quantity` int(3) NOT NULL,
  `tax_charge` int(3) DEFAULT NULL,
  `hp_price` decimal(11,2) NOT NULL DEFAULT '0.00',
  `mthly_install` decimal(11,2) NOT NULL,
  `discount` decimal(3,2) DEFAULT '0.00',
  `amount_paid` decimal(11,2) NOT NULL,
  `balance` decimal(11,2) NOT NULL,
  `differencefrmexpected` int(11) DEFAULT '0',
  `interest_accrued` decimal(11,2) NOT NULL DEFAULT '0.00',
  `cheque_nos` varchar(400) DEFAULT NULL,
  `used_chequenos` varchar(400) DEFAULT NULL,
  `payment_status` enum('no_payment','part_payment','full_payment','expired') NOT NULL DEFAULT 'no_payment',
  `approved` int(1) NOT NULL DEFAULT '0',
  `status` enum('Pending Approval','Rejected','Approved','Deleted','Repossesed') NOT NULL DEFAULT 'Pending Approval',
  `delivery` enum('No','Warehouse Processing','En-route','Delivered') NOT NULL DEFAULT 'No',
  `invoice_no` varchar(15) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `previouspayment_date` date DEFAULT NULL,
  `payment_finish_date` date DEFAULT NULL,
  `first_date` date DEFAULT NULL,
  `last_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_person` (`sales_person`),
  KEY `invoice_number` (`invoice_no`,`due_date`,`first_date`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `last_modified_date`, `order_date`, `delivery_date`, `invoice_decision_date`, `customer_id`, `mobile_no`, `work_place`, `category`, `sales_person`, `zone_id`, `cash_price`, `payment_mode`, `payment_term`, `rate_id`, `custom_rate`, `quantity`, `tax_charge`, `hp_price`, `mthly_install`, `discount`, `amount_paid`, `balance`, `differencefrmexpected`, `interest_accrued`, `cheque_nos`, `used_chequenos`, `payment_status`, `approved`, `status`, `delivery`, `invoice_no`, `due_date`, `previouspayment_date`, `payment_finish_date`, `first_date`, `last_date`) VALUES
(1, '2015-11-26 18:25:24', '2015-10-31', '2015-10-31', '2015-11-03', 1, '12342', 'test', NULL, NULL, 2, '120.00', 'Cash', '1 month', 19, NULL, 0, NULL, '130.00', '130.00', '0.00', '0.00', '130.00', 0, '0.00', '', NULL, 'no_payment', 1, 'Approved', 'Delivered', 'BOM001', '2015-12-01', NULL, NULL, NULL, '2015-12-01'),
(2, '2015-11-07 18:58:16', '2015-11-07', NULL, NULL, 1, '12342', 'test', NULL, NULL, 2, '240.00', 'Cash', '1 month', 19, NULL, 0, NULL, '259.00', '259.00', '0.00', '0.00', '259.00', 0, '0.00', '', NULL, 'no_payment', 0, 'Pending Approval', 'No', 'BOM002', NULL, NULL, NULL, NULL, NULL),
(3, '2016-06-20 08:19:08', '2016-06-20', NULL, NULL, 7, '02430006709', 'erere', NULL, 'test_sales', 3, '30.00', 'Cash', '12 months', 31, NULL, 0, NULL, '53.00', '4.00', '0.00', '0.00', '53.00', 0, '0.00', '', NULL, 'no_payment', 0, 'Pending Approval', 'No', 'BOM003', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders_items`
--

CREATE TABLE IF NOT EXISTS `orders_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reimbursement` decimal(11,2) DEFAULT '0.00',
  `order_id` int(11) NOT NULL,
  `warehouse_item_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `repossed` enum('Yes','No','Pending Repossession') NOT NULL DEFAULT 'No',
  `pending_repossed` enum('Yes','No') NOT NULL DEFAULT 'No',
  `quantity` int(11) NOT NULL,
  `qty_stock` int(11) NOT NULL,
  `cost_price` decimal(18,2) NOT NULL,
  `unit_price` decimal(18,2) NOT NULL,
  `hp_price` decimal(18,2) NOT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `orders_items`
--

INSERT INTO `orders_items` (`id`, `reimbursement`, `order_id`, `warehouse_item_id`, `item_id`, `customer_id`, `repossed`, `pending_repossed`, `quantity`, `qty_stock`, `cost_price`, `unit_price`, `hp_price`, `last_modified_date`) VALUES
(1, '0.00', 1, 4, 4, 1, 'No', 'No', 1, 87, '100.00', '130.00', '130.00', '2015-10-31 18:02:17'),
(2, '0.00', 2, 4, 4, 1, 'No', 'No', 2, 86, '100.00', '130.00', '259.00', '2015-11-07 18:58:16'),
(3, '0.00', 3, 513, 513, 7, 'No', 'No', 1, 19, '10.00', '27.00', '27.00', '2016-06-20 08:19:08');

-- --------------------------------------------------------

--
-- Table structure for table `payment_modes`
--

CREATE TABLE IF NOT EXISTS `payment_modes` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `payment_mode_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `payment_modes`
--

INSERT INTO `payment_modes` (`id`, `payment_mode_name`) VALUES
(1, 'Cash'),
(2, 'Cheque'),
(3, 'Bank transfer'),
(4, 'Post-dated chq'),
(5, 'Standing order'),
(6, 'Visa'),
(7, 'Other'),
(8, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `payment_terms`
--

CREATE TABLE IF NOT EXISTS `payment_terms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_name` varchar(15) NOT NULL,
  `period_months` int(4) NOT NULL,
  `interest_rate` decimal(3,3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `payment_terms`
--

INSERT INTO `payment_terms` (`id`, `payment_name`, `period_months`, `interest_rate`) VALUES
(1, '3 months', 3, '0.030'),
(2, '4 months', 4, '0.040'),
(3, '5 months', 5, '0.045'),
(4, '6 months', 6, '0.050'),
(5, '7 months', 7, '0.055'),
(6, '--None--', 1, '0.000');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `creditor_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `zone_id` int(2) DEFAULT NULL,
  `expectedpayment_id` int(11) DEFAULT NULL,
  `payment_type` varchar(30) NOT NULL,
  `payment_mode` varchar(20) DEFAULT NULL,
  `amount` decimal(11,2) NOT NULL,
  `deleted_amount` decimal(11,2) DEFAULT '0.00',
  `used_chequenos` varchar(100) DEFAULT NULL,
  `payment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pettycash_deposits`
--

CREATE TABLE IF NOT EXISTS `pettycash_deposits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pettycash_id` int(11) DEFAULT NULL,
  `cash_account_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `amount` decimal(11,2) DEFAULT '0.00',
  `zone_id` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pettycash_withdrawals`
--

CREATE TABLE IF NOT EXISTS `pettycash_withdrawals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pettycash_id` int(11) DEFAULT NULL,
  `cash_account_id` int(11) DEFAULT NULL,
  `zone_id` int(2) DEFAULT NULL,
  `amount` decimal(11,2) DEFAULT '0.00',
  `created_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pettycashes`
--

CREATE TABLE IF NOT EXISTS `pettycashes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(11,2) DEFAULT '0.00',
  `balance` decimal(11,2) DEFAULT '0.00',
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `zone_id` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `portfolios`
--

CREATE TABLE IF NOT EXISTS `portfolios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_name` varchar(15) NOT NULL,
  `period_months` int(4) NOT NULL,
  `interest_rate` decimal(3,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `portfolios`
--

INSERT INTO `portfolios` (`id`, `payment_name`, `period_months`, `interest_rate`) VALUES
(19, '1 month', 1, '2.50'),
(21, '2 months', 2, '2.50'),
(23, '4 months', 4, '2.50'),
(25, '6 months', 6, '2.50'),
(26, '7 months', 7, '2.50'),
(27, '8 months', 8, '2.50'),
(28, '9 months', 9, '2.50'),
(29, '10 months', 10, '2.50'),
(30, '11 months', 11, '9.99'),
(32, '5 months', 5, '9.99'),
(33, '--None--', 1, '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE IF NOT EXISTS `promotions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(1) DEFAULT NULL,
  `recipient_groups` varchar(20) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `message` blob,
  `system` int(1) NOT NULL DEFAULT '0',
  `modified` timestamp NOT NULL,
  `deleted` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `promotions`
--

INSERT INTO `promotions` (`id`, `event_id`, `recipient_groups`, `subject`, `message`, `system`, `modified`, `deleted`) VALUES
(1, 4, '2,4,3,1,', 'Default Promo Message', 0x3c696d67207372633d22687474703a2f2f692e696d6775722e636f6d2f5241564c6e6b702e706e67223e3c62723e3c62723e3c696d67207372633d22687474703a2f2f692e696d6775722e636f6d2f784c7875556e592e706e67222077696474683d22363030223e3c62723e, 1, '2016-03-11 03:16:58', 0),
(2, 4, '2,4,3,1,', 'Clearance Sale', 0x3c696d67207372633d22687474703a2f2f692e696d6775722e636f6d2f35517656786a582e706e67222077696474683d22363030223e3c62723e3c62723e3c696d67207372633d22687474703a2f2f692e696d6775722e636f6d2f784c7875556e592e706e67222077696474683d22363030223e3c62723e, 0, '2016-01-20 16:30:33', 0),
(3, 4, '2,', 'Sale', 0x3c696d67207372633d22687474703a2f2f692e696d6775722e636f6d2f35517656786a582e706e67222077696474683d22363030223e3c62723e3c62723e3c696d67207372633d22687474703a2f2f692e696d6775722e636f6d2f784c7875556e592e706e67222077696474683d22363030223e3c62723e, 0, '2016-03-11 03:18:30', 0),
(4, 4, '2,4,1,', 'Testing delete function', 0x3c696d67207372633d22687474703a2f2f692e696d6775722e636f6d2f5241564c6e6b702e706e67223e3c62723e3c62723e3c696d67207372633d22687474703a2f2f692e696d6775722e636f6d2f784c7875556e592e706e67222077696474683d22363030223e3c62723e, 0, '2016-03-11 03:17:29', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

CREATE TABLE IF NOT EXISTS `rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_name` varchar(15) NOT NULL,
  `period_months` int(4) NOT NULL,
  `interest_rate` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `rates`
--

INSERT INTO `rates` (`id`, `payment_name`, `period_months`, `interest_rate`) VALUES
(19, '1 month', 1, 8),
(21, '2 months', 2, 13),
(22, '3 months', 3, 18),
(23, '4 months', 4, 24),
(25, '6 months', 6, 34),
(26, '7 months', 7, 41),
(27, '8 months', 8, 48),
(28, '9 months', 9, 54),
(29, '10 months', 10, 62),
(30, '11 months', 11, 69),
(31, '12 months', 12, 77),
(32, '5 months', 5, 29),
(33, '--None--', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `repossessions`
--

CREATE TABLE IF NOT EXISTS `repossessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `orders_item_id` int(11) DEFAULT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `invoice_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `item_condition` varchar(20) DEFAULT NULL,
  `reimbursement` decimal(11,2) DEFAULT '0.00',
  `depreciation` int(3) DEFAULT NULL,
  `reposs_reason` varchar(40) DEFAULT NULL,
  `other_remarks` varchar(255) DEFAULT NULL,
  `reposs_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rollovers`
--

CREATE TABLE IF NOT EXISTS `rollovers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `investment_id` int(11) DEFAULT NULL,
  `investor_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` decimal(11,2) DEFAULT '0.00',
  `created` datetime NOT NULL,
  `rollover_date` date DEFAULT NULL,
  `delete_status` enum('dead','alive') DEFAULT 'alive',
  `deleted_by` varchar(200) DEFAULT NULL,
  `edit_details_username_oldnnewamout` varchar(200) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE IF NOT EXISTS `sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `zone_id` int(2) DEFAULT NULL,
  `sales_person` varchar(50) DEFAULT NULL,
  `total_cost` decimal(11,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(6,2) DEFAULT '0.00',
  `amount_paid` decimal(11,2) NOT NULL DEFAULT '0.00',
  `total_costprice` decimal(11,2) DEFAULT '0.00',
  `balance` decimal(11,2) NOT NULL DEFAULT '0.00',
  `tax_charge` decimal(11,2) NOT NULL DEFAULT '0.00',
  `status` enum('alive','deleted','processed') DEFAULT 'alive',
  `payment_status` enum('ordered','processed') DEFAULT 'ordered',
  `sale_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `customer_id`, `user_id`, `zone_id`, `sales_person`, `total_cost`, `discount`, `amount_paid`, `total_costprice`, `balance`, `tax_charge`, `status`, `payment_status`, `sale_date`, `created`, `modified`) VALUES
(1, 1, 39, NULL, 'support', '123.60', '0.00', '123.60', '100.00', '0.00', '3.60', 'alive', 'processed', '2015-09-22 16:46:18', '2015-09-22 16:46:18', '2015-09-22 16:46:18'),
(2, 1, 39, NULL, 'yawagyemang', '1200.00', '0.00', '1200.00', '1000.00', '0.00', '0.00', 'alive', 'processed', '2015-11-16 18:22:26', '2015-11-16 19:22:26', '2015-11-16 19:22:27'),
(3, 1, 39, NULL, 'support', '30.90', '0.00', '30.90', '0.00', '0.00', '0.90', 'deleted', 'processed', '2015-11-27 11:27:19', '2015-11-27 12:27:19', '2015-12-02 15:47:50'),
(4, 1, 39, NULL, 'support', '100.00', '0.00', '100.00', '0.00', '0.00', '0.00', 'alive', 'processed', '2015-11-29 14:20:02', '2015-11-29 15:20:02', '2015-11-29 15:20:03'),
(5, 1, 39, NULL, 'support', '90.00', '0.00', '90.00', '0.00', '0.00', '0.00', 'deleted', 'processed', '2015-12-02 13:37:14', '2015-12-02 14:37:14', '2015-12-02 15:47:58'),
(6, 2, 39, NULL, 'support', '190.00', '0.00', '190.00', '0.00', '0.00', '0.00', 'alive', 'processed', '2015-12-03 15:27:48', '2015-12-03 16:27:48', '2015-12-03 16:27:48'),
(7, 1, 39, NULL, 'support', '350.00', '0.00', '350.00', '0.00', '0.00', '0.00', 'alive', 'processed', '2015-12-03 15:56:42', '2015-12-03 16:56:42', '2015-12-03 16:56:42'),
(8, 3, 39, NULL, 'support', '212.33', '7.20', '228.00', '0.00', '-15.67', '0.00', 'alive', 'processed', '2015-12-04 01:45:48', '2015-12-04 02:45:48', '2015-12-04 02:45:48'),
(9, 3, 39, NULL, 'support', '44.00', '1.20', '44.00', '0.00', '0.00', '0.00', 'alive', 'processed', '2015-12-04 01:57:00', '2015-12-04 02:57:00', '2015-12-04 02:57:00'),
(10, 10, 39, NULL, 'support', '70.00', NULL, '45.00', '0.00', '25.00', '0.00', 'alive', 'processed', '2015-12-30 08:31:47', '2015-12-30 09:31:47', '2015-12-30 09:31:47'),
(11, 10, 39, NULL, 'support', '45.00', '25.00', '45.00', '0.00', '0.00', '0.00', 'alive', 'processed', '2015-12-30 08:43:50', '2015-12-30 09:43:50', '2015-12-30 09:43:50'),
(12, 3, 39, NULL, 'support', '40.00', '0.00', '41.20', '0.00', '-1.20', '0.00', 'alive', 'processed', '2015-12-30 09:18:05', '2015-12-30 10:18:05', '2015-12-30 10:18:05'),
(13, 3, 39, NULL, 'support', '37.20', '4.00', '37.20', '0.00', '0.00', '1.20', 'alive', 'processed', '2015-12-30 09:27:23', '2015-12-30 10:27:23', '2015-12-30 10:27:23'),
(14, 10, 39, NULL, 'support', '26.50', '25.00', '26.50', '0.00', '0.00', '1.50', 'alive', 'processed', '2015-12-30 09:43:37', '2015-12-30 10:43:37', '2015-12-30 10:43:37'),
(15, 1, 39, NULL, 'support', '15.00', '0.00', '15.45', '0.00', '-0.45', '0.00', 'alive', 'processed', '2016-01-01 03:23:08', '2016-01-01 04:23:08', '2016-01-01 04:23:08'),
(16, 1, 39, NULL, 'support', '35.00', '0.00', '35.00', '0.00', '0.00', '0.00', 'alive', 'processed', '2016-01-01 03:28:26', '2016-01-01 04:28:26', '2016-01-01 04:28:26'),
(17, 1, 39, NULL, 'support', '80.00', '0.00', '82.40', '0.00', '-2.40', '0.00', 'alive', 'processed', '2016-03-10 21:25:05', '2016-03-10 22:25:05', '2016-03-10 22:25:05'),
(18, 1, 39, NULL, 'support', '50.00', '0.00', '50.00', '0.00', '0.00', '0.00', 'alive', 'processed', '2016-03-10 22:03:46', '2016-03-10 23:03:46', '2016-03-10 23:03:46'),
(19, 1, 39, NULL, 'support', '80.00', '0.00', '80.00', '0.00', '0.00', '0.00', 'alive', 'processed', '2016-03-10 22:04:59', '2016-03-10 23:04:59', '2016-03-10 23:04:59'),
(20, 1, 39, NULL, 'support', '40.00', '0.00', '40.00', '0.00', '0.00', '0.00', 'alive', 'processed', '2016-03-10 22:11:59', '2016-03-10 23:11:59', '2016-03-10 23:11:59'),
(21, 1, 39, NULL, 'support', '15.00', '0.00', '15.45', '0.00', '-0.45', '0.00', 'alive', 'processed', '2016-04-21 04:00:00', '2016-04-21 22:36:27', '2016-04-21 22:36:27'),
(22, 1, 39, NULL, 'support', '65.00', '0.00', '6695.00', '0.00', '-6630.00', '0.00', 'deleted', 'ordered', '2016-06-19 22:00:00', '2016-06-20 10:10:41', '2016-06-20 10:14:06');

-- --------------------------------------------------------

--
-- Table structure for table `sales_items`
--

CREATE TABLE IF NOT EXISTS `sales_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `warehouse_item_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `cost_price` decimal(18,2) NOT NULL,
  `unit_price` decimal(18,2) NOT NULL,
  `hp_price` decimal(18,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `sales_items`
--

INSERT INTO `sales_items` (`id`, `sale_id`, `item_id`, `warehouse_item_id`, `user_id`, `customer_id`, `quantity`, `cost_price`, `unit_price`, `hp_price`) VALUES
(1, 1, 3, 2, 39, 1, 1, '100.00', '120.00', '0.00'),
(2, 2, 4, 3, 88, 1, 10, '100.00', '120.00', '0.00'),
(3, 3, 17, 18, 39, 1, 1, '0.00', '30.00', '0.00'),
(4, 4, 503, 673, 39, 1, 1, '0.00', '40.00', '0.00'),
(5, 4, 427, 597, 39, 1, 1, '0.00', '10.00', '0.00'),
(6, 4, 358, 528, 39, 1, 1, '0.00', '50.00', '0.00'),
(7, 5, 503, 673, NULL, 1, 1, '0.00', '40.00', '0.00'),
(8, 5, 504, 674, NULL, 1, 1, '0.00', '50.00', '0.00'),
(9, 6, 504, 674, NULL, 2, 1, '0.00', '50.00', '0.00'),
(10, 6, 488, 658, NULL, 2, 1, '0.00', '35.00', '0.00'),
(11, 6, 492, 662, NULL, 2, 3, '0.00', '35.00', '0.00'),
(12, 7, 347, 517, NULL, 1, 3, '0.00', '40.00', '0.00'),
(13, 7, 344, 514, NULL, 1, 4, '0.00', '50.00', '0.00'),
(14, 7, 352, 522, NULL, 1, 1, '0.00', '30.00', '0.00'),
(15, 8, 350, 520, NULL, 3, 1, '0.00', '17.60', '0.00'),
(16, 8, 355, 525, NULL, 3, 4, '0.00', '52.80', '0.00'),
(17, 9, 347, 517, NULL, 3, 1, '0.00', '35.20', '0.00'),
(18, 9, 357, 527, NULL, 3, 1, '0.00', '8.80', '0.00'),
(19, 10, 506, 676, NULL, 10, 1, '0.00', '50.00', '0.00'),
(20, 10, 360, 530, NULL, 10, 1, '0.00', '20.00', '0.00'),
(21, 11, 506, 676, NULL, 10, 1, '0.00', '50.00', '0.00'),
(22, 11, 360, 530, NULL, 10, 1, '0.00', '20.00', '0.00'),
(23, 12, 503, 673, NULL, 3, 1, '0.00', '40.00', '0.00'),
(24, 13, 503, 673, NULL, 3, 1, '0.00', '40.00', '0.00'),
(25, 14, 504, 674, NULL, 10, 1, '0.00', '50.00', '0.00'),
(26, 15, 343, 513, NULL, 1, 1, '0.00', '15.00', '0.00'),
(27, 16, 346, 516, NULL, 1, 1, '0.00', '35.00', '0.00'),
(28, 17, 363, 533, 39, 1, 1, '0.00', '80.00', '0.00'),
(29, 18, 350, 520, 39, 1, 1, '0.00', '20.00', '0.00'),
(30, 18, 352, 522, 39, 1, 1, '0.00', '30.00', '0.00'),
(31, 19, 374, 544, NULL, 1, 1, '0.00', '20.00', '0.00'),
(32, 19, 401, 571, NULL, 1, 1, '0.00', '60.00', '0.00'),
(33, 20, 365, 535, NULL, 1, 1, '0.00', '40.00', '0.00'),
(34, 21, 343, 513, NULL, 1, 1, '0.00', '15.00', '0.00'),
(35, 22, 343, 513, NULL, 1, 2, '0.00', '15.00', '0.00'),
(36, 22, 346, 516, NULL, 1, 1, '0.00', '35.00', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_id` int(11) NOT NULL,
  `inventory_acc_id` int(2) DEFAULT NULL,
  `sales_acc_id` int(2) DEFAULT NULL,
  `company_name` varchar(100) NOT NULL,
  `owner_name` varchar(100) DEFAULT NULL,
  `location` varchar(50) NOT NULL,
  `postal_address` varchar(100) NOT NULL,
  `postal_town_suburb` varchar(50) NOT NULL,
  `postal_city` varchar(20) NOT NULL,
  `postal_country` varchar(25) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  `mobile` varchar(40) NOT NULL,
  `email` varchar(50) NOT NULL,
  `accounting_month` date DEFAULT NULL,
  `logo` varchar(20) DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `currency_id`, `inventory_acc_id`, `sales_acc_id`, `company_name`, `owner_name`, `location`, `postal_address`, `postal_town_suburb`, `postal_city`, `postal_country`, `telephone`, `mobile`, `email`, `accounting_month`, `logo`, `modified`) VALUES
(1, 1, 4, 4, 'Bomark Royal Enterprise', 'Yaw Agyemang', 'Accra', ' P.O. Box SQ 520', 'Mankwadi', 'Tema', 'Ghana', '0303305139', '0245849785', 'bomarkroyal@live.com', '2015-01-01', 'logo.png', '2016-03-15 23:33:28');

-- --------------------------------------------------------

--
-- Table structure for table `stated_bank_balances`
--

CREATE TABLE IF NOT EXISTS `stated_bank_balances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `statement_date` date DEFAULT NULL,
  `amount` decimal(11,2) DEFAULT '0.00',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `user` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `stated_bank_balances`
--

INSERT INTO `stated_bank_balances` (`id`, `bank_id`, `account_id`, `statement_date`, `amount`, `created`, `modified`, `user`) VALUES
(31, NULL, 3, '2015-06-03', '10000.00', '2015-06-03 06:27:13', '2015-06-03 06:27:13', 'Support');

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE IF NOT EXISTS `stocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(200) NOT NULL,
  `item_type` varchar(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `cost_price` int(11) NOT NULL,
  `selling_price` int(11) NOT NULL,
  `original_quantity` int(11) NOT NULL DEFAULT '0',
  `remaining_quantity` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `item`, `item_type`, `supplier_id`, `cost_price`, `selling_price`, `original_quantity`, `remaining_quantity`) VALUES
(1, 'test', '0', 18, 200, 300, 290, 290);

-- --------------------------------------------------------

--
-- Table structure for table `supplierinvoices`
--

CREATE TABLE IF NOT EXISTS `supplierinvoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supply_date` date DEFAULT NULL,
  `supply_invoiceno` varchar(70) DEFAULT NULL,
  `supplier_id` int(11) NOT NULL,
  `cost_price` decimal(11,2) DEFAULT '0.00',
  `amountpaid` decimal(11,2) DEFAULT '0.00',
  `balance` decimal(11,2) DEFAULT '0.00',
  `payment_mode` varchar(15) DEFAULT NULL,
  `payment_status` enum('no_payment','part_payment','full_payment','expired') DEFAULT 'no_payment',
  `cheque_nos` varchar(400) DEFAULT NULL,
  `used_chequenos` varchar(400) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_disb_date` date DEFAULT NULL,
  `first_date` date DEFAULT NULL,
  `payment_finish_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `supplieritems`
--

CREATE TABLE IF NOT EXISTS `supplieritems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `serialno` varchar(70) DEFAULT NULL,
  `supply_invoiceno` varchar(70) DEFAULT NULL,
  `supplier_id` int(11) NOT NULL,
  `cost_price` int(11) NOT NULL,
  `selling_price` int(11) NOT NULL,
  `original_quantity` int(11) NOT NULL DEFAULT '0',
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE IF NOT EXISTS `suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(50) NOT NULL,
  `supplier_address` varchar(100) DEFAULT NULL,
  `supplier_tel` varchar(50) NOT NULL,
  `supplier_email` varchar(30) DEFAULT NULL,
  `bank1_name` varchar(100) DEFAULT '',
  `bank1_branch` varchar(50) DEFAULT '',
  `bank1_acc_no` varchar(50) DEFAULT '',
  `bank2_name` varchar(100) DEFAULT '',
  `bank2_branch` varchar(50) DEFAULT '',
  `bank2_acc_no` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `supplier_name` (`supplier_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `supplier_name`, `supplier_address`, `supplier_tel`, `supplier_email`, `bank1_name`, `bank1_branch`, `bank1_acc_no`, `bank2_name`, `bank2_branch`, `bank2_acc_no`) VALUES
(1, 'YIWU JUNHE IMPORT AND EXPORT CO. LTD. (KATHY)', 'No. 1 13865 shop 2/F Area 6 Street 2 Period International City Yiwu', '008618857981609', 'yudawjgj@126.com', 'PING AN BANK CO. LTD OFFSHORE DEPT', '5047, ROAD SHENNAN, SHENZHEN, PR CHINA SZDBCNBS', '0SA11014569644003', '', '', ''),
(2, 'YUYAO KEDER INTERNATIONAL TRADING CO. LTD.', '37, Zhenbei East Rd. Huangjiabu Town, Yuyao City, Zhejiang Province Chna', '008615968010949', 'j.j.jing@hotmail.com', 'BANK OF CHINA', 'YUYAO SUB-BRANCH, 58 Shunshui South Rd. Yuyao', '814042144408114014', '', '', ''),
(3, 'YUANLI IMPORT AND EXPORT DEPT. ', 'Shangjiang industrial area, Miaogao town, Suichang Zhejiang', '008615258736718', 'yuanlisherry@aliyun.com', 'CHINA CONSTRUCTION BANK', '56 Shang St., Quzhou City, Zhejiang China ', '33014049200220508732', '', '', ''),
(4, 'Salex', 'PMB L89,Legon', '0243099000', 'info@salex.com', 'Zenith Bank', 'East Legon', '20104558092', 'Fidelity Bank', 'UPS', '40109811326');

-- --------------------------------------------------------

--
-- Table structure for table `supply_payments`
--

CREATE TABLE IF NOT EXISTS `supply_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplierinvoice_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `payment_type` varchar(30) NOT NULL,
  `payment_mode` varchar(20) DEFAULT NULL,
  `amount` decimal(11,2) NOT NULL,
  `used_chequenos` varchar(100) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE IF NOT EXISTS `taxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_name` varchar(100) NOT NULL,
  `tax_rate` decimal(11,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `tax_name`, `tax_rate`) VALUES
(3, 'NHIS', '1.50'),
(4, 'VAT', '1.50');

-- --------------------------------------------------------

--
-- Table structure for table `temp_sales`
--

CREATE TABLE IF NOT EXISTS `temp_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sales_person` varchar(50) DEFAULT NULL,
  `selling_price` int(11) NOT NULL,
  `amount_paid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `sale_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=61 ;

--
-- Dumping data for table `temp_sales`
--

INSERT INTO `temp_sales` (`id`, `item_id`, `client_id`, `user_id`, `sales_person`, `selling_price`, `amount_paid`, `quantity`, `payment_status`, `sale_date`) VALUES
(1, 3, 1, 0, NULL, 120, 0, 1, '', '2015-09-22 16:46:02'),
(2, 4, 1, 0, NULL, 120, 0, 1, '', '2015-10-16 11:13:07'),
(3, 4, 1, 0, NULL, 120, 0, 10, '', '2015-11-16 18:20:21'),
(4, 4, 1, 0, NULL, 120, 0, 1, '', '2015-11-26 20:31:57'),
(5, 4, 1, 0, NULL, 120, 0, 101, '', '2015-11-27 11:18:05'),
(6, 123, 1, 0, NULL, 30, 0, 1, '', '2015-11-27 11:25:12'),
(7, 17, 1, 0, NULL, 30, 0, 1, '', '2015-11-27 11:26:55'),
(8, 7, 1, 0, NULL, 8, 0, 1, '', '2015-11-27 13:21:20'),
(9, 503, 1, 0, NULL, 40, 0, 1, '', '2015-11-29 14:16:54'),
(10, 427, 1, 0, NULL, 10, 0, 1, '', '2015-11-29 14:17:13'),
(11, 358, 1, 0, NULL, 50, 0, 1, '', '2015-11-29 14:17:26'),
(12, 503, 1, 0, NULL, 40, 0, 1, '', '2015-11-30 17:45:59'),
(13, 503, 1, 0, NULL, 40, 0, 1, '', '2015-12-02 13:24:30'),
(14, 503, 1, 0, NULL, 40, 0, 1, '', '2015-12-02 13:27:27'),
(15, 504, 1, 0, NULL, 50, 0, 1, '', '2015-12-02 13:28:11'),
(16, 348, 1, 0, NULL, 50, 0, 1, '', '2015-12-03 09:01:05'),
(17, 504, 1, 0, NULL, 50, 0, 1, '', '2015-12-03 09:01:21'),
(18, 504, 1, 0, NULL, 50, 0, 1, '', '2015-12-03 15:22:48'),
(19, 488, 2, 0, NULL, 35, 0, 1, '', '2015-12-03 15:23:22'),
(20, 492, 2, 0, NULL, 35, 0, 3, '', '2015-12-03 15:23:32'),
(21, 347, 1, 0, NULL, 40, 0, 3, '', '2015-12-03 15:56:15'),
(22, 344, 1, 0, NULL, 50, 0, 4, '', '2015-12-03 15:56:24'),
(23, 352, 1, 0, NULL, 30, 0, 1, '', '2015-12-03 15:56:33'),
(24, 350, 3, 0, NULL, 20, 0, 1, '', '2015-12-04 01:43:49'),
(25, 355, 3, 0, NULL, 60, 0, 4, '', '2015-12-04 01:43:59'),
(26, 347, 3, 0, NULL, 40, 0, 1, '', '2015-12-04 01:56:45'),
(27, 357, 3, 0, NULL, 10, 0, 1, '', '2015-12-04 01:56:52'),
(28, 505, 10, 0, NULL, 20, 0, 1, '', '2015-12-12 15:04:17'),
(29, 505, 10, 0, NULL, 20, 0, 1, '', '2015-12-12 15:04:37'),
(30, 505, 10, 0, NULL, 20, 0, 1, '', '2015-12-12 15:09:09'),
(31, 503, 10, 0, NULL, 40, 0, 1, '', '2015-12-22 16:03:09'),
(32, 503, 10, 0, NULL, 40, 0, 1, '', '2015-12-22 16:03:36'),
(33, 503, 10, 0, NULL, 40, 0, 1, '', '2015-12-22 16:07:08'),
(34, 503, 10, 0, NULL, 40, 0, 1, '', '2015-12-22 16:10:18'),
(35, 504, 10, 0, NULL, 50, 0, 1, '', '2015-12-26 10:08:24'),
(36, 504, 10, 0, NULL, 50, 0, 1, '', '2015-12-28 13:56:03'),
(37, 505, 10, 0, NULL, 20, 0, 1, '', '2015-12-28 14:09:51'),
(38, 503, 10, 0, NULL, 40, 0, 1, '', '2015-12-30 07:30:18'),
(39, 505, 10, 0, NULL, 20, 0, 1, '', '2015-12-30 07:55:36'),
(40, 499, 10, 0, NULL, 15, 0, 1, '', '2015-12-30 07:55:49'),
(41, 360, 10, 0, NULL, 20, 0, 1, '', '2015-12-30 08:09:46'),
(42, 506, 10, 0, NULL, 50, 0, 1, '', '2015-12-30 08:22:35'),
(43, 360, 10, 0, NULL, 20, 0, 1, '', '2015-12-30 08:28:48'),
(44, 503, 3, 0, NULL, 40, 0, 1, '', '2015-12-30 08:47:37'),
(45, 503, 3, 0, NULL, 40, 0, 1, '', '2015-12-30 09:19:21'),
(46, 503, 3, 0, NULL, 40, 0, 1, '', '2015-12-30 09:23:49'),
(47, 504, 10, 0, NULL, 50, 0, 1, '', '2015-12-30 09:42:49'),
(48, 503, 10, 0, NULL, 40, 0, 1, '', '2015-12-30 09:46:25'),
(49, 343, 1, 0, NULL, 15, 0, 1, '', '2016-01-01 03:22:22'),
(50, 346, 1, 0, NULL, 35, 0, 1, '', '2016-01-01 03:28:11'),
(51, 363, 1, 0, NULL, 80, 0, 1, '', '2016-03-10 21:24:38'),
(52, 350, 1, 0, NULL, 20, 0, 1, '', '2016-03-10 21:53:58'),
(53, 352, 1, 0, NULL, 30, 0, 1, '', '2016-03-10 21:55:38'),
(54, 374, 1, 0, NULL, 20, 0, 1, '', '2016-03-10 22:04:17'),
(55, 401, 1, 0, NULL, 60, 0, 1, '', '2016-03-10 22:04:52'),
(56, 365, 1, 0, NULL, 40, 0, 1, '', '2016-03-10 22:05:26'),
(57, 413, 8, 0, NULL, 20, 0, 1, '', '2016-03-10 22:12:47'),
(58, 343, 1, 0, NULL, 15, 0, 1, '', '2016-04-21 20:36:11'),
(59, 343, 1, 0, NULL, 15, 0, 2, '', '2016-06-20 08:09:22'),
(60, 346, 1, 0, NULL, 35, 0, 1, '', '2016-06-20 08:09:32');

-- --------------------------------------------------------

--
-- Table structure for table `tempcash_accounts`
--

CREATE TABLE IF NOT EXISTS `tempcash_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `zone_id` int(2) DEFAULT NULL,
  `expense_type` int(1) NOT NULL,
  `expense_desc` varchar(27) DEFAULT NULL,
  `expense_date` date NOT NULL,
  `source` varchar(15) DEFAULT NULL,
  `amount` decimal(11,2) NOT NULL,
  `prepared_by` varchar(50) DEFAULT NULL,
  `paid_to` varchar(70) DEFAULT NULL,
  `remarks` text NOT NULL,
  `status` enum('Approved','Rejected','Pending') DEFAULT 'Pending',
  PRIMARY KEY (`id`),
  KEY `expense_name` (`category_id`,`expense_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_categories`
--

CREATE TABLE IF NOT EXISTS `transaction_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `head_id` int(1) DEFAULT NULL,
  `category_name` varchar(35) DEFAULT NULL,
  `system` int(1) DEFAULT '0',
  `deleted` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=107 ;

--
-- Dumping data for table `transaction_categories`
--

INSERT INTO `transaction_categories` (`id`, `head_id`, `category_name`, `system`, `deleted`) VALUES
(22, 2, 'Bank & Credit Card Fees', 1, 0),
(23, 2, 'Water Bill', 1, 0),
(24, 2, 'Cash Withdrawal or Transfer', 1, 0),
(25, 2, 'Fixed Asset Depreciation', 1, 1),
(26, 2, 'Electricity Bill', 1, 0),
(27, 2, 'Internet Fees', 1, 0),
(28, 2, 'Loss on Asset Disposal', 1, 0),
(32, 2, 'Entertainment', 1, 0),
(33, 2, 'Medical Costs', 1, 0),
(34, 2, 'Furniture & Electronics', 1, 0),
(35, 2, 'Maintenance Work', 1, 0),
(36, 2, 'Telephone Bill or Credit', 1, 0),
(37, 2, 'Insurance - Health', 1, 0),
(38, 2, 'Insurance - Property', 1, 0),
(39, 2, 'Insurance - Vehicles', 1, 0),
(40, 2, 'Insurance - Life & Disability', 1, 0),
(41, 2, 'Mobile Phone Bill or Credit', 1, 0),
(42, 2, 'Rent', 1, 0),
(44, 2, 'Vehicle - Repairs & Maintenance', 1, 0),
(45, 2, 'Vehicle - Fuel', 1, 0),
(46, 2, 'Travel - Ticket/Airfare', 1, 0),
(47, 2, 'Travel - Allowances', 1, 0),
(48, 2, 'Other Transportation', 1, 0),
(49, 2, 'Uncagetorized Expense', 1, 0),
(50, 2, 'Salaries', 1, 0),
(51, 2, 'Subscriptions', 1, 0),
(52, 2, 'Donations & Gifts', 1, 0),
(53, 2, 'Office Consumables', 1, 0),
(54, 2, 'Prof. Services - Legal', 1, 0),
(55, 2, 'Prof. Services - Accounting', 1, 0),
(56, 2, 'Taxes & Licenses', 1, 0),
(57, 2, 'Postage, Shipping or Couriers', 1, 0),
(58, 2, 'Education & Training', 1, 0),
(59, 2, 'Advertising', 1, 0),
(60, 2, 'Insurance - Accident', 1, 0),
(61, 1, 'Sales', 1, 0),
(62, 1, 'Gain on Investment', 1, 0),
(63, 2, 'Investment', 1, 1),
(64, 2, 'Travel - Transport & Transit', 1, 0),
(65, 2, 'Insurance - Travel', 1, 0),
(66, 2, 'Travel - Hotel/Lodging', 1, 0),
(67, 3, 'Retained Earnings', 1, 0),
(68, 3, 'Owner Equity', 1, 0),
(70, 1, 'Uncategorized Income', 1, 0),
(71, 2, 'Mortgage', 1, 0),
(73, 1, 'Gain on Asset Disposal', 1, 1),
(74, 5, 'Loan (Principal+Fees)', 1, 0),
(75, 4, 'Accounts Receivable', 1, 0),
(76, 4, 'Interest Receivable', 1, 0),
(77, 4, 'Inventory', 1, 0),
(78, 4, 'Prepaid Expenses', 1, 1),
(79, 4, 'Other Current Investments', 1, 1),
(80, 4, 'Investments', 1, 0),
(81, 4, 'Fixed Asset (On credit)', 1, 0),
(82, 4, 'Notes Receivable (Long Term)', 1, 0),
(83, 4, 'Intangibles', 1, 1),
(84, 4, 'Other Assets', 1, 1),
(85, 5, 'Accounts payable', 1, 0),
(86, 5, 'Dividends payable', 1, 0),
(87, 5, 'Accrued expenses payable', 1, 1),
(88, 5, 'Income tax payable', 1, 0),
(89, 5, 'Unearned Franchise fees', 1, 1),
(90, 5, 'Notes Payable (Long term)', 1, 0),
(91, 5, 'Other long term liabilities', 1, 0),
(92, 5, 'Deferred Income Tax', 1, 1),
(93, 5, 'Long-term Debt', 1, 0),
(94, 5, 'Short-term Loans', 1, 1),
(95, 5, 'Accrued Salaries & Wages', 1, 0),
(96, 5, 'VAT+NHIL Payable', 1, 0),
(98, 5, 'Unearned Revenue', 1, 1),
(100, 4, 'Accumulated Depreciation (Less)', 1, 0),
(101, 4, 'Cash Asset', 1, 0),
(102, 4, 'Fixed Asset (Full payment made)', 1, 0),
(103, 2, 'Direct Cost/Sale Expense', 1, 0),
(104, 5, 'Loan Interest Payable', 1, 0),
(105, 2, 'Loan Repayment (Interest)', 1, 0),
(106, 2, 'Loss on Investment', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `head_id` int(1) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `paymentmode_id` int(3) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `effect` int(1) DEFAULT NULL COMMENT '0=Decrease, 1=Increase',
  `amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `debit` decimal(11,2) DEFAULT '0.00',
  `credit` decimal(11,2) DEFAULT '0.00',
  `cheque_no` varchar(35) DEFAULT NULL,
  `cheque_cleared` tinyint(1) NOT NULL DEFAULT '0',
  `prepared_by` varchar(50) DEFAULT NULL,
  `paid_to` varchar(70) DEFAULT NULL,
  `remarks` text NOT NULL,
  `random_salt` varchar(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `expense_name` (`category_id`,`transaction_date`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `head_id`, `account_id`, `category_id`, `paymentmode_id`, `transaction_date`, `effect`, `amount`, `debit`, `credit`, `cheque_no`, `cheque_cleared`, `prepared_by`, `paid_to`, `remarks`, `random_salt`, `create_date`, `modified`, `deleted`) VALUES
(1, 4, 4, 101, NULL, '2015-09-22', 0, '0.00', NULL, '0.00', NULL, 0, 'Qwick Fusion', NULL, 'Cash asset decrease from inventory update', 'Qwic5601187defec0', '2015-09-22 00:00:00', '2015-09-22 08:59:42', 0),
(2, 4, 4, 77, NULL, '2015-09-22', 1, '0.00', '0.00', NULL, NULL, 0, 'Qwick Fusion', NULL, 'Inventory asset increase from inventory update', 'Qwic5601187defeb5', '2015-09-22 00:00:00', '2015-09-22 08:59:42', 0),
(3, 4, 4, 101, NULL, '2015-09-22', 0, '100.00', NULL, '100.00', NULL, 0, 'Qwick Fusion', NULL, 'Cash asset decrease from inventory update', 'Qwic56018196cedc3', '2015-09-22 00:00:00', '2015-09-22 16:28:06', 0),
(4, 4, 4, 77, NULL, '2015-09-22', 1, '100.00', '100.00', NULL, NULL, 0, 'Qwick Fusion', NULL, 'Inventory asset increase from inventory update', 'Qwic56018196cedb1', '2015-09-22 00:00:00', '2015-09-22 16:28:06', 0),
(5, 4, NULL, 75, NULL, '2015-09-22', NULL, '0.00', '0.00', '0.00', NULL, 0, 'support', 'Headquarters', 'Account Receivable from sale point', NULL, NULL, '2015-09-22 16:46:18', 0),
(6, 4, 4, 101, NULL, '2015-10-08', 0, '10000.00', NULL, '10000.00', NULL, 0, 'Qwick Fusion', NULL, 'Cash asset decrease from inventory update', 'Qwic5616b210266c6', '2015-10-08 00:00:00', '2015-10-08 20:12:32', 0),
(7, 4, 4, 77, NULL, '2015-10-08', 1, '10000.00', '10000.00', NULL, NULL, 0, 'Qwick Fusion', NULL, 'Inventory asset increase from inventory update', 'Qwic5616b210266c6', '2015-10-08 00:00:00', '2015-10-08 20:12:32', 0),
(8, 4, NULL, 75, NULL, '2015-11-03', 1, '130.00', '130.00', NULL, NULL, 0, 'Qwick Fusion', 'ZONE B-2', 'Account Receivable from credit purchase', 'Qwic56386a493c5e1', '2015-11-03 09:03:21', '2015-11-03 09:03:21', 0),
(9, 2, 4, 103, NULL, '2015-11-03', 1, '120.00', '120.00', NULL, NULL, 0, 'Qwick Fusion', 'ZONE B-2', 'Expense increase from credit sale', 'Qwic56386a493c5e1', '2015-11-03 09:03:21', '2015-11-03 09:03:21', 0),
(10, 4, 4, 77, NULL, '2015-11-03', 0, '120.00', NULL, '120.00', NULL, 0, 'Qwick Fusion', 'ZONE B-2', 'Inventory asset decrease from credit sale', 'Qwic56386a493c5e1', '2015-11-03 09:03:21', '2015-11-03 09:03:21', 0),
(11, 4, NULL, 75, NULL, '2015-11-16', NULL, '0.00', '0.00', '0.00', NULL, 0, 'yawagyemang', 'Headquarters', 'Account Receivable from sale point', NULL, NULL, '2015-11-16 19:22:27', 0),
(12, 4, 4, 101, NULL, '2015-11-27', 0, '0.00', NULL, '0.00', NULL, 0, 'Qwick Fusion', NULL, 'Cash asset decrease from inventory update', 'Qwic565830fddec9f', '2015-11-27 00:00:00', '2015-11-27 11:31:26', 0),
(13, 4, 4, 77, NULL, '2015-11-27', 1, '0.00', '0.00', NULL, NULL, 0, 'Qwick Fusion', NULL, 'Inventory asset increase from inventory update', 'Qwic565830fddec78', '2015-11-27 00:00:00', '2015-11-27 11:31:26', 0),
(14, 4, 4, 101, NULL, '2015-11-27', 0, '0.00', NULL, '0.00', NULL, 0, 'Qwick Fusion', NULL, 'Cash asset decrease from inventory update', 'Qwic565831c4612cf', '2015-11-27 00:00:00', '2015-11-27 11:34:44', 0),
(15, 4, 4, 77, NULL, '2015-11-27', 1, '0.00', '0.00', NULL, NULL, 0, 'Qwick Fusion', NULL, 'Inventory asset increase from inventory update', 'Qwic565831c4612ab', '2015-11-27 00:00:00', '2015-11-27 11:34:44', 0),
(16, 4, 4, 101, NULL, '2015-11-27', 0, '0.00', NULL, '0.00', NULL, 0, 'Qwick Fusion', NULL, 'Cash asset decrease from inventory update', 'Qwic565831fd50e38', '2015-11-27 00:00:00', '2015-11-27 11:35:41', 0),
(17, 4, 4, 77, NULL, '2015-11-27', 1, '0.00', '0.00', NULL, NULL, 0, 'Qwick Fusion', NULL, 'Inventory asset increase from inventory update', 'Qwic565831fd50e16', '2015-11-27 00:00:00', '2015-11-27 11:35:41', 0),
(18, 4, 4, 101, NULL, '2015-11-27', 0, '0.00', NULL, '0.00', NULL, 0, 'Qwick Fusion', NULL, 'Cash asset decrease from inventory update', 'Qwic565833ddd9f2c', '2015-11-27 00:00:00', '2015-11-27 11:43:41', 0),
(19, 4, 4, 77, NULL, '2015-11-27', 1, '0.00', '0.00', NULL, NULL, 0, 'Qwick Fusion', NULL, 'Inventory asset increase from inventory update', 'Qwic565833ddd9f09', '2015-11-27 00:00:00', '2015-11-27 11:43:41', 0),
(20, 4, 4, 101, NULL, '2015-11-27', 0, '0.00', NULL, '0.00', NULL, 0, 'Qwick Fusion', NULL, 'Cash asset decrease from inventory update', 'Qwic5658cbfa3c483', '2015-11-27 00:00:00', '2015-11-27 22:32:42', 0),
(21, 4, 4, 77, NULL, '2015-11-27', 1, '0.00', '0.00', NULL, NULL, 0, 'Qwick Fusion', NULL, 'Inventory asset increase from inventory update', 'Qwic5658cbfa3c461', '2015-11-27 00:00:00', '2015-11-27 22:32:42', 0),
(22, 4, 4, 101, NULL, '2015-11-27', 0, '0.00', NULL, '0.00', NULL, 0, 'Qwick Fusion', NULL, 'Cash asset decrease from inventory update', 'Qwic5658cd549e40f', '2015-11-27 00:00:00', '2015-11-27 22:38:28', 0),
(23, 4, 4, 77, NULL, '2015-11-27', 1, '0.00', '0.00', NULL, NULL, 0, 'Qwick Fusion', NULL, 'Inventory asset increase from inventory update', 'Qwic5658cd549e3ee', '2015-11-27 00:00:00', '2015-11-27 22:38:28', 0),
(24, 4, NULL, 75, NULL, '2015-12-30', NULL, '25.00', '0.00', '0.00', NULL, 0, 'support', 'Headquarters', 'Account Receivable from sale point', NULL, NULL, '2015-12-30 09:31:47', 0),
(25, 1, 4, 61, NULL, '2016-01-01', 1, '2445.95', NULL, '2445.95', NULL, 0, 'System', NULL, 'Revenue from sale point', 'Syst5685f186969ab', '2016-01-01 04:24:54', '2016-01-01 04:24:54', 0),
(26, 2, 4, 103, NULL, '2016-01-01', 1, '1100.00', '1100.00', NULL, NULL, 0, 'System', NULL, 'Direct cost/sale expense from sale', 'Syst5685f186969ab', '2016-01-01 04:24:54', '2016-01-01 04:24:54', 0),
(27, 4, 4, 101, NULL, '2016-01-01', 1, '2445.95', '2445.95', NULL, NULL, 0, 'System', NULL, 'Cash asset increase from sale', 'Syst5685f186969ab', '2016-01-01 04:24:54', '2016-01-01 04:24:54', 0),
(28, 4, 4, 77, NULL, '2016-01-01', 0, '1100.00', NULL, '1100.00', NULL, 0, 'System', NULL, 'Inventory asset decrease from sale', 'Syst5685f186969ab', '2016-01-01 04:24:54', '2016-01-01 04:24:54', 0),
(29, 1, 4, 61, NULL, '2016-01-01', 1, '35.00', NULL, '35.00', NULL, 0, 'System', NULL, 'Revenue from sale point', 'Syst5685f26c45099', '2016-01-01 04:28:44', '2016-01-01 04:28:44', 0),
(30, 2, 4, 103, NULL, '2016-01-01', 1, '0.00', '0.00', NULL, NULL, 0, 'System', NULL, 'Direct cost/sale expense from sale', 'Syst5685f26c45099', '2016-01-01 04:28:44', '2016-01-01 04:28:44', 0),
(31, 4, 4, 101, NULL, '2016-01-01', 1, '35.00', '35.00', NULL, NULL, 0, 'System', NULL, 'Cash asset increase from sale', 'Syst5685f26c45099', '2016-01-01 04:28:44', '2016-01-01 04:28:44', 0),
(32, 4, 4, 77, NULL, '2016-01-01', 0, '0.00', NULL, '0.00', NULL, 0, 'System', NULL, 'Inventory asset decrease from sale', 'Syst5685f26c45099', '2016-01-01 04:28:44', '2016-01-01 04:28:44', 0),
(38, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, 0, NULL, NULL, '', NULL, NULL, '2016-03-12 21:13:26', 1),
(39, 4, 4, 101, NULL, '2016-03-31', 0, '3000.00', NULL, '3000.00', NULL, 0, 'Qwick Fusion', NULL, 'Cash asset decrease from inventory update', 'Qwic56fcaaefef017', '2016-03-31 00:00:00', '2016-03-31 06:43:28', 0),
(40, 4, 4, 77, NULL, '2016-03-31', 1, '3000.00', '3000.00', NULL, NULL, 0, 'Qwick Fusion', NULL, 'Inventory asset increase from inventory update', 'Qwic56fcaaefef00e', '2016-03-31 00:00:00', '2016-03-31 06:43:28', 0),
(41, 4, 4, 101, NULL, '2016-03-31', 0, '200.00', NULL, '200.00', NULL, 0, 'Qwick Fusion', NULL, 'Cash asset decrease from inventory update', 'Qwic56fd328b8a65a', '2016-03-31 00:00:00', '2016-03-31 16:22:03', 0),
(42, 4, 4, 77, NULL, '2016-03-31', 1, '200.00', '200.00', NULL, NULL, 0, 'Qwick Fusion', NULL, 'Inventory asset increase from inventory update', 'Qwic56fd328b8a648', '2016-03-31 00:00:00', '2016-03-31 16:22:03', 0);

-- --------------------------------------------------------

--
-- Table structure for table `userdepartments`
--

CREATE TABLE IF NOT EXISTS `userdepartments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `userdepartments`
--

INSERT INTO `userdepartments` (`id`, `department`) VALUES
(5, 'OPERATIONS DEPARTMENT'),
(6, 'MARKETING DEPARTMENT'),
(7, 'DELIVERY DEPARTMENT'),
(8, 'ADMINISTRATION'),
(9, 'Support'),
(10, 'WAREHOUSE DEPARTMENT');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userdepartment_id` int(11) DEFAULT NULL,
  `zone_id` int(2) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) NOT NULL,
  `usertype_id` int(11) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=99 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `userdepartment_id`, `zone_id`, `username`, `password`, `firstname`, `lastname`, `usertype_id`, `email`, `date`) VALUES
(39, 9, 1, 'support', 'ccbd43e44efec3dd62688e50cf8f0485', 'Qwick', 'Fusion', 1, '', '2013-03-12 00:45:42'),
(88, 8, 1, 'yawagyemang', 'd41d8cd98f00b204e9800998ecf8427e', 'BENEDICT', 'AGYEMANG', 1, 'bagyemang@hotmail.com', '2015-06-29 14:35:08'),
(97, 8, 1, 'annie', '67f55304a74162f81fc9bde55e60a710', 'Annie', 'Baba', 1, 'annie.baba@customermattersltd.com', '2015-11-16 18:11:18'),
(98, 6, 8, 'test_sales', '81dc9bdb52d04dc20036dbd8313ed055', 'test_sales', 'test_sales', 4, '', '2015-11-16 18:29:41');

-- --------------------------------------------------------

--
-- Table structure for table `usertypes`
--

CREATE TABLE IF NOT EXISTS `usertypes` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `usertype` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usertype` (`usertype`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `usertypes`
--

INSERT INTO `usertypes` (`id`, `usertype`) VALUES
(9, 'Accountant'),
(7, 'Administrator'),
(11, 'Attendants'),
(6, 'Field Cashiers'),
(8, 'Managers'),
(5, 'Product Manager'),
(4, 'Sales Persons'),
(3, 'Showroom Executive'),
(1, 'Super Administrator'),
(10, 'Warehouse Manager');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_items`
--

CREATE TABLE IF NOT EXISTS `warehouse_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `supply_invoiceno` varchar(70) DEFAULT NULL,
  `original_quantity` int(11) DEFAULT '0',
  `remaining_quantity` int(11) DEFAULT '0',
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=684 ;

--
-- Dumping data for table `warehouse_items`
--

INSERT INTO `warehouse_items` (`id`, `supplier_id`, `item_id`, `warehouse_id`, `supply_invoiceno`, `original_quantity`, `remaining_quantity`, `modified_by`, `created`, `modified`) VALUES
(18, NULL, NULL, NULL, NULL, 0, 1, NULL, '2015-12-02 15:42:26', '2015-12-02 15:42:26'),
(344, 4, 343, 11, '', 1, 1, 39, '2015-11-27 22:32:23', '2015-11-27 22:32:23'),
(345, 4, 344, 11, '', 1, 1, 39, '2015-11-27 22:32:23', '2015-11-27 22:32:23'),
(346, 4, 345, 11, '', 1, 1, 39, '2015-11-27 22:32:23', '2015-11-27 22:32:23'),
(347, 4, 346, 11, '', 1, 1, 39, '2015-11-27 22:32:24', '2015-11-27 22:32:24'),
(348, 4, 347, 11, '', 1, 1, 39, '2015-11-27 22:32:24', '2015-11-27 22:32:24'),
(349, 4, 348, 11, '', 1, 1, 39, '2015-11-27 22:32:24', '2015-11-27 22:32:24'),
(350, 4, 349, 11, '', 1, 1, 39, '2015-11-27 22:32:24', '2015-11-27 22:32:24'),
(351, 4, 350, 11, '', 1, 1, 39, '2015-11-27 22:32:24', '2015-11-27 22:32:24'),
(352, 4, 351, 11, '', 1, 1, 39, '2015-11-27 22:32:24', '2015-11-27 22:32:24'),
(353, 4, 352, 11, '', 1, 1, 39, '2015-11-27 22:32:24', '2015-11-27 22:32:24'),
(354, 4, 353, 11, '', 1, 1, 39, '2015-11-27 22:32:24', '2015-11-27 22:32:24'),
(355, 4, 354, 11, '', 1, 1, 39, '2015-11-27 22:32:24', '2015-11-27 22:32:24'),
(356, 4, 355, 11, '', 1, 1, 39, '2015-11-27 22:32:25', '2015-11-27 22:32:25'),
(357, 4, 356, 11, '', 1, 1, 39, '2015-11-27 22:32:25', '2015-11-27 22:32:25'),
(358, 4, 357, 11, '', 1, 1, 39, '2015-11-27 22:32:25', '2015-11-27 22:32:25'),
(359, 4, 358, 11, '', 1, 1, 39, '2015-11-27 22:32:25', '2015-11-27 22:32:25'),
(360, 4, 359, 11, '', 1, 1, 39, '2015-11-27 22:32:25', '2015-11-27 22:32:25'),
(361, 4, 360, 11, '', 1, 1, 39, '2015-11-27 22:32:25', '2015-11-27 22:32:25'),
(362, 4, 361, 11, '', 1, 1, 39, '2015-11-27 22:32:25', '2015-11-27 22:32:25'),
(363, 4, 362, 11, '', 1, 1, 39, '2015-11-27 22:32:25', '2015-11-27 22:32:25'),
(364, 4, 363, 11, '', 1, 1, 39, '2015-11-27 22:32:25', '2015-11-27 22:32:25'),
(365, 4, 364, 11, '', 1, 1, 39, '2015-11-27 22:32:25', '2015-11-27 22:32:25'),
(366, 4, 365, 11, '', 1, 1, 39, '2015-11-27 22:32:26', '2015-11-27 22:32:26'),
(367, 4, 366, 11, '', 1, 1, 39, '2015-11-27 22:32:26', '2015-11-27 22:32:26'),
(368, 4, 367, 11, '', 1, 1, 39, '2015-11-27 22:32:26', '2015-11-27 22:32:26'),
(369, 4, 368, 11, '', 1, 1, 39, '2015-11-27 22:32:26', '2015-11-27 22:32:26'),
(370, 4, 369, 11, '', 1, 1, 39, '2015-11-27 22:32:26', '2015-11-27 22:32:26'),
(371, 4, 370, 11, '', 1, 1, 39, '2015-11-27 22:32:26', '2015-11-27 22:32:26'),
(372, 4, 371, 11, '', 1, 1, 39, '2015-11-27 22:32:26', '2015-11-27 22:32:26'),
(373, 4, 372, 11, '', 1, 1, 39, '2015-11-27 22:32:26', '2015-11-27 22:32:26'),
(374, 4, 373, 11, '', 1, 1, 39, '2015-11-27 22:32:26', '2015-11-27 22:32:26'),
(375, 4, 374, 11, '', 1, 1, 39, '2015-11-27 22:32:27', '2015-11-27 22:32:27'),
(376, 4, 375, 11, '', 1, 1, 39, '2015-11-27 22:32:27', '2015-11-27 22:32:27'),
(377, 4, 376, 11, '', 1, 1, 39, '2015-11-27 22:32:27', '2015-11-27 22:32:27'),
(378, 4, 377, 11, '', 1, 1, 39, '2015-11-27 22:32:27', '2015-11-27 22:32:27'),
(379, 4, 378, 11, '', 1, 1, 39, '2015-11-27 22:32:27', '2015-11-27 22:32:27'),
(380, 4, 379, 11, '', 1, 1, 39, '2015-11-27 22:32:27', '2015-11-27 22:32:27'),
(381, 4, 380, 11, '', 1, 1, 39, '2015-11-27 22:32:27', '2015-11-27 22:32:27'),
(382, 4, 381, 11, '', 1, 1, 39, '2015-11-27 22:32:27', '2015-11-27 22:32:27'),
(383, 4, 382, 11, '', 1, 1, 39, '2015-11-27 22:32:27', '2015-11-27 22:32:27'),
(384, 4, 383, 11, '', 1, 1, 39, '2015-11-27 22:32:28', '2015-11-27 22:32:28'),
(385, 4, 384, 11, '', 1, 1, 39, '2015-11-27 22:32:28', '2015-11-27 22:32:28'),
(386, 4, 385, 11, '', 1, 1, 39, '2015-11-27 22:32:28', '2015-11-27 22:32:28'),
(387, 4, 386, 11, '', 1, 1, 39, '2015-11-27 22:32:28', '2015-11-27 22:32:28'),
(388, 4, 387, 11, '', 1, 1, 39, '2015-11-27 22:32:28', '2015-11-27 22:32:28'),
(389, 4, 388, 11, '', 1, 1, 39, '2015-11-27 22:32:28', '2015-11-27 22:32:28'),
(390, 4, 389, 11, '', 1, 1, 39, '2015-11-27 22:32:28', '2015-11-27 22:32:28'),
(391, 4, 390, 11, '', 1, 1, 39, '2015-11-27 22:32:28', '2015-11-27 22:32:28'),
(392, 4, 391, 11, '', 1, 1, 39, '2015-11-27 22:32:28', '2015-11-27 22:32:28'),
(393, 4, 392, 11, '', 1, 1, 39, '2015-11-27 22:32:28', '2015-11-27 22:32:28'),
(394, 4, 393, 11, '', 1, 1, 39, '2015-11-27 22:32:29', '2015-11-27 22:32:29'),
(395, 4, 394, 11, '', 1, 1, 39, '2015-11-27 22:32:29', '2015-11-27 22:32:29'),
(396, 4, 395, 11, '', 1, 1, 39, '2015-11-27 22:32:29', '2015-11-27 22:32:29'),
(397, 4, 396, 11, '', 1, 1, 39, '2015-11-27 22:32:29', '2015-11-27 22:32:29'),
(398, 4, 397, 11, '', 1, 1, 39, '2015-11-27 22:32:29', '2015-11-27 22:32:29'),
(399, 4, 398, 11, '', 1, 1, 39, '2015-11-27 22:32:29', '2015-11-27 22:32:29'),
(400, 4, 399, 11, '', 1, 1, 39, '2015-11-27 22:32:29', '2015-11-27 22:32:29'),
(401, 4, 400, 11, '', 1, 1, 39, '2015-11-27 22:32:29', '2015-11-27 22:32:29'),
(402, 4, 401, 11, '', 1, 1, 39, '2015-11-27 22:32:29', '2015-11-27 22:32:29'),
(403, 4, 402, 11, '', 1, 1, 39, '2015-11-27 22:32:30', '2015-11-27 22:32:30'),
(404, 4, 403, 11, '', 1, 1, 39, '2015-11-27 22:32:30', '2015-11-27 22:32:30'),
(405, 4, 404, 11, '', 1, 1, 39, '2015-11-27 22:32:30', '2015-11-27 22:32:30'),
(406, 4, 405, 11, '', 1, 1, 39, '2015-11-27 22:32:30', '2015-11-27 22:32:30'),
(407, 4, 406, 11, '', 1, 1, 39, '2015-11-27 22:32:30', '2015-11-27 22:32:30'),
(408, 4, 407, 11, '', 1, 1, 39, '2015-11-27 22:32:30', '2015-11-27 22:32:30'),
(409, 4, 408, 11, '', 1, 1, 39, '2015-11-27 22:32:30', '2015-11-27 22:32:30'),
(410, 4, 409, 11, '', 1, 1, 39, '2015-11-27 22:32:30', '2015-11-27 22:32:30'),
(411, 4, 410, 11, '', 1, 1, 39, '2015-11-27 22:32:30', '2015-11-27 22:32:30'),
(412, 4, 411, 11, '', 1, 1, 39, '2015-11-27 22:32:31', '2015-11-27 22:32:31'),
(413, 4, 412, 11, '', 1, 1, 39, '2015-11-27 22:32:31', '2015-11-27 22:32:31'),
(414, 4, 413, 11, '', 1, 1, 39, '2015-11-27 22:32:31', '2015-11-27 22:32:31'),
(415, 4, 414, 11, '', 1, 1, 39, '2015-11-27 22:32:31', '2015-11-27 22:32:31'),
(416, 4, 415, 11, '', 1, 1, 39, '2015-11-27 22:32:31', '2015-11-27 22:32:31'),
(417, 4, 416, 11, '', 1, 1, 39, '2015-11-27 22:32:31', '2015-11-27 22:32:31'),
(418, 4, 417, 11, '', 1, 1, 39, '2015-11-27 22:32:31', '2015-11-27 22:32:31'),
(419, 4, 418, 11, '', 1, 1, 39, '2015-11-27 22:32:31', '2015-11-27 22:32:31'),
(420, 4, 419, 11, '', 1, 1, 39, '2015-11-27 22:32:31', '2015-11-27 22:32:31'),
(421, 4, 420, 11, '', 1, 1, 39, '2015-11-27 22:32:32', '2015-11-27 22:32:32'),
(422, 4, 421, 11, '', 1, 1, 39, '2015-11-27 22:32:32', '2015-11-27 22:32:32'),
(423, 4, 422, 11, '', 1, 1, 39, '2015-11-27 22:32:32', '2015-11-27 22:32:32'),
(424, 4, 423, 11, '', 1, 1, 39, '2015-11-27 22:32:32', '2015-11-27 22:32:32'),
(425, 4, 424, 11, '', 1, 1, 39, '2015-11-27 22:32:32', '2015-11-27 22:32:32'),
(426, 4, 425, 11, '', 1, 1, 39, '2015-11-27 22:32:32', '2015-11-27 22:32:32'),
(427, 4, 426, 11, '', 1, 1, 39, '2015-11-27 22:32:32', '2015-11-27 22:32:32'),
(428, 4, 427, 11, '', 1, 1, 39, '2015-11-27 22:32:32', '2015-11-27 22:32:32'),
(429, 4, 428, 11, '', 1, 1, 39, '2015-11-27 22:32:32', '2015-11-27 22:32:32'),
(430, 4, 429, 11, '', 1, 1, 39, '2015-11-27 22:32:33', '2015-11-27 22:32:33'),
(431, 4, 430, 11, '', 1, 1, 39, '2015-11-27 22:32:33', '2015-11-27 22:32:33'),
(432, 4, 431, 11, '', 1, 1, 39, '2015-11-27 22:32:33', '2015-11-27 22:32:33'),
(433, 4, 432, 11, '', 1, 1, 39, '2015-11-27 22:32:33', '2015-11-27 22:32:33'),
(434, 4, 433, 11, '', 1, 1, 39, '2015-11-27 22:32:33', '2015-11-27 22:32:33'),
(435, 4, 434, 11, '', 1, 1, 39, '2015-11-27 22:32:33', '2015-11-27 22:32:33'),
(436, 4, 435, 11, '', 1, 1, 39, '2015-11-27 22:32:33', '2015-11-27 22:32:33'),
(437, 4, 436, 11, '', 1, 1, 39, '2015-11-27 22:32:33', '2015-11-27 22:32:33'),
(438, 4, 437, 6, '', 1, 1, 39, '2015-11-27 22:32:33', '2016-03-31 04:36:20'),
(439, 4, 438, 10, '', 1, 1, 39, '2015-11-27 22:32:33', '2016-03-31 05:31:42'),
(440, 4, 439, NULL, '', 1, 1, 39, '2015-11-27 22:32:34', '2016-03-31 04:35:34'),
(441, 4, 440, 6, '', 1, 1, 39, '2015-11-27 22:32:34', '2016-03-31 04:26:36'),
(442, 4, 441, 11, '', 1, 1, 39, '2015-11-27 22:32:34', '2015-11-27 22:32:34'),
(443, 4, 442, 11, '', 1, 1, 39, '2015-11-27 22:32:34', '2015-11-27 22:32:34'),
(444, 4, 443, 11, '', 1, 1, 39, '2015-11-27 22:32:34', '2015-11-27 22:32:34'),
(445, 4, 444, 11, '', 1, 1, 39, '2015-11-27 22:32:34', '2015-11-27 22:32:34'),
(446, 4, 445, 11, '', 1, 1, 39, '2015-11-27 22:32:34', '2015-11-27 22:32:34'),
(447, 4, 446, 11, '', 1, 1, 39, '2015-11-27 22:32:34', '2015-11-27 22:32:34'),
(448, 4, 447, 11, '', 1, 1, 39, '2015-11-27 22:32:34', '2015-11-27 22:32:34'),
(449, 4, 448, 11, '', 1, 1, 39, '2015-11-27 22:32:35', '2015-11-27 22:32:35'),
(450, 4, 449, 11, '', 1, 1, 39, '2015-11-27 22:32:35', '2015-11-27 22:32:35'),
(451, 4, 450, 11, '', 1, 1, 39, '2015-11-27 22:32:35', '2015-11-27 22:32:35'),
(452, 4, 451, 11, '', 1, 1, 39, '2015-11-27 22:32:35', '2015-11-27 22:32:35'),
(453, 4, 452, 11, '', 1, 1, 39, '2015-11-27 22:32:35', '2015-11-27 22:32:35'),
(454, 4, 453, 11, '', 1, 1, 39, '2015-11-27 22:32:35', '2015-11-27 22:32:35'),
(455, 4, 454, 11, '', 1, 1, 39, '2015-11-27 22:32:35', '2015-11-27 22:32:35'),
(456, 4, 455, 11, '', 1, 1, 39, '2015-11-27 22:32:35', '2015-11-27 22:32:35'),
(457, 4, 456, 11, '', 1, 1, 39, '2015-11-27 22:32:35', '2015-11-27 22:32:35'),
(458, 4, 457, 11, '', 1, 1, 39, '2015-11-27 22:32:36', '2015-11-27 22:32:36'),
(459, 4, 458, 11, '', 1, 1, 39, '2015-11-27 22:32:36', '2015-11-27 22:32:36'),
(460, 4, 459, 11, '', 1, 1, 39, '2015-11-27 22:32:36', '2015-11-27 22:32:36'),
(461, 4, 460, 11, '', 1, 1, 39, '2015-11-27 22:32:36', '2015-11-27 22:32:36'),
(462, 4, 461, 11, '', 1, 1, 39, '2015-11-27 22:32:36', '2015-11-27 22:32:36'),
(463, 4, 462, 11, '', 1, 1, 39, '2015-11-27 22:32:36', '2015-11-27 22:32:36'),
(464, 4, 463, 11, '', 1, 1, 39, '2015-11-27 22:32:36', '2015-11-27 22:32:36'),
(465, 4, 464, 11, '', 1, 1, 39, '2015-11-27 22:32:36', '2015-11-27 22:32:36'),
(466, 4, 465, 11, '', 1, 1, 39, '2015-11-27 22:32:36', '2015-11-27 22:32:36'),
(467, 4, 466, 11, '', 1, 1, 39, '2015-11-27 22:32:37', '2015-11-27 22:32:37'),
(468, 4, 467, 11, '', 1, 1, 39, '2015-11-27 22:32:37', '2015-11-27 22:32:37'),
(469, 4, 468, 11, '', 1, 1, 39, '2015-11-27 22:32:37', '2015-11-27 22:32:37'),
(470, 4, 469, 11, '', 1, 1, 39, '2015-11-27 22:32:37', '2015-11-27 22:32:37'),
(471, 4, 470, 11, '', 1, 1, 39, '2015-11-27 22:32:37', '2015-11-27 22:32:37'),
(472, 4, 471, 11, '', 1, 1, 39, '2015-11-27 22:32:37', '2015-11-27 22:32:37'),
(473, 4, 472, 11, '', 1, 1, 39, '2015-11-27 22:32:37', '2015-11-27 22:32:37'),
(474, 4, 473, 11, '', 1, 1, 39, '2015-11-27 22:32:37', '2015-11-27 22:32:37'),
(475, 4, 474, 11, '', 1, 1, 39, '2015-11-27 22:32:37', '2015-11-27 22:32:37'),
(476, 4, 475, 11, '', 1, 1, 39, '2015-11-27 22:32:38', '2015-11-27 22:32:38'),
(477, 4, 476, 11, '', 1, 1, 39, '2015-11-27 22:32:38', '2015-11-27 22:32:38'),
(478, 4, 477, 11, '', 1, 1, 39, '2015-11-27 22:32:38', '2015-11-27 22:32:38'),
(479, 4, 478, 11, '', 1, 1, 39, '2015-11-27 22:32:38', '2015-11-27 22:32:38'),
(480, 4, 479, 11, '', 1, 1, 39, '2015-11-27 22:32:38', '2015-11-27 22:32:38'),
(481, 4, 480, 11, '', 1, 1, 39, '2015-11-27 22:32:38', '2015-11-27 22:32:38'),
(482, 4, 481, 11, '', 1, 1, 39, '2015-11-27 22:32:38', '2015-11-27 22:32:38'),
(483, 4, 482, 11, '', 1, 1, 39, '2015-11-27 22:32:38', '2015-11-27 22:32:38'),
(484, 4, 483, 11, '', 1, 1, 39, '2015-11-27 22:32:38', '2015-11-27 22:32:38'),
(485, 4, 484, 11, '', 1, 1, 39, '2015-11-27 22:32:39', '2015-11-27 22:32:39'),
(486, 4, 485, 11, '', 1, 1, 39, '2015-11-27 22:32:39', '2015-11-27 22:32:39'),
(487, 4, 486, 11, '', 1, 1, 39, '2015-11-27 22:32:39', '2015-11-27 22:32:39'),
(488, 4, 487, 11, '', 1, 1, 39, '2015-11-27 22:32:39', '2015-11-27 22:32:39'),
(489, 4, 488, 11, '', 1, 1, 39, '2015-11-27 22:32:39', '2015-11-27 22:32:39'),
(490, 4, 489, 11, '', 1, 1, 39, '2015-11-27 22:32:39', '2015-11-27 22:32:39'),
(491, 4, 490, 11, '', 1, 1, 39, '2015-11-27 22:32:39', '2015-11-27 22:32:39'),
(492, 4, 491, 11, '', 1, 1, 39, '2015-11-27 22:32:39', '2015-11-27 22:32:39'),
(493, 4, 492, 11, '', 1, 1, 39, '2015-11-27 22:32:39', '2015-11-27 22:32:39'),
(494, 4, 493, 11, '', 1, 1, 39, '2015-11-27 22:32:40', '2015-11-27 22:32:40'),
(495, 4, 494, 11, '', 1, 1, 39, '2015-11-27 22:32:40', '2015-11-27 22:32:40'),
(496, 4, 495, 11, '', 1, 1, 39, '2015-11-27 22:32:40', '2015-11-27 22:32:40'),
(497, 4, 496, 11, '', 1, 1, 39, '2015-11-27 22:32:40', '2015-11-27 22:32:40'),
(498, 4, 497, 11, '', 1, 1, 39, '2015-11-27 22:32:40', '2015-11-27 22:32:40'),
(499, 4, 498, 11, '', 1, 1, 39, '2015-11-27 22:32:40', '2015-11-27 22:32:40'),
(500, 4, 499, 11, '', 1, 1, 39, '2015-11-27 22:32:40', '2015-11-27 22:32:40'),
(501, 4, 500, 11, '', 1, 1, 39, '2015-11-27 22:32:40', '2015-11-27 22:32:40'),
(502, 4, 501, 11, '', 1, 1, 39, '2015-11-27 22:32:40', '2015-11-27 22:32:40'),
(503, 4, 502, 11, '', 1, 1, 39, '2015-11-27 22:32:41', '2015-11-27 22:32:41'),
(504, 4, 503, 11, '', 1, 1, 39, '2015-11-27 22:32:41', '2015-11-27 22:32:41'),
(505, 4, 504, 11, '', 1, 1, 39, '2015-11-27 22:32:41', '2015-11-27 22:32:41'),
(506, 4, 505, 11, '', 1, 1, 39, '2015-11-27 22:32:41', '2015-11-27 22:32:41'),
(507, 4, 506, 11, '', 1, 1, 39, '2015-11-27 22:32:41', '2015-11-27 22:32:41'),
(508, 4, 507, 11, '', 1, 1, 39, '2015-11-27 22:32:41', '2015-11-27 22:32:41'),
(509, 4, 508, 11, '', 1, 1, 39, '2015-11-27 22:32:41', '2015-11-27 22:32:41'),
(510, 4, 509, 11, '', 1, 1, 39, '2015-11-27 22:32:41', '2015-11-27 22:32:41'),
(511, 4, 510, 11, '', 1, 1, 39, '2015-11-27 22:32:42', '2015-11-27 22:32:42'),
(512, 4, 511, 11, '', 1, 1, 39, '2015-11-27 22:32:42', '2015-11-27 22:32:42'),
(513, 4, 343, 10, '', 1, 1, 39, '2015-11-27 22:38:14', '2015-11-27 22:38:14'),
(514, 4, 344, 10, '', 1, 1, 39, '2015-11-27 22:38:14', '2015-11-27 22:38:14'),
(515, 4, 345, 10, '', 1, 1, 39, '2015-11-27 22:38:14', '2015-11-27 22:38:14'),
(516, 4, 346, 10, '', 1, 1, 39, '2015-11-27 22:38:14', '2015-11-27 22:38:14'),
(517, 4, 347, 10, '', 1, 1, 39, '2015-11-27 22:38:14', '2015-11-27 22:38:14'),
(518, 4, 348, 10, '', 1, 1, 39, '2015-11-27 22:38:14', '2015-11-27 22:38:14'),
(519, 4, 349, 10, '', 1, 1, 39, '2015-11-27 22:38:14', '2015-11-27 22:38:14'),
(520, 4, 350, 10, '', 1, 1, 39, '2015-11-27 22:38:15', '2015-11-27 22:38:15'),
(521, 4, 351, 10, '', 1, 1, 39, '2015-11-27 22:38:15', '2015-11-27 22:38:15'),
(522, 4, 352, 10, '', 1, 1, 39, '2015-11-27 22:38:15', '2015-11-27 22:38:15'),
(523, 4, 353, 10, '', 1, 1, 39, '2015-11-27 22:38:15', '2015-11-27 22:38:15'),
(524, 4, 354, 10, '', 1, 1, 39, '2015-11-27 22:38:15', '2015-11-27 22:38:15'),
(525, 4, 355, 10, '', 1, 1, 39, '2015-11-27 22:38:15', '2015-11-27 22:38:15'),
(526, 4, 356, 10, '', 1, 1, 39, '2015-11-27 22:38:15', '2015-11-27 22:38:15'),
(527, 4, 357, 10, '', 1, 1, 39, '2015-11-27 22:38:15', '2015-11-27 22:38:15'),
(528, 4, 358, 10, '', 1, 0, 39, '2015-11-27 22:38:16', '2015-11-29 15:20:02'),
(529, 4, 359, 10, '', 1, 1, 39, '2015-11-27 22:38:16', '2015-11-27 22:38:16'),
(530, 4, 360, 10, '', 1, 1, 39, '2015-11-27 22:38:16', '2015-11-27 22:38:16'),
(531, 4, 361, 10, '', 1, 1, 39, '2015-11-27 22:38:16', '2015-11-27 22:38:16'),
(532, 4, 362, 10, '', 1, 1, 39, '2015-11-27 22:38:16', '2015-11-27 22:38:16'),
(533, 4, 363, 10, '', 1, 1, 39, '2015-11-27 22:38:16', '2015-11-27 22:38:16'),
(534, 4, 364, 10, '', 1, 1, 39, '2015-11-27 22:38:16', '2015-11-27 22:38:16'),
(535, 4, 365, 10, '', 1, 1, 39, '2015-11-27 22:38:16', '2015-11-27 22:38:16'),
(536, 4, 366, 10, '', 1, 1, 39, '2015-11-27 22:38:17', '2015-11-27 22:38:17'),
(537, 4, 367, 10, '', 1, 1, 39, '2015-11-27 22:38:17', '2015-11-27 22:38:17'),
(538, 4, 368, 10, '', 1, 1, 39, '2015-11-27 22:38:17', '2015-11-27 22:38:17'),
(539, 4, 369, 10, '', 1, 1, 39, '2015-11-27 22:38:17', '2015-11-27 22:38:17'),
(540, 4, 370, 10, '', 1, 1, 39, '2015-11-27 22:38:17', '2015-11-27 22:38:17'),
(541, 4, 371, 10, '', 1, 1, 39, '2015-11-27 22:38:17', '2015-11-27 22:38:17'),
(542, 4, 372, 10, '', 1, 1, 39, '2015-11-27 22:38:17', '2015-11-27 22:38:17'),
(543, 4, 373, 10, '', 1, 1, 39, '2015-11-27 22:38:17', '2015-11-27 22:38:17'),
(544, 4, 374, 10, '', 1, 1, 39, '2015-11-27 22:38:17', '2015-11-27 22:38:17'),
(545, 4, 375, 10, '', 1, 1, 39, '2015-11-27 22:38:17', '2015-11-27 22:38:17'),
(546, 4, 376, 10, '', 1, 1, 39, '2015-11-27 22:38:17', '2015-11-27 22:38:17'),
(547, 4, 377, 10, '', 1, 1, 39, '2015-11-27 22:38:18', '2015-11-27 22:38:18'),
(548, 4, 378, 10, '', 1, 1, 39, '2015-11-27 22:38:18', '2015-11-27 22:38:18'),
(549, 4, 379, 10, '', 1, 1, 39, '2015-11-27 22:38:18', '2015-11-27 22:38:18'),
(550, 4, 380, 10, '', 1, 1, 39, '2015-11-27 22:38:18', '2015-11-27 22:38:18'),
(551, 4, 381, 10, '', 1, 1, 39, '2015-11-27 22:38:18', '2015-11-27 22:38:18'),
(552, 4, 382, 10, '', 1, 1, 39, '2015-11-27 22:38:18', '2015-11-27 22:38:18'),
(553, 4, 383, 10, '', 1, 1, 39, '2015-11-27 22:38:18', '2015-11-27 22:38:18'),
(554, 4, 384, 10, '', 1, 1, 39, '2015-11-27 22:38:18', '2015-11-27 22:38:18'),
(555, 4, 385, 10, '', 1, 1, 39, '2015-11-27 22:38:18', '2015-11-27 22:38:18'),
(556, 4, 386, 10, '', 1, 1, 39, '2015-11-27 22:38:18', '2015-11-27 22:38:18'),
(557, 4, 387, 10, '', 1, 1, 39, '2015-11-27 22:38:18', '2015-11-27 22:38:18'),
(558, 4, 388, 10, '', 1, 1, 39, '2015-11-27 22:38:18', '2015-11-27 22:38:18'),
(559, 4, 389, 10, '', 1, 1, 39, '2015-11-27 22:38:18', '2015-11-27 22:38:18'),
(560, 4, 390, 10, '', 1, 1, 39, '2015-11-27 22:38:19', '2015-11-27 22:38:19'),
(561, 4, 391, 10, '', 1, 1, 39, '2015-11-27 22:38:19', '2015-11-27 22:38:19'),
(562, 4, 392, 10, '', 1, 1, 39, '2015-11-27 22:38:19', '2015-11-27 22:38:19'),
(563, 4, 393, 10, '', 1, 1, 39, '2015-11-27 22:38:19', '2015-11-27 22:38:19'),
(564, 4, 394, 10, '', 1, 1, 39, '2015-11-27 22:38:19', '2015-11-27 22:38:19'),
(565, 4, 395, 10, '', 1, 1, 39, '2015-11-27 22:38:19', '2015-11-27 22:38:19'),
(566, 4, 396, 10, '', 1, 1, 39, '2015-11-27 22:38:19', '2015-11-27 22:38:19'),
(567, 4, 397, 10, '', 1, 1, 39, '2015-11-27 22:38:19', '2015-11-27 22:38:19'),
(568, 4, 398, 10, '', 1, 1, 39, '2015-11-27 22:38:19', '2015-11-27 22:38:19'),
(569, 4, 399, 10, '', 1, 1, 39, '2015-11-27 22:38:19', '2015-11-27 22:38:19'),
(570, 4, 400, 10, '', 1, 1, 39, '2015-11-27 22:38:19', '2015-11-27 22:38:19'),
(571, 4, 401, 10, '', 1, 1, 39, '2015-11-27 22:38:19', '2015-11-27 22:38:19'),
(572, 4, 402, 10, '', 1, 1, 39, '2015-11-27 22:38:19', '2015-11-27 22:38:19'),
(573, 4, 403, 10, '', 1, 1, 39, '2015-11-27 22:38:19', '2015-11-27 22:38:19'),
(574, 4, 404, 10, '', 1, 1, 39, '2015-11-27 22:38:20', '2015-11-27 22:38:20'),
(575, 4, 405, 10, '', 1, 1, 39, '2015-11-27 22:38:20', '2015-11-27 22:38:20'),
(576, 4, 406, 10, '', 1, 1, 39, '2015-11-27 22:38:20', '2015-11-27 22:38:20'),
(577, 4, 407, 10, '', 1, 1, 39, '2015-11-27 22:38:20', '2015-11-27 22:38:20'),
(578, 4, 408, 10, '', 1, 1, 39, '2015-11-27 22:38:20', '2015-11-27 22:38:20'),
(579, 4, 409, 10, '', 1, 1, 39, '2015-11-27 22:38:20', '2015-11-27 22:38:20'),
(580, 4, 410, 10, '', 1, 1, 39, '2015-11-27 22:38:20', '2015-11-27 22:38:20'),
(581, 4, 411, 10, '', 1, 1, 39, '2015-11-27 22:38:20', '2015-11-27 22:38:20'),
(582, 4, 412, 10, '', 1, 1, 39, '2015-11-27 22:38:20', '2015-11-27 22:38:20'),
(583, 4, 413, 10, '', 1, 1, 39, '2015-11-27 22:38:20', '2015-11-27 22:38:20'),
(584, 4, 414, 10, '', 1, 1, 39, '2015-11-27 22:38:20', '2015-11-27 22:38:20'),
(585, 4, 415, 10, '', 1, 1, 39, '2015-11-27 22:38:20', '2015-11-27 22:38:20'),
(586, 4, 416, 10, '', 1, 1, 39, '2015-11-27 22:38:20', '2015-11-27 22:38:20'),
(587, 4, 417, 10, '', 1, 1, 39, '2015-11-27 22:38:21', '2015-11-27 22:38:21'),
(588, 4, 418, 10, '', 1, 1, 39, '2015-11-27 22:38:21', '2015-11-27 22:38:21'),
(589, 4, 419, 10, '', 1, 1, 39, '2015-11-27 22:38:21', '2015-11-27 22:38:21'),
(590, 4, 420, 10, '', 1, 1, 39, '2015-11-27 22:38:21', '2015-11-27 22:38:21'),
(591, 4, 421, 10, '', 1, 1, 39, '2015-11-27 22:38:21', '2015-11-27 22:38:21'),
(592, 4, 422, 10, '', 1, 1, 39, '2015-11-27 22:38:21', '2015-11-27 22:38:21'),
(593, 4, 423, 10, '', 1, 1, 39, '2015-11-27 22:38:21', '2015-11-27 22:38:21'),
(594, 4, 424, 10, '', 1, 1, 39, '2015-11-27 22:38:21', '2015-11-27 22:38:21'),
(595, 4, 425, 10, '', 1, 1, 39, '2015-11-27 22:38:21', '2015-11-27 22:38:21'),
(596, 4, 426, 10, '', 1, 1, 39, '2015-11-27 22:38:21', '2015-11-27 22:38:21'),
(597, 4, 427, 10, '', 1, 0, 39, '2015-11-27 22:38:21', '2015-11-29 15:20:02'),
(598, 4, 428, 10, '', 1, 1, 39, '2015-11-27 22:38:21', '2015-11-27 22:38:21'),
(599, 4, 429, 10, '', 1, 1, 39, '2015-11-27 22:38:21', '2015-11-27 22:38:21'),
(600, 4, 430, 10, '', 1, 1, 39, '2015-11-27 22:38:22', '2015-11-27 22:38:22'),
(601, 4, 431, 10, '', 1, 1, 39, '2015-11-27 22:38:22', '2015-11-27 22:38:22'),
(602, 4, 432, 10, '', 1, 1, 39, '2015-11-27 22:38:22', '2015-11-27 22:38:22'),
(603, 4, 433, 10, '', 1, 1, 39, '2015-11-27 22:38:22', '2015-11-27 22:38:22'),
(604, 4, 434, 10, '', 1, 1, 39, '2015-11-27 22:38:22', '2015-11-27 22:38:22'),
(605, 4, 435, 10, '', 1, 1, 39, '2015-11-27 22:38:22', '2015-11-27 22:38:22'),
(606, 4, 436, 10, '', 1, 1, 39, '2015-11-27 22:38:22', '2015-11-27 22:38:22'),
(607, 4, 437, 10, '', 1, 1, 39, '2015-11-27 22:38:22', '2015-11-27 22:38:22'),
(608, 4, 438, 10, '', 1, 1, 39, '2015-11-27 22:38:22', '2015-11-27 22:38:22'),
(609, 4, 439, 10, '', 1, 1, 39, '2015-11-27 22:38:22', '2015-11-27 22:38:22'),
(610, 4, 440, 10, '', 1, 1, 39, '2015-11-27 22:38:22', '2015-11-27 22:38:22'),
(611, 4, 441, 10, '', 1, 1, 39, '2015-11-27 22:38:23', '2015-11-27 22:38:23'),
(612, 4, 442, 10, '', 1, 1, 39, '2015-11-27 22:38:23', '2015-11-27 22:38:23'),
(613, 4, 443, 10, '', 1, 1, 39, '2015-11-27 22:38:23', '2015-11-27 22:38:23'),
(614, 4, 444, 10, '', 1, 1, 39, '2015-11-27 22:38:23', '2015-11-27 22:38:23'),
(615, 4, 445, 10, '', 1, 1, 39, '2015-11-27 22:38:23', '2015-11-27 22:38:23'),
(616, 4, 446, 10, '', 1, 1, 39, '2015-11-27 22:38:23', '2015-11-27 22:38:23'),
(617, 4, 447, 10, '', 1, 1, 39, '2015-11-27 22:38:23', '2015-11-27 22:38:23'),
(618, 4, 448, 10, '', 1, 1, 39, '2015-11-27 22:38:23', '2015-11-27 22:38:23'),
(619, 4, 449, 10, '', 1, 1, 39, '2015-11-27 22:38:23', '2015-11-27 22:38:23'),
(620, 4, 450, 10, '', 1, 1, 39, '2015-11-27 22:38:23', '2015-11-27 22:38:23'),
(621, 4, 451, 10, '', 1, 1, 39, '2015-11-27 22:38:23', '2015-11-27 22:38:23'),
(622, 4, 452, 10, '', 1, 1, 39, '2015-11-27 22:38:23', '2015-11-27 22:38:23'),
(623, 4, 453, 10, '', 1, 1, 39, '2015-11-27 22:38:23', '2015-11-27 22:38:23'),
(624, 4, 454, 10, '', 1, 1, 39, '2015-11-27 22:38:24', '2015-11-27 22:38:24'),
(625, 4, 455, 10, '', 1, 1, 39, '2015-11-27 22:38:24', '2015-11-27 22:38:24'),
(626, 4, 456, 10, '', 1, 1, 39, '2015-11-27 22:38:24', '2015-11-27 22:38:24'),
(627, 4, 457, 10, '', 1, 1, 39, '2015-11-27 22:38:24', '2015-11-27 22:38:24'),
(628, 4, 458, 10, '', 1, 1, 39, '2015-11-27 22:38:24', '2015-11-27 22:38:24'),
(629, 4, 459, 10, '', 1, 1, 39, '2015-11-27 22:38:24', '2015-11-27 22:38:24'),
(630, 4, 460, 10, '', 1, 1, 39, '2015-11-27 22:38:24', '2015-11-27 22:38:24'),
(631, 4, 461, 10, '', 1, 1, 39, '2015-11-27 22:38:24', '2015-11-27 22:38:24'),
(632, 4, 462, 10, '', 1, 1, 39, '2015-11-27 22:38:24', '2015-11-27 22:38:24'),
(633, 4, 463, 10, '', 1, 1, 39, '2015-11-27 22:38:24', '2015-11-27 22:38:24'),
(634, 4, 464, 10, '', 1, 1, 39, '2015-11-27 22:38:24', '2015-11-27 22:38:24'),
(635, 4, 465, 10, '', 1, 1, 39, '2015-11-27 22:38:25', '2015-11-27 22:38:25'),
(636, 4, 466, 10, '', 1, 1, 39, '2015-11-27 22:38:25', '2015-11-27 22:38:25'),
(637, 4, 467, 10, '', 1, 1, 39, '2015-11-27 22:38:25', '2015-11-27 22:38:25'),
(638, 4, 468, 10, '', 1, 1, 39, '2015-11-27 22:38:25', '2015-11-27 22:38:25'),
(639, 4, 469, 10, '', 1, 1, 39, '2015-11-27 22:38:25', '2015-11-27 22:38:25'),
(640, 4, 470, 10, '', 1, 1, 39, '2015-11-27 22:38:25', '2015-11-27 22:38:25'),
(641, 4, 471, 10, '', 1, 1, 39, '2015-11-27 22:38:25', '2015-11-27 22:38:25'),
(642, 4, 472, 10, '', 1, 1, 39, '2015-11-27 22:38:25', '2015-11-27 22:38:25'),
(643, 4, 473, 10, '', 1, 1, 39, '2015-11-27 22:38:25', '2015-11-27 22:38:25'),
(644, 4, 474, 10, '', 1, 1, 39, '2015-11-27 22:38:25', '2015-11-27 22:38:25'),
(645, 4, 475, 10, '', 1, 1, 39, '2015-11-27 22:38:25', '2015-11-27 22:38:25'),
(646, 4, 476, 10, '', 1, 1, 39, '2015-11-27 22:38:25', '2015-11-27 22:38:25'),
(647, 4, 477, 10, '', 1, 1, 39, '2015-11-27 22:38:26', '2015-11-27 22:38:26'),
(648, 4, 478, 10, '', 1, 1, 39, '2015-11-27 22:38:26', '2015-11-27 22:38:26'),
(649, 4, 479, 10, '', 1, 1, 39, '2015-11-27 22:38:26', '2015-11-27 22:38:26'),
(650, 4, 480, 10, '', 1, 1, 39, '2015-11-27 22:38:26', '2015-11-27 22:38:26'),
(651, 4, 481, 10, '', 1, 1, 39, '2015-11-27 22:38:26', '2015-11-27 22:38:26'),
(652, 4, 482, 10, '', 1, 1, 39, '2015-11-27 22:38:26', '2015-11-27 22:38:26'),
(653, 4, 483, 10, '', 1, 1, 39, '2015-11-27 22:38:26', '2015-11-27 22:38:26'),
(654, 4, 484, 10, '', 1, 1, 39, '2015-11-27 22:38:26', '2015-11-27 22:38:26'),
(655, 4, 485, 10, '', 1, 1, 39, '2015-11-27 22:38:26', '2015-11-27 22:38:26'),
(656, 4, 486, 10, '', 1, 1, 39, '2015-11-27 22:38:26', '2015-11-27 22:38:26'),
(657, 4, 487, 10, '', 1, 1, 39, '2015-11-27 22:38:26', '2015-11-27 22:38:26'),
(658, 4, 488, 10, '', 1, 1, 39, '2015-11-27 22:38:26', '2015-11-27 22:38:26'),
(659, 4, 489, 10, '', 1, 1, 39, '2015-11-27 22:38:26', '2015-11-27 22:38:26'),
(660, 4, 490, 10, '', 1, 1, 39, '2015-11-27 22:38:26', '2015-11-27 22:38:26'),
(661, 4, 491, 10, '', 1, 1, 39, '2015-11-27 22:38:27', '2015-11-27 22:38:27'),
(662, 4, 492, 10, '', 1, 1, 39, '2015-11-27 22:38:27', '2015-11-27 22:38:27'),
(663, 4, 493, 10, '', 1, 1, 39, '2015-11-27 22:38:27', '2015-11-27 22:38:27'),
(664, 4, 494, 10, '', 1, 1, 39, '2015-11-27 22:38:27', '2015-11-27 22:38:27'),
(665, 4, 495, 10, '', 1, 1, 39, '2015-11-27 22:38:27', '2015-11-27 22:38:27'),
(666, 4, 496, 10, '', 1, 1, 39, '2015-11-27 22:38:27', '2015-11-27 22:38:27'),
(667, 4, 497, 10, '', 1, 1, 39, '2015-11-27 22:38:27', '2015-11-27 22:38:27'),
(668, 4, 498, 10, '', 1, 1, 39, '2015-11-27 22:38:27', '2015-11-27 22:38:27'),
(669, 4, 499, 10, '', 1, 1, 39, '2015-11-27 22:38:27', '2015-11-27 22:38:27'),
(670, 4, 500, 10, '', 1, 1, 39, '2015-11-27 22:38:27', '2015-11-27 22:38:27'),
(671, 4, 501, 10, '', 1, 1, 39, '2015-11-27 22:38:27', '2015-11-27 22:38:27'),
(672, 4, 502, 10, '', 1, 1, 39, '2015-11-27 22:38:27', '2015-11-27 22:38:27'),
(673, 4, 503, 10, '', 1, 0, 39, '2015-11-27 22:38:27', '2015-11-29 15:20:02'),
(674, 4, 504, 10, '', 1, 1, 39, '2015-11-27 22:38:28', '2015-11-27 22:38:28'),
(675, 4, 505, 10, '', 1, 1, 39, '2015-11-27 22:38:28', '2015-11-27 22:38:28'),
(676, 4, 506, 10, '', 1, 1, 39, '2015-11-27 22:38:28', '2015-11-27 22:38:28'),
(677, 4, 507, 10, '', 1, 1, 39, '2015-11-27 22:38:28', '2015-11-27 22:38:28'),
(678, 4, 508, 10, '', 1, 1, 39, '2015-11-27 22:38:28', '2015-11-27 22:38:28'),
(679, 4, 509, 10, '', 1, 1, 39, '2015-11-27 22:38:28', '2015-11-27 22:38:28'),
(680, 4, 510, 10, '', 1, 1, 39, '2015-11-27 22:38:28', '2015-11-27 22:38:28'),
(681, 4, 511, 10, '', 1, 1, 39, '2015-11-27 22:38:28', '2015-11-27 22:38:28'),
(682, 4, 512, 10, 'sal2345', 100, 100, 1, '2016-03-31 06:43:28', '2016-03-31 06:43:28'),
(683, 1, 513, 10, '500', 20, 20, 1, '2016-03-31 16:22:04', '2016-03-31 16:22:04');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_transfer_items`
--

CREATE TABLE IF NOT EXISTS `warehouse_transfer_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `warehouse_transfer_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `approved_by` varchar(100) DEFAULT NULL,
  `quantity_requested` int(11) DEFAULT '0',
  `quantity_supplied` int(11) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_transfers`
--

CREATE TABLE IF NOT EXISTS `warehouse_transfers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `request_warehs_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `request_warehouse_name` varchar(30) DEFAULT NULL,
  `source_warehouse_name` varchar(30) DEFAULT NULL,
  `total_items` int(11) DEFAULT '0',
  `total_supplied` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `request_status` enum('pending','approved','rejected','understock','part_supplied') DEFAULT 'pending',
  `request_date` date DEFAULT NULL,
  `delivery_status` varchar(4) NOT NULL DEFAULT 'No',
  `approved_by` varchar(70) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `delete_status` enum('deleted','alive') NOT NULL DEFAULT 'alive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `warehouse_transfers`
--

INSERT INTO `warehouse_transfers` (`id`, `item_id`, `request_warehs_id`, `warehouse_id`, `request_warehouse_name`, `source_warehouse_name`, `total_items`, `total_supplied`, `user_id`, `request_status`, `request_date`, `delivery_status`, `approved_by`, `created`, `modified`, `delete_status`) VALUES
(1, 4, 6, 5, 'Warehouse 2', 'Main Warehouse', 20, 12, 39, 'approved', '2015-10-15', 'Yes', NULL, '2015-10-15 19:40:42', '2015-11-26 13:23:07', 'alive'),
(2, 4, 6, 5, 'Warehouse 2', 'Main Warehouse', 10, 9, 39, 'approved', '2015-11-26', 'Yes', NULL, '2015-11-26 11:19:22', '2015-11-26 11:37:23', 'alive'),
(3, 4, 6, 5, 'Warehouse 2', 'Main Warehouse', 10, 0, 39, 'rejected', '2015-11-26', 'No', NULL, '2015-11-26 12:23:50', '2015-11-26 12:26:41', 'alive'),
(4, 4, 6, 5, 'Warehouse 2', 'Main Warehouse', 10, 0, 39, 'rejected', '2015-11-26', 'No', NULL, '2015-11-26 12:24:23', '2015-11-26 12:26:33', 'alive'),
(5, 4, 6, 5, 'Warehouse 2', 'Main Warehouse', 10, 0, 39, 'rejected', '2015-11-26', 'No', NULL, '2015-11-26 12:24:34', '2015-11-26 12:25:47', 'alive'),
(7, 4, 6, 5, 'Warehouse 2', 'Main Warehouse', 5, 1, 39, 'approved', '2015-11-26', 'Yes', NULL, '2015-11-26 12:28:00', '2015-11-26 12:34:06', 'alive'),
(8, 4, 6, 5, 'Warehouse 2', 'Main Warehouse', 10, 5, 39, 'approved', '2015-11-26', 'Yes', NULL, '2015-11-26 13:24:42', '2015-11-26 13:25:53', 'alive'),
(9, 4, 7, 5, 'Dansoman Warehouse', 'Main Warehouse', 5, 5, 39, 'approved', '2015-11-26', 'Yes', NULL, '2015-11-26 13:25:07', '2015-11-26 13:25:53', 'alive'),
(10, 4, 6, 5, 'Warehouse 2', 'Main Warehouse', 5, 5, 39, 'approved', '2015-11-26', 'Yes', NULL, '2015-11-26 14:52:55', '2015-11-26 14:53:21', 'alive'),
(11, 4, 7, 5, 'Dansoman Warehouse', 'Main Warehouse', 5, 5, 39, 'approved', '2015-11-26', 'Yes', NULL, '2015-11-26 14:56:15', '2015-11-26 14:57:27', 'alive'),
(12, 4, 6, 7, 'Warehouse 2', 'Dansoman Warehouse', 1, 1, 39, 'approved', '2015-11-26', 'Yes', NULL, '2015-11-26 14:57:47', '2015-11-26 14:58:19', 'alive'),
(13, 4, 5, 6, 'Main Warehouse', 'Warehouse 2', 1, 1, 39, 'approved', '2015-11-26', 'Yes', NULL, '2015-11-26 20:23:32', '2015-11-26 20:24:05', 'alive');

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE IF NOT EXISTS `warehouses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `warehouse` varchar(30) DEFAULT NULL,
  `town` varchar(30) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `warehouse`, `town`, `address`, `deleted`) VALUES
(6, 'Warehouse 2', 'Tema', 'West Coast', 0),
(7, 'Dansoman Warehouse', 'Dansoman', '', 0),
(10, 'Main Warehouse', 'Tema', 'West Coast', 0);

-- --------------------------------------------------------

--
-- Table structure for table `xsers`
--

CREATE TABLE IF NOT EXISTS `xsers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `firstname` varchar(60) DEFAULT NULL,
  `lastname` varchar(60) DEFAULT NULL,
  `img_name` varchar(25) NOT NULL,
  `image` blob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `xsers`
--

INSERT INTO `xsers` (`id`, `name`, `email`, `firstname`, `lastname`, `img_name`, `image`) VALUES
(1, 'Me', 'me@me.com', 'me', 'alsdkf', '', ''),
(2, 'Me', 'me@me.com', 'me', 'alsdkf', '1352492830_inventory_cate', 0x89504e470d0a1a0a0000000d4948445200000080000000800806000000c33e61cb0000000467414d410000afc837058ae900000006624b4744000000000000f943bb7f000000097048597300000048000000480046c96b3e000000097670416700000080000000800030e1319a00003ba44944415478daedbd79905cd775e6f93bf7bddc2a6b5f50852aa0b09320488020c145a41692962859566bd4b6dc6e4d8fdd76b4c71c86c731f6d81331ede8e989898efea363a6a7bba763c60b6d477b3cdd3de36ecbb22d4ba2b552944449a4b8800bf6bd00d4be576eefbd7beffc71dfcb7c999555002812a0255cc4432e95f9f2e53bdff9ce39df3def26dc1eb7c7ed717bdc1eb7c7ed717bdc1eb7c7ed717bdc1e3f46436ef501dcccf12f7bb726773b8051e01e2003bc025c02c2ff6169f2561fe64d1d3fd2004819bc008ce10cfe20f0803576bfb5660450a2d46511f93ef055e005e01c5005f85107c48f140052062fe23cfc6e12835bbbdf1a3b2c90f3b2193afa7be9dbb10d80b9b317a82c2e63b4d6a2d4b488bc0c7c1d781e3805acc18f2618fe56032036b8e0287d1b701067f023d6d83bac355b04c979b90c1dbdddf48d8f317cd73e46eeb993c1bdbbe81a19020b8b172f73e5d537b9f8e26bcc9c3843697e111d4546442d8892a338303c071c0396e047070c7fab00b089c11f00ee048680ac97c9d0d1d74deff651860fdfcbc8238f30b86d0bdd05219351a01458eb36708f81a85265f9ca1457df38c1c5178f3275fc0cabb30b444168455816a58e01dfc401e228300f98bfcd60784f032065f0222e863b835bfb80b5f64e6bed1611c9f8d92c46296a11f48e8ff2be4f3fc9ae07eea173b01fbfb313bafba17b103c1f561660610aaa25070069390d4a8180a985ac4ccf3179fc34175f7e8bc96367589e9a25ac05089444e41422cf035fc325915380fedb0686f714005206ef04b60387808780fbacb5fbacb15b44c878f93cc5a141fa470719de35c6c85d7b088cf0cab7df60e2dc2403a3431c79fc7ef63fb09fcede4e6768e541672ff48f40be13d61661ee8abb35c67d6cebd91001a5b061c4dafc22d3a72f70e9d5135c7eeb348b5767092b55802a22e745e43b38307c1fb80c84f0de0f15b714006d0c7e1078183862addd67ad1d12c4f7b3193a7a3ae91f1b6278cf36460eddcde0873e42e7d81899f2022c4e4150a556aa70eead0bbcfcfc512e9dba4cff483ff77df05eeeba7f1fdd03ddb1c72b28f6c0e036e8ea83f20a4c5f84a559884267f4766749044461b5a6b2bccaccb9cb5c7ae33497df3cc3fc95196aa50ad6da50442644e47b3830bc005c00aaef5520dc7400a432f571e0519c87b718dca7181b7c64f718237bb631b06d98627f37997cd619319383c131d8bac751fbec2598bd026195a01270fec4255ef9f69b5c387d85eefe6eee7bffdddc73641fddfd5d71ec17e8e8822de38e156a15983ce75821a8c6676783d323024ac058aa6b65e62e4d71f9d8392ebd798ed98929aa6b158c315a4426e38ae26bc0b780d34009de3bcc70ab005000fe04f8b405f17d8f627791fed10146766d6564d72803634374f675e3e732ee845b0b16e2ffdcb0402e0fc33b60db1d90cdc3d405b70515c25ac8a5b393bcf4ed639c3f7d95eebe4eee7bdf7eeeb97f37ddbd9d6e071628743a206c19076be0ea59983c0f95d5f82c6d729a44e2e383a05265e1ea1c974f5ee4d2b10bcc5c9ca2b452c2686344645e445ec381e19bc07160196e2d186e1500ba816795f0c85d8777b2efb1871918eea1b398c5cf67373678bbc3b7d6bd269b87adbb61c701c875c0f405b8721a2a6b4441c4c4c5595efede69ce9e9aa4abb7c87d0feee5ee433be8eeeda00e845cc181606c2ff819c70813275de2686d6cec6b9c4ee55e105503966696b87ae60a178e5f64fae234ab4b6be8c858119644e42d5c69f975e0755c4571d3c170cb0060e1d95c463df2773eba8bf1c377a1f61c423219589edb38166f7af83110323110f61e8642174cc5462c2d138511572ecdf3ea2b17387366868eae0287eeddc13d07b7d1db578c77138369683b6cbfd3b1c3f44538ff86ab1e8c8e8f4dae7d68313be82064656195c9f3535c3c7999c90b33ac2cac120621a2d49a881c057e1578fd6603c0bba99f067c34df059013f879cf93ed7bc7bb289a35ccf40452e842c6f7234ac1ea028435d011e830be6dddc2d4163f175460fe2a5c3ce632fc915db0fb20640ba8ca0abd0561dfbe2decdc3940a51272ecc414a74ecf120411dd9d59f2b90c980856e661ea3cac2ec2e028ecbdcfe50ad5923bb65a054cd8e638e22d8ab73040194d21ef33b4b58f3dfb47d97b608cd1bddb28ecd8cdeae26a362895c6c495946f7db9baf6e301006200ecd9d14d67310b51889dbd0c8bd3b06d1fb2f3803bc92bf310d4363fd91b0161ee8af3dce53907847df743b1075559a53b0f7bf70cb273e700616438797681b3171609424d57314b2ee7b97ca0b40453176169067a06e18e2330b213a2c0edb7bab601205bc010d6200a908e2e72078e30f0899f63e7dfff074cbff61673c78e5b51ea73c09b371b00fecd0640eb30c660b4c12a01b1307305bef19f60ef21d4912761cfbd70ecfb2ea61bed2a80eb1d02d4aa70e24538fb1a8ced837b3e000f7f02e6aea0cebfc18837c796c12287976a9c38bbc8f1b38b9cbb52e28edd7decd9de43575716b1c6d1ffd20c74f6c1b67df0e04fc28147e0e44b70f675c736d0727cb1dae8675cc5b2f77ef77d7a874014cae8eb8b74efe2780f00c062b441ac42c48028248ce0e42b70f51ceac887e1833f033317e1b56fc0cc84f3cc1b0102b8d2eee44b70ee759723dcfb383cf47107840b6f32e8cff2fefe02075602ce4cac7176a2c4f9a91abbb775b17bac485767d645fdb545b79f4b27e2fd3c01071e75cf9d78111667dcf1017474c38efdb0ff21974fe43b1c53c42aa40942a2f21ab804a6722bceff2d0d01ca93edbbc68a143b121c0a12274e22e26873e22472f50cecbc1b1efeb8937417676065ced1f07585855478086b3077154efd00ae9e81be11b8eb7dd0bf15a95528a880d12d05b60d1711514ccc874ccc47041a0a398f6cd64744395a5f9a89016961cf21b79f6237d4ca70d7c3f0a19f857b1f83de2dee58ab2507c430802840574a9cf8fcdfb07871428b527f029cfdf10a01b6c100c9bc4c428982c2c9b316b97216f9fcef3aca7df453eee4bef61cf695afba389f9468089b978dc9100786d3afc1f9b760742f3cf02472efe3505e46cebf454f669a7bbbf3ecad592ecd065c5e8c982a056c1b14b60d6429163c44041b853079169667915d07e1037f171ef8a83b9e6ad90155478dc9276b1b0c51adbabfddc2f19e08015a1b542ccea1e33fd42b2d8578a0aa65e48d6fb9dafcc847e1c18f21871fc7bef275ec2b5f73092438e6b8e6b08d0f8922b8700c264e614776220f3c09f7bc1fa9acc1e553149766b8ab5b335eb34c2e464c2e6b66ab96915e61b82f43e7d020323c8e0c8e39ca17cf197e79cee52cd8f5c64fb48b6a2d7ecdad1bb71e00da60b4c56240a7aaeb94e622a2008b9210999f846fff395c3a0e0f7d1c79fcefc1e1c7e1a5bfc1bcfa0decfca4b3afba911c21668489d370e51c8cec44ddff0472e061d011f6f2193a9667d9dba5198b1433419eb9aa87ce76b263fffd14fafa1cb557569d6e505985f2b2db753be32700a8053fee0c601b0c80c40677342e89b08369bc5c832240aa250780a519b8f341e4f013c8c77e11b9ffc3981f7c15f34a0c04b84e41291e02680d974f63ae9c8517bf8c77df13a8838fc28efdd8a5390a3d83ecec1b62cc08620cbe0ddd445262c85c87cb0f2a712c6f67fc34008ce656cec9dd4a00586b1d03686db0382f07d308e73ace052401840383aa551d2bac2ec25b2fc0cc25b8e703c8befbf13efe4ba8fb7f02fdbd2fa15ffb267671c6edecba8160b1c622a261690ecebd818ced411d781819dee18e3108c88425a7353451789c83843528afc50fdb18df1af7ba5ae800770bc7ad02400494ac8530743a4072fad2779a4ce6e34a3fb1081a6a1517ef957289e08b5f72f9c13def478677e27fea29d4431f25fafedfa05f790e130361a31cc1c6c6917c076afb2ebcbb1ec43bf0106a749793861343ad2dba2cdf6e926c1add9848da2407b095001dd4705f885b120b6e15002c105940d719a0315a6d9434edd47302142a8a905aa5311ba7144c9c70c9d79ec3b0ef3ed4e86eb29ffa6f30473e4cf8c217898e7e0bbd349f9ac17306914c16191ac3df7f3ffe3def43edd88f14bbdd8755cbaee65f9e73a55e58730d24ad9d44e91106cd2180f63980295589aa358080b80bf9668ff74c0ed0e4506906488583e6a1208a50d50404ca6dab8b70f245371f70c7fd30ba07357e07b9b13df88ffc24e10b5f227ce59b98b56554ef20fede83f8871ec5db7b08d53be8f6612dac2db969e1ab679df69feb801d77c59f933ac8a64ea2f88e356d00d02607a8567fac738058073098c880d7b0b5349502e984d02262414cea35a10301aae1d9220e00afaf39d167f741e819c2dbb11f6fdb3efc873e82999ac0db7d006fcb36d75002ce188b93cee3af9e85d24a8ab289154849a990a9cf4b739869014012f39bc2005089d9e4168e5b5f06260c903c51afff05c134858386e3a90628c4b819b73a72e22d61842ba71d2b8cef87d13d902be0ef39087b0e36761c053073d94d1c4d9e73133ce97e04635c8831366e1a550d94fa19c8169cca07aef730acc500b0ebbd3e1d0aaac16d1dc0ea461208a4ac6c528f534feb56c25408061b8688949bc3419d1116dc1cc0f21c6cbf03fa869da16a15b87cca4d144d5d74593db418cd3462be8e5c42e8990600327928141bf313953538f57223096cdd57fa7135bc0d006d2c3a6a30806bba9146f34ddada2d0d390d875780410535a726484b3848b68549a89560c7dd6e4af7d4cbf0c25fbaa40d689bb1270c60ad638ace1ed78616d4dcdf325917667ab7b8d77ff33f394041fb7d35e500512aa1bc35e39603c0b60b012d67a4ceeebaf939da84071556eb134acd5bcc0a88eb0406c708ab8ba97a7d03d5ae7edf3806a89663afb7eefe97ff049ef8fb4e8f78f1d97a53a94d0c0d8d70124716014c14618c411cdddd122ab8e50048842048b7dcb508014d794112fb2de8547298520c55d00a8296b89d787c75cd5175bd24dc205b4fae1b48aa83bffa5d38fc048ceec69e7ac54d05d7ca303f852d27fb731fd1dcd668eb8f459c06128606a0c62d9a0ebef500881900488bff8d96bae47969ce0b641d1b3891a8ae16368120151200a29abbad965dcc8ee71a6cca4bdd483cd642a584bcfc55ecca02bcf102f6cc51c706a55508abd8e32fa5be80db814dd7b6e9ddc61c608c8921218d37dde4714b0160892783a256e5673d030882d80da8bfe97eac16461142657d42087506b095356c1882e75dd363d15578fecfb12676dfd5655c57b7a42c67d6e1a7691fa9a7058bd1f61699bd31de330c90ce012499184a8780745890545448deb32e4750a02354ad4c532e00750018adb171187146dac463d38f4dece149386a024fea5d7683f7c7436bf3e30700c91b24a79559c928704290d6f179a8db585aec1d6b028d27523b04d14978907a2e20b15e002d20807a2791ad56d0497c87668fad3fbe86619bffd408191bbc3ffd56a34dfad36ec9785701f0cc53f5bb0ae8037623d3f7d9401e293fdf7fc4cc671d0344ce75ebaa6f3bf5a745796d8483c4f82a36be4a25887189158628ca0d000415d79317454e83b0ee79dbfc5f8b619b81d164ceeba1fd1676811f5106888dee01bdc01ee030ee82cf7bad65b735f488a0244bdd0bdc445babe24353f6df1c0e92e76259387d00a90451d253cc518054e34cbeb482d511a65a41eb548b56dab0cd4edcecc19b18d6de00288c368d68f2b731094c7978dae0f7010f61396c6197b5f40828514267ef3023bb1ea07fe4006f4d7c97a92ba7d0daa2a338136ed70e44232768aa0cd62502f1dfda56d34e3a560488b54ec4b1a6ce00362dc76f644458c702eec66e08880d7380f8eb86a1218aea6560f91db5ec758e1b0640cac3fb81bdc0fd38831fb4b0d35ae7e1d95c8162ef56fa46f6110555e6274f52e81a62f48e47d9b1ff09ae7cee2a57cd4974d2162e692337944011d06d1b0452af693cb56ed40924fe9b325524ac81d6e84ac5d1b06ceead1b8786f586dd2cfea7efbae6239300c6d0d4fa74f3c63501b089c1ef8d0ddead944826df41b1670bfda3f730b4e7830c8eeea3b777807c47373aaa3179ee15cebdfe2caf3ff7479c7bf54bcc4f9610a5523a409af637c801523a413dbe937a6b939094cc1c5a689a6bb028ed24581d86e8c8b80ce58730ecbad27193a4307987407a0ee49689c1eb00d0c6e0f7010f371b1cc9e43be8ec1da17f642f5bb6ddcde0e87eba07b693ef1a4215b6407ec07dafda022a58667cffa38cee3accd4c5d738f3ca97a8ac4e00e27200314d5540b3f1530020c51034e3a48e80745b594b2e2018a711b85eb40603ac536cdbd3f8f518b61d6bb4cb1b44680860b770340120367e1ef8c7c0cf58cb7893c17b86e91fd9c3966d07181cbd939e81ede48bbd8897699c2d5383d20454a620db07f921c8f442b0806f2ddbf63ec8f0d801969ffb57ac1cfb6e93129850bdabd85a420249859042460b6908adccb17ee610b128631163d0b5c0893126a5435c23ce6f5629b457fe5ad924251bb536c2dc6a00c4a31ff88c88dcd93338cce0e85d6c193dc0e0e81df40c6c2357ec41a50d6e3544adba2cf1d5b125a84e43b61f0a230e10c102be36f899ac3b31c6a2932c2ce6f0f5f301add694366cd1080bebd821c90104442cc65a5418ba10a0ddd4ee8d19b65da67f63ef838401de7b3a80588be40b1d7ce0c9bfc7963d87f10bc3a0732e4d6935f8b58609212a43750a72fd501883aebde0bb153ab431e8fa247f6b4a9f3e2a9afed65a15481bf9b87ed3f45e8b57ab62821a266800e09a86adff77838048bfafa562d0519d01acdc221c6c98048a0819e563566609a335bcce5e94744198a90b2737344c08d165a84c83dfe71ec7963189684343b06b6ab696e6b82f711bedfac4703d6e92b891ee2032b51a2a0ad161e492c03877b8768ca78d615b2a8696f2a17d18703761a85dd454d8332359f5f1e36be49e3e44edf75e7f97cdde181b02c002c684982844562dd4226c4f09552c22b502047e0c841b84ae09a1b606e1328890f13dc4109782a9922fb666030ced3d3cf5e275cfbb72b279aad88500a056250a827a05f27612ba1b89f9ad4c20e034006b592a7a639f7da8eb0fffdde33d5f13cb37724f1f3a869b69b2ef36183629032dd6461813b9d9d25060016c8746f556917c0e2967a1768317180b4e798be37eae9025a3222ae5c0796353c9b7594868ce005bfb079b5e63d30fdd851fd618c7007102da94a96f24fbde406868cf048d7dbb32d0fdc17892b39e3c618d7d1c581691fa8aa4b9a70f1d255e91f4dd00c3c600b0604c84352109f20d822a0b3600ba0cf404a07d64d587da75860591b8c5ca9df88e628e5cdeb58757ab213a75a54cd21aa65b92fb7adb186d4242faefd2d26b1803c0180bd50a51ade63a92b97ec36e161ad689494d09616387c902a58910d4d599e7f1c70e706e79452627977a57562a8f46917e14f8ef44e4146e89b9afe69e3e545f91f49d02c3e60c60228c0d71e751ead32d44a09605aa82f446d8c1082a0a59956b0341c09a86f055ecce53140fad5d761ed4a2463858d72620a9e7364b129bff5e074a0a00a2353ad40d31e65a86dd400f68356c7a071b25807506302e09f47cc5ceddfd8c758d505aab3233bbc295cb8b4c4d2d1797972bf785a1be0f784a44ce03df01be967bfa50d38aa46f17109b2a81d64658139134ad41acaa8b60aca00290b90c547ce8b5d811ed16565fc15deb927cd3665cd59b2c05e8e92bd29d759ab83b2155c25a0451f2899b84845683434a1e6e0f102b2e04e84a85a85ac3d63fe79d312cedc2409b89a140c3ecb2461b8bb586b5a0848e22541eb66eef64645b914a659885f912935757989e5acdaf2c55ef0a027d17d85f149109dcb2b45f03be937bfad079dc9cc20d816153063026c2e81051b6a1a5894383ebc37567569504a965b0dd3ef444d0a9b12b1656ac03428bed8c3558ebd05fd342cf40a72b898c33ce9ab5448176126e92ddc746d52d60a8f77ab4868ba6f7a5f0221663342a8ad06114b351ab61379fceddc8b0ebe4e2368aa23696a58a656ad9b056d1988cc7d2c16ed6fc001b345f1e283ef48fe4e81b1e644fad8fe5a50ab3532566a74a9995a5daeea0a6775bcbcf094c21fc2006c3b7724f1faaaf487a2d306cce0026c2dad0b5c6c7a75249caf04822b0a2b420cb59a816b03d11d257836e835db1d8650341e3648840f7d61ec4135e797d96b9854e766dcdd33bd885352e149457ab44a141e2baa061f8069e9ac3842bf4b4b1e4b2a9f8df5435b829645da9a09717d1918e0140ca98ed3d76f3642f7e4d5319d9fc1e632d6b01ccac5a964b06f132741edec3b127735c7a208ba582046d04aee4f015740e78740e74b16d5f91b5958085990af3d3156f65311c0baa7acc5a3e29308ff01af00de01bb9a70fd557246d0786a614fe934700b78ae72ffa7e6660c7eedd6473b9c6098fad576fd9aa9fdb86822746906a0e097390b34897418ae2a83734b1886419dc3b44a1a7c0c2c422939796989aab6195a2b398c11771178d46c6cdd7b766ff89aad712e4a3c8707272914a1091cf78643c95f2fc9811ac25b36514d33fc6c2779e8ba7832dd65a1782eaf75da5d0b8dfa81e8c6d3c36d6a4eea75e93bcde5aca816572c57275c952ae592a5bf3f05f3dc863ffcbffc4c1277e12eb09d3e52996c365421d129988d084f52d4aee6bb7192232794bd780cfc0688e81ad598a3d3eca13d1da164d64f758cb4f087c1ae149603710f90f0c4ff90f0c6bfd83e94d019015f879cff786c7c6b7932f149a4ddd324fdf1a7beb66d13e522d80cd405e235d2045051ed840e3673d460f8db1fdc876acb1cc5d5c647aa6c272c592c97a14320aac218ab4cbda53864e83310d066d0d176657b932bfc6dc7285501b72198facef378ecf5afce1514cd710f3df7bde19cec4c6b7c97d1797ebf75386372963278069bcaed9f0b5c8325bb25c5d81958aa5d69561eea35b99f8e5bd5c79a8c089e81c197c1edbf2181fd8f2010a5e81a9ca340bd505021d1099a861fcd62d0683b6112a6b29f40abd5b7d7a477c3a7a159e8f1843414776dcc287043e09bc0c9cbb2600107e5179dec8b6f16d3100525e9f4eb25254dc647c6269d62a24cc2141d1bd2faf914e85143d108b0d34c5be02e30fee64cb1d5ba82c9599bfbcccc2aa26b08a6cc6c317830edd896d4aee52813d0143642dd32b15026da8059ab9e532338b65aa41443eeb91cbf8602dd9e131a2ce7e16bef79d16cf4dee370c6b5360480c6b4d8a2d5ade63ad25d296c52a5c5d1596ca50cb784ced2970fc2706987d722b666b074a1495a8ccd995b31c5d3c4aa003debfe5fd7c74f449067283cc566698abce518d6a68a36330b4d9ac263411a189886c04be26db65e9d862e91bb50c6e81daaa50ab9213e1cbc01b69005cb30c5c5705482a1f207e5e92c7f5aebc666dbe9643a27ea875623b97907c156f248feacd60166b78cb869d8fee60f8c0164e7df524affff9eb2c5e58604d7974fa1de47382d4aaf5e68dd64ea07a08b0ce18e98261b51c70e2e23c0b2b15de7f703b595fdcfc43a512f722a6daba5be276fb39fff692b1e09a854b91b050f52805a095b07a5791e99f1a63664f07a5852a9c2fa16735f9ad1d64fb7378199f5254e2bb33dfe5e8c251f6f7ece7912d8ff0a1e10ff183b91ff0d7137fcd5b4b6f51d33594a896e0db3c8cb528057df91cdbbb3a29663c66aacb4c5d0c60c933b4e93ada34093456634c88888d8ded52eee4da5c93248222cd65625c2da8266b0994f348388a2dae426111c98337d281eacda217aae495e1e04fdfc3f607b6f1c65fbcc1a9af9c6271a142d62bd291f1c80495b83c6c9c84648e408b384f6c51a6938b7e6aa1268a0c9eb81e84b05c260ad32b8fae57fad6a9816dc0903c5d33c252e0b11a7844c6c2781f0ffcd7ff888b8f7430a58f92ad2d911de9c22c47e8d9103b116216156a48e1f7fa28df2332116f2ebec1a9e553eceadac5c3430ff3cfeefb67bcb5f4167f71f12f7871f645d6a2359428545c9799f838bb7339eeea1de49e812d643de1d4ea146f2e4d325f2d51d5ddc8064b42b60b0179e0973ce58d8c6e1f215fc8d50dd8acc6a6b028cdf9409d14ea6123c506d643c24e24ea0265c00b908c427565916206b014060aecfcd81d8c7d7027b5d51a4b9796a9448ac8cb823578f112abd2f87004213496b9720ddd6692bd90f5d93ed8850764b76e23f40a2cbefab29b226a93c435277f7108a8d3bf0b0bd6b87a7e31f098ab66a8848ab56e38fa41f8d6cf7a941e1ee1fd3b1fe3c3231fa6e815590e9789729a5c7f814c67165553f8cb825ff650cac3cb7a789e8f42b1182c7262e904974b13ece8dcc1a7767c8a87871e465bcdd5d255968315442cbbbafbf8c4cefd7c7af7dd8cf77473627592efcc9ee1dcda1c9528c0184b79324f54f20dc27f064e5c7f08b051cc0071dd1f1bb5a9fc13b0466236a0de5c63524c91ca0c1a5b2d87e8edd8fc2a1466c0aba03a32a842c6b99412c687bb19be7f8cd37f7992577ee745668f5f26f4bb086c40d154c9d1080922d443405ba42b89af411074b546102da143dd7081a48ebf56474fec71c60a25e3b1126508b5a29a873387352f3dae99dc095a2d72e6e4ffcde72ffc154f8e3dc967767f8687861ee28dc5377869f62516fd45a407a40c6a49f0e73cfc928fed116c5150bea3fb99ca0ccf5e7e96c1fc2007fb0ef15bf7fc169fd9fdd37cf9ca1f73a0bfc88eee7e4e9767f8caec714ead4c530e0377ad83a59ea86ed675b23103786a64ebd820f97c2ee5d5ebcb3f492762758f6c8e53e9d735afb5af10dde9f20351e0554152d7de6b856fbad9b26b3fbb1fb98f4c21cbe2c42ca55248a0b25804cfea188e426461b116d25a390274647d46fa8a2804bfaf9f9af6583a7e028b6ce0e5a6d9e39309246b291b8f8528c76a942150c2853d115ff96495ef3c11323f10a1adc6188db1865258e2e8c251be38f1452e952ef1d0d0437c64f423f4e5fa284525023fc4ebcee075f8f8daa350ce5108f2f8cac7cbf8f85e065f7c1416cb1a0339cd91a10176f7469caa5de1cf278ff2fcec19a62b2b8471a5a2b52632aed7223286ca54017de30cd09a03c42a2034f281987e9364b011ffa92b878e299c80d4accda5c010e590d2360807b0858be0ad40b980ac1421f4c142d770378ffeea4fb1e7430778f9df7f9d33df7883d59250932c9da646516b3c05fdb90c8bb588b065e9156b2d26b2185c2b58a8d7d0da20eb3cbebdea6781d07aac91a3627c0cc2f448c4f71fa9f2fa7d01a52eebe64c3658eb6bae32c79f9efd539e9d789627b63ec12fecfb797e61df2f7076e52cafcdbfc64266c1fd7456a0909247712d8b17f8d00507c646383830c660a18b8a8d28eb3e3e3f33c317a65f716df5b1aa6a62a31bebf409b7591af38feb99e03aaa8030ae029c11eb064d5a2c24950ca6c28249193a091f2a29269bc499d4e3a013fc1ef056908a07554b7d52212e0347ee19e363fff3cfb1ef89bb79f9df7f93ab6f5c62512baa46d34dc07041d197cfb218842c55438278b2271d02dceaa4baa923b89de125cef8235194c951268bb642b90f5e38bcca0fde576561508315e43a17795bac2ef2d9739fe5d98967797cf4717ee98e5fe2d3bb3ecd95d2155e5f7883e56089eebe3c3b7303740505baf245f68c0c117811272b0b2c84550e14c7098d17979ef13a4b89c18d71adf675adc2628d24505e77949b368458d39a03b4947f31dda70343c2148d4ac1bd4e89c4c5523a616c6ae9715049fa037514bf39ce2a1217d5163f03777ce40063f78ef1d6e75fe6f53f7f89c5cbf3d46c814e227afc88b1a2c760478e854ac07c257018d2068db85ec06a441469c4a391ddb7a4fd06a1aa7294258fb60abf3bcfdd9f3c80ffb3631c8d7e40edea716c2d729ac6f5d9bffe554b51892f5cf8025fb9fc553e30f2017efbbe5fe71fecfd1073d54986f2ddf4663b08ac615e97391f2cb35cad101a83580f0f8face45c396be35556da79bf8997e17533ec06586d3d946bcc066ac702f18c8b320da3aea7fbc664918a3bad9bca44d30048435194140b240070476b4d8468ed4e6e7316e6ee6a4b475f8e07ffe123ec7cff9dbcf6b9e39cfce2b7595aae50b13ebd36a43b63d8d6ddc160679ed0da98f2c5798e763d7992c657bd1414022f4bc52b109141fb30bd3f4bf8b3e33cfa9987383232c6fba27b796ef224bf7fec79be7ae538e530583743bd9163255fa53b9fe7defe6d3c315664a4f02a7db939fa73e3546d2757a335e6a232651da28dc1936cccc0491aae9cc10d1b7bff2649f17500c03631806d99043249fc3769ba6f66877aff40c20ca9d788b4320060630058b03a72d7e2374e5b2a4b6f7e7e70770f8ffffaa3ec7eb89f57fedfef73f9d509666b42491bfab29ace9ca2d357186dd1d662220d7137502302b8e308954fd52b10aa1c4609b36396379fc870f57d1d787d552e9ef82effc5da9d7c72fb1e7e6afbbd7c68e40ebe72e5187f78e2db7c73f214a5b0d67635d224bce4fd0c77f60cf3916d07f8c4f67bb86f709cde6c9108cd9c29519421ae845556751563049f2c5e6c78ab920249e19375099f6163efb70d9de0c60160c1a4ca40246dc4d8eb9be27f4315744cd150051d03a42fd54c0092b0406200493180c6d657d06af67edb860d04cbce4776307cd71027bf729cd73ffb2a4b9716a955155ddad09f3714b2cee34d14a130f8190fcf77ebfe47284a64a94a0e8362b157f3cac3016f3e0ab52dd0e1d728061e9316fec3b93739ba34cfcf8cefe3e1c1617e7ae7113e3276175fbd729cdf3bfe4dbe3579864a14b8df13b0968cf218efeae7435bf7f177c60ff1c8f06e860bbd285104849c37f3bc194e311ff97c22df0f769e0c59acd40360d3260859954b79fac6de9f2c81fb369240525270a2f6c97abaaf7bb934550a4d5e2feb99a1113e5a34823a0384750038cf6ff6fa86249b7ade40b6d3e3d0cfdcc396fb4678e677bf8efff234a62a94b5a22f32f4e50dd1da1a194fd1d953c088c76ae8b112f968a32875585e3f58e68547ca4c8d19327e867c08ca263f61212851bcb938c964a5ccd1a5ed7c726c073b8b5dfcf4cefb7962f44e9e9d78933f3af91d4e2d4f73ffc0389f183fc863a377b0b373908cca00860a21132c73cacc71295c6225ac5034fd582c19c91249445aa6b6f129b2163cf1102b681bb7d56fe4fda67ef5f1db60002cd6c465606cbda6f28f466fc03a61280148029836af73e123a9e01bb980c457e9181d61b54bb0dce1d8469c8e1fd78f33cd06f1a38ed10e5e7aa49f731d653e72658d5d670d51c96335106c57c0707f9628dbc15c59a88642e0c3d9fd01dffe608933bb0342dfb8838e40acd4b50c1115eb21c2a228be3e7989b36b6b7c74eb381f1c1aa237dbc167f63ccc47b7ddcd4c7595f1623f1d7e2e3e42c30a652ed825ceb1c01c65aa3a24d06eb5b09aaea1ad262bf9f85a89584813854f86d00458712e94f78a4db392ebbcbfae6cf2b642800517025c53684b5247ac0a9a16e3439d295a278b9ac387d42b0a48268f6254c47d72568798b8046df57edb860dd2a141708b3f682ce747327cf9c31efb2f441c7c5618bca83877a5c2d4428db53545044c8e477cef0355debca74aa9e01244b1ae555c5b4d6842444bddf0f57fe2d860624df19f2f694eacaef1b191adecef2ad29f731b8041b34895737681f32cb14c154b631a3a326ea5b428fe85119f0c19c9d5cf4f56e5e9f67a5908e7c1424ee5590d97d17613efb7b19c6d1ba78d36586807800858b51674e8dac2158ddabf312b286d6a7d01d386ee250590943054978de3d7898d39ce5a4c02804d0cddcc068d6f2958c46a720a440b3aaf38fd2161e24ec35dcf0907be65091784a521c36b8f86bcfa6095851e8d35e019179a925cc55a8b369a80a0c9f0c996681b4a84d71761aa1af0be812d3c36d4c760d667912a6fda692eb14cc9f56fd68b616d349136f174af41c5126e4672a0a49ec117551705af48b7d578e27166ed045f98fc9c33f626deef1840121da0ed52741b318076e8710c9018afb9fc6bc907eab57e8b3054678a9669e454e2272966482e36713940a3257d5d37665da35f0f060b8835e46294291419f1a80cc14b3f6d387faf61f0bce5e2ee88a9ad11da80af05238ab8059af49c631308a49909549d091c1bcc8be2b959e8f43d3e363cc005bbc8316669564be2b59162c33b1018d704623505af934ef1a9e8350c064f7cbebbf80deeed7e889aaef207e7ff2d57ca139844efdfd0fbd30c208d5efceb00806b9e3111d6a8fa29df58ed4bafead5ca1469c337c2c7ba4a2151f4ad17af1f1c624cd038a2d61c200588f50069347200784ae17bca7d7d0f66f66aaeeeb6680d7ee4dac6b4c2851fa59a56f0aef70c5b4b64a2d425e7cd4c50e78238b495e3b508a3269e6c4055d70daf5d22a70dda04181b91951c13b5330c67b7935339a66a57f97f267e8f702ce2c4f25bbcb8f0422cfd5ec3fbe3e9f1b75706c6876a4c48638d2e6918d534977f49fc6f362aed55c1967232a914302edb4e3ed7e80d7280767a406b0e600c36593452293ce561bcf835baa14068d5d8b34b7c1a93511650d6d6f318d7ed133587823417c449a2b5508aaa8045b739fdadde1fc5f7451b3486f3d593fcfe957fcee1e20718cbede2d5a5ef71ae748adf39fbbfb2505b24323a55ea6de6fdf6ed57012282cae4405c2c5e47f734ab827523d242f7226c242035edcba50f88f51d0344412a016d17f3dbe80189f713afbe11bfce1345c6f35a08b015542d7f49aa91a484b5b60e82d044cd0090e6cd022b410527beb74c4ad1c6fb934dd7f8b3d9df67be36cf44e53ce7d6ce124411d52820d2862bc10461a4eb0dacd7f67ebbd94cf0e60000c1cf15f1720151b514e702a9f2afe96aa174b9d786ee59df3f902e13eb958208d66ab0c67d5e9c0324a7ae6dcc6fa70740dcd4e1fa053ca5f095c278b6fefabab0d23a1b182bd2c93e502a59d0399e2112ac3584268c99a4850944b016823804342d06bb81f7eb24073021c74baf114411dada98195c72aa6d22fb721d997f0a08d710a737068080972b92e928b879f0f8e7d2eb353c1ba97deb27819ae8bea5fcab2796120b439106ad315190aa029abd7c633da011f04ceaf2334f297cdfabd36173ce9006577cdf483cff111f61cc6c26f579c61a421db6650277c14bcd4d21a7186023ef8f4ce3b1b50d23ebb847419bc4c89b68feedbc1f772b4db35c37c200f922990ee59654b5161354dd72b8d23e8637cabf94514d4bf9d7261fa8ab82e22460acc198c05d999c98a79d97b7a90092c749734702807a08488b8a096c52bbb7d854978c7125542a31ac9b33f6b83a08485ae66206d0410394d7e1fdbaae059894f1e3fbd66c3ee3b791f7c742104621ae0cacdd0003085eae88df91c1680dd6125a8309837a4ed05cebb7aa7de9669196f2cf34278210eb0ae26620a9e700ba4efbed2a80e61ca03504d8b8ea113c4fe12b300aac97e2902630b4e615a91187026b4c13a15aeb84a2c004b15004c962b5810e30d87a0e703dde9f083b8ded87f0fea402b04ed482f63f4db7711208f8b90e32850eac7625a4b586d02e63a3705d1348bbc9a246ff402a616c5329d4c3870056bb3e7c1db8187e0dc977a31cc09886f7f94a91f194bb26154bd209575fec391d0e364a9a8c716121c5029280a02e142517a840a0c3544a7a0bbc3f3e36bbe997da0800b6c100998e6ee789f187600d6179c549b569ef350d2f6ff405b4a1fb942ad8682b6be808d61a6c14614c104f07b7177adaab80e9323061802404487c8551cafb537b4e8c95365afd248ac226f3c6a95090b06002821a01e026695a19e0e67b7f92136d5e065cb30ac874f4b81cc03458c05a43545e7542518b2ab8fe22d266664887857595421c028c8e35009bd0e7fa185f7f7e033d609d10e4ab3a2b58eb4241fd2dad2a79fae3540c61e3806a5bf281766aa1b696a5da5add13afe9fde65df2fe6b88409b0340c0cb3b06303a8a8d6febb1d55a4b545975f9c035cbbf4699d868216f0e0b2e67b0711792762aa05d6fd8f4635afd350586c4db05f09547d65318bfb952487c3e1d0a1a25e206f499128a129434094526425b4339aac50ca0afedfde65df0fee47c25e770836a70d38610e5e7c8147be32430aeabe32d6184a8b216278569ba677df9979ef24da14cd5cbc718203ac284353717d0149faf6f0ea02907488700df439b86f16d9cefb73afeba12d136ff2dad18ba48b95e28b2f1b57c165bf7ec9beefdf5dce8c619c020d4a230e48daf7e036b1e63687c6bec1d96741820be2852d7caf59abdb50924090bcd6ce0eeb7b6901b011385181535e601369d03681f1a5c2d1f230ac1f73c329e8ff6d2c66fb67abd2248612ecd026dcfe5464291b1aea51e4b60a25be3fdc997b1429cc0843496ebd8140015e0f7b176dbd513a70ecc4f4cc8ce7b0fb2efe1fb2876f7388324672b05041d945d0f6132d5db2af52a0d9915ace9c1988efa87a5c387487c355250c5e8f4b16e50f7b70b0db1219cb36700a9eb003aa50426fb4b537edaec4da1c2b60046ac138954ac16c68251221425b3dac65a02a3ebd3be372ff36f7c1b37c52ed70780a79ea9af17fc39e0a8289eae952bfff0e4775f1cbe7aea347b1fb897ed0776932df6a698a001844428aab78cd7e93e9e4eeab80a761ac2416cb405633a9b2e36251682ac44eb55c0766c605b73f6061b282c79515814261232be5f9fe44bcac646f2972e0d5ba37e8bef5b8b45611391a8f9bab97ad5efd637348471f277d3327f9b7214bbfe6aae6b32c053cfb8db679ee21cf0db22fc25f09babf38b1f7fed2bcf172e1f3fc5de23773334d64fb6689b80105a8b096b60254ef65253bd4952e697c1bf047ad681408f80e9266915b756a3c39801eaab7f370cbb610ed0a20708164fdc7ac40a45d6f3315eaa3c4a0321f1989630d00805a99aba4d669dcc192408d3b120145907007d2bbcdf5a97c8d7af7ebe4e00b4b081c62d4b7654844f61cd6fcc5ebc7affd2d4acdaba773bbb0eeea6d8d5530f075843505ec286615d15ac5707967ab305005e05bc8b58338d89b643b413155701c6b85e0069fd3dbfc4e0ad39404ba2589f024994c054129876fab4e11dfd3438c0a66f5b32c50dd54271cc40e2fd56d727746ebaf7e380ef89c76613429bf603a4d8600df80fc073a2f8e5280c7fe5d2b173db662f4db27dff0ec6f66c2153ec8df383442d8c525dc4b2f1bcb4aa62d53cd68e62ac6074880e2bae0a50d264d88d543fdb960d1a5580ef29b2be1f8b430d37b7a9fdb58b9f2d7b6cc917e2e79bf22c17169428aa3aa4a403429d6ef8b889de0f78cac3531e1ad8e8f45fd74fc6a4807005f8e7c05f8bf01b95b5cadf3dfdf2c9aee90b57d9b17f8c81e1623d2c246a61bd0a30b2c96198b8f750397129ee07748d992933d875a77f7d68883d56a4a104facaad13a4f5faa9e0a67c206dfa5475d0f4312946b080672dae99d54d1a39edc8b8acc7da54c3e74df67e51f8cac3577ef3afb0bd1d00b400c13cf314af004f89f059b0bfb93cb7f2e85bdf5bf307b6f6b26d4f3f9dc51e97139457ea4da59bd190b5c453cd820eabe8a0dc1c029a4efce66c90bcae523554ab8d7e80ace7a3fd34749a7d3d0d843a385a434193fd6df3c7425d24f2e2de86c046ae0c34b7c0fbc519dfb399e418236e6432e85a4078e629aac05f022f88f0f3469b5f9d9958d8bb34bbc2f0b61e46c6f2640a8630168ab0c96ffbb61946dce28d8498a8868e6af11549aac9f08d13bf3ee6834bfcc210e6e72d73b386d59a5b7236e37be4b27e9c0334bca649036802022d606b0905e9234987907853d6b587196beb0d9f37dbfb3df161a5486db21b1b2970e57df51d0140020280679e6216f837c0b322fc5a588d3e73f9ec7cffc27496916d05fa7af30815379f100992590f025752b9c4d1e50055ac09ddec5b5b2f4f8db809436b585ab2cc4e1bd6d6004b2552a22d741e7b7399ede345068632f5ddb42a7be9c4306de8bae4b12e1434a325fdb4320aa584c0680213ddc4badf8523af5a80b941c2852e6ca8403807fc016e21dfa671836bbdaf1f9f7fd96d9f3cc21cf0158497802d414d8f2f2f045ea964c8643d7c65d0550556a17c4bba3a31510e53ed4404fc7c0741759e606dde31800244214a219e8ff27cc4cfa2fc2c5e36877839d64a8acb139ae9494db58a11e1654ff8a77fa646bf5d431d999aac749e3cb18c3130389427975769f74d81a915668de6504931442d8adc8a5dc94fcdb4b67c5bc3eeae211e1ddbcb5bd529421d1169570d845abbfb3a1687b46e560553ab7b34d8c22d02615a0190d6fcb14890c19f1dc0bbb215963bc0ca2cc21f01bf09fc0d6d969cffa1019006c2278f608073c01744b808ecaa56ccd0f2a29120005f5924f2d0d58c0342c6229ec506394cd52d48e9e58b185b468735bc6c1e2f5370b7b9027eb680974d6e3ba8061e572f5599b850a1b4aa01ce8bf0bf03fff873b2f53b6f49f7cbca85a8de7249ef3c736a2573e9428942c1a77f2087e7ab6beae5b6a5a75b5bc3f98545566b35575e2aaf79451cebfa0077760ef2c0d69d1caf4c3ba347da8942b1f1b56ea88351cc0c513b79d8365841b7f37e311029d4622ffe9551d4621f68af8cf057b1e1ff0898a9fddeeba4978679c70190802006421578051716026bd95b2ed9ce951517cbb2be4090c5d4b28002e3a16b79377397efc088ebbaf5731db1c13bf0721d78d90efc5c0791f698ba5ce2fc890596e6ab1863e745f8e3f80b7f0e58fd57cfac917960d80213c0174538058c2f2c0423a74eaccac27c404f6f86ee9e4c2c01b4fabdc40a6adaba42a40d93abab946a35568380aad628117ca550a986919142378747c6395d9d750078c7bddfad0e22cb9da82b5bf1660791201b217c17f86de07f03ce708d1f9ab8d67a063fd448fd06e1c3b1717e0a2874760ac32319fafab3f8998ca3757288f2c9f76d851ce8b0125f88a94029945244a166e6f20213a7a658592863adad88f037c0ff8113acc22437498fdcd38792bb63c02f5bcbaf586bb7f5f46638fc402f078f7451e8126a614410460451bce98830d2f5db506bd66a555ebd7c854ad890aa4584bce7d199cd50f07c021d71b86f1bbf7cf8437c6df5344114528b1afb0da388a065bf4998680289494092ca1dac5bf5c394b230d38f5aec86c8b7883d09fc1ef01f8159b8be65e3df5106681d311b245ef805e024305eabb17579594ba5a2c966856c2659d45950990c7e4747c3fb731d889f6771b6c4a9572f70e9e4249552a0457851847f02fc0be0d453cf603eff72fbe3d03f9846ff601aff81e155e05b223c27221db5aad97de9423977e942958cafe81bc8e2fb69eda1d53f5c563fb9b24298fa651320a6704b67360bc0d68e1eee1e1ae57c6d7ebd61dfaef76331551fa6fa91cbc36e112daba6117e1ff82de04b407923babfe900484010032104dec4e5072bd6b2b75cb63d4b4bee97bbf27985ef0be279647bfac9167bf1b205d656aa9c79f52ca75f3dcdcac21a587b46847f01fc13e07b40d0ceeb370182f51f189e04be24c21bc0d8da4a3476fe4c59cd4f877476fb7475fb8d6988a63020d474c4e5a5252263d6ed3fe379f4e47388c048be9bfd435b395f5d6832fedb89fd068b0e1466a60b7b690b2cf480f6d6103e0bfcf7c09f00733762f89b068036405805be0d7c5d8482d1ec595dd1b9e565b71249a1e053dc3286a6c0b9d74f73ec3b4799bd3c8389cc8c087f8043fa5f036b4f3de3f679a3236683083881533567ac61effc4cd87fe174856ac9d0d39fa1d0e135aad01803b528e2d2e2c600e82f14b0b81c6057df1097aa8bb1b16fd0fb6decfd11440b05a20b43d8e95e083221c2f3c0ff08fc6be0023fc40f4abdab39c06623f533b51f057ed35adeaf147eff600743bb77327d7196c5a939acb52511be888bf3df07a2ebf5f8eb19717e20c07ee0d7ace533407fff5086bb8f14d97967162f6ba98521a1d6cc974a3c7ffa4c530e908c8e4c869d7dbd445a734fcf283fb1fb2e5e583e4fa8f5db8afdc14a86e04a377abe0891b208c780df01fe14f74b623ff46f0cde3200401d040083c0cf03ffadb5ec1141ac251297d1fe1be059a0fc4e1abe75c440c8008f01bf652d3fe17964b78ee7b8fb810243db7c0c9ad9d555be71ea34e55a6ddd8aa89dd92cbb07fa89b4e640f756de37be8797962fa60010dfea2836be268c22c298159299c3604d51bd5a2498eac4d63c10ae027f0cfc21701e7e78c327e3a6858076231516ca38effe72acad4422fc6be09fe27ee4207c378d0ff5b0d0a46358cbae95053d74f95c4dcaab96ae1e8fce2e9fce5c8e5aa4a98461dc11e48050c864182a1601cb60ae9391ee5eae5496e209a16bc47e6b08ab42f94a81f2993ec2b90ed06a05e1ffc3c5f9ff082cbe9d38bfd9b8a50cd03a6246c8001db8df1eb3efb6e1db8d54d9b80b781acb2f5a18eeeaf5d87b30c78efd3e261371657189737373cc954a68ade9ebe8e08ea14142add956e8e5ded171de5cb9eae87e03ef8f8c26080ca5990c6b173b08977260a8217c1317f6be06d4dead5f107d4f01e0bd366220d4750c6bf929511406477cf61eceb2655c084cc8d5a565cecfcf2322dc31384864345bf33ddc3d3cc61bcb5789d6c5fed8f0a1a634af58b990a73293c34662105e07fe4fe0b3c012bc7374df6edc06c035468a0d8ac0a780dfb096237e46d4e82e8f5d877c3a07a01206ac556b649422d011c3b92ef60e0df3d6e224511bef2f2f5b16ce6759bb9c45d714089770b2edbfc3e92637e547a46f03e03a478b9af88f805fb196ed854e61fb9d1edbf62bfc822188226a51c4965c273bfa06796be16addeb43ada9940cf317150be7b2842505b008fc19f07f016ff02efd46f046e336006e70c44050c0bdc0af5bcbcf88d0d53d208cdfa3181c07a322fa3345b6f6f4726cee2a91d1542b9af9cb3073daa3bce081a18af0355c95f33c10dc4cc327e33600dee68881d0a463783efec098307600f68c7732d855e4cde9ab2c4e59264f08cb930a1db9e96a5c9cff0b5cb27b53e8beddb80d801f62a4c242938e91c923771e2830be27cf6b6f2c307b4108ab5811cee36af93f0626e1d6193e19b701f00e8c949a7827f06b58fe4b84fe4c5608030b96f9b89eff1de038606fb5e193711b00efe06851137f13780037eff16f89a7abdf2b864fc66d00bcc32315167a801d38e976f5bd66f8dbe3f6b83d6e8fdbe3f6b83d6e8fdbe3f6b83d6e8fdbe3f6b83d7efcc6ff0fac66790c20a94c7200000025744558746372656174652d6461746500323030392d30392d32385431313a32373a35382d30343a30308d2bd04900000025744558746d6f646966792d6461746500323030382d31302d31305432313a35363a32372d30343a3030180a827b0000001974455874536f6674776172650041646f626520496d616765526561647971c9653c0000000049454e44ae426082);
INSERT INTO `xsers` (`id`, `name`, `email`, `firstname`, `lastname`, `img_name`, `image`) VALUES
(3, 'Me', 'me@me.com', 'me', 'alsdkf', '1374605760_Gear.png', 0x89504e470d0a1a0a0000000d4948445200000080000000800806000000c33e61cb000017ab694343504943432050726f66696c6500007801ed5a6754144db3eecd0bbbe49c979c7306c939233949ce59328820928392541045928082820449e24b1410111144501401458288224105843be8ebf7de7bbef3fdbaf7dfb5cf999967aaaaab7aa666bb6bbb0a00fe4297e0607f38002020302cc44c479d60636b47c0bc0044800e90005a4070710b0d563335358444fe43db790e6047ac09e1235de4753cd68a921e35c5541d492a121114ffa1d36f324508641000982944a0f6fa85dd8fb0eb2f1c758423c382c32099ac23ece6ed02f161a510160ab130d380f0080058bcd74f4c347d845d7f628a7747d8c525c40b0086cf903cc1c5c50bc28ce4bfb0eb11163bc2116e5e907e46680c68ca40779f408804d9402bbb7b84ba01c0731d9271770f750b0080170b005c3d202008e2f31fbd133eb7e010a82f3f7400aea377075da1e609dd2bb4403abefe43f3c2007003d2cd64ff0f8d1f7a76e65700dc79f90f6dd3ece7fb84d13e09f59494f8a90e86570700357b78b8c90300260f801fb987877be587873f2a004040fdbbfdddc243227eca02e4d10505880119a0060c801570023e200c24802c5004aa400be8031360016c81237003de2000848048100b12400ac80439e022280225e03ab809ea402368059da0070c8047600c4c8297600e2c8255f0196c833d180c8681e16194307a182b8c1b26081387c9c194615a30039819cc16e60cf38405c0c261b1b04458062c0f76195606bb01bb036b8375c3866063b069d81c6c05b601db85c3e13838359c19ce0d1781cbc255e1fa7073b803dc131e0c8f8627c2cfc10be065f05af85d78177c18fe0cfe06be0adf821f2288113408024210218b504718216c111e8860442c220d7101518ab88568473c408c2366111f10df904824059215298494476a232d902ec820642c32035988ac4236237b914f916f90ebc87d140ec588e243c9a2745056280f54182a09958faa4035a1fa5013a8b7a84d34024d8de6424ba3b5d056682f74143a1d5d84ae45df478fa2e7d05f30080c0d8617238f31c43862823189984b981b987b9851cc3c660b8bc5326145b1ea582bac2f360e9b87adc2766047b16fb15f89f044ec4432440644ce44e1441944a54477891e11cd11ed10e3893988e5894d883d886389f3886f1277134f11afe35038169c14ce00e7863b85cbc7d5e2fa7033b84d3c1ecf8557c25be103f1a9f8327c077e02ff91044d42205120b120092449232927e9249922d920c593f292aa939e208d22cd27ad271d267d4f062763255320b3220b213b4f564b3644f68e1c46ce4aae486e431e419e4fde403e4abe46414cc147a14de14e91485146d14df186e2809285f218a53d650c6511653be50bcaef540c54f254b65431544554f7a866a8f6a959a895a99da813a8cba9fba917693034fc340634013439348d3493345f69196995689d691369ab698769d7e928e9a4e96ce94ed395d30dd0add293d14bd1dbd29fa6afa01fa2ffc840c520c7e0c890c450c330c6b0c3c8c2a8c1e8cb98c3d8ca38cb84661266b2608a65aa607ac4b4c9ccc4acc1eccf7c81f93ef37b165216591667960c962696d7ac685631563bd624d63ad66936049b309b0d5b225b1ddb0b02922046b027a4129a08b3ecc4ecb2ec6eecd9ec9dec2b1c341cea1cc11cc51cc31cdf38b939cd391338eb395f73e1b914b87cb80ab806b8b6b9b9b82db813b99bb817782879d47942782a78267811bc52bc1ebc97780779bff109f0d9f39de3fb8bef333f07bf257f2a7f3bff9a009b809940b2409bc00741564133c114c10ec175210e212ba10ca12ea12d617e6147e17ce121e11f2292223e22d7449e89e244d5442345eb44df8931899989a58bf5887d131713f7122f119f922093d0953823d126b1212920e926795572528a4c4a57eaac54a7d48eb498b4af74a5f41b1946194b991c9947b2685975d938d976d96d3971b900b91ab9f7f29cf2cef2c5f22f15e8142c14f2149e2892281a28a62b0e1e431fd33c9678ac5709a6a4aa14afd4a574a0acac1ca7fc97f2818a8a4abc4ab72a5055533dabdaaf8652d3514b531b56c7ab1babe7aa4f68d06ad8685cd198d564d7f4d0bca1b9a625a615a6d5a6b5afadaa9dac3dac43aa63ae735967569753d747b75e775b4f512f416f509f54df52ff8afe828180c14983364360a86b9863386d4430f2366a30da355637ce329e346135f1326930d933d532cd367d719ceb78e0f17633a499895991d9a2b9b879acf99005b585b3c56d8bef96da9679966fac84ac62ac06ada9ad5dadef581fd818da14d9acd8cad9a6d84eda71d985d9f5d953d9bbd9373a201ccc1d2a1cb64e689eb878e2bda3ac63bae34b2721a738a731670ee730e7411706177f972e574a570fd77637bc9bb35bb33bd6ddc1bdc103e561e751ef89f4b4f5acf7427ad979ddf1467b3b7837fa10f938f9b4f892f8bafb76fa51f9f9f9f5f933f987fa3f0ae00c880d980c14094c0d9c0b5208ca0ffa18ac135c16bc77d2eae49d105c8867484f28736854e84498685866d852b8467869f87e846d444b24556470e4689460547ad452b45674450c3cc639a6eb14eba9d3a75ec51e8bbd12bb77dafef4bd38a6b8d8b857f14af1d7e20fcf389fe94de04c484e583aab77b6369134313871224926e972d27eb273725f0a6f4a66caa7548bd4b63496b484b4f7e986e90d19b419b1190b99ba997559d459a7b216cee99eab3f4f773eeefc62b651f6dd1c969ce49cf55cabdcae3cbebcdcbcdd7cf7fcc717642f945dc45d0cbf387749ffd2dd02424166c1d742d7c2d1cb0a97ab8a288be28a3e5cb1bed27f55fc6a4931be38ba78e99ae5b5be12f192d252b2d2d3a56b65f6658fca15ca6b2a182b322a76affb5e9fa934acecac12a92aa926af3e5bbd75c3e3c6f44dfd9b9d35a235e5b534b569b57bb7826ebdbd6d75fb519d4a5d533d5f7df11d8a3ba977f61b4e362c359e689c68d26bea6a9669be7d97ebee9516ca96f456586b74eb469b4fdb7cbb5dfb78874147ff3de57bad9d629d35f7b9ee5ffb8be1affc2ed2aef46e64777cf76e4f44cf466f40ef4a9f67df42bf53ffab07b60f9e0f980f3c1d341e1c19d21f7af850e7e1c0b0d670ff238d47bd23ea233d8fd51ef78caa8ff63ed178d237a63936f054e7e9d0b8fef8c884f1c4d833f367cf276d26679e3b3e5f98f2985a990e98de7811fe62f765fc0c6226ed15e9abfcd70cafafcd72cdd6bc117fd33aa73cf760de707e62c16e61e1adefdb2fef6216e18b99efa9de5f5de25eaa5f965bee5d315c79beeabcbafa21fcc3e15ac647da8f65eb42eb6d9f343f8d7d76f8bcb211fe05fe257b9379b3664b76ebc1b6f9f6fc4ed0cec1d7ac6f4cdf6abecb7f7fb86bbbbbbc17b58fddbffc83ff47c781c1c1abc3c03fb1c09f58e04f2cf02716f8130bfc8905fec4027f62813ffb027ff605feec0bfcd917f8b32ff0675fe0cfbec0ffdf7d81609710979fb100023ac33d3d01f8520d00892d00546300e010ff5bfeaf3ccaaf680320a0a41094588232037d7043f80b84271283cc4109a1c6d061180266081b42c44134499c8e53c2ade36b497c487948e7c94ac85d28782816296ba84e52cb52efd2f4d266d259d173d26f30fcc598c964cbccc3fc8de5216b315b18c1809dc0becdf184f3065732b73b8f262f171f8a6f85ffb1409360a950b6708c889fa8ab988db89984aea491948db4934ca06c82dc25f94685a78a5f95d8958d54ceaa76a8ed6ac86a4669f5eb50eabae8d5e9ef1b9a1a951b6f9aea1d2f36dbb050b74cb39ab061b5f5b66bb0ff7a42d531d369d485dcf5b85b9efb334f2a2f13ef349f1edf1ffe9201be816541af4ed286e8859e0a6b0c5f8de488b28fce891988859f568d8b8e2f3b7337a1ffec74e26ad26e0a492a679a62ba798677e6e9accbe75acf4f647fcc45e771e62b5fb0ba187429bda0b2b0f3f278d1fb2b07c534d7784be44af5caecca3d2b82ae2755965435578fde58ba79584b774becb6619d5b7dcc9ddc869ac6bea697cdeb2da856b636e976c30eaf7bc99da5f7effef5b4eb730f49af509f6ebff7837303f5830f863a1f560f5f7a943812f8d87ed4e089e298e053fa71a2f18389cfcfe6269f3cef9f6a982e7971fe65dc8cdf2babd76ab3426fe8de1ccc2dce0f2fd4bfcd7e7772d1eebde692d032ddf2e1cad2ea930f1d6ba51f53d6fd3f997f96df60d938fcb2b839b455b39dbd13f1d5fe9bd277c22e66777defd97edb8fb283b4c3e3878790ff1960097016f825040fa20629877c80b2416da153319c982eac33119ae83ab13ef10eee2a5e1bff85e41aa911e901591db9130505453f65349538d53275398d232d33ed345d01bd2d032bc30a6303d36966531676963dd6e76c8d840c76070e518e03cee75c0ddce7787c790df9f8f871fc1b02af0507849a842b450a45b3c4ce8ac748444b464b9d924e96c991bd225725dfa130aef85109a7cca362ac1aa556a63eae89d492d50ed6b9adbbaacf6d1068d86a7460a2639a72fcb139b585ad6589d59c0d9fed49bb66fb9d130a8e314edd2e08574db744f73e4fac972ef41d3cf2a3f4b70db812f83298fda44fc89dd0bd70b588b4c8e968fe98b053d5b17f9d7e1c371fbf99003f4b932898a49e6c97129c9a9c569ade95f13273eb1cc979816ccd1c87dcf0bc9cfcda0b3d17a72fad15222f3316095d51ba6a5cec78cdaf24ac34bdacb2fc5ec5d4f52f55f86a9e1bea375d6a626b2fdd6abcfda46efd0e71034fa366934773d2ddeb2d0f5b37da693be4efb97466de6ff9eb6d37498f626f505f697fff8307032d83b7874a1fe60da73d8a1f897e1c3ceaf9c479ecc453db71b30983675a93cacfa5a784a7b95f30bfa49881cfecbc5a7d3d3d3bf8a669ae643e6521f8adef3bff45fff7fe4bfecb7e2bbeab7e1fbcd65c3f9e58b7f964f6597743e98be426df16e336e90e72e7ebd7c56f93df0776dbf76eee17fc483f883934fc97ff19e0890812442a9216598192478da0dd31484c295613bb4a94462c443c854bc00be35f9024918a93ce9265911f235fa228a434a0dca3ba496d4d83a069a6f5a0a3a6eba60f60606618600c6562671a618e62e16479ca1acbc6cb364938c3cecf3ecd91ca29c7f991ab92db998785e7056f119f133f2fffba40bb60aa90359467d9151913ad114b1277925094a497dc941a976e94c9950d9233911756c02b7c521c3956ad94a2eca1a2aa4aa7fa516d5cbd53e3ba66b656acb6a78e85aeb29eb03eab01dee0bbe1b2d1b4f1b049a7e9ede3d7cc72cdd32c622d4f5af95a7bdab8db3ad859da5b38589cb074b471b271b6757173f5770b760ff270f6b4f032f2d6f091f115f513f0e70de00a2404b104134e7285f0850a8609874b46c8462a4429476bc5189c328d353b6d116717ef74e64482e359874487249b64d3149b54dfb4a8f4cc8cabd0be7de7b9c7e7e7b33fe71ce491e4b35c10bea87849a7c0aad0f37258d1d92b17afd616dfbff6a864b674bb1c57c1795daef278555075e68d6b37cb6a8a6bafdd2abe5d5877b9feca9d92868ac6f2a61bcd4d773b5b7a5b87da26da5f76ccdf5beddcbaffa30bd58deba1ea65e9e3ece77d20342036283e24fbd077786084e571d068ff18f3d3c8f127cf64268ba6b0d3892f5133d9af796787e64e2f68bee37a8f5b46af72af19afe77efeb4e9b3bdf1ad7acff180fbc8ffbff2e9476b025a0680c270006ce60130ab0420fb07943ef78572f39701302501c0421ec07ab301ac3619c0d4b37faf1f472b15c0020a288f2d0c54a0bcb53f94a7ae00fd6011460c938039c0d2a08cf20a34c358c2cfc3871158842e2213f114c988744736200f5126500ef73bda145d037d712e986e2c3b3611bb4c6444d440cc489c44bc86b3c6f5e225f0c52418927092055213d2fb64826485e418f250f2790a538afb948294855428aa70aa456a73ea1e1a319a525a4ada64daef74fe747350aef209830e4337e331c6162619a60e6665e65e165d9631561bd645b610b64342163b2b7b13871ec73ce7292e6a688632e5fec253c0abccfb962f8b5f9effbdc045414dc14da12a6147117ae8eb4c17d31207e2f725e225d5a51052bdd06c6528cb2a07975b979f52e8556c3a56a9744139592552d557cd4dfd8486b9a6ae96bab68a8eaaaeaa9eaabe8e81a9a19d918771b049a269c1f106b387e6f396302b5e6b239b48db72bb29073268e67273bae0dcebb2e9c6ebeee851e0f9d81beda3e39beef738803cd02aa834f853885a6866d89b08a9c8f4a85731c2a7526397e334e38bcfec9db54a6c4f664b894b7d99ae927137cbe13c73f664eee57cd78b9c97560beb8ae2ae1a5da32a992f6ba9c8ad74afd6bd29524b7d6b0f9a99961adf35cfb62cb76ddfc3dfe7ec32ee09ea8b7f503ad8f1707604332a3666339ef36c680afd426326f3f5ab399e85d877934b022ba73fbc5dd7ff7c7313b71dfaf5ddaef67ee7d1f703350454cb4003b8800c30041e509d4219e8032b50dd8132545f50029b8493c075e129f0010411c204518098470a22639083287a9437aa034d8af6410f62f831e9980f58536c33112b512ad106b11df1104e1a578ea7c427e27748bc485e429eef219326ab21e7242fa220a74885f2dc11945fa87ca8e6a9eda99fd318d30cd36ad3f6d029d1b5d1cbd2b7324832d4318a33d6338933b5415eef633160996475625d678b2510110ad905d8bb392c39d63853b858b9dab9adb87720af2bf2cef09d8166a42702518204c121a1506176e1672249a29250a6b7405c57fc87448b64a01497d4b4748e8c912cadec8edc82fc238516c5ea63454ae9ca312afeaa4e6ad6eac735743595a0b54a4a474a57464f5a5fc9401b8a5aec8c3d4da24db38e579975994f597cb562b156b709b02db41b71409d1073b4764a756e765970a376d7f588f36cf07aefc3e9ebe257e23f1bc81ce4145c79723d54222c3abc3f9234ca2afa6acc62accce994b8f1336c09fe67db9348925d52ea5277d38d321ab3f4cefdc8be91eb98cf7061e45262a1ece5ed2b2dc581257ca5cbe577ae4756a9dea0bab954db79fb627d44836b93c15d9956f176917b52f795ba6c7adcfbd41e880f323ec40fff18f936ba3eb632bef56c7f0af7827146eab5f59b53f3e56f27de2397a556fdd69ad7bf6e286d266c8f7fe3df0dd97ff62fffe3a06a241e200fd5ad788324500906c147182d4c03160aab82cdc2e9a0df7e017c168a30c2100348666424721225872a4513a34fa13f62bc310b5867ec2cd109a2596257e2459c0fee333e127f48924e4a4b5a4e264ad6457e9c7c91e2342535651d9511d547ea5c1a599a57b45974c7e8d6e8af33b83272314e329d67d66581b174b3c6b1a943f50383ec391cf69c7c9cdb5c7ddc9778fc7835f868f936f84704aa0513841c849545384411a28b620fc56f4b14482648794a1bcb1c931597939557525055d43b66ade4a2eca712a19aa87651bd5aa349b3576b52fb832e528f5e5fdac0c230d428cfb8d964e638da4ccadcc922dbf2a135cc46cd36de6ed081e684a1639c539bf3ba2bbf9bbb7b95c7b2178fb7bf4f871fd2df22a02c702bd8e06455c861986d787b24435464f4f829a9d8923874bcf799b1b3528925c9a42911a933e93a193d5956e7be66e7e64ae6bdbe107f89a3e0c165bf2b4c577baeb995e2cada2b7c2ba9ab866e9ca991a95dbb5d59efdec0dfb8de7cbb25bacda083f5de97fba35dad3dd1bdcbfdc60f3a07c5866a86591fe53f468f463fd9842289d1677293255360daf6c59d19e42b4b28ff393bc735efb070eeedbd77d38bdb4bd4cb822baaabc61fccd64c3e1aadeb7f52f92cb141f842fce5d3e6d3adbaedac1d9fafeadfc8bfcd7ebfb51bb3a7b74fb7fffa47f141df91ff7fd560fd9c07883582fc834208861a9a3f6fffef4e01fee1509dd7cf46099df181fec647b55db4d0b1eceea269005d99a1e320d8ff671d1c240363f408b4348768475828d0d5d8e46facec19a26d0661a82fcc34384cfd08d343d83338ccd4e26f7a5c8cb7863184f110fd8247a8d66f3da5be2efa500d1a2085e88d21e1669610e68270776884b91684c921fc2ec6dbc2fa6f992d770fcdbfe970b8a78fb6de2f1938a54f98de912d6a68e9e4f00b32381a03640b2e030ca0d5d3038443155f1e20105a4f0d8106d0fcfb2c0c3c810bc4898078a1c00fbc877000d42308ea130461c2df721aff46d1fed9cf0beaf73f3512a0fab220c8da6f9bbfac11209bbf75fa007708ffa6bb40368e7847a30b75f239fb8fcddf1247fa7e8e46ac566c456cfff798903c4809a434521da9845446ca03021467320261a414f47f430da982548478f2401bbc83347bfd1ee391fe8046cf88c2a068052b6f887bf4ecaebfb9c0eaa7b4cfbfeeff6d04c06774ad75edf708a0fac99f3581d09b0668c84f579d8f50d7b753678eaeffbd85794441b581006804054787f878798711d4a0aa490f21825ea09b881041424c4c1efc17fd81e666de15532200002000494441547801edbd077c5cc775ef7f76012c800516bd110089c24eb1a852d5eab27a7164592e8a5be292d84efcf14bfc8f93bcc4fee72571f277deb39f1dc7f18bfd778be3588925cb722cc9ea5d222576526c2844efbd2d168bf7fdcdec054089924811b2e432c0ec6d73e7ce9ddf3967ce9c3933d7ec37e13735f09b1af8f5ad81d0afefabbfe8cdcfb3329bb22c0bdbec8bae980dd8901db2e1979cff1538f11b021088efb72bd69f5df28feb8b4b7392c9d9d95048d5926e21a8212d1cb27f6dd8d3635ba7df69b7dbfe5f01cc8f7a85f4a38e7e1d0fceb065cb3645bffe955bafa9cdcfcab6d924e0cf86a9893462c84a7397d88a271eaafa5cdf7dff8313b71293c45f99a037fd750e21bbc4fef6f3d75f555b1089da74dc2c9108a7a2d94c22cda66742169f9ab65575f65bf6717bdbaf5a65fd7a13c0bbecca4f5c7ae6ada7545638a0439601cfa75938a4986ee170862567c23634396eab8af2c2915afb1f769915ff2a11c1af2f0114599e9d1afa9b5bcf39352d09d70bf010c0874219487e110204c0369e98b5beb171a4c1acbd7569e11a3bdbfef83704f046d6c085b6d23e6c9fb65baceea48a71b37de00b97bdf5b4c2ac5cd47e8017e02ec2fd9202c48c70a64dcd24ac7da4cfe233b3164d8fd86935191fb30fda9927f5ec37d1cdbf3c12e05c5b01ec5fb8f5e31b9ef8dac76ffa3bdb68dfb673ade835d5e519b6e48cd3ab3f7df99a359640e913f0228090a480dbcfb059b83f3d2d6283a393d635d14b1391b4097481d5e525b9b6cafed64eb1c86b7ab66e7a9b5d6037d9a9aff9fe45bcf1cddf0b38cd2aa9ae8fdd7cce291ffaf0c567976eacac747c9a4c26def2fbf1bbffd93aecb7adc9264fa84eceb74ffee125e7576602703c81c4a7db273290f63f4b3360ec8767d108d233adb5bfd5c6937124c12c5220c3b2690aae5a967ff93d570dbdd7f6d8bf9cd073afb4d3ed92957ff6e7a75d7d63dfd8c8c83fd5fce0f3f6a5892f91c78995ff841efaca89f5b66fce70bd45ed62fbe0f937d57eeb4befbefefa8f5c784ece92589e4dcfce58829e584d51910d8df5addb51d197630fdbcf7989971a708ef56697d9aa6bae5efdb50f9cbf396b06ee97d2676afbd50c383d20cc56d59266d1cc1c7bf4c03ebbf3c81e2b490f5b244d7a8159694ed4c64223a7f7676319d8771c06a20a2bb58f64fdf7dfbff9b6affeefeb3e78eaa5abcf0c9f555f9b9593d771f9e3d58d9b79d3a7edb0f51fabb8aff7b9372f019c6b57fff1bbdef2af5f78fb0d05cb0b4b1ce833602c138d90ce4acfb0085afaac759fbb6fd5f8983d6a4f1e5765bddd3eff0fef78db7925b979960c0820005f5b17bd52989196653fdebec5b6f536594146129d206c1969691887d26c69516edeaef068cc1eb29fbce273df6d579e71db05dffddf377fece6b79f7e61662c926b8353ed7678f86e5b523466e7d4952c7f32dc767d3cdff6f2d7f08a79bd0e17dfbc0470a9bdfb8befb9f1a2d2cc5c8bdbcc4b5e7d16e88b7272ed485f8f15e7262ed95f3971d09eb1dd2f4a586057db5adb6ce7d985761d5db80f7cf482f36fbbeed4f5e949faf712f541d72f34ebb93e2080f4b40ca71f7ce3e907ac1525309b163f3b8cba88144847424423112bca9a5adf5439f3946db1c6173dd7acc462f621fbdc1fdcf4fe2f7ef69a7755d5152db19964d806a60e5bf3d8cf6852fa20c030ef906d972eaf2e3c92d6ff5b9de5f1017bde9e7b495eafe38937af0e5012ae8f656521ec3dd70775809dd6890011405e7696ad2ea9b5f8ec68fa45678cffd323ef9d184590f6d9323bc76a22975f5eba74d5fa25154beacb4b726a8b8b2d86a5af2437e6faf6b2f28542d28105bcb65e0f980d740108428adff9d5eb2d0b497078a4c95a2687ad3a3462d9d4da643ccd969756643eb7a2f96f8737624eda69634119ed2adbb8ecf20d5ffeeb2bdf79e179f5eb9ca44924e94e4eeeb08ec9c72084044f4be70d666d3a91b49c48bafdf10d67e67c29e3b9af3e333b3c6adfb0efcee5f53aefbc6909e0b4828a25d919ea8feb4f98eb5761c1de6cd24eada9b1870fefb4da82e282eccbd2fe637d4575f8dc5535194b8b0aac242746bb4dbf1e90d5de0b0417c5fd2e53e5e5dbfc39e30f69c5996a6e3268f03f7ae9d5363e3961ad832db6b7bdd576b41fb696e1269b991db0ccf442bbb6bee2ac7fbbb6f36310c0dfbbe27dd87ef79d175dffb77f70c58d25e539853683f2a826ab6be269eb9df4cc2d2933bbc0a28c6e690988ad242bd36ca9fd37749fdbd16b7e218ae19b9500423991cc589ae35055ab88c057a4abe4d48fa443516eb6dd72eaf9969b9965cb4a0b3373e8ab27806f627ac6bac647ad1d86ea191db5e1c9491b4fc41d57838985d0fe67d926339cfe0f98199699966df9b4d1157925b624a7c40a326300336ce1b431ab2eceb365c59becf2759bac6d60d89e6f3e6cfb7af75946a4cb362fb74f3ffb767bd656e4bee7f357bfef776e3afdfc900c4b093d83b2744c3c6583f1dd4eb9d43317becbac9a159a97a777765aefd8889517db86aef5c89087edce85effa7aedbf590920ad281229cb4c89c9e0e5bd24088efc364c93b0b9966640153d3a684ff7f4d991c141401fb3ac50c42a6305b4b3317a0de5969d9145cc44818c000c62df0dfa846d2a3183489fb1d1c4a4f54f8e5a734fa73dd6b4cd12e169daf9a8ad2e5e6a2bf3ab2d876ea14607979594585de912eb1f3dd3b61d3968e199adc576d9cc4f3f73e9bba31bab6b20328895bc67185fee9c78c286a70fb91e86c01749b8a0976158292337cd9abb876c674b3b449c6955a1997057e1f447b9fa63622ab1bbe375f979b3128085c2e9f4c48fae8185b51148876edae5e75bdbec706f0f833666ab4acaecacf27a5bb2aa806e5c1639a87df76027c951c0bb113fd7f6f304dafadc4c9a01803075036956e2c941ba9b75743327ad61a8df76b7b7d883cd7bad2eafc2ce5db20ee9500e78212b8ce6d8156b37db994b375a2423239a971dc3ae3043573142133109e73f6163d38d70bc6fef8f429097c988a6dbe474d21eded564b9910c24d48c654819cd9dbec83e8ae2fa357be2a87b5e8783372d01e85d05b8077d5efc6700602294b417fabaedc9a6261b1a1d47112cb79b566db2f2827c276693e23e3a0eeae6b9fb1df0025bc4e08920e4c8cb1387270a71ec18da792fe04d3bd062d9b9767ab4d0ce5cb2da4627a76c4777b3fd60ef639697916b572ddf6ccbf2aad02dcc0a7273211c8d2222ce357e901c03fc476d7ca693d21e0dbe7fa7a4a5a3df6441a0f73eb38b7bd045d281020298a15c5531cb6acbb58f50d85f5b024820d9e14529691e7c19693510bfbbb7d31e3874d022286ae7d7d4daca8a32fae6e90e08146a7707f549f0e07aed41fdfb006c9d615fc61f470452c88c9e04f6fee4007bba0e183206717d06b93dc393b333b3ed829a8d766ef526dbd1d968dfdffda02dcfafb26b565ce044b7f40ab5fbf1d931c4fea31052373246e0abd40457267ef85757b238bfc01edd7bd87a87072d2f2be274149f70c6224a9b6bd7db6db6dabef7fa3aa1bc3925c005b6c942333135018ae954e5fe812ebb7bef5e2ba64dbe71d5291862f2a94b347b6a1e7dcfed4bdb0f2fe472aecf72b7f3f0d179d78504580820200289eac964370434c13955879a024f2cc1d6138f9ea5f2a4d999556b6d63f92a7bac7987fdfd33dfb7b7afbccc4eafdc60138911d7e64f267b48485e108fca98429fadcfbab4a0d81abafa6d576b230a6714f05f64e74072596cb600fbe107b8e54fdc8dafd38f4af7660a617b9ffdeeb597acf9ebbfb8e1f292558565d6353d6277ecda69a36371bb66ed1a5b5e520c47c295920f480141a2d13cafd4e97538e78840ce7d9e8bdd3501e18c3d80cff559409e9e19b4a96417e9c499bebb280210c88e10525b8d0c3a17b1594f2032158bdb238c166aa4f07b7b7f66b5b995766e4dba4d283fca25e92502c0c38c3d8edc76d64af34b6d742a61fffef49356989381f29970c723531336cc60d310dbbec9b8354ef3c85e6b239e655f67c4e3750a7ab33747a8c476f611fbeadfbce7ca3fffecf55746cb50a81e38b2df7eb463a79d535563376ddc80d2956d09c6029c501598e232896a0104a8de8a370fa0e75c7f3c7fcdb7c95333ed3635dbc5bd22224909d2293a29a073fe3e811f10c47c1a9d4367a089c8cb2cb0332a56da935d3fb3c75a77da2958fcc2695234e7843f79f966ac285644739565776cd902f8343548a438ed561c4522ceb0f3145b0d3f4f206a06e942f2903cac01ad74309fe6e875096f0e0260942cf4eeac7fbbfb776ebbe6d6f5a759eff4b8fdf396a76c12ae7fdfd967d9f222c6021cf0e22a81134401af57c0763f079407cf73f0d144a1c19e99d929447e33f90d53bfde032800d8dd23829a23060f3426a1b9fc0342521a3d530a637ffc79ab2f4c63d43069771f3c60eb8a4a2d12c1a004d7fb80d532b7c07221eabbb76e679471120530d3e2d3d3aecb784c0250aba0dba7ac1aa3f277182c924c58f4f0fa1100e650374e36b6c0447aace2bfddaebbe4a6ba7ffbcff7bd7bf5e9a54bed2934edefc22197d62eb7abd7ad859b687b015fec20a5cc8b73019f6aaf81c183edc1123707dc7b14b0a44fcc0ed9c44c331204231bdababf2fc847f74bd5f4fa413036e0a4438ab81cf8290209939ff0e99dda6a638956c00e594d5e21c0a6d9dd870fd8dafc12801611cc5894de442c3bc71ed8b597ae5e3f6317b93685e2320db7cb66f0b204202940ab8142b80b29b087a3450faf0f017cd0de7fd575cb7fb8f9c6caf7eddad473366e1b4946ba9a29fdd154fc5efbc86d6fdbf88dfff9ce1b0b2bb2f3ed470776d9d6c666fbddb3cfa6ad2fa52f9ee0fdc5f5be6df7e003788aeb0349a0363d00db03979210a4f3a0c248b39d707e1bc76a4044407a7501ae343e9d278820af1421702d902e6a029426ecf405b3bef876c03fe29e21a49248804a8c4ec9b4597ba0b9c1361497a02b405234091974fb7635b7180a3f84416f01317f5c0420ca8f33672161ff8a2690ea52508c450a8b4f006fb32b6eba6ecdb7bef4ae1bf2ae5cbf26efd64d1bd7d7d515de7a6843dfd5436553716ce60728fb34edfda7fef0e673bef4d99bae8aa487d3ed9b5b9eb619ac71ef3be72c46de226edcdf0b500f7ed05607e07ba56f01f72f200af5bdd310f772eac44c47d7ac1d51dde7c0d00050d0ce0780ce039fbae608c7e72df0dd75c0778402e72b8f81e97d807fd835171e0bdfe6cf40044b196a1ec4ecbcb3bdcbd662359cc4dd18dbb02dafa8b0ed8d6d9645b144d8d38e085e450248f8cde01453ce80f7166bf2cf5abcdfc525804b6cf5a9d757fcf08bb75e5b9605956b342d0f63c719b55576cbe91b972caf2dba69cf9abeb70eaf98b8f0cf6fb9f88fffe8ad9784c66943bff2d8e3b682aed10d9bd6bb8a711a347b0ef4b9369fa2b23fdf04a8e89ed305783acf93f915c31aa6dd84750f310e30d467ad432f58f758b7f58d4e58efc8a88d4fcd60ce15881009db749a02f51602855104e6a589f40ab986711c80ef2446ba0dcf3460deddcbf355260f86dff8df046d7f3dfdfc9d839d363e96b0a505319b9c9ab49cec6c94bf1c7bbef188e545338f8f007c3390860488d20cfc877fdae2fd8abd1627d45b3ebdd6bbeffff0fb2f58ced0abda363fc3c63f221d678a08a2b06f62c20e76f5dad9b535368cedf65f9e78c62e647f73dd32b89e0a4c55a86bf353dc27112fb0e79b00712a66160c2a6a3f072726ad7b70c4c6e2285570551636fb9ccc694bcf1c80282435d11dd40d035c995efbf0f39b42fb96a9389b58457b9d9b117504242212b0817458a8288a20c6663aac7fea79caa2ae1dd646e5ab7dfda9ecfce89c9a9a099ab0afef7ede6ead5dc73074366742565c58608fed3e641d433d6e18786472fad8dd40ccda6e3c505be62ba04fb5d01738c3b6194686c50bd280162384ed06fbeb6ffcd64d17d41717b9ae8dc057a5cbf6a220d138418c4532eddcda650c8d4ed8171e7ed8debe663d12622940066aaf6ef0dced4158003c4420e065491ba5cfdcd4d5c580cca473d0a82d2ab3eac2283e0231a4401ffd7b1accd91c60114854bd1448751bb97f59b13c80d36c68827ef7c494ede968b334dae87aba70255905a457d9e72581570cd3c8934982d3bb1ce05e219da356f2e7399e0c78869e19b22812e69aba157677c3417bdf291b6986666c9891c9d3565659d3533dd811f4cec71144c38db8bb6cb30af616950054d3271fde6fb77eeaa6b3fff696b33686e447ef6a03a8bc04e0102a10ace20b29456388e8af3cfa845dbf6ab59d5157edc0f755a9541e646f8af59cef0000900cc6f6875123f676b45b4b6fbf1564e5db9a8a6a1c3396582eeedd11387f92fefd64b2dd81ae7af39caf674b5c937faa199134c9247d011afa528c335969990cfcf45acbf88015d3b797141111781d80ee236c28ce4fcc4e902b04c21f09d857486d756aee3809e0a8f0d9513b28b7f28959abce8f2281a62d138f92745ccb0e2109b3710691347a891d40b4e1c53fce04e84d77da0fa1b01cce1e4e5d714f3ad99fc5910039567feeea9ab0e700aa5d6294011bbf55ade858ff219b841bbffed4330ca6ac709cafa1581f02f0e178b5b94e14430c6ca5ccc59333b6bbad95767cdcd6017a79659113d34ce5c4442b40e8dca1e52766fb1d2e0e080050993cf9f9fc9d7807d6a049913147578aa2f938901459c7c8b06de93d647558f664dd13278bb707e37bc87b8477d1b187991df75c27fe75b020e8a9ba3a43137545cd72fbeeae5db6bab4d00d278f8d4d587545cc763465da445c64fa3241c51cb371bc1d7f88da2c071155d62bdcf032f9bcc2e9c591006536102e99bded9235f5991a81f31240a0aba2822dc23b23cdbeb3e539ac652576deca5aa7acf9aaf4861c6f7b9f17bde2be34b85ee3fbdb8eb4983c6c4e5d5a8f6b17a21d2014d5959b45b44eccb6c0718329f0c995ff247f7ec0c78bfe853602572ea7d4a90abc2959ed7f1e92a42abbd40e8e7602fab8556417a3f01d6464af85741e5431becaada85fbda68840c4e6fefd05774dfa400eefd03b3d690343e356539ccfa821dd5b467cc2e8457b8e74a128476c32317d94257048304f02fbd3f603b4ffad1ce9e18f113562b56841992e4ef8b47df3ae4fbcfb03abcb4be148a93b9eb3a404e8215974edeed889e63c9db0b79dbec1f510f44e41fbaaadef976b8be8a5fdd408dbaef6769b4671db545587b8c4475027531c4c8f1a0e8da35b1ca1f247389b018701280f9cc114ebc53f07481427ced98a83fd30b1f6456c9e38fcf3fdb1a687a5a32f3cdbd764a3d31db6366fd2b5df4ec201a8cf57908bc8742c691710803f960410013a3d8874c3c949fbc1ae3df6db6b3750469267201d2249fbffefdb6ef999bc076906c627ac1bb7c6ce29fc07d5d21cb16edafe073104219e98885201f8596e328c1eeec55e3f4d42af7dd6be659ddc71c261f108e04a3be5c6db963ff1f95baec9f726d03912b04c14ac675bdb6d4f739bbdefdc3300cd83e8dad794b8977217287d6988fc1106499e6f6db165b162395f625bd7fbaab802c9130b7e3c88658c3b218d0fa4e16e3d6e3d23234ce61ca6673042ff1fb98988cd904f7f28cb0ab30b2d1f25b1341707d1f46c72f1c3c87ab6cf57c4101887d43d1cb37bbbee30bcc66c7d5e39fe841ed0394210c0fad3eb8800fc8edb3a72e0587fd0a2f32ffc71f30b56831fe1294be825e1181a8e996ddddb6177efda6fab509e35b219422a64a21f44312547910c85b108fa0d842d46a21cdaea39b2308671277b823afdf14f863f8623e95729c50987c523003dfaa3f697fff8d16b3f7bf9292be0da190a0c7ff1325d78d67cff99adf691f39803c14b09cc109cea4077152ec5cf73bea663f5301973275e3ea757d56236cd77dcec7402c7c14a8b169f86f304da51dfe4a01deeebb0c6fe23363c314c0f648afc71b8505a8238500024d1212666e4e811b10c267c2cc95b6aeb18d2adcd5be2b87d6e9288f2469270a7b3f12769569e62765039be82cb72f2915c1a8bf4f90a6401af337a8e2e38e9a06311879eedae25dddbb54e8dda63879aec96b5ebbc44a1ed9821bf41c63cd2b11ecaaf213383e690f30259524c40cbb1540a258b57b863bfc5b3186269c785edef7ed8f034cee497e047283de18482afa513bae51512f7dbf69f15345d7aebfab555d10c6c9e7a09ac66df42e9bbf1947556919fcb4b49428bcb0052dcaf2da258625abef89d186b0ef730065abd1c6ecd75e079eb9f8a0a34e12c383a641d6307eca923cfdb96233bac73085b3c9637555c068495890451de619e2d6f5f116298f3f210666881f6618aee6387ededde6fad38629644cb9c0368d23509be4c2358f926e85108ba0acab16db8d38ad2b3c823dd8103140e6611038f655f41bfc1791141ea143b6a14e5f6f55c6f87d5a07066c2e16a392427a3990c2d336e10c65ae8000768792f0b68470401f0dce0c167ab3cb91f5ab6fb5bfb96d8a83dc2ac88463df244c2e212c000635719c983d385d3b75eb8ba0e9377bafd64cf3eab6420e4ac3afafa746bbc9817e029c50c801cb0707efbe8089a7e9b9d57bb1a7369a6abb440e44b5ae464e4618899b4479affcb9e3df2141c3f8468879c1cc8021ba089aefb092aaefb297400d181c335bf25ad0882f303a32db6bba71117ad3cab8e9503077e7a38748ca2f8094271b1644e0c47d2fda33d569515f3c0f2abac03b875123c5281033d961f6d7c94540ad910c43732326d9585103728ea9aec145e720439e87c2a679e1fe4e2f2e1c7a7650b0584a3b3d6ded71beeeea082b6d98ff4d41309aa99c50d312b298de5a411ec50df80b5f5f4db256b963bf005446069735d430183e6ad36bf076b5e337dfb0beb4f4114caa912b02419741d27cb9c8c223b3470c4eedcf71dd2ed85cb1197a473a0c339fcfb7dc0d2be9c469daf1ddb106da5a481e0971ddf5de748f490959e63e9c921bb6fdf1d76cf5efaf910d858e220d54f8f4b35ce8fc46f49240a97a65be724ca26377a88c8cfa5f1e9e450eaf7fcaddc46d03922fb12e5f57905d63a3e0c7801b0baee33918ea33d17ddfb73900afe1cd7d899a58b1da493427b4a593ea2c0aeb10fdbf220fdf16e179700583d63d579857f7debd91b23eab7ff14eebf1ed12fbbbbe7233dce73bce34a0096223846cf600fc69d8d15355472048e1054b200d26287b321885c7ba2f5517bf0e0f758a86110e9c0625e2920d595f231e07e40e1cf1104d7a43439f0c9d2df23e045149e184404f2e2cda3ed7df6c83df61fdbff13c0c75d1e41a50b12593257e5145bebd430d7d16f7491f30e0af63d8c5e31772871cd05f72e4a495ad02b643ca02f3ee6dcd05d0e24534ae514108abbcf9de3bcae2f90103e9d2ea608876d29d2c40aac10d5e51dc1bdc7bb5d5c0258639ffaa3cbce5b5d94cb845d949d5a14b82ab45ba760c1c97e0c5f5b3d9608612489db5a5b6d43d952345fece5b223b8b46acba3545a86ddd7f013dbd3f973ba921ac051fb0ea820ace801f4e04a299a3f2f3210ba5e730eb468a5f74d83b66a26d82a1d098ba8c79d9d3b6c4b433bcff15ceef81414047494676b28b73f4e1f4db7a430d6ceb1b8dfdfc59da974ca2b9ba6272f37c3fac7275d160ea8b9eb3a229500d713b9517f732125159c0d4429750923586e14a5358ffd0853e52fa6d3780241482c4eb8d8d6bcf5ec651f3d67f932fab263383cb6d945ab562252c91e4003bfbdc0d1425b0d03efee6ab7a579c54cdec873842220242d22ccd2994ea6db4f0fdec14c9c6d707d748e8383b65e850f00775b4099e7762f05a4d2096406f11df04e0ae8903fd71c688f8cb4afe796e7c5ece9e683d63938e6a407497da0b62505aa992dd48936af064530e9ffa5dc1fdca3073b48536072403350198b61d11c7365f757f51ba4651fa003a2f1f7eb5c2a924cb8bb264484020114d055ac8c7232d7d6b070c565bae778c3e211c099f6a90f9c7f66111324eca1fd8d76d6921afaaf2cbbe6b85d0a1f8f7284a0aa93c61bb1d661d65e64ec40b37666345f2f9526833efb2ce47ccfa13b6d687c1fb379d46717a01e5427de49ee40d779e242cef6a25e4caa2ba4e3c7eb04025a84c0f9545e3a5625480a28adae4523617bfc600358055ce82b5d869d3cf48e69b6939af7e5c2b1b85f7c2bf2d0fda9646ec331124eb38dbab159e879fef2bcf87740739f6ef4a0a7caa063971f9d4e297fd836b20bb22d5a9069a3234c865346796499ed3c8995f57185c52180dfb2d36fd9bcf23da72ca9a01b3766bd8cc56b844f43c2f36dbeda7e6f68d1b96994a0a6fe3eece3cb1ce7073a8216664a83fb1f69be172dff0594b46c40f1607bd0801544e7a400fbee3aef1e9cf3c400c873ca5f00ae4842e01f5d373aebee499dd614ad86814e6beb47e123ff4043170418a7513ed3f1fff3ce4d1eb0576efbe7b476f2774484557492fb13128f5491b85f35a5fc05b20ee68fd9e7403d059dd4f07531630a6515858c8fccda53dbdbedf6271bac3c3b8d1e0a991420016e450e1c671022271f96db876e397363348d09964f351eb4332b97394d5eebefa8729dc6e52481e80dc50ceedfdbdd8a11a6cc77f7d4ee3b119c06e031dbd2b1d55a069eb728ca9ec30a74c4c53a70c72e4f15db7398ab402ef88af689d4c5d21c81241ab3ee998beeb28054b9b8866160560485d84d246930205a5576010b02bcd0d165554598eb52418a9f7a076570700f6b52e4a3b06ab5120f5c0a34d2384ed559f6e783b8dc9f93b38c3c80d5d77783669cd7bf0b12ffa974723193e2a81e553ecd461eba95d4008d843eb3bdd99e6af6d6dfd26816bd24cd9ec0165214cf6da9b6f790d7675239bee2e6e40980b6ff9af5f5ef5c59566ebdd8b29b7b06ec8a73d6f17270952a996239ce57978efeba5cb586e29378c4e23f575ae28c19220a59fab298727564a8dd76773ec88a5cb2c6710be03bee7462dbd792e717d599bf26e05597a4e6a444b2bf4f3b0e78f2568b2d719f06e0e2e289d0b48d3121a37f78dc06c62630cc6293735c164a63a671380f9ffd669c3626a62066c46d00b29e9a266271cd832f837e3dda4a45104aa93b1672bf230812640096ba96322d63ff71f7e84e119e33f3d28352c97320b4c258bee5e145348585f385d62e7b6cdf21bbbbb5572da7d5c3f131a489b783a4316926dbb2a1b396e2f83bec4afbffecde575f76e6e40960a3dd76f3e68d051a5bdf72b8196dbe1a7366969b1a2dae0eecfb02d9010d011cc2b45acb444b812e8547edaefafa12694fb6a1eda7cb8cecb5fd007c59f9bc34510dfb20a0c56d2426f7141150f7923b8e8fdcbecac07800c04f51e1ad7d63f6425bdfc0e38dc34d89061c55dbf0bbef6331e81e7c6ef488625ad2cae122abc21d7ba99d7ad18a55d575250534537a41e866750000200049444154987b9a65a1c99392f2628e651b108703389008249f0fbe1dd7b1d2f2668c53a8dd9624d249ce3a82d2c25418bcb2f3e89168726b044315abdfec39808d629f3dd5897b10cf8b017c15fc1151af47ef48d4364bd6c4648e6d2849d4ef5a95bc1a02f85765ff4ae16409a062c39ab2779d52812512dbffa1ee6efbed4de7a2f9531a07b8b21789eb353df70fe21b9786a82dc991e78dde474480550e45efa9b627e81fb7c0fd5ef407e03bc58d74fe58352b6292e84d3d479cebaefb73212a54c4e1740692b2d8a7ed69e99d79607bdbfe96279970792f4b3b19c387dee542a246192ae35908a1d75e704e174fda69d679f0f2bedf59515e18923ea3dcf52f73b338751a82929b1bbb9cd69f804e89701d0bd854c66cfc3165cd484933378ae8ca8d399821ee1c9c4772b113e8a6b6de417b64cf61fbc68106632d0aaf3e013cea07c0734c54b7d729b7a9ee6f1adb1cca535f5064bb0a7bd50c2c2a01e4b35aee7afc535761755a6b65a15336452b37feeee633aaa34c9cdcd1d54157a41067c71c943f01eb6deabe6e7d89359daa65987635b78c7714788a7e41c6cec92666fc3e66394cb77201b45d8a14e77bf03d6f6bdfebeea454edbbda505bef45bd24b052d274d2240ddb9d4f1fdcdf78a7ddcdb8baf74896ddcc57a934b976e21051cbc18f13454d7a7416b261a2a36ff47d800d91f01c3d2ad8ba430ffbfc39ddc6ed9e225c4b306fc4992706bfa764ec1133e0f4585eae4d8c4fd9cec60ebb0f6e7ff43045d190b04a1a9496ec1906b14ca2462833a81b4946010f2940f0749f9102f29c5a91679b0f9d6d2b71243b480e2f1b5e5902bc13b80b313156d975e795976dde50515ecc7a3b91e5e525964ffb24252d82e8d600cfde8e0e3b7bc90af653605320c7fddac2e16a0a2618f9d25cb8d262b85f0a22e78443326d84a5579e403200a2de90a05f01ad90dacc9d9344f0c1a5625715397f46469c38d6ba8777340fdff5a3febbec0e7b9cab025b5529808f101b882d44811e64c8ee51a1b97374b81fefe672dde49f233980a8452f706744088ae27efdb97d97921fdd95cada6d82e3e08dfc558d54caa9e5e7dbf6dad7efa5484a06b7bb41492114bc268f942f811eadaeae7c1fa453d1ba112186d4f52c28bfbea2b0f850c1c045dcfd9a09200d3effe65f5d75fe959baa2b2c0f652313add7b55a023405b046d08631e58e42bd4b0b4b5d3f576d7fc0f932f88833d3d5ef1fe9b1b26801d704bc78548e1023d633b91f634fab45e963ab9ee6ab471ccd194e38d02515785151baaf57557910f44c714308bf80b8fde0e1bd4d3bbe3cfd1d6bb2462ea83af5d0c3c45dc40ee2ab07dc2f4713c92194c37225f6e052a2396085944af8f2a2dfddc38fcae9f795930f41d9e536a6b24fe01bc834304f922aadaf265f952922c8662b1e11d707e25ff5e1cce1daa6627901c3844b06ce21976f12f5806386979700d7dada9b57d75f70d9ea3a9bc2a9426d1b8eb84ed9d043dc43052cdafa21ba7435acaba3b17cbd8bc4914aef89c4138344fe28daff0ac6e1b52f678c0436f7e950a3350f76d82cc3b9219a92a383caad379f0faed2dc8f386ee1355c4228d720aee65fbc7bc79eaebf74ab784aac2b53a0c4abde733e9b1308a1242487649a6bdbf55cde09353c0941aab9f13f94d553c851a23f78926b0ab8534964480aabebcb567a90ea4b3d10f94756426aed6a94f48ebeea7c15b02fd1aff65f0adf9cf8a7748e101cf0aa711270ae381b6157caf43c438633898978cca0471c3b54da2567afa8ca89d3a03b05d89546c08a66749b22e3fa88a1033d5d565758e52ac6818e763f4f009a84c1346828434ba2459dff3d4a14fde9d1e9fd4cd91ab7863e66cb88fbf5d2eec7bf7faa3e7dbd0a00ae8b105d574935aff4e4a4f322ca6108ec1fefdab11bf0bfce8551224e094c4a33b798e311b6271e58c5c93f57c02b2af8f17a8cc3a973be0cbae6787d4e42a8bc3a2342e6aabb19e591eb8e535587eebd48c139114101f23d2ae7ef80fb45278a2495f8f76dbfb81ff14fddab19f5a39efebabc8414223403a79487abd95dea4ebccc0f591e33b012925db71c8b931f9913377b57295f32ed8b1098114bbb3e303c615585455efcaba4144a3c1e0cfec8bfae176f9dd2ac62ee91580f235a35dd7590f9f058c49813ef143b559670f5efe00a26c01dc8fc7aa5c95f77a050b1be7ce84b74c9bef1f31d075b3e6bff87a46ad7f56e4f131f216a7ac589079c7871cfca95909f93362aa3724e95d169fdec2b4500b62eb9f2296db0ef6e1121d07dc48cecdc50e1542f192450666c3c1eb751f4a04deae76970472105beb612ff4eae22fe7d0f404410108317ff92cc9a844336565bc22a1ad5b6ce6774ec5fbdca4bc359567dc5d2ea0dc551263a3a838ec0f68007c04bb14b6774ac6b74c84af098f19cadec3cb10492c2350710c4145eaf51ba7a3aafd9b48aeafbf78e0f02a2eceabe281e5855a02a475b40e6aa38c41fa72a9a03e7dca91ac69deaeead8d7dfbbf60dfe2480b362ab32788db89af3d5458415934b3509ce6b85f65e26f92da951896f3983bafb3ee9a082155769d73fb921abaae6b4213675fa4a1143781a8fbf46e71ea670cdd659297952fc459a5743cf877b79056e25f310d0e97f84f278a69c4fd1ae892199c438e4500c8611e108a24a3389356a57261f3d220545f1a56d92614bf2564c7b514a800eebd783c078b10e4b2dd32306095b4ff7e956d1542f7f818ec2778a1712648d6c70a21847e1bc1e1c2bd3825ee1d1de63dbd7857419c247015e6f9ced5803318a4ccbaaad554d06e3ae0ec6cee9eb9ffdbfdb7d3d24bb993d87f9c78f2d3a9d7d9cad2dc68a614cf3980796802ad9d4910ae920347512fb944a4a902ba8d48979d05fbb24da82e32518aa5b06a38405db951d6311c420268f8649ad5c90bb1eaad2d9eb17d03e4e180d7bbaa094871bcb47fc7fd3a56844010fb19f8350c23611e78beb96bcf4333f7c302bd1442aaa5f4a19784631340b95db4ae1afc533361c5c5023388a27d812c65a86f6cd84e2f59435a812f62090824200280e38aa83f84f97520be0b8a479b249d3863606a84c2ab5df7eda2af400fbeee511ae518b4f5ae07c091828019c6b0f495fb1b9fb1879def3c9a8fed209e3cf87a40859db1a4241696962e0c03709da136c0d581ab8b29b053e9bcc4d03d4435552e072e52459acb980ff304d2433de731e608f6c9678e104741d4072a6af2f2f03d18b42ee6067af14fcd03b613ff809f41bd4917c8a4ef9f46d7a07b7cdcf6ecefed3cbcd59ea4ebfb240d5f3fd9a907a406e5040880a5f30eb178e1b2c272cc8b68f632a539aed696f65f5d3b0a2253663f0fd558beac791e7cb6108ed703a49322fef1c6cd40dc0fc5f741dda3dc2b1dc29b52356b362aa0c9cbb7877a0655e34481231b5779222fdda334baa420bfbec7f7b68ed8b7eda71caa006d4469fb8b1358fd65192b84cae2e7ca47492471faf886503ec3def20f10817a205536451da7f6e7aeb992bb6b1a7cea63cc64290b5d6bfe84ee41e84300711c5499a104094baa4c2365b033da4626923cdb3be4385ce0a723ee23809e8e46988e489861c9d3c37d0333cfb6a2546db5a7a8896d6428b0d580087cf58064523a6638b604d86f9ffe9bb1479b7fb6bee1f7debe69e3b2d36a96598c6148b92d078b2c0ac409ba6eb37c594bb369b4369f345be12049e0a481a895c28e26c6a88a761b4bcafa8ae4e0adc5bd93286e497a19b350af2ac27903215bc989749e08d0c1d9a702d94acc2a680c41f76b22c59d0ff63e9e12fd4af82411a1ba0821df0a375446cfc963fdde007cd703a10c132cf254ca648eb9f33cceedab8c6e3f45181c78298674d035363300d83b34661baa4a2020ce7132c93bebcb249a053c400356c879f50844089a34b2a1206a0d0c5aa90b28cfe6503a8cc7e4da036df181b106b77ac833887ad938c861ce7628ee570f683f5122f798e1d8047097b3937f7e5b66ebce6d57b47ebcf82d399bdf7bda19c56bca97594d2146a16c8dd9a703c010be74d9b44599aeffefc1f7a23fd8d7f8fe288e9433a12e2a4153b07d9b2650c719e14a0fc007d030d75c2543fb0b89c0d9f6557c353300a02e64061cb0b3b17bc2ee72ca9ea8fd39e2cbf67775fb0985abede2f36a6b964aa1d2c8a583161027d80b038cbe1ba0a166a9270e5c9fc2bd9fd29294906a16d877e9381ea1d1d7ec26f9ff7b892766306becf64557f54c72bf7c2a2579b4c6823e9431c9d4b23ecab1a71f51d189497b37effb845ba37c90078935a4fb08cf76e20bc446e2cb02cf35178e4d00c1d52956afbfdbbedaf7c0d843ffebba472f5c7b5ee8bce56575451f3ae766ba18794cad9ec0c931c73709143a50fac4f58a12ff334cdd1a98d989a2eec59daa3224ca575785ae8f2a418a8f52cf4204bcb39324e28a80d35541529ec4dc3aa7204dfafedd9dfbe0fe6e0e25f25efcad00257beda1dede75663d2bb3b8f65fa5569313c2ea39c57805d5e6caaa3279e27831e03aefeee2464f10100ebcd18b2f60012b85a5d314a8c977ca23299bfb908ea217a21443352f8ab219e4f0ac529ad9ad3f1b7c9406ee41e017c85218a4f308781a0f67f23dc4568ab08a7b5ce19509c0dc7cb39f41f6fbf471947d77cd3eb2ef931d1ffdd85b32966bc28556e0cecd649954f6f54ce9066e2286e0747a802c73bb6c3a3c80f222372ffe8430604afc09f4a969ba34ea0e01b8e37b552c2f0d7391976a849c53225f842ed12fa5b16360d47ab7b86e9e5ef600f1b5f5f5f58017870b6cd545ab0aafd0a20e6eb9778108c22164701fa2786966d4e93f7a670fae32006ed28810a4137892f1297c1796fb219c36562fafccc5d9957a50fa2443df13134c8393b6af3761334e9ca27e66a407e01729c711e830c9db3ec19b36934afd69554e2b51a2bf89f8b2ed3cd75e36bc1a01e846b5a9fe21aca550192bbb354a05f0362cc93e65651932eec0f17a734708811e908eb863ba168b25cff05d3e955ffd75bda3ab4cf63225050054caa4daff304400ec0e6479e8a8123dc7c3f9709f02c9d178f129681b18b7871df0349eaf3ce0e16e3c919f33ec93d76d5855e0cbaa52680f360390104864f27cb9861f0b7c9fdaa777004bdae94fefc867675a7b876d7595d618f6e7581ddac60790d41af2151f510522007952ab3b389dd4974bbc3440ad0bb85d6d7b0351ed867f183baf2578797a7c778a101aab8af24272d294d237411bae85157cc9a5fc05a29ff5815833b77f6a27c5e36d78795580f45a5719fc6acf733e454871831a4af74107d72c904695e61c27a810da093f554a8e1d096beb1c66b0d6893e8943997d17275c6bebcfdb5074dbf2329c40305d07dc9b469bddceda0125ac70e2f8dbbd93de4d69544e61272c744eafac77d6192217e59fd84bf72f86f4ca45b17304a474a378f5e2fff07b6fa9b25011b7a3c641636eb99c697a5f6a82242d46b4143aabde90425d5cf574d4bfd7034f2a9c0801e841797991ec5c8d0a3a714f7922f8ee07edbdb713a88c21c047f42787a9182677d05dd1c71a7cf578127044c1cbe5f05918293caa2c198c5ca541fd4e0b7684c03e77eacf490a08421334b7b64fa97b23936f0b71b1429811d0cfbd73f36a4ca00211f0bce0b129448fc645628cdd3bf12d60792141acadcae78e52fbba5784e1389f736106cd1a0786ac92554d94a78882374ea549daca2545f6d7e7afb65bd6335acaf556f0767a00f74a479a88b3001286421ec2d1e285132580502c33177d0c909db85741e6395ffb9a593b9268b11144bf8e55591ae61d654e9cab2471bb225781db8a59576f1c0250852badeb0aba2d80e359e42749a2f1a8421d28219a1ef41f79eef86e0fdd8b450aefb577fff679cb6eaa2ea4ef2fce235b0129ee6f191eb25226bcaadc8eab1d0c02d891c0dc39bda3230c07bede49e97917dafa261688ae62164f02c9e2882645f04a338d295896c1cdb515f6a79b6becf232ccec68fd5a3842cc30368df56cdce9392282450b27460015ac801aa23a6408025c41e8fafca96379fc4c27c731946ca7f2dc9bbbadcc3e1aac516da8ba14250225d28bb02f4cebd89df7164179138b10e6442b0422629004503b34c6e24ee8fd12fbd2fe25054e3ebccd56959d6e7f77f5a92bc20ea0b912f13ca4cee8e8945bc9c3f75c4418bc87035f64ecdf751e7c49349f46e7046c07da7f947aca612551dde7c8465b12ca19c4757fa90f2d96958394b964d5327bc7ea0adccf12d6cf449b066693a1fbeb7d79d8e285132380755ada3e9d658e3d01c8483b43e5c82aa873eabbf74ded46a40f3ae5cd89412a40dd3e2df93a0635bbe06b07ee4e58210410e685b572e62cc74ecc3bd148e58860007f8e18243615e573c8c73cc94b962575874e2eacc656bed6befea7979e5b291f3f0732390ae474a6a335f461154db964fbb65db00ac2007c073de905e83cf80e5cde219cc578455b275f2067c954118d033dd84a42e859dcab3cd94afbd778c3129692bf725595ad2c42e99fc6aab7d60dedbe266dffe52ae8c408e0058dde86b0e5627be64f53bbb4e882385f132cc7125d2ca3b69f67498317a9f26a0026399145c58e32f3565afc5c25521192232b585c7968061d41c9a93069c8bebda79a5d162204af0953bff026b9e3fec6ad8b5119e97c5bf02b9fb97ae345cb58d051a2dfc129f029733bdc2753758e14374051193df89e087482536c043efb442fb9b44f77961a1ea48e868726ad2216f54a1de7958fde6deebe14f8be6e38cf2b2690060a2bb0b97c824f5dd67ed87ecf3e649f628857ddc045092746002cd7c3531381d8cf6112c7241f5a1201e883aedd93cf039c07d28b352a05664df22205ccf0e9898fbaca75559caa380db4d4f06127fa564801558cc05613a00ad5fe4262a097000568140c5462944552e06442d87edfbefc7b57ad7aef99cb2a18a964f12607a24818ea825abbb03754f271c797822ff004720a44cae9c007387fde973d0391bf4ddccf3b6a88d64b0081ef0944ef3b1f17e497ba2e62d77232b948a2776e2a8b5c75a9fd3f7c49e42ebbd9ea4fe6c5837b4f8c00009faf6a2180a5e96b0c20df0670f4d0e2c983938750545add79f7729e8fdccbe92572f11d18663a94941a5edf9951795dd7d26652dda7552cb31ef514005f4a8f13f529691070bf2a4fa231534671e69392d1c91040967ddcbef8bbd7aef8e8a56bb450650a7c959bca97d1673f6b1bd43029433608075cf04e3c9844eedd1cb72f04dfdd4ff9b92e2a1a6331c8bebe61ab2fd5f2327ac63c81cc713fe7d45bd2354f2029a27052c1eb07ea062b6ec221f73de7a75f8e7ff6bdccffd9a0a29c4c3831028859f648623a5d460a39841446f318ce1da3f2980fc8573115dcac552ac15378f0b28853ec060568d19dccaf97fc5ef8b29ae552cbc24df56595d8bbb18473ec0743bc24f03d016f231031285455d81236f2773bf170364b2fff917def9337adfec455a7d44054024c950ea8649f0ed71ee81fb012ecfd5abec5713f683ad14fd91ca707e9535b27ce17802f02d682905b5a3bad9e69f21a5350d1e7eff5444276a9ba0acac05604c57975ffbc721848461c47e80195322be41de7db0ad610ff81bddfad1e7ae27590bae3f809808f3a2cff7f4fbde74f2eb965a59a00516c5976097e7813ac9af13c43be0c3e01b28aee2a92caf444e0ce20ba1356158959831658505bba209dcaa20a3c7b491d33732bf880e2b8bb3e27feb9e8a5822480da14b39af2eca538ad979ef09bdf6217f139a67bfeea96d36fbe608556294d55b8ab6c0679e0fc4343831666c4af0cc54fc4e1dfc0a1972ab7074f6576120022502a115170ac7183017a6e2d9dfd56cf90ae86778f05be631847441ee460c471be597039732ff7538424238189080b084afb99c5dd2bdbfee684eb60c10dd2c15e3ddc66efb8f16d577fefef6f7cffca65b87ebbbe3a44909d1eb547db1f63c8b2cd2d9ca08a52a97c0428fe83a0b319288f5354ca18a2be903905aa2cd7834081741e46e8127505e5b4bb49064df860331e903e37726647513ff2d00d6584d3f7f48f1e6294e2a1e019afb83d03e7a8dfb2bf38ffa2dc2ffff72bce5aaa15bcfdfac42aad2a1f572bfafb8d38b84c8f4ff329da18cd93bfe60aa154024a7fa4f5d113c0c2732e0d441a611188071b8ed85a96a62bcc65b414760e40758ca1bca1202f794438be0970cd02e5993fafb2e939be2c8928ccc122933f7a8e2ea386c1182d6609e9434c7a794d8361af460061fb84fdd9a76efac0173f79d94df9b95ac14395af6e1f604618d5da3dc877ef667a680eb49a87aa6261d0d17cd44bc498437878b2cf0a510a35c5ca199200dedb15b45a16b35aca9658229e6b4d03bd9c9f724a9fba9cea4f28aa8710cd42bcc607a2f6b07d874cbcbabcf0d1c1fe329a89b7db07ed12fbda67ae5a7fd3f51b5765680e9de76c4a27b622bf7456ed6a6491aabefe31be144acba2564e654fbd930346fbee546aab14dcefc1f1fb02358dbcdaf8ec4d734bbf9db1b4ecd8e0bbfb82fb05be80a6a723f136d72479f0fd35ae8450b50b276ca47fd6b63e977a6bf5bd67f93efa19f8006dc5cbf604c3cb13803e7ffe8705fff40f377fe253ef38f32de8af6ab7791ae06b98573e00fa04fabee19fb3cedd240b2ee73902d0f305521004ffc2209fb608c0ef1bef61540d3d4ee03b02d06450af5c6ab6cb32be00ba24b6d40646b02de07790c0c044af4c55ce9ff34b62b2ca545943e1f463f8c0342c7c064d43d42eb5d3ed0afb64f1b5f63f3f74c9eadb7eff9c75254b0b588544229f8ae6657c4e6cd3f872e8612c7d89f1195b5352e84db502844c5de52be551e0fb6b73f9a488c24934ee09e584ed5ebe0978016e955a584ae97cbbae7c5252c3e5a7b21c0dbe4bbb203f4714eafb1213592891b909d382abedcd3c480db80a99ce4aa2b3568b14b83d7586cdf105d5f84bc359281637d47fe33b377df09a3397b2cc0bdd3367ef17e7ab0700f78b203ac6b6b3ea66d29eeec4e60fe54b94fa20a2744ce40eb5af23f1afba71c5707f1f0320fbc67a6d43ac8a4ae04d1824f16f248f21b81c915955506095f9e7b25ccb7a3bd8dd86446866906480e1e00416a049a64e53bb35f6a77c64750c13490ca5680de6920d68069b6f585ab6eeacfaca74cdecd52c5a3957784ddf15869248a6606ac6d5765f6f9f51b7343f05802fae4b01956a1a049a3bc7ad7eabeb415c08e2ac6521fa9f68edb15abac8f939fea3107a9f8c98cce2bcff240f92ad813a0d4604556ffaf3edfc3c41049c2ff065fb9ac999303e4d685b1afd3bccfd4afe85ed46bab41f65bdd0afce9d3f8e1dd5fad1e16acc0ce7d5dcfe9feffcc4396b98eaad955024f2dd9f3814f0f5958df144afed1df836366ea661eddb6b3756634ecbd1e48ef92c0538759c0a22d7f9c374dafde746ba718eccb1f5b16a5e5f5fe622625c725b9ee50c4cd87b34d951e7340430c814b43e16779cc2b3368e816582cfcc4cc443899ee927d3f2e9b15514e6302b260b0f59ad4ca68f4a0a3dcfb162178eb441f0846c243965fbb1cf57e3d2568ed5cdfbf8096481a1d26bab63812d887819770d2e565e413ab7f556c34e3e44f9e49e4376cdf295739c9fc6ea1d59050c2231981471bd0ad9fe13cc8748581c67d069b609dec777f5d455141120f289aea3cc712263ca126553d60cf7dff3e8828ad4fba88ee513c5140d58e162e644edd4e9e3092f96001980ffe51f01feca926a967b854b005ce07b319d1af8410a748c3f0f578d5ae66c36ebe0e7b286df809d9ecb5a3f705a80b96821f0e071b54e8904809a1189be3311f15b588173df68afad8b557245772a8a5814d542210d24b1392d9fc40ad6c559ca0725b5c69088424d110b3ba6378d34924e95a626543675812789340f3a074ed02419836f44e4f70f4fdaea824267e5733a8180d41d73dc2d907d0eca65fefc7c1a4f085e4399ce4ada7dcf1db6ab962cd3a35c396443c82dccb6b6b621bb7deb217425b3d515e5b6b43497153f98155cc4095e55cbc54c43e171867da72088690863360e0942288e10f2b09fa0f9df73500524aa7a5455aa22a1a86d26fa4e9a7d915ece75cc853aae31921713809d5f5a5db79225db6618899a13fbe2463d0162d0648e49beb8d937a56169bc5528e05a967f7fe050b39d3ac3b46f551e579c44176a8e577c5939a0cc941c0208403ea7a0d65e181db0ad83ed765a7e0d931f44cabaee9b1997de1dab598170d0b0a7b1d085015b84344bf7b26fa2996f01c9db58d661055f06154465511924c53046580f8b3335760dd10c456d5369318444e5636973e928bb08287887f9ad88c9e7eabb6dda17f43aef4576467ec4eededf6067f071c840f44b66c4407c8ac1ab077637d0030adb332d497be6390630234474cd5ae29a9208369002b77c5c563462d934239979345bd85ae2d3388460429704685495739be37621a7aa12f00b89a0047557aafb4fecefb8f2aae1c504307d686ce0004ba66c2a442c8aed82b17e9c901d7012cbdd130cf8cc0cf01cba375443b17a072c7ddeca777b34dc2929e06bd4eb022a852ad81185c896171331394079c6297c98a17362dc9eee3d622b6315569dc3e7d6dc5b7942f1834f6ab15f149d24e1332cd3cde4459e4229f52c07ba7b2665209b7eb4f2967e9696c53b696d7e315c2f572b142b35aedc1d00ec8b1e10904056b6ba3e0f762057dc7928268b65da9e68ebb06c5c7956d4e993394cffe47c765ea64558e9fbe12d0d76702c697534913535e9f6682eccd944c69d6cda89697881a4d1a7cbe61c04b18aaa5f82a1bb2497ef17a05086e90ecb9cfe3339be09f4c00747e82d2000aad42d20c1904c35578e2bbc9800acabefd0dec1b131a67b31879f2cfc1c000f7e1a265f0df776e9a34968ceb3f29605c030957846f9129c34da50dc56bb0af35cec01712571a3406a4a3ca8e4cc69955eee55287cac1852caf77a9a8606f8d257035fe65e6265accce9bef09502de490eddeff2a069821827986934893ea2e0888c523ba9411b3f49a50d2219da06472d4aedd4628f8ff1e13e3d6fe1a00f05d6bff839958fde2b003eb52557e7c7e09444cff52296ac1c7a342303d6ddde6f97d7d7922fcd10e067007c5e41ae1d6ce0a3d74dfdb6344befad9066d756145b63f680ed3d4806b28c07204a99c39e766088286126173945a1e4db78731f8d09804f6df90e87f1e152bad6f8808f91e343ce5782f563ddc2176c5e3e288ba343477c772f6beeaf646e9a56bff45abff811b1842bd8183607cb47139fa62f4d1b152c98548bd7eae3d6689dc36356cae44667b20563c1ec0215eaec078039ffc6ea19e84f1ab27cde2346678d4992b87c0d0db3664023e30d3956915beae61ee631e559e59034d28c634d36e9c706c1e7a810285a792b0131f0ed5d94c3ceee11a77fe4617e5e539f7d579a00001e0c4944415450c20254d23be4668d262970298538d8ef0b7a0f6a707e8e005c3a5d4fa5015cf7c736827b7c537cc4b61e68b26b6b56909f6c147c0780fe6a6149ccfa7a47edce1d4df83e82a39a2d4a2f2998a03fbfb6ac8c2fa08cd9438750ebe5e2117075400c2970e93c986236ba446634647b9dc320e9b91e23e6710d41c1686b3a5f2d65a7317e0415b08f149b893f27be6278290174dae1039d6d9317ac38354b5fc19603a67c007310f39a89b3ab6bbbed6beab1475f68833bc3f69ecdebdd4ba523052ea858668fb436d82dabd7d17aa82a7d456b3b2fd2f5869efb1da73a021051f8f58435ce108d446d1d6da2c600867183ef1e198240e8a7a3d1cb3d3c1d3fc4f45026959ac67af95b198fc060243d854a929d4116c7e57cc635c26a5c72bf569324712f50f593da382039e308c181aa6b5c3caaed5702810fb822a0e0ba4cc6dd21562edfdd68572dad738b3bcda04b281494e5599c59cffff5fc1e3b80e256c7bc2e0fbeca9faa0bca54855de2964d3976bb967b1be346a1a14815e52bb29f9d023793f7c8c248760912a71583151f158100785fce67d34bcae6da30ba02d3409e21079194065d5e35bc94000edae1fdddad4de991cc35acd84e65a265a39136751f6145ed47edafb67fd5bb230a43261e9d5f3768f5e5f94eebae438c3f93d1662ff46801c842fafcfef9e271b5f9f39c3f4f04fe1ccd09c0f9fe06cd842a5ba919412cc51e5fc9d73a344b59fef281dbb9482b41972bc177788aa2189454c51080269a2838d32bb9a8eb28d402d075cd81ed765280eacc2b00ef7500a551a4c30aa7758727ec41c0bfb25a2ba2d23422fa75bdb034062186eda1ed07ec51702d46c9972b3b45736597e2aa12f28aee990574593fb466993dd7de697b46e2b89d210ca0922c8095f7b180976494a38a267f664abaf015f55e3e3fa759c499e807ea1d65637ddcdd343a8818de41f6aabe06bde2ab859712c0211bbebb7df7b62bf76e593332366a3b5a0ef241827dd6d9b1ddb75712555256d426419d4f36b65a6d69ca0a08875e515d6f771dde47d77093730655c5aa1d0f144ac7fd2881812ee0a500d0ab4694a16bdfbdb2a7851e657df4c06b0124c43f849426f1cf8723faa79a48cf7703a924976f003847024321b5391a747721d5e6a780f769a5b72b788e9f033e2010b836c2085f7768c2eec7d27779792de063ec51bb0f61e46283c8a299dab2b3c96e3f8068a71d57058bdc1df014d3bd2504e1df5fe54bba45b02f5e0e213172b86368c48a9018454841819e4e4547a01eeda761c29627b508a180e6a77f6cca95570b4f261976e6fb1788433721540eb36a065e35a86c2f09c9e5fd7beedefef3d19f3ffb48f5cea6ddd1d1f14e35bd72c2f06d951414a23cc2bbf8f0e23a9c280b787189ec1c404af082bb58326e95168da0829d780634b5f5cac81df36aeac73b0d1f50a5d0f9b501451c9205de44ecce7397b343401c4e94ea98ebbd937b98708a4ec2febc78f6a0075c2e32701a3c20b2c7bea2f6743ed817e0ec3b052f38cfb14baf632f292288dfa6e951be028ed85f52cb17c1e5b34f1792e6253b3fdb62cce17be140a7fde3d60e87348ce9da6f7943690e8456ed1090326c65702c8f234db18b40c09a34fac36d9dfb26efb11f778dcef6374dc6c389f054461e1f52cea56b984ffd4ad2e4e096ae696531084fd2432f92c3f9fd9d3d936ddf4dfe1b04205f494d101511bc6a38260130ebac17bbf203cc4469c5f7ae855cba1c56114820ca1e122006f895bc600e71783cce071ce9bf10d4de2e89ea132b6d8caa316ecf3774b1910118461bb6fa6cbba6347ba2109029821001a480f504a0f31e686dfd3d3a8638d0450460dbd8d3287e3475480f0f97ab0f0798f6f4c781dff3bb0e6895d31301c06a1c49d7dc39d21e955ed77511ce47e3da35dc673b0eb4db95cbeaa874a6bda5c61532a98c18c69e234dbdf685278fa0e591190c8354b65ca2c4b980d7c44ecd299469dacdee45324a7a497c3fd7d035dafcd5f8ff01ba1dc483f6983d3db487cf0c374f1ddcdb3fd677706c78767c629409c1a1f4acec48388b7bf2208c62dccc261961bde391be6770117994278b00a4077885849d570a20f28a6107d3109891e826233c60b50ca9aeb615d8df4f1929b715e92596578fbd7b0c278e039d03b606df764901c9a56b2b57dbb71bb661962db0151a428677f565af740796e80ef1ceb113f9eedcbcf8f776028e4923565253a0746a2e7c93a10f530ff3dc9e1490ea3f79101d5efad1b1db887b2578fdb1b4799726d59d5322ffc769caae5bbcc4d00ea506ac59d4f087da9b6ca473d2aeaeadf30b43c8c44c5e1134b52c08a0a5b9df3eff78b3f7525433c9232344d7f673e874171df304e9045266d533501bdf3a30668ffd74f42e5aed232495acd5585f36ac57466ca45bf71c0d4adab6ec44eeb6b53d7c2357d14aab4baca418b7acae290618eeb5fbb947157b9878dcbe9214e955835028215610971271e06365fa42b61bac1e8258cd7a42a754b1bae91f9cb7319c4b3f5b15288ed54cd8ef35ecb477546eb63abeedab411f5912f52550f8802dab64487bd739490624c4dc39b7af369f9530a813b77569e11accbfbd93b8020cfc2045109488e001d7364500ee24c70b40f7e9e6bb7c42dc73bd3248e9006c45348c5cdb7064c6ee3d70c896cee4da699515e4c41f524ed7359e90bb24dbfabb46ed6f7edeec7d9403fd0818f389c540a2859ca3c46cd614c846a1cba2e3aea863b5dddfbabf6dabfd2fb7b691009412f7a4ca4950dd4bb4161355ffc2410db1884451f829ea85b515f077108fab07403a4731dabe5250e6eaa4741165896e21f6d1d160c01b5bd6f3743c1eb1a7311df4f495f6ac3fbda69cd9d3aad534ba29511c3e4bed9f59b262255fe32c668d4071bdda7701eec439a0aa3d9f13fbbaeece05e9e69b01cf45feb87b621fdd3f3c9099842abc5da4607e2b8002cef6dd3fbd843be7d2a678deed93567fda17b86c9d6582a5a1f6e1b770ffde563b378761c67249371979c888744a2feb5c1a4dc104768b271a873c24ba2cd890ad5873bd36efc43fcd0004af69ed8afafa58040dfe3f77b4b64d7d85affe3104c05d9ad3ff083110df3cc5812a85ae99c80b5b13b183a8d98434b22ead4aa5b47b898dc4e30ea2b8130dea63caf4d6406c2276f3e83184575b67fa6caca06616afa13c4e2beb0c2bc00d6c7d7e95dd7164a715857331ea88987d0df92e9dd7ec03a5cf114240000bb601f87e1bb2e691279d15507079003da87ef4ccd7866a648e100282e0a4ce8bdbfd7d1e4c0da5e97c1ac3c3235971bbafa5c1863ac6ec8aca5ada5926af20cd9c3148f793979fd4cabd50447e2112a9b3cf26782dacbf7e14067e6410905951e8cdd20152e04be1d367efb391004f35b68eb67e13ce6f65ca872fd6436c05eccb0515518402b5c990ecc07e81ed3ea288e30851698e3bbc16025898b90c99f242d1830fb22cc1e3bbaa47379c5e5758a7a5641d1bc0a1f99931ac71d5f6d3237b6c1c85b12ebf12512faef7dcef9543f50a0249200901a7eb3a5b2711dc965e00e7a6f90c6bf3f02390be1c484500feaddd56acc91981c48ff6b47169e641d7b107de5fa79f0e30d3d119dbc96aa68f1deab4f5698576665515edbd6c0a1aa255761e7835038eb020a21908231b1d609a15be9eeb8ebb8f3654d255945956794b07c842f95bd803d05741777777c477dd8e37d31637740bd938c54d12f6b504490061a1973fa120565caca00234d242a545b120cd6a7d000dfa2009349c9bc7b7003eb0e6421b4461fcd69e8759e264048387da7ea509943b095f15895a73dbe0bcb6fe9c9a8eb1693e50881248fdbbee9fba806a975d1448c87179e7f85945024bd7746ec156d739d6c28ab3393376303960b7339a37cc423d3755d6f0b95a2c914c56d1973d752fbf2e06cff15d431100a6677c14ea2b69aa29e2983a1594a588ae593d1a7a09ab9f425b2ea8132bcbddfefeeed96d3f99fd4f943b69ebd21a34ccb3cb25fa05ff9cac0438bab8efb1ab2f3bbbe0d3a75557b22088da70c43b31e8dfcb09e494925acc9b11bbb3f1592679c6ad9a95c3b3d0154428fa13d7cf77138f9600baa63cfa271bf1467a96fad63a3d54f8420ee7c073b5d801f0c9d95ff7225ed77442fdee99ec841d98eeb3fb9a3a6dbc77dc2e2c6229f4526c17e4aceeecb1385eb97af09593d2e0acc1d8435e718e0de101bc9f56394f9f810574b5f37999f4dff9e8359d090c6228504303c96df724efb01fdb7d144d9c2ff1ff203168f7d9fdc585c5248034bbc1fef1bd67af5e99cdb7fe048eb8d5297b70b9330049c4b3b784c19d4dc52bac61b0db7e86024c0fcfca5945342723c74b042447d00478f1ef0d405e390c630b7f9e513ef576547c07b730f580e88cdb9f07dc35079c9738d6820cc3e993b67bacc51e3c82ce3510b7b31979dcc0e08cfaeaeac63a6f9c90e0f54420c05f0afc3c21c8272293317c268fd9f6b638dec53c866e9e1671d478892c771ac81a439a3c79efc47fe1b9f7633214f86aef7f4e9432f7868457b3031c7fa1de636fbd6855fec5c58cdec946adc50ba5f18b43827ebdc097d14695ac01a66b979f67e7f3b9f4273af6d997bbeec0a2b88c153237e20f5089d2a4f942a487785cff5f3a007f0ac3f10ea0215ff251f0bfc85eb7efd077fb6080446157a0a32fe8736f073b07f974ab592dddb1eb0a2b0146eee9b86431862fd70030f3c083b907de6fe7084cd943103a56a3e0b61c4fe0185bc138405a6494c92df493b13338830ff682f4b48465cc481a4019fa009aa75ce94e02ffb8bb6ca45df4b0580410c238f4876fa9af61d6909a4265cb7b0a7cb1b7e3d4e0584400715081f2d72bc82ab4b72dbf841530266c4f6f93dd79f8518b83c26ac05997bf86f574ca9951940f77f28957c47f3c3941d3d1eb8c43c2966c789e38543b1cf198192a5fc3e2fa3651370b2d1e199ac62b07ab241cbe910f4597d277d7a091c4bce6e52b0fc1e984ba03577682d439b65ed4b35d00bc1e15f41c42f8ee8de35e565c15b33351059ec1083b461564a03c66b0ca479c38893fa086a62bd7d9d9ed59f61fd0e3bd64a06edf1b1a168700de69179c5e977971319f3bd1a89d46e53ce812d170b02c7952081d31c0d7184542ac7d230211136b25ac5cba8b172e3dcbde52bd1917af216bc445ecd9b61d288d435c4fc73b261762c977c3a3cda38d10035e348eb0700ad5d219e43199986015ce596628c38108042ce5568e7e712e1e46f938654a01d3f3e43be816e564df2df58637d34cce14d2026e1d6022a8469fb8f64ac04bde382f5edec16da7f818c67496adaa4ab7673a12cc0856f74f44c09a4278004f33cf3f8e0fc5facabca2f6df1e4ea3f3f78683cf2b3856d5f6e442b57dfc92e57599fa5a8817f301d8025ffb5e8c0b307d225e8b58276798258473c3344e25de71544d035a398a5e790e4e93f94b99c3751e5a38dcc4429383e323363a8557ecd83e1b1aea44f192f22ca687cb1880e2db257cde3d6af5d47a6e9ebea445a7124214cd6968581aff94a49344bbb81ded7f864f6ccd44011e69109a0c5967fb880d0d0eda2a26604a021c8be35f023c65700400d0138cce15ebfbb39141661a536e5e3d1317f629d9fe25099002f9fa26d0b2e17772db378829d1c5de1b144e5e02dc62ebea6a426f2dd5cae2bca456d616e0e27807ace37a6701778a5d794991f5f44fd87fedd8656f59bdd66a4a9618bd2dbc5f5503bedb47ddbbe641dd270d25176695f2a5912ac6c773aca41ff60e1503ae8c4d3e785b40aa5d0668cd23541f11da32eadf1dbb6ffb0244180209334293ccc4db5696bd9190b5774c30ac3d61d209156e4e633e1fe5745d408e692cf84b012d8e4fb5fd025e524c5d44957902c7955865be6da2683b3095f553bbcea1835e42060ac6044d502684bfa12874feae5b67cfb07fc70af00607903ac9c0ec9bb79fb5fc8a623991069a3f824563f6ea01c8d6afee9b387b5969295c60f677f7dc6d3fc6b9e4c78d4fdbf4107d661c498af9ac7a84f16567fc4152404a8e60bc891862829054c987079fe6a38dfbe03a79cb020c52433101cbcad74f9ceb5a73c0d5f9105db2086d6f2e43b5b112c6eb31d509c081ee71dbbbbfdffe7dd7b8ed684aa02f903943dc8afb86676d6dde0cf67a7dd20678e59f4fbe8ed395bb039e63b73fdf1be091168e61fc61aec20b1de405014809c5b8e81843dd40bd577e6e56fac161dab9a79c1248c2372e9c9c04b89801a1727bfbd2fc7c2a9f5713e7f3823ef2b6d2c8740c975495c8053bc3be72ef3df6781bce25a297b4a47dbfe93efb69db837651d9663bb7f64c5b5dbe9c318322c6cb356134450429c9200a189dc2f28c74416f27031fa490a53a045ca3cd65cc3c87c518b3199862e89415ba589e06bf057d8aed705b0fba05966b75c094858654bc19c2f9eec90d4bf93dd1326517d7d399456ab88f3a912ce0f8403750b34252ce8b1888e437393905b171a057e77888ad7cfa22920278244fa10be4533ec6f9dec60a077f8526f04bdc0ba8b10bafa82e5b1181d3058a0093d80ff400f79d1dc02fc3aa16cdccb2afddffb0ddd5f0b8b77d89f4a8984a621695b273f049dbb7e349abc8aeb7babce5b69225e857962c47fc17b11c6d017d6b752967597d4c43c0e2c297369f8efb694bf2f82e413153c2daba06f8964097edebe8b2c77b48af917281ae670b78f5c4797e2c0552263a83c6eee560398906bfab639211403fbaa9892cb20b78627b11f0a0ef4ac396e5128cafe2780d546373e43f826488a07344f0f09d8610a40c9e5e9c5ef7fc5b139731c3ff0e52bd614155f1da439e5db6b4349feae32d217959d03ce9a7da7288a2b03066311c44fef5b1a7edbbfbeff715c353354822c747dcde5d8567b296a06ce6e9e1563b32de621dad8fd9e3ad7c1d3bbdc2aeac7b975db8e2423e3a35c49430cd434469439b13d7f91fed6857e710dd58dffaf85ee09ffd8c31128d63ea2d55346d53a04b5815e9f9448968012f4f1d0ddc68d67209f317b51672637f9c05b2213e9a13119d248d9eeb223f025e8427c2104dca2f332d9ff50be88234636f70528067b84121882a829e34412f83b507c256317413297e890960c4feed9bdb0fdef0279714d51684584a29a11af6b52dc52c869b545e2cc77eb265877d75d74f5de5d303745e327265cea651cca1c2653295b3a39c1be5359389e227ab5c3a3e7033b347b0fd0f3a9d228e8b511c4750b5cb5e9be771a9104804e90c3134ed962eec2c1a37a3a9c17c604b78ae389cc73a3211896aed7d71bb40d717cff44cb96e49f1d4a85d111f65eed438f7288ea728ef73e0bf1878e509f858bf2d8e02984ef342cfcff385b6489d51113a85ce42024cb1c47e969a8162bb84f2952199ba49f58604d5c76b0fdfe2a34c3bec96cf3fb5edc87806fef08c82b96938707e560e5fb4a61dbeefb93df60fdb2072de570e12e52429a1a20a7064cc831a7299259c4b372e8aa21605f028ab9066713e534e13985035763e16676a38cdcce4cc28e253834052ccbcb61f0ccef87507fd025251561f3ddcadd1521fa4dbe9732b79e4b924276aab0af2dd926d2bf159ac8ce5026e0e2e6e19968bd22727cf02ccba31dcade8d5826a3879fb2126e5a2bc2ad0a37451ac2fced7b1943f813f5d840e404fe2c19db8ab417ccb8a89e803e53248108649370ef76bdea23e11b73c8feff99c4d5ff70d0cc07192e10778a2b6c73ff495c96d3ff8832bcf2f2c007879b266b22ac6c3db0eda9776ddcdf700f9841d4ff2e25ea27e9eeb358b575eaf9efb2505b015c0856eabfe3935cb3c1ed7239866b5d169d620844c2834b599fa55474c4153c00b589143932c1bfa6880c57d2f0a024d4165d0c799a5e9cb56af3905925a2f74f5240f360f0fa02476e3fa729075375ee081b1efdf60bff3be0d16d1fd12f5cadaedeb180a4bc4f0d268317bbc910b3429d0bea6223214cee29070bbbe342265729cb2e9aba6fa826a515e247cb8307e3e77dc497c43c2c913808afda8ddd71f1ffae867271fffa7bfbcfee2a2257931bb7feb0bf6ed430f61e113b7a7fac329519f899897b8cd00e04c2a464d80f794f1ed6f9aae39424034e3979581b4906219a7818d6334507731086eac0102a0ae5db74f9f5a1f668da1e710c3dce2db7e36024341dd32cd415008884196cb28cbb0a531d9e3810787b7da17ecfb202ced4177497bc0ddd962dfcbb6dbdeb3dcdfa7e6405183b9e33ce731067307ba3896b8a1784cacd67a7aa481b0d059a4e344912ed5109c6e93838996cfb592f8691cd270bc31bd81c521004a4f63f043e65bc73f3776ff17362eaf5ebe73e4005d307a3b88fd6c4056cca01b18a15fae0526d5c64638967956607b4f59b81fa260f91fda64ea91099ccfb774cdf4c2f5efde144a9b9846ab12f74901203035c46d5d8db227707368b75bbb91c3d2f80586368290e02d097eff25bfa49960020c33dff6f30c1408374e2f3d5eaa5ca73d6cf7ccd458c3fd19f6179756a7e80ad1de30c4d2ddfb492172e17d1db9b0915941c11189b6442731d8e6221172690f9b0678cc887b89324ebf21ddc1c52300de00b7863bed6be3033b571f7807eea325938556dec0221f18e60b42b199dc95b989ecc2281e42b4f351da5c717e04d4a47465c0857291d628a2a44116e0ef68ed49fcfcbbf683cbaf1b792bab8c9525586750b38dc2ea70c3596a06c44d2e70accfd866a0d2ef6969f6351e5c63eb922f24049e23e352a004e9bb7b7c293c896f939407b9bd3d44045e078c7fccb7ed73ed939673d766fb6fe7541a7e045ce551ae10a9769ea3b9808ee902662ab6beaa3541641a027ee8858363dbefa7bef4752f7454e22197f817fcb3b804a0c28fe2d4f81cede773760e47ea6d4b24e6ce5659fe81e2649e55c74bac3c5e8909a9921559f297e745626579b1dcfc5886238c5c265bc85d6cebe1f6f17b7f30f4ef86dd28f39acc73c9a56c9c8121277aa572a7da7deda90b26ab5f8c3908237cc5645f2f3a81bbc0c55490d6af10488100f8d46588306ccd03cc6c7dde69e418729d9b5b7039d82631df7e669875abeeab629946963a661042be6c4735372208812fd87d3965d9e41c84dd353946f338b89f46e687d6c89f971ba88a6f4c587c02f0ef4107dc714f0ddb7cba63b9d6804056dce288c2a18100cc7cae328e9ce8cb93c440272ecfe757e680fe1fb1c4c1761430d2f44e0c24f5e184384bba38e8910441a09e5d1061685a562fd3cbf7aafd5ff0669e0a053eed4a4a0ae82681320be74b126844b2b36ba2950748ec8b005e2e4cc3b79f716fb2c64ea3dc3590c14adeb29a558a4a5cb3c363e8eea3b8fa2c343ec22a36b6ebc8d078bba66ffcd0f9f0a300b8464333789e7fb987bddee71754d3a23faa9d1c1515a81237b35deabb8cc08c9abb984b8a1e6216b3611c4ec8dc002261ab56b56d3a23ed003e7e2b05a0eb6f2f4c410289779d4a634e5d63539b6fff03d4b920478f60b632c9528aa0bf4f44a07bb59640630b24ea5b739488570c68a39081a661ef047803d04248a00e515e67f578f0afe5b8fc0812ae1eedb373683cd9d3c01bde0d5137b846435aacea640ff159a288ee0d09af27012c7c21f5d3a4e4bc58d151dd074491c37e3e51c4a1adce4baf7ebc2331749556da94ef1d820071cdd90541e7b034c3c55378fc70a0a70504904aa7da567052c06ddda1fbd1e75c0691ebcca969e184c48b64c8ab05b9713d402c2596734725f108bc2c507fc69912e44255431d12a20151af4fbcf992e9bd94ffd3c446e21b1a7e5104f0722f292e97feacf8e2a08a923296ece83fd0a9655746e2bd4e9396f1452194da4a2aa4f11583015cba9f9040551069a54224b545dabb1028678e8e38a76e60636fff247eb9ad2450ffe1787df4d4cc77a4e276b62262cc3fc8802e2c7c5d00fcb813ef7a946850a4b983b88d78bccf20e9eb17de680278a5379bafa0b1e1f6c109f5c6400bb0f9f701021011a80998cee46b9add9c96f00e248400d72ddaa682d2ea43d7da2a68233a6a686700a2c7492891d0dc23d83f911010f3116e52d679444de7aa224aecef268a60de34e1cd4c00f395c4fa4e2dbd1dc9acf41c2d47e4bc7c04aa3ccd54cd33a92ed87e9a7fd7015755bf28cc3701fe42d001d4761cafde96c34ee114d10532e445399cf0a1e80a95c6c5c3277cf72fe8865f0e0268b6bd0f1e7a6aa2b27226a7836a65996047041a5812274ba44fa16eee90caa96a57d036b5af9774e9749e302f20809f9b1b7bf04ad9e9a65649a42f1601b867bdd97f7e3908e07e3bf2bdda6fbc8deee40574ae2fa0bb55406b5b8050655506cbaec5f7831e60a6fb8484d447097008434867126555947fa0bed8a1e9deeaf3cf1da3516e3f32d0464b7d843b8ea5a872fa5737fc721080eaff5f9cfbd433ec3511031d3f1b952bda54448fa100622873a4514447b390237cc9ad608a99d96dacbdd896c692a69129c8642a5485565816c9e093753996899ad9bec34dd192c2a946e4b5b6ffdcfacb17c427bf4c414df9e94429566af945080ba384fe8bdf294a47cd490a7e33219594c640ba7cc846773f85663ee8b8ffa71cbda99434caf3ba861757d6ebfab0d72173a97b0ba3ba610ba30c4992720191a847186809ecce059def24fe98a8aedaaf4df8e569028e0d89cca98aaf144420025851dc2fa2d0369004ecba3eba38ffd70a7cbdf86fc26f6ae03735f09b1af84d0dfcdad6c0ff0505eac62869b7c4ef0000000049454e44ae426082);

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE IF NOT EXISTS `zones` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `warehouse_id` int(11) DEFAULT NULL,
  `zone` varchar(15) NOT NULL,
  `suburb` varchar(70) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`id`, `warehouse_id`, `zone`, `suburb`, `deleted`) VALUES
(1, 10, 'Headquarters', 'Tema', 0),
(2, 6, 'ZONE B-2', 'Kumasi', 0),
(3, 5, 'ZONE B-3', 'Koforidua', 0),
(4, 5, 'ZONE C-1', 'Abossey Okai, Accra', 0),
(5, 5, 'ZONE C-2', 'Adabraka, Accra', 0),
(6, 5, 'Mankwadi', 'Tema', 0),
(7, 5, 'Industrial Area', 'Tema (Opposite PZ)', 0),
(8, 6, 'Achimota Retail', 'Achimota', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
