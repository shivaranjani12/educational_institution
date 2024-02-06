-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 11, 2023 at 05:55 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ase_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `assignment_id` int(11) NOT NULL,
  `ass_name` varchar(25) NOT NULL,
  `ass_desc` varchar(100) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`assignment_id`, `ass_name`, `ass_desc`, `course_id`) VALUES
(1009, 'Assignment 1', 'question1', 1001),
(1010, 'Assignment 2', 'question 2', 1001),
(1011, 'Assignment 1', 'Question1', 1005),
(1012, 'Assignment 1', 'ML question 1', 1002),
(1013, 'Assignment 1', 'Question1', 1003),
(1014, 'Assignment 2', 'question 2', 1003);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(25) NOT NULL,
  `user_id` int(11) NOT NULL,
  `schedule` varchar(50) NOT NULL,
  `location` varchar(10) NOT NULL,
  `syllabus` varchar(1000) NOT NULL,
  `fee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_name`, `user_id`, `schedule`, `location`, `syllabus`, `fee`) VALUES
(1001, 'AI', 1, 'Tuesday (2:00 P.M. to 4:00 P.M.)', 'ERB 300', 'Artificial Intelligence Syllabus', 200),
(1002, 'ML', 2, 'Friday (2:00 P.M. to 4:50 P.M.)', 'CH 300', 'Machine Learning Syllabus', 300),
(1003, 'CCBD', 2, 'Wednesday (2:00 P.M. to 4:50 P.M.)', 'CH 400', 'Cloud Computing and Big Data', 200),
(1004, 'Data Mining', 2, 'Tuesday (4:00 P.M. to 6:50 P.M.)', 'NH 300', 'Data Mining Syllabus', 200),
(1005, 'Database Systems', 1, 'Thursday (4:00 P.M. to 6:50 P.M.)', 'WH 301', 'Database Systems Syllabus', 300),
(1006, 'Computer Vision', 3, 'Tuesday (7:00 P.M. to 8:50 P.M.)', 'NH 302', 'Computer Vision Syllabus', 300),
(1007, 'Software Engineering', 3, 'Saturday (4:00 P.M. to 6:50 P.M.)', 'ERB 501', 'Software Engineering Syllabus12', 300),
(1008, 'Data Modeling techniques', 2, 'Friday (1:00 P.M. to 2:00 P.M.)', 'ERB 200', 'DAMT', 300),
(1009, 'NM', 3, 'Wednesday (10:00 A.M. to 10:50 A.M.)', 'WH 301', 'Numerical Methods', 300);

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `enrollment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `status` varchar(10) NOT NULL,
  `payment` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`enrollment_id`, `user_id`, `course_id`, `status`, `payment`) VALUES
(2, 4, 1001, 'enrolled', ''),
(2, 4, 1002, 'enrolled', ''),
(2, 4, 1005, 'enrolled', '');

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `exam_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `link` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`exam_id`, `course_id`, `description`, `link`) VALUES
(105, 1001, 'Exam 1', 'https://www.codechef.com/'),
(106, 1001, 'Exam 2', 'https://www.hackerrank.com/'),
(107, 1005, 'Exam 1', 'https://www.hackerrank.com/');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `user_id` int(11) NOT NULL,
  `course_id` int(10) NOT NULL,
  `assignment_id` int(11) DEFAULT NULL,
  `assignment_value` varchar(1000) DEFAULT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `exam_value` varchar(10) DEFAULT NULL,
  `scores` int(11) NOT NULL,
  `grade` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`user_id`, `course_id`, `assignment_id`, `assignment_value`, `exam_id`, `exam_value`, `scores`, `grade`) VALUES
(4, 1001, 1009, 'Answer 1', NULL, NULL, 70, 'A'),
(4, 1001, 1010, 'Answer 2', NULL, NULL, 90, 'A'),
(4, 1002, 1012, 'Answer 1', NULL, NULL, 0, 'A'),
(4, 1005, 1011, 'Answer 1', NULL, NULL, 70, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_type` varchar(25) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `firstName` varchar(25) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_type`, `password`, `firstName`, `lastName`, `email`) VALUES
(1, 'instructor', '$2b$10$6XGQKnVEuULd83FHG8DIC.oQYqLyXA2YZT4kTrhTZaicDXGZ61eEu', 'instructor1', 'i1', 'instructor1@gmail.com'),
(2, 'instructor', '$2b$10$O9uytN3Br4SC80EQNI1W0ejhe9Edj3qEZyrH3bRDVd19.Yu/39G.a', 'instructor2', 'i2', 'instructor2@gmail.com'),
(3, 'instructor', '$2b$10$.pkI4ZYV9ayb1n5pUo8TV.Zp4lGwmi3T8hi7nzqBcLzaZJxj0a0QG', 'instructor3', 'i3', 'instructor3@gmail.com'),
(4, 'student', '$2b$10$bSU3sweMSr/gXnw6EXgKEeDnFdBxaqzgY4/Zh.XD5zoQZjSTSEFk2', 'student1', 's1', 'student1@gmail.com'),
(5, 'student', '$2b$10$h2BRgCkw2iVvTGMGg5JR8O03DQPju4shAJfDwCKkjHQND4IMyPhgK', 'student2', 's2', 'student2@gmail.com'),
(6, 'student', '$2b$10$GJkwPrcf1P8OfRYFupLp1.wWU2ODsoUHJxLNNJmmj0Us5/XjPvda2', 'student3', 's3', 'student3@gmail.com'),
(22, 'admin', '$2b$10$biKzM35gPPsknpXZu2iiv.KOqW0WRKfijn2KkaAH9jJXcRKopnDsG', 'admin', 'a', 'admin@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`assignment_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`exam_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `assignment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1015;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1010;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
