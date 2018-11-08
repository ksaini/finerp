-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2018 at 01:34 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `form_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_table`
--

CREATE TABLE `accounts_table` (
  `id` int(11) NOT NULL,
  `delete_flag` int(11) NOT NULL,
  `bu` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `parent_group` varchar(255) NOT NULL,
  `a1_billing` varchar(255) NOT NULL,
  `a2_billing` varchar(255) NOT NULL,
  `a3_billing` varchar(255) NOT NULL,
  `a1_shipping` varchar(255) NOT NULL,
  `a2_shipping` varchar(255) NOT NULL,
  `a3_shipping` varchar(255) NOT NULL,
  `gst` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts_table`
--

INSERT INTO `accounts_table` (`id`, `delete_flag`, `bu`, `status`, `account_name`, `state`, `parent_group`, `a1_billing`, `a2_billing`, `a3_billing`, `a1_shipping`, `a2_shipping`, `a3_shipping`, `gst`) VALUES
(1, 0, 'AP', 1, 'My New Company', 'Rajasthan (08)', 'AP-Sundry Debtors', 'Address Line 1', 'Address Line 2', 'Address Line 3', 'Shipping Address Line 1', 'Shipping Address Line 2', 'Shipping Address Line 3', '08AAAAA1234A1A'),
(2, 0, 'AP', 1, 'New Minerals', 'Rajasthan (08)', 'AP-Sundry Debtors', 'Address Line 1', 'Address Line 2', 'Address Line 3', 'Shipping Address Line 1', 'Shipping Address Line 2', 'Shipping Address Line 3', '08AAAAA1234A1A'),
(3, 0, 'AP', 1, 'Old Minerals', 'Rajasthan (08)', 'AP-Sundry Debtors', 'Address Line 1', 'Address Line 2', 'Address Line 3', 'Shipping Address Line 1', 'Shipping Address Line 2', 'Shipping Address Line 3', '08AAAAA1234A1A'),
(4, 0, 'X', 1, 'Some Minerals', 'Rajasthan (08)', 'X-Sundry Debtors', 'Address Line 1', 'Address Line 2', 'Address Line 3', 'Shipping Address Line 1', 'Shipping Address Line 2', 'Shipping Address Line 3', '08AAAAA1234A1A'),
(5, 0, 'X', 1, 'This Minerals', 'Rajasthan (08)', 'X-Sundry Debtors', 'Address Line 1', 'Address Line 2', 'Address Line 3', 'Shipping Address Line 1', 'Shipping Address Line 2', 'Shipping Address Line 3', '08AAAAA1234A1A'),
(6, 0, 'AP', 1, 'Freight', 'Rajasthan (08)', 'AP-Billing Sundry', 'Address Line 1', 'Address Line 2', 'Address Line 3', 'Shipping Address Line 1', 'Shipping Address Line 2', 'Shipping Address Line 3', '08AAAAA1234A1A');

-- --------------------------------------------------------

--
-- Table structure for table `approval_table`
--

CREATE TABLE `approval_table` (
  `id` int(11) NOT NULL,
  `login_user` varchar(255) NOT NULL,
  `approver` varchar(255) NOT NULL,
  `approver_type` int(11) NOT NULL,
  `delete_flag` int(11) NOT NULL,
  `voucher_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `approval_table`
--

INSERT INTO `approval_table` (`id`, `login_user`, `approver`, `approver_type`, `delete_flag`, `voucher_type`) VALUES
(1, 'a', 'b', 1, 0, 'SALE'),
(2, 'b', 'c', 2, 0, 'SALE'),
(3, 'c', 'd', 2, 0, 'SALE'),
(4, 'd', 'e', 2, 0, 'SALE'),
(5, 'e', 'e', 3, 0, 'SALE'),
(6, 'e', 'e', 3, 0, 'PURC');

-- --------------------------------------------------------

--
-- Table structure for table `bu_details`
--

CREATE TABLE `bu_details` (
  `BU_Name` varchar(255) NOT NULL,
  `bu` varchar(255) NOT NULL,
  `pan` varchar(255) NOT NULL,
  `tin` varchar(255) NOT NULL,
  `a1` varchar(255) NOT NULL,
  `a2` varchar(255) NOT NULL,
  `a3` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gst` varchar(255) NOT NULL,
  `delete_flag` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bu_details`
--

INSERT INTO `bu_details` (`BU_Name`, `bu`, `pan`, `tin`, `a1`, `a2`, `a3`, `state`, `mobile`, `email`, `gst`, `delete_flag`, `status`) VALUES
('abc', 'ABC', '', '', '', '', '', 'Rajasthan (08)', '', '', '', 0, 0),
('Aditya Polymer', 'AP', 'qwert1234q', '12qwert1234q2q2', 'qweqw', 'qwqw', 'qwq', 'Rajasthan (08)', '2132154841', 'adas@asd.asd', '', 0, 1),
('Sample', 'X', '', '', '', '', '', 'Rajasthan (08)', '', '', '', 0, 1),
('Vinayak Minerals', 'VM', 'qwert1212q', '11qwert1212q2q2', 'asdasA', 'adas', 'sdwd', 'Rajasthan (08)', '3122186451', 'sdf@saddsf.sdf', '', 0, 0),
('xyz', 'XYZ', '', '', '', '', '', 'Rajasthan (08)', '', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `connected_voucher`
--

CREATE TABLE `connected_voucher` (
  `vno1` varchar(255) NOT NULL,
  `vno2` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `connected_voucher`
--

INSERT INTO `connected_voucher` (`vno1`, `vno2`) VALUES
('-PYMT-287', 'X-PYMT-288'),
('X-PYMT-288', '-PYMT-287');

-- --------------------------------------------------------

--
-- Table structure for table `debit_note_table`
--

CREATE TABLE `debit_note_table` (
  `vno` varchar(255) NOT NULL,
  `v_type` varchar(255) NOT NULL,
  `cr_dr` varchar(255) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `a_vno` varchar(255) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_qty` int(11) NOT NULL,
  `item_unit` varchar(255) NOT NULL,
  `item_price` float NOT NULL,
  `item_amount` float NOT NULL,
  `item_details` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `debit_note_table`
--

INSERT INTO `debit_note_table` (`vno`, `v_type`, `cr_dr`, `account_name`, `a_vno`, `item_name`, `item_qty`, `item_unit`, `item_price`, `item_amount`, `item_details`) VALUES
('AP-DN-2', 'Debit Note', '0', 'AP-Central Sales Tax', 'AP-REPT-13', 'AP-item1', 10, 'ml', 30, 300, 'w'),
('AP-DN-2', 'Debit Note', '0', 'AP-Capital Equipments', 'AP-PYMT-283', 'AP-item2', 20, 'ml', 30, 600, 's'),
('AP-CN-1', 'Credit Note', '1', 'AP-Purchase', 'AP-PYMT-282', 'AP-item3', 10, 'ml', 20, 200, 'jy'),
('AP-DN-3', 'Debit Note', '0', 'AP-Profit & Loss', 'AP-PYMT-312', 'AP-item1', 10, 'ml', 20, 200, 'asd');

-- --------------------------------------------------------

--
-- Table structure for table `deleted_transaction_record`
--

CREATE TABLE `deleted_transaction_record` (
  `vno` varchar(255) NOT NULL,
  `t_type` varchar(255) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `t_date` date NOT NULL,
  `credit` float NOT NULL,
  `debit` float NOT NULL,
  `details` varchar(255) NOT NULL,
  `deleted_by` varchar(255) NOT NULL,
  `deleted_timestamp` datetime NOT NULL,
  `blank1` varchar(255) NOT NULL,
  `blank2` varchar(255) NOT NULL,
  `blank3` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deleted_transaction_record`
--

INSERT INTO `deleted_transaction_record` (`vno`, `t_type`, `account_name`, `t_date`, `credit`, `debit`, `details`, `deleted_by`, `deleted_timestamp`, `blank1`, `blank2`, `blank3`) VALUES
('', '', '', '0000-00-00', 0, 0, '', '', '2017-10-09 06:47:04', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `deleted_voucher_table`
--

CREATE TABLE `deleted_voucher_table` (
  `vno` varchar(255) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `t_date` date NOT NULL,
  `follow_up_date` date NOT NULL,
  `login_user` varchar(255) NOT NULL,
  `assign_to` varchar(255) NOT NULL,
  `forwarded_by` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `v_notice` varchar(255) NOT NULL,
  `reject_reason` varchar(255) NOT NULL,
  `v_detail` varchar(255) NOT NULL,
  `deleted_by` varchar(255) NOT NULL,
  `deleted_datetime` datetime NOT NULL,
  `blank1` varchar(255) NOT NULL,
  `blank2` varchar(255) NOT NULL,
  `blank3` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fy_table`
--

CREATE TABLE `fy_table` (
  `username` varchar(255) NOT NULL,
  `fy` varchar(255) NOT NULL,
  `id` int(11) NOT NULL,
  `Eff_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fy_table`
--

INSERT INTO `fy_table` (`username`, `fy`, `id`, `Eff_date`) VALUES
('e', '2018-19', 1, '2018-10-14 04:18:13');

-- --------------------------------------------------------

--
-- Table structure for table `group_table`
--

CREATE TABLE `group_table` (
  `id` int(11) NOT NULL,
  `group_id` varchar(255) NOT NULL,
  `GroupName` varchar(255) NOT NULL,
  `BU` varchar(255) DEFAULT NULL,
  `GroupType` varchar(255) NOT NULL,
  `IsPrimary` varchar(255) NOT NULL,
  `ParentGroup` varchar(255) DEFAULT NULL,
  `delete_flag` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_table`
--

INSERT INTO `group_table` (`id`, `group_id`, `GroupName`, `BU`, `GroupType`, `IsPrimary`, `ParentGroup`, `delete_flag`, `status`) VALUES
(1, 'Bank Accounts', 'AP-Bank Accounts', 'AP', '0', 'N', 'AP-Current Assets', 0, 1),
(2, 'Bank O/D Account', 'AP-Bank O/D Account', 'AP', '0', 'N', 'AP-Loans (Liability)', 0, 1),
(3, 'Capital Account', 'AP-Capital Account', 'AP', '1', 'Y', '', 0, 1),
(4, 'Cash-in-hand', 'AP-Cash-in-hand', 'AP', '0', 'N', 'AP-Current Assets', 0, 1),
(5, 'Current Assets', 'AP-Current Assets', 'AP', '2', 'Y', '', 0, 1),
(6, 'Current Liabilities', 'AP-Current Liabilities', 'AP', '1', 'Y', '', 0, 1),
(7, 'Duties & Taxes', 'AP-Duties & Taxes', 'AP', '0', 'N', 'AP-Current Liabilities', 0, 1),
(8, 'Expenses (Direct/Mfg.)', 'AP-Expenses (Direct/Mfg.)', 'AP', '0', 'N', 'AP-Revenue Accounts', 0, 1),
(9, 'Expenses (Indirect/Admn.)', 'AP-Expenses (Indirect/Admn.)', 'AP', '0', 'N', 'AP-Revenue Accounts', 0, 1),
(10, 'Fixed Assets', 'AP-Fixed Assets', 'AP', '2', 'Y', '', 0, 1),
(11, 'Income (Direct/Opr.)', 'AP-Income (Direct/Opr.)', 'AP', '0', 'N', 'AP-Revenue Accounts', 0, 1),
(12, 'Income (Indirect)', 'AP-Income (Indirect)', 'AP', '0', 'N', 'AP-Revenue Accounts', 0, 1),
(13, 'Investments', 'AP-Investments', 'AP', '2', 'Y', '', 0, 1),
(14, 'Loans & Advances (Asset)', 'AP-Loans & Advances (Asset)', 'AP', '0', 'N', 'AP-Current Assets', 0, 1),
(15, 'Loans (Liability)', 'AP-Loans (Liability)', 'AP', '1', 'Y', '', 0, 1),
(16, 'MONEY', 'AP-MONEY', 'AP', '0', 'N', 'AP-Cash-in-hand', 0, 1),
(17, 'Pre-Operative Expenses', 'AP-Pre-Operative Expenses', 'AP', '', 'Y', '', 0, 1),
(18, 'Profit & Loss', 'AP-Profit & Loss', 'AP', '0', 'Y', '', 0, 1),
(19, 'Provisions/Expenses Payable', 'AP-Provisions/Expenses Payable', 'AP', '0', 'N', 'AP-Current Liabilities', 0, 1),
(20, 'Purchase', 'AP-Purchase', 'AP', '0', 'N', 'AP-Revenue Accounts', 0, 1),
(21, 'Reserves & Surplus', 'AP-Reserves & Surplus', 'AP', '0', 'N', 'AP-Capital Account', 0, 1),
(22, 'Revenue Accounts', 'AP-Revenue Accounts', 'AP', '', 'Y', '', 0, 1),
(23, 'Sale', 'AP-Sale', 'AP', '0', 'N', 'AP-Revenue Accounts', 0, 1),
(24, 'Secured Loans', 'AP-Secured Loans', 'AP', '0', 'N', 'AP-Loans (Liability)', 0, 1),
(25, 'Securities & Deposits (Asset)', 'AP-Securities & Deposits (Asset)', 'AP', '0', 'N', 'AP-Current Assets', 0, 1),
(26, 'Stock-in-hand', 'AP-Stock-in-hand', 'AP', '0', 'N', 'AP-Current Assets', 0, 1),
(27, 'Sundry Creditors', 'AP-Sundry Creditors', 'AP', '0', 'N', 'AP-Current Liabilities', 0, 1),
(28, 'Sundry Debtors', 'AP-Sundry Debtors', 'AP', '0', 'N', 'AP-Current Assets', 0, 1),
(29, 'Suspense Account', 'AP-Suspense Account', 'AP', '0', 'Y', '', 0, 1),
(30, 'Unsecured Loans', 'AP-Unsecured Loans', 'AP', '0', 'N', 'AP-Loans (Liability)', 0, 1),
(31, 'Sundry Debtors', 'X-Sundry Debtors', 'X', '0', 'N', 'X-Current Assets', 0, 1),
(32, 'Billing Sundry', 'AP-Billing Sundry', 'AP', '0', 'N', 'AP-Current Assets', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `index_table`
--

CREATE TABLE `index_table` (
  `id` int(11) NOT NULL,
  `field_name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `vno` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `index_table`
--

INSERT INTO `index_table` (`id`, `field_name`, `value`, `vno`) VALUES
(1, 'comp_list', 'Aditya Polymer', ' AP//SALE/0001'),
(2, 'consignee_list', 'My New Company', 'AP//SALE/0001'),
(3, 'instant1', '', 'AP//SALE/0001'),
(4, 'instant2', '', 'AP//SALE/0001'),
(5, 'instant3', '', 'AP//SALE/0001'),
(6, 'instant4', '', 'AP//SALE/0001'),
(7, 'driver_instant', '', 'AP//SALE/0001'),
(8, 'actual_instant', '', 'AP//SALE/0001'),
(9, 'charged_instant', '', 'AP//SALE/0001'),
(10, 'billed_instant', '', 'AP//SALE/0001'),
(11, 'r_list', '', 'AP//SALE/0001'),
(12, 'comp_list', 'Aditya Polymer', ' AP//SALE/0002'),
(13, 'consignee_list', 'My New Company', 'AP//SALE/0002'),
(14, 'instant1', '', 'AP//SALE/0002'),
(15, 'instant2', '', 'AP//SALE/0002'),
(16, 'instant3', '', 'AP//SALE/0002'),
(17, 'instant4', '', 'AP//SALE/0002'),
(18, 'driver_instant', '', 'AP//SALE/0002'),
(19, 'actual_instant', '', 'AP//SALE/0002'),
(20, 'charged_instant', '', 'AP//SALE/0002'),
(21, 'billed_instant', '', 'AP//SALE/0002'),
(22, 'r_list', '', 'AP//SALE/0002'),
(23, 'comp_list', 'Aditya Polymer', ' AP//SALE/0003'),
(24, 'consignee_list', 'My New Company', 'AP//SALE/0003'),
(25, 'instant1', '', 'AP//SALE/0003'),
(26, 'instant2', '', 'AP//SALE/0003'),
(27, 'instant3', '', 'AP//SALE/0003'),
(28, 'instant4', '', 'AP//SALE/0003'),
(29, 'driver_instant', '', 'AP//SALE/0003'),
(30, 'actual_instant', '', 'AP//SALE/0003'),
(31, 'charged_instant', '', 'AP//SALE/0003'),
(32, 'billed_instant', '', 'AP//SALE/0003'),
(33, 'r_list', '', 'AP//SALE/0003'),
(34, 'comp_list', 'Aditya Polymer', ' AP//SALE/0004'),
(35, 'consignee_list', 'My New Company', 'AP//SALE/0004'),
(36, 'instant1', '', 'AP//SALE/0004'),
(37, 'instant2', '', 'AP//SALE/0004'),
(38, 'instant3', '', 'AP//SALE/0004'),
(39, 'instant4', '', 'AP//SALE/0004'),
(40, 'driver_instant', '', 'AP//SALE/0004'),
(41, 'actual_instant', '', 'AP//SALE/0004'),
(42, 'charged_instant', '', 'AP//SALE/0004'),
(43, 'billed_instant', '', 'AP//SALE/0004'),
(44, 'r_list', '', 'AP//SALE/0004'),
(45, 'comp_list', 'Aditya Polymer', ' AP//SALE/0005'),
(46, 'consignee_list', 'My New Company', 'AP//SALE/0005'),
(47, 'instant1', '', 'AP//SALE/0005'),
(48, 'instant2', '', 'AP//SALE/0005'),
(49, 'instant3', '', 'AP//SALE/0005'),
(50, 'instant4', '', 'AP//SALE/0005'),
(51, 'driver_instant', '', 'AP//SALE/0005'),
(52, 'actual_instant', '', 'AP//SALE/0005'),
(53, 'charged_instant', '', 'AP//SALE/0005'),
(54, 'billed_instant', '', 'AP//SALE/0005'),
(55, 'r_list', '', 'AP//SALE/0005'),
(56, 'comp_list', 'Aditya Polymer', ' AP//SALE/0006'),
(57, 'consignee_list', 'My New Company', 'AP//SALE/0006'),
(58, 'instant1', '', 'AP//SALE/0006'),
(59, 'instant2', '', 'AP//SALE/0006'),
(60, 'instant3', '', 'AP//SALE/0006'),
(61, 'instant4', '', 'AP//SALE/0006'),
(62, 'driver_instant', '', 'AP//SALE/0006'),
(63, 'actual_instant', '', 'AP//SALE/0006'),
(64, 'charged_instant', '', 'AP//SALE/0006'),
(65, 'billed_instant', '', 'AP//SALE/0006'),
(66, 'r_list', '', 'AP//SALE/0006'),
(67, 'comp_list', 'Aditya Polymer', ' AP//SALE/0007'),
(68, 'consignee_list', 'My New Company', 'AP//SALE/0007'),
(69, 'instant1', '', 'AP//SALE/0007'),
(70, 'instant2', '', 'AP//SALE/0007'),
(71, 'instant3', '', 'AP//SALE/0007'),
(72, 'instant4', '', 'AP//SALE/0007'),
(73, 'driver_instant', '', 'AP//SALE/0007'),
(74, 'actual_instant', '', 'AP//SALE/0007'),
(75, 'charged_instant', '', 'AP//SALE/0007'),
(76, 'billed_instant', '', 'AP//SALE/0007'),
(77, 'r_list', '', 'AP//SALE/0007'),
(78, 'comp_list', 'Aditya Polymer', ' AP//SALE/0008'),
(79, 'consignee_list', 'My New Company', 'AP//SALE/0008'),
(80, 'instant1', '', 'AP//SALE/0008'),
(81, 'instant2', '', 'AP//SALE/0008'),
(82, 'instant3', '', 'AP//SALE/0008'),
(83, 'instant4', '', 'AP//SALE/0008'),
(84, 'driver_instant', '', 'AP//SALE/0008'),
(85, 'actual_instant', '', 'AP//SALE/0008'),
(86, 'charged_instant', '', 'AP//SALE/0008'),
(87, 'billed_instant', '', 'AP//SALE/0008'),
(88, 'r_list', '', 'AP//SALE/0008'),
(89, 'comp_list', 'Aditya Polymer', ' AP//SALE/0009'),
(90, 'consignee_list', 'My New Company', 'AP//SALE/0009'),
(91, 'instant1', '', 'AP//SALE/0009'),
(92, 'instant2', '', 'AP//SALE/0009'),
(93, 'instant3', '', 'AP//SALE/0009'),
(94, 'instant4', '', 'AP//SALE/0009'),
(95, 'driver_instant', '', 'AP//SALE/0009'),
(96, 'actual_instant', '', 'AP//SALE/0009'),
(97, 'charged_instant', '', 'AP//SALE/0009'),
(98, 'billed_instant', '', 'AP//SALE/0009'),
(99, 'r_list', '', 'AP//SALE/0009'),
(100, 'comp_list', 'Aditya Polymer', ' AP//SALE/0010'),
(101, 'consignee_list', 'My New Company', 'AP//SALE/0010'),
(102, 'instant1', '', 'AP//SALE/0010'),
(103, 'instant2', '', 'AP//SALE/0010'),
(104, 'instant3', '', 'AP//SALE/0010'),
(105, 'instant4', '', 'AP//SALE/0010'),
(106, 'driver_instant', '', 'AP//SALE/0010'),
(107, 'actual_instant', '', 'AP//SALE/0010'),
(108, 'charged_instant', '', 'AP//SALE/0010'),
(109, 'billed_instant', '', 'AP//SALE/0010'),
(110, 'r_list', '', 'AP//SALE/0010'),
(111, 'comp_list', 'Aditya Polymer', ' AP//SALE/0011'),
(112, 'consignee_list', 'My New Company', 'AP//SALE/0011'),
(113, 'instant1', '', 'AP//SALE/0011'),
(114, 'instant2', '', 'AP//SALE/0011'),
(115, 'instant3', '', 'AP//SALE/0011'),
(116, 'instant4', '', 'AP//SALE/0011'),
(117, 'driver_instant', '', 'AP//SALE/0011'),
(118, 'actual_instant', '', 'AP//SALE/0011'),
(119, 'charged_instant', '', 'AP//SALE/0011'),
(120, 'billed_instant', '', 'AP//SALE/0011'),
(121, 'r_list', '', 'AP//SALE/0011'),
(122, 'comp_list', 'Aditya Polymer', ' AP//SALE/0012'),
(123, 'consignee_list', 'My New Company', 'AP//SALE/0012'),
(124, 'instant1', '', 'AP//SALE/0012'),
(125, 'instant2', '', 'AP//SALE/0012'),
(126, 'instant3', '', 'AP//SALE/0012'),
(127, 'instant4', '', 'AP//SALE/0012'),
(128, 'driver_instant', '', 'AP//SALE/0012'),
(129, 'actual_instant', '', 'AP//SALE/0012'),
(130, 'charged_instant', '', 'AP//SALE/0012'),
(131, 'billed_instant', '', 'AP//SALE/0012'),
(132, 'r_list', '', 'AP//SALE/0012'),
(133, 'comp_list', 'Aditya Polymer', ' AP//SALE/0013'),
(134, 'consignee_list', 'My New Company', 'AP//SALE/0013'),
(135, 'instant1', '', 'AP//SALE/0013'),
(136, 'instant2', '', 'AP//SALE/0013'),
(137, 'instant3', '', 'AP//SALE/0013'),
(138, 'instant4', '', 'AP//SALE/0013'),
(139, 'driver_instant', '', 'AP//SALE/0013'),
(140, 'actual_instant', '', 'AP//SALE/0013'),
(141, 'charged_instant', '', 'AP//SALE/0013'),
(142, 'billed_instant', '', 'AP//SALE/0013'),
(143, 'r_list', '', 'AP//SALE/0013'),
(144, 'comp_list', 'Aditya Polymer', ' AP//SALE/0014'),
(145, 'consignee_list', 'My New Company', 'AP//SALE/0014'),
(146, 'instant1', '', 'AP//SALE/0014'),
(147, 'instant2', '', 'AP//SALE/0014'),
(148, 'instant3', '', 'AP//SALE/0014'),
(149, 'instant4', '', 'AP//SALE/0014'),
(150, 'driver_instant', '', 'AP//SALE/0014'),
(151, 'actual_instant', '', 'AP//SALE/0014'),
(152, 'charged_instant', '', 'AP//SALE/0014'),
(153, 'billed_instant', '', 'AP//SALE/0014'),
(154, 'r_list', '', 'AP//SALE/0014'),
(155, 'comp_list', 'Aditya Polymer', ' AP//SALE/0015'),
(156, 'consignee_list', 'My New Company', 'AP//SALE/0015'),
(157, 'instant1', '', 'AP//SALE/0015'),
(158, 'instant2', '', 'AP//SALE/0015'),
(159, 'instant3', '', 'AP//SALE/0015'),
(160, 'instant4', '', 'AP//SALE/0015'),
(161, 'driver_instant', '', 'AP//SALE/0015'),
(162, 'actual_instant', '', 'AP//SALE/0015'),
(163, 'charged_instant', '', 'AP//SALE/0015'),
(164, 'billed_instant', '', 'AP//SALE/0015'),
(165, 'r_list', '', 'AP//SALE/0015'),
(166, 'comp_list', 'Aditya Polymer', ' AP//SALE/0016'),
(167, 'consignee_list', 'My New Company', 'AP//SALE/0016'),
(168, 'instant1', '', 'AP//SALE/0016'),
(169, 'instant2', '', 'AP//SALE/0016'),
(170, 'instant3', '', 'AP//SALE/0016'),
(171, 'instant4', '', 'AP//SALE/0016'),
(172, 'driver_instant', '', 'AP//SALE/0016'),
(173, 'actual_instant', '', 'AP//SALE/0016'),
(174, 'charged_instant', '', 'AP//SALE/0016'),
(175, 'billed_instant', '', 'AP//SALE/0016'),
(176, 'r_list', '', 'AP//SALE/0016'),
(177, 'comp_list', 'Aditya Polymer', ' AP//SALE/0017'),
(178, 'consignee_list', 'My New Company', 'AP//SALE/0017'),
(179, 'instant1', '', 'AP//SALE/0017'),
(180, 'instant2', '', 'AP//SALE/0017'),
(181, 'instant3', '', 'AP//SALE/0017'),
(182, 'instant4', '', 'AP//SALE/0017'),
(183, 'driver_instant', '', 'AP//SALE/0017'),
(184, 'actual_instant', '', 'AP//SALE/0017'),
(185, 'charged_instant', '', 'AP//SALE/0017'),
(186, 'billed_instant', '', 'AP//SALE/0017'),
(187, 'r_list', '', 'AP//SALE/0017'),
(188, 'comp_list', 'Aditya Polymer', ' AP//SALE/0018'),
(189, 'consignee_list', 'My New Company', 'AP//SALE/0018'),
(190, 'instant1', '', 'AP//SALE/0018'),
(191, 'instant2', '', 'AP//SALE/0018'),
(192, 'instant3', '', 'AP//SALE/0018'),
(193, 'instant4', '', 'AP//SALE/0018'),
(194, 'driver_instant', '', 'AP//SALE/0018'),
(195, 'actual_instant', '', 'AP//SALE/0018'),
(196, 'charged_instant', '', 'AP//SALE/0018'),
(197, 'billed_instant', '', 'AP//SALE/0018'),
(198, 'r_list', '', 'AP//SALE/0018'),
(199, 'comp_list', 'Aditya Polymer', ' AP//SALE/0019'),
(200, 'consignee_list', 'My New Company', 'AP//SALE/0019'),
(201, 'instant1', '', 'AP//SALE/0019'),
(202, 'instant2', '', 'AP//SALE/0019'),
(203, 'instant3', '', 'AP//SALE/0019'),
(204, 'instant4', '', 'AP//SALE/0019'),
(205, 'driver_instant', '', 'AP//SALE/0019'),
(206, 'actual_instant', '', 'AP//SALE/0019'),
(207, 'charged_instant', '', 'AP//SALE/0019'),
(208, 'billed_instant', '', 'AP//SALE/0019'),
(209, 'r_list', '', 'AP//SALE/0019'),
(210, 'comp_list', 'Aditya Polymer', ' AP//SALE/0020'),
(211, 'consignee_list', 'My New Company', 'AP//SALE/0020'),
(212, 'instant1', '', 'AP//SALE/0020'),
(213, 'instant2', '', 'AP//SALE/0020'),
(214, 'instant3', '', 'AP//SALE/0020'),
(215, 'instant4', '', 'AP//SALE/0020'),
(216, 'driver_instant', '', 'AP//SALE/0020'),
(217, 'actual_instant', '', 'AP//SALE/0020'),
(218, 'charged_instant', '', 'AP//SALE/0020'),
(219, 'billed_instant', '', 'AP//SALE/0020'),
(220, 'r_list', '', 'AP//SALE/0020'),
(221, 'comp_list', 'Aditya Polymer', ' AP//SALE/0021'),
(222, 'consignee_list', 'My New Company', 'AP//SALE/0021'),
(223, 'instant1', '', 'AP//SALE/0021'),
(224, 'instant2', '', 'AP//SALE/0021'),
(225, 'instant3', '', 'AP//SALE/0021'),
(226, 'instant4', '', 'AP//SALE/0021'),
(227, 'driver_instant', '', 'AP//SALE/0021'),
(228, 'actual_instant', '', 'AP//SALE/0021'),
(229, 'charged_instant', '', 'AP//SALE/0021'),
(230, 'billed_instant', '', 'AP//SALE/0021'),
(231, 'r_list', '', 'AP//SALE/0021'),
(232, 'comp_list', 'Aditya Polymer', ' AP//SALE/0022'),
(233, 'consignee_list', 'My New Company', 'AP//SALE/0022'),
(234, 'instant1', '', 'AP//SALE/0022'),
(235, 'instant2', '', 'AP//SALE/0022'),
(236, 'instant3', '', 'AP//SALE/0022'),
(237, 'instant4', '', 'AP//SALE/0022'),
(238, 'driver_instant', '', 'AP//SALE/0022'),
(239, 'actual_instant', '', 'AP//SALE/0022'),
(240, 'charged_instant', '', 'AP//SALE/0022'),
(241, 'billed_instant', '', 'AP//SALE/0022'),
(242, 'r_list', '', 'AP//SALE/0022'),
(243, 'comp_list', 'Aditya Polymer', ' AP//SALE/0023'),
(244, 'consignee_list', 'My New Company', 'AP//SALE/0023'),
(245, 'instant1', '', 'AP//SALE/0023'),
(246, 'instant2', '', 'AP//SALE/0023'),
(247, 'instant3', '', 'AP//SALE/0023'),
(248, 'instant4', '', 'AP//SALE/0023'),
(249, 'driver_instant', '', 'AP//SALE/0023'),
(250, 'actual_instant', '', 'AP//SALE/0023'),
(251, 'charged_instant', '', 'AP//SALE/0023'),
(252, 'billed_instant', '', 'AP//SALE/0023'),
(253, 'r_list', '', 'AP//SALE/0023'),
(254, 'comp_list', 'Aditya Polymer', ' AP//SALE/0024'),
(255, 'consignee_list', 'My New Company', 'AP//SALE/0024'),
(256, 'instant1', '', 'AP//SALE/0024'),
(257, 'instant2', '', 'AP//SALE/0024'),
(258, 'instant3', '', 'AP//SALE/0024'),
(259, 'instant4', '', 'AP//SALE/0024'),
(260, 'driver_instant', '', 'AP//SALE/0024'),
(261, 'actual_instant', '', 'AP//SALE/0024'),
(262, 'charged_instant', '', 'AP//SALE/0024'),
(263, 'billed_instant', '', 'AP//SALE/0024'),
(264, 'r_list', '', 'AP//SALE/0024'),
(265, 'comp_list', 'Aditya Polymer', ' AP//SALE/0025'),
(266, 'consignee_list', 'My New Company', 'AP//SALE/0025'),
(267, 'instant1', '', 'AP//SALE/0025'),
(268, 'instant2', '', 'AP//SALE/0025'),
(269, 'instant3', '', 'AP//SALE/0025'),
(270, 'instant4', '', 'AP//SALE/0025'),
(271, 'driver_instant', '', 'AP//SALE/0025'),
(272, 'actual_instant', '', 'AP//SALE/0025'),
(273, 'charged_instant', '', 'AP//SALE/0025'),
(274, 'billed_instant', '', 'AP//SALE/0025'),
(275, 'r_list', '', 'AP//SALE/0025'),
(276, 'comp_list', 'Aditya Polymer', ' AP//SALE/0026'),
(277, 'consignee_list', 'My New Company', 'AP//SALE/0026'),
(278, 'instant1', '', 'AP//SALE/0026'),
(279, 'instant2', '', 'AP//SALE/0026'),
(280, 'instant3', '', 'AP//SALE/0026'),
(281, 'instant4', '', 'AP//SALE/0026'),
(282, 'driver_instant', '', 'AP//SALE/0026'),
(283, 'actual_instant', '', 'AP//SALE/0026'),
(284, 'charged_instant', '', 'AP//SALE/0026'),
(285, 'billed_instant', '', 'AP//SALE/0026'),
(286, 'r_list', '', 'AP//SALE/0026'),
(287, 'comp_list', 'Aditya Polymer', ' AP//SALE/0027'),
(288, 'consignee_list', 'My New Company', 'AP//SALE/0027'),
(289, 'instant1', '', 'AP//SALE/0027'),
(290, 'instant2', '', 'AP//SALE/0027'),
(291, 'instant3', '', 'AP//SALE/0027'),
(292, 'instant4', '', 'AP//SALE/0027'),
(293, 'driver_instant', '', 'AP//SALE/0027'),
(294, 'actual_instant', '', 'AP//SALE/0027'),
(295, 'charged_instant', '', 'AP//SALE/0027'),
(296, 'billed_instant', '', 'AP//SALE/0027'),
(297, 'r_list', '', 'AP//SALE/0027'),
(298, 'comp_list', 'Aditya Polymer', ' AP//SALE/0028'),
(299, 'consignee_list', 'My New Company', 'AP//SALE/0028'),
(300, 'instant1', '', 'AP//SALE/0028'),
(301, 'instant2', '', 'AP//SALE/0028'),
(302, 'instant3', '', 'AP//SALE/0028'),
(303, 'instant4', '', 'AP//SALE/0028'),
(304, 'driver_instant', '', 'AP//SALE/0028'),
(305, 'actual_instant', '', 'AP//SALE/0028'),
(306, 'charged_instant', '', 'AP//SALE/0028'),
(307, 'billed_instant', '', 'AP//SALE/0028'),
(308, 'r_list', '', 'AP//SALE/0028'),
(309, 'comp_list', 'Aditya Polymer', ' AP//SALE/0029'),
(310, 'consignee_list', 'My New Company', 'AP//SALE/0029'),
(311, 'instant1', '', 'AP//SALE/0029'),
(312, 'instant2', '', 'AP//SALE/0029'),
(313, 'instant3', '', 'AP//SALE/0029'),
(314, 'instant4', '', 'AP//SALE/0029'),
(315, 'driver_instant', '', 'AP//SALE/0029'),
(316, 'actual_instant', '', 'AP//SALE/0029'),
(317, 'charged_instant', '', 'AP//SALE/0029'),
(318, 'billed_instant', '', 'AP//SALE/0029'),
(319, 'r_list', '', 'AP//SALE/0029'),
(320, 'comp_list', 'Aditya Polymer', ' AP//SALE/0030'),
(321, 'consignee_list', 'My New Company', 'AP//SALE/0030'),
(322, 'instant1', '', 'AP//SALE/0030'),
(323, 'instant2', '', 'AP//SALE/0030'),
(324, 'instant3', '', 'AP//SALE/0030'),
(325, 'instant4', '', 'AP//SALE/0030'),
(326, 'driver_instant', '', 'AP//SALE/0030'),
(327, 'actual_instant', '', 'AP//SALE/0030'),
(328, 'charged_instant', '', 'AP//SALE/0030'),
(329, 'billed_instant', '', 'AP//SALE/0030'),
(330, 'r_list', '', 'AP//SALE/0030'),
(331, 'comp_list', 'Aditya Polymer', ' AP//SALE/0031'),
(332, 'consignee_list', 'My New Company', 'AP//SALE/0031'),
(333, 'instant1', '', 'AP//SALE/0031'),
(334, 'instant2', '', 'AP//SALE/0031'),
(335, 'instant3', '', 'AP//SALE/0031'),
(336, 'instant4', '', 'AP//SALE/0031'),
(337, 'driver_instant', '', 'AP//SALE/0031'),
(338, 'actual_instant', '', 'AP//SALE/0031'),
(339, 'charged_instant', '', 'AP//SALE/0031'),
(340, 'billed_instant', '', 'AP//SALE/0031'),
(341, 'r_list', '', 'AP//SALE/0031'),
(342, 'comp_list', 'Aditya Polymer', ' AP//SALE/0032'),
(343, 'consignee_list', 'My New Company', 'AP//SALE/0032'),
(344, 'instant1', '', 'AP//SALE/0032'),
(345, 'instant2', '', 'AP//SALE/0032'),
(346, 'instant3', '', 'AP//SALE/0032'),
(347, 'instant4', '', 'AP//SALE/0032'),
(348, 'driver_instant', '', 'AP//SALE/0032'),
(349, 'actual_instant', '', 'AP//SALE/0032'),
(350, 'charged_instant', '', 'AP//SALE/0032'),
(351, 'billed_instant', '', 'AP//SALE/0032'),
(352, 'r_list', '', 'AP//SALE/0032'),
(353, 'comp_list', 'Aditya Polymer', ' AP//SALE/0033'),
(354, 'consignee_list', 'My New Company', 'AP//SALE/0033'),
(355, 'instant1', '', 'AP//SALE/0033'),
(356, 'instant2', '', 'AP//SALE/0033'),
(357, 'instant3', '', 'AP//SALE/0033'),
(358, 'instant4', '', 'AP//SALE/0033'),
(359, 'driver_instant', '', 'AP//SALE/0033'),
(360, 'actual_instant', '', 'AP//SALE/0033'),
(361, 'charged_instant', '', 'AP//SALE/0033'),
(362, 'billed_instant', '', 'AP//SALE/0033'),
(363, 'r_list', '', 'AP//SALE/0033'),
(364, 'comp_list', 'Aditya Polymer', ' AP//SALE/0034'),
(365, 'consignee_list', 'My New Company', 'AP//SALE/0034'),
(366, 'instant1', '', 'AP//SALE/0034'),
(367, 'instant2', '', 'AP//SALE/0034'),
(368, 'instant3', '', 'AP//SALE/0034'),
(369, 'instant4', '', 'AP//SALE/0034'),
(370, 'driver_instant', '', 'AP//SALE/0034'),
(371, 'actual_instant', '', 'AP//SALE/0034'),
(372, 'charged_instant', '', 'AP//SALE/0034'),
(373, 'billed_instant', '', 'AP//SALE/0034'),
(374, 'r_list', '', 'AP//SALE/0034'),
(375, 'comp_list', 'Aditya Polymer', ' AP//SALE/0035'),
(376, 'consignee_list', 'My New Company', 'AP//SALE/0035'),
(377, 'instant1', '', 'AP//SALE/0035'),
(378, 'instant2', '', 'AP//SALE/0035'),
(379, 'instant3', '', 'AP//SALE/0035'),
(380, 'instant4', '', 'AP//SALE/0035'),
(381, 'driver_instant', '', 'AP//SALE/0035'),
(382, 'actual_instant', '', 'AP//SALE/0035'),
(383, 'charged_instant', '', 'AP//SALE/0035'),
(384, 'billed_instant', '', 'AP//SALE/0035'),
(385, 'r_list', '', 'AP//SALE/0035'),
(386, 'comp_list', 'Aditya Polymer', ' AP//SALE/0036'),
(387, 'consignee_list', 'My New Company', 'AP//SALE/0036'),
(388, 'instant1', '', 'AP//SALE/0036'),
(389, 'instant2', '', 'AP//SALE/0036'),
(390, 'instant3', '', 'AP//SALE/0036'),
(391, 'instant4', '', 'AP//SALE/0036'),
(392, 'driver_instant', '', 'AP//SALE/0036'),
(393, 'actual_instant', '', 'AP//SALE/0036'),
(394, 'charged_instant', '', 'AP//SALE/0036'),
(395, 'billed_instant', '', 'AP//SALE/0036'),
(396, 'r_list', '', 'AP//SALE/0036'),
(397, 'comp_list', 'Aditya Polymer', ' AP//SALE/0037'),
(398, 'consignee_list', 'My New Company', 'AP//SALE/0037'),
(399, 'instant1', '', 'AP//SALE/0037'),
(400, 'instant2', '', 'AP//SALE/0037'),
(401, 'instant3', '', 'AP//SALE/0037'),
(402, 'instant4', '', 'AP//SALE/0037'),
(403, 'driver_instant', '', 'AP//SALE/0037'),
(404, 'actual_instant', '', 'AP//SALE/0037'),
(405, 'charged_instant', '', 'AP//SALE/0037'),
(406, 'billed_instant', '', 'AP//SALE/0037'),
(407, 'r_list', '', 'AP//SALE/0037'),
(408, 'comp_list', 'Aditya Polymer', ' AP//SALE/0038'),
(409, 'consignee_list', 'My New Company', 'AP//SALE/0038'),
(410, 'instant1', '', 'AP//SALE/0038'),
(411, 'instant2', '', 'AP//SALE/0038'),
(412, 'instant3', '', 'AP//SALE/0038'),
(413, 'instant4', '', 'AP//SALE/0038'),
(414, 'driver_instant', '', 'AP//SALE/0038'),
(415, 'actual_instant', '', 'AP//SALE/0038'),
(416, 'charged_instant', '', 'AP//SALE/0038'),
(417, 'billed_instant', '', 'AP//SALE/0038'),
(418, 'r_list', '', 'AP//SALE/0038'),
(419, 'comp_list', 'Aditya Polymer', ' AP//SALE/0039'),
(420, 'consignee_list', 'My New Company', 'AP//SALE/0039'),
(421, 'instant1', '', 'AP//SALE/0039'),
(422, 'instant2', '', 'AP//SALE/0039'),
(423, 'instant3', '', 'AP//SALE/0039'),
(424, 'instant4', '', 'AP//SALE/0039'),
(425, 'driver_instant', '', 'AP//SALE/0039'),
(426, 'actual_instant', '', 'AP//SALE/0039'),
(427, 'charged_instant', '', 'AP//SALE/0039'),
(428, 'billed_instant', '', 'AP//SALE/0039'),
(429, 'r_list', '', 'AP//SALE/0039'),
(430, 'comp_list', 'Aditya Polymer', ' AP//SALE/0040'),
(431, 'consignee_list', 'My New Company', 'AP//SALE/0040'),
(432, 'instant1', '', 'AP//SALE/0040'),
(433, 'instant2', '', 'AP//SALE/0040'),
(434, 'instant3', '', 'AP//SALE/0040'),
(435, 'instant4', '', 'AP//SALE/0040'),
(436, 'driver_instant', '', 'AP//SALE/0040'),
(437, 'actual_instant', '', 'AP//SALE/0040'),
(438, 'charged_instant', '', 'AP//SALE/0040'),
(439, 'billed_instant', '', 'AP//SALE/0040'),
(440, 'r_list', '', 'AP//SALE/0040'),
(441, 'comp_list', 'Aditya Polymer', ' AP//SALE/0041'),
(442, 'consignee_list', 'My New Company', 'AP//SALE/0041'),
(443, 'instant1', '', 'AP//SALE/0041'),
(444, 'instant2', '', 'AP//SALE/0041'),
(445, 'instant3', '', 'AP//SALE/0041'),
(446, 'instant4', '', 'AP//SALE/0041'),
(447, 'driver_instant', '', 'AP//SALE/0041'),
(448, 'actual_instant', '', 'AP//SALE/0041'),
(449, 'charged_instant', '', 'AP//SALE/0041'),
(450, 'billed_instant', '', 'AP//SALE/0041'),
(451, 'r_list', '', 'AP//SALE/0041'),
(452, 'comp_list', 'Aditya Polymer', ' AP//SALE/0042'),
(453, 'consignee_list', 'My New Company', 'AP//SALE/0042'),
(454, 'instant1', '', 'AP//SALE/0042'),
(455, 'instant2', '', 'AP//SALE/0042'),
(456, 'instant3', '', 'AP//SALE/0042'),
(457, 'instant4', '', 'AP//SALE/0042'),
(458, 'driver_instant', '', 'AP//SALE/0042'),
(459, 'actual_instant', '', 'AP//SALE/0042'),
(460, 'charged_instant', '', 'AP//SALE/0042'),
(461, 'billed_instant', '', 'AP//SALE/0042'),
(462, 'r_list', '', 'AP//SALE/0042'),
(463, 'comp_list', 'Aditya Polymer', ' AP//SALE/0043'),
(464, 'consignee_list', 'My New Company', 'AP//SALE/0043'),
(465, 'instant1', '', 'AP//SALE/0043'),
(466, 'instant2', '', 'AP//SALE/0043'),
(467, 'instant3', '', 'AP//SALE/0043'),
(468, 'instant4', '', 'AP//SALE/0043'),
(469, 'driver_instant', '', 'AP//SALE/0043'),
(470, 'actual_instant', '', 'AP//SALE/0043'),
(471, 'charged_instant', '', 'AP//SALE/0043'),
(472, 'billed_instant', '', 'AP//SALE/0043'),
(473, 'r_list', '', 'AP//SALE/0043'),
(474, 'comp_list', 'Aditya Polymer', ' AP//SALE/0044'),
(475, 'consignee_list', 'My New Company', 'AP//SALE/0044'),
(476, 'instant1', '', 'AP//SALE/0044'),
(477, 'instant2', '', 'AP//SALE/0044'),
(478, 'instant3', '', 'AP//SALE/0044'),
(479, 'instant4', '', 'AP//SALE/0044'),
(480, 'driver_instant', '', 'AP//SALE/0044'),
(481, 'actual_instant', '', 'AP//SALE/0044'),
(482, 'charged_instant', '', 'AP//SALE/0044'),
(483, 'billed_instant', '', 'AP//SALE/0044'),
(484, 'r_list', '', 'AP//SALE/0044'),
(485, 'comp_list', 'Aditya Polymer', ' AP//SALE/0045'),
(486, 'consignee_list', 'New Minerals', 'AP//SALE/0045'),
(487, 'instant1', '', 'AP//SALE/0045'),
(488, 'instant2', '', 'AP//SALE/0045'),
(489, 'instant3', '', 'AP//SALE/0045'),
(490, 'instant4', '', 'AP//SALE/0045'),
(491, 'driver_instant', '', 'AP//SALE/0045'),
(492, 'actual_instant', '', 'AP//SALE/0045'),
(493, 'charged_instant', '', 'AP//SALE/0045'),
(494, 'billed_instant', '', 'AP//SALE/0045'),
(495, 'r_list', '', 'AP//SALE/0045'),
(496, 'comp_list', 'Aditya Polymer', ' AP//SALE/0046'),
(497, 'consignee_list', 'New Minerals', 'AP//SALE/0046'),
(498, 'instant1', '', 'AP//SALE/0046'),
(499, 'instant2', '', 'AP//SALE/0046'),
(500, 'instant3', '', 'AP//SALE/0046'),
(501, 'instant4', '', 'AP//SALE/0046'),
(502, 'driver_instant', '', 'AP//SALE/0046'),
(503, 'actual_instant', '', 'AP//SALE/0046'),
(504, 'charged_instant', '', 'AP//SALE/0046'),
(505, 'billed_instant', '', 'AP//SALE/0046'),
(506, 'r_list', '', 'AP//SALE/0046'),
(507, 'comp_list', 'Aditya Polymer', ' AP//SALE/0047'),
(508, 'consignee_list', 'New Minerals', 'AP//SALE/0047'),
(509, 'instant1', '', 'AP//SALE/0047'),
(510, 'instant2', '', 'AP//SALE/0047'),
(511, 'instant3', '', 'AP//SALE/0047'),
(512, 'instant4', '', 'AP//SALE/0047'),
(513, 'driver_instant', '', 'AP//SALE/0047'),
(514, 'actual_instant', '', 'AP//SALE/0047'),
(515, 'charged_instant', '', 'AP//SALE/0047'),
(516, 'billed_instant', '', 'AP//SALE/0047'),
(517, 'r_list', '', 'AP//SALE/0047'),
(518, 'comp_list', 'Aditya Polymer', ' AP/2018-19/SALE/0001'),
(519, 'consignee_list', 'New Minerals', 'AP/2018-19/SALE/0001'),
(520, 'instant1', '', 'AP/2018-19/SALE/0001'),
(521, 'instant2', '', 'AP/2018-19/SALE/0001'),
(522, 'instant3', '', 'AP/2018-19/SALE/0001'),
(523, 'instant4', '', 'AP/2018-19/SALE/0001'),
(524, 'driver_instant', '', 'AP/2018-19/SALE/0001'),
(525, 'actual_instant', '', 'AP/2018-19/SALE/0001'),
(526, 'charged_instant', '', 'AP/2018-19/SALE/0001'),
(527, 'billed_instant', '', 'AP/2018-19/SALE/0001'),
(528, 'r_list', '', 'AP/2018-19/SALE/0001'),
(529, 'comp_list', 'Aditya Polymer', ' AP/2018-19/SALE/0002'),
(530, 'consignee_list', 'New Minerals', 'AP/2018-19/SALE/0002'),
(531, 'instant1', '', 'AP/2018-19/SALE/0002'),
(532, 'instant2', '', 'AP/2018-19/SALE/0002'),
(533, 'instant3', '', 'AP/2018-19/SALE/0002'),
(534, 'instant4', '', 'AP/2018-19/SALE/0002'),
(535, 'driver_instant', '', 'AP/2018-19/SALE/0002'),
(536, 'actual_instant', '', 'AP/2018-19/SALE/0002'),
(537, 'charged_instant', '', 'AP/2018-19/SALE/0002'),
(538, 'billed_instant', '', 'AP/2018-19/SALE/0002'),
(539, 'r_list', '', 'AP/2018-19/SALE/0002'),
(540, 'comp_list', 'Aditya Polymer', ' AP/2018-19/SALE/0003'),
(541, 'consignee_list', 'New Minerals', 'AP/2018-19/SALE/0003'),
(542, 'instant1', '', 'AP/2018-19/SALE/0003'),
(543, 'instant2', '', 'AP/2018-19/SALE/0003'),
(544, 'instant3', '', 'AP/2018-19/SALE/0003'),
(545, 'instant4', '', 'AP/2018-19/SALE/0003'),
(546, 'driver_instant', '', 'AP/2018-19/SALE/0003'),
(547, 'actual_instant', '', 'AP/2018-19/SALE/0003'),
(548, 'charged_instant', '', 'AP/2018-19/SALE/0003'),
(549, 'billed_instant', '', 'AP/2018-19/SALE/0003'),
(550, 'r_list', '', 'AP/2018-19/SALE/0003'),
(551, 'comp_list', 'Aditya Polymer', ' AP/2018-19/SALE/0004'),
(552, 'consignee_list', 'New Minerals', 'AP/2018-19/SALE/0004'),
(553, 'instant1', '', 'AP/2018-19/SALE/0004'),
(554, 'instant2', '', 'AP/2018-19/SALE/0004'),
(555, 'instant3', '', 'AP/2018-19/SALE/0004'),
(556, 'instant4', '', 'AP/2018-19/SALE/0004'),
(557, 'driver_instant', '', 'AP/2018-19/SALE/0004'),
(558, 'actual_instant', '', 'AP/2018-19/SALE/0004'),
(559, 'charged_instant', '', 'AP/2018-19/SALE/0004'),
(560, 'billed_instant', '', 'AP/2018-19/SALE/0004'),
(561, 'r_list', '', 'AP/2018-19/SALE/0004'),
(562, 'comp_list', 'Aditya Polymer', ' AP/2018-19/SALE/0002'),
(563, 'consignee_list', 'New Minerals', 'AP/2018-19/SALE/0002'),
(564, 'instant1', '', 'AP/2018-19/SALE/0002'),
(565, 'instant2', '', 'AP/2018-19/SALE/0002'),
(566, 'instant3', '', 'AP/2018-19/SALE/0002'),
(567, 'instant4', '', 'AP/2018-19/SALE/0002'),
(568, 'driver_instant', '', 'AP/2018-19/SALE/0002'),
(569, 'actual_instant', '', 'AP/2018-19/SALE/0002'),
(570, 'charged_instant', '', 'AP/2018-19/SALE/0002'),
(571, 'billed_instant', '', 'AP/2018-19/SALE/0002'),
(572, 'r_list', '', 'AP/2018-19/SALE/0002'),
(573, 'comp_list', 'Aditya Polymer', ' AP/2018-19/SALE/0002'),
(574, 'consignee_list', 'New Minerals', 'AP/2018-19/SALE/0002'),
(575, 'instant1', '', 'AP/2018-19/SALE/0002'),
(576, 'instant2', '', 'AP/2018-19/SALE/0002'),
(577, 'instant3', '', 'AP/2018-19/SALE/0002'),
(578, 'instant4', '', 'AP/2018-19/SALE/0002'),
(579, 'driver_instant', '', 'AP/2018-19/SALE/0002'),
(580, 'actual_instant', '', 'AP/2018-19/SALE/0002'),
(581, 'charged_instant', '', 'AP/2018-19/SALE/0002'),
(582, 'billed_instant', '', 'AP/2018-19/SALE/0002'),
(583, 'r_list', '', 'AP/2018-19/SALE/0002'),
(584, 'comp_list', 'Aditya Polymer', ' AP/2018-19/SALE/0002'),
(585, 'consignee_list', 'New Minerals', 'AP/2018-19/SALE/0002'),
(586, 'instant1', '', 'AP/2018-19/SALE/0002'),
(587, 'instant2', '', 'AP/2018-19/SALE/0002'),
(588, 'instant3', '', 'AP/2018-19/SALE/0002'),
(589, 'instant4', '', 'AP/2018-19/SALE/0002'),
(590, 'driver_instant', '', 'AP/2018-19/SALE/0002'),
(591, 'actual_instant', '', 'AP/2018-19/SALE/0002'),
(592, 'charged_instant', '', 'AP/2018-19/SALE/0002'),
(593, 'billed_instant', '', 'AP/2018-19/SALE/0002'),
(594, 'r_list', '', 'AP/2018-19/SALE/0002'),
(595, 'comp_list', 'Aditya Polymer', ' AP/2018-19/SALE/0002'),
(596, 'consignee_list', 'New Minerals', 'AP/2018-19/SALE/0002'),
(597, 'instant1', '', 'AP/2018-19/SALE/0002'),
(598, 'instant2', '', 'AP/2018-19/SALE/0002'),
(599, 'instant3', '', 'AP/2018-19/SALE/0002'),
(600, 'instant4', '', 'AP/2018-19/SALE/0002'),
(601, 'driver_instant', '', 'AP/2018-19/SALE/0002'),
(602, 'actual_instant', '', 'AP/2018-19/SALE/0002'),
(603, 'charged_instant', '', 'AP/2018-19/SALE/0002'),
(604, 'billed_instant', '', 'AP/2018-19/SALE/0002'),
(605, 'r_list', '', 'AP/2018-19/SALE/0002'),
(606, 'comp_list', 'Aditya Polymer', ' AP/2018-19/SALE/0002'),
(607, 'consignee_list', 'New Minerals', 'AP/2018-19/SALE/0002'),
(608, 'instant1', '', 'AP/2018-19/SALE/0002'),
(609, 'instant2', '', 'AP/2018-19/SALE/0002'),
(610, 'instant3', '', 'AP/2018-19/SALE/0002'),
(611, 'instant4', '', 'AP/2018-19/SALE/0002'),
(612, 'driver_instant', '', 'AP/2018-19/SALE/0002'),
(613, 'actual_instant', '', 'AP/2018-19/SALE/0002'),
(614, 'charged_instant', '', 'AP/2018-19/SALE/0002'),
(615, 'billed_instant', '', 'AP/2018-19/SALE/0002'),
(616, 'r_list', '', 'AP/2018-19/SALE/0002'),
(617, 'comp_list', 'Aditya Polymer', ' AP/2018-19/SALE/0002'),
(618, 'consignee_list', 'New Minerals', 'AP/2018-19/SALE/0002'),
(619, 'instant1', '', 'AP/2018-19/SALE/0002'),
(620, 'instant2', '', 'AP/2018-19/SALE/0002'),
(621, 'instant3', '', 'AP/2018-19/SALE/0002'),
(622, 'instant4', '', 'AP/2018-19/SALE/0002'),
(623, 'driver_instant', '', 'AP/2018-19/SALE/0002'),
(624, 'actual_instant', '', 'AP/2018-19/SALE/0002'),
(625, 'charged_instant', '', 'AP/2018-19/SALE/0002'),
(626, 'billed_instant', '', 'AP/2018-19/SALE/0002'),
(627, 'r_list', '', 'AP/2018-19/SALE/0002'),
(628, 'comp_list', 'Aditya Polymer', ' AP/2018-19/SALE/0005'),
(629, 'consignee_list', 'New Minerals', 'AP/2018-19/SALE/0005'),
(630, 'instant1', '', 'AP/2018-19/SALE/0005'),
(631, 'instant2', '', 'AP/2018-19/SALE/0005'),
(632, 'instant3', '', 'AP/2018-19/SALE/0005'),
(633, 'instant4', '', 'AP/2018-19/SALE/0005'),
(634, 'driver_instant', '', 'AP/2018-19/SALE/0005'),
(635, 'actual_instant', '', 'AP/2018-19/SALE/0005'),
(636, 'charged_instant', '', 'AP/2018-19/SALE/0005'),
(637, 'billed_instant', '', 'AP/2018-19/SALE/0005'),
(638, 'r_list', '', 'AP/2018-19/SALE/0005'),
(639, 'comp_list', 'Aditya Polymer', ' AP/2018-19/SALE/0002'),
(640, 'consignee_list', 'New Minerals', 'AP/2018-19/SALE/0002'),
(641, 'instant1', '', 'AP/2018-19/SALE/0002'),
(642, 'instant2', '', 'AP/2018-19/SALE/0002'),
(643, 'instant3', '', 'AP/2018-19/SALE/0002'),
(644, 'instant4', '', 'AP/2018-19/SALE/0002'),
(645, 'driver_instant', '', 'AP/2018-19/SALE/0002'),
(646, 'actual_instant', '', 'AP/2018-19/SALE/0002'),
(647, 'charged_instant', '', 'AP/2018-19/SALE/0002'),
(648, 'billed_instant', '', 'AP/2018-19/SALE/0002'),
(649, 'r_list', '', 'AP/2018-19/SALE/0002'),
(650, 'comp_list', 'Aditya Polymer', ' AP/2018-19/SALE/0002'),
(651, 'consignee_list', 'New Minerals', 'AP/2018-19/SALE/0002'),
(652, 'instant1', '', 'AP/2018-19/SALE/0002'),
(653, 'instant2', '', 'AP/2018-19/SALE/0002'),
(654, 'instant3', '', 'AP/2018-19/SALE/0002'),
(655, 'instant4', '', 'AP/2018-19/SALE/0002'),
(656, 'driver_instant', '', 'AP/2018-19/SALE/0002'),
(657, 'actual_instant', '', 'AP/2018-19/SALE/0002'),
(658, 'charged_instant', '', 'AP/2018-19/SALE/0002'),
(659, 'billed_instant', '', 'AP/2018-19/SALE/0002'),
(660, 'r_list', '', 'AP/2018-19/SALE/0002'),
(661, 'comp_list', 'Aditya Polymer', ' AP/2018-19/SALE/0002'),
(662, 'consignee_list', 'New Minerals', 'AP/2018-19/SALE/0002'),
(663, 'instant1', '', 'AP/2018-19/SALE/0002'),
(664, 'instant2', '', 'AP/2018-19/SALE/0002'),
(665, 'instant3', '', 'AP/2018-19/SALE/0002'),
(666, 'instant4', '', 'AP/2018-19/SALE/0002'),
(667, 'driver_instant', '', 'AP/2018-19/SALE/0002'),
(668, 'actual_instant', '', 'AP/2018-19/SALE/0002'),
(669, 'charged_instant', '', 'AP/2018-19/SALE/0002'),
(670, 'billed_instant', '', 'AP/2018-19/SALE/0002'),
(671, 'r_list', '', 'AP/2018-19/SALE/0002'),
(672, 'comp_list', 'Aditya Polymer', ' AP/2018-19/SALE/0002'),
(673, 'consignee_list', 'New Minerals', 'AP/2018-19/SALE/0002'),
(674, 'instant1', '', 'AP/2018-19/SALE/0002'),
(675, 'instant2', '', 'AP/2018-19/SALE/0002'),
(676, 'instant3', '', 'AP/2018-19/SALE/0002'),
(677, 'instant4', '', 'AP/2018-19/SALE/0002'),
(678, 'driver_instant', '', 'AP/2018-19/SALE/0002'),
(679, 'actual_instant', '', 'AP/2018-19/SALE/0002'),
(680, 'charged_instant', '', 'AP/2018-19/SALE/0002'),
(681, 'billed_instant', '', 'AP/2018-19/SALE/0002'),
(682, 'r_list', '', 'AP/2018-19/SALE/0002'),
(683, 'comp_list', 'Aditya Polymer', ' AP/2018-19/SALE/0002'),
(684, 'consignee_list', 'New Minerals', 'AP/2018-19/SALE/0002'),
(685, 'instant1', '', 'AP/2018-19/SALE/0002'),
(686, 'instant2', '', 'AP/2018-19/SALE/0002'),
(687, 'instant3', '', 'AP/2018-19/SALE/0002'),
(688, 'instant4', '', 'AP/2018-19/SALE/0002'),
(689, 'driver_instant', '', 'AP/2018-19/SALE/0002'),
(690, 'actual_instant', '', 'AP/2018-19/SALE/0002'),
(691, 'charged_instant', '', 'AP/2018-19/SALE/0002'),
(692, 'billed_instant', '', 'AP/2018-19/SALE/0002'),
(693, 'r_list', '', 'AP/2018-19/SALE/0002'),
(694, 'comp_list', 'Aditya Polymer', ' AP/2018-19/SALE/0002'),
(695, 'consignee_list', 'New Minerals', 'AP/2018-19/SALE/0002'),
(696, 'instant1', '', 'AP/2018-19/SALE/0002'),
(697, 'instant2', '', 'AP/2018-19/SALE/0002'),
(698, 'instant3', '', 'AP/2018-19/SALE/0002'),
(699, 'instant4', '', 'AP/2018-19/SALE/0002'),
(700, 'driver_instant', '', 'AP/2018-19/SALE/0002'),
(701, 'actual_instant', '', 'AP/2018-19/SALE/0002'),
(702, 'charged_instant', '', 'AP/2018-19/SALE/0002'),
(703, 'billed_instant', '', 'AP/2018-19/SALE/0002'),
(704, 'r_list', '', 'AP/2018-19/SALE/0002'),
(705, 'comp_list', 'Aditya Polymer', ' AP/2018-19/SALE/0002'),
(706, 'consignee_list', 'New Minerals', 'AP/2018-19/SALE/0002'),
(707, 'instant1', '', 'AP/2018-19/SALE/0002'),
(708, 'instant2', '', 'AP/2018-19/SALE/0002'),
(709, 'instant3', '', 'AP/2018-19/SALE/0002'),
(710, 'instant4', '', 'AP/2018-19/SALE/0002'),
(711, 'driver_instant', '', 'AP/2018-19/SALE/0002'),
(712, 'actual_instant', '', 'AP/2018-19/SALE/0002'),
(713, 'charged_instant', '', 'AP/2018-19/SALE/0002'),
(714, 'billed_instant', '', 'AP/2018-19/SALE/0002'),
(715, 'r_list', '', 'AP/2018-19/SALE/0002'),
(716, 'comp_list', 'Aditya Polymer', ' AP/2018-19/SALE/0002'),
(717, 'consignee_list', 'New Minerals', 'AP/2018-19/SALE/0002'),
(718, 'instant1', '', 'AP/2018-19/SALE/0002'),
(719, 'instant2', '', 'AP/2018-19/SALE/0002'),
(720, 'instant3', '', 'AP/2018-19/SALE/0002'),
(721, 'instant4', '', 'AP/2018-19/SALE/0002'),
(722, 'driver_instant', '', 'AP/2018-19/SALE/0002'),
(723, 'actual_instant', '', 'AP/2018-19/SALE/0002'),
(724, 'charged_instant', '', 'AP/2018-19/SALE/0002'),
(725, 'billed_instant', '', 'AP/2018-19/SALE/0002'),
(726, 'r_list', '', 'AP/2018-19/SALE/0002'),
(727, 'comp_list', 'Aditya Polymer', ' AP/2018-19/SALE/0002'),
(728, 'consignee_list', 'New Minerals', 'AP/2018-19/SALE/0002'),
(729, 'instant1', '', 'AP/2018-19/SALE/0002'),
(730, 'instant2', '', 'AP/2018-19/SALE/0002'),
(731, 'instant3', '', 'AP/2018-19/SALE/0002'),
(732, 'instant4', '', 'AP/2018-19/SALE/0002'),
(733, 'driver_instant', '', 'AP/2018-19/SALE/0002'),
(734, 'actual_instant', '', 'AP/2018-19/SALE/0002'),
(735, 'charged_instant', '', 'AP/2018-19/SALE/0002'),
(736, 'billed_instant', '', 'AP/2018-19/SALE/0002'),
(737, 'r_list', '', 'AP/2018-19/SALE/0002'),
(738, 'comp_list', 'Aditya Polymer', ' AP/2018-19/SALE/0002'),
(739, 'consignee_list', 'New Minerals', 'AP/2018-19/SALE/0002'),
(740, 'instant1', '', 'AP/2018-19/SALE/0002'),
(741, 'instant2', '', 'AP/2018-19/SALE/0002'),
(742, 'instant3', '', 'AP/2018-19/SALE/0002'),
(743, 'instant4', '', 'AP/2018-19/SALE/0002'),
(744, 'driver_instant', '', 'AP/2018-19/SALE/0002'),
(745, 'actual_instant', '', 'AP/2018-19/SALE/0002'),
(746, 'charged_instant', '', 'AP/2018-19/SALE/0002'),
(747, 'billed_instant', '', 'AP/2018-19/SALE/0002'),
(748, 'r_list', '', 'AP/2018-19/SALE/0002'),
(749, 'comp_list', 'Aditya Polymer', ' AP/2018-19/SALE/0002'),
(750, 'consignee_list', 'New Minerals', 'AP/2018-19/SALE/0002'),
(751, 'instant1', '', 'AP/2018-19/SALE/0002'),
(752, 'instant2', '', 'AP/2018-19/SALE/0002'),
(753, 'instant3', '', 'AP/2018-19/SALE/0002'),
(754, 'instant4', '', 'AP/2018-19/SALE/0002'),
(755, 'driver_instant', '', 'AP/2018-19/SALE/0002'),
(756, 'actual_instant', '', 'AP/2018-19/SALE/0002'),
(757, 'charged_instant', '', 'AP/2018-19/SALE/0002'),
(758, 'billed_instant', '', 'AP/2018-19/SALE/0002'),
(759, 'r_list', '', 'AP/2018-19/SALE/0002'),
(760, 'comp_list', 'Aditya Polymer', ' AP/2018-19/SALE/0002'),
(761, 'consignee_list', 'New Minerals', 'AP/2018-19/SALE/0002'),
(762, 'instant1', '', 'AP/2018-19/SALE/0002'),
(763, 'instant2', '', 'AP/2018-19/SALE/0002'),
(764, 'instant3', '', 'AP/2018-19/SALE/0002'),
(765, 'instant4', '', 'AP/2018-19/SALE/0002'),
(766, 'driver_instant', '', 'AP/2018-19/SALE/0002'),
(767, 'actual_instant', '', 'AP/2018-19/SALE/0002'),
(768, 'charged_instant', '', 'AP/2018-19/SALE/0002'),
(769, 'billed_instant', '', 'AP/2018-19/SALE/0002'),
(770, 'r_list', '', 'AP/2018-19/SALE/0002'),
(771, 'comp_list', 'Aditya Polymer', ' AP/2018-19/SALE/0002'),
(772, 'consignee_list', 'New Minerals', 'AP/2018-19/SALE/0002'),
(773, 'instant1', '', 'AP/2018-19/SALE/0002'),
(774, 'instant2', '', 'AP/2018-19/SALE/0002'),
(775, 'instant3', '', 'AP/2018-19/SALE/0002'),
(776, 'instant4', '', 'AP/2018-19/SALE/0002'),
(777, 'driver_instant', '', 'AP/2018-19/SALE/0002'),
(778, 'actual_instant', '', 'AP/2018-19/SALE/0002'),
(779, 'charged_instant', '', 'AP/2018-19/SALE/0002'),
(780, 'billed_instant', '', 'AP/2018-19/SALE/0002'),
(781, 'r_list', '', 'AP/2018-19/SALE/0002'),
(782, 'comp_list', 'Aditya Polymer', ' AP/2018-19/SALE/0002'),
(783, 'consignee_list', 'New Minerals', 'AP/2018-19/SALE/0002'),
(784, 'instant1', '', 'AP/2018-19/SALE/0002'),
(785, 'instant2', '', 'AP/2018-19/SALE/0002'),
(786, 'instant3', '', 'AP/2018-19/SALE/0002'),
(787, 'instant4', '', 'AP/2018-19/SALE/0002'),
(788, 'driver_instant', '', 'AP/2018-19/SALE/0002'),
(789, 'actual_instant', '', 'AP/2018-19/SALE/0002'),
(790, 'charged_instant', '', 'AP/2018-19/SALE/0002'),
(791, 'billed_instant', '', 'AP/2018-19/SALE/0002'),
(792, 'r_list', '', 'AP/2018-19/SALE/0002'),
(793, 'comp_list', 'Aditya Polymer', ' AP/2018-19/SALE/0002'),
(794, 'consignee_list', 'New Minerals', 'AP/2018-19/SALE/0002'),
(795, 'instant1', '', 'AP/2018-19/SALE/0002'),
(796, 'instant2', '', 'AP/2018-19/SALE/0002'),
(797, 'instant3', '', 'AP/2018-19/SALE/0002'),
(798, 'instant4', '', 'AP/2018-19/SALE/0002'),
(799, 'driver_instant', '', 'AP/2018-19/SALE/0002'),
(800, 'actual_instant', '', 'AP/2018-19/SALE/0002'),
(801, 'charged_instant', '', 'AP/2018-19/SALE/0002'),
(802, 'billed_instant', '', 'AP/2018-19/SALE/0002'),
(803, 'r_list', '', 'AP/2018-19/SALE/0002'),
(804, 'comp_list', 'Aditya Polymer', ' AP/2018-19/SALE/0002'),
(805, 'consignee_list', 'New Minerals', 'AP/2018-19/SALE/0002'),
(806, 'instant1', '', 'AP/2018-19/SALE/0002'),
(807, 'instant2', '', 'AP/2018-19/SALE/0002'),
(808, 'instant3', '', 'AP/2018-19/SALE/0002'),
(809, 'instant4', '', 'AP/2018-19/SALE/0002'),
(810, 'driver_instant', '', 'AP/2018-19/SALE/0002'),
(811, 'actual_instant', '', 'AP/2018-19/SALE/0002'),
(812, 'charged_instant', '', 'AP/2018-19/SALE/0002'),
(813, 'billed_instant', '', 'AP/2018-19/SALE/0002'),
(814, 'r_list', '', 'AP/2018-19/SALE/0002'),
(815, 'comp_list', 'Aditya Polymer', ' AP/2018-19/PURC/0001'),
(816, 'consignee_list', 'My New Company', 'AP/2018-19/PURC/0001'),
(817, 'instant1', '', 'AP/2018-19/PURC/0001'),
(818, 'instant2', '', 'AP/2018-19/PURC/0001'),
(819, 'instant3', '', 'AP/2018-19/PURC/0001'),
(820, 'driver_instant', '', 'AP/2018-19/PURC/0001'),
(821, 'billed_instant', '', 'AP/2018-19/PURC/0001'),
(822, 'actual_instant', '', 'AP/2018-19/PURC/0001'),
(823, 'r_list', '', 'AP/2018-19/PURC/0001'),
(824, 'comp_list', 'Aditya Polymer', ' AP/2018-19/PURC/0002'),
(825, 'consignee_list', 'My New Company', 'AP/2018-19/PURC/0002'),
(826, 'instant1', '', 'AP/2018-19/PURC/0002'),
(827, 'instant2', '', 'AP/2018-19/PURC/0002'),
(828, 'instant3', '', 'AP/2018-19/PURC/0002'),
(829, 'driver_instant', '', 'AP/2018-19/PURC/0002'),
(830, 'billed_instant', '', 'AP/2018-19/PURC/0002'),
(831, 'actual_instant', '', 'AP/2018-19/PURC/0002'),
(832, 'r_list', '', 'AP/2018-19/PURC/0002'),
(833, 'comp_list', 'Aditya Polymer', ' AP/2018-19/PURC/0003'),
(834, 'consignee_list', 'My New Company', 'AP/2018-19/PURC/0003'),
(835, 'instant1', '', 'AP/2018-19/PURC/0003'),
(836, 'instant2', '', 'AP/2018-19/PURC/0003'),
(837, 'instant3', '', 'AP/2018-19/PURC/0003'),
(838, 'driver_instant', '', 'AP/2018-19/PURC/0003'),
(839, 'billed_instant', '', 'AP/2018-19/PURC/0003'),
(840, 'actual_instant', '', 'AP/2018-19/PURC/0003'),
(841, 'r_list', '', 'AP/2018-19/PURC/0003'),
(842, 'comp_list', 'Aditya Polymer', ' AP/2018-19/PURC/0004'),
(843, 'consignee_list', 'My New Company', 'AP/2018-19/PURC/0004'),
(844, 'instant1', '', 'AP/2018-19/PURC/0004'),
(845, 'instant2', '', 'AP/2018-19/PURC/0004'),
(846, 'instant3', '', 'AP/2018-19/PURC/0004'),
(847, 'driver_instant', '', 'AP/2018-19/PURC/0004'),
(848, 'billed_instant', '', 'AP/2018-19/PURC/0004'),
(849, 'actual_instant', '', 'AP/2018-19/PURC/0004'),
(850, 'r_list', '', 'AP/2018-19/PURC/0004'),
(851, 'comp_list', 'Aditya Polymer', ' AP/2018-19/PURC/0005'),
(852, 'consignee_list', 'My New Company', 'AP/2018-19/PURC/0005'),
(853, 'instant1', '', 'AP/2018-19/PURC/0005'),
(854, 'instant2', '', 'AP/2018-19/PURC/0005'),
(855, 'instant3', '', 'AP/2018-19/PURC/0005'),
(856, 'driver_instant', '', 'AP/2018-19/PURC/0005'),
(857, 'billed_instant', '', 'AP/2018-19/PURC/0005'),
(858, 'actual_instant', '', 'AP/2018-19/PURC/0005'),
(859, 'r_list', '', 'AP/2018-19/PURC/0005'),
(860, 'comp_list', 'Aditya Polymer', ' AP/2018-19/PURC/0006'),
(861, 'consignee_list', 'My New Company', 'AP/2018-19/PURC/0006'),
(862, 'instant1', '', 'AP/2018-19/PURC/0006'),
(863, 'instant2', '', 'AP/2018-19/PURC/0006'),
(864, 'instant3', '', 'AP/2018-19/PURC/0006'),
(865, 'driver_instant', '', 'AP/2018-19/PURC/0006'),
(866, 'billed_instant', '', 'AP/2018-19/PURC/0006'),
(867, 'actual_instant', '', 'AP/2018-19/PURC/0006'),
(868, 'r_list', '', 'AP/2018-19/PURC/0006'),
(869, 'comp_list', 'Aditya Polymer', ' AP/2018-19/PURC/0007'),
(870, 'consignee_list', 'My New Company', 'AP/2018-19/PURC/0007'),
(871, 'instant1', '', 'AP/2018-19/PURC/0007'),
(872, 'instant2', '', 'AP/2018-19/PURC/0007'),
(873, 'instant3', '', 'AP/2018-19/PURC/0007'),
(874, 'driver_instant', '', 'AP/2018-19/PURC/0007'),
(875, 'billed_instant', '', 'AP/2018-19/PURC/0007'),
(876, 'actual_instant', '', 'AP/2018-19/PURC/0007'),
(877, 'r_list', '', 'AP/2018-19/PURC/0007'),
(878, 'comp_list', 'Aditya Polymer', ' AP/2018-19/PURC/0008'),
(879, 'consignee_list', 'My New Company', 'AP/2018-19/PURC/0008'),
(880, 'instant1', '', 'AP/2018-19/PURC/0008'),
(881, 'instant2', '', 'AP/2018-19/PURC/0008'),
(882, 'instant3', '', 'AP/2018-19/PURC/0008'),
(883, 'driver_instant', '', 'AP/2018-19/PURC/0008'),
(884, 'billed_instant', '', 'AP/2018-19/PURC/0008'),
(885, 'actual_instant', '', 'AP/2018-19/PURC/0008'),
(886, 'r_list', '', 'AP/2018-19/PURC/0008'),
(887, 'comp_list', 'Aditya Polymer', ' AP/2018-19/PURC/0009'),
(888, 'consignee_list', 'My New Company', 'AP/2018-19/PURC/0009'),
(889, 'instant1', '', 'AP/2018-19/PURC/0009'),
(890, 'instant2', '', 'AP/2018-19/PURC/0009'),
(891, 'instant3', '', 'AP/2018-19/PURC/0009'),
(892, 'driver_instant', '', 'AP/2018-19/PURC/0009'),
(893, 'billed_instant', '', 'AP/2018-19/PURC/0009'),
(894, 'actual_instant', '', 'AP/2018-19/PURC/0009'),
(895, 'r_list', '', 'AP/2018-19/PURC/0009'),
(896, 'comp_list', 'Aditya Polymer', ' AP/2018-19/PURC/0010'),
(897, 'consignee_list', 'My New Company', 'AP/2018-19/PURC/0010'),
(898, 'instant1', '', 'AP/2018-19/PURC/0010'),
(899, 'instant2', '', 'AP/2018-19/PURC/0010'),
(900, 'instant3', '', 'AP/2018-19/PURC/0010'),
(901, 'driver_instant', '', 'AP/2018-19/PURC/0010'),
(902, 'billed_instant', '', 'AP/2018-19/PURC/0010'),
(903, 'actual_instant', '', 'AP/2018-19/PURC/0010'),
(904, 'r_list', '', 'AP/2018-19/PURC/0010'),
(905, 'comp_list', 'Aditya Polymer', ' AP/2018-19/PURC/0011'),
(906, 'consignee_list', 'My New Company', 'AP/2018-19/PURC/0011'),
(907, 'instant1', '', 'AP/2018-19/PURC/0011'),
(908, 'instant2', '', 'AP/2018-19/PURC/0011'),
(909, 'instant3', '', 'AP/2018-19/PURC/0011'),
(910, 'driver_instant', '', 'AP/2018-19/PURC/0011'),
(911, 'billed_instant', '', 'AP/2018-19/PURC/0011'),
(912, 'actual_instant', '', 'AP/2018-19/PURC/0011'),
(913, 'r_list', '', 'AP/2018-19/PURC/0011'),
(914, 'comp_list', 'Aditya Polymer', ' AP/2018-19/SALE/0002'),
(915, 'consignee_list', 'New Minerals', 'AP/2018-19/SALE/0002'),
(916, 'instant1', '', 'AP/2018-19/SALE/0002'),
(917, 'instant2', '', 'AP/2018-19/SALE/0002'),
(918, 'instant3', '', 'AP/2018-19/SALE/0002'),
(919, 'instant4', '', 'AP/2018-19/SALE/0002'),
(920, 'driver_instant', '', 'AP/2018-19/SALE/0002'),
(921, 'actual_instant', '', 'AP/2018-19/SALE/0002'),
(922, 'charged_instant', '', 'AP/2018-19/SALE/0002'),
(923, 'billed_instant', '', 'AP/2018-19/SALE/0002'),
(924, 'r_list', '', 'AP/2018-19/SALE/0002'),
(925, 'comp_list', 'Aditya Polymer', ' AP/2018-19/SALE/0002'),
(926, 'consignee_list', 'New Minerals', 'AP/2018-19/SALE/0002'),
(927, 'instant1', '', 'AP/2018-19/SALE/0002'),
(928, 'instant2', '', 'AP/2018-19/SALE/0002'),
(929, 'instant3', '', 'AP/2018-19/SALE/0002'),
(930, 'instant4', '', 'AP/2018-19/SALE/0002'),
(931, 'driver_instant', '', 'AP/2018-19/SALE/0002'),
(932, 'actual_instant', '', 'AP/2018-19/SALE/0002'),
(933, 'charged_instant', '', 'AP/2018-19/SALE/0002'),
(934, 'billed_instant', '', 'AP/2018-19/SALE/0002'),
(935, 'r_list', '', 'AP/2018-19/SALE/0002'),
(936, 'comp_list', 'Aditya Polymer', ' AP/2018-19/SALE/0002'),
(937, 'consignee_list', 'New Minerals', 'AP/2018-19/SALE/0002'),
(938, 'instant1', '', 'AP/2018-19/SALE/0002'),
(939, 'instant2', '', 'AP/2018-19/SALE/0002'),
(940, 'instant3', '', 'AP/2018-19/SALE/0002'),
(941, 'instant4', '', 'AP/2018-19/SALE/0002'),
(942, 'driver_instant', '', 'AP/2018-19/SALE/0002'),
(943, 'actual_instant', '', 'AP/2018-19/SALE/0002'),
(944, 'charged_instant', '', 'AP/2018-19/SALE/0002'),
(945, 'billed_instant', '', 'AP/2018-19/SALE/0002'),
(946, 'r_list', '', 'AP/2018-19/SALE/0002'),
(947, 'comp_list', 'Aditya Polymer', ' AP/2018-19/SALE/0002'),
(948, 'consignee_list', 'New Minerals', 'AP/2018-19/SALE/0002'),
(949, 'instant1', '', 'AP/2018-19/SALE/0002'),
(950, 'instant2', '', 'AP/2018-19/SALE/0002'),
(951, 'instant3', '', 'AP/2018-19/SALE/0002'),
(952, 'instant4', '', 'AP/2018-19/SALE/0002'),
(953, 'driver_instant', '', 'AP/2018-19/SALE/0002'),
(954, 'actual_instant', '', 'AP/2018-19/SALE/0002'),
(955, 'charged_instant', '', 'AP/2018-19/SALE/0002'),
(956, 'billed_instant', '', 'AP/2018-19/SALE/0002'),
(957, 'r_list', '', 'AP/2018-19/SALE/0002'),
(958, 'comp_list', 'Aditya Polymer', ' AP/2018-19/PURC/0011'),
(959, 'consignee_list', 'My New Company', 'AP/2018-19/PURC/0011'),
(960, 'instant1', 'AP/2018-19/PURC/0011', 'AP/2018-19/PURC/0011'),
(961, 'instant2', '', 'AP/2018-19/PURC/0011'),
(962, 'instant3', '', 'AP/2018-19/PURC/0011'),
(963, 'driver_instant', '', 'AP/2018-19/PURC/0011'),
(964, 'billed_instant', '', 'AP/2018-19/PURC/0011'),
(965, 'actual_instant', '', 'AP/2018-19/PURC/0011'),
(966, 'r_list', '', 'AP/2018-19/PURC/0011'),
(967, 'comp_list', 'Aditya Polymer', ' AP/2018-19/PURC/0011'),
(968, 'consignee_list', 'My New Company', 'AP/2018-19/PURC/0011'),
(969, 'instant1', 'AP/2018-19/PURC/0011', 'AP/2018-19/PURC/0011'),
(970, 'instant2', '', 'AP/2018-19/PURC/0011'),
(971, 'instant3', '', 'AP/2018-19/PURC/0011'),
(972, 'driver_instant', '', 'AP/2018-19/PURC/0011'),
(973, 'billed_instant', '', 'AP/2018-19/PURC/0011'),
(974, 'actual_instant', '', 'AP/2018-19/PURC/0011'),
(975, 'r_list', '', 'AP/2018-19/PURC/0011'),
(976, 'comp_list', 'Aditya Polymer', ' AP/2018-19/PURC/0011'),
(977, 'consignee_list', 'My New Company', 'AP/2018-19/PURC/0011'),
(978, 'instant1', 'AP/2018-19/PURC/0011', 'AP/2018-19/PURC/0011'),
(979, 'instant2', '', 'AP/2018-19/PURC/0011'),
(980, 'instant3', '', 'AP/2018-19/PURC/0011'),
(981, 'driver_instant', '', 'AP/2018-19/PURC/0011'),
(982, 'billed_instant', '', 'AP/2018-19/PURC/0011'),
(983, 'actual_instant', '', 'AP/2018-19/PURC/0011'),
(984, 'r_list', '', 'AP/2018-19/PURC/0011'),
(985, 'comp_list', 'Aditya Polymer', ' AP/2018-19/PURC/0011'),
(986, 'consignee_list', 'My New Company', 'AP/2018-19/PURC/0011'),
(987, 'instant1', 'AP/2018-19/PURC/0011', 'AP/2018-19/PURC/0011'),
(988, 'instant2', '', 'AP/2018-19/PURC/0011'),
(989, 'instant3', '', 'AP/2018-19/PURC/0011'),
(990, 'driver_instant', '', 'AP/2018-19/PURC/0011'),
(991, 'billed_instant', '', 'AP/2018-19/PURC/0011'),
(992, 'actual_instant', '', 'AP/2018-19/PURC/0011'),
(993, 'r_list', '', 'AP/2018-19/PURC/0011'),
(994, 'comp_list', 'Aditya Polymer', ' AP/2018-19/PURC/0011'),
(995, 'consignee_list', 'My New Company', 'AP/2018-19/PURC/0011'),
(996, 'instant1', 'AP/2018-19/PURC/0011', 'AP/2018-19/PURC/0011'),
(997, 'instant2', '', 'AP/2018-19/PURC/0011'),
(998, 'instant3', '', 'AP/2018-19/PURC/0011'),
(999, 'driver_instant', '', 'AP/2018-19/PURC/0011'),
(1000, 'billed_instant', '', 'AP/2018-19/PURC/0011'),
(1001, 'actual_instant', '', 'AP/2018-19/PURC/0011'),
(1002, 'r_list', '', 'AP/2018-19/PURC/0011'),
(1003, 'comp_list', 'Aditya Polymer', ' AP/2018-19/PURC/0011'),
(1004, 'consignee_list', 'My New Company', 'AP/2018-19/PURC/0011'),
(1005, 'instant1', 'AP/2018-19/PURC/0011', 'AP/2018-19/PURC/0011'),
(1006, 'instant2', '', 'AP/2018-19/PURC/0011'),
(1007, 'instant3', '', 'AP/2018-19/PURC/0011'),
(1008, 'driver_instant', '', 'AP/2018-19/PURC/0011'),
(1009, 'billed_instant', '', 'AP/2018-19/PURC/0011'),
(1010, 'actual_instant', '', 'AP/2018-19/PURC/0011'),
(1011, 'r_list', '', 'AP/2018-19/PURC/0011'),
(1012, 'comp_list', 'Aditya Polymer', ' AP/2018-19/PURC/0011'),
(1013, 'consignee_list', 'My New Company', 'AP/2018-19/PURC/0011'),
(1014, 'instant1', 'AP/2018-19/PURC/0011', 'AP/2018-19/PURC/0011'),
(1015, 'instant2', '', 'AP/2018-19/PURC/0011'),
(1016, 'instant3', '', 'AP/2018-19/PURC/0011'),
(1017, 'driver_instant', '', 'AP/2018-19/PURC/0011'),
(1018, 'billed_instant', '', 'AP/2018-19/PURC/0011'),
(1019, 'actual_instant', '', 'AP/2018-19/PURC/0011'),
(1020, 'r_list', '', 'AP/2018-19/PURC/0011'),
(1021, 'comp_list', 'Aditya Polymer', ' AP/2018-19/PURC/0011'),
(1022, 'consignee_list', 'My New Company', 'AP/2018-19/PURC/0011'),
(1023, 'instant1', 'AP/2018-19/PURC/0011', 'AP/2018-19/PURC/0011'),
(1024, 'instant2', '', 'AP/2018-19/PURC/0011'),
(1025, 'instant3', '', 'AP/2018-19/PURC/0011'),
(1026, 'driver_instant', '', 'AP/2018-19/PURC/0011'),
(1027, 'billed_instant', '', 'AP/2018-19/PURC/0011'),
(1028, 'actual_instant', '', 'AP/2018-19/PURC/0011'),
(1029, 'r_list', '', 'AP/2018-19/PURC/0011'),
(1030, 'comp_list', 'Aditya Polymer', ' AP/2018-19/PURC/0011'),
(1031, 'consignee_list', 'My New Company', 'AP/2018-19/PURC/0011'),
(1032, 'instant1', 'AP/2018-19/PURC/0011', 'AP/2018-19/PURC/0011'),
(1033, 'instant2', '', 'AP/2018-19/PURC/0011'),
(1034, 'instant3', '', 'AP/2018-19/PURC/0011'),
(1035, 'driver_instant', '', 'AP/2018-19/PURC/0011'),
(1036, 'billed_instant', '', 'AP/2018-19/PURC/0011'),
(1037, 'actual_instant', '', 'AP/2018-19/PURC/0011'),
(1038, 'r_list', '', 'AP/2018-19/PURC/0011'),
(1039, 'comp_list', 'Aditya Polymer', ' AP/2018-19/PURC/0011'),
(1040, 'consignee_list', 'My New Company', 'AP/2018-19/PURC/0011'),
(1041, 'instant1', 'AP/2018-19/PURC/0011', 'AP/2018-19/PURC/0011'),
(1042, 'instant2', '', 'AP/2018-19/PURC/0011'),
(1043, 'instant3', '', 'AP/2018-19/PURC/0011'),
(1044, 'driver_instant', '', 'AP/2018-19/PURC/0011'),
(1045, 'billed_instant', '', 'AP/2018-19/PURC/0011'),
(1046, 'actual_instant', '', 'AP/2018-19/PURC/0011'),
(1047, 'r_list', '', 'AP/2018-19/PURC/0011'),
(1048, 'comp_list', 'Aditya Polymer', ' AP/2018-19/PURC/0011'),
(1049, 'consignee_list', 'My New Company', 'AP/2018-19/PURC/0011'),
(1050, 'instant1', 'AP/2018-19/PURC/0011', 'AP/2018-19/PURC/0011'),
(1051, 'instant2', '', 'AP/2018-19/PURC/0011'),
(1052, 'instant3', '', 'AP/2018-19/PURC/0011'),
(1053, 'driver_instant', '', 'AP/2018-19/PURC/0011'),
(1054, 'billed_instant', '', 'AP/2018-19/PURC/0011'),
(1055, 'actual_instant', '', 'AP/2018-19/PURC/0011'),
(1056, 'r_list', '', 'AP/2018-19/PURC/0011'),
(1057, 'comp_list', 'Aditya Polymer', ' AP/2018-19/PURC/0011'),
(1058, 'consignee_list', 'My New Company', 'AP/2018-19/PURC/0011');
INSERT INTO `index_table` (`id`, `field_name`, `value`, `vno`) VALUES
(1059, 'instant1', 'AP/2018-19/PURC/0011', 'AP/2018-19/PURC/0011'),
(1060, 'instant2', '', 'AP/2018-19/PURC/0011'),
(1061, 'instant3', '', 'AP/2018-19/PURC/0011'),
(1062, 'driver_instant', '', 'AP/2018-19/PURC/0011'),
(1063, 'billed_instant', '', 'AP/2018-19/PURC/0011'),
(1064, 'actual_instant', '', 'AP/2018-19/PURC/0011'),
(1065, 'r_list', '', 'AP/2018-19/PURC/0011'),
(1066, 'comp_list', 'Aditya Polymer', ' AP/2018-19/PURC/0011'),
(1067, 'consignee_list', 'My New Company', 'AP/2018-19/PURC/0011'),
(1068, 'instant1', 'AP/2018-19/PURC/0011', 'AP/2018-19/PURC/0011'),
(1069, 'instant2', '', 'AP/2018-19/PURC/0011'),
(1070, 'instant3', '', 'AP/2018-19/PURC/0011'),
(1071, 'driver_instant', '', 'AP/2018-19/PURC/0011'),
(1072, 'billed_instant', '', 'AP/2018-19/PURC/0011'),
(1073, 'actual_instant', '', 'AP/2018-19/PURC/0011'),
(1074, 'r_list', '', 'AP/2018-19/PURC/0011'),
(1075, 'comp_list', 'Aditya Polymer', ' AP/2018-19/PURC/0011'),
(1076, 'consignee_list', 'My New Company', 'AP/2018-19/PURC/0011'),
(1077, 'instant1', 'AP/2018-19/PURC/0011', 'AP/2018-19/PURC/0011'),
(1078, 'instant2', '', 'AP/2018-19/PURC/0011'),
(1079, 'instant3', '', 'AP/2018-19/PURC/0011'),
(1080, 'driver_instant', '', 'AP/2018-19/PURC/0011'),
(1081, 'billed_instant', '', 'AP/2018-19/PURC/0011'),
(1082, 'actual_instant', '', 'AP/2018-19/PURC/0011'),
(1083, 'r_list', '', 'AP/2018-19/PURC/0011');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_instant_data`
--

CREATE TABLE `invoice_instant_data` (
  `transport` varchar(255) NOT NULL,
  `station` varchar(255) NOT NULL,
  `vehicle_no` varchar(255) NOT NULL,
  `driver_no` varchar(255) NOT NULL,
  `actual_frt` int(11) NOT NULL,
  `charged_frt` int(11) NOT NULL,
  `billed_frt` int(11) NOT NULL,
  `gr_no` varchar(255) NOT NULL,
  `remark` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_instant_data`
--

INSERT INTO `invoice_instant_data` (`transport`, `station`, `vehicle_no`, `driver_no`, `actual_frt`, `charged_frt`, `billed_frt`, `gr_no`, `remark`) VALUES
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', '1212'),
('', '', '', '', 0, 0, 0, '', '1212'),
('', '', '', '', 0, 0, 0, '', '1212'),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', ''),
('', '', '', '', 0, 0, 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `item_group_table`
--

CREATE TABLE `item_group_table` (
  `id` int(11) NOT NULL,
  `delete_flag` int(11) NOT NULL,
  `item_group` varchar(255) NOT NULL,
  `parent_item_group` varchar(255) NOT NULL,
  `bu` varchar(255) NOT NULL,
  `property` varchar(999) NOT NULL,
  `Description` varchar(255) NOT NULL DEFAULT 'General'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_group_table`
--

INSERT INTO `item_group_table` (`id`, `delete_flag`, `item_group`, `parent_item_group`, `bu`, `property`, `Description`) VALUES
(1, 0, 'group_1', 'General', 'AP', '[\"Color~ut1~l1~u1~Select~opt1,opt2\",\"Mesh~ut2~l2~u2~Input~\",\"Size~ut1~l1~u1~Select~o1,o2,o3,o4\",\"weight~ut1~l1~u1~Select~o1,o2,o3,o4\"]', 'Stone_Purchase'),
(2, 0, 'group_2', 'group_1', 'AP', '[\"Gravity~Select~Optn1,Optn2,Optn3,Optn5\"]', 'Acid Purchase'),
(3, 0, 'group_3', 'group_2', 'AP', '', ''),
(4, 0, 'group_4', 'group_3', 'AP', '', ''),
(5, 0, 'group_5', 'group_4', 'AP', '', ''),
(6, 0, 'group_6', 'General', 'VM', '', ''),
(7, 0, 'group_7', 'group_2', 'AP', '', ''),
(8, 0, 'group_8', 'group_3', 'AP', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `item_table`
--

CREATE TABLE `item_table` (
  `id` int(11) NOT NULL,
  `delete_flag` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `gst` int(11) NOT NULL,
  `vat` int(11) NOT NULL,
  `cess` int(11) NOT NULL,
  `cst` int(11) NOT NULL,
  `item_group` varchar(255) NOT NULL,
  `item_code` varchar(255) NOT NULL,
  `unit1` varchar(255) NOT NULL,
  `unit2` varchar(255) NOT NULL,
  `unit3` varchar(255) NOT NULL,
  `opening_qty` int(11) NOT NULL,
  `bu` varchar(255) NOT NULL,
  `account` varchar(255) NOT NULL,
  `purchase_account` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_table`
--

INSERT INTO `item_table` (`id`, `delete_flag`, `status`, `item_name`, `gst`, `vat`, `cess`, `cst`, `item_group`, `item_code`, `unit1`, `unit2`, `unit3`, `opening_qty`, `bu`, `account`, `purchase_account`) VALUES
(1, 0, 1, 'ABC-item1', 10, 0, 2, 0, '', '', 'ml', 'ml', 'ml', 10, 'ABC', '', ''),
(2, 0, 1, 'ABC-item2', 0, 20, 2, 10, '', '', 'ml', 'ml', 'ml', 10, 'ABC', '', ''),
(3, 0, 1, 'ABC-item3', 30, 0, 2, 0, '', '', 'ml', 'ml', 'ml', 10, 'ABC', '', ''),
(4, 0, 1, 'ABC-item4', 0, 50, 2, 20, '', '', 'ml', 'ml', 'ml', 10, 'ABC', '', ''),
(5, 0, 1, 'AP-item1', 10, 0, 2, 0, 'group_1', '', 'ml', 'ml', 'ml', 10, 'AP', 'Sales', 'Purchases'),
(6, 0, 1, 'AP-item2', 0, 20, 2, 10, 'group_2', '', 'ml', 'ml', 'ml', 10, 'AP', '', ''),
(7, 0, 1, 'AP-item3', 30, 0, 2, 0, 'group_3', '', 'ml', 'ml', 'ml', 10, 'AP', '', ''),
(8, 0, 1, 'AP-item4', 0, 50, 2, 20, 'group_4', '', 'ml', 'ml', 'ml', 10, 'AP', '', ''),
(9, 0, 1, 'VM-item1', 10, 0, 2, 0, 'group_6', '', 'ml', 'ml', 'ml', 10, 'VM', '', ''),
(10, 0, 1, 'VM-item2', 0, 20, 2, 10, '', '', 'ml', 'ml', 'ml', 10, 'VM', '', ''),
(11, 0, 1, 'VM-item3', 30, 0, 2, 0, '', '', 'ml', 'ml', 'ml', 10, 'VM', '', ''),
(12, 0, 1, 'VM-item4', 0, 50, 2, 20, '', '', 'ml', 'ml', 'ml', 10, 'VM', '', ''),
(13, 0, 1, 'XYZ-item1', 10, 0, 2, 0, '', '', 'ml', 'ml', 'ml', 10, 'XYZ', '', ''),
(14, 0, 1, 'XYZ-item2', 0, 20, 2, 10, '', '', 'ml', 'ml', 'ml', 10, 'XYZ', '', ''),
(15, 0, 1, 'XYZ-item3', 30, 0, 2, 0, '', '', 'ml', 'ml', 'ml', 10, 'XYZ', '', ''),
(16, 0, 1, 'XYZ-item4', 0, 50, 2, 20, '', '', 'ml', 'ml', 'ml', 10, 'XYZ', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `item_transaction_record`
--

CREATE TABLE `item_transaction_record` (
  `vno` varchar(255) NOT NULL,
  `t_date` date NOT NULL,
  `item_group` varchar(255) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `qty_in` decimal(11,0) NOT NULL,
  `qty_out` decimal(11,0) NOT NULL,
  `details` varchar(255) NOT NULL,
  `id` int(11) NOT NULL,
  `delete_flag` int(11) NOT NULL,
  `bu` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_transaction_record`
--

INSERT INTO `item_transaction_record` (`vno`, `t_date`, `item_group`, `item_name`, `unit`, `qty_in`, `qty_out`, `details`, `id`, `delete_flag`, `bu`) VALUES
('AP/2018-19/PURC/0010', '2018-10-14', '', 'AP-item1', 'ml', '100', '0', 'PURC', 4, 0, 'AP'),
('AP/2018-19/PURC/0011', '2018-10-14', '', 'AP-item1', 'ml', '100', '0', 'PURC', 5, 0, 'AP'),
('AP/2018-19/SALE/0002', '2018-10-18', '', 'AP-item1', 'ml', '0', '100', 'SALE', 6, 0, 'AP'),
('AP/2018-19/SALE/0002', '2018-10-18', '', 'AP-item1', 'ml', '0', '100', 'SALE', 7, 0, 'AP'),
('AP/2018-19/SALE/0002', '2018-10-18', '', 'AP-item1', 'ml', '0', '100', 'SALE', 8, 0, 'AP'),
('AP/2018-19/SALE/0002', '2018-10-18', '', 'AP-item1', 'ml', '0', '100', 'SALE', 9, 0, 'AP'),
('AP/2018-19/PURC/0011', '2018-10-18', '', 'AP-item1', 'ml', '100', '0', 'PURC', 10, 0, 'AP'),
('AP/2018-19/PURC/0011', '2018-10-18', '', 'AP-item1', 'ml', '100', '0', 'PURC', 11, 0, 'AP'),
('AP/2018-19/PURC/0011', '2018-10-18', '', 'AP-item1', 'ml', '100', '0', 'PURC', 12, 0, 'AP'),
('AP/2018-19/PURC/0011', '2018-10-18', '', 'AP-item1', 'ml', '100', '0', 'PURC', 13, 0, 'AP'),
('AP/2018-19/PURC/0011', '2018-10-18', '', 'AP-item1', 'ml', '100', '0', 'PURC', 14, 0, 'AP'),
('AP/2018-19/PURC/0011', '2018-10-23', '', 'AP-item2', 'ml', '100', '0', 'PURC', 15, 0, 'AP'),
('AP/2018-19/PURC/0011', '2018-10-23', '', 'AP-item1', 'Select Unit', '0', '0', 'PURC', 16, 0, 'AP'),
('AP/2018-19/PURC/0011', '2018-10-23', '', 'AP-item2', 'ml', '100', '0', 'PURC', 17, 0, 'AP'),
('AP/2018-19/PURC/0011', '2018-10-23', '', 'AP-item1', 'Select Unit', '0', '0', 'PURC', 18, 0, 'AP'),
('AP/2018-19/PURC/0011', '2018-10-23', '', 'AP-item2', 'ml', '100', '0', 'PURC', 19, 0, 'AP'),
('AP/2018-19/PURC/0011', '2018-10-23', '', 'AP-item1', 'Select Unit', '0', '0', 'PURC', 20, 0, 'AP'),
('AP/2018-19/PURC/0011', '2018-10-24', '', 'AP-item2', 'ml', '100', '0', 'PURC', 21, 0, 'AP'),
('AP/2018-19/PURC/0011', '2018-10-24', '', 'AP-item1', 'Select Unit', '0', '0', 'PURC', 22, 0, 'AP'),
('AP/2018-19/PURC/0011', '2018-10-24', '', 'AP-item2', 'ml', '100', '0', 'PURC', 23, 0, 'AP'),
('AP/2018-19/PURC/0011', '2018-10-24', '', 'AP-item1', 'Select Unit', '0', '0', 'PURC', 24, 0, 'AP'),
('AP/2018-19/PURC/0011', '2018-10-24', '', 'AP-item2', 'ml', '100', '0', 'PURC', 25, 0, 'AP'),
('AP/2018-19/PURC/0011', '2018-10-24', '', 'AP-item1', 'Select Unit', '0', '0', 'PURC', 26, 0, 'AP'),
('AP/2018-19/PURC/0011', '2018-10-24', '', 'AP-item2', 'ml', '100', '0', 'PURC', 27, 0, 'AP'),
('AP/2018-19/PURC/0011', '2018-10-24', '', 'AP-item1', 'Select Unit', '0', '0', 'PURC', 28, 0, 'AP'),
('AP/2018-19/PURC/0011', '2018-10-24', '', 'AP-item2', 'ml', '100', '0', 'PURC', 29, 0, 'AP'),
('AP/2018-19/PURC/0011', '2018-10-24', '', 'AP-item1', 'Select Unit', '0', '0', 'PURC', 30, 0, 'AP'),
('AP/2018-19/PURC/0011', '2018-10-24', '', 'AP-item2', 'ml', '100', '0', 'PURC', 31, 0, 'AP'),
('AP/2018-19/PURC/0011', '2018-10-24', '', 'AP-item1', 'Select Unit', '0', '0', 'PURC', 32, 0, 'AP');

-- --------------------------------------------------------

--
-- Table structure for table `log_table`
--

CREATE TABLE `log_table` (
  `login_user` varchar(255) NOT NULL,
  `vno` varchar(255) NOT NULL,
  `system_time` time NOT NULL,
  `system_date` date NOT NULL,
  `action` varchar(255) NOT NULL,
  `blank1` varchar(255) NOT NULL,
  `blank2` varchar(255) NOT NULL,
  `blank3` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `master_account_details`
--

CREATE TABLE `master_account_details` (
  `LoginUser` varchar(255) NOT NULL,
  `AccountName` varchar(255) NOT NULL,
  `account_id` varchar(255) NOT NULL,
  `sundry_type` varchar(255) NOT NULL,
  `OpeningBalance` float NOT NULL,
  `ob_type` varchar(255) NOT NULL,
  `ClosingBalance` float NOT NULL,
  `ParentGroup` varchar(255) NOT NULL,
  `Address_1` varchar(255) NOT NULL,
  `Address_2` varchar(255) NOT NULL,
  `Address_3` varchar(255) NOT NULL,
  `BusinessUnit` varchar(255) NOT NULL,
  `State` varchar(255) NOT NULL,
  `PAN` varchar(255) NOT NULL,
  `TIN` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Contact` varchar(255) NOT NULL,
  `Operator` int(11) NOT NULL,
  `Admin` int(11) NOT NULL,
  `Super_Admin` int(11) NOT NULL,
  `Supervisor` int(11) NOT NULL,
  `Head` int(11) NOT NULL,
  `Other1` int(11) NOT NULL,
  `Other2` int(11) NOT NULL,
  `Other3` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_account_details`
--

INSERT INTO `master_account_details` (`LoginUser`, `AccountName`, `account_id`, `sundry_type`, `OpeningBalance`, `ob_type`, `ClosingBalance`, `ParentGroup`, `Address_1`, `Address_2`, `Address_3`, `BusinessUnit`, `State`, `PAN`, `TIN`, `Email`, `Contact`, `Operator`, `Admin`, `Super_Admin`, `Supervisor`, `Head`, `Other1`, `Other2`, `Other3`) VALUES
('b', 'AP-Cash', 'CASH', '+', 100, 'Cr', 0, 'AP-Cash-in-hand', '', '', '', 'AP', 'Rajasthan (08)', '', '', '', '', 0, -1, 1, 1, 1, 1, 1, 0),
('b', 'AP-CC', '', '+', 50, 'Dr', 0, 'AP-MONEY', 'sr', 'wer', 'wer', 'AP', 'Rajasthan (08)', 'rrrrr4444r', '44rrrrr4444r4r4', 'asd@asd.asd', '9876543212', 0, 0, 0, 0, 0, 0, 0, 0),
('', 'AP-exp', '', '', 600, 'Dr', 0, 'AP-Expenses (Direct/Mfg.)', '', '', '', 'AP', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0),
('b', 'AP-qqq', '', '', 1000, 'Cr', 0, 'AP-Fixed Assets', '', '', '', 'AP', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0),
('', 'AP-sasa', '', '', 200, 'Cr', 0, 'AP-Sale', '', '', '', 'AP', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0),
('b', 'AP-ss', '', '', 100, 'Cr', 0, 'AP-Stock-in-hand', '', '', '', 'AP', 'Rajasthan (08)', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0),
('b', 'AP-wewe', '', '', 100, 'Dr', 0, 'AP-Purchase', '', '', '', 'AP', 'Rajasthan (08)', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0),
('b', 'AP-www', '', '', 600, 'Cr', 0, 'AP-Capital Account', '', '', '', 'AP', 'Rajasthan (08)', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0),
('b', 'X-abc', '', '', 0, '', 0, '', '', '', '', 'X', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0),
('b', 'X-pqr', '', '', 0, '', 0, '', '', '', '', 'X', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0),
('b', 'X-qwe', '', '', 0, '', 0, '', '', '', '', 'X', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0),
('b', 'X-xyz', '', '', 0, '', 0, '', '', '', '', 'X', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `page_permission`
--

CREATE TABLE `page_permission` (
  `id` varchar(20) NOT NULL,
  `page` varchar(30) NOT NULL,
  `opr_p` int(5) DEFAULT NULL,
  `spvr_p` int(5) DEFAULT NULL,
  `head_p` int(5) DEFAULT NULL,
  `admin_p` int(5) DEFAULT NULL,
  `super_admin_p` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `page_permission`
--

INSERT INTO `page_permission` (`id`, `page`, `opr_p`, `spvr_p`, `head_p`, `admin_p`, `super_admin_p`) VALUES
('ACCT_TYPE', 'TEST', 0, 1, 1, 1, 1),
('END_DT', 'TEST', 0, 1, 1, 1, 1),
('PARTY_ADDR', 'TEST', -1, -1, 0, 1, 1),
('PARTY_NAME', 'TEST', -1, 0, 1, 1, 1),
('START_DT', 'TEST', 0, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `page_permission_table`
--

CREATE TABLE `page_permission_table` (
  `pagename` varchar(255) NOT NULL,
  `permission` varchar(999) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `page_permission_table`
--

INSERT INTO `page_permission_table` (`pagename`, `permission`) VALUES
('purchase.html', '[\"sidemenu\",\"date\",\"company\",\"consignee\",\"xconsignee\",\"invoice\",\"invoice\",\"transport\",\"gr\",\"vechicle\",\"mobile\",\"billed_freight\",\"actual_freight\",\"remark\",\"item_1\",\"qty1\",\"unit1\",\"price1\",\"discount1\",\"basic_amt1\",\"sale_sundry_1 \",\"Valuation_SetUP1\",\"Valuation_SetUP2\",\"item_2\",\"qty2\",\"unit2\",\"price2\",\"discount2\",\"basic_amt2\",\"sale_sundry_2\",\"Valuation_SetUP1_2\",\"modal1\",\"modal\"]'),
('sales.html', '[\"sidemenu\",\"date\",\"company\",\"invoice\",\"consignee\",\"transport\",\"gr\",\"vechicle\",\"station\",\"mobile\",\"actual_freight\",\"charged_freight\",\"billed_freight\",\"xconsignee\",\"PO_Number\",\"remark\",\"item_1\",\"count1\",\"packing1\",\"print1\",\"bag_type1\",\"supplier1\",\"qty1\",\"unit1\",\"price1\",\"discount1\",\"basic_amt1\",\"btns1\",\"sale_sundry_1 \",\"Valuation_SetUP1\",\"Valuation_SetUP2\",\"btns1\",\"item_2\",\"count2\",\"packing2\",\"print2\",\"bag_type2\",\"s_item_2\",\"supplier2\",\"qty2\",\"unit2\",\"price2\",\"discount2\",\"basic_amt2\",\"btns2\",\"sale_sundry_2\",\"Valuation_SetUP1_2\",\"btns2\"]'),
('select_purchase.html', '[\"company\",\"date\",\"consignee\",\"xconsignee\",\"invoice\",\"invoice\",\"transport\",\"gr\",\"vechicle\",\"mobile\",\"billed_freight\",\"actual_freight\",\"item_1\",\"qty1\",\"unit1\",\"price1\",\"discount1\",\"basic_amt1\",\"Color\",\"Mesh\",\"Size\",\"remark\"]');

-- --------------------------------------------------------

--
-- Table structure for table `page_voucher_table`
--

CREATE TABLE `page_voucher_table` (
  `id` int(11) NOT NULL,
  `page_name` varchar(255) NOT NULL,
  `v_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `permission_table`
--

CREATE TABLE `permission_table` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `pagename` varchar(255) NOT NULL,
  `eff_date` date NOT NULL,
  `permission` varchar(999) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permission_table`
--

INSERT INTO `permission_table` (`id`, `username`, `pagename`, `eff_date`, `permission`) VALUES
(1, 'e', 'sales.html', '2018-10-13', '[]'),
(2, 'e', 'sales.html', '2018-10-13', '[\"sidemenu\",\"date\",\"company\",\"invoice\",\"consignee\",\"transport\",\"gr\",\"vechicle\",\"station\",\"mobile\",\"actual_freight\",\"charged_freight\",\"billed_freight\",\"xconsignee\",\"PO_Number\",\"remark\",\"item_1\",\"count1\",\"packing1\",\"print1\",\"bag_type1\",\"supplier1\",\"qty1\",\"unit1\",\"price1\",\"discount1\",\"basic_amt1\",\"btns1\",\"sale_sundry_1 \",\"Valuation_SetUP1\",\"Valuation_SetUP2\",\"btns1\",\"item_2\",\"count2\",\"packing2\",\"print2\",\"bag_type2\",\"supplier2\",\"qty2\",\"unit2\",\"price2\",\"discount2\",\"basic_amt2\",\"btns2\",\"sale_sundry_2\",\"Valuation_SetUP1_2\",\"btns2\"]'),
(3, 'e', 'sales.html', '2018-10-13', '[\"date\",\"company\",\"invoice\",\"consignee\",\"transport\",\"gr\",\"vechicle\",\"station\",\"mobile\",\"actual_freight\",\"charged_freight\",\"billed_freight\",\"xconsignee\",\"PO_Number\",\"remark\",\"item_1\",\"count1\",\"packing1\",\"print1\",\"bag_type1\",\"supplier1\",\"qty1\",\"unit1\",\"price1\",\"discount1\",\"basic_amt1\",\"btns1\",\"sale_sundry_1 \",\"Valuation_SetUP1\",\"Valuation_SetUP2\",\"btns1\",\"item_2\",\"count2\",\"packing2\",\"print2\",\"bag_type2\",\"supplier2\",\"qty2\",\"unit2\",\"price2\",\"discount2\",\"basic_amt2\",\"btns2\",\"sale_sundry_2\",\"Valuation_SetUP1_2\",\"btns2\"]'),
(4, 'e', 'sales.html', '2018-10-13', '[\"sidemenu\",\"date\",\"company\",\"invoice\",\"consignee\",\"transport\",\"gr\",\"vechicle\",\"station\",\"mobile\",\"actual_freight\",\"charged_freight\",\"billed_freight\",\"xconsignee\",\"PO_Number\",\"remark\",\"item_1\",\"count1\",\"packing1\",\"print1\",\"bag_type1\",\"supplier1\",\"qty1\",\"unit1\",\"price1\",\"discount1\",\"basic_amt1\",\"btns1\",\"sale_sundry_1 \",\"Valuation_SetUP1\",\"Valuation_SetUP2\",\"btns1\",\"item_2\",\"count2\",\"packing2\",\"print2\",\"bag_type2\",\"supplier2\",\"qty2\",\"unit2\",\"price2\",\"discount2\",\"basic_amt2\",\"btns2\",\"sale_sundry_2\",\"Valuation_SetUP1_2\",\"btns2\"]'),
(5, 'e', 'purchase.html', '2018-10-13', '[]'),
(6, 'e', 'purchase.html', '2018-10-14', '[\"sidemenu\",\"date\",\"company\",\"consignee\",\"xconsignee\",\"invoice\",\"invoice\",\"transport\",\"gr\",\"vechicle\",\"mobile\",\"billed_freight\",\"actual_freight\",\"remark\",\"item_1\",\"qty1\",\"unit1\",\"price1\",\"discount1\",\"basic_amt1\",\"sale_sundry_1 \",\"Valuation_SetUP1\",\"Valuation_SetUP2\",\"item_2\",\"qty2\",\"unit2\",\"price2\",\"discount2\",\"basic_amt2\",\"sale_sundry_2\",\"Valuation_SetUP1_2\",\"modal1\",\"modal\"]'),
(7, 'e', 'purchase.html', '2018-10-14', '[\"date\",\"company\",\"consignee\",\"xconsignee\",\"invoice\",\"invoice\",\"transport\",\"gr\",\"vechicle\",\"mobile\",\"billed_freight\",\"actual_freight\",\"remark\",\"item_1\",\"qty1\",\"unit1\",\"price1\",\"discount1\",\"basic_amt1\",\"sale_sundry_1 \",\"Valuation_SetUP1\",\"Valuation_SetUP2\",\"item_2\",\"qty2\",\"unit2\",\"price2\",\"discount2\",\"basic_amt2\",\"sale_sundry_2\",\"Valuation_SetUP1_2\",\"modal1\",\"modal\"]'),
(8, 'e', 'purchase.html', '2018-10-14', '[\"date\",\"company\",\"consignee\",\"xconsignee\",\"invoice\",\"invoice\",\"transport\",\"gr\",\"vechicle\",\"mobile\",\"billed_freight\",\"actual_freight\",\"remark\",\"item_1\",\"qty1\",\"unit1\",\"price1\",\"discount1\",\"basic_amt1\",\"sale_sundry_1 \",\"Valuation_SetUP1\",\"Valuation_SetUP2\",\"item_2\",\"qty2\",\"unit2\",\"price2\",\"discount2\",\"basic_amt2\",\"sale_sundry_2\",\"Valuation_SetUP1_2\",\"modal1\",\"modal\"]'),
(9, 'e', 'purchase.html', '2018-10-14', '[\"sidemenu\",\"date\",\"company\",\"consignee\",\"xconsignee\",\"invoice\",\"invoice\",\"transport\",\"gr\",\"vechicle\",\"mobile\",\"billed_freight\",\"actual_freight\",\"remark\",\"item_1\",\"qty1\",\"unit1\",\"price1\",\"discount1\",\"basic_amt1\",\"sale_sundry_1 \",\"Valuation_SetUP1\",\"Valuation_SetUP2\",\"item_2\",\"qty2\",\"unit2\",\"price2\",\"discount2\",\"basic_amt2\",\"sale_sundry_2\",\"Valuation_SetUP1_2\",\"modal1\",\"modal\"]'),
(10, 'e', 'sales.html', '2018-10-18', '[\"sidemenu\",\"date\",\"company\",\"invoice\",\"consignee\",\"transport\",\"gr\",\"vechicle\",\"station\",\"mobile\",\"actual_freight\",\"charged_freight\",\"billed_freight\",\"xconsignee\",\"PO_Number\",\"remark\",\"item_1\",\"count1\",\"packing1\",\"print1\",\"bag_type1\",\"supplier1\",\"qty1\",\"unit1\",\"price1\",\"discount1\",\"basic_amt1\",\"btns1\",\"sale_sundry_1 \",\"Valuation_SetUP1\",\"Valuation_SetUP2\",\"btns1\",\"item_2\",\"count2\",\"packing2\",\"print2\",\"bag_type2\",\"supplier2\",\"qty2\",\"unit2\",\"price2\",\"discount2\",\"basic_amt2\",\"btns2\",\"sale_sundry_2\",\"Valuation_SetUP1_2\",\"btns2\"]'),
(11, 'e', 'select_purchase.html', '2018-10-19', '[\"date\",\"company\",\"consignee\",\"xconsignee\",\"invoice\",\"invoice\",\"transport\",\"gr\",\"vechicle\",\"mobile\",\"billed_freight\",\"actual_freight\",\"item_1\",\"qty1\",\"unit1\",\"price1\",\"discount1\",\"basic_amt1\",\"property_fields\",\"property_fields\",\"property_fields\",\"remark\"]'),
(12, 'e', 'select_purchase.html', '2018-10-19', '[]'),
(13, 'e', 'select_purchase.html', '2018-10-19', '[\"date\",\"company\",\"consignee\",\"xconsignee\",\"invoice\",\"invoice\",\"transport\",\"gr\",\"vechicle\",\"mobile\",\"billed_freight\",\"actual_freight\",\"item_1\",\"qty1\",\"unit1\",\"price1\",\"discount1\",\"basic_amt1\",\"property_fields\",\"property_fields\",\"remark\"]'),
(14, 'e', 'select_purchase.html', '2018-10-19', '[\"date\",\"company\",\"consignee\",\"xconsignee\",\"invoice\",\"invoice\",\"transport\",\"gr\",\"vechicle\",\"mobile\",\"billed_freight\",\"actual_freight\",\"item_1\",\"qty1\",\"unit1\",\"price1\",\"discount1\",\"basic_amt1\",\"remark\"]'),
(15, 'e', 'select_purchase.html', '2018-10-19', '[\"date\",\"company\",\"consignee\",\"xconsignee\",\"invoice\",\"invoice\",\"transport\",\"gr\",\"vechicle\",\"mobile\",\"billed_freight\",\"actual_freight\",\"item_1\",\"qty1\",\"unit1\",\"price1\",\"discount1\",\"basic_amt1\",\"Mesh\",\"Size\",\"remark\"]'),
(16, 'e', 'select_purchase.html', '2018-10-19', '[\"company\",\"consignee\",\"xconsignee\",\"invoice\",\"invoice\",\"transport\",\"gr\",\"vechicle\",\"mobile\",\"billed_freight\",\"actual_freight\",\"item_1\",\"qty1\",\"unit1\",\"price1\",\"discount1\",\"basic_amt1\",\"Mesh\",\"Size\",\"remark\"]'),
(17, 'e', 'select_purchase.html', '2018-10-19', '[\"date\",\"company\",\"consignee\",\"xconsignee\",\"invoice\",\"invoice\",\"transport\",\"gr\",\"vechicle\",\"mobile\",\"billed_freight\",\"actual_freight\",\"item_1\",\"qty1\",\"unit1\",\"price1\",\"discount1\",\"basic_amt1\",\"Color\",\"Mesh\",\"Size\",\"remark\"]'),
(18, 'e', 'select_purchase.html', '2018-10-19', '[\"date\",\"company\",\"transport\",\"gr\",\"vechicle\",\"mobile\",\"billed_freight\",\"price1\",\"discount1\",\"basic_amt1\",\"Color\",\"Mesh\",\"Size\",\"remark\"]'),
(19, 'e', 'purchase.html', '2018-10-24', '[\"sidemenu\",\"date\",\"company\",\"consignee\",\"xconsignee\",\"invoice\",\"invoice\",\"transport\",\"gr\",\"vechicle\",\"mobile\",\"billed_freight\",\"actual_freight\",\"remark\",\"item_1\",\"qty1\",\"unit1\",\"price1\",\"discount1\",\"basic_amt1\",\"sale_sundry_1 \",\"Valuation_SetUP1\",\"Valuation_SetUP2\",\"item_2\",\"qty2\",\"unit2\",\"price2\",\"discount2\",\"basic_amt2\",\"sale_sundry_2\",\"Valuation_SetUP1_2\",\"modal1\",\"modal\"]'),
(20, 'e', 'sales.html', '2018-11-04', '[\"sidemenu\",\"date\",\"company\",\"invoice\",\"consignee\",\"transport\",\"gr\",\"vechicle\",\"station\",\"mobile\",\"actual_freight\",\"charged_freight\",\"billed_freight\",\"xconsignee\",\"PO_Number\",\"remark\",\"item_1\",\"count1\",\"packing1\",\"print1\",\"bag_type1\",\"a_item_1\",\"supplier1\",\"qty1\",\"unit1\",\"price1\",\"discount1\",\"basic_amt1\",\"btns1\",\"sale_sundry_1 \",\"Valuation_SetUP1\",\"Valuation_SetUP2\",\"btns1\",\"item_2\",\"count2\",\"packing2\",\"print2\",\"bag_type2\",\"supplier2\",\"qty2\",\"unit2\",\"price2\",\"discount2\",\"basic_amt2\",\"btns2\",\"sale_sundry_2\",\"Valuation_SetUP1_2\",\"btns2\"]'),
(21, 'e', 'sales.html', '2018-11-04', '[]'),
(22, 'e', 'sales.html', '2018-11-04', '[\"sidemenu\",\"date\",\"company\",\"invoice\",\"consignee\",\"transport\",\"gr\",\"vechicle\",\"station\",\"mobile\",\"actual_freight\",\"charged_freight\",\"billed_freight\",\"xconsignee\",\"PO_Number\",\"remark\",\"item_1\",\"count1\",\"packing1\",\"print1\",\"bag_type1\",\"supplier1\",\"qty1\",\"unit1\",\"price1\",\"discount1\",\"basic_amt1\",\"btns1\",\"sale_sundry_1 \",\"Valuation_SetUP1\",\"Valuation_SetUP2\",\"btns1\",\"item_2\",\"count2\",\"packing2\",\"print2\",\"bag_type2\",\"s_item_2\",\"supplier2\",\"qty2\",\"unit2\",\"price2\",\"discount2\",\"basic_amt2\",\"btns2\",\"sale_sundry_2\",\"Valuation_SetUP1_2\",\"btns2\"]'),
(23, 'e', 'select_purchase.html', '2018-11-04', '[\"date\",\"company\",\"consignee\",\"xconsignee\",\"invoice\",\"invoice\",\"transport\",\"gr\",\"vechicle\",\"mobile\",\"billed_freight\",\"actual_freight\",\"item_1\",\"qty1\",\"unit1\",\"price1\",\"discount1\",\"basic_amt1\",\"Gravity\",\"remark\"]'),
(24, 'e', 'select_purchase.html', '2018-11-04', '[\"date\",\"company\",\"consignee\",\"xconsignee\",\"invoice\",\"invoice\",\"transport\",\"gr\",\"vechicle\",\"mobile\",\"billed_freight\",\"actual_freight\",\"item_1\",\"qty1\",\"unit1\",\"price1\",\"discount1\",\"basic_amt1\",\"p1\",\"p2\",\"remark\"]'),
(25, 'e', 'sales.html', '2018-11-06', '[\"sidemenu\",\"date\",\"company\",\"invoice\",\"consignee\",\"transport\",\"gr\",\"vechicle\",\"station\",\"mobile\",\"actual_freight\",\"charged_freight\",\"billed_freight\",\"xconsignee\",\"PO_Number\",\"remark\",\"item_1\",\"count1\",\"packing1\",\"print1\",\"bag_type1\",\"supplier1\",\"qty1\",\"unit1\",\"price1\",\"discount1\",\"basic_amt1\",\"btns1\",\"sale_sundry_1 \",\"Valuation_SetUP1\",\"Valuation_SetUP2\",\"btns1\",\"item_2\",\"count2\",\"packing2\",\"print2\",\"bag_type2\",\"s_item_2\",\"supplier2\",\"qty2\",\"unit2\",\"price2\",\"discount2\",\"basic_amt2\",\"btns2\",\"sale_sundry_2\",\"Valuation_SetUP1_2\",\"btns2\"]'),
(26, 'e', 'sales.html', '2018-11-06', '[\"date\",\"company\",\"invoice\",\"consignee\",\"transport\",\"gr\",\"vechicle\",\"station\",\"mobile\",\"actual_freight\",\"charged_freight\",\"billed_freight\",\"xconsignee\",\"PO_Number\",\"remark\",\"item_1\",\"count1\",\"packing1\",\"print1\",\"bag_type1\",\"supplier1\",\"qty1\",\"unit1\",\"price1\",\"discount1\",\"basic_amt1\",\"btns1\",\"sale_sundry_1 \",\"Valuation_SetUP1\",\"Valuation_SetUP2\",\"btns1\",\"item_2\",\"count2\",\"packing2\",\"print2\",\"bag_type2\",\"s_item_2\",\"supplier2\",\"qty2\",\"unit2\",\"price2\",\"discount2\",\"basic_amt2\",\"btns2\",\"sale_sundry_2\",\"Valuation_SetUP1_2\",\"btns2\"]'),
(27, 'e', 'sales.html', '2018-11-06', '[\"sidemenu\",\"date\",\"company\",\"transport\",\"gr\",\"vechicle\",\"station\"]'),
(28, 'e', 'sales.html', '2018-11-06', '[\"sidemenu\",\"date\",\"company\",\"invoice\",\"consignee\",\"transport\",\"gr\",\"vechicle\",\"station\",\"mobile\",\"actual_freight\",\"charged_freight\",\"billed_freight\",\"xconsignee\",\"PO_Number\",\"remark\",\"item_1\",\"count1\",\"packing1\",\"print1\",\"bag_type1\",\"supplier1\",\"qty1\",\"unit1\",\"price1\",\"discount1\",\"basic_amt1\",\"btns1\",\"sale_sundry_1 \",\"Valuation_SetUP1\",\"Valuation_SetUP2\",\"btns1\",\"item_2\",\"count2\",\"packing2\",\"print2\",\"bag_type2\",\"s_item_2\",\"supplier2\",\"qty2\",\"unit2\",\"price2\",\"discount2\",\"basic_amt2\",\"btns2\",\"sale_sundry_2\",\"Valuation_SetUP1_2\",\"btns2\"]'),
(29, 'e', 'sales.html', '2018-11-06', '[\"sidemenu\",\"company\",\"invoice\",\"consignee\",\"transport\",\"gr\",\"vechicle\",\"station\",\"mobile\",\"actual_freight\",\"charged_freight\",\"billed_freight\",\"xconsignee\",\"PO_Number\",\"remark\",\"item_1\",\"count1\",\"packing1\",\"print1\",\"bag_type1\",\"supplier1\",\"qty1\",\"unit1\",\"price1\",\"discount1\",\"basic_amt1\",\"btns1\",\"sale_sundry_1 \",\"Valuation_SetUP1\",\"Valuation_SetUP2\",\"btns1\",\"item_2\",\"count2\",\"packing2\",\"print2\",\"bag_type2\",\"s_item_2\",\"supplier2\",\"qty2\",\"unit2\",\"price2\",\"discount2\",\"basic_amt2\",\"btns2\",\"sale_sundry_2\",\"Valuation_SetUP1_2\",\"btns2\"]'),
(30, 'e', 'select_purchase.html', '2018-11-06', '[\"company\",\"date\",\"consignee\",\"xconsignee\",\"invoice\",\"invoice\",\"transport\",\"gr\",\"vechicle\",\"mobile\",\"billed_freight\",\"actual_freight\",\"item_1\",\"qty1\",\"unit1\",\"price1\",\"discount1\",\"basic_amt1\",\"Color\",\"Mesh\",\"Size\",\"remark\"]'),
(31, 'e', 'sales.html', '2018-11-06', '[\"sidemenu\",\"date\",\"company\",\"invoice\",\"consignee\",\"transport\",\"gr\",\"vechicle\",\"station\",\"mobile\",\"actual_freight\",\"charged_freight\",\"billed_freight\",\"xconsignee\",\"PO_Number\",\"remark\",\"item_1\",\"count1\",\"packing1\",\"print1\",\"bag_type1\",\"supplier1\",\"qty1\",\"unit1\",\"price1\",\"discount1\",\"basic_amt1\",\"btns1\",\"sale_sundry_1 \",\"Valuation_SetUP1\",\"Valuation_SetUP2\",\"btns1\",\"item_2\",\"count2\",\"packing2\",\"print2\",\"bag_type2\",\"s_item_2\",\"supplier2\",\"qty2\",\"unit2\",\"price2\",\"discount2\",\"basic_amt2\",\"btns2\",\"sale_sundry_2\",\"Valuation_SetUP1_2\",\"btns2\"]');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id` int(11) NOT NULL,
  `delete_flag` int(11) NOT NULL,
  `FULLNAME` varchar(30) NOT NULL,
  `verified` varchar(255) NOT NULL,
  `EMAIL` varchar(30) NOT NULL,
  `USERNAME` varchar(30) NOT NULL,
  `PASSWORD` varchar(30) NOT NULL,
  `loggedin` tinyint(1) NOT NULL,
  `role` varchar(255) NOT NULL,
  `priority` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id`, `delete_flag`, `FULLNAME`, `verified`, `EMAIL`, `USERNAME`, `PASSWORD`, `loggedin`, `role`, `priority`) VALUES
(1, 0, 'a', 'N', 'a@gmail.com', 'a', 'a', 1, 'Operator', 1),
(2, 0, 'b', 'Y', 'b@gmail.com', 'b', 'b', 1, 'Supervisor', 2),
(3, 0, 'c', 'Y', 'c@gmail.com', 'c', 'c', 1, 'Admin', 3),
(4, 0, 'd', 'Y', 'd@gmail.com', 'd', 'd', 1, 'Super_Admin', 4),
(5, 0, 'e', 'Y', 'e@gmail.com', 'e', 'e', 1, 'Head', 5);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_detail`
--

CREATE TABLE `purchase_detail` (
  `vno` varchar(255) NOT NULL,
  `sv_type` varchar(255) NOT NULL,
  `t_type` int(11) NOT NULL,
  `basic_amt` float NOT NULL,
  `cgst` float NOT NULL,
  `sgst` float NOT NULL,
  `igst` float NOT NULL,
  `vat` float NOT NULL,
  `cst` float NOT NULL,
  `cess` float NOT NULL,
  `login_user` varchar(255) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_qty` int(11) NOT NULL,
  `item_unit` varchar(255) NOT NULL,
  `item_sprice` int(11) NOT NULL,
  `item_amount` int(11) NOT NULL,
  `total_bags` int(11) NOT NULL,
  `packing` varchar(255) NOT NULL,
  `bag_details` varchar(255) NOT NULL,
  `print_marka` varchar(255) NOT NULL,
  `item_pprice` varchar(255) NOT NULL,
  `loading_from` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_footer`
--

CREATE TABLE `purchase_footer` (
  `vno` varchar(255) NOT NULL,
  `sv_type` varchar(255) NOT NULL,
  `login_user` varchar(255) NOT NULL,
  `s_subtotal` int(11) NOT NULL,
  `bill_sundry_name` varchar(255) NOT NULL,
  `sundry_rate` int(11) NOT NULL,
  `bill_sundry_value` int(11) NOT NULL,
  `blank1` int(11) NOT NULL,
  `blank2` int(11) NOT NULL,
  `s_grand_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_header`
--

CREATE TABLE `purchase_header` (
  `vno` varchar(255) NOT NULL,
  `c_form` tinyint(1) NOT NULL,
  `assign_to` varchar(255) NOT NULL,
  `forwarded_by` varchar(255) NOT NULL,
  `follow_up_date` date NOT NULL,
  `sv_type` varchar(255) NOT NULL,
  `login_user` varchar(255) NOT NULL,
  `t_date` date NOT NULL,
  `s_company` varchar(255) NOT NULL,
  `s_invoice` varchar(255) NOT NULL,
  `s_consignee` varchar(255) NOT NULL,
  `s_transport` varchar(255) NOT NULL,
  `s_gr` varchar(255) NOT NULL,
  `s_vehicle_no` varchar(255) NOT NULL,
  `s_station` varchar(255) NOT NULL,
  `s_driver` varchar(255) NOT NULL,
  `s_actual_frt` decimal(11,2) NOT NULL,
  `s_charged_frt` decimal(11,2) NOT NULL,
  `s_billed_frt` decimal(11,2) NOT NULL,
  `s_remark` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_table`
--

CREATE TABLE `purchase_table` (
  `id` int(11) NOT NULL,
  `delete_flag` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `BU` varchar(255) NOT NULL,
  `vno` varchar(255) NOT NULL,
  `invoiceNo` varchar(255) NOT NULL,
  `eff_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user` varchar(255) NOT NULL,
  `hdr1` varchar(999) NOT NULL,
  `hdr2` varchar(999) NOT NULL,
  `dtl1` varchar(999) NOT NULL,
  `dtl2` varchar(999) NOT NULL,
  `sundry1` varchar(999) NOT NULL,
  `sundry2` varchar(999) NOT NULL,
  `modal1` varchar(999) NOT NULL,
  `modal2` varchar(999) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_table`
--

INSERT INTO `purchase_table` (`id`, `delete_flag`, `status`, `BU`, `vno`, `invoiceNo`, `eff_date`, `user`, `hdr1`, `hdr2`, `dtl1`, `dtl2`, `sundry1`, `sundry2`, `modal1`, `modal2`) VALUES
(31, 0, 0, 'AP', 'AP/2018-19/PURC/0001', '', '2018-10-14 14:16:21', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"My New Company\",\"\",\"\",\"AP/2018-19/PURC/0001\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\"]', '[[\"Color :\",\"C1\",\"Mesh :\",\"M1\",\"Size :\",\"S1\"]]', '[[]]'),
(32, 0, 0, 'AP', 'AP/2018-19/PURC/0002', '', '2018-10-14 14:17:20', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"My New Company\",\"\",\"\",\"AP/2018-19/PURC/0002\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\"]', '[[\"Color :\",\"C1\",\"Mesh :\",\"M1\",\"Size :\",\"S1\"]]', '[[]]'),
(33, 0, 0, 'AP', 'AP/2018-19/PURC/0003', '', '2018-10-14 14:18:26', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"My New Company\",\"\",\"\",\"AP/2018-19/PURC/0003\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\"]', '[[\"Color :\",\"C1\",\"Mesh :\",\"M1\",\"Size :\",\"S1\"]]', '[[]]'),
(34, 0, 0, 'AP', 'AP/2018-19/PURC/0004', '', '2018-10-14 14:18:56', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"My New Company\",\"\",\"\",\"AP/2018-19/PURC/0004\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\"]', '[[\"Color :\",\"C1\",\"Mesh :\",\"M1\",\"Size :\",\"S1\"]]', '[[]]'),
(35, 0, 0, 'AP', 'AP/2018-19/PURC/0005', '', '2018-10-14 14:20:58', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"My New Company\",\"\",\"\",\"AP/2018-19/PURC/0005\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\"]', '[[\"Color :\",\"C1\",\"Mesh :\",\"M1\",\"Size :\",\"S1\"]]', '[[]]'),
(36, 0, 0, 'AP', 'AP/2018-19/PURC/0006', '', '2018-10-14 14:24:31', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"My New Company\",\"\",\"\",\"AP/2018-19/PURC/0006\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\"]', '[[\"Color :\",\"C1\",\"Mesh :\",\"M1\",\"Size :\",\"S1\"]]', '[[]]'),
(37, 0, 0, 'AP', 'AP/2018-19/PURC/0007', '', '2018-10-14 14:29:06', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"My New Company\",\"\",\"\",\"AP/2018-19/PURC/0007\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\"]', '[[\"Color :\",\"C1\",\"Mesh :\",\"M1\",\"Size :\",\"S1\"]]', '[[]]'),
(38, 0, 0, 'AP', 'AP/2018-19/PURC/0008', '', '2018-10-14 14:29:34', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"My New Company\",\"\",\"\",\"AP/2018-19/PURC/0008\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\"]', '[[\"Color :\",\"C1\",\"Mesh :\",\"M1\",\"Size :\",\"S1\"]]', '[[]]'),
(39, 0, 0, 'AP', 'AP/2018-19/PURC/0009', '', '2018-10-14 14:29:45', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"My New Company\",\"\",\"\",\"AP/2018-19/PURC/0009\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\"]', '[[\"Color :\",\"C1\",\"Mesh :\",\"M1\",\"Size :\",\"S1\"]]', '[[]]'),
(40, 0, 0, 'AP', 'AP/2018-19/PURC/0010', '', '2018-10-14 14:32:38', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"My New Company\",\"\",\"\",\"AP/2018-19/PURC/0010\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\"]', '[[\"Color :\",\"C1\",\"Mesh :\",\"M1\",\"Size :\",\"S1\"]]', '[[]]'),
(41, 0, 0, 'AP', 'AP/2018-19/PURC/0011', '', '2018-10-14 14:34:13', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"My New Company\",\"\",\"\",\"AP/2018-19/PURC/0011\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\"]', '[[\"Color :\",\"C1\",\"Mesh :\",\"M1\",\"Size :\",\"S1\"]]', '[[]]'),
(42, 0, 0, 'AP', 'AP/2018-19/PURC/0011', '', '2018-10-18 04:18:19', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"My New Company\",\"\",\"\",\"AP/2018-19/PURC/0011\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\"]', '[[\"Color :\",\"\",\"Mesh :\",\"\",\"Size :\",\"\"]]', '[[]]'),
(43, 0, 0, 'AP', 'AP/2018-19/PURC/0011', '', '2018-10-18 04:19:11', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"My New Company\",\"\",\"\",\"AP/2018-19/PURC/0011\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\"]', '[[\"Color :\",\"\",\"Mesh :\",\"\",\"Size :\",\"\"]]', '[[]]'),
(44, 0, 0, 'AP', 'AP/2018-19/PURC/0011', '', '2018-10-18 04:23:45', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"My New Company\",\"\",\"\",\"AP/2018-19/PURC/0011\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\"]', '[[\"Color :\",\"\",\"Mesh :\",\"\",\"Size :\",\"\"]]', '[[]]'),
(45, 0, 0, 'AP', 'AP/2018-19/PURC/0011', '', '2018-10-18 04:25:32', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"My New Company\",\"\",\"\",\"AP/2018-19/PURC/0011\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\"]', '[[\"Color :\",\"\",\"Mesh :\",\"\",\"Size :\",\"\"]]', '[[]]'),
(46, 0, 0, 'AP', 'AP/2018-19/PURC/0011', '', '2018-10-18 04:26:21', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"My New Company\",\"\",\"\",\"AP/2018-19/PURC/0011\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\"]', '[[\"Color :\",\"\",\"Mesh :\",\"\",\"Size :\",\"\"]]', '[[]]'),
(47, 0, 0, 'AP', 'AP/2018-19/PURC/0011', '', '2018-10-23 14:08:57', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"My New Company\",\"\",\"\",\"AP/2018-19/PURC/0011\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item2\",\"100\",\"ml\",\"100\",\"10\",\"9000\",\"AP-item1\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\"]', '[[\"Gravity :\",\"grvty\"],[\"Color :\",\"clr\",\"Mesh :\",\"msh\",\"Size :\",\"sz\"]]', '[[]]'),
(48, 0, 0, 'AP', 'AP/2018-19/PURC/0011', '', '2018-10-23 14:10:28', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"My New Company\",\"\",\"\",\"AP/2018-19/PURC/0011\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item2\",\"100\",\"ml\",\"100\",\"10\",\"9000\",\"AP-item1\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\"]', '[[\"Gravity :\",\"grvty\"],[\"Color :\",\"clr\",\"Mesh :\",\"msh\",\"Size :\",\"sz\"]]', '[[]]'),
(49, 0, 0, 'AP', 'AP/2018-19/PURC/0011', '', '2018-10-23 17:08:43', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"My New Company\",\"\",\"\",\"AP/2018-19/PURC/0011\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item2\",\"100\",\"ml\",\"100\",\"10\",\"9000\",\"AP-item1\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\"]', '[[\"Gravity :\",\"gvrty\"],[\"Color :\",\"c\",\"Mesh :\",\"m\",\"Size :\",\"s\"],[]]', '[[],[]]'),
(50, 0, 0, 'AP', 'AP/2018-19/PURC/0011', '', '2018-10-24 02:34:58', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"My New Company\",\"\",\"\",\"AP/2018-19/PURC/0011\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item2\",\"100\",\"ml\",\"100\",\"10\",\"9000\",\"AP-item1\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\"]', '[[\"Gravity :\",\"we\"],[\"Color :\",\"e\",\"Mesh :\",\"e\",\"Size :\",\"e\"],[]]', '[[],[]]'),
(51, 0, 0, 'AP', 'AP/2018-19/PURC/0011', '', '2018-10-24 02:38:22', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"My New Company\",\"\",\"\",\"AP/2018-19/PURC/0011\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item2\",\"100\",\"ml\",\"100\",\"10\",\"9000\",\"AP-item1\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\"]', '[[\"Gravity :\",\"INPUT\"],[\"Color :\",\"INPUT\",\"Mesh :\",\"INPUT\",\"Size :\",\"INPUT\"],[]]', '[[],[]]'),
(52, 0, 0, 'AP', 'AP/2018-19/PURC/0011', '', '2018-10-24 02:42:01', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"My New Company\",\"\",\"\",\"AP/2018-19/PURC/0011\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item2\",\"100\",\"ml\",\"100\",\"10\",\"9000\",\"AP-item1\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\"]', '[[\"Gravity :\",\"wert\",\"INPUT\"],[\"Color :\",\"1\",\"INPUT\",\"Mesh :\",\"1\",\"INPUT\",\"Size :\",\"1\",\"INPUT\"],[]]', '[[],[]]'),
(53, 0, 0, 'AP', 'AP/2018-19/PURC/0011', '', '2018-10-24 03:20:14', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"My New Company\",\"\",\"\",\"AP/2018-19/PURC/0011\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item2\",\"100\",\"ml\",\"100\",\"10\",\"9000\",\"AP-item1\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\"]', '[[\"Gravity : :\",\"ui\",\"INPUT\"],[\"Color : :\",\"1\",\"INPUT\",\"Mesh : :\",\"1\",\"INPUT\",\"Size : :\",\"1\",\"INPUT\"],[]]', '[[],[]]'),
(54, 0, 0, 'AP', 'AP/2018-19/PURC/0011', '', '2018-10-24 03:33:15', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"My New Company\",\"\",\"\",\"AP/2018-19/PURC/0011\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item2\",\"100\",\"ml\",\"100\",\"10\",\"9000\",\"AP-item1\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\"]', '[[],[],[]]', '[[],[]]'),
(55, 0, 0, 'AP', 'AP/2018-19/PURC/0011', '', '2018-10-24 03:33:34', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"My New Company\",\"\",\"\",\"AP/2018-19/PURC/0011\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item2\",\"100\",\"ml\",\"100\",\"10\",\"9000\",\"AP-item1\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\"]', '[[],[],[]]', '[[],[]]');

-- --------------------------------------------------------

--
-- Table structure for table `sale_detail`
--

CREATE TABLE `sale_detail` (
  `vno` varchar(255) NOT NULL,
  `sv_type` varchar(255) NOT NULL,
  `t_type` int(11) NOT NULL,
  `basic_amt` float NOT NULL,
  `login_user` varchar(255) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `loading_from` varchar(255) NOT NULL,
  `item_qty` int(11) NOT NULL,
  `item_unit` varchar(255) NOT NULL,
  `item_sprice` int(11) NOT NULL,
  `item_pprice` int(11) NOT NULL,
  `item_amount` int(11) NOT NULL,
  `total_bags` int(11) NOT NULL,
  `packing` varchar(255) NOT NULL,
  `bag_details` varchar(255) NOT NULL,
  `print_marka` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sale_detail`
--

INSERT INTO `sale_detail` (`vno`, `sv_type`, `t_type`, `basic_amt`, `login_user`, `item_name`, `loading_from`, `item_qty`, `item_unit`, `item_sprice`, `item_pprice`, `item_amount`, `total_bags`, `packing`, `bag_details`, `print_marka`) VALUES
('-SALE-326', 'Item Sale', 2, 0, 'b', 'AP-item1', '', 0, '', 0, 0, 0, 0, '', '', ''),
('-SALE-326', 'Item Sale', 1, 100, 'b', 'AP-item2', 'AP-Busy Infotech Pvt. Ltd.', 10, 'ml', 10, 20, 110, 0, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `sale_footer`
--

CREATE TABLE `sale_footer` (
  `vno` varchar(255) NOT NULL,
  `sv_type` varchar(255) NOT NULL,
  `login_user` varchar(255) NOT NULL,
  `s_subtotal` int(11) NOT NULL,
  `bill_sundry_name` varchar(255) NOT NULL,
  `sundry_rate` int(11) NOT NULL,
  `bill_sundry_value` int(11) NOT NULL,
  `blank1` int(11) NOT NULL,
  `blank2` int(11) NOT NULL,
  `s_grand_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sale_footer`
--

INSERT INTO `sale_footer` (`vno`, `sv_type`, `login_user`, `s_subtotal`, `bill_sundry_name`, `sundry_rate`, `bill_sundry_value`, `blank1`, `blank2`, `s_grand_total`) VALUES
('-SALE-326', 'Item Sale', 'b', 100, 'AP-Purchase', 10, 11, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sale_header`
--

CREATE TABLE `sale_header` (
  `vno` varchar(255) NOT NULL,
  `c_form` tinyint(1) NOT NULL,
  `assign_to` varchar(255) NOT NULL,
  `forwarded_by` varchar(255) NOT NULL,
  `follow_up_date` date NOT NULL,
  `sv_type` varchar(255) NOT NULL,
  `login_user` varchar(255) NOT NULL,
  `t_date` date NOT NULL,
  `s_company` varchar(255) NOT NULL,
  `s_invoice` varchar(255) NOT NULL,
  `s_consignee` varchar(255) NOT NULL,
  `s_transport` varchar(255) NOT NULL,
  `s_gr` varchar(255) NOT NULL,
  `s_vehicle_no` varchar(255) NOT NULL,
  `s_station` varchar(255) NOT NULL,
  `s_driver` varchar(255) NOT NULL,
  `s_actual_frt` decimal(11,2) NOT NULL,
  `s_charged_frt` decimal(11,2) NOT NULL,
  `s_billed_frt` decimal(11,2) NOT NULL,
  `s_remark` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sale_header`
--

INSERT INTO `sale_header` (`vno`, `c_form`, `assign_to`, `forwarded_by`, `follow_up_date`, `sv_type`, `login_user`, `t_date`, `s_company`, `s_invoice`, `s_consignee`, `s_transport`, `s_gr`, `s_vehicle_no`, `s_station`, `s_driver`, `s_actual_frt`, `s_charged_frt`, `s_billed_frt`, `s_remark`) VALUES
('-SALE-326', 1, 'c', 'b', '2017-10-11', 'Item Sale', 'b', '2017-06-06', 'Aditya Polymer-AP', 'SALE-326', 'AP-Profit & Loss', '', '', '', '', '', '0.00', '0.00', '0.00', '');

-- --------------------------------------------------------

--
-- Table structure for table `sale_table`
--

CREATE TABLE `sale_table` (
  `id` int(11) NOT NULL,
  `delete_flag` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `BU` varchar(255) NOT NULL,
  `vno` varchar(255) NOT NULL,
  `eff_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user` varchar(255) NOT NULL,
  `hdr1` varchar(999) NOT NULL,
  `hdr2` varchar(999) NOT NULL,
  `dtl1` varchar(999) NOT NULL,
  `dtl2` varchar(999) NOT NULL,
  `sundry1` varchar(999) NOT NULL,
  `sundry2` varchar(999) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sale_table`
--

INSERT INTO `sale_table` (`id`, `delete_flag`, `status`, `BU`, `vno`, `eff_date`, `user`, `hdr1`, `hdr2`, `dtl1`, `dtl2`, `sundry1`, `sundry2`) VALUES
(4, 0, 0, 'AP', 'AP/2018-19/SALE/0001', '2018-10-14 04:20:12', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"AP/2018-19/SALE/0001\",\"New Minerals\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"\",\"\",\"\",\"\",\"Old Minerals\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"select item\",\"\",\"\",\"\",\"\",\"Select supplier\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\",\"off\"]'),
(5, 0, 0, 'AP', 'AP/2018-19/SALE/0002', '2018-10-14 04:23:07', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"AP/2018-19/SALE/0002\",\"New Minerals\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"\",\"\",\"\",\"\",\"Old Minerals\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"select item\",\"\",\"\",\"\",\"\",\"Select supplier\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\",\"off\"]'),
(6, 0, 0, 'AP', 'AP/2018-19/SALE/0003', '2018-10-14 06:04:50', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"AP/2018-19/SALE/0003\",\"New Minerals\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"\",\"\",\"\",\"\",\"Old Minerals\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"select item\",\"\",\"\",\"\",\"\",\"Select supplier\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\",\"off\"]'),
(7, 0, 0, 'AP', 'AP/2018-19/SALE/0004', '2018-10-14 06:05:17', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"AP/2018-19/SALE/0004\",\"New Minerals\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"\",\"\",\"\",\"\",\"Old Minerals\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"select item\",\"\",\"\",\"\",\"\",\"Select supplier\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\",\"off\"]'),
(8, 0, 0, 'AP', 'AP/2018-19/SALE/0002', '2018-10-14 06:08:18', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"AP/2018-19/SALE/0002\",\"New Minerals\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"\",\"\",\"\",\"\",\"Old Minerals\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"select item\",\"\",\"\",\"\",\"\",\"Select supplier\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\",\"off\"]'),
(9, 0, 0, 'AP', 'AP/2018-19/SALE/0002', '2018-10-14 06:08:51', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"AP/2018-19/SALE/0002\",\"New Minerals\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"\",\"\",\"\",\"\",\"Old Minerals\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"select item\",\"\",\"\",\"\",\"\",\"Select supplier\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\",\"off\"]'),
(10, 0, 0, 'AP', 'AP/2018-19/SALE/0002', '2018-10-14 06:11:08', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"AP/2018-19/SALE/0002\",\"New Minerals\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"\",\"\",\"\",\"\",\"Old Minerals\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"select item\",\"\",\"\",\"\",\"\",\"Select supplier\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\",\"off\"]'),
(11, 0, 0, 'AP', 'AP/2018-19/SALE/0002', '2018-10-14 06:11:36', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"AP/2018-19/SALE/0002\",\"New Minerals\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"\",\"\",\"\",\"\",\"Old Minerals\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"select item\",\"\",\"\",\"\",\"\",\"Select supplier\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\",\"off\"]'),
(12, 0, 0, 'AP', 'AP/2018-19/SALE/0002', '2018-10-14 06:12:08', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"AP/2018-19/SALE/0002\",\"New Minerals\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"\",\"\",\"\",\"\",\"Old Minerals\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"select item\",\"\",\"\",\"\",\"\",\"Select supplier\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\",\"off\"]'),
(13, 0, 0, 'AP', 'AP/2018-19/SALE/0002', '2018-10-14 06:13:35', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"AP/2018-19/SALE/0002\",\"New Minerals\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"\",\"\",\"\",\"\",\"Old Minerals\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"select item\",\"\",\"\",\"\",\"\",\"Select supplier\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\",\"off\"]'),
(14, 0, 0, 'AP', 'AP/2018-19/SALE/0005', '2018-10-14 06:18:27', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"AP/2018-19/SALE/0005\",\"New Minerals\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"\",\"\",\"\",\"\",\"Old Minerals\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"select item\",\"\",\"\",\"\",\"\",\"Select supplier\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\",\"off\"]'),
(15, 0, 0, 'AP', 'AP/2018-19/SALE/0002', '2018-10-14 06:19:23', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"AP/2018-19/SALE/0002\",\"New Minerals\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"\",\"\",\"\",\"\",\"Old Minerals\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"select item\",\"\",\"\",\"\",\"\",\"Select supplier\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\",\"off\"]'),
(16, 0, 0, 'AP', 'AP/2018-19/SALE/0002', '2018-10-14 06:20:44', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"AP/2018-19/SALE/0002\",\"New Minerals\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"\",\"\",\"\",\"\",\"Old Minerals\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"select item\",\"\",\"\",\"\",\"\",\"Select supplier\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\",\"off\"]'),
(17, 0, 0, 'AP', 'AP/2018-19/SALE/0002', '2018-10-14 06:26:28', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"AP/2018-19/SALE/0002\",\"New Minerals\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"\",\"\",\"\",\"\",\"Old Minerals\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"select item\",\"\",\"\",\"\",\"\",\"Select supplier\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\",\"off\"]'),
(18, 0, 0, 'AP', 'AP/2018-19/SALE/0002', '2018-10-14 06:27:04', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"AP/2018-19/SALE/0002\",\"New Minerals\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"\",\"\",\"\",\"\",\"Old Minerals\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"select item\",\"\",\"\",\"\",\"\",\"Select supplier\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\",\"off\"]'),
(19, 0, 0, 'AP', 'AP/2018-19/SALE/0002', '2018-10-14 06:27:30', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"AP/2018-19/SALE/0002\",\"New Minerals\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"\",\"\",\"\",\"\",\"Old Minerals\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"select item\",\"\",\"\",\"\",\"\",\"Select supplier\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\",\"off\"]'),
(20, 0, 0, 'AP', 'AP/2018-19/SALE/0002', '2018-10-14 06:28:08', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"AP/2018-19/SALE/0002\",\"New Minerals\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"\",\"\",\"\",\"\",\"Old Minerals\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"select item\",\"\",\"\",\"\",\"\",\"Select supplier\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\",\"off\"]'),
(21, 0, 0, 'AP', 'AP/2018-19/SALE/0002', '2018-10-14 06:30:53', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"AP/2018-19/SALE/0002\",\"New Minerals\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"\",\"\",\"\",\"\",\"Old Minerals\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"select item\",\"\",\"\",\"\",\"\",\"Select supplier\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\",\"off\"]'),
(22, 0, 0, 'AP', 'AP/2018-19/SALE/0002', '2018-10-14 06:31:03', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"AP/2018-19/SALE/0002\",\"New Minerals\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"\",\"\",\"\",\"\",\"Old Minerals\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"select item\",\"\",\"\",\"\",\"\",\"Select supplier\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\",\"off\"]'),
(23, 0, 0, 'AP', 'AP/2018-19/SALE/0002', '2018-10-14 06:31:40', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"AP/2018-19/SALE/0002\",\"New Minerals\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"\",\"\",\"\",\"\",\"Old Minerals\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"select item\",\"\",\"\",\"\",\"\",\"Select supplier\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\",\"off\"]'),
(24, 0, 0, 'AP', 'AP/2018-19/SALE/0002', '2018-10-14 06:34:07', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"AP/2018-19/SALE/0002\",\"New Minerals\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"\",\"\",\"\",\"\",\"Old Minerals\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"select item\",\"\",\"\",\"\",\"\",\"Select supplier\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\",\"off\"]'),
(25, 0, 0, 'AP', 'AP/2018-19/SALE/0002', '2018-10-14 06:36:51', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"AP/2018-19/SALE/0002\",\"New Minerals\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"\",\"\",\"\",\"\",\"Old Minerals\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"select item\",\"\",\"\",\"\",\"\",\"Select supplier\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\",\"off\"]'),
(26, 0, 0, 'AP', 'AP/2018-19/SALE/0002', '2018-10-14 06:44:24', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"AP/2018-19/SALE/0002\",\"New Minerals\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"\",\"\",\"\",\"\",\"Old Minerals\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"select item\",\"\",\"\",\"\",\"\",\"Select supplier\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\",\"off\"]'),
(27, 0, 0, 'AP', 'AP/2018-19/SALE/0002', '2018-10-14 06:44:42', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"AP/2018-19/SALE/0002\",\"New Minerals\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"\",\"\",\"\",\"\",\"Old Minerals\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"select item\",\"\",\"\",\"\",\"\",\"Select supplier\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\",\"off\"]'),
(28, 0, 0, 'AP', 'AP/2018-19/SALE/0002', '2018-10-14 06:46:26', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"AP/2018-19/SALE/0002\",\"New Minerals\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"\",\"\",\"\",\"\",\"Old Minerals\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"select item\",\"\",\"\",\"\",\"\",\"Select supplier\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\",\"off\"]'),
(29, 0, 0, 'AP', 'AP/2018-19/SALE/0002', '2018-10-14 06:50:13', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"AP/2018-19/SALE/0002\",\"New Minerals\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"\",\"\",\"\",\"\",\"Old Minerals\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"select item\",\"\",\"\",\"\",\"\",\"Select supplier\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\",\"off\"]'),
(30, 0, 0, 'AP', 'AP/2018-19/SALE/0002', '2018-10-14 08:32:34', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"AP/2018-19/SALE/0002\",\"New Minerals\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"\",\"\",\"\",\"\",\"Old Minerals\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"select item\",\"\",\"\",\"\",\"\",\"Select supplier\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\",\"off\"]'),
(31, 0, 0, 'AP', 'AP/2018-19/SALE/0002', '2018-10-18 04:12:10', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"AP/2018-19/SALE/0002\",\"New Minerals\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"\",\"\",\"\",\"\",\"Old Minerals\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"select item\",\"\",\"\",\"\",\"\",\"Select supplier\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\",\"off\"]'),
(32, 0, 0, 'AP', 'AP/2018-19/SALE/0002', '2018-10-18 04:14:16', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"AP/2018-19/SALE/0002\",\"New Minerals\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"\",\"\",\"\",\"\",\"Old Minerals\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"select item\",\"\",\"\",\"\",\"\",\"Select supplier\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\",\"off\"]'),
(33, 0, 0, 'AP', 'AP/2018-19/SALE/0002', '2018-10-18 04:14:52', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"AP/2018-19/SALE/0002\",\"New Minerals\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"\",\"\",\"\",\"\",\"Old Minerals\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"select item\",\"\",\"\",\"\",\"\",\"Select supplier\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\",\"off\"]'),
(34, 0, 0, 'AP', 'AP/2018-19/SALE/0002', '2018-10-18 04:17:43', 'e', '[\"1.1.18\",\"Aditya Polymer\",\"AP/2018-19/SALE/0002\",\"New Minerals\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', '[\"Some Minerals\"]', '[\"AP-item1\",\"\",\"\",\"\",\"\",\"Old Minerals\",\"100\",\"ml\",\"100\",\"10\",\"9000\"]', '[\"select item\",\"\",\"\",\"\",\"\",\"Select supplier\",\"\",\"Select Unit\",\"\",\"\",\"\"]', '[\"off\",\"off\",\"off\",\"\",\"\",\"\",\"\",\"0\",\"off\"]', '[\"off\",\"\",\"\",\"\",\"\",\"off\"]');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `State` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`State`) VALUES
('Rajasthan (08)'),
('Andhra Pradesh (28)'),
('Andaman and Nicobar Islands (35)'),
('Arunachal Pradesh (12)'),
('Assam (18)'),
('Bihar (10)'),
('Chandigarh (04)'),
('Chhattisgarh (22)'),
('Dadar and Nagar Haveli (26)'),
('Daman and Diu (25)'),
('Delhi (07)'),
('Goa (30)'),
('Gujarat (24)'),
('Haryana (06)'),
('Himachal Pradesh (02)'),
('Jammu and Kashmir (01)'),
('Jharkhand (20)'),
('Karnataka (29)'),
('Kerala (32)'),
('Lakshadweep (31)'),
('Madhya Pradesh (23)'),
('Maharashtra (27)'),
('Manipur (14)'),
('Meghalaya (17)'),
('Mizoram (15)'),
('Nagaland (13)'),
('Odisha (21)'),
('Pondicherry (34)'),
('Punjab (03)'),
('Rajasthan (08)'),
('Sikkim (11)'),
('Tamil Nadu (33)'),
('Telangana (36)'),
('Tripura (16)'),
('Uttar Pradesh (09)'),
('Uttarakhand (05)'),
('West Bangal (19)');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_record`
--

CREATE TABLE `transaction_record` (
  `id` int(11) NOT NULL,
  `vno` varchar(255) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `t_date` date NOT NULL,
  `credit` float NOT NULL,
  `debit` float NOT NULL,
  `details` varchar(255) NOT NULL,
  `bu` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction_record`
--

INSERT INTO `transaction_record` (`id`, `vno`, `account_name`, `t_date`, `credit`, `debit`, `details`, `bu`) VALUES
(380, 'AP/2018-19/PURC/0011', 'Purchases', '2018-10-18', 0, 9000, '', 'AP'),
(381, 'AP/2018-19/PURC/0011', 'My New Company', '2018-10-18', 9000, 0, '', 'AP'),
(382, 'AP/2018-19/PURC/0011', 'CGST@5%', '2018-10-18', 0, 450, '', 'AP'),
(383, 'AP/2018-19/PURC/0011', 'My New Company', '2018-10-18', 450, 0, '', 'AP'),
(384, 'AP/2018-19/PURC/0011', 'CGST@5%', '2018-10-18', 0, 450, '', 'X'),
(385, 'AP/2018-19/PURC/0011', 'Some Minerals', '2018-10-18', 450, 0, '', 'X'),
(386, 'AP/2018-19/PURC/0011', 'SGST@5%', '2018-10-18', 0, 450, '', 'AP'),
(387, 'AP/2018-19/PURC/0011', 'My New Company', '2018-10-18', 450, 0, '', 'AP'),
(388, 'AP/2018-19/PURC/0011', 'SGST@5%', '2018-10-18', 0, 450, '', 'X'),
(389, 'AP/2018-19/PURC/0011', 'Some Minerals', '2018-10-18', 450, 0, '', 'X'),
(390, 'AP/2018-19/PURC/0011', 'Purchases', '2018-10-23', 0, 0, '', 'AP'),
(391, 'AP/2018-19/PURC/0011', 'My New Company', '2018-10-23', 0, 0, '', 'AP'),
(392, 'AP/2018-19/PURC/0011', 'CGST@5%', '2018-10-23', 0, 0, '', 'AP'),
(393, 'AP/2018-19/PURC/0011', 'My New Company', '2018-10-23', 0, 0, '', 'AP'),
(394, 'AP/2018-19/PURC/0011', 'CGST@5%', '2018-10-23', 0, 0, '', 'X'),
(395, 'AP/2018-19/PURC/0011', 'Some Minerals', '2018-10-23', 0, 0, '', 'X'),
(396, 'AP/2018-19/PURC/0011', 'SGST@5%', '2018-10-23', 0, 0, '', 'AP'),
(397, 'AP/2018-19/PURC/0011', 'My New Company', '2018-10-23', 0, 0, '', 'AP'),
(398, 'AP/2018-19/PURC/0011', 'SGST@5%', '2018-10-23', 0, 0, '', 'X'),
(399, 'AP/2018-19/PURC/0011', 'Some Minerals', '2018-10-23', 0, 0, '', 'X'),
(400, 'AP/2018-19/PURC/0011', 'Purchases', '2018-10-23', 0, 0, '', 'AP'),
(401, 'AP/2018-19/PURC/0011', 'My New Company', '2018-10-23', 0, 0, '', 'AP'),
(402, 'AP/2018-19/PURC/0011', 'CGST@5%', '2018-10-23', 0, 0, '', 'AP'),
(403, 'AP/2018-19/PURC/0011', 'My New Company', '2018-10-23', 0, 0, '', 'AP'),
(404, 'AP/2018-19/PURC/0011', 'CGST@5%', '2018-10-23', 0, 0, '', 'X'),
(405, 'AP/2018-19/PURC/0011', 'Some Minerals', '2018-10-23', 0, 0, '', 'X'),
(406, 'AP/2018-19/PURC/0011', 'SGST@5%', '2018-10-23', 0, 0, '', 'AP'),
(407, 'AP/2018-19/PURC/0011', 'My New Company', '2018-10-23', 0, 0, '', 'AP'),
(408, 'AP/2018-19/PURC/0011', 'SGST@5%', '2018-10-23', 0, 0, '', 'X'),
(409, 'AP/2018-19/PURC/0011', 'Some Minerals', '2018-10-23', 0, 0, '', 'X'),
(410, 'AP/2018-19/PURC/0011', 'Purchases', '2018-10-23', 0, 0, '', 'AP'),
(411, 'AP/2018-19/PURC/0011', 'My New Company', '2018-10-23', 0, 0, '', 'AP'),
(412, 'AP/2018-19/PURC/0011', 'CGST@5%', '2018-10-23', 0, 0, '', 'AP'),
(413, 'AP/2018-19/PURC/0011', 'My New Company', '2018-10-23', 0, 0, '', 'AP'),
(414, 'AP/2018-19/PURC/0011', 'CGST@5%', '2018-10-23', 0, 0, '', 'X'),
(415, 'AP/2018-19/PURC/0011', 'Some Minerals', '2018-10-23', 0, 0, '', 'X'),
(416, 'AP/2018-19/PURC/0011', 'SGST@5%', '2018-10-23', 0, 0, '', 'AP'),
(417, 'AP/2018-19/PURC/0011', 'My New Company', '2018-10-23', 0, 0, '', 'AP'),
(418, 'AP/2018-19/PURC/0011', 'SGST@5%', '2018-10-23', 0, 0, '', 'X'),
(419, 'AP/2018-19/PURC/0011', 'Some Minerals', '2018-10-23', 0, 0, '', 'X'),
(420, 'AP/2018-19/PURC/0011', 'Purchases', '2018-10-24', 0, 0, '', 'AP'),
(421, 'AP/2018-19/PURC/0011', 'My New Company', '2018-10-24', 0, 0, '', 'AP'),
(422, 'AP/2018-19/PURC/0011', 'CGST@5%', '2018-10-24', 0, 0, '', 'AP'),
(423, 'AP/2018-19/PURC/0011', 'My New Company', '2018-10-24', 0, 0, '', 'AP'),
(424, 'AP/2018-19/PURC/0011', 'CGST@5%', '2018-10-24', 0, 0, '', 'X'),
(425, 'AP/2018-19/PURC/0011', 'Some Minerals', '2018-10-24', 0, 0, '', 'X'),
(426, 'AP/2018-19/PURC/0011', 'SGST@5%', '2018-10-24', 0, 0, '', 'AP'),
(427, 'AP/2018-19/PURC/0011', 'My New Company', '2018-10-24', 0, 0, '', 'AP'),
(428, 'AP/2018-19/PURC/0011', 'SGST@5%', '2018-10-24', 0, 0, '', 'X'),
(429, 'AP/2018-19/PURC/0011', 'Some Minerals', '2018-10-24', 0, 0, '', 'X'),
(430, 'AP/2018-19/PURC/0011', 'Purchases', '2018-10-24', 0, 0, '', 'AP'),
(431, 'AP/2018-19/PURC/0011', 'My New Company', '2018-10-24', 0, 0, '', 'AP'),
(432, 'AP/2018-19/PURC/0011', 'CGST@5%', '2018-10-24', 0, 0, '', 'AP'),
(433, 'AP/2018-19/PURC/0011', 'My New Company', '2018-10-24', 0, 0, '', 'AP'),
(434, 'AP/2018-19/PURC/0011', 'CGST@5%', '2018-10-24', 0, 0, '', 'X'),
(435, 'AP/2018-19/PURC/0011', 'Some Minerals', '2018-10-24', 0, 0, '', 'X'),
(436, 'AP/2018-19/PURC/0011', 'SGST@5%', '2018-10-24', 0, 0, '', 'AP'),
(437, 'AP/2018-19/PURC/0011', 'My New Company', '2018-10-24', 0, 0, '', 'AP'),
(438, 'AP/2018-19/PURC/0011', 'SGST@5%', '2018-10-24', 0, 0, '', 'X'),
(439, 'AP/2018-19/PURC/0011', 'Some Minerals', '2018-10-24', 0, 0, '', 'X'),
(440, 'AP/2018-19/PURC/0011', 'Purchases', '2018-10-24', 0, 0, '', 'AP'),
(441, 'AP/2018-19/PURC/0011', 'My New Company', '2018-10-24', 0, 0, '', 'AP'),
(442, 'AP/2018-19/PURC/0011', 'CGST@5%', '2018-10-24', 0, 0, '', 'AP'),
(443, 'AP/2018-19/PURC/0011', 'My New Company', '2018-10-24', 0, 0, '', 'AP'),
(444, 'AP/2018-19/PURC/0011', 'CGST@5%', '2018-10-24', 0, 0, '', 'X'),
(445, 'AP/2018-19/PURC/0011', 'Some Minerals', '2018-10-24', 0, 0, '', 'X'),
(446, 'AP/2018-19/PURC/0011', 'SGST@5%', '2018-10-24', 0, 0, '', 'AP'),
(447, 'AP/2018-19/PURC/0011', 'My New Company', '2018-10-24', 0, 0, '', 'AP'),
(448, 'AP/2018-19/PURC/0011', 'SGST@5%', '2018-10-24', 0, 0, '', 'X'),
(449, 'AP/2018-19/PURC/0011', 'Some Minerals', '2018-10-24', 0, 0, '', 'X'),
(450, 'AP/2018-19/PURC/0011', 'Purchases', '2018-10-24', 0, 0, '', 'AP'),
(451, 'AP/2018-19/PURC/0011', 'My New Company', '2018-10-24', 0, 0, '', 'AP'),
(452, 'AP/2018-19/PURC/0011', 'CGST@5%', '2018-10-24', 0, 0, '', 'AP'),
(453, 'AP/2018-19/PURC/0011', 'My New Company', '2018-10-24', 0, 0, '', 'AP'),
(454, 'AP/2018-19/PURC/0011', 'CGST@5%', '2018-10-24', 0, 0, '', 'X'),
(455, 'AP/2018-19/PURC/0011', 'Some Minerals', '2018-10-24', 0, 0, '', 'X'),
(456, 'AP/2018-19/PURC/0011', 'SGST@5%', '2018-10-24', 0, 0, '', 'AP'),
(457, 'AP/2018-19/PURC/0011', 'My New Company', '2018-10-24', 0, 0, '', 'AP'),
(458, 'AP/2018-19/PURC/0011', 'SGST@5%', '2018-10-24', 0, 0, '', 'X'),
(459, 'AP/2018-19/PURC/0011', 'Some Minerals', '2018-10-24', 0, 0, '', 'X'),
(460, 'AP/2018-19/PURC/0011', 'Purchases', '2018-10-24', 0, 0, '', 'AP'),
(461, 'AP/2018-19/PURC/0011', 'My New Company', '2018-10-24', 0, 0, '', 'AP'),
(462, 'AP/2018-19/PURC/0011', 'CGST@5%', '2018-10-24', 0, 0, '', 'AP'),
(463, 'AP/2018-19/PURC/0011', 'My New Company', '2018-10-24', 0, 0, '', 'AP'),
(464, 'AP/2018-19/PURC/0011', 'CGST@5%', '2018-10-24', 0, 0, '', 'X'),
(465, 'AP/2018-19/PURC/0011', 'Some Minerals', '2018-10-24', 0, 0, '', 'X'),
(466, 'AP/2018-19/PURC/0011', 'SGST@5%', '2018-10-24', 0, 0, '', 'AP'),
(467, 'AP/2018-19/PURC/0011', 'My New Company', '2018-10-24', 0, 0, '', 'AP'),
(468, 'AP/2018-19/PURC/0011', 'SGST@5%', '2018-10-24', 0, 0, '', 'X'),
(469, 'AP/2018-19/PURC/0011', 'Some Minerals', '2018-10-24', 0, 0, '', 'X'),
(470, 'AP/2018-19/PURC/0011', 'Purchases', '2018-10-24', 0, 0, '', 'AP'),
(471, 'AP/2018-19/PURC/0011', 'My New Company', '2018-10-24', 0, 0, '', 'AP'),
(472, 'AP/2018-19/PURC/0011', 'CGST@5%', '2018-10-24', 0, 0, '', 'AP'),
(473, 'AP/2018-19/PURC/0011', 'My New Company', '2018-10-24', 0, 0, '', 'AP'),
(474, 'AP/2018-19/PURC/0011', 'CGST@5%', '2018-10-24', 0, 0, '', 'X'),
(475, 'AP/2018-19/PURC/0011', 'Some Minerals', '2018-10-24', 0, 0, '', 'X'),
(476, 'AP/2018-19/PURC/0011', 'SGST@5%', '2018-10-24', 0, 0, '', 'AP'),
(477, 'AP/2018-19/PURC/0011', 'My New Company', '2018-10-24', 0, 0, '', 'AP'),
(478, 'AP/2018-19/PURC/0011', 'SGST@5%', '2018-10-24', 0, 0, '', 'X'),
(479, 'AP/2018-19/PURC/0011', 'Some Minerals', '2018-10-24', 0, 0, '', 'X');

-- --------------------------------------------------------

--
-- Table structure for table `unit_conversion_table`
--

CREATE TABLE `unit_conversion_table` (
  `pu` varchar(255) NOT NULL,
  `su` varchar(255) NOT NULL,
  `cf` float NOT NULL,
  `vertical_name` varchar(255) NOT NULL,
  `item_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unit_conversion_table`
--

INSERT INTO `unit_conversion_table` (`pu`, `su`, `cf`, `vertical_name`, `item_name`) VALUES
('m', 'km', 0.001, 'length', ''),
('m', 'ft', 3.28, 'length', ''),
('m', 'in', 39.37, 'length', ''),
('in', 'm', 0.0254, 'length', ''),
('in', 'ft', 0.0833, 'length', ''),
('ft', 'm', 0.3048, 'length', ''),
('ft', 'in', 12, 'length', ''),
('kg', 'g', 1000, 'weight', ''),
('kg', 'pound', 2.2046, 'weight', ''),
('g', 'kg', 0.001, 'weight', ''),
('g', 'pound', 0.00221, 'weight', ''),
('tonne', 'kg', 1000, 'weight', ''),
('kg', 'tonne', 0.001, 'weight', ''),
('litre', 'ml', 1000, 'volume', ''),
('ml', 'litre', 0.001, 'volume', ''),
('litre', 'klitre', 0.001, 'volume', ''),
('klitre', 'litre', 1000, 'volume', ''),
('m', 'm', 1, 'length', ''),
('in', 'in', 1, 'length', ''),
('ft', 'ft', 1, 'length', ''),
('kg', 'kg', 1, 'weight', ''),
('tonne', 'tonne', 1, 'weight', ''),
('g', 'g', 1, 'weight', ''),
('pound', 'pound', 1, 'weight', ''),
('ml', 'ml', 1, 'volume', ''),
('litre', 'litre', 1, 'volume', ''),
('klitre', 'klitre', 1, 'volume', '');

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE `voucher` (
  `id` int(11) NOT NULL,
  `bu` varchar(255) NOT NULL,
  `fy` varchar(255) NOT NULL,
  `vno` int(11) NOT NULL,
  `v_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voucher`
--

INSERT INTO `voucher` (`id`, `bu`, `fy`, `vno`, `v_type`) VALUES
(1, '', '', 0, 'SALE'),
(2, '', '', 0, 'JRNL'),
(3, '', '', 0, 'CN'),
(4, '', '', 0, 'DN'),
(5, '', '', 0, 'PYMT'),
(6, '', '', 0, 'REPT'),
(16, '', '', 0, 'PURC'),
(1217, 'AP', '2018-19', 1, 'SALE'),
(1218, 'AP', '2018-19', 2, 'SALE'),
(1219, 'AP', '2018-19', 3, 'SALE'),
(1220, 'AP', '2018-19', 4, 'SALE'),
(1221, 'AP', '2018-19', 5, 'SALE'),
(1222, 'AP', '2018-19', 1, 'PURC'),
(1223, 'AP', '2018-19', 2, 'PURC'),
(1224, 'AP', '2018-19', 3, 'PURC'),
(1225, 'AP', '2018-19', 4, 'PURC'),
(1226, 'AP', '2018-19', 5, 'PURC'),
(1227, 'AP', '2018-19', 6, 'PURC'),
(1228, 'AP', '2018-19', 7, 'PURC'),
(1229, 'AP', '2018-19', 8, 'PURC'),
(1230, 'AP', '2018-19', 9, 'PURC'),
(1231, 'AP', '2018-19', 10, 'PURC'),
(1232, 'AP', '2018-19', 11, 'PURC');

-- --------------------------------------------------------

--
-- Table structure for table `voucher_table`
--

CREATE TABLE `voucher_table` (
  `vno` varchar(255) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `eff_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `follow_up_date` date NOT NULL,
  `login_user` varchar(255) NOT NULL,
  `assign_to` varchar(255) NOT NULL,
  `forwarded_by` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `v_notice` varchar(255) NOT NULL,
  `reject_reason` varchar(255) NOT NULL,
  `v_detail` varchar(255) NOT NULL,
  `delete_flag` int(255) NOT NULL,
  `bu` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voucher_table`
--

INSERT INTO `voucher_table` (`vno`, `account_name`, `eff_date`, `follow_up_date`, `login_user`, `assign_to`, `forwarded_by`, `status`, `v_notice`, `reject_reason`, `v_detail`, `delete_flag`, `bu`) VALUES
('AP/2018-19/PURC/0001', '', '2018-10-14 14:16:21', '2018-10-14', '', '', 'e', 0, '', '', 'New SALE Voucher Created!!!', 0, 'AP'),
('AP/2018-19/PURC/0002', '', '2018-10-14 14:17:20', '2018-10-14', '', '', 'e', 0, '', '', 'New SALE Voucher Created!!!', 0, 'AP'),
('AP/2018-19/PURC/0003', '', '2018-10-14 14:18:26', '2018-10-14', '', '', 'e', 0, '', '', 'New SALE Voucher Created!!!', 0, 'AP'),
('AP/2018-19/PURC/0004', '', '2018-10-14 14:18:56', '2018-10-14', '', '', 'e', 0, '', '', 'New SALE Voucher Created!!!', 0, 'AP'),
('AP/2018-19/PURC/0005', '', '2018-10-14 14:20:58', '2018-10-14', '', '', 'e', 0, '', '', 'New SALE Voucher Created!!!', 0, 'AP'),
('AP/2018-19/PURC/0006', '', '2018-10-14 14:24:31', '2018-10-14', '', '', 'e', 0, '', '', 'New SALE Voucher Created!!!', 0, 'AP'),
('AP/2018-19/PURC/0007', '', '2018-10-14 14:29:06', '2018-10-14', '', 'e', 'e', 0, '', '', 'New SALE Voucher Created!!!', 0, 'AP'),
('AP/2018-19/PURC/0008', '', '2018-10-14 14:29:34', '2018-10-14', '', 'e', 'e', 0, '', '', 'New SALE Voucher Created!!!', 0, 'AP'),
('AP/2018-19/PURC/0009', '', '2018-10-14 14:29:45', '2018-10-14', '', 'e', 'e', 0, '', '', 'New SALE Voucher Created!!!', 0, 'AP'),
('AP/2018-19/PURC/0010', '', '2018-10-14 14:32:38', '2018-10-14', '', 'e', 'e', 0, '', '', 'New SALE Voucher Created!!!', 0, 'AP'),
('AP/2018-19/PURC/0011', '', '2018-10-24 03:33:34', '2018-10-24', '', 'e', 'e', 0, '', '', 'New SALE Voucher Created!!!', 0, 'AP'),
('AP/2018-19/SALE/0001', '', '2018-10-14 04:20:12', '2018-10-14', '', 'b', 'e', 0, '', '', 'New SALE Voucher Created!!!', 0, 'AP'),
('AP/2018-19/SALE/0002', '', '2018-10-18 04:17:44', '2018-10-18', '', 'e', 'e', 0, '', '', 'New SALE Voucher Created!!!', 0, 'AP'),
('AP/2018-19/SALE/0003', '', '2018-10-14 06:04:50', '2018-10-14', '', 'e', 'e', 0, '', '', 'New SALE Voucher Created!!!', 0, 'AP'),
('AP/2018-19/SALE/0004', '', '2018-10-14 06:05:17', '2018-10-14', '', 'e', 'e', 0, '', '', 'New SALE Voucher Created!!!', 0, 'AP'),
('AP/2018-19/SALE/0005', '', '2018-10-14 06:18:27', '2018-10-14', '', 'e', 'e', 0, '', '', 'New SALE Voucher Created!!!', 0, 'AP');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_table`
--
ALTER TABLE `accounts_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `approval_table`
--
ALTER TABLE `approval_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bu_details`
--
ALTER TABLE `bu_details`
  ADD PRIMARY KEY (`BU_Name`);

--
-- Indexes for table `fy_table`
--
ALTER TABLE `fy_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_table`
--
ALTER TABLE `group_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `index_table`
--
ALTER TABLE `index_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_group_table`
--
ALTER TABLE `item_group_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_table`
--
ALTER TABLE `item_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_transaction_record`
--
ALTER TABLE `item_transaction_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_account_details`
--
ALTER TABLE `master_account_details`
  ADD PRIMARY KEY (`AccountName`);

--
-- Indexes for table `page_permission`
--
ALTER TABLE `page_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_permission_table`
--
ALTER TABLE `page_permission_table`
  ADD PRIMARY KEY (`pagename`);

--
-- Indexes for table `page_voucher_table`
--
ALTER TABLE `page_voucher_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_table`
--
ALTER TABLE `permission_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_table`
--
ALTER TABLE `purchase_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_table`
--
ALTER TABLE `sale_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_record`
--
ALTER TABLE `transaction_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voucher_table`
--
ALTER TABLE `voucher_table`
  ADD PRIMARY KEY (`vno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_table`
--
ALTER TABLE `accounts_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `approval_table`
--
ALTER TABLE `approval_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fy_table`
--
ALTER TABLE `fy_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `group_table`
--
ALTER TABLE `group_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `index_table`
--
ALTER TABLE `index_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1084;

--
-- AUTO_INCREMENT for table `item_group_table`
--
ALTER TABLE `item_group_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `item_table`
--
ALTER TABLE `item_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `item_transaction_record`
--
ALTER TABLE `item_transaction_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `page_voucher_table`
--
ALTER TABLE `page_voucher_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permission_table`
--
ALTER TABLE `permission_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `purchase_table`
--
ALTER TABLE `purchase_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `sale_table`
--
ALTER TABLE `sale_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `transaction_record`
--
ALTER TABLE `transaction_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=480;

--
-- AUTO_INCREMENT for table `voucher`
--
ALTER TABLE `voucher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1233;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
