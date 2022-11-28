-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2022 at 07:25 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ogis`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_username` varchar(30) NOT NULL,
  `admin_password` varchar(30) NOT NULL,
  `admin_fullname` varchar(50) NOT NULL,
  `admin_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_username`, `admin_password`, `admin_fullname`, `admin_type`) VALUES
(1, 'admin1', 'admin1', 'admin1', 'Registrar'),
(2, 'admin2', 'admin2', 'admin2', 'Vice');

-- --------------------------------------------------------

--
-- Table structure for table `admin_receipt`
--

CREATE TABLE `admin_receipt` (
  `arid` int(11) NOT NULL,
  `receipt` varchar(20) NOT NULL,
  `st_id` int(11) NOT NULL,
  `receipt_pic` varchar(255) NOT NULL,
  `print_status` varchar(11) NOT NULL DEFAULT 'pending',
  `dateSent` varchar(20) NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_receipt`
--

INSERT INTO `admin_receipt` (`arid`, `receipt`, `st_id`, `receipt_pic`, `print_status`, `dateSent`) VALUES
(9, 'GWA', 12341234, 'undraw_mathematics_4otb.png', 'rejected', '2022-11-29 00:40:15');

-- --------------------------------------------------------

--
-- Table structure for table `completion_grade`
--

CREATE TABLE `completion_grade` (
  `cid` int(11) NOT NULL,
  `teacherid` int(11) NOT NULL,
  `subjectid` int(11) NOT NULL,
  `student_schoolid` int(11) NOT NULL,
  `grade` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `completion_receipt`
--

CREATE TABLE `completion_receipt` (
  `crid` int(11) NOT NULL,
  `receiptPic` varchar(255) NOT NULL,
  `subject` varchar(40) NOT NULL,
  `st_id` int(11) NOT NULL,
  `course` varchar(20) NOT NULL,
  `teacher_name` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `dateSent` varchar(50) NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `completion_receipt`
--

INSERT INTO `completion_receipt` (`crid`, `receiptPic`, `subject`, `st_id`, `course`, `teacher_name`, `status`, `dateSent`) VALUES
(3, 'Photo-2.jpeg', 'asdfa', 12341234, 'BSIT', 'Christian Lawrence Perino Rosales', 'rejected', '2022-11-28 02:33:27');

-- --------------------------------------------------------

--
-- Table structure for table `concern`
--

CREATE TABLE `concern` (
  `concern_id` int(11) NOT NULL,
  `student_name` varchar(50) NOT NULL,
  `textValue` varchar(255) NOT NULL,
  `teacher_name` varchar(50) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `concern`
--

INSERT INTO `concern` (`concern_id`, `student_name`, `textValue`, `teacher_name`, `status`) VALUES
(1, 'Christian Lawrence Perino Rosales', 'Maam', 'Christian Lawrence Perino Rosales', 'pending'),
(2, 'Jogo Varra Gue', 'MAAM NAA KOY PROBLEMA WALA KOY GRADO SA IMO', 'Jessie Ypil Ortega', 'resolved');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `course_abbreviation` varchar(30) NOT NULL,
  `dept_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_name`, `course_abbreviation`, `dept_id`) VALUES
(1, 'Bachelor of Science in Information Technology', 'BSIT', 5),
(2, 'Bachelor of Science in Business Administration major in Financial Management', 'BSBA-FM', 2),
(3, 'Bachelor of Science in Education major in Science', 'BSED-Science', 3),
(7, 'Bachelor of Science in Computer Science', 'BSSC', 5),
(12, 'Bachelor of Science in Vulcanizing shop', 'BSVS', 5);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dept_id` int(11) NOT NULL,
  `dept_username` varchar(30) NOT NULL,
  `dept_password` varchar(30) NOT NULL,
  `dept_name` varchar(30) NOT NULL,
  `dept_abbreviation` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_id`, `dept_username`, `dept_password`, `dept_name`, `dept_abbreviation`) VALUES
(2, 'coc', 'coc1', 'College of Commerce', 'COC'),
(3, 'coe', 'coepass', 'College of Education', 'COE'),
(5, 'ccs1', 'ccs2', 'College of Computer Studies', 'CCS'),
(24, 'ua', 'ua', 'Unassigned', 'UA'),
(33, 'resigned', 'resigned', 'Resigned', 'RE'),
(40, 'admin1', 'admin1', 'College of Criminology', 'COCrim');

-- --------------------------------------------------------

--
-- Table structure for table `gradefiles`
--

CREATE TABLE `gradefiles` (
  `gfid` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `dept_status` varchar(50) NOT NULL,
  `vp_status` varchar(50) NOT NULL,
  `admin_status` varchar(11) NOT NULL DEFAULT 'pending',
  `filename` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gradefiles`
--

INSERT INTO `gradefiles` (`gfid`, `teacher_id`, `department_id`, `course_id`, `subject_id`, `dept_status`, `vp_status`, `admin_status`, `filename`) VALUES
(2, 5, 5, 1, 31, 'approved', 'approved', 'pending', 'gradesheety$Rb#%&9.xlsx'),
(3, 5, 5, 1, 24, 'approved', 'rejected', 'pending', 'gradesheet523erCyz.xlsx'),
(4, 5, 5, 1, 29, 'rejected', 'pending', 'pending', 'gradesheete72q8WkP.xlsx'),
(5, 5, 5, 1, 26, 'rejected', 'pending', 'pending', 'gradesheetEkenvRud.xlsx'),
(6, 5, 5, 1, 17, 'rejected', 'pending', 'pending', 'gradesheet7yEXJ9n4.xlsx'),
(7, 5, 5, 1, 26, 'rejected', 'pending', 'pending', 'gradesheetGT0aN3OM.xlsx'),
(8, 5, 5, 1, 27, 'approved', 'approved', 'pending', 'gradesheetKBp_WRHv.xlsx'),
(9, 5, 5, 1, 60, 'rejected', 'pending', 'pending', 'gradesheet_8uSm4Gv.xlsx'),
(10, 5, 5, 1, 38, 'approved', 'approved', 'pending', 'gradesheetz4QE9DeW.xlsx'),
(11, 5, 5, 1, 71, 'approved', 'approved', 'pending', 'gradesheetebYvdl8t.xlsx'),
(12, 5, 5, 1, 23, 'approved', 'approved', 'pending', 'file.xlsxQMakPxdi'),
(13, 5, 5, 1, 24, 'approved', 'approved', 'pending', 'qg26auvJfile.xlsx'),
(14, 5, 5, 1, 24, 'approved', 'approved', 'approved', 'KpRLAaxffile.xlsx'),
(15, 5, 5, 1, 22, 'approved', 'approved', 'approved', 'hH6EOGlnfile(1).xlsx'),
(16, 5, 5, 1, 62, 'approved', 'approved', 'approved', 'LihqzRerKpRLAaxffile.xlsx'),
(17, 5, 5, 1, 19, 'approved', 'approved', 'approved', 'j0yHgdR3file.xlsx'),
(18, 5, 5, 1, 19, 'approved', 'approved', 'approved', 'HaIQGRmCfile.xlsx');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `grades_id` int(11) NOT NULL,
  `st_schoolid` varchar(255) NOT NULL,
  `subject_code` varchar(11) NOT NULL,
  `grade` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`grades_id`, `st_schoolid`, `subject_code`, `grade`) VALUES
(7, '1235454545', 'MMW', '1.7'),
(10, '12341234', 'NET 1', 'INC'),
(12, '12341234', 'DISCRETE1', 'INC'),
(13, '1235454545', 'DISCRETE1', '1.4'),
(14, '44332211', 'GE7', '3.0'),
(17, '1235454545', 'GE7', '5.0'),
(20, '44332211', 'RESEARCH1', '1.2'),
(21, '1235454545', 'RESEARCH1', '1.4'),
(25, '1235454545', 'ACCTGA', '1.7'),
(26, '1235454545', 'PE 1', '1.5'),
(28, '12341234', 'BC 1', '3.0'),
(29, '217382135', 'BC 1', 'INC'),
(30, '44332211', 'BC 1', 'INC'),
(31, '1234545454', 'BC 1', 'INC'),
(32, '1235454545', 'BC 1', 'INC'),
(33, '1235554214', 'BC 1', 'INC'),
(34, '20195281050', 'BC 1', 'INC'),
(35, '202153154234', 'BC 1', 'INC'),
(36, '12341234', 'NSTP 1', '1.0');

-- --------------------------------------------------------

--
-- Table structure for table `prospectus`
--

CREATE TABLE `prospectus` (
  `prosid` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `prosfilename` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prospectus`
--

INSERT INTO `prospectus` (`prosid`, `course_id`, `prosfilename`) VALUES
(1, 1, 'CCS-Department-Prospectus.pdf'),
(4, 2, 'Group.1.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `student_schoolid` varchar(255) NOT NULL,
  `student_firstname` varchar(30) NOT NULL,
  `student_lastname` varchar(30) NOT NULL,
  `student_middlename` varchar(30) NOT NULL,
  `student_deptID` varchar(11) NOT NULL,
  `student_courseID` varchar(11) NOT NULL,
  `year_level` varchar(50) NOT NULL DEFAULT '1st Year',
  `section` varchar(5) NOT NULL DEFAULT 'A',
  `student_startYear` varchar(30) NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `student_schoolid`, `student_firstname`, `student_lastname`, `student_middlename`, `student_deptID`, `student_courseID`, `year_level`, `section`, `student_startYear`) VALUES
(109, '12341234', 'Jogo', 'Varra', 'Gue', '5', '1', '1st Year', 'A', '2022-11-13 18:47:56'),
(110, '1235454545', 'Kyle ', 'Rosales', 'Perino', '5', '1', '1st Year', 'A', '2022-11-13 18:47:56'),
(111, '12321214124', 'Wew', 'Daf', 'Ge', '5', '1', '1st Year', 'B', '2022-11-13 18:47:56'),
(112, '44332211', 'Jusj', 'Ki', 'Wa', '5', '1', '1st Year', 'A', '2022-11-13 18:47:56'),
(113, '20195281050', 'Christian Lawrence ', 'Rosales', 'Perino', '5', '1', '1st Year', 'A', '2022-11-13 18:47:56'),
(114, '202153154234', 'Luke', 'Kelu', 'Kelu', '5', '1', '2nd Year', 'A', '2022-11-13 21:56:24'),
(120, '217382135', 'Juliana', 'Rosales', 'Mae', '5', '1', '2nd Year', 'A', '2022-11-14 14:08:18'),
(122, '1235554214', 'Mark', 'Caguya', 'Renzo', '5', '1', '2nd Year', 'A', '2022-11-14 14:08:18'),
(123, '1234545454', 'Kuki', 'Parda', 'Lois', '5', '1', '3rd Year', 'A', '2022-11-14 14:20:17');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `subject_id` int(11) NOT NULL,
  `subject_code` varchar(11) NOT NULL,
  `units` decimal(11,2) NOT NULL DEFAULT 3.00,
  `subject_name` varchar(100) NOT NULL,
  `course_id` int(20) NOT NULL,
  `year_level` varchar(20) NOT NULL DEFAULT '1st',
  `semester` varchar(20) NOT NULL DEFAULT '1st Semester'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subject_id`, `subject_code`, `units`, `subject_name`, `course_id`, `year_level`, `semester`) VALUES
(12, 'MMW', '3.00', 'Mathematics in a Modern Worl', 1, '2nd', '2nd'),
(16, 'CAPSTONE1', '3.00', 'CAPSTONE', 2, '2nd', '1st'),
(17, 'CC100', '3.00', 'Introduction to Computing', 1, '1st', '1st'),
(18, 'GE5', '3.00', 'Purposive Communication', 1, '1st', '1st'),
(19, 'BC 1', '3.00', 'Mathematical Translation and transformation', 1, '1st', '1st'),
(20, 'CC101', '3.00', 'Computer Programming 1', 1, '1st', '1st'),
(21, 'GE1O', '3.00', 'Masining na Pagpapahayag', 1, '1st', '1st'),
(22, 'GE7', '3.00', 'Science, Technology and Society', 1, '1st', '1st'),
(23, 'PE 1', '3.00', 'Gymnastics and Physical education', 1, '1st', '1st'),
(24, 'DISCRETE1', '3.00', 'Discrete Structure', 1, '1st', '2nd'),
(25, 'ACCTGA', '3.00', 'Fundamentals of Accounting', 1, '1st', '2nd'),
(26, 'GE2', '3.00', 'Reading in Philippine History', 1, '1st', '2nd'),
(27, 'CC102', '3.00', 'Computer Programminng 2', 1, '1st', '2nd'),
(28, 'NSTP 1', '3.00', 'National Service Training Program 1', 1, '1st', '1st'),
(29, 'IS2', '3.00', 'Advanced Grammar and Composition', 1, '1st', '2nd'),
(30, 'GE3', '3.00', 'The Contemporary World', 1, '1st', '2nd'),
(31, 'PT1', '3.00', 'Platform Technologies', 1, '1st', 'Summer'),
(32, 'CC103', '3.00', 'Data Structures and Algorithm', 1, '1st', 'Summer'),
(33, 'NSTP 2', '3.00', 'National Service Training Program 2', 1, '1st', '2nd'),
(34, 'PE 2', '3.00', 'Folk dancing', 1, '1st', '2nd'),
(35, 'DIGITAL 1', '3.00', 'Digital Logic Design', 1, '2nd', '1st'),
(36, 'GE1', '3.00', 'Understanding the Self', 1, '1st', 'Summer'),
(37, 'GE9', '3.00', 'The Life and Work of Rizal', 1, '2nd', '1st'),
(38, 'CC104 A', '3.00', 'Information Management 1', 1, '2nd', '1st'),
(39, 'IS1', '3.00', 'Dimensionak Analysis', 1, '2nd', '1st'),
(40, 'GE11', '3.00', 'Ang Panitikan ng Pilipinas', 1, '2nd', '1st'),
(41, 'GE12', '3.00', 'Mga Anyo ng Kontemporaryong Panitikang Pilipino', 1, '2nd', '1st'),
(42, 'PE 3', '3.00', 'Ball Games/ Sports', 1, '2nd', '1st'),
(43, 'OOP1', '3.00', 'Object-Oriented Programming', 1, '2nd', '2nd'),
(44, 'NET 1', '3.00', 'Data Communications and Networking 1', 1, '2nd', '2nd'),
(45, 'MATH 1', '3.00', 'Probability and Statistics', 1, '2nd', '2nd'),
(46, 'GE6', '3.00', 'Art Appreciation', 1, '2nd', '2nd'),
(47, 'GE13', '3.00', 'Philippine Litterature', 1, '2nd', '2nd'),
(48, 'GE8', '3.00', 'Ethics', 1, '2nd', '2nd'),
(49, 'PE4', '3.00', 'Recreational games', 1, '2nd', '2nd'),
(50, 'RVA1', '3.00', 'Reading Visual Arts', 1, '2nd', 'Summer'),
(51, 'HCI1', '3.00', 'Introduction to Human Computer intraction', 1, '2nd', 'Summer'),
(52, 'QM1', '3.00', 'Quantitative Methods', 1, '3rd', '1st'),
(53, 'OS1', '3.00', 'Operating Systems', 1, '3rd', '1st'),
(54, 'SAD1', '3.00', 'System Analysis and Design', 1, '3rd', '1st'),
(55, 'CC104B', '3.00', 'Information Management 2', 1, '3rd', '1st'),
(56, 'IT ELEC1', '3.00', 'IT ELECTIVE1', 1, '3rd', '1st'),
(57, 'IS3', '3.00', 'Gender and Development', 1, '3rd', '1st'),
(58, 'CC105', '3.00', 'Applications Development and Emerging Technologies', 1, '3rd', '1st'),
(59, 'NET2', '3.00', 'Data Communication and Networking 2', 1, '3rd', '2nd'),
(60, 'SIA1 ', '3.00', 'System Interaction and Architecture', 1, '3rd', '2nd'),
(61, 'IT ELEC 2', '3.00', 'It Elective 2', 1, '3rd ', '2nd'),
(62, 'RESEARCH1', '3.00', 'Methods of Research in Computing', 1, '3rd', '2nd'),
(63, 'IM3', '3.00', 'Fundamentals of data warehousing and Data Mining', 1, '3rd', '2nd'),
(64, 'IAS1', '3.00', 'Information Assurance and Security', 1, '3rd', '2nd'),
(65, 'WEB 1', '3.00', 'Web Programming', 1, '3rd', '2nd'),
(66, 'IPT1', '3.00', 'Integrative Programming and Technologies', 1, '3rd', 'Summer'),
(67, 'CAPSTONE 2', '3.00', 'Capstone Project 2', 1, '4th', '1st'),
(69, 'SA1', '3.00', 'System Administration and Maintenance', 1, '4th', '1st'),
(70, 'IT ELEC 3', '3.00', 'IT ELECTIVE 3', 1, '3rd', 'Summer'),
(71, 'IT ELEC 4', '3.00', 'IT Elective 4', 1, '4th ', '1st'),
(72, 'GE14', '3.00', 'World Literature', 1, '4th', '1st'),
(73, 'IT REVIEW 1', '3.00', 'ertification Examination Review', 1, '4th', '1st'),
(74, 'PRAC1', '3.00', 'Practicum', 1, '4th', '2nd'),
(75, 'SEMTOUR', '3.00', 'Seminar and Tour', 1, '4th', '2nd'),
(76, 'IS 4', '3.00', 'Career Development and Work Values', 1, '4th', '1st'),
(77, 'dm', '3.00', 'HAHAHA1', 2, '1st', '2nd');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `teacher_id` int(11) NOT NULL,
  `teacher_username` varchar(30) NOT NULL,
  `teacher_password` varchar(30) NOT NULL,
  `teacher_firstname` varchar(30) NOT NULL,
  `teacher_lastname` varchar(30) NOT NULL,
  `teacher_middlename` varchar(30) NOT NULL,
  `dept_id` varchar(30) NOT NULL DEFAULT 'Unassigned'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`teacher_id`, `teacher_username`, `teacher_password`, `teacher_firstname`, `teacher_lastname`, `teacher_middlename`, `dept_id`) VALUES
(3, 'kyle132', 'kyle132', 'Luke', 'Rosales', 'Perinos', '33'),
(5, 'clr123', 'clr11', 'Christian Lawrence', 'Rosales', 'Perino', '5'),
(6, 'asfd', 'asdf', 'Kyle', 'Rosales', 'Perino', '5'),
(7, 'Jessi1', 'jessi1', 'Jessie', 'Ortega', 'Ypil', '2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `admin_receipt`
--
ALTER TABLE `admin_receipt`
  ADD PRIMARY KEY (`arid`);

--
-- Indexes for table `completion_grade`
--
ALTER TABLE `completion_grade`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `completion_receipt`
--
ALTER TABLE `completion_receipt`
  ADD PRIMARY KEY (`crid`);

--
-- Indexes for table `concern`
--
ALTER TABLE `concern`
  ADD PRIMARY KEY (`concern_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`),
  ADD UNIQUE KEY `course_abbreviation` (`course_abbreviation`),
  ADD UNIQUE KEY `course_name` (`course_name`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dept_id`),
  ADD UNIQUE KEY `dept_name` (`dept_name`),
  ADD UNIQUE KEY `dept_username` (`dept_username`);

--
-- Indexes for table `gradefiles`
--
ALTER TABLE `gradefiles`
  ADD PRIMARY KEY (`gfid`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`grades_id`),
  ADD KEY `student_id` (`st_schoolid`),
  ADD KEY `subject_id` (`subject_code`),
  ADD KEY `subject_code` (`subject_code`),
  ADD KEY `st_schoolid` (`st_schoolid`);

--
-- Indexes for table `prospectus`
--
ALTER TABLE `prospectus`
  ADD PRIMARY KEY (`prosid`),
  ADD UNIQUE KEY `course_id` (`course_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `student_schoolid` (`student_schoolid`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subject_id`),
  ADD UNIQUE KEY `subject_code` (`subject_code`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teacher_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_receipt`
--
ALTER TABLE `admin_receipt`
  MODIFY `arid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `completion_grade`
--
ALTER TABLE `completion_grade`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `completion_receipt`
--
ALTER TABLE `completion_receipt`
  MODIFY `crid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `concern`
--
ALTER TABLE `concern`
  MODIFY `concern_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `dept_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `gradefiles`
--
ALTER TABLE `gradefiles`
  MODIFY `gfid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `grades_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `prospectus`
--
ALTER TABLE `prospectus`
  MODIFY `prosid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
