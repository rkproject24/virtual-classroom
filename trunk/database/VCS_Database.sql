-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.45-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema vcs_schema
--

CREATE DATABASE IF NOT EXISTS vcs_schema;
USE vcs_schema;

--
-- Definition of table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `userid` varchar(45) NOT NULL,
  `NAME` varchar(45) NOT NULL,
  `DOB` datetime NOT NULL,
  `EMAILP` varchar(45) NOT NULL,
  `EMAILS` varchar(45) NOT NULL,
  `CONTACTP` varchar(45) NOT NULL,
  `CONTACTS` varchar(45) NOT NULL,
  `ADDRESS` varchar(45) NOT NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`userid`,`NAME`,`DOB`,`EMAILP`,`EMAILS`,`CONTACTP`,`CONTACTS`,`ADDRESS`) VALUES 
 ('admin','Administrator','2011-03-05 00:00:00','admin@vcs.com','admin@vcs.com','454545454','5454545','Hyderabad');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


--
-- Definition of table `answersheets`
--

DROP TABLE IF EXISTS `answersheets`;
CREATE TABLE `answersheets` (
  `TESTID` int(10) unsigned NOT NULL auto_increment,
  `STUDENTID` varchar(20) NOT NULL,
  `ANSWERS` varchar(1000) NOT NULL,
  `EVALUATED` int(10) unsigned NOT NULL,
  `TOTALMARKS` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`TESTID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answersheets`
--

/*!40000 ALTER TABLE `answersheets` DISABLE KEYS */;
/*!40000 ALTER TABLE `answersheets` ENABLE KEYS */;


--
-- Definition of table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment` (
  `APPOINTMENTID` int(10) unsigned NOT NULL auto_increment,
  `NAME` varchar(500) NOT NULL,
  `RESUME` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `SUBJECTID` int(10) unsigned NOT NULL,
  `DOB` datetime NOT NULL,
  `EMAILPRIMARY` varchar(255) NOT NULL,
  `EMAILSECONDARY` varchar(255) NOT NULL,
  `CONTACTNOPRIMARY` int(10) unsigned NOT NULL,
  `ADDRESS` varchar(255) NOT NULL,
  `QUALIFICATION` varchar(255) NOT NULL,
  `PASSYEAR` int(10) unsigned NOT NULL,
  `APPROVED` int(10) unsigned NOT NULL,
  `COURSEID` int(10) unsigned NOT NULL,
  `APPROVEDBY` varchar(255) NOT NULL,
  `USERID` varchar(255) NOT NULL,
  PRIMARY KEY  (`APPOINTMENTID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;


--
-- Definition of table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `COURSEID` int(10) unsigned NOT NULL auto_increment,
  `NAME` varchar(500) NOT NULL,
  `DURATION` int(10) unsigned NOT NULL,
  `FEES` varchar(255) NOT NULL,
  PRIMARY KEY  (`COURSEID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` (`COURSEID`,`NAME`,`DURATION`,`FEES`) VALUES 
 (1,'Java',1,'2000'),
 (2,'Dotnet',1,'3000'),
 (3,'Oracle',1,'200'),
 (4,'Adobe Flex',2,'200');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;


--
-- Definition of table `discussion`
--

DROP TABLE IF EXISTS `discussion`;
CREATE TABLE `discussion` (
  `DISCUSSIONID` int(10) unsigned NOT NULL auto_increment,
  `ORGANIZEDBY` varchar(255) NOT NULL,
  `ORGANIZEDFOR` varchar(20) NOT NULL,
  `COURSEID` varchar(30) NOT NULL,
  `SUBJECTID` varchar(30) NOT NULL,
  `TITLE` varchar(255) NOT NULL,
  `DATE` datetime NOT NULL,
  `DURATION` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`DISCUSSIONID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `discussion`
--

/*!40000 ALTER TABLE `discussion` DISABLE KEYS */;
INSERT INTO `discussion` (`DISCUSSIONID`,`ORGANIZEDBY`,`ORGANIZEDFOR`,`COURSEID`,`SUBJECTID`,`TITLE`,`DATE`,`DURATION`) VALUES 
 (1,'admin','Java Students','1|2','1','Core Java','2011-08-23 00:00:00',2);
/*!40000 ALTER TABLE `discussion` ENABLE KEYS */;


--
-- Definition of table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
CREATE TABLE `faculty` (
  `FACULTYID` int(10) unsigned NOT NULL auto_increment,
  `USERID` varchar(45) NOT NULL,
  `DOB` datetime NOT NULL,
  `EMAILPRIMARY` varchar(255) NOT NULL,
  `EMAILSECONDARY` varchar(255) NOT NULL,
  `CONTACTNOPRIMARY` int(10) unsigned NOT NULL,
  `CONTACTNOSECONDARY` int(10) unsigned NOT NULL,
  `ADDRESS` varchar(500) NOT NULL,
  `QUALIFICATION` varchar(255) NOT NULL,
  `APPOINTEDBY` varchar(255) NOT NULL,
  `COURSEID` varchar(255) NOT NULL,
  `SUBJECTID` int(10) unsigned NOT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY  (`FACULTYID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faculty`
--

/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` (`FACULTYID`,`USERID`,`DOB`,`EMAILPRIMARY`,`EMAILSECONDARY`,`CONTACTNOPRIMARY`,`CONTACTNOSECONDARY`,`ADDRESS`,`QUALIFICATION`,`APPOINTEDBY`,`COURSEID`,`SUBJECTID`,`NAME`) VALUES 
 (2,'faculty1','1988-00-23 00:00:00','venu_2703@yahoo.co.in','venu.203@gmail.com',12345689,8988,'Hyderabad','MSc','Manager','1|2',1,'Faculty 1');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;


--
-- Definition of table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `FEEDBACKID` int(10) unsigned NOT NULL auto_increment,
  `TESTID` int(10) unsigned NOT NULL,
  `FILEID` int(10) unsigned NOT NULL,
  `STUDENTID` int(10) unsigned NOT NULL,
  `FACULTYID` int(10) unsigned NOT NULL,
  `FEEDBACK` varchar(500) NOT NULL,
  `APPROVAL` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`FEEDBACKID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;


--
-- Definition of table `files`
--

DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `FILEID` int(10) unsigned NOT NULL auto_increment,
  `TITLE` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(500) NOT NULL,
  `UPLOADEDBY` varchar(20) NOT NULL,
  `TOPICS` varchar(500) NOT NULL,
  `FILETYPE` int(10) unsigned NOT NULL,
  `SOLUTIONFILE` varchar(20) NOT NULL,
  `UPLOADEDTO` varchar(20) NOT NULL,
  `COURSEID` varchar(20) NOT NULL,
  `SUBJECTID` varchar(20) NOT NULL,
  `UPLOADDATE` datetime NOT NULL,
  `FilePath` varchar(255) NOT NULL,
  `Image` varchar(45) NOT NULL,
  PRIMARY KEY  (`FILEID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `files`
--

/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` (`FILEID`,`TITLE`,`DESCRIPTION`,`UPLOADEDBY`,`TOPICS`,`FILETYPE`,`SOLUTIONFILE`,`UPLOADEDTO`,`COURSEID`,`SUBJECTID`,`UPLOADDATE`,`FilePath`,`Image`) VALUES 
 (1,'CoreJava','Java File','admin','Java',0,'NA','0','1','1','2007-12-30 00:00:00','Creek','Creek'),
 (2,'Advanced Java','Java','admin','Java,|J2EE',1,'NA','0','1','1','2007-12-30 00:00:00','Forest','Forest');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;


--
-- Definition of table `management`
--

DROP TABLE IF EXISTS `management`;
CREATE TABLE `management` (
  `MANAGEMENTID` int(10) unsigned NOT NULL auto_increment,
  `USERID` varchar(255) NOT NULL,
  `NAME` varchar(500) NOT NULL,
  `DOB` datetime NOT NULL,
  `EMAILP` varchar(255) NOT NULL,
  `EMAILS` varchar(255) NOT NULL,
  `CONTACTP` int(10) unsigned NOT NULL,
  `CONTACTS` int(10) unsigned NOT NULL,
  `ADDRESS` varchar(255) NOT NULL,
  `PHOTOGRAPH` varchar(255) NOT NULL,
  `DESIGNATION` varchar(255) NOT NULL,
  PRIMARY KEY  (`MANAGEMENTID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `management`
--

/*!40000 ALTER TABLE `management` DISABLE KEYS */;
INSERT INTO `management` (`MANAGEMENTID`,`USERID`,`NAME`,`DOB`,`EMAILP`,`EMAILS`,`CONTACTP`,`CONTACTS`,`ADDRESS`,`PHOTOGRAPH`,`DESIGNATION`) VALUES 
 (1,'mgmt1','S Pradeepthi','1988-03-05 00:00:00','s.pradeepthi@gmail.com','s.pradeepthi@gmail.com',123456789,123456789,'Hyderabad','halpert','Director');
/*!40000 ALTER TABLE `management` ENABLE KEYS */;


--
-- Definition of table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `NEWSID` int(10) unsigned NOT NULL auto_increment,
  `SUBJECT` varchar(255) NOT NULL,
  `DATE` datetime NOT NULL,
  `DESCRIPTION` varchar(500) NOT NULL,
  PRIMARY KEY  (`NEWSID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news`
--

/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;


--
-- Definition of table `notices`
--

DROP TABLE IF EXISTS `notices`;
CREATE TABLE `notices` (
  `NOTICEID` int(10) unsigned NOT NULL auto_increment,
  `KEYWORD` varchar(500) NOT NULL,
  `DESCRIPTION` varchar(500) NOT NULL,
  `POSTEDTO` varchar(500) NOT NULL,
  `POSTEDBY` varchar(255) NOT NULL,
  `POSTINGDATE` datetime NOT NULL,
  `EXPIRESON` datetime NOT NULL,
  `TITLE` varchar(255) NOT NULL,
  `ARCHIVED` int(10) unsigned NOT NULL,
  `COURSEID` varchar(255) NOT NULL,
  `SUBJECTID` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`NOTICEID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notices`
--

/*!40000 ALTER TABLE `notices` DISABLE KEYS */;
INSERT INTO `notices` (`NOTICEID`,`KEYWORD`,`DESCRIPTION`,`POSTEDTO`,`POSTEDBY`,`POSTINGDATE`,`EXPIRESON`,`TITLE`,`ARCHIVED`,`COURSEID`,`SUBJECTID`) VALUES 
 (1,'Fees','This is informed that the last day for paying the fees for Java classes will be ended on 30 Sep 2011. Please ignore this if you already paid','Student','mgmt1','2011-09-01 00:00:00','2011-09-30 00:00:00','Fees Notice for Core Java batch',0,'1',1);
/*!40000 ALTER TABLE `notices` ENABLE KEYS */;


--
-- Definition of table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `PAYMENTID` int(10) unsigned NOT NULL auto_increment,
  `AMOUNT` varchar(45) NOT NULL,
  `TIME` varchar(45) NOT NULL,
  `DETAILS` varchar(255) NOT NULL,
  `APPROVED` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`PAYMENTID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;


--
-- Definition of table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `STUDENTID` int(10) unsigned NOT NULL auto_increment,
  `USERID` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DOB` datetime NOT NULL,
  `EMAILPRIMARY` varchar(255) NOT NULL,
  `EMAILSECONDARY` varchar(255) NOT NULL,
  `CONTACTNOPRIMARY` int(10) unsigned NOT NULL,
  `CONTACTNOSECONDARY` int(10) unsigned NOT NULL,
  `ADDRESS` varchar(500) NOT NULL,
  `OCCUPATION` varchar(45) NOT NULL,
  `COURSEID` int(10) unsigned NOT NULL,
  `FATHERNAME` varchar(255) NOT NULL,
  `COMPLETIONDATE` datetime NOT NULL,
  `PAYMENTID` int(10) unsigned NOT NULL,
  `STARTDATE` datetime NOT NULL,
  PRIMARY KEY  (`STUDENTID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`STUDENTID`,`USERID`,`NAME`,`DOB`,`EMAILPRIMARY`,`EMAILSECONDARY`,`CONTACTNOPRIMARY`,`CONTACTNOSECONDARY`,`ADDRESS`,`OCCUPATION`,`COURSEID`,`FATHERNAME`,`COMPLETIONDATE`,`PAYMENTID`,`STARTDATE`) VALUES 
 (1,'student1','Suresh','0000-00-00 00:00:00','suresh@gmail.com','suresh.v@yahoo.com',456567,123456789,'Hyderabad','Private Emp',1,'Mahesh','2012-12-31 00:00:00',12345678,'2010-01-01 00:00:00');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;


--
-- Definition of table `student_solutions`
--

DROP TABLE IF EXISTS `student_solutions`;
CREATE TABLE `student_solutions` (
  `SOLUTIONID` int(10) unsigned NOT NULL auto_increment,
  `FILEID` int(10) unsigned NOT NULL,
  `USERID` varchar(45) NOT NULL,
  `APPROVED` int(10) unsigned NOT NULL,
  `FEEDBACK` varchar(500) NOT NULL,
  `ANSWERFILE` varchar(45) NOT NULL,
  `SUBMITDATE` datetime NOT NULL,
  PRIMARY KEY  (`SOLUTIONID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_solutions`
--

/*!40000 ALTER TABLE `student_solutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_solutions` ENABLE KEYS */;


--
-- Definition of table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
CREATE TABLE `subjects` (
  `SUBJECTID` int(10) unsigned NOT NULL auto_increment,
  `SUBJECTNAME` varchar(500) NOT NULL,
  PRIMARY KEY  (`SUBJECTID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjects`
--

/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` (`SUBJECTID`,`SUBJECTNAME`) VALUES 
 (1,'Core Java'),
 (2,'Advanced Java'),
 (3,'Computer Graphics'),
 (4,'Artificial Intellegence'),
 (5,'Advanced computer concepts and Internet'),
 (6,'Parallel Computing'),
 (7,'Adobe Flex 3.0'),
 (8,'Action Script 3.0');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;


--
-- Definition of table `syllabus`
--

DROP TABLE IF EXISTS `syllabus`;
CREATE TABLE `syllabus` (
  `syllabusID` int(10) unsigned NOT NULL auto_increment,
  `SubjectId` int(10) unsigned NOT NULL,
  `courseID` int(10) unsigned NOT NULL,
  `syllabusfile` varchar(45) NOT NULL,
  PRIMARY KEY  (`syllabusID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `syllabus`
--

/*!40000 ALTER TABLE `syllabus` DISABLE KEYS */;
INSERT INTO `syllabus` (`syllabusID`,`SubjectId`,`courseID`,`syllabusfile`) VALUES 
 (1,1,1,'CoreJava'),
 (2,2,1,'na'),
 (3,7,4,'na'),
 (4,8,4,'na');
/*!40000 ALTER TABLE `syllabus` ENABLE KEYS */;


--
-- Definition of table `test`
--

DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `TESTID` int(10) unsigned NOT NULL auto_increment,
  `TESTTYPE` int(10) unsigned NOT NULL,
  `TESTNAME` varchar(255) NOT NULL,
  `PREREQUISITES` varchar(255) NOT NULL,
  `SYLLABUS` varchar(500) NOT NULL,
  `TESTPAPER` varchar(1000) NOT NULL,
  `TAKENBY` varchar(255) NOT NULL,
  `COURSEID` int(10) unsigned NOT NULL,
  `SUBJECTID` int(10) unsigned NOT NULL,
  `MAXMARKS` int(10) unsigned NOT NULL,
  `PASSMARKS` int(10) unsigned NOT NULL,
  `DURATION` varchar(20) NOT NULL,
  PRIMARY KEY  (`TESTID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test`
--

/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `USERID` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `LEVEL` varchar(255) NOT NULL,
  `ONLINE` smallint(5) unsigned NOT NULL default '0' COMMENT 'VCS_SCHEMA.USER.ONLINE IS ''0 offline''',
  `Blocked` int(10) unsigned NOT NULL default '0',
  `ARCHIVED` varchar(45) NOT NULL,
  `Image` varchar(45) NOT NULL,
  PRIMARY KEY  (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`USERID`,`PASSWORD`,`LEVEL`,`ONLINE`,`Blocked`,`ARCHIVED`,`Image`) VALUES 
 ('admin','admin123','3',0,0,'0','scott'),
 ('faculty1','fac123','1',0,0,'0','bratton'),
 ('mgmt1','man123','2',0,0,'0','halpert'),
 ('student1','stu123','0',0,0,'0','bernard');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
