-- Exported from QuickDBD: https://www.quickdatatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/schema/hzKqV7yHLE6e5rL27TfAxQ
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
-- Host: 127.0.0.1
-- Generation Time: Oct 16, 2018 at 05:29 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

-- !40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT
-- !40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS
-- !40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION
-- !40101 SET NAMES utf8mb4
-- Database: `college_database`
-- Table structure for table `class`
CREATE TABLE `class` (
    `id` int(11) AUTO_INCREMENT NOT NULL ,
    `class_code` string(7)  NOT NULL ,
    `name` string(60)  NOT NULL ,
    `description` string(150)  NOT NULL ,
    `professor_id_fk` int(11)  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

-- Table structure for table `professor`
CREATE TABLE `professor` (
    `id` int(11) AUTO_INCREMENT NOT NULL ,
    `name` string(60)  NOT NULL ,
    `department` enum('science','humanities','music','journalism','history','medicine')  NOT NULL ,
    `tenure` tinyint(1)  NOT NULL ,
    `joining_date` date  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

-- Table structure for table `student`
CREATE TABLE `student` (
    `id` int(11) AUTO_INCREMENT NOT NULL ,
    `name` string(60)  NOT NULL ,
    `date_of_birth` date  NOT NULL ,
    `registered_date` timestamp  NOT NULL DEFAULT current_timestamp,
    `status` enum('current','waiting','passed','failed')  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

-- Table structure for table `student_class`
CREATE TABLE `student_class` (
    `id` int(11) AUTO_INCREMENT NOT NULL ,
    `class_code_fk` string(7)  NOT NULL ,
    `professor_id_fk` int(11)  NOT NULL ,
    `student_id_fk` int(11)  NOT NULL ,
    `grade` int(3)  NOT NULL ,
    `start_date` date  NOT NULL ,
    `end_date` date  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

ALTER TABLE `class` ADD CONSTRAINT `fk_class_professor_id_fk` FOREIGN KEY(`professor_id_fk`)
REFERENCES `professor` (`id`);

ALTER TABLE `student_class` ADD CONSTRAINT `fk_student_class_class_code_fk` FOREIGN KEY(`class_code_fk`)
REFERENCES `student` (`id`);

ALTER TABLE `student_class` ADD CONSTRAINT `fk_student_class_professor_id_fk` FOREIGN KEY(`professor_id_fk`)
REFERENCES `class` (`class_code`);

ALTER TABLE `student_class` ADD CONSTRAINT `fk_student_class_student_id_fk` FOREIGN KEY(`student_id_fk`)
REFERENCES `professor` (`id`);

