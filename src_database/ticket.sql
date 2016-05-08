-- phpMyAdmin SQL Dump
-- version 4.5.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 01, 2016 at 01:17 AM
-- Server version: 5.7.10
-- PHP Version: 5.6.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ticket`
--

-- --------------------------------------------------------

--
-- Table structure for table `authen_key`
--

CREATE TABLE `authen_key` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(64) NOT NULL,
  `random_key` varchar(8) NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `expire_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` tinyint(1) UNSIGNED NOT NULL,
  `name` varchar(45) NOT NULL COMMENT 'ชื่อเต็มๆ ของแผนก เช่น IT System',
  `short` varchar(10) NOT NULL COMMENT 'ชื่อย่อ เช่น system, helpdesk',
  `objective` varchar(45) DEFAULT NULL COMMENT 'หน้าที่การทำงานหลักๆ ของแผนกนี้',
  `under` tinyint(1) UNSIGNED NOT NULL COMMENT 'อยู่ภายใต้ แผนกไหน\n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`, `short`, `objective`, `under`) VALUES
(0, 'Management', 'mnt', NULL, 0),
(1, 'Information Technology Department', 'itd', NULL, 0),
(2, 'Sales and Marketing Department', 'smd', NULL, 0),
(3, 'Human Resource Deparment', 'hrd', NULL, 0),
(11, 'IT System Team', 'its', NULL, 1),
(12, 'Helpdesk and IT Support Team', 'hds', NULL, 1),
(13, 'Dev Team', 'dev', NULL, 1),
(31, 'Others', 'etc', NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `end_user`
--

CREATE TABLE `end_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(45) NOT NULL,
  `fname` varchar(45) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `title` set('mr','ms','mrs') NOT NULL,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `thai_fname` varchar(45) DEFAULT NULL,
  `thai_lname` varchar(45) DEFAULT NULL,
  `nickname` varchar(45) DEFAULT NULL,
  `start_work_date` date DEFAULT NULL,
  `type_employment` set('permanent','probation','contract','temporary','trainees') NOT NULL,
  `department_id` tinyint(1) UNSIGNED NOT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `mobile_phone` varchar(15) DEFAULT NULL,
  `ipphone_ext` varchar(4) DEFAULT NULL COMMENT 'หมายเลข ip phone ติดต่อภายใน',
  `current_addr` varchar(100) DEFAULT NULL,
  `emer_contact` varchar(60) DEFAULT NULL,
  `role` set('doer','assigner','evaluator') DEFAULT 'doer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `title`, `fname`, `lname`, `thai_fname`, `thai_lname`, `nickname`, `start_work_date`, `type_employment`, `department_id`, `dob`, `email`, `password`, `mobile_phone`, `ipphone_ext`, `current_addr`, `emer_contact`, `role`) VALUES
(12, 'mr', 'admin', 'admin', 'แอดมิน', 'โอเพ่น', 'admin', NULL, 'permanent', 11, '1989-01-01', '01admin@open.co.th', 'd88a6f85f017cb477e484b0bdf0a0c19', '08912312123', '6690', NULL, NULL, 'doer'),
(13, 'mrs', 'Hillary', 'Clinton', 'ฮิลารี่', 'คลินตัน', 'Hilla', '2016-01-30', 'contract', 11, '1947-10-26', 'hillaryc@open.co.th', NULL, '0894551154', '6699', 'เลขที่ 1 ถนนรามคำแหง ซอย รามคำแหง 60/4', 'บุคคลที่ติดต่อได้ กรณีเกิดเหตุฉุกเฉิน', 'doer'),
(15, 'mr', 'Kttisak', 'Donpirom', 'กิตติศักดิ์', 'ดอนภิรมย์', 'ต้น', '2016-01-30', 'trainees', 13, '1992-05-01', 'kittisak@open.co.th', NULL, '089-0584542', '6104', '120/92 เคหะดอนเมือง แขวงสีกัน เขตดอนเมือง กรุงเทพมหานคร 10210', 'บุคคลที่ติดต่อได้ กรณีเกิดเหตุฉุกเฉิน', 'doer'),
(16, 'mr', 'Suphiyuean', 'Samae', 'สูพีเยือน', 'สาแม', 'ยัง', '2013-11-01', 'permanent', 12, '1990-12-06', 'suphiyuean@open.co.th', NULL, '097-2325005', '6110', 'ก.กิตติอพาร์ทเมนต์  26  หมู่บ้านสวนสน ซอย 9 ถนนสุขาภิบาล 3 เขตบางกะปิ  กรุงเทพฯ 10240', 'บุคคลที่ติดต่อได้ กรณีเกิดเหตุฉุกเฉิน', 'doer'),
(17, 'mr', 'Surasak', 'Sentima', 'สุรศักดิ์', 'เซ็นติมา', 'ยาซีน', '2015-01-05', 'permanent', 12, '1992-12-21', 'surasak@open.co.th', NULL, '081-8899217', '6112', '99/860 หมู่บ้านร่มทิพย์ ถนนหทัยราษฎร์ ซอยหทัยราษฎร์ 33 แขวงบางชัน เขตคลองสามวา กทม. 10510', 'บุคคลที่ติดต่อได้ กรณีเกิดเหตุฉุกเฉิน', 'doer'),
(18, 'mr', 'Anuwat', 'Toomnak', 'อนุวัตร', 'ทุมนาค', 'ภูห์', '2015-05-01', 'permanent', 12, '1991-11-21', 'anuwat@open.co.th', NULL, '085-0636428', '6113', '41/2 ซอย อ่อนนุช 59 ถนน อ่อนนุช แขวงประเวศ เขตประเวศ กรุงเทพมหานคร 10250', 'บุคคลที่ติดต่อได้ กรณีเกิดเหตุฉุกเฉิน', 'doer'),
(19, 'mr', 'Segsit', 'Thainboon', 'เศกสิทธิ์', 'เทียนบุญ', 'ต้น (Meepooh)', '2015-09-07', 'permanent', 12, '1992-10-16', 'segsit@open.co.th', NULL, '086-7699454', '6116', '89/40 อาคารบ้านพักอิสระ ซ.วิภาวดีรังสิต27 แขวง ตลาดบางเขน เขต หลักสี่ กรุงเทพ 10210\r\n', 'บุคคลที่ติดต่อได้ กรณีเกิดเหตุฉุกเฉิน', 'doer'),
(20, 'mr', 'Puttipong', 'Chairattanarak', 'พุฒิพงษ์', 'ไชยรัตนรักษ์', 'เบนซ์', '2014-11-24', 'permanent', 12, '1991-07-24', 'puttipong@open.co.th', NULL, '083-7070275', '6103', '29 ซอยกัลปพฤกษ์6 ถนนกัลปพฤกษ์ แขวงบางหว้า เขตภาษีเจริญ กรุงเทพฯ 10160', 'บุคคลที่ติดต่อได้ กรณีเกิดเหตุฉุกเฉิน', 'doer'),
(21, 'ms', 'Vanida', 'Niyomchok', 'วนิดา', 'นิยมโชค', 'จิว', '2015-05-09', 'permanent', 31, '1976-04-10', 'vanida@open.co.th', NULL, '081-9561065', '6111', '4887/5 ถนนประชาสงเคราะห์ แขวงดินแดง เขตดินแดง กทม. 10400', 'บุคคลที่ติดต่อได้ กรณีเกิดเหตุฉุกเฉิน', 'doer'),
(22, 'ms', 'Siyamol', 'Sitthisak', 'ศิญามล', 'สิทธิศักดิ์', 'มล', '2016-03-01', 'permanent', 31, '1983-10-04', 'siyamol@open.co.th', NULL, '086-6178316', '6106', '22/23 หมุ่ 7  ต.หนองเพรางาย    อ.ไทรน้อย    จ.นนทบุรี    11150', 'บุคคลที่ติดต่อได้ กรณีเกิดเหตุฉุกเฉิน', 'doer'),
(23, 'mr', 'Jirawat', 'Patakang', 'จิรวัฒน์', 'ปะทะกัง', 'โจ้', '2011-08-01', 'permanent', 11, '1988-08-04', 'jirawat@open.co.th', NULL, '090-7675970', '6105', '86/262 ซ.นนทบุรี 20 ถนนสนามบินน้ำ ต.บางกระสอ อ.เมือง จ.นนทบุรี', 'บุคคลที่ติดต่อได้ กรณีเกิดเหตุฉุกเฉิน', 'doer'),
(24, 'ms', 'Pornsuda', 'Suwarat', 'พรสุดา ', 'สุวะรัตน์', 'เอ้', '2012-06-10', 'permanent', 11, '1989-01-26', 'pornsuda@open.co.th', NULL, '084-3878845', '6107', '3/369 ลุมพินีวิลล์รามคำแหง 60/2  ซ.รามคำแหง 60/2  ถ.รามคำแหง  แขวงหัวหมาก  เขตบางกะปิ กทม. 10240', 'บุคคลที่ติดต่อได้ กรณีเกิดเหตุฉุกเฉิน', 'doer'),
(25, 'mr', 'Jakapat', 'Kongsuk', 'จักรภัทร', 'กองสุข', 'บาส', '2012-11-01', 'permanent', 11, '1988-03-20', 'jakapat@open.co.th', NULL, '095-7366572', '6105', '5/85 ลุมพินีวิลล์ อาคาร B ซ.รามคำแหง 60/2 ถ.รามคำแหง แขวงหัวหมาก เขตบางกะปิ กรุงเทพมหานคร 10240', 'บุคคลที่ติดต่อได้ กรณีเกิดเหตุฉุกเฉิน', 'doer'),
(26, 'mr', 'Jakarin', 'Kongsuk', 'จักริน', 'กองสุข', 'บอล', '2012-11-01', 'permanent', 11, '1988-03-20', 'jakarin@open.co.th', NULL, '089-9601505', '6002', '5/85 ลุมพินีวิลล์ อาคาร B ซ.รามคำแหง 60/2 ถ.รามคำแหง แขวงหัวหมาก เขตบางกะปิ กรุงเทพมหานคร 10240', 'บุคคลที่ติดต่อได้ กรณีเกิดเหตุฉุกเฉิน', 'doer'),
(27, 'mr', 'Jannarong', 'Poolsawat', 'เจนณรงค์ ', 'พูลสวัสดิ์', 'ปาล์ม', '2013-12-04', 'permanent', 11, '1989-11-22', 'jannarong@open.co.th', NULL, '083-8981918', '6002', '39/66 หมู่ 2 หมู่บ้าน บุศรินทร์ รามอินทรา แขวงคลองสามวาตะวันตก เขตมีนบุรี กรุงเทพมหานคร 10510', 'บุคคลที่ติดต่อได้ กรณีเกิดเหตุฉุกเฉิน', 'doer'),
(28, 'mr', 'Warit', 'Salairat', 'วาริทธิ์ ', 'ไสลรัตน์', 'แม๊ก', '2014-05-16', 'permanent', 12, '1989-10-12', 'warit@open.co.th', NULL, '091-8210118', '6003', '68/40 ดีไซต์คอนโด แขวงสามเสนนอก เขตห้วยขวาง กรุงเทพฯ 10310', 'บุคคลที่ติดต่อได้ กรณีเกิดเหตุฉุกเฉิน', 'doer'),
(29, 'mr', 'Peerapong', 'Ruthaveepol', 'พีระพงษ์ ', 'รู้ทวีผล', 'ต้น', '2015-06-01', 'permanent', 12, '1991-09-03', 'peerapong@open.co.th', NULL, '081-3556005', '6001', '27117 ซอยนวมินทร์ แขวงนวลจันทร์ เขตบึงกุ่ม กรุงเทพมหานคร  10230', 'บุคคลที่ติดต่อได้ กรณีเกิดเหตุฉุกเฉิน', 'doer'),
(30, 'mr', 'Natthaphong', 'Karnthamna', 'ณัฐพงษ์ ', 'การทำนา', 'เอฟ', '2015-12-25', 'permanent', 11, '1993-11-05', 'natthaphong@open.co.th', NULL, '083-7887571', '6109', '79/89 หมู่ 4 หมู่บ้านฟ้าปิยรมย์ เฟส 9 ตำบลบึงคำพร้อย อำเภอลำลูกกา จังหวัดปทุมธานี 12150', 'บุคคลที่ติดต่อได้ กรณีเกิดเหตุฉุกเฉิน', 'doer'),
(31, 'mr', 'Thanawit', 'Saiklangdee', 'ธนวิชญ์ ', 'สายกลางดี', 'ชิป', '2014-12-05', 'permanent', 12, '1992-12-22', 'thanawit@open.co.th', NULL, '085-9734566', '6001', '301/21 หมู่บ้านปาล์มสวีท ถนนลาดพร้าว 80 แยก 22 แขวงและเขตวังทองหลาง กรุงเทพฯ 10320', 'บุคคลที่ติดต่อได้ กรณีเกิดเหตุฉุกเฉิน', 'doer'),
(32, 'mr', 'Teeravat', 'Yangboonsuk', 'ธีระวัฒน์', 'ยังบุญสุข', 'บิ๊ก', '2015-07-08', 'permanent', 12, '1990-12-15', 'teeravat@open.co.th', NULL, '098-0576955', '6001', '158/6 KT Tower ห้อง 310 ซอยลาดพร้าว 107 แยก 20 แขวงคลองจั่น เขตบางกะปิ  กรุงเทพมหานคร 10240', 'บุคคลที่ติดต่อได้ กรณีเกิดเหตุฉุกเฉิน', 'doer'),
(33, 'mr', 'Sarawut', 'Wong-ong', 'ศราวุฒิ', 'วงษ์อ่อง', 'ต้น', '2015-08-10', 'permanent', 12, '1991-01-10', 'sarawut@open.co.th', NULL, '092-3135762', '6001', '158/6 บ้านกัลปพฤกษ์ ช.107 ถ.ลาดพร้าว แขวงคลองจั่น เขตบางกะปิ กทม10240', 'บุคคลที่ติดต่อได้ กรณีเกิดเหตุฉุกเฉิน', 'doer'),
(34, 'ms', 'Russiyah', 'Chedoloh', 'รุสซียะห์', 'เจ๊ะดอเล๊าะ', 'ดี', '2015-12-01', 'permanent', 12, '1989-06-29', 'russiyah@open.co.th', NULL, '087-9886192', '6001', '37/1 ซอยรามคำแหง 53 แขวงพลับพลา เขตวังทองหลาง กรุงเทพมหานคร 10600', 'บุคคลที่ติดต่อได้ กรณีเกิดเหตุฉุกเฉิน', 'doer'),
(35, 'mr', 'Wisut', 'Srijaroenphon', 'วิสุทธิ์ ', 'ศรีเจริญผล', 'เอ', '2016-02-01', 'permanent', 12, '1988-08-24', 'wisut@open.co.th', NULL, '094-8968019', '6001', '27/1 หมู่ที่ 5 ตำบล เบิกไพร อำเภอ บ้านโป่ง จังหวัด ราชบุรี 70110', 'บุคคลที่ติดต่อได้ กรณีเกิดเหตุฉุกเฉิน', 'doer'),
(36, 'mr', 'Kaogavin ', '่Junjek', 'เก้ากวินท์', 'จั่นเจ๊ก', 'โต้ง', '2016-02-01', 'permanent', 12, '1990-07-18', 'kaogavin@open.co.th', NULL, '088-9568605', '6001', '729/138 ซอย ลาดพร้าว 101  ถนน ลาดพร้าว แขวงคลองเจ้าคุณสิงห์ เขตวังทองหลาง กรุงเทพมหานคร 10310', 'บุคคลที่ติดต่อได้ กรณีเกิดเหตุฉุกเฉิน', 'doer'),
(37, 'mr', 'Sittipon', 'Thippong', 'สิทธิพล', 'ทิพย์ปง', 'โอ๊ค', '2016-02-01', 'permanent', 12, '1990-01-05', 'sittipon@open.co.th', NULL, '086-0741770', '6001', '199 ซอย ลาดพร้าว 101  ถนน ลาดพร้าว แขวงคลองเจ้าคุณสิงห์ เขตวังทองหลาง กรุงเทพมหานคร 10310', 'บุคคลที่ติดต่อได้ กรณีเกิดเหตุฉุกเฉิน', 'doer'),
(38, 'mr', 'Nattanan', 'Mattree', 'นัตทนันท์', 'แมตทรี', 'ไอซ์', '2016-02-01', 'permanent', 12, '1991-07-05', 'nattana@open.co.th', NULL, '081-2490563', '6001', '41/2 ซอย อ่อนนุช 59 ถนน อ่อนนุช แขวงประเวศ เขตประเวศ กรุงเทพมหานคร 10250', 'บุคคลที่ติดต่อได้ กรณีเกิดเหตุฉุกเฉิน', 'doer');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id` int(10) UNSIGNED NOT NULL,
  `subject` varchar(45) NOT NULL,
  `priority` enum('low','normal','high') NOT NULL DEFAULT 'normal',
  `content` varchar(255) DEFAULT NULL,
  `create_by` int(11) NOT NULL,
  `assign_to` int(11) DEFAULT NULL,
  `assign_by` int(11) DEFAULT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authen_key`
--
ALTER TABLE `authen_key`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_department_department1_idx` (`under`);

--
-- Indexes for table `end_user`
--
ALTER TABLE `end_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_staff_department_idx` (`department_id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_table1_staff_idx` (`create_by`),
  ADD KEY `fk_table1_staff1_idx` (`assign_to`),
  ADD KEY `fk_table1_staff2_idx` (`assign_by`),
  ADD KEY `fk_ticket_end_user1_idx` (`end_user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authen_key`
--
ALTER TABLE `authen_key`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `end_user`
--
ALTER TABLE `end_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `fk_department_department1` FOREIGN KEY (`under`) REFERENCES `department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `fk_staff_department` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `fk_table1_staff` FOREIGN KEY (`create_by`) REFERENCES `staff` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_table1_staff1` FOREIGN KEY (`assign_to`) REFERENCES `staff` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_table1_staff2` FOREIGN KEY (`assign_by`) REFERENCES `staff` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ticket_end_user1` FOREIGN KEY (`end_user_id`) REFERENCES `end_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
