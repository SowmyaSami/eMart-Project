-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2020 at 01:22 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `emartdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill_details_table`
--

CREATE TABLE `bill_details_table` (
  `bill_details_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill_details_table`
--

INSERT INTO `bill_details_table` (`bill_details_id`, `bill_id`, `item_id`) VALUES
(1, 4, 401),
(2, 5, 402),
(16, 16, 403),
(17, 17, 403),
(18, 18, 402),
(19, 18, 401),
(20, 18, 404),
(21, 19, 403),
(22, 20, 401),
(23, 21, 405),
(24, 22, 404),
(25, 23, 401),
(26, 24, 402),
(27, 24, 406),
(28, 25, 401),
(29, 25, 403),
(30, 26, 406);

-- --------------------------------------------------------

--
-- Table structure for table `bill_table`
--

CREATE TABLE `bill_table` (
  `bill_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `bill_type` varchar(20) NOT NULL,
  `bill_date` date NOT NULL,
  `bill_remarks` varchar(50) NOT NULL,
  `bill_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill_table`
--

INSERT INTO `bill_table` (`bill_id`, `buyer_id`, `bill_type`, `bill_date`, `bill_remarks`, `bill_amount`) VALUES
(4, 101, 'credit', '2020-01-03', 'abcdefghijklmnopqrstuvwxyz', 2),
(5, 102, 'Debit', '2020-03-06', 'paid', 1499),
(16, 102, 'Debit', '2020-03-07', 'paid', 81900),
(17, 102, 'Debit', '2020-03-07', 'paid', 81900),
(18, 102, 'Debit', '2020-03-11', 'paid', 33299),
(19, 102, 'Debit', '2020-02-12', 'paid', 81900),
(20, 102, 'Debit', '2020-03-11', 'paid', 30000),
(21, 105, 'Debit', '2020-03-11', 'paid', 549),
(22, 106, 'Debit', '2020-03-12', 'paid', 1800),
(23, 102, 'Debit', '2020-03-12', 'paid', 30000),
(24, 102, 'Debit', '2020-03-12', 'paid', 7994),
(25, 102, 'Debit', '2020-03-12', 'paid', 111900),
(26, 102, 'Debit', '2020-03-13', 'paid', 6495);

-- --------------------------------------------------------

--
-- Table structure for table `buyer_signup_table`
--

CREATE TABLE `buyer_signup_table` (
  `buyer_id` int(11) NOT NULL,
  `buyer_username` varchar(20) NOT NULL,
  `buyer_password` varchar(20) NOT NULL,
  `buyer_email` varchar(20) NOT NULL,
  `buyer_mobile` int(10) NOT NULL,
  `buyer_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buyer_signup_table`
--

INSERT INTO `buyer_signup_table` (`buyer_id`, `buyer_username`, `buyer_password`, `buyer_email`, `buyer_mobile`, `buyer_date`) VALUES
(101, 'sam', 'sam', 'sam@ymail.com', 2147474836, '2017-10-12'),
(102, 'admin', 'Admin', 'admin@admin.com', 123456789, '2020-01-01'),
(103, 'Admin2', 'admin ', 'adm@amail.com', 123321456, '2020-03-09'),
(105, 'sri', 'sri ', 'sri@gmail.com', 132321456, '2020-03-11'),
(106, 'nikki', 'nikki', 'nikki@ymail.com', 1245879635, '2020-03-11'),
(118, 'Tanu', 'tanu', 'tanu@gmail.com', 1254789636, '2020-03-13');

-- --------------------------------------------------------

--
-- Table structure for table `category_table`
--

CREATE TABLE `category_table` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(30) NOT NULL,
  `category_brief` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_table`
--

INSERT INTO `category_table` (`category_id`, `category_name`, `category_brief`) VALUES
(501, 'Electronics', 'varities of Electronics like Tv and Washing Machine'),
(502, 'Fashion', 'varities of PartyWear ,dailywear etc'),
(503, 'Accessories', 'watches,glasses etc');

-- --------------------------------------------------------

--
-- Table structure for table `item_table`
--

CREATE TABLE `item_table` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(20) NOT NULL,
  `item_image` varchar(200) NOT NULL,
  `item_price` int(11) NOT NULL,
  `item_stock` int(11) NOT NULL,
  `item_description` varchar(200) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `item_remarks` varchar(100) NOT NULL,
  `seller_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item_table`
--

INSERT INTO `item_table` (`item_id`, `item_name`, `item_image`, `item_price`, `item_stock`, `item_description`, `subcategory_id`, `item_remarks`, `seller_id`) VALUES
(401, 'IFB', 'https://ksassets.timeincuk.net/wp/uploads/sites/54/2014/11/WW9000-Hero-1280-1.jpg', 30000, 2, 'Front Load', 601, 'good', 1),
(402, 'Kurthi', 'https://images-na.ssl-images-amazon.com/images/I/71GgvIjmjLL._UL1500_.jpg', 1499, 2, ' A-line Kurti\r\n', 604, 'Care:Hand wash, Home wash, Machine wash', 2),
(403, 'Iphone XR', 'https://images-na.ssl-images-amazon.com/images/I/51qBzX0pGYL._SL1000_.jpg', 81900, 8, ' XR (128GB) - Black', 603, 'IP67 water and dust resistant (maximum depth of 1 meter up to 30 minutes)', 1),
(404, 'Frock', 'https://images-na.ssl-images-amazon.com/images/I/81V9XyI%2B0dL._UL1500_.jpg', 1800, 6, ' Denim Frock Dress ', 605, '(Design 7, 4-5 Years)', 2),
(405, 'Estelle', 'https://images-na.ssl-images-amazon.com/images/I/41j0muqPagL._UL1024_.jpg', 549, 7, 'Ear tops', 608, 'Silver finish', 2),
(406, 'Titan', 'https://images-na.ssl-images-amazon.com/images/I/71cTmi-fSRL._UL1500_.jpg', 6495, 1, ' Raga collection', 606, 'Rose gold', 1);

-- --------------------------------------------------------

--
-- Table structure for table `seller_signup_table`
--

CREATE TABLE `seller_signup_table` (
  `seller_id` int(11) NOT NULL,
  `seller_username` varchar(20) NOT NULL,
  `seller_password` varchar(20) NOT NULL,
  `seller_company` varchar(20) NOT NULL,
  `seller_brief` varchar(100) NOT NULL,
  `seller_gst` int(11) NOT NULL,
  `seller_address` varchar(100) NOT NULL,
  `seller_email` varchar(20) NOT NULL,
  `seller_contact` int(10) NOT NULL,
  `seller_website` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seller_signup_table`
--

INSERT INTO `seller_signup_table` (`seller_id`, `seller_username`, `seller_password`, `seller_company`, `seller_brief`, `seller_gst`, `seller_address`, `seller_email`, `seller_contact`, `seller_website`) VALUES
(1, 'sowmya', 'sowmya', 'abc', 'abc pvt lmt', 5, 'Hyderabad', 'sowsam@gmail.', 2147483647, 'abc.com'),
(2, 'seller1', '123', 'Aji', 'Fashion world', 5, 'Chennai', 'Aji@amail.com', 123654789, 'Aji.com');

-- --------------------------------------------------------

--
-- Table structure for table `sub_category_table`
--

CREATE TABLE `sub_category_table` (
  `subcategory_id` int(11) NOT NULL,
  `subcategory_name` varchar(20) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_brief` varchar(100) NOT NULL,
  `subcategory_gst` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_category_table`
--

INSERT INTO `sub_category_table` (`subcategory_id`, `subcategory_name`, `category_id`, `subcategory_brief`, `subcategory_gst`) VALUES
(601, 'Washing Machine', 501, 'Top Load,Front Load,etc', 10),
(602, 'TV', 501, 'LED,LCD,etc', 18),
(603, 'Mobiles', 501, 'Various Brands', 18),
(604, 'Tops', 502, 'Designer wear', 5),
(605, 'Frocks', 502, 'Kids wear', 5),
(606, 'Watches', 503, ' Fastrack, Titan,etc', 12),
(607, 'Clutches', 503, ' Lavie, Caprese,etc', 18),
(608, 'Jewellery', 503, 'Fashion Jewellery', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill_details_table`
--
ALTER TABLE `bill_details_table`
  ADD PRIMARY KEY (`bill_details_id`),
  ADD KEY `bill_id` (`bill_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `bill_table`
--
ALTER TABLE `bill_table`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `buyer_id` (`buyer_id`);

--
-- Indexes for table `buyer_signup_table`
--
ALTER TABLE `buyer_signup_table`
  ADD PRIMARY KEY (`buyer_id`);

--
-- Indexes for table `category_table`
--
ALTER TABLE `category_table`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `item_table`
--
ALTER TABLE `item_table`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `seller_id` (`seller_id`),
  ADD KEY `subcategory_id` (`subcategory_id`);

--
-- Indexes for table `seller_signup_table`
--
ALTER TABLE `seller_signup_table`
  ADD PRIMARY KEY (`seller_id`);

--
-- Indexes for table `sub_category_table`
--
ALTER TABLE `sub_category_table`
  ADD PRIMARY KEY (`subcategory_id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill_details_table`
--
ALTER TABLE `bill_details_table`
  MODIFY `bill_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `bill_table`
--
ALTER TABLE `bill_table`
  MODIFY `bill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `buyer_signup_table`
--
ALTER TABLE `buyer_signup_table`
  MODIFY `buyer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `category_table`
--
ALTER TABLE `category_table`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=505;

--
-- AUTO_INCREMENT for table `item_table`
--
ALTER TABLE `item_table`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=407;

--
-- AUTO_INCREMENT for table `seller_signup_table`
--
ALTER TABLE `seller_signup_table`
  MODIFY `seller_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sub_category_table`
--
ALTER TABLE `sub_category_table`
  MODIFY `subcategory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=611;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill_details_table`
--
ALTER TABLE `bill_details_table`
  ADD CONSTRAINT `bill_details_table_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bill_table` (`bill_id`),
  ADD CONSTRAINT `bill_details_table_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item_table` (`item_id`);

--
-- Constraints for table `bill_table`
--
ALTER TABLE `bill_table`
  ADD CONSTRAINT `bill_table_ibfk_1` FOREIGN KEY (`buyer_id`) REFERENCES `buyer_signup_table` (`buyer_id`);

--
-- Constraints for table `item_table`
--
ALTER TABLE `item_table`
  ADD CONSTRAINT `item_table_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `seller_signup_table` (`seller_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_table_ibfk_2` FOREIGN KEY (`subcategory_id`) REFERENCES `sub_category_table` (`subcategory_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub_category_table`
--
ALTER TABLE `sub_category_table`
  ADD CONSTRAINT `sub_category_table_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category_table` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
