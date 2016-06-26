-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 23, 2016 at 03:19 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ggc_whse`
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
(343, 'Adult Hair Cut', 'B0002', '', 'Service', '2015-11-27', '2015-11-27 19:38:14', '', NULL, 'Barbering', '', '', 4, '0.00', '15.00', NULL, 'alive'),
(344, 'Comb Twist Long Hair', 'B0005', '', 'Service', '2015-11-27', '2015-11-27 19:38:14', '', NULL, 'Barbering', '', '', 4, '0.00', '50.00', NULL, 'alive'),
(345, 'Comb Twist Short Hair', 'B0031', '', 'Service', '2015-11-27', '2015-11-27 19:38:14', '', NULL, 'Barbering', '', '', 4, '0.00', '40.00', NULL, 'alive'),
(346, 'Company dye', 'B0022', '', 'Service', '2015-11-27', '2015-11-27 19:38:14', '', NULL, 'Barbering', '', '', 4, '0.00', '35.00', NULL, 'alive'),
(347, 'Customer Dye', 'B0023', '', 'Service', '2015-11-27', '2015-11-27 19:38:14', '', NULL, 'Barbering', '', '', 4, '0.00', '40.00', NULL, 'alive'),
(348, 'Cut & Color', 'B0014', '', 'Service', '2015-11-27', '2015-11-27 19:38:14', '', NULL, 'Barbering', '', '', 4, '0.00', '50.00', NULL, 'alive'),
(349, 'European Hair Cut', 'B0003', '', 'Service', '2015-11-27', '2015-11-27 19:38:14', '', NULL, 'Barbering', '', '', 4, '0.00', '25.00', NULL, 'alive'),
(350, 'EYE BROW', 'B0019', '', 'Service', '2015-11-27', '2015-11-27 19:38:15', '', NULL, 'Barbering', '', '', 4, '0.00', '20.00', NULL, 'alive'),
(351, 'Foam Twist Long Hair', 'B0030', '', 'Service', '2015-11-27', '2015-11-27 19:38:15', '', NULL, 'Barbering', '', '', 4, '0.00', '5.00', NULL, 'alive'),
(352, 'Foam Twist Short Hair', 'B0006', '', 'Service', '2015-11-27', '2015-11-27 19:38:15', '', NULL, 'Barbering', '', '', 4, '0.00', '30.00', NULL, 'alive'),
(353, 'Hand Twist', 'B0004', '', 'Service', '2015-11-27', '2015-11-27 19:38:15', '', NULL, 'Barbering', '', '', 4, '0.00', '90.00', NULL, 'alive'),
(354, 'Kids Hair Cut', 'B0001', '', 'Service', '2015-11-27', '2015-11-27 19:38:15', '', NULL, 'Barbering', '', '', 4, '0.00', '130.00', NULL, 'alive'),
(355, 'Ladies Hair Cut with Scissors', 'B0020', '', 'Service', '2015-11-27', '2015-11-27 19:38:15', '', NULL, 'Barbering', '', '', 4, '0.00', '60.00', NULL, 'alive'),
(356, 'Ladies Hair cut without Scissors', 'B0032', '', 'Service', '2015-11-27', '2015-11-27 19:38:15', '', NULL, 'Barbering', '', '', 4, '0.00', '40.00', NULL, 'alive'),
(357, 'Manicure', 'B0012', '', 'Service', '2015-11-27', '2015-11-27 19:38:15', '', NULL, 'Barbering', '', '', 4, '0.00', '10.00', NULL, 'alive'),
(358, 'Pedicure', 'B0013', '', 'Service', '2015-11-27', '2015-11-27 19:38:16', '', NULL, 'Barbering', '', '', 4, '0.00', '50.00', NULL, 'alive'),
(359, 'Pedicure', 'B0039', '', 'Service', '2015-11-27', '2015-11-27 19:38:16', '', NULL, 'Barbering', '', '', 4, '0.00', '30.00', NULL, 'alive'),
(360, 'Permanent Lock (short)', 'B0028', '', 'Service', '2015-11-27', '2015-11-27 19:38:16', '', NULL, 'Barbering', '', '', 4, '0.00', '20.00', NULL, 'alive'),
(361, 'Permanent Locks Long', 'B0016', '', 'Service', '2015-11-27', '2015-11-27 19:38:16', '', NULL, 'Barbering', '', '', 4, '0.00', '60.00', NULL, 'alive'),
(362, 'Polish', 'B0021', '', 'Service', '2015-11-27', '2015-11-27 19:38:16', '', NULL, 'Barbering', '', '', 4, '0.00', '55.00', NULL, 'alive'),
(363, 'Polish', 'B0024', '', 'Service', '2015-11-27', '2015-11-27 19:38:16', '', NULL, 'Barbering', '', '', 4, '0.00', '80.00', NULL, 'alive'),
(364, 'Polish', 'B0025', '', 'Service', '2015-11-27', '2015-11-27 19:38:16', '', NULL, 'Barbering', '', '', 4, '0.00', '50.00', NULL, 'alive'),
(365, 'Re-Twist (Long Hair)', 'B0007', '', 'Service', '2015-11-27', '2015-11-27 19:38:16', '', NULL, 'Barbering', '', '', 4, '0.00', '40.00', NULL, 'alive'),
(366, 'Re-Twist (Short Hair)', 'B0008', '', 'Service', '2015-11-27', '2015-11-27 19:38:17', '', NULL, 'Barbering', '', '', 4, '0.00', '40.00', NULL, 'alive'),
(367, 'Shaving', 'B0011', '', 'Service', '2015-11-27', '2015-11-27 19:38:17', '', NULL, 'Barbering', '', '', 4, '0.00', '75.00', NULL, 'alive'),
(368, 'Spotting Waves (Long Hair)', 'B0009', '', 'Service', '2015-11-27', '2015-11-27 19:38:17', '', NULL, 'Barbering', '', '', 4, '0.00', '50.00', NULL, 'alive'),
(369, 'Spotting Waves (Short Hair)', 'B0010', '', 'Service', '2015-11-27', '2015-11-27 19:38:17', '', NULL, 'Barbering', '', '', 4, '0.00', '70.00', NULL, 'alive'),
(370, 'Design', 'N0012', '', 'Service', '2015-11-27', '2015-11-27 19:32:26', '', NULL, 'Nails', '', '', 4, '0.00', '5.00', NULL, 'alive'),
(371, 'Dissolving', 'N0005', '', 'Service', '2015-11-27', '2015-11-27 19:32:26', '', NULL, 'Nails', '', '', 4, '0.00', '8.00', NULL, 'alive'),
(372, 'Dissolving & Polish', 'N0006', '', 'Service', '2015-11-27', '2015-11-27 19:32:26', '', NULL, 'Nails', '', '', 4, '0.00', '10.00', NULL, 'alive'),
(373, 'French Tip', 'N0002', '', 'Service', '2015-11-27', '2015-11-27 19:32:26', '', NULL, 'Nails', '', '', 4, '0.00', '25.00', NULL, 'alive'),
(374, 'French Tip', 'N00012', '', 'Service', '2015-11-27', '2015-11-27 19:32:27', '', NULL, 'Nails', '', '', 4, '0.00', '20.00', NULL, 'alive'),
(375, 'Gel', 'N0014', '', 'Service', '2015-11-27', '2015-11-27 19:32:27', '', NULL, 'Nails', '', '', 4, '0.00', '30.00', NULL, 'alive'),
(376, 'Manicure', 'N0011', '', 'Service', '2015-11-27', '2015-11-27 19:32:27', '', NULL, 'Nails', '', '', 4, '0.00', '15.00', NULL, 'alive'),
(377, 'Normal Tip', 'N0001', '', 'Service', '2015-11-27', '2015-11-27 19:32:27', '', NULL, 'Nails', '', '', 4, '0.00', '20.00', NULL, 'alive'),
(378, 'Pedicure', 'N0010', '', 'Service', '2015-11-27', '2015-11-27 19:32:27', '', NULL, 'Nails', '', '', 4, '0.00', '25.00', NULL, 'alive'),
(379, 'Polish', 'N0008', '', 'Service', '2015-11-27', '2015-11-27 19:32:27', '', NULL, 'Nails', '', '', 4, '0.00', '5.00', NULL, 'alive'),
(380, 'Polish With French Tip', 'N0007', '', 'Service', '2015-11-27', '2015-11-27 19:32:27', '', NULL, 'Nails', '', '', 4, '0.00', '6.00', NULL, 'alive'),
(381, 'Refill', 'N0003', '', 'Service', '2015-11-27', '2015-11-27 19:32:27', '', NULL, 'Nails', '', '', 4, '0.00', '15.00', NULL, 'alive'),
(382, 'Replacement of one tip', 'N0015', '', 'Service', '2015-11-27', '2015-11-27 19:32:27', '', NULL, 'Nails', '', '', 4, '0.00', '3.00', NULL, 'alive'),
(383, 'Sculpture', 'N0013', '', 'Service', '2015-11-27', '2015-11-27 19:32:28', '', NULL, 'Nails', '', '', 4, '0.00', '25.00', NULL, 'alive'),
(384, 'Stick-On', 'N0009', '', 'Service', '2015-11-27', '2015-11-27 19:32:28', '', NULL, 'Nails', '', '', 4, '0.00', '10.00', NULL, 'alive'),
(385, 'Tiding & Polish', 'N0004', '', 'Service', '2015-11-27', '2015-11-27 19:32:28', '', NULL, 'Nails', '', '', 4, '0.00', '8.00', NULL, 'alive'),
(386, 'Bridal Make Up', 'P0037', '', 'Service', '2015-11-27', '2015-11-27 19:32:28', '', NULL, 'Parlour', '', '', 4, '0.00', '40.00', NULL, 'alive'),
(387, 'Bridal Make Up-Home Service', 'P0038', '', 'Service', '2015-11-27', '2015-11-27 19:32:28', '', NULL, 'Parlour', '', '', 4, '0.00', '80.00', NULL, 'alive'),
(388, 'Bridal Make-up Home Serives', 'P0075', '', 'Service', '2015-11-27', '2015-11-27 19:32:28', '', NULL, 'Parlour', '', '', 4, '0.00', '50.00', NULL, 'alive');

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
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(75) DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL,
  `system` int(1) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `modified`, `system`, `deleted`) VALUES
(1, 'Corn', '2016-06-21 10:20:33', 1, 0),
(2, 'Millet', '2016-06-21 10:20:44', 1, 0),
(3, 'Rice', '2016-06-21 10:20:51', 1, 0),
(30, 'Sorghum', '2016-06-21 10:21:07', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_levels`
--

CREATE TABLE IF NOT EXISTS `product_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `warehouse_id` int(5) DEFAULT NULL,
  `region_id` int(5) DEFAULT NULL,
  `product_id` int(5) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `product_levels`
--

INSERT INTO `product_levels` (`id`, `warehouse_id`, `region_id`, `product_id`, `quantity`, `unit`, `modified`, `deleted`) VALUES
(1, 11, NULL, 2, 100, 'kg', '2016-06-22 14:03:13', 0),
(2, 11, NULL, 2, 98, 'kg', '2016-06-22 14:03:40', 0),
(3, 11, NULL, 30, 500, 'sacks', '2016-06-23 11:55:52', 0),
(4, 11, NULL, 30, 300, 'sacks', '2016-06-23 11:56:31', 0);

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
-- Table structure for table `regions`
--

CREATE TABLE IF NOT EXISTS `regions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region_name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `region` (`region_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `region_name`) VALUES
(5, 'Ashanti'),
(4, 'Brong Ahafo'),
(9, 'Central'),
(7, 'Eastern'),
(10, 'Greater Accra'),
(3, 'Northern'),
(1, 'Upper East'),
(2, 'Upper West'),
(6, 'Volta'),
(8, 'Western');

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
(1, 1, 4, 4, 'Ghana Grains Council', '', 'Accra', '', 'East Legon, Accra', 'Accra', 'Ghana', '', '', '', '2015-01-01', 'logo.png', '2016-06-22 12:33:59');

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
-- Table structure for table `warehouses`
--

CREATE TABLE IF NOT EXISTS `warehouses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `warehouse_name` varchar(50) DEFAULT NULL,
  `operator` varchar(40) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `district` varchar(40) DEFAULT NULL,
  `region_id` int(2) DEFAULT NULL,
  `warehouse_photo` mediumblob,
  `details` mediumblob,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `warehouse_name`, `operator`, `location`, `district`, `region_id`, `warehouse_photo`, `details`, `deleted`) VALUES
(6, 'Warehouse 2', 'Tema', NULL, 'West Coast', 10, NULL, 0x6164666164666164663c62723e, 1),
(7, 'Dansoman Warehouse', 'Dansoman', NULL, 'Dansoman', 10, NULL, 0x616c3b73646a66616c3b64736b20663c62723e, 0),
(10, 'Main Warehouse', 'Agra', 'Palmwine spot', 'Tema', 10, 0xffd8ffe000104a46494600010101012c012c0000ffe110ec4578696600004d4d002a000000080004013b00020000000b0000084a8769000400000001000008569c9d000100000016000010ceea1c00070000080c0000003e000000001cea000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000416264756c4d616c696b000000059003000200000014000010a49004000200000014000010b8929100020000000338360000929200020000000338360000ea1c00070000080c00000898000000001cea000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000323031343a31313a30392031383a30353a323600323031343a31313a30392031383a30353a323600000041006200640075006c004d0061006c0069006b000000ffe20c584943435f50524f46494c4500010100000c484c696e6f021000006d6e74725247422058595a2007ce00020009000600310000616373704d5346540000000049454320735247420000000000000000000000000000f6d6000100000000d32d4850202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001163707274000001500000003364657363000001840000006c77747074000001f000000014626b707400000204000000147258595a00000218000000146758595a0000022c000000146258595a0000024000000014646d6e640000025400000070646d6464000002c400000088767565640000034c0000008676696577000003d4000000246c756d69000003f8000000146d6561730000040c0000002474656368000004300000000c725452430000043c0000080c675452430000043c0000080c625452430000043c0000080c7465787400000000436f70797269676874202863292031393938204865776c6574742d5061636b61726420436f6d70616e790000646573630000000000000012735247422049454336313936362d322e31000000000000000000000012735247422049454336313936362d322e31000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000058595a20000000000000f35100010000000116cc58595a200000000000000000000000000000000058595a200000000000006fa2000038f50000039058595a2000000000000062990000b785000018da58595a2000000000000024a000000f840000b6cf64657363000000000000001649454320687474703a2f2f7777772e6965632e636800000000000000000000001649454320687474703a2f2f7777772e6965632e63680000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000064657363000000000000002e4945432036313936362d322e312044656661756c742052474220636f6c6f7572207370616365202d207352474200000000000000000000002e4945432036313936362d322e312044656661756c742052474220636f6c6f7572207370616365202d20735247420000000000000000000000000000000000000000000064657363000000000000002c5265666572656e63652056696577696e6720436f6e646974696f6e20696e2049454336313936362d322e3100000000000000000000002c5265666572656e63652056696577696e6720436f6e646974696f6e20696e2049454336313936362d322e31000000000000000000000000000000000000000000000000000076696577000000000013a4fe00145f2e0010cf140003edcc0004130b00035c9e0000000158595a2000000000004c09560050000000571fe76d6561730000000000000001000000000000000000000000000000000000028f0000000273696720000000004352542063757276000000000000040000000005000a000f00140019001e00230028002d00320037003b00400045004a004f00540059005e00630068006d00720077007c00810086008b00900095009a009f00a400a900ae00b200b700bc00c100c600cb00d000d500db00e000e500eb00f000f600fb01010107010d01130119011f0125012b01320138013e0145014c0152015901600167016e0175017c0183018b0192019a01a101a901b101b901c101c901d101d901e101e901f201fa0203020c0214021d0226022f02380241024b0254025d02670271027a0284028e029802a202ac02b602c102cb02d502e002eb02f50300030b03160321032d03380343034f035a03660372037e038a039603a203ae03ba03c703d303e003ec03f9040604130420042d043b0448045504630471047e048c049a04a804b604c404d304e104f004fe050d051c052b053a05490558056705770586059605a605b505c505d505e505f6060606160627063706480659066a067b068c069d06af06c006d106e306f507070719072b073d074f076107740786079907ac07bf07d207e507f8080b081f08320846085a086e0882089608aa08be08d208e708fb09100925093a094f09640979098f09a409ba09cf09e509fb0a110a270a3d0a540a6a0a810a980aae0ac50adc0af30b0b0b220b390b510b690b800b980bb00bc80be10bf90c120c2a0c430c5c0c750c8e0ca70cc00cd90cf30d0d0d260d400d5a0d740d8e0da90dc30dde0df80e130e2e0e490e640e7f0e9b0eb60ed20eee0f090f250f410f5e0f7a0f960fb30fcf0fec1009102610431061107e109b10b910d710f511131131114f116d118c11aa11c911e81207122612451264128412a312c312e31303132313431363138313a413c513e5140614271449146a148b14ad14ce14f01512153415561578159b15bd15e0160316261649166c168f16b216d616fa171d17411765178917ae17d217f7181b18401865188a18af18d518fa19201945196b199119b719dd1a041a2a1a511a771a9e1ac51aec1b141b3b1b631b8a1bb21bda1c021c2a1c521c7b1ca31ccc1cf51d1e1d471d701d991dc31dec1e161e401e6a1e941ebe1ee91f131f3e1f691f941fbf1fea20152041206c209820c420f0211c2148217521a121ce21fb22272255228222af22dd230a23382366239423c223f0241f244d247c24ab24da250925382568259725c725f726272657268726b726e827182749277a27ab27dc280d283f287128a228d429062938296b299d29d02a022a352a682a9b2acf2b022b362b692b9d2bd12c052c392c6e2ca22cd72d0c2d412d762dab2de12e162e4c2e822eb72eee2f242f5a2f912fc72ffe3035306c30a430db3112314a318231ba31f2322a3263329b32d4330d3346337f33b833f1342b3465349e34d83513354d358735c235fd3637367236ae36e937243760379c37d738143850388c38c839053942397f39bc39f93a363a743ab23aef3b2d3b6b3baa3be83c273c653ca43ce33d223d613da13de03e203e603ea03ee03f213f613fa23fe24023406440a640e74129416a41ac41ee4230427242b542f7433a437d43c044034447448a44ce45124555459a45de4622466746ab46f04735477b47c04805484b489148d7491d496349a949f04a374a7d4ac44b0c4b534b9a4be24c2a4c724cba4d024d4a4d934ddc4e254e6e4eb74f004f494f934fdd5027507150bb51065150519b51e65231527c52c75313535f53aa53f65442548f54db5528557555c2560f565c56a956f75744579257e0582f587d58cb591a596959b85a075a565aa65af55b455b955be55c355c865cd65d275d785dc95e1a5e6c5ebd5f0f5f615fb36005605760aa60fc614f61a261f56249629c62f06343639763eb6440649464e9653d659265e7663d669266e8673d679367e9683f689668ec6943699a69f16a486a9f6af76b4f6ba76bff6c576caf6d086d606db96e126e6b6ec46f1e6f786fd1702b708670e0713a719571f0724b72a67301735d73b87414747074cc7528758575e1763e769b76f8775677b37811786e78cc792a798979e77a467aa57b047b637bc27c217c817ce17d417da17e017e627ec27f237f847fe5804780a8810a816b81cd8230829282f4835783ba841d848084e3854785ab860e867286d7873b879f8804886988ce8933899989fe8a648aca8b308b968bfc8c638cca8d318d988dff8e668ece8f368f9e9006906e90d6913f91a89211927a92e3934d93b69420948a94f4955f95c99634969f970a977597e0984c98b89924999099fc9a689ad59b429baf9c1c9c899cf79d649dd29e409eae9f1d9f8b9ffaa069a0d8a147a1b6a226a296a306a376a3e6a456a4c7a538a5a9a61aa68ba6fda76ea7e0a852a8c4a937a9a9aa1caa8fab02ab75abe9ac5cacd0ad44adb8ae2daea1af16af8bb000b075b0eab160b1d6b24bb2c2b338b3aeb425b49cb513b58ab601b679b6f0b768b7e0b859b8d1b94ab9c2ba3bbab5bb2ebba7bc21bc9bbd15bd8fbe0abe84beffbf7abff5c070c0ecc167c1e3c25fc2dbc358c3d4c451c4cec54bc5c8c646c6c3c741c7bfc83dc8bcc93ac9b9ca38cab7cb36cbb6cc35ccb5cd35cdb5ce36ceb6cf37cfb8d039d0bad13cd1bed23fd2c1d344d3c6d449d4cbd54ed5d1d655d6d8d75cd7e0d864d8e8d96cd9f1da76dafbdb80dc05dc8add10dd96de1cdea2df29dfafe036e0bde144e1cce253e2dbe363e3ebe473e4fce584e60de696e71fe7a9e832e8bce946e9d0ea5beae5eb70ebfbec86ed11ed9cee28eeb4ef40efccf058f0e5f172f1fff28cf319f3a7f434f4c2f550f5def66df6fbf78af819f8a8f938f9c7fa57fae7fb77fc07fc98fd29fdbafe4bfedcff6dffffffe10b1d687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f003c3f787061636b657420626567696e3d27efbbbf272069643d2757354d304d7043656869487a7265537a4e54637a6b633964273f3e0d0a3c783a786d706d65746120786d6c6e733a783d2261646f62653a6e733a6d6574612f223e3c7264663a52444620786d6c6e733a7264663d22687474703a2f2f7777772e77332e6f72672f313939392f30322f32322d7264662d73796e7461782d6e7323223e3c7264663a4465736372697074696f6e207264663a61626f75743d22757569643a66616635626464352d626133642d313164612d616433312d6433336437353138326631622220786d6c6e733a64633d22687474703a2f2f7075726c2e6f72672f64632f656c656d656e74732f312e312f222f3e3c7264663a4465736372697074696f6e207264663a61626f75743d22757569643a66616635626464352d626133642d313164612d616433312d6433336437353138326631622220786d6c6e733a786d703d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f223e3c786d703a437265617465446174653e323031342d31312d30395431383a30353a32362e3836313c2f786d703a437265617465446174653e3c2f7264663a4465736372697074696f6e3e3c7264663a4465736372697074696f6e207264663a61626f75743d22757569643a66616635626464352d626133642d313164612d616433312d6433336437353138326631622220786d6c6e733a64633d22687474703a2f2f7075726c2e6f72672f64632f656c656d656e74732f312e312f223e3c64633a63726561746f723e3c7264663a53657120786d6c6e733a7264663d22687474703a2f2f7777772e77332e6f72672f313939392f30322f32322d7264662d73796e7461782d6e7323223e3c7264663a6c693e416264756c4d616c696b3c2f7264663a6c693e3c2f7264663a5365713e0d0a0909093c2f64633a63726561746f723e3c2f7264663a4465736372697074696f6e3e3c2f7264663a5244463e3c2f783a786d706d6574613e0d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020203c3f787061636b657420656e643d2777273f3effdb00430006040506050406060506070706080a100a0a09090a140e0f0c1017141818171416161a1d251f1a1b231c1616202c20232627292a29191f2d302d283025282928ffdb0043010707070a080a130a0a13281a161a2828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828ffc000110800bb012c03012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00faa68a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a4cd293c52b80514c2df9d41717b05ba6e9e548c7fb471512a9182bc9d8762d5158ede23d2d5b06f62fceafda5e5bddaeeb6952551d4a9ce2a29e2a95476849362b32cd1480d19adae02d1499a3bd170168a28a6014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500254571324113492b05451924d2cd22c5133b9011464e6bca7c53e219b55b8786162968ad8007f17b9f6af2b33cc6181a7cdd4a8c6ec9bc49e28b8beba68ec65786d50e015382e7fc2b9c96592524cb23b9f566269847ff00ae93eb5f9de231d57113729b7e86d18db614019aeafc0dae5ae99e6c17442248d9593dfd0d7260e57d73e94a79a584c6cf0b53dac771b573d9a7d6ac21b46b83731b228cfca724fe154b4ef166977b208d2631c87f86418fd6bc97e9d3d282338cf6af75f14566d3515623d99ed326b7a724811af210c7fda157a291655568d8321e411debc231f8d7af783e78ee342b43130f9536b0f435ed6539ccb1d55c24ac6728d8dea28a2be8ae48514514c028a42707a5193400b45264d2e6800a28cd19a0028a6e4d2e680b8b45264d19a005a281499fa5002d1499a5cd0014526696800a28a0d0014519a3340051499a5a0028a28a00e5bc7f7c6d74531ae77cedb38f4af28ba94436cf20fe15e3f3aea7e345e4fa7dc68d2e09b5964311ff007cf4cd799f8db51169638570ac55908f7c022be1b3ca156b636317b09d78c22df63a3b698483dc0c9fceab6a77690d9c854e5c911803d4fa57183c442db4c5b82d869205c0cfd7358e3c5124d7367b50fee97e453d3cc3c127e95c54b26a92939744734b31828ee7aaab2c663889cc98edec3934fae4347d4c5c6ae11250e436dde0f1b14727f3ae874dd462be9277b770628484dc7bfbd79d89c14e12d11d5431319c4bff008e07ad20e73ed595737ad2584f329fddb3f971fbf38cd69bb88e3dcdc00b93f85734e838a57dd9bc669b1d5d87c3bd416defe5b591f092e0a8278cd71b0b79b1ab74dc3229c27fb3bc6eae51c30da475cd6f81c44f0b5e35174076b1ef6ac0d2d717e0df141d467fb0dde05caa060dfde15d86ee48c8afd37098a862a9fb4818b449484f14da86e67582de595d80440589f402baefd496ecae49bd41c1603ea69de627775fcebe2cf16f8b354d4bc49a8dd437f7290bcc4a2a48400a0e062b27fb7757efa9deff00dfe6ff001a87511e5cf338c5db94fb9fce41fc6bf9d39583720822be151aeeafff00413bdffbfcdfe35f48fecf1e229358f0b4f6977334b75672e1999b24ab74fe469c66a46987c7c6b4b96c7ae678a6eee29acc003ed5e27f14fe311d26e25d2fc35b25bc4f965b9232b19f403b9aa6ecae7655ad1a4af23da27ba86dd774f2a46beacc00aa07c45a40241d4acc11ff004d457c5dab788357d62732ea5a95cdc31ecd2103f215984b9e77311ebbab3f6a7993cd527648fbb2df55b1b923ecf7704b9e9b2406ad86cf420d7c170dd5c5bb878679a365e9b1c8af46f00fc59d6f41bc860d56e24bfd30b0571272d18f50dde9aa972e8e67193b491f57970a3248c5279a87f897f3af32f8c9aa8baf8572ea1a65cbaa4c6368e489b69c135f321d7756ff00a0a5e1ff00b6cdfe34e53b1ae231d1a2d2b5ee7dd0244fef2fe747989fde5fcebe171aeeafff00413bdf7fdf37f8d035cd59871a9deffdfe6ff1a5ed5187f6ac7f94fb9c48bfde53f4a786cf6af866dfc49ae5bb8921d5ef51c743e6935e97f0e7e316ad65a9c167e249fed9652b04f39800d1fa12476a1544cd6966509bb3563e9dcf14d2714c8dd64891d0e558020fb563f8c3554d17c35a96a2e71e442cc3eb8c0fd6b43be52b272367cd4ecebf9d1e627f7d7f3af8666f106af2caf2b6a77b9762c40958019a6ff6eeae07fc84ef7feff37f8d67ed123cb79ac6ff0009f7399533f7d7f3a78391c57c2875dd5cf3fda979bbb7ef4d7d73f0a35d3aff0081b4dbc91c99c27952e7a86538e7f0c538cb98e9c363157764ac7683a5148bd296acee398f1f680be21f0fcb6985f39184b113d9d7915f2d7c40b8692e5e19d591a294c6c8dc10cbc0e3dc57d92cb91cd7967c58f8610f8a90df698560d557ae7eeca3dfdeb8ebe11549c6a75471e2e94a707ca7cb9249e6410c6c4feec6d19f4ce6a3071d386ed5ea9a0fc11f125f4ac7536834f8d4f73bcb7d315d669dfb3f40189d435891c76114607f3ab54acac78ab095a5d0f0f8b526b7b510da931ef4292bf7e4d5d97587b5bc61a74ccb6f24611c76e460d7abf8afe052d8e937777a46a52492c2864f2a541f36074cd7856085c11839c633e95cb530707ba1d4f6d877ef1e990eb10de2d8db44c8b02b861fecaa0e7f955dd5b5217766851da24bd904710efe58ead5e4eacc9928594918e0fe756a7d4aee6f237ca7f729b23c71b57d0579553274e4a48de1984923d3cf896d2dcdd4ad9f26d9446807f131edf5e2acc3786f750b625f114507da5ffe0438cfe15e4b7374d3c11c409037176f76e99fcab7f4cd5ddec1acd643f69bd956391ffbb1018ae5ad942a6b9e2b536a798b93e596c7a5f8735578eee2bc8db13c8c5d7d90741f435da5c78e6fee502db986338ea3935e2da778861b596f6e18af971208a21d7273ff00d6aeb7e0ae9f75e25bc96e6eb735bc52609e98c76ae7a584c541da8b691df471719c9451efbe1e7b99748b77bc62d3baee27eb5cb7c65d73fb0bc05a84abc4b3816f1e3ae5b8cd77488a88a17800600af9e3f69ad6bced434dd1e16c88819e503d4f02beca9c5d3a6a3277760c6d4e4a4da3c357835b1a368d2ea9a76af7717dcd3e01337be580ac8618af78f829e1bfb6fc36f114b2460b5f068d7dc2aff8d282b9f3b4293ad267830f5af4dfd9f75b3a5f8e52d5df6c37d198c83d370e95e672218a4646eaa4ad59d26fa4d3b53b4bd8490d04aaf91ec688bb30a1274ea267d69f193c4afe1bf065ccb6ec16eee3f7309f427a9fcabe432cccccee4b3b7249af6dfda1b571a9e93e189206cc17119b818ef903ff00af5e207f4aa9bbe87463eb39d4b741f0c524d347142a5e49182a8f526bdef41f80b6d369092eaba94e2f644dd88d40543fd6bc7bc0d1acde32d0e371956ba4047b66bea2f885f10ecbc0f359c377673dc1b804af9640c014412b6a5e0a9537172a87cddaef8035fd2f56bab38b4ebaba8a1721678e32438ec6b3c783fc458e744beffbf46bdc4fc7ed1c9ff904de7fdf428ff85fda3ffd022f3f31472c5f51ba186be9239b9d350b7fd9f6eadb55825825b7b9088b28c1db9e2bc53a57bff8dfc7769e38f85fadcb676b2db0b49e2561260eecf35e0079c1a5369ec638de5bc7976b12daa096e6089890af22a93e9938af70f177c12b4d3b41bad474ad466f3a08cca6399410c00c91c62bc3ade4f22e22940dcc8c1f1d33835ea5e2ff008cda9ebba2cda65959c5691ccbb24937658afb53838db5270ee928cb9cf28ead9e7e9439f972bd452e39000e4f4af4bf85ff000c350f11ea16f7ba828834a421892c09939ce00a851e691951a6e734a27d33e10690f853493367cc36b196cfaed15e61fb4a6bbf64f0ddae9313e25bc937381fdc5ebfad7b1431ac3024683088a140f615f26fc78d686b1e3eb88e36dd0d8a8b75f4cf53fad6f3d227b98d9ba746dd4f3bcf5fd2b57fb166ff008457fb6f9f27ed3f66c63be339ac92400c4f6af7b9fc2ed17eceaa9e5feff1f6e23ea73fcab08a6d5cf16851f69ccfb1e087a9c57bc7ecc7ad059352d15d8e4e2e2304fe07fa578393939aeafe176b2742f1d693765f6c524a2193fdd63834e0f51e12a3a7511f68a9a75451302a08e4119a96ba4fa95a8629a578eb4ea28018100e94b8a75068020b9884b6f246c32194a91eb915f0d788ec9b4ed7f52b461830ceebb4f51cd7dd4e4ede2be65fda33c2eda76bd16b96b1916d7bf2cc40fbb20e9f98a8a8ae8f3732a4e54f99743c768a0f079a2b03e7c01c74a7c323432178ced6208cfd69940eb49a4f715edb1dc7c32f87f79e34be2c4b41a6c4c3ce9b1d7ae42fbd7d57e18f0f69fe1bd2e2b0d2a111c29d4f763ea4fad709fb3bdddb4ff0fe28e008b2c133acaa3ae73907f2af525e335bc2092b9f4b82a31853525d46cce150b1200c64e7b0af8abe21eb4daf78cb54bf0488cca52307b2af02bea7f8b5ad8d0fc0fa9dc87db2bc7e547cff0013715f1aeecb12dc93c93ea69557639333abf61031cd7b07827e2f5b7867c336da4268f24be5021a41201bb3d4e315e47144f34ab1428f24ac70aa83249abdfd89aa0ff9875dfd7c96aca375b1e6509d486b02bead70979aa5d5cc51f951cd2b48109ced04f4aaa718c76ab177657569b45ddb4d096fbbe6215c8aadef41949bbdd9d7eb9a836a9e01d08c8c59ec257b63eca4657fa8ae471c0ae93c1d6c75817fa121fdfddc664b7cff00cf44f9b1f88dd5cf4b1bc32bc722323a9da508e41a6f6d0b95e5ef3373c0922c5e33d0e46e156ed39fc6bdd3e3bf83b5cf145f69726896c278e1460ff381827a57ce10caf0491c91315923219587623bd7b8689f1ee4b6d3228752d29a7b9450be6c6e006c7722aa2eeb53af0b529b84a1536678e6b9a4df683a9c9a7ea51f957298dca0e6b3b35bbe35f10b789fc4773aa496ff00673363e40738c5610eb51638ea5949f2ec77be18ff00924de2df6bab7fe46b82aef7c31ff249bc5dff005f56ff00c8d7040669b2eae8a23a34691d5146e7660a07a935b1acf85b5cd12d967d5f4db8b6809c798eb95cfd6b374dcff695a7fd764e7f115f607c57b05bff00873ac45b4122dfcc5fa8e69c61cc8df0b865561293e87c6fdfdabacf873e2cd43c33e23b3786e64fb2492ac72c4cc4a904e338ae4e9558a32b8382a41cd4a76673d2938544d1f726bfaac5a6787af3519582c514064c9fa71fd2be22bdbb92faf6e6ea63979a42e7ea4e6be83f8cfe2254f857a55bc6f97d4e38f383c940013fd2be743c0c56b3676e635b9ed11cb80c0b72b9c91ea33d2bd9e7f8cf692f865f483a2c86136fe46ef300c7cb8e98af1cb4b5b8ba97cbb48649a4c64aa2ee38f5ab6343d5063fe25977c7fd326acd36b639694a704f97a99a010307b53958a9dcbc301907dc54b736f35b4de55d45245277591483f5a88f4ff3c54985f96577b9f697c35d686bde0dd32f4302c6208ffef2f15d566bc17f663d70bd9ea5a2cad931389a204f63f7863f2af79ae98bba3eab0d53da534c751451546e141e94514008795ae4fe23e916dae784750b2ba28a5a32c8cd81b5c0c835d63f435e29fb4b59deb787ac2eeda4916082622608c467230334a5b1862656a6f43e6e75d8e531ca923d73494515cc7ca3d585145741e0af09ea7e2ed516cf4c4c2820cb338f9621efef45ae5429b9bb44f43fd9a3539e1f136a1600968278048c07452a78fe75f485b5cc37224f22559363146da73b587635e0de3355f83fa0d8db7875237d43502eb35eca32fc01d3d3ad7a0fc14d2ae34df055bcd7ceed777ec6ee5de79cb73fcab78763e8308dd35ec8e57f686b6d6b578b4dd2f49d3ae6ea1c99e57897201e801af113e07f13e3fe4077dff7eebed72077a00edde8704ddc55b011ad2e66cf99be0a78235683c7105eeafa6cf6d6f6c8ce0cab8058f15f4c7931e3fd5afe54e0b4eaa4ac74d0c3c68c794f20fda0bc2d75ace836771a5da3dc5d5bcdf7235e769af053e06f13ff00d00efbfefdd7dafb79cd254ca0a4eece7af97c6b4b9af63e38f0ff0085fc57a56b7637f16897ea6de6126447e95ec7f117e1343e2551ac6898b4d4e440d2c2e30b271dc7635eca145285a6a292b150c0c231e57a9f11eb9e10d7b4394a6a1a55d27a32a175fcc5621b798361ade607d0c67fc2bef4d8a4104020fad57363664926d602477f2c567ec91ccf2a8f467c310d85ecc710595cc9feec2c7fa56f697e03f146a247d9b45bac1e8645d83f5afb3a2822847ee91107fb2a07f2a900cf4c66a9534359547ab3e6eb7f87de21d13e196bd6b7169e75dde4f13a4309dc4051cd79d0f0378a31ff00203beffbf75f6bed3c7346050e9a6693cb61248f8bac3c13e265bdb666d0ef8289549263e8011d6bebfd5ad3edba25d5ae33e6c0c98fa8ad2dbf952629a8d9591b50c2468a69753e2c9fc07e2649e455d12f59558804270466a33e06f13918fec3beff00bf75f6be01e946d152a9a39e59645bbdcf91bc4da578bb5bb0d1ad5f44bf11e9d6a2dd418fa9ee6b07fe107f139ff9815f67feb9d7daa42e7e6a705e2a9c130965aa6f591e15fb3c7846ff004bbcd52ff58b096de52ab146265c647538af7310c64731a7e54fdbcd28ce7af154958eda341528f29f3e7ed07e0fd46ff5fb1bfd1ec25ba1242639044bf7483c5794b7823c4fff00402bee3fe99d7db0467349b7df8a974d3396b65d1ab3e66ec7cb3f09746f127877c7163753e8f7b1db484c53314c000f735f540e9481707238a701c0ef54958e9c3d0f631e542d14514ce80a28a28010d65f88749b6d6b48bad3ef103c33a1420f6f7ad5a6b2f141328a92b33e10d62c8e9daade59121becf2bc408ee031154abd7ff68cf0dc1a57882d353b38c46b7c1bcdc742e3bfe55e41c63ae7e95cd25667cae2297b3a8e22e00072457d0ffb34e9da95b586a571736ef1585cec681dc63711d71ed5e4df0ebc117de30d5e2486365d3d1819e7238001e80fad7d8763671d9dac36f080b1c4a11401d855d38eb73d1cbb0cf9bda48f30f887f0e2f7c59e39d2f5069e3feca81409636639ce73c0f7af53821582144550aa830a076153edf7a4238eb5aa563d68d2516e48c3d4f51ba7d462d3f4c58fcf64f3649241958d3b71eb496f75a85ade1875348e4b7285c5cc6a542e3a861506a4d2e99af7f68342f25acf08864d8325181c838f4ac6bb769f5046d362bd6b568a612b396c12578001ac65368d8e97fe123d2fc97952ed1d148195c9c93d87a9f6a96df5cb19d50a4eb9690458230437a11dab9f4b76d3ed340b936ade44087cd454e5588c6e23d6a2bbb77d46e353d42d209151624f28b26d2eea73902973c82c758ba95abdcdcc0264f36dc069573f741acf8f5fb456b992e2ee016cacaa84673c8cf35cbcb6b786de1bb5b6956e3582d0ce31831ee20027e8055b7d3dd7559a3fb3bb42b770143b78daa98cfe14bda49f403a6835cb09d2678e70161e64de36951ebcf6a2cf5db0bbb858209ff7cf92a8c08247afd2b9ef12d9cf26a378d144593c9899870048164dc573ebd69ef7d15ef8974a686da58f62b82f247b48e3a7e14fda3bd82c747acdf0d3f4e9ae382ca30a3d58f007e758f6de2065f0f5cdedfa08eeedb7a4b18fe170381f8fad2f882dae353d4ecac6191e08a3ff00499265504641c2af3f8d665ed85de9f75a9092592f5350b5705bcbdbb6455e381eb4394afa01a9a6788ed66b1b7377750add4a81d51411d7dbad59b7d72da2d3ed26bc9e3324e0951182770cf502b3f47b42ba8b4b340770d3e24562bdf1c81ef59de1f0da67d82e2f6da5f2ded3ca0db326321c9c11429480ea5f5dd3d20866370ad1ca709b792c7bf155ef357f32ca1b9d34a4b134c12463c6d5fe227d315853dc49f6ab4952d64d3ed641230963877be73dff00bb9ab3e1ddc749d5a392dee1f74aee1255c348a4751f5a1cdb61637acb5ab0bd9cc304e0c98c80411bbdc7ad3f5abdfecfd3a6b8c06651845f563c015cbe8acc9a8584568679edd41531dc4586b718ea1bbfa568f882dae753d52ceca191ede387fd25e60b9191c2af3f9fe155ccf942c5bd0f576bad2de7bf0b04f012b70b9e108fe98a920f10e9d712a4715c0f31f9452082e3db3d6b98d4f4dbeb29ef633335dc77c8b2b3328501908f97fe0438a9752be4bcd5348586ca48cc624f99e3c153e5f0abebd6b37524959858dd5d6edae6e6dd2cee627124a11b39f9b82700faf1532ebfa735d7d9d6e577eedb9c7ca5bd33d335850e9ee9a3f87228a131b2c80bed18da4a30c9fc4d1a75d241a5dae9cf61249789205319421720fdfddfad5f335b81d30d4ad5acdee9665f21090cfd860e0d73f75e2a4b49e559d46dfb52c11900f208ce6b39a792dbc3da86986da692f1e69308a84820b641cfd29b24334515ccad0cc512fa1738524950b82454ca72e8348ed60beb79a395e390158b87f6e33555b5fd395e243751ef94028bdd81e87e95866fbec4dad4725bcc5a7265842c670e0af1f8d41a269f2b2cc4c05266d3d235661cab1cf1ed4dce5611d15b6bfa7dc5c8822b946727683d89f407bd6b29c8af3eb3864961d3ad1a5be92685d7744620aa854f2738e95e82bd2ae9c9bdc42d14515a8051451400507a514500739e32f0a69be2dd34596ab1928adbd194e194fa835c6e97f04bc2d673acb709717854f0b33fcbf90af54c0a30295918ca8426f99ad4a5a769b6ba7dba5bd8c11dbc283848d4002ae014ea29ad0d1454744141e94514143367a9a3cb14fa2972a019b07f5a3653e8a2c808c478ce0fe74e0b4ea28b0152fec62beb6782e14989f1919c74e6aa58e8705adcfda1a5b8b8980da8d33eed83b815ad4527157019e58cd1e58a7d14c0695cd2796314fa28b01188f069c538e3834e228c51640336734bb077a751459015eeed52eade4866198dd4a9fa567d96836f6b731ce659e79230446667ddb01f4ad8a2938a6030274cf6a3cb07a8cd3e8a76b80cf2c52edfa53a8c516403047ce49a3673d69f45164033cb03a75f5a78a28a2c0145145300a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2803ffd9, 0x617364666164663c62723e, 0);
INSERT INTO `warehouses` (`id`, `warehouse_name`, `operator`, `location`, `district`, `region_id`, `warehouse_photo`, `details`, `deleted`) VALUES
(11, 'Sigli warehouse', 'Balala Investments', 'Under the baobab tree', 'Savelugu', 3, 0xffd8ffe000104a46494600010101012c012c0000ffe110ec4578696600004d4d002a000000080004013b00020000000b0000084a8769000400000001000008569c9d000100000016000010ceea1c00070000080c0000003e000000001cea000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000416264756c4d616c696b000000059003000200000014000010a49004000200000014000010b8929100020000000338360000929200020000000338360000ea1c00070000080c00000898000000001cea000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000323031343a31313a30392031383a30353a323600323031343a31313a30392031383a30353a323600000041006200640075006c004d0061006c0069006b000000ffe20c584943435f50524f46494c4500010100000c484c696e6f021000006d6e74725247422058595a2007ce00020009000600310000616373704d5346540000000049454320735247420000000000000000000000000000f6d6000100000000d32d4850202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001163707274000001500000003364657363000001840000006c77747074000001f000000014626b707400000204000000147258595a00000218000000146758595a0000022c000000146258595a0000024000000014646d6e640000025400000070646d6464000002c400000088767565640000034c0000008676696577000003d4000000246c756d69000003f8000000146d6561730000040c0000002474656368000004300000000c725452430000043c0000080c675452430000043c0000080c625452430000043c0000080c7465787400000000436f70797269676874202863292031393938204865776c6574742d5061636b61726420436f6d70616e790000646573630000000000000012735247422049454336313936362d322e31000000000000000000000012735247422049454336313936362d322e31000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000058595a20000000000000f35100010000000116cc58595a200000000000000000000000000000000058595a200000000000006fa2000038f50000039058595a2000000000000062990000b785000018da58595a2000000000000024a000000f840000b6cf64657363000000000000001649454320687474703a2f2f7777772e6965632e636800000000000000000000001649454320687474703a2f2f7777772e6965632e63680000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000064657363000000000000002e4945432036313936362d322e312044656661756c742052474220636f6c6f7572207370616365202d207352474200000000000000000000002e4945432036313936362d322e312044656661756c742052474220636f6c6f7572207370616365202d20735247420000000000000000000000000000000000000000000064657363000000000000002c5265666572656e63652056696577696e6720436f6e646974696f6e20696e2049454336313936362d322e3100000000000000000000002c5265666572656e63652056696577696e6720436f6e646974696f6e20696e2049454336313936362d322e31000000000000000000000000000000000000000000000000000076696577000000000013a4fe00145f2e0010cf140003edcc0004130b00035c9e0000000158595a2000000000004c09560050000000571fe76d6561730000000000000001000000000000000000000000000000000000028f0000000273696720000000004352542063757276000000000000040000000005000a000f00140019001e00230028002d00320037003b00400045004a004f00540059005e00630068006d00720077007c00810086008b00900095009a009f00a400a900ae00b200b700bc00c100c600cb00d000d500db00e000e500eb00f000f600fb01010107010d01130119011f0125012b01320138013e0145014c0152015901600167016e0175017c0183018b0192019a01a101a901b101b901c101c901d101d901e101e901f201fa0203020c0214021d0226022f02380241024b0254025d02670271027a0284028e029802a202ac02b602c102cb02d502e002eb02f50300030b03160321032d03380343034f035a03660372037e038a039603a203ae03ba03c703d303e003ec03f9040604130420042d043b0448045504630471047e048c049a04a804b604c404d304e104f004fe050d051c052b053a05490558056705770586059605a605b505c505d505e505f6060606160627063706480659066a067b068c069d06af06c006d106e306f507070719072b073d074f076107740786079907ac07bf07d207e507f8080b081f08320846085a086e0882089608aa08be08d208e708fb09100925093a094f09640979098f09a409ba09cf09e509fb0a110a270a3d0a540a6a0a810a980aae0ac50adc0af30b0b0b220b390b510b690b800b980bb00bc80be10bf90c120c2a0c430c5c0c750c8e0ca70cc00cd90cf30d0d0d260d400d5a0d740d8e0da90dc30dde0df80e130e2e0e490e640e7f0e9b0eb60ed20eee0f090f250f410f5e0f7a0f960fb30fcf0fec1009102610431061107e109b10b910d710f511131131114f116d118c11aa11c911e81207122612451264128412a312c312e31303132313431363138313a413c513e5140614271449146a148b14ad14ce14f01512153415561578159b15bd15e0160316261649166c168f16b216d616fa171d17411765178917ae17d217f7181b18401865188a18af18d518fa19201945196b199119b719dd1a041a2a1a511a771a9e1ac51aec1b141b3b1b631b8a1bb21bda1c021c2a1c521c7b1ca31ccc1cf51d1e1d471d701d991dc31dec1e161e401e6a1e941ebe1ee91f131f3e1f691f941fbf1fea20152041206c209820c420f0211c2148217521a121ce21fb22272255228222af22dd230a23382366239423c223f0241f244d247c24ab24da250925382568259725c725f726272657268726b726e827182749277a27ab27dc280d283f287128a228d429062938296b299d29d02a022a352a682a9b2acf2b022b362b692b9d2bd12c052c392c6e2ca22cd72d0c2d412d762dab2de12e162e4c2e822eb72eee2f242f5a2f912fc72ffe3035306c30a430db3112314a318231ba31f2322a3263329b32d4330d3346337f33b833f1342b3465349e34d83513354d358735c235fd3637367236ae36e937243760379c37d738143850388c38c839053942397f39bc39f93a363a743ab23aef3b2d3b6b3baa3be83c273c653ca43ce33d223d613da13de03e203e603ea03ee03f213f613fa23fe24023406440a640e74129416a41ac41ee4230427242b542f7433a437d43c044034447448a44ce45124555459a45de4622466746ab46f04735477b47c04805484b489148d7491d496349a949f04a374a7d4ac44b0c4b534b9a4be24c2a4c724cba4d024d4a4d934ddc4e254e6e4eb74f004f494f934fdd5027507150bb51065150519b51e65231527c52c75313535f53aa53f65442548f54db5528557555c2560f565c56a956f75744579257e0582f587d58cb591a596959b85a075a565aa65af55b455b955be55c355c865cd65d275d785dc95e1a5e6c5ebd5f0f5f615fb36005605760aa60fc614f61a261f56249629c62f06343639763eb6440649464e9653d659265e7663d669266e8673d679367e9683f689668ec6943699a69f16a486a9f6af76b4f6ba76bff6c576caf6d086d606db96e126e6b6ec46f1e6f786fd1702b708670e0713a719571f0724b72a67301735d73b87414747074cc7528758575e1763e769b76f8775677b37811786e78cc792a798979e77a467aa57b047b637bc27c217c817ce17d417da17e017e627ec27f237f847fe5804780a8810a816b81cd8230829282f4835783ba841d848084e3854785ab860e867286d7873b879f8804886988ce8933899989fe8a648aca8b308b968bfc8c638cca8d318d988dff8e668ece8f368f9e9006906e90d6913f91a89211927a92e3934d93b69420948a94f4955f95c99634969f970a977597e0984c98b89924999099fc9a689ad59b429baf9c1c9c899cf79d649dd29e409eae9f1d9f8b9ffaa069a0d8a147a1b6a226a296a306a376a3e6a456a4c7a538a5a9a61aa68ba6fda76ea7e0a852a8c4a937a9a9aa1caa8fab02ab75abe9ac5cacd0ad44adb8ae2daea1af16af8bb000b075b0eab160b1d6b24bb2c2b338b3aeb425b49cb513b58ab601b679b6f0b768b7e0b859b8d1b94ab9c2ba3bbab5bb2ebba7bc21bc9bbd15bd8fbe0abe84beffbf7abff5c070c0ecc167c1e3c25fc2dbc358c3d4c451c4cec54bc5c8c646c6c3c741c7bfc83dc8bcc93ac9b9ca38cab7cb36cbb6cc35ccb5cd35cdb5ce36ceb6cf37cfb8d039d0bad13cd1bed23fd2c1d344d3c6d449d4cbd54ed5d1d655d6d8d75cd7e0d864d8e8d96cd9f1da76dafbdb80dc05dc8add10dd96de1cdea2df29dfafe036e0bde144e1cce253e2dbe363e3ebe473e4fce584e60de696e71fe7a9e832e8bce946e9d0ea5beae5eb70ebfbec86ed11ed9cee28eeb4ef40efccf058f0e5f172f1fff28cf319f3a7f434f4c2f550f5def66df6fbf78af819f8a8f938f9c7fa57fae7fb77fc07fc98fd29fdbafe4bfedcff6dffffffe10b1d687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f003c3f787061636b657420626567696e3d27efbbbf272069643d2757354d304d7043656869487a7265537a4e54637a6b633964273f3e0d0a3c783a786d706d65746120786d6c6e733a783d2261646f62653a6e733a6d6574612f223e3c7264663a52444620786d6c6e733a7264663d22687474703a2f2f7777772e77332e6f72672f313939392f30322f32322d7264662d73796e7461782d6e7323223e3c7264663a4465736372697074696f6e207264663a61626f75743d22757569643a66616635626464352d626133642d313164612d616433312d6433336437353138326631622220786d6c6e733a64633d22687474703a2f2f7075726c2e6f72672f64632f656c656d656e74732f312e312f222f3e3c7264663a4465736372697074696f6e207264663a61626f75743d22757569643a66616635626464352d626133642d313164612d616433312d6433336437353138326631622220786d6c6e733a786d703d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f223e3c786d703a437265617465446174653e323031342d31312d30395431383a30353a32362e3836313c2f786d703a437265617465446174653e3c2f7264663a4465736372697074696f6e3e3c7264663a4465736372697074696f6e207264663a61626f75743d22757569643a66616635626464352d626133642d313164612d616433312d6433336437353138326631622220786d6c6e733a64633d22687474703a2f2f7075726c2e6f72672f64632f656c656d656e74732f312e312f223e3c64633a63726561746f723e3c7264663a53657120786d6c6e733a7264663d22687474703a2f2f7777772e77332e6f72672f313939392f30322f32322d7264662d73796e7461782d6e7323223e3c7264663a6c693e416264756c4d616c696b3c2f7264663a6c693e3c2f7264663a5365713e0d0a0909093c2f64633a63726561746f723e3c2f7264663a4465736372697074696f6e3e3c2f7264663a5244463e3c2f783a786d706d6574613e0d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020203c3f787061636b657420656e643d2777273f3effdb00430006040506050406060506070706080a100a0a09090a140e0f0c1017141818171416161a1d251f1a1b231c1616202c20232627292a29191f2d302d283025282928ffdb0043010707070a080a130a0a13281a161a2828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828ffc000110800bb012c03012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00f47827121eb533c8a993d6b3e1c418cf5a7cd22baf26bc5737b0e4ccfd72e91d55338a87461c11dc9aa9a8db99a7e33806b4b4f8442171c9ad60e3156135689b0b6ca132dc8aa778e8108518abbbdbc9000accb9899a4e0f143abca42316ee3c9dc0d16edc615735a8f6cae3a53ed2d9236c30c5653ad72d3b0c8e3f2e3048aa0f3ee9d8039c1ad8be2914042e326b26d2c8caecf83eb53cfa1ac5e97257baf2d31d0d64c9784ce4f7cd69cd6ec58285cd3a2d0fce9572a45529248c875a817518dc78c56b689a641f6956703629e4558b3d09a18b7303c552d52fd74b182d8359abb92487cacf5cd3268561448ca850300564fc4b80defc3fd7e18be67366ec00ef819fe95e73e1ed7a6bed462884d8e7d6b5fe2bf8da2f0a786e38a6d92dc6a01ede356381f77927f3af669b7cba94e163e78b3b8f2e16910e37743512df342f92fc93dea46b5616b6e0671b013f5c5569022301328da6949b348ad0b7fdb476fde527e954e4d472e198a513dbc5b018c00beb9a8edf4f69e4214aed0704934f9996a268dbebf244ebb5d727deba4d2efa4ba505f0c3d739ae605bd8da1f2cf952480f22b76c20222496da3da0fa1e2b9e5a9d08eae2ba08aa3e5f6e6b36faf72700f049525ce79350c76ef73f296c7a11c0aaf1e9b7575ac47a7d9a34d70e72a8a3924669d27a9159d91d0db5c07b4546c74c63d2bc9aea14bcd427b9c8c92cd9f72c4ff5aeeb58fb77877545b4d4e0786570482c4107d791582fa7a5a69aa0e0bb7279ade2f5b9c96e871d341e53ef8c1183f31f6cf5fcff009d5fd32fa7b742914cc1402bb73c11d791f8d4b776e092a31c83584b3b4448230c3823dc77ad62ee8992b1d1d9dfdc06262b931c8a5648c9eecbd07f2af44d4ae23d7f4d5d44406583cb3e6a6f19457015c81e9b8038ec467b8af209a65f295c1c91cfd2ba2f0f78a4d95b9548a32eadcab1f95c1182a47a11c1fa0aa24a17b78f0e9575a4cacd889c326eea003fa75a8b50d69b52d32d6ea42a9ac69e0c6c76f13c39e33db2093d7b1acbd7ef85cced3636927040eff53fe7b56619447206ec783ee2901767b969a3791c86653bf3dc83d47a7a1fa8aafe761c904e7d40ea6a282655981601d412ac878047f9355e39432a86e324823d3e9401ad3bf905262aac579dac3230c31fc8d0ba7c70dbc9722e23cbbec30f3920ff009ff38a669fa8b592adc42639268b3b629503a1054e4107afa628bd30bd89752e24520865e847d286032da692166565dc47cb9c1e3e9fcbf1af41f0e3a5e695148cca1d728d93dc7f915c15c8df6b1cf9d9204057078719e9ec455fd3eee586dc794721cee3ec7fc8ac6ad3e75634a72e5773e95bb567394fce9a96ed8058134b6b21270d56a6f9532a715e272b30bdd942580ae4d496a08619231504b707795073524126482a29f24ba1bd4b7b346f28531707935563b612ca473c5431ccca319ab56f311c743eb49dd6e629105c5bac43b0aa0480e3186357afd8c87ae3159ac046e093cd26fc8b6b419aaf0aa302ac69722ac233546fdf710b9c8ab56b16221b6ad5ec6a97b8589157792075e95a3a64cb1ba893191dea9c6991f38c1ab0a884103834db4d58836aeb528fc8f2c1049af15f8a3abba3a84e39c66bd2ae130064f35e67f11ad63781ddb194e455d1569a6c4db39bf0f78824b5b8490336f1d0559f8a77b75af59e8f3dd46408262a33dc30ff00eb56078627b56959e523287bd761e29bcb2d4f425585d418e5490e060f1ffebaf4afa9d1a389cb6b33cc5becd08fba339f6ac0b9b8bab440d328922ec73922ba2d5eccdccf23c4e55fb106b8fbe8f500fe4cd92a0f6535492bea66eeb62cdb6a6b2ab2f2a47407bd589b5016f083bc82792a0d2787b417760f72bb5339248ab5e21d0554bfd9f2db40228695cb5cd6b9486b96e42fd9ecc79bfc4d92493eb5b7a3f89a7b653b81f2c7f08ed5c6c026b291d82a93d0820f15a9a335fea37496b670a4b2ca7685f2c1e69ca0ac285495cf54d0b55835008611fbccf233d2ac78c35d97c2861d5acb725c48be4ac8ab90a4f53f5c0a4f0cf8667d0602b7ad1bcac371d9d07b56d1f0b9f1cc0da65d5d7d974d8f134d2a005c36485001f5e6b922ed268ea9276bbdcf2cd0ef753f10477c2f2ee6ba4499664694ee2a4839e6b4b5291b081ba818af44b0f0858786e16d3ed1d6772774920e79fe119fa7f3ae0bc476e6db5696ddcaa15e40638c83d0d6f739b796a66c28382c7f1c560f886c4873716e0b7f7d6ba154dc9853902a2961cf2c7a55c65ca3947991c0199f69da72bd0fb55713347206cf5e0d747ab68eb23b4906558f2463835cecf0bc2db655208ad94d3473ca2d124efe620cb647d3b7ad542edb4231fba714e47da76f38eded4d7ca9c9e57a71e945c91d923e6ebfe34aa854ba100938e7fc290302bc74a72b018c9e9c668010eef91586546781c71f5a76e2d1ed076e0513bb3220872e2327e5072793e940b4bd96cae2e96ddfecf190acf8e14fbd003ad672f98d4b91d71dbaff00faabb9d07438eff4f59a4b87888629804f38efc0ae47c3b0431ce6e654388a32ea8c40dec3a7eb5ecbe1af09cd2e8d6f2caaf13c8379445da067db359d49f2a3484798f525b707e618c54376c42edaaeda86d501793517db0c84b36327a5794a326eecc9475d4aa47ce49c8514fb0984d786256a65d93e53b1ea05704bafcda77884923e4aeaa4937667538de08f5d92dd62c64d445f671918ae563f1235eb4615b39eb5bf0ab4d086ef58568da46528db412f656edf9d323cc89f3734c9e401b6bf18aaff0068c11b4e2b274db5a0b94ad7fbe2937761daa6b4d5551155881ef525c059464f53c553934e5d991f5a71837a1a4eea28d5fed2465c03cfad5ab3bb0e096231eb5cabaf96c01e2b4ecca942236e6bb30d974ab6bd0ca52b21fe22d7edf4c858bb0000ea6bc9fc55abcfad4321b40593d7d6bacf1d583cf6ae0a971e95ccf852344dd038e07041ea2ab1f86fa9d3f6b0d6db852b4e5691e716cb710cf80194e6be81f875f0f3517d0d6feee3495274dde538ce56a969fe1482ff00518523883c8ec000057d29a4d92d96996f6c07114613f215e552c74f1b2e5a6ac96e74ce9aa4b5d4f8e3c476f2e9fe21bcb603cb11c84056e30bd47e9546f6fede28770457751d5ba66bb8fda21ac97c739d3a785e4f2156e16320f96e09e0fbe315e550ab5d5d2a7544e4fb9af568ca4e29b04d58ebbc2b6b73a81692ed4a8ce555b8cd767e2fd1ac6ff4ab21a1c04df84db304e8c7fc6bcd67bdd5212ceee24854646de08aa71f89758b39c35a34a9b87396e315a72be88a538f518dbe3bb92db518592e2238208c1c7f5ae8f4eb69749852fec4f9b23765fe015ccea179737f731dddd280eabb78ee2a4b3d627b51b15894e94a7193561c2704ee7a2e9be219ee10adc2fcd8e0d6c44fa969ef34fa7eab25b24d1aa4b1ac6a49c7a13d3ad703e1bbb92f7504565183c93e95dc5c5d47348228f93deb384526ee454a8dec6d6812b4d03333166cf249eb583f12b488350b48ee8467ed30700a8eabe87e952c3aa8d3a5309520b0c8c545ac6a4d716e235e09e5f3e9e95abbad8ca2aece0a05100f989438c75ab0dfbfc146c11d78ab1a968dfda0cc6dee1e224e300fcbf976a2cb474d3613197677eec4e6b392b2ba67443576b109b51b013c9accbfd3629721d79e99adb73b076c62aa492024fa538bd07385cc5b3d1a2ddb42e7d4e2a9f886c22b4f294040dc931e70587b1aea20955070b8ef9acad52dae353bfb41144a51721a47ec0d09eb725c34b24736749592059e0475527055b9fcab2182800b671ea074af4296c62d3d248e30e631962cc7ef3638007eb5c3ead0185bb63a1ad69d4be865569f2ab91c72c503060b1c98e77608cd6bff00c2433c3a7bd9db9f2ed5f896203e593dcfa9e6b9c661e5b0c7d2addd5b5cc3650dd9b7905ac8c635971f2961d47eb5b5cc52366de78bec6ca9b8363705033cee1c57d33637528d3acfcd5c486042c31d0e066be7ff00869e169b5bbe8afaee178f49b76df24ac302423a22fae4fe95ebb77e26812e19093c71c0ae4af357b1b524f737b4e81675c8e055c82c10cdd38ac2b4d49602431e4d685b6ac1c920f35c7a9835623f115cdbe9d6d21760bc75af1cd675149ef259225dea3a30aeb3e27b5c5d59398c90073c5667843424bdd1019012f83935d987a6a68d7dab8c5230fc35af93abc107676dbc57be6950b4960ad839c5794787bc171e9fabb5cc832776467b57ae69b7a90c422c82318ade5878c9599cf2abadcc3d5b89483f7bd2a95bc2e5816ec6b675b80cd26e8ff3a4b1b78fc9e796f7ae0ab074dd8d232ba2a74e33c9ed50dccc6318ab770aab73f4aa57e7f72c4609ebcd289d13d52388f13ebcb6b72630c73e95a3e1cd4a4b82a589e79af34f8897a46aeaaa4023ae2ba0f09ea12a5ba385663ec335f4783768729c53dcf5d9d219ed42cc064f7ae0e0d224ff0084a238ad867cc246052ebfe2c1a4584735e4532b3ffab42b82df9f6af30f11f8e352bf94981cd92608fdd310c47fbdd6963546a52953eac5076699f49278afc23f0f487d63515bbd548c2dada0f35d3d8e3807ea6b86f887fb43df5f69d3d97872c8e9c241b4dc3c9ba503db1c29fcebc1bfd4c61f712d22862e7a9cf6accb872ef8ce73c578584cbe1858f2a77ee6f39b9bb9b7a35fcb2ddced72e5c4c7259ce4b37d7bd74569746073e543e611f3103a9ae3271f656b38f3f328deff0053ff00d6ae934b9a42e1e2e587515dae296c116f635db5317b1cb0b5b3c406377f797f0ef4dfb4c0248da786530af523835764bcd32f114ddc662b8518c838aaf731e88872f7123e4742c5bf4a0d6ced719abea7a7cf6e16cdb90460639c7bd62f04fb532f5edd98fd963d91e78c8e4fb9a6c7b99400393dea547b19b95cefbc1fa45fcda35e6a96d0936f6c4091c75c91d07ae0726ba3d26d5e775b8427df9aaff07efa4b2d4e0b29a566b4ba9177444fcb92319c7ae09cd6934f1699e2ed4b42b802defa262f12744b88cf21d3df1d57d41c7a554f0ceca6888d757e465db8d3d1d9647c6e15c95f5fc72dc7902658246270afd49ae9a5bdcc64b1e6b87be11dedfcf25ec319651f24806187e358d9b66d076dcb36578b15f490b386c8ea3b91535c4cc59b71c8acd82ce259bed02472d8e84d3a79f3904f3594d367541a12e24c8f6aa05ce4d3e5938e3a1a8b19fa54a2992173b70b51c77d710ee40aaeb9cae78c5274e49cd35f1dab456ea44afd064d3c97126f98f4e8074158faadbf9a8dc64f5ad426abcc8581ed4e3a3d089ea8e5ecec8c974a0e36e7bf7afa07c176ada6782eda1b88e2b982405991d011827d0d78dac41650c474e86bd63c29aa35c785c42a773c3f211ec7a53acddae634d5a5634f50d72382d85bc71058f180abc003d85602c3e68dfe5f5abd269d2bed9240719ce315d2da69d1c96e876f6c722b867172d8ea8c9459977763221ce7033d2ace9d09ed9cd6bcd189241b866adc166102b0c014a52d2c70bbd8e735cd38cf63206c924631593e09b85b6925b57e0a311835decd0a3c522af7e335e57ae79ba5788e378f21246c3574e16a5a562ea7c08f45950cad9414e11984649a34693ccb60ec6a1d42e37314535ea35a1c37d4d4b071731853dbbd36e330e71c014cf0fa36e20fa549e29d42cb48b433df4c91ae3e55cfcce7d00ae6af1bd95af72a0cc5bcbc8d18c9712a469dd98e00ac2d63c57a5c513456c5eea5c6372f083f1ef5c06a9ac5c6b533dc48db632c7cb8f3c2afd3d6a0d3a07bfbaf2a3cf96bc13ea6ba2965d05694caa9886f634f4e8f4cbad5bed3a85b2bc8cdc6e1915e8835bb4d2fc8b5b2b551249d5c2e020f6f7ae322b6b7b5b8895d87ca3278ce2a4d6cc8244bb85802872483fc857a2a29688e5e6bbbb394f8af742efc517291b48e21458d43316e7193f41935c6c5a733c81a7ebe95d0ea73096f6e26551be472c58f249aa96aad3499278158ba69bd4d949a5a197ad5b98ac622bc05257f0aa1a443e7df22ed0c323f0addd4b134e6cc9037a820fa106a7f06e9eadaa42c10c9079814b63827bfe1d6b926973591b45e97307c430bc3aecc8e08c6dc7d315a1a4dcf91b1bd2a6f1fda4b6daf167cf94e329c74f5159303fcbd6a24b52e2f43b26bcb59e30ad1ab03deb2a75b659182000562c8e7aa92ad55dae27190189a848be646c4d2451aee7608bfa9adff00861a3cde34f1c69fa644852c84825b86f489796fcc0c7e35c7e8da5dfebfa9c367651493dc48c142a8c939afac7e1f782a0f875e12695cc6daede7eee4653b822f6407b9f5356919c9dcddd6b4ed29753b69ec2c6dede496f6352f1a005b6e4f6fa5707f1dbc3f6bab69b2eaf6f2fd9f56d2834b0ca0e37a8e4a1fe60fafd6bbe8a091f53d3e391b8b48da671fedb0c0fea6b9cf10e82fe2bb1d4ece36f9a48645472703791c7eb5e8508de93b9c756569e8797f8335b87c4da736e212fe251e7c7d37ff00b6bfd47afd6b46f3c3f2dcaa8b59963933fc59da7eb8af22d11ef3c3fac091418aeada42ae8c3d0e194fb7515ee761742e2d6def6d831b69d43a13dbd54fb8af3ead271f791d90a97d0f3fd6e4fec5d4859ddb47e795dc4424b8c7a9f4fa5412bee19357fc456b7f14d7332e9f2b468c59e5552c0e7be7d2b9d371955c9e7bd73c9268ea84ae5a2c46053964c75aa3e63773814d92e30bf7b9acf94d548be655278e82a179b248159ef738ea6a35badcd81cd1ca0e48d10fea682c0f5aa8b2700d6a689a74dab5e2dbc180719663d147ad525621bb99ce8376eaf62f0278627b5f093de5e4252595bcd8c77f2f1dc7eb563c33f0eb4569926bc79ee8af3e5b10a99fc3922bd6a2b7431040a3681803dbd294e5ccac38c2ceecf35b6c243bf861e86b6ada789a152428355fc49a7ff67b1f2d71193c63f95734b3c8b90a4e2b9fe1dc6d5cdc13c6f2614e39ef5a51b964c019c77a825d15964caf3df35bda75928b73bbb0ae46ce56ce5ee6f0c0e43102b98f12da26a84491f0e3915abe27654bfd8bc0e6b15e49216dc391d4574c5db5453d55997b49bab8b5b411303c0c1cd5ab1579ee77364fb541a66a105c3ec900dd55fc4fadae92890599537b30e08fe05f5ff0af4e8d4751a89cb560a2ae6a7887c576be1d88c56e167bf23ee67e58fddbfc2bc57c45ae5eeb124b737d70d2cd2b6c4cf451ec3b55dd4a432162cc599b92c4e73ef5cfddba7990aa9c95049c74f4af4541416873abb2edb825142e7210fea715d369cf1e93a696c8370e308bf5ea6b9ed3396cfb015765959ef5c94578b85519e781d6b44ec16bbb16e167925695cb6e272cd561aedaee378215dea382ddaab4301b841146ec14f2fd8e3d2b774cb58a18f622851fcea897a1c0dd4782c00f9b38a92d2211a13e9fceb5b5fb17b4d41c81fbb93e607d2b3dd963423b01cd4dac56e73ba8095aee4922e1910e335d87852cd6de0dd0b641886d39efdcd72f2b6e91df0067e6c7b56f685349696d19604c2c3e56c74f635e7ced7b9d718b68d7f126989e20d3c056d97aa72148e091df35e7f71a6dc58b98ee232ac38f6aed2f6f806dc92146ce4107a54126bb148146a1691de20ea72518fe22a5b4f70db638df21d800a09278181d6bd1bc13f0a6eb538d6ffc4d3ff63690b862d30c4b28f4453fccd65e8de2683449de6d1f4bb58ee5892b35cfef9e3f65cf03eb8cfbd41ac788754d6e769351bc9ae18f62dc0fa0a9d0a777b1ef7e19b9f08693314f0f59d9db15f97cc400b9006065bae7ff00af5ab71a87daa78e791c7d9e11b902ff0011f5af996c2f6f6d6502ce631e5812a5b0a7eb5ecde12d722d5a2b38ae5c38791566641d31dbdb35a423ced4519cdf2abb3b59279ad34692ee507edd7a70899ced07a0fcab474581b4fb58a19bfd74983213dbdaac4b6d6c9782e9e43348a311ab7dd4fc29f194de2699d55739cb1fbc6bd78a4958f39b6ddcf23f8cde05593555d6f4e08be6e05cafdd0cdd9c7b91d6ae7c20748679743bd5dd6574434418676be3dfb1c577de2d852f3462a42b640da08ce4e7b560691a2adb343725712abe401fc27fad44a0b94b8c9dec745a9f82e4b60f258b87423fd531edec6be71f15694da26ab716d796ef0bee25432e32a4f0457d7315e878d7239201cd6478a3c3da578a6c4596a7024840ca3e06e43ec6b86786bad0eaa788e47ef1f1b5cdd28c85a6d95bdf6a5288ecede4949ee0600fa9e82bd53c5be0893c1844ff0063825b294e22ba099e7fbadfdd35434495f6be7f8bb579d52f0d1a3be32e7d51c1eb5a15ce9f6e9249287727f78abd16a85ba85c735e8d71a5dd6a9753db4319924685dc8ce02aaa924927a0e2bcfd531c5383ba07b9286c75aef3e1f3ac0924aaa199ce18f702b848d4920115e93f0e74f7556f3570afd33513d8d60aecf4ad12f42b2953f515da69b788e5471b8fbd72306986150ca3803355d75cb7b4bbdb13bdc4a3fe59c0bbc9359a7d8d5d92d4ee75cd392fad9e2906558707d3dc578feafa7ea5a7dfc96ff6696655e55d17208af4fb49fc4f7f0a341a75a58db95dfbef6425f6fa955e82a98bbd6a6459208b4ebb8d8713445b6b738fe944e165cd2d0883e7768ea699b8b624e41154efb5186185c21c561eb1af5844adb26553f5ae4db594ba98849f70ae28d2babb38f95df522d76e0cd7ecf9ef55ae2e505b7cff007ba5497f113f30e6a86b1a7dd5ce9ed25a216206735b256d0bf432bed1241742543f2e79ae7af2ee4b9d46e2e256cbb6793d862baff8671db5ef8b2d2db5a08c8a8efe531f95dc0e14faf19e2bdb22d1fc3511cc7a269a0ffd7ba9fe95ee6128aa31bbdd9c9524e6f4d8f937506f325843c844646d201f4aa3295177c6d08ab8183ef5f652dae84a30ba3e9bff0080a9fe149f65d1589ff894e9d9ff00af64ff000ae9b19f29f25dac82387208fce99e4dd5ef16b0cd33f45112173fa57d653d8e86c57cdd2f4cc039e6dd38fd2b42d753b1b65096de4c2be91a6d1fa0aa6f4048f97747f0a78e6e4016da15fc91facf0ec1ff008f62badd3be1ff00c4072a65b1d3ed17fe9bdd83fa2ee35efa3578187fad073f5ab5672db4ec0c8c48f41c54eaba9564f73e4ff88506b9e16b98adf5fb30904d9315d404bc32e3a80d8ea3d08cd7242f12e546c61b49e79ebed5f71f88b41d2bc45e1eb8d2b51b48ee2ca453fbbeea7b329ecc3b1af907e247c2ed4fc0b28ba83ccb8d2653f24fb79427f8241d8fbf43592a929683e548c05b5b49a39e692731cc3eea9ee7d3f9f7ae83c1932cf67f679115d559860f6e6b8f8d8ff0f0c0743fcab67c237460be9509c12d9fc0d735789d349ab9bfaef86619479b685a26eeaadc7e55c85ee93a85b9fdd1120cf46183f9d7a844ed2a053800f5f6a4874c86794995b728e80719ae672713a15353e879859e8dac6a13a436d66d3487811c2a58e7e8057a1787be08f8db56d8d3c16fa6427f8ae9b071fee8c9af44f09c2d62c0597ee067276f15d56bde378bc39a4b5d6a57412351c67924fa01de8552eec2f616573874f80361a6da35c7897c50fe5a0dceb6d005cfb02c4ff2ad6f0c59786f48b1fb3e980a4064dd18662ce7dc9c727debc83c77f1827f100305bdabb5a86cfef9c80ff551d47b66b84bdf17f886f49297b2c298c6d87f7600f4e2bbb0cfd9fbd2dce2aeb9fdd5b1f5ec73452ae54a87238dfd688b4e00fdaaf26fb511f7102ed55fc2be43d2fc75e25d1a60d0ea93c8a4f314e7cc46fa835ea5e12f8dd6d26c835eb49ed4f03ceb53bd07b943cfe55d70af17b9cd2a2eda1ebf25f3c5745aee3708d85460b958ff00c3eb57e18f83b7041e57d3f0ae693c53a24f68b3699e22d32e63719d8d98e45cf3f3293c7ffaeabcde38b4b031992137009d8a6d0348339e876e6add45257255368ee44e52172782abc547f69789fce04e57637ebcd66595e4d79a72cf3da3599939589df7305f56e383ed57a652d66c17ab002ad5ada99b2ef8b44579a05da4b0acd67b434d091f793b91e847507d6be79ba8ce87ab5edb49fbc8e091901c63701d0fe22bdfae63ff008945e3066696784db853d00c63f99cd7877c5ef12689278aa4b3b1864135aa8b7b8b90c0c72301ce075c8e99af3f17454a299d785a8d49a397baf126af25bdd595b34705a5cb0f34220decabd14b75c77c550d3745b9d4ef12ded87cedc963d147a93e957f4eb73a8cf1c566824690e011d3eb5e8769a447a569c62b762666e64931cb1ff0af36a54e45647a74a9f33e6655d07c09a4d9a17d4aedaeee0fdd0abb517f5e6acbdde9fa5dfc5a7688b26a1a9cce123854e1431e809ff3ef8ae5aef59bbbcbf8b49d25b7dd5c4ab0870d81b98e0007a0e4f5af5bf09f816dbc21a7fdbef12d6f6e42799742e412432310043c6554b60ef20938e94a149b5cd50a9d649f2d3432cbc3979a8d8b5ef8c75c4b2d39300470fc899ef92c0647b8cd762b2787fc1fa7c9752c76fa5c088d18738df29e0862dcb107d07a9af3fd67c4763a4451e9d6f2d9dc6a36aa595a0919a350dc84da78623bf007238eb5caff006b4f7b2b3de481f27e6de78c5655316a93e548f4b07934f1b0f6b29d97de75b1fc68d288f923bb8d91dde3b7b303631da405e546412771cf7ed57f4cf8836cd668ecef1b37cc525dc0a67b631d057885a5edbe9fe2fbab94b436d633bb2c259788f27b13eb8fd6bac7d43e6ea6b3c5e2274da8c3fafc0eacb729a788839cdd9ad2d67f7efd4e5ef499e4761bb049ef59f1dd4d673661c919e86b46c1d5cb2b75abba6e982ef505040db9cd56caecf9b352caf257b08e5b8054b0cf35d46a7aac1a6f8282a106f2ebe58f1fc23bb7f4fc6b3bc49a5347a29f2b0a153afa570b3ddbcab1a48e58228504fa0ae9c0d0f6d3e67b22313514229477665c372f1de1951996456dcac0e0823bd7b0782bc66bacc6b697aea9a828e0f41281dc7bfb578c5eaf95721c7dd3d6b63c13e1fd43c45ad08ac8b430c243cb75da11d88ff6bd057b5522a470c743dfa279246c2b71dcf6152bb9030188f7a7aa086148c316da002cdd58fa9f73503d64d591b15e47393cd547b98d0fccfcfb541a94b279c63070bdeb38463f898b1ac9ca0b76672958d84d4107466ad5d375645201735c9fc91fde207d69925f43011b995b9e991c7e66a5568ae84f3b3d6b4ed4598020f15ad2a59eab6b2dadf431cf04aa5248dc64303d4579069daf4b1b2884b053d32b906bb2b4d7e2f2d64932a4f50bc906b5f6b4e7e4c7193d99e33f167e0c5df87659358f0e6fbcd1882658b1992dbb83fed28f5ea3bfad794e85b8ea4c475603bf4afbaacafd2eecca09b01d70b22ff3af05f1dfc35c5f5e6a9a2c2915dc6c64bab48970b20ef2463b7a95fcbd2b2a909ca3e87553693396b47fdc8c71c735a36101958053839accb5f96300d6ce97bc9057a57054677d33afd0c4910660727d2bce3c49a26a5e3ef14a19a7fb3e896f901c75241c1207a9f5ed5dfc5726d6c241c3492a98e31df26ade81642de148d570000338e4fe15d781a2a4dcd9c98cabcb68239a8fe12f871ed4451c3728c063cdf33258fbd709e36f8657ba15abddda38bab441962061947ae3d31fcabe83890edc8573d8e4e3f4aafa85bdbcb132cd1c6e661b0c6c0b6e1e9f8d7a72846c79ca4ee7c5da844783db9a65adbe4135df7c4ff08c9e1ad49a25576b67c3ab9420293d573df1fd2b94823db6f9c7535c7c9ef1d1cda154c244808afa03f67eb481bc3b7b70d121b95ba2a24232c1762f19f4af0d299c1c57befc159a1d33c077375704287ba723df0aa2b6a31d4caa6c7a34c0b4883b9a7f98b0dbb4ae7e444dc735c9d8f89cdf4f36c40630d88ff3adef115d41696b0a5d4822849f325627eec69f337e82ba5f9982f2399f8a9e36ff00845347b4b2b6d8fac5ca17407fe590ef211f5e83d7e95f35dcbc93dc191d99e591b7331392c49fe7cd6af8a35f9fc4fafea3ad5d13bae5f1121ff96718e1547d0569f85f4a8cc06fee53715ff56a7a0f7ae0a951cfd0eca70e55e64fe0ad6974447290891f3fbe18c48a3be07a5755a96b37de27be8745f0ec329f34aacb3152028638cb1fe15e7935c945a6c9ab6b0b169d6aed31e5dc0ce06705b03fc9af6bf0e2f87bc233dd69ab693dd5cda98d9e61265a79c290ca5790ab86fba7d39f7e3abece2d4a47751855a916a0ae96a6cf82fe1cd8f86b4c9a5167fda37a7fe3e649e36254c6cae1123048ec7041e485f7c51f136a969e1ed0f53d4924b912431988c975b5a59ee08deb2c6412301a46cf5e71d856beafa926d5d49f53c9b69bcf96e629861231b4042a1461ca9f43c6403935e31f16fc477575e1f7d39a381ed0de9ba6b88e46ded91c000f45e7bfa7414bda45b1ac3cf95bb6df81c76822e2fef64d5751b894b3c84eecfcceddcd76d3ca96f69831a070e30dd4e2b8ff000f5ec32d9f9cb132245f2c687fc7f9d6bb4aecfbe43b8ff74f4fa62bcfad525cef991f4d84a1074e0a84afcbabdecd965248ee2ea1b3741223905a23fc4808ce0f63cf07d6bd293e1d59ec5fb35fccb0e3e50c376076e6bceac341371a5eadae45349bacadd522814025e427f964af6f5af75f0fd9cf67a258daea173f68bd861549e4f57c735d985c3c5c2d35a1e7667984956bd2938c968cf996daec89b2a79cf4aec6c1e7b545b82a4ae32715e757cb258dc9591590e7a30c57a95bdfda1f0e4124dc0f28671d49c74ae7a919369475b9e1f3f2ad497c4be235b8d223b484f120dce4f503d2b84b894738e29d7b7864909e80f6f6a343d2af7c41ab43a769b1192794fe08bdd98f602bdfc3d15429a8238aa49d497332ef86fc3f77e28d412c2cc74f9a49587cb127f78ff87735efda268b65e1ed2a3d3f4e42234e59dbef48ddd9bde9de19f0f597857485b2b3f9e56f9a79c8c34afebf4f4156e4627939ad19518d88263559daa696ab3d66ca28dfaa792ecc30154b13e98af3bb8d7dd9d96152c3d5f8cfe15e9ac013cd65ea7a45a5fa9fb442a5bb381861f8d72d5a6e5aa071bec79b4f7f733121a42abfdd5e0541bb073d6ba0d53c31736c4bdaff00a447fdd1f787f8d73b22b2b15652a47507822b95c5adcc5a68b96972f13a949193b641e95d5c9af410df4724092c70305526439527d0b0fd338ae05e7f288cfca3deac6a8b7fa6430dcb2c525bce990aa7e623d0f634b9ac690a7296cae8f72d07526487ccb66df193f3467a83fe3fceba9b0b88b53f2ee607c4d11dae0f503dfe8715f38f84bc642d655fb3b6e45386898f2a3d307a8f6fc8d7a9e8dacab5c2eaba4b060789a1cf0dea0fbfff00a8d7652aced66352b68ce77e24e82ba3f8949823f2ed2f17cf8d40e14e7e65fc0fe84567e96bb31c57a978feca3f14f8246a3a734be7d9319808f1bf18c3a907be3079f4af1b86f2e2dc6f05a44ee1e3507f02a7afe15c55a369d9b3d3a32bc6e75d616e27bb12b2f11ae149e83b923f4ad297c45a469c0a1baf3a51d52dc6f6fc4f41f9d79e5f789ae5eca6b54b65863600172c4b91e9e80566c7732c518118e4e38aeb78a54a2a14b54732c2bab272aba1ddea1e3abdc37f656951eeecd732163ff7c8e3f5ae2f53f19f894ca167ba301470ea12255c11c8238ad0d390cc4f9b93c649e98a5bcb25beb7789c8d873b58afdd3eb9ae59e2ea3f899bac2d35f0a392d7759bcd6f4e165a94de6db292c8a1554231249230072493f9d7397d676896308b33319d73e60908c11d8aff009ed572ef7433490c9c3a12a7f0ac7d46efcb185e1bd6b6a7564ba98d4a51646919621402589c003bd7a9847d13c3769a533e644064971d03b7247e1c0ab3e03bed2aebc356d75169f68977092931118cf98a386cfbe41fceb36f59afb55099ead935ebd18ab731e6d495df29d17836d6469208f9cb107e9ce6b95f8e7e2479750fec58252de42037041f5fbabfd4fe15bfa878857c2da4cfaa1237afc9127776ec0578d325eeb77f2bed7b9bfbb90cb211d493d7e805635ea69cab734a50eacd0f0a6951ea3201704f9112ee603f88f615d0833ccdf61b286591e5936848c7cc4f603daaaf87ecef6d267d32d61927d427944282252d938e83df9af70f0ef81ed7c27a4c971a94a25bef314cf1c241127cb930b1233e5824640fbc47a57054a8a11b9d94e9b9cac8e2344d1edf4db7b69a17f35dcacaf2ff000b3a31fba475553d3b1233e95a37769723cd92488a22b1766e9b893938f5cd5bd73527bf944922c31ac7188d2385022228e8a00e9597e25792d2ef6fdac4ca1136ba371d0702bc39d48d67294efbe87ded0c2cb0b4e14e8a8a6d7bde76b7e652bfbc8c43f662ca32f966271bb1d07f5ae4bc69751ea9acfd92ce05850448672abc021402c7dcd5cb3b6975cf1125b2105d412b9e990335d078a3c3775e0f826d56e2f5754d3eee48e3d41248846e1f90af163fba3b56d87a0dc7991c398e3d53a8a9d45beefc9ff5bf6390b4b4489511176c606d45f4f7ab4410c430c30ea0d5cd3916fe58da13fb8072188c669754b8325c7908a9b636d8095049c75a250bd3e79bb31d1aaa38a74b0c938b49bf2669f84b56bad02e7ed50c2f241346ace7b6c8e64f30e3b80aed9af4ff0004437cb69a9beaacb2dd49a84ede6e31bd410aa47b6d02b9ad3ad6cf50f035c8926816e103d842ebf2f94d28556423d4d709f117c75ade8dae41a7d9dcb5b082d22574039dd82727df0457a54fdc82573e631b3e7ad39dacdb25f8cf6105b4913c406fce781dab015667b68924dcaa0038aec3e263477da9428086446dc40ef8ed5c64f74f25da416ea659e5708a07724e001f8d3cb20bd9f3c8f3ab37f08db5b56bfd5e0d36c55ee2f6760891c633cfb9ed5f48781fc236be0ed299176cba8ce01b89fd7fd95ff647eb55fe197c3db7f07da35edf2ac9ae5c2fef1fa8841ea8bfd4f7fa5755764b13e95eadefa9318d914a56dc79e954e56c74ab329154e4a928898e6a17a99875a84f5a9604469952360546dd38a86877236506b3b52d22d35007ed3102e06038e187e35a44d3722b394531ee79ceb7e1e9b4f62fccb6c7a38edf5f4ae57c5b34b20b5d88c91226dcab7cbbbd71dbb57b8322ba95600a91820d71de21f0b332bc9a68041fbd037fecbfe15cb528f508ca54f5478e4f1212a5731cc3a3a9c1cd6f785bc4faae837a2429e7a1e1b68fbe3dc77aa7aa584b6f7651d4a1ec18743e868d36f5ec6f237645dc87387e47e158f372ec752a70aba9f477833c4b1496ebaa69d1c8d6937c9776ae0823e99ea47af7e954fc41e1eb3b5baf32dbe7b0b9fde40ea32307f84fb8ac4f08f8d03c23cd917611c838e6bae5f11585c59496d1a04463bc0c7dd6f51513aaaa2f796a7452a2e93d1dd1e57abf86ef1ee256b554995cf0a87040f4c1a8e0d2a4b463f6e1e53f7563fcabb3bd82e0dca5cc0c16656c7eef3b5d7dd4f43f438a87c4ba67f68d8a316314aa73bc2825477e0fb66b2526f466cd7638ad7355f2e23159412b84197f290b63dce2b0e2f116a37b15bc68e4f9afb618c28c9ff3fd6bdeb4bb6b2d2b458a2d34016ecb9f30f2cfea58f735c2683e15d2745f10dd6b264792dcb93691c8b81082727ebcf43e98adf1186f63152bddb39a8623dac9c52b58f3af18e8379a44d1cba82912cc3713db9edf5ae02fdfcdb86c745e2bd6be30ebd0ddc76f02396983970be8315e42c39c9ea69d3969762a9157d0eafe1dea66daeaf2cd9f02e103a83d372f5fd2bafd36458fed17970c15225c9635e476d74d697b0ce9d5181fa8aecf54d5923d1bed449db29ff4387a798fd3cd6ff6579c0ee79af4a9625468dba9c4f0ded2ab7d3a983e27d5e6d73543e639fb2db1d91479e9ee7deb63c2172f68b3fd9a3df793e22817bb1f403bfd2b93b4882f2ed9ee727963d6be8df82be121a65ef86f5dd52e2257bb7768a2ce44636e1100c7df624b1f455cf7ac1c9eeca514f445df037801b488ecf52b9d6dff00e1259a5631c118198b613bc1ed9ecc7a0c11cd6af8ab52b9bcb71781628e19e6936b46082ebb890483ec473df35d2f89aedf4a53756f359cb0cc1d21b487eeb8791501761d546e738eecc7d2b83f114efb3620c41bd9ff00e047aff215e463aada36ee7d2645414ebc5c92b2ee6244bbd9cbed2c0e413c66b9ad596517de431f94f2befc715a777637176cde44e178e433607e75cf5e24d1ccbe6dcc61a3e9ba50715c509b959b3e86785841d4a706d37e7b22969b7b368da8cf2799e5dd6c78e390a938908c2f03df157bc7e9e3dbed02ca4f155a243a640e18b441412e78dce01273dbd05518eddf53d60de9909b3b79ada5bb78b19453205cfa75c57bcfc50b6b997c2126626d8b22b306da063f0af6285e145cd9f2d8f8ac4e323493f23c42d44f656b6a4fca1a3578c01c104706a6891bcc7964fbeec5be9935b134925c6836302dba89acb31abe41de84e473db1d2a7b4d1aea6b657f2609c13f3104e47b66b8aa734dd93d0f5e8d4a18382972a52d9fc866833e951787b51d3112686eef2f606c2b7cbbf9d857eac3f4aea35ff881e1bd3b59bbb0bf675bab57f2643f6657dc401ce4fd7f4a4f0c43a506b2b7bab7305f9bb47f2ba9428ce1339fef7cc7d78acbf15cdf0c13c4da9aeb96ee754139fb41292905f032460e31f4af4e9c1a8da4cf96c4d4854a8e715a37b1c9788a5325c32237ef0f53e82b0c5a6c3b94fcc39c8ea0d5b4633cb2cac79eb9accd4f528edc150c38ed5e851a71a3051ec79939b9cae7b1f837e2b3c091d978a250ea30ab77dc0ff6ff00c7f3af518aea0bdb759ed2549a271b95908208af8d5c4f75879898213d323e66fa0aee3c01e22d43c3400b472d64c726091890c7d47a1fa55a6db293b6e7d15303555c7ad65f873c5fa5ebff00ba8e648af02e5a062037d7dc56dc894d6a5149fbd406aeb460f6a85a300d00537ef519e9561d319a81d48a96808cf7a6538f029bcfa566ca43c54379796f6a81aea78a10dc032305cfe754b5fd66df44d3cdcdc1dcc7e58e307991bd07f8d794ea31bf88f516bdd567932dc24319f9625f419ac6738c7465c69b96c769e2397c3daca989b51b417847c8f1b863f8e3ad79c3dbf986485802ca48e3f98aeefc21e18d212e55a2b7324df772ec4f1fca99f143c372e957506a1650f9515c0da42f45703a7e239fc0d7154926f43aa9c1c37383b7596ce6f94b6d1d45765a1eb6ab8591bf3ae3125727f7df9d383953f21c30ae77a9d29d8f6bd23528e40016e0d6c074906d70a54f7af19d0f59785943b9c8e3ad7a068badc73aec6619152f42d1a172ef6920b62e4d93be48f427b7d0d79ff8a355d5f53f131d1f48b29dae1481b36fdd07f898f403debd616c21d4ad8804364734e16b0e8fa6dc3a4423918ef95cfde91bd49eff00d2ba70d055e6a337b1cd889ba306e0b73e75f1fe8cda46b5f67370d71fbb52d23776c7cc07b03d3dab939971cf6af44f1f29bcb737247ef11f24fb1ff22bcfa519535be2697b1a9cab639f0f53da42ef72ac16ad739089ba473b5327007724d4da9d8cf69a80b49e466fb3a2fdee02e46703d3835d2f816c9752d66dad9467e65427d33cb1acbd695b59f196a8f0e4c735d1fba467606da31ebdaa29b726efb23ab110853a7151ddff005f99e81f053c1da6ebdf6fd5b5f6074fb188b888ff00740c973ebe807bd7b3e8705d4fa5697a45aa1b58c35c4d35d381e74a0f2cb1927ef1c852c3006080718acaf0643a2786fc0f77a8de5b19116782d96c636f98c83e654909c0c92c18e780001cf4aeea6864d460b1b9d527b3bad4fcc709a7c0fb6292556c8467c65963c648e9b867b015751735a273537c9af538ed5657b0d457c37a3e9bb34dd3e3506ea6e594b12e517fbc46e3df8ae5b52bc9448c245555ce3630cfe75ddf8a75396c357919a31e623060cbf3063d4f5e9cd707abea30dedd4d332e19d892abc633ed5e262a32e6e667d7646a8cd38495f430ef84770311feed5b9702b0f54d32de3b6664f9a424756cd6bdd4b6acff00eb0838e8322a9fdaade1bbb57947991070cd9ee05674d4b995cf5eac2953a7251576bef32ec62bcb1b6d574d6db0daea09189e3400b301c8f9ba8adfbdf11f882f347fecbb8d5a696cf0061d119b03a7cd8cd518dcdd5d4d3b0c195cbe3d3278152940a4803a57a8e6edca9e87c4af8b9fa9ccdf69b70b9717b3963e8d8fd0550b4b8d5b47bafb4d85e4c92039396dc1bd883c1aea2e9775664f164f4a22dad889ae67791db780b5fb3f10789f4992f1974fd42ce299e79e5980fb4bb80144608ea3af3db8158de2cf87866f11ea37377afda092e666987da2408f863dc7e9c71c5721756aae082a3eb58d7f6935d4e1e795a62aa114c8c58803a0c9ed5d31a89ab48e49d36b63a19eea4f2644b44f99db6ef6380a07526b0b65ad8b195d8dddd9e77b0f954fb0a65e5ccce48691b1e9d29b6237dc2eee791d6bd073e67a1e7a5a1a5670bdc137378c5625e4e7bd4577aa4d7772b69a5c7b9cf00f61eff4ad8d5e246f26223f7781f2e6ae2da4163a5c925a44b13b0c160393f8d6895f444f35b5316ce07b19556d6e64fb583be6ba538231e87b0af56f06fc4b9432db6b7133dbf44ba039ff00810fea2b84b3b687fb3eddcc6374a0b39fef1cd477676a7cbc55a8e97053699f48dadcdbdedba4f692a4b13f2194820d23af35e0ff000db55beb5f14da5a5bdcc896d393e645d54fe1dbf0af7f6e6304f5c54dcd62ee8cf956a065f5ab928e0d57714865564ef55ef6e21b1b39aeae9c2410a17763d80ab8fd2bccfe385d4d0e87a6c1148cb14f7244aa3f8c05c807f1ace6d2572a2aeec727adebefe20d48dcce7646388a3ec8bfe3eb5358c8480aa4fb115c9dab1001cd69da5d4e8404908af364efa9db0d343bfd09f508270d1c6e79e196bbb9edaefc49a3c9a7df5b4e81c0d9328c9461d1ab86f0d5cccde56646ea3bd7acf86aee72154cac473d79ac8d1b3e68d6e1bcd1b55b8d3f5381e1b989b0432e370ecc3d8f5aa4b3a9e41afa2fc55a4d86b1e23bd5d52d21b90b0c3b7cc5c95e0f43dbad789fc43d1ec749b9c69d07900f60cc47ea6b57856a1cf730facfbdca618b8190464356858eb525bbab67241f5ae7a325972c7269edf74d73dae74a91ebfe1af1898d90c6c723a827ad7ac69379a77896c4c173806452186715f29d9cd2465191c83ea2bd5bc017971e6c7fbd6ea2b37eeea8d53e75664df103c0b79a3adc0399b4e983049c0fba4f40de87dfa57844ea50b03c60e2bef2d300bcd3365daacc8ebb595c02187a11debe40f8c5a5d968ff0010755b3d3605b7b5460cb1a92429232719e9f4aeca98975d2e6dd1c50a0a8b7cbb183e1eb7d5ac34e9f56d2a48544d30b0208cba1718de3fefac7e35d6e81e0d8f4bf165d2dbddab4b6f27956eb21e1e5f2832863fef115ce7861db6d8c793e59d463257b7de4aeef59ff47f1159b4394326ae8ce4773b87f80ad29bba0ab07171bbdd7f99dfe89a3dd5af84b43d3b5116ada8b4f2deceb24a489af09ca487fbc1783b7d855bd53561e1eb5d361d11bcdb9d358dbdd4ccc1d9837cf27b0662413edc5793dff8875697e1dc3a8c97f335ec3af3c71cc4fccaa3903e95078aaea74f883ad5b248c209364ef18e85ca2fcd532972a6cdb0f47db548d34ed73d16fbc4b6fa865eea54321e5b2369ae7b5296da694bc39047461cd728657da632c4c670769e950125082a483ec6bcd72e6b75f53e9a965d1826ef6927a346bdc36d98904138ea45645d65ee9700607156b5bcc1736862254cb6c247e7ab67ad5147663c9eb27f4a12f7c8949470ae7f69e8d9b768004cf434933fccdcf345bfdd51da98fd2b647865773d79aaae09ab0fd2a36e138aa25942e146de959acbf31c8ad497a9a646a0af22ae3b1948ffd9, 0x4465736372697074696f6e20676f657320686572653c62723e3c666f6e742073697a653d2235223e3c623e3c666f6e7420636f6c6f723d2223333363633939223e4164646974696f6e3c2f666f6e743e3c2f623e3c2f666f6e743e3c62723e, 0);

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
