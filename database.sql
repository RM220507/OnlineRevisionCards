-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql308.infinityfree.com
-- Generation Time: Jul 15, 2023 at 01:57 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `epiz_33908874_revisioncards`
--

-- --------------------------------------------------------

--
-- Table structure for table `Questions`
--

CREATE TABLE `Questions` (
  `QuestionID` int(11) NOT NULL,
  `SetID` int(11) NOT NULL,
  `Question` varchar(512) COLLATE utf32_bin NOT NULL DEFAULT 'No Question Defined!',
  `Answer` varchar(512) COLLATE utf32_bin NOT NULL DEFAULT 'No Answer Defined!'
) ENGINE=MyISAM DEFAULT CHARSET=utf32 COLLATE=utf32_bin;

--
-- Dumping data for table `Questions`
--

INSERT INTO `Questions` (`QuestionID`, `SetID`, `Question`, `Answer`) VALUES
(1, 1, 'TestA', 'AnswerA'),
(2, 1, 'TestB', 'AnswerB'),
(3, 1, 'TestC', 'AnswerC'),
(4, 1, 'TestD', 'AnswerD'),
(5, 1, 'TestE', 'AnswerE'),
(6, 2, 'Hydrogen Ions', 'H+'),
(7, 2, 'Group 1 Metals', '1+'),
(8, 2, 'Group 2 Metals', '2+'),
(9, 2, 'Group 3 Metals', '3+'),
(10, 2, 'Ammonium', 'NH4+'),
(11, 2, 'Zinc Ions', 'Zn^2+'),
(12, 2, 'Lead Ions', 'Pb^2+'),
(13, 2, 'Silver Ions', 'Ag+'),
(14, 2, 'Group 5 Non-Metals', '3-'),
(15, 2, 'Group 6 Non-Metals', '2-'),
(16, 2, 'Group 7 Non-Metals', '1-'),
(17, 2, 'Hydroxide', 'OH-'),
(18, 2, 'Carbonate', 'CO3^2-'),
(19, 2, 'Sulfate', 'SO4^2-'),
(20, 2, 'Nitrate', 'NO^3-'),
(21, 2, 'Hydrochloric Acid', 'HCl'),
(22, 2, 'Sulphuric Acid', 'N2SO4'),
(23, 2, 'Nitric Acid', 'HNO3'),
(24, 2, 'Ethanoic Acid', 'CH3COOH'),
(25, 3, 'Adding Value', 'How a business sells a product for more than it costs through the processes they apply'),
(26, 3, 'Advertising', 'Promotional method where a business pays to place an advert in the form of media'),
(27, 3, 'Aesthetics', 'The attractiveness of the design of a product'),
(28, 3, 'Aims &amp; Objectives', 'The overall goals of a business or organisation identifying what the business is trying to achieve'),
(29, 3, 'Application Form', 'A method of applying for a job where the required details are decided by the business'),
(30, 3, 'Autonomy', 'The independence a worker has within their job'),
(31, 3, 'Average Rate of Return (ARR)', 'The annual percentage profit that an investment makes compared to its cost'),
(32, 3, 'Stock Control Graph', 'A method of displaying data on stock levels, which allows stock control policy to be decided, implemented and reviewed within a business'),
(33, 3, 'Batch Production', 'Method of production where groups or types of products are made at several stages'),
(34, 3, 'Bonus', 'An extra amount of financial pay received through achieving a business target'),
(35, 3, 'Branding', 'What distinguishes a good or service from rivals'),
(36, 3, 'Break even', 'Where total revenue is the same as total costs (no profit or loss)'),
(37, 3, 'Buffer Stock', 'A quantity of stock kept in store to safeguard against unforeseen shortages or demands'),
(38, 3, 'Business', 'An organisation set up to meet customer demand and to make a profit for its owners'),
(39, 3, 'Business Environment', 'The external factors such as the economy and the law that influence how a business operates'),
(40, 3, 'Capacity', 'The maximum production output a business can achieve with its existing resources'),
(41, 3, 'Capital', 'The initial money that is needed to start a business that is normally linked to purchases of machinery and premises'),
(42, 3, 'Cash-flow', 'The money that flows into and out of a business from sales and expenses'),
(43, 3, 'Cash-flow Forecast', 'The prediction of how much money will come into and out of a business over a future time period'),
(44, 3, 'Cash Inflow', 'Receipts - money coming into the business'),
(45, 3, 'Cash Outflow', 'Payment - money leaving the business'),
(46, 3, 'Centralised', 'Where business decision making and implementation take place at and from the business headquarters'),
(47, 3, 'Chain of Command', 'Part of the structure of a business organisation which shows who is in charge of who'),
(48, 3, 'Closing Balance', 'The total cash-flow left at the end of a period'),
(49, 3, 'Communication', 'How messages are passed within or out of the business'),
(50, 3, 'Competition', 'Other businesses that produce the same or similar goods or services'),
(51, 3, 'Competitive Advantage', 'A business has a marketing mix which enables it to be more successful that its competitors'),
(52, 3, 'Competitive Environment', 'The number and strength of other businesses in the same market'),
(53, 3, 'Competitive Pricing', 'Where the price of a product is decided by comparing it to its rivals'),
(54, 3, 'Consumer', 'The person or business that use the good or service produced'),
(55, 3, 'Consumer Income', 'How much money consumers have to spend on their needs and wants'),
(56, 3, 'Consumer Law', 'Legal constraints that protect the consumer from unfair business practice'),
(57, 3, 'Consumer Rights', 'Where consumers are protected by laws in terms of product quality, returning goods, repairs and replacements, digital content and delivery'),
(58, 3, 'Consumer Spending', 'The level of spending that consumers undertake related to their income'),
(59, 3, 'Cost+', 'A pricing method where a business decides what price to charge based only on the cost of its production and some extra to make a profit'),
(60, 3, 'Crowd Funding', 'Finance raised through internet appeals from a large number of small investors'),
(61, 3, 'Curriculum Vitae', 'A document summarising the personal details, qualifications and experiences of an individual. Often used to apply for a job'),
(62, 3, 'Customer Engagement', 'Communicating with customers in a positive way'),
(63, 3, 'Customer Feedback', 'Enquiries made after a sale to show how a good, a service or the sales process could be improved'),
(64, 3, 'Customer Loyalty', 'Whether customers return to a business on a regular basis to purchase more of the same good or other goods that they produce'),
(65, 3, 'Customer Needs', 'What an individual must have in order to survive'),
(66, 3, 'Customer Satisfaction', 'How happy the consumer is with the product or service they have purchased'),
(67, 3, 'Customer Service', 'How a business looks after its customers before, during and after they make a purchase'),
(68, 3, 'Customers', 'The people who purchase a product or service from a business (not always the consumer)'),
(69, 3, 'Decentralised', 'A business structure and its decision-making is spread out to include more junior managers as well as individual business units or locations'),
(70, 3, 'Delayering', 'A method of saving costs in an organisation by reducing the number of layers'),
(71, 3, 'Demographics', 'Factors related to population, often used as a basis for segmentation'),
(72, 3, 'Design Mix', 'The use, appearance and cost of a product'),
(73, 3, 'Differentiation', 'When a business makes its product different to those of its competitors'),
(74, 3, 'Digital Communication', 'Sending messages using mobile or internet technology'),
(75, 3, 'Digital Technology', 'Where businesses use computers in any way to improve their business performance');

-- --------------------------------------------------------

--
-- Table structure for table `Sets`
--

CREATE TABLE `Sets` (
  `SetID` int(11) NOT NULL,
  `SetName` varchar(255) COLLATE utf32_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf32 COLLATE=utf32_bin;

--
-- Dumping data for table `Sets`
--

INSERT INTO `Sets` (`SetID`, `SetName`) VALUES
(1, 'Testing'),
(2, 'Chemistry Ions'),
(3, 'Business Key Terms');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Questions`
--
ALTER TABLE `Questions`
  ADD PRIMARY KEY (`QuestionID`);

--
-- Indexes for table `Sets`
--
ALTER TABLE `Sets`
  ADD PRIMARY KEY (`SetID`),
  ADD UNIQUE KEY `SetName` (`SetName`) USING HASH;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Questions`
--
ALTER TABLE `Questions`
  MODIFY `QuestionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `Sets`
--
ALTER TABLE `Sets`
  MODIFY `SetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
