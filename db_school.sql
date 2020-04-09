-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 09. Apr 2020 um 14:57
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `db_school`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `class`
--

CREATE TABLE `class` (
  `form_of_edu_name` varchar(32) NOT NULL,
  `departmentname` varchar(32) NOT NULL,
  `year` int(2) NOT NULL,
  `letter` varchar(32) NOT NULL,
  `class_leader` int(8) DEFAULT NULL,
  `room` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `curriculum`
--

CREATE TABLE `curriculum` (
  `form_of_edu_name` varchar(32) NOT NULL,
  `departmentname` varchar(32) NOT NULL,
  `year` int(2) NOT NULL,
  `letter` varchar(32) NOT NULL,
  `curriculumID` int(8) NOT NULL,
  `subject` varchar(32) NOT NULL,
  `theory_amount` int(8) DEFAULT NULL,
  `practice_amount` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `department`
--

CREATE TABLE `department` (
  `departmentname` varchar(32) NOT NULL,
  `headofdepartment` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `foe_department_curriculum_list`
--

CREATE TABLE `foe_department_curriculum_list` (
  `form_of_edu_name` varchar(32) NOT NULL,
  `departmentname` varchar(32) NOT NULL,
  `year` int(2) NOT NULL,
  `curriculumID` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `form_of_education`
--

CREATE TABLE `form_of_education` (
  `form_of_edu_name` varchar(32) NOT NULL,
  `degree` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `parent`
--

CREATE TABLE `parent` (
  `parentID` int(8) NOT NULL,
  `role` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `parent_of_students`
--

CREATE TABLE `parent_of_students` (
  `parentID` int(8) NOT NULL,
  `studentID` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `personal_info`
--

CREATE TABLE `personal_info` (
  `persID` int(8) NOT NULL,
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `phonenumber` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `student`
--

CREATE TABLE `student` (
  `studentID` int(8) NOT NULL,
  `is_selfentitled` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `students_of_class`
--

CREATE TABLE `students_of_class` (
  `form_of_edu_name` varchar(32) NOT NULL,
  `departmentname` varchar(32) NOT NULL,
  `year` int(2) NOT NULL,
  `letter` varchar(32) NOT NULL,
  `studentID` int(8) NOT NULL,
  `function` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `student_year_marks`
--

CREATE TABLE `student_year_marks` (
  `studentID` int(8) NOT NULL,
  `subjectID` varchar(32) NOT NULL,
  `year` int(2) NOT NULL,
  `semestermark` int(1) DEFAULT NULL,
  `yearmark` int(1) DEFAULT NULL,
  `years_history` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `subject`
--

CREATE TABLE `subject` (
  `subjectID` varchar(32) NOT NULL,
  `teaching_group` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `teacher`
--

CREATE TABLE `teacher` (
  `teacherID` int(8) NOT NULL,
  `masterdepartment` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `teachers_of_class`
--

CREATE TABLE `teachers_of_class` (
  `form_of_edu_name` varchar(32) NOT NULL,
  `departmentname` varchar(32) NOT NULL,
  `year` int(2) NOT NULL,
  `letter` varchar(32) NOT NULL,
  `teacherID` int(8) NOT NULL,
  `subject` varchar(32) NOT NULL,
  `factor_for_teaching_groups` float DEFAULT NULL,
  `value_units` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `teacher_of_department`
--

CREATE TABLE `teacher_of_department` (
  `departmentname` varchar(32) NOT NULL,
  `teacherID` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`form_of_edu_name`,`departmentname`,`year`,`letter`),
  ADD KEY `form_of_edu_name` (`form_of_edu_name`,`departmentname`,`year`,`letter`),
  ADD KEY `departmentname` (`departmentname`),
  ADD KEY `year` (`year`),
  ADD KEY `letter` (`letter`);

--
-- Indizes für die Tabelle `curriculum`
--
ALTER TABLE `curriculum`
  ADD PRIMARY KEY (`form_of_edu_name`,`departmentname`,`year`,`letter`,`curriculumID`,`subject`),
  ADD KEY `departmentname` (`departmentname`),
  ADD KEY `subject` (`subject`),
  ADD KEY `year` (`year`,`letter`,`curriculumID`),
  ADD KEY `curriculumID` (`curriculumID`),
  ADD KEY `letter` (`letter`);

--
-- Indizes für die Tabelle `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`departmentname`);

--
-- Indizes für die Tabelle `foe_department_curriculum_list`
--
ALTER TABLE `foe_department_curriculum_list`
  ADD PRIMARY KEY (`form_of_edu_name`,`departmentname`,`year`,`curriculumID`),
  ADD KEY `departmentname` (`departmentname`),
  ADD KEY `year` (`year`),
  ADD KEY `curriculumID` (`curriculumID`);

--
-- Indizes für die Tabelle `form_of_education`
--
ALTER TABLE `form_of_education`
  ADD PRIMARY KEY (`form_of_edu_name`);

--
-- Indizes für die Tabelle `parent`
--
ALTER TABLE `parent`
  ADD PRIMARY KEY (`parentID`);

--
-- Indizes für die Tabelle `parent_of_students`
--
ALTER TABLE `parent_of_students`
  ADD PRIMARY KEY (`parentID`,`studentID`),
  ADD KEY `studentID` (`studentID`);

--
-- Indizes für die Tabelle `personal_info`
--
ALTER TABLE `personal_info`
  ADD PRIMARY KEY (`persID`);

--
-- Indizes für die Tabelle `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studentID`);

--
-- Indizes für die Tabelle `students_of_class`
--
ALTER TABLE `students_of_class`
  ADD PRIMARY KEY (`form_of_edu_name`,`departmentname`,`year`,`letter`,`studentID`),
  ADD KEY `departmentname` (`departmentname`),
  ADD KEY `year` (`year`),
  ADD KEY `studentID` (`studentID`),
  ADD KEY `letter` (`letter`);

--
-- Indizes für die Tabelle `student_year_marks`
--
ALTER TABLE `student_year_marks`
  ADD PRIMARY KEY (`studentID`,`subjectID`,`year`),
  ADD KEY `subjectID` (`subjectID`),
  ADD KEY `year` (`year`);

--
-- Indizes für die Tabelle `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subjectID`);

--
-- Indizes für die Tabelle `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teacherID`);

--
-- Indizes für die Tabelle `teachers_of_class`
--
ALTER TABLE `teachers_of_class`
  ADD PRIMARY KEY (`form_of_edu_name`,`departmentname`,`year`,`letter`,`teacherID`,`subject`),
  ADD KEY `departmentname` (`departmentname`),
  ADD KEY `teacherID` (`teacherID`),
  ADD KEY `subject` (`subject`),
  ADD KEY `year` (`year`),
  ADD KEY `letter` (`letter`);

--
-- Indizes für die Tabelle `teacher_of_department`
--
ALTER TABLE `teacher_of_department`
  ADD PRIMARY KEY (`departmentname`,`teacherID`),
  ADD KEY `teacherID` (`teacherID`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`departmentname`) REFERENCES `department` (`departmentname`),
  ADD CONSTRAINT `class_ibfk_2` FOREIGN KEY (`form_of_edu_name`) REFERENCES `form_of_education` (`form_of_edu_name`),
  ADD CONSTRAINT `class_ibfk_3` FOREIGN KEY (`year`) REFERENCES `curriculum` (`year`),
  ADD CONSTRAINT `class_ibfk_4` FOREIGN KEY (`letter`) REFERENCES `students_of_class` (`letter`);

--
-- Constraints der Tabelle `curriculum`
--
ALTER TABLE `curriculum`
  ADD CONSTRAINT `curriculum_ibfk_1` FOREIGN KEY (`form_of_edu_name`) REFERENCES `form_of_education` (`form_of_edu_name`),
  ADD CONSTRAINT `curriculum_ibfk_2` FOREIGN KEY (`departmentname`) REFERENCES `department` (`departmentname`),
  ADD CONSTRAINT `curriculum_ibfk_3` FOREIGN KEY (`subject`) REFERENCES `subject` (`subjectID`),
  ADD CONSTRAINT `curriculum_ibfk_4` FOREIGN KEY (`curriculumID`) REFERENCES `foe_department_curriculum_list` (`curriculumID`),
  ADD CONSTRAINT `curriculum_ibfk_5` FOREIGN KEY (`letter`) REFERENCES `class` (`letter`);

--
-- Constraints der Tabelle `foe_department_curriculum_list`
--
ALTER TABLE `foe_department_curriculum_list`
  ADD CONSTRAINT `foe_department_curriculum_list_ibfk_1` FOREIGN KEY (`form_of_edu_name`) REFERENCES `form_of_education` (`form_of_edu_name`),
  ADD CONSTRAINT `foe_department_curriculum_list_ibfk_2` FOREIGN KEY (`departmentname`) REFERENCES `department` (`departmentname`),
  ADD CONSTRAINT `foe_department_curriculum_list_ibfk_3` FOREIGN KEY (`year`) REFERENCES `curriculum` (`year`);

--
-- Constraints der Tabelle `parent`
--
ALTER TABLE `parent`
  ADD CONSTRAINT `parent_ibfk_1` FOREIGN KEY (`parentID`) REFERENCES `personal_info` (`persID`);

--
-- Constraints der Tabelle `parent_of_students`
--
ALTER TABLE `parent_of_students`
  ADD CONSTRAINT `parent_of_students_ibfk_1` FOREIGN KEY (`parentID`) REFERENCES `parent` (`parentID`),
  ADD CONSTRAINT `parent_of_students_ibfk_2` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`);

--
-- Constraints der Tabelle `personal_info`
--
ALTER TABLE `personal_info`
  ADD CONSTRAINT `personal_info_ibfk_1` FOREIGN KEY (`persID`) REFERENCES `teacher` (`teacherID`);

--
-- Constraints der Tabelle `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `personal_info` (`persID`);

--
-- Constraints der Tabelle `students_of_class`
--
ALTER TABLE `students_of_class`
  ADD CONSTRAINT `students_of_class_ibfk_1` FOREIGN KEY (`form_of_edu_name`) REFERENCES `form_of_education` (`form_of_edu_name`),
  ADD CONSTRAINT `students_of_class_ibfk_2` FOREIGN KEY (`departmentname`) REFERENCES `department` (`departmentname`),
  ADD CONSTRAINT `students_of_class_ibfk_3` FOREIGN KEY (`year`) REFERENCES `curriculum` (`year`),
  ADD CONSTRAINT `students_of_class_ibfk_4` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`);

--
-- Constraints der Tabelle `student_year_marks`
--
ALTER TABLE `student_year_marks`
  ADD CONSTRAINT `student_year_marks_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`),
  ADD CONSTRAINT `student_year_marks_ibfk_2` FOREIGN KEY (`subjectID`) REFERENCES `subject` (`subjectID`),
  ADD CONSTRAINT `student_year_marks_ibfk_3` FOREIGN KEY (`year`) REFERENCES `curriculum` (`year`);

--
-- Constraints der Tabelle `teachers_of_class`
--
ALTER TABLE `teachers_of_class`
  ADD CONSTRAINT `teachers_of_class_ibfk_1` FOREIGN KEY (`form_of_edu_name`) REFERENCES `form_of_education` (`form_of_edu_name`),
  ADD CONSTRAINT `teachers_of_class_ibfk_2` FOREIGN KEY (`departmentname`) REFERENCES `department` (`departmentname`),
  ADD CONSTRAINT `teachers_of_class_ibfk_3` FOREIGN KEY (`teacherID`) REFERENCES `teacher` (`teacherID`),
  ADD CONSTRAINT `teachers_of_class_ibfk_4` FOREIGN KEY (`subject`) REFERENCES `subject` (`subjectID`),
  ADD CONSTRAINT `teachers_of_class_ibfk_5` FOREIGN KEY (`year`) REFERENCES `curriculum` (`year`),
  ADD CONSTRAINT `teachers_of_class_ibfk_6` FOREIGN KEY (`letter`) REFERENCES `class` (`letter`);

--
-- Constraints der Tabelle `teacher_of_department`
--
ALTER TABLE `teacher_of_department`
  ADD CONSTRAINT `teacher_of_department_ibfk_1` FOREIGN KEY (`teacherID`) REFERENCES `teacher` (`teacherID`),
  ADD CONSTRAINT `teacher_of_department_ibfk_2` FOREIGN KEY (`departmentname`) REFERENCES `department` (`departmentname`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
