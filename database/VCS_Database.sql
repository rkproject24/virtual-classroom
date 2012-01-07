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
-- Definition of table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `COMMENTID` int(10) unsigned NOT NULL auto_increment,
  `COMMENTDESCRIPTION` varchar(600) NOT NULL,
  `POSTID` int(10) unsigned NOT NULL,
  `COMMENTEDBY` varchar(80) NOT NULL,
  `COMMENTEDDATE` datetime NOT NULL,
  `COMMENTSTATUS` varchar(10) NOT NULL,
  PRIMARY KEY  (`COMMENTID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` (`COMMENTID`,`COMMENTDESCRIPTION`,`POSTID`,`COMMENTEDBY`,`COMMENTEDDATE`,`COMMENTSTATUS`) VALUES 
 (1,'sdfhkjdfs',3,'student1','2011-12-31 00:00:00','active');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` (`COURSEID`,`NAME`,`DURATION`,`FEES`) VALUES 
 (1,'Java',1,'2000'),
 (2,'Dotnet',1,'3000'),
 (3,'Oracle',1,'200'),
 (4,'Adobe Flex',2,'200'),
 (5,'sd',0,''),
 (6,'SAP',2,'10000');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `discussion`
--

/*!40000 ALTER TABLE `discussion` DISABLE KEYS */;
INSERT INTO `discussion` (`DISCUSSIONID`,`ORGANIZEDBY`,`ORGANIZEDFOR`,`COURSEID`,`SUBJECTID`,`TITLE`,`DATE`,`DURATION`) VALUES 
 (1,'admin','Java Students','1|2','1','Core Java','2011-08-23 00:00:00',2),
 (2,'mgmt1','student','null','null','sadfksj','2001-12-12 00:00:00',1);
/*!40000 ALTER TABLE `discussion` ENABLE KEYS */;


--
-- Definition of table `exams`
--

DROP TABLE IF EXISTS `exams`;
CREATE TABLE `exams` (
  `examId` int(10) unsigned NOT NULL auto_increment,
  `examName` varchar(100) NOT NULL,
  `subjectId` int(10) unsigned NOT NULL,
  `courseId` int(10) unsigned NOT NULL,
  `questionIds` varchar(500) NOT NULL,
  `maxMarks` int(10) unsigned NOT NULL,
  `passMarks` int(10) unsigned NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `examAppovalComments` varchar(200) NOT NULL,
  `examAppovalStatus` int(10) unsigned NOT NULL,
  `examCreatedBy` varchar(100) character set latin1 collate latin1_bin NOT NULL,
  `examCreationDate` datetime NOT NULL,
  `approvedBy` varchar(100) NOT NULL,
  `approvalDate` datetime NOT NULL,
  PRIMARY KEY  (`examId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exams`
--

/*!40000 ALTER TABLE `exams` DISABLE KEYS */;
INSERT INTO `exams` (`examId`,`examName`,`subjectId`,`courseId`,`questionIds`,`maxMarks`,`passMarks`,`duration`,`examAppovalComments`,`examAppovalStatus`,`examCreatedBy`,`examCreationDate`,`approvedBy`,`approvalDate`) VALUES 
 (1,'Core Java Exam',1,1,'4|5|6',3,2,3,'',0,0x666163756C747931,'2012-01-01 00:00:00','mgmt1','2012-01-03 00:00:00');
/*!40000 ALTER TABLE `exams` ENABLE KEYS */;


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
  `syllabus` varchar(500) NOT NULL,
  PRIMARY KEY  (`FILEID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `files`
--

/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` (`FILEID`,`TITLE`,`DESCRIPTION`,`UPLOADEDBY`,`TOPICS`,`FILETYPE`,`SOLUTIONFILE`,`UPLOADEDTO`,`COURSEID`,`SUBJECTID`,`UPLOADDATE`,`FilePath`,`Image`,`syllabus`) VALUES 
 (1,'CoreJava','Java File','admin','Java',0,'NA','0','1','1','2007-12-30 00:00:00','Creek.jpg','Creek.jpg',''),
 (2,'Advanced Java','Java','admin','Java,|J2EE',0,'NA','0','1','2','2007-12-30 00:00:00','Forest.jpg','Forest.jpg',''),
 (3,'core java','core java file','admin','java',1,'NA','0','1','1','2007-12-30 00:00:00','Forest.jpg','Forest.jpg',''),
 (4,'xznvmsbn','nagkjkj','faculty1','agk',1,'','0','1','1','2011-12-12 00:00:00','4.mov','4.jpg',''),
 (5,'testing','fbhbhj','faculty1','jv',1,'','0','1','1','2011-12-12 00:00:00','5.mov','5.jpg',''),
 (6,'dsfjahk','dshkghksdhk','faculty1','hjka',0,'','0','1','1','2011-12-13 00:00:00','6.mov','6.jpg','');
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
 (1,'Fees','This is informed that the last day for paying the fees for Java classes will be ended on 30 Sep 2011. Please ignore this if you already paid','Student','mgmt1','2011-09-01 00:00:00','2011-09-30 00:00:00','Fees Notice for Core Java batch',1,'1',1);
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
-- Definition of table `polls`
--

DROP TABLE IF EXISTS `polls`;
CREATE TABLE `polls` (
  `POLLID` int(10) unsigned NOT NULL auto_increment,
  `POLLQUESTION` varchar(100) NOT NULL,
  `POLLOPTIONS` varchar(800) NOT NULL,
  `CREATEDBY` varchar(80) NOT NULL,
  `CREATIONDATE` datetime NOT NULL,
  `status` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`POLLID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `polls`
--

/*!40000 ALTER TABLE `polls` DISABLE KEYS */;
INSERT INTO `polls` (`POLLID`,`POLLQUESTION`,`POLLOPTIONS`,`CREATEDBY`,`CREATIONDATE`,`status`) VALUES 
 (1,'question1','option1|option2|option3|option4','admin','2011-12-12 00:00:00',0),
 (2,'Which is the most important element for an afterschool program to have (pick one)','|||||||','S Pradeepthi','2011-12-18 00:00:00',1),
 (3,'gfdhgf dfhh','sdf|gfdsg|gds|gs','S Pradeepthi','2011-12-18 00:00:00',1);
/*!40000 ALTER TABLE `polls` ENABLE KEYS */;


--
-- Definition of table `pollstatus`
--

DROP TABLE IF EXISTS `pollstatus`;
CREATE TABLE `pollstatus` (
  `ANSWERID` int(10) unsigned NOT NULL auto_increment,
  `POLLID` int(10) unsigned NOT NULL,
  `SELECTEDOPTION` varchar(100) NOT NULL,
  `SELECTIONBY` varchar(80) NOT NULL,
  `SELECTIONDATE` datetime NOT NULL,
  PRIMARY KEY  (`ANSWERID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pollstatus`
--

/*!40000 ALTER TABLE `pollstatus` DISABLE KEYS */;
INSERT INTO `pollstatus` (`ANSWERID`,`POLLID`,`SELECTEDOPTION`,`SELECTIONBY`,`SELECTIONDATE`) VALUES 
 (1,1,'option2','Suresh','2011-12-17 00:00:00');
/*!40000 ALTER TABLE `pollstatus` ENABLE KEYS */;


--
-- Definition of table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `POSTID` int(10) unsigned NOT NULL auto_increment,
  `POSTTITLE` varchar(100) NOT NULL,
  `POSTDESCRIPTION` varchar(600) NOT NULL,
  `SUBJECTID` int(10) unsigned NOT NULL,
  `POSTEDBY` varchar(80) NOT NULL,
  `POSTEDDATE` datetime NOT NULL,
  `POSTSTATUS` varchar(10) NOT NULL,
  PRIMARY KEY  (`POSTID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`POSTID`,`POSTTITLE`,`POSTDESCRIPTION`,`SUBJECTID`,`POSTEDBY`,`POSTEDDATE`,`POSTSTATUS`) VALUES 
 (1,'help me please on java project','Hi i am doing so anso....',1,'student1','2011-12-17 00:00:00','active'),
 (2,'sdtdg','esyery4',1,'student1','2011-12-31 00:00:00','active'),
 (3,'testpost','fdsgkjds',2,'student1','2011-12-31 00:00:00','active');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;


--
-- Definition of table `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `questionId` int(10) unsigned NOT NULL auto_increment,
  `subjectId` int(10) unsigned NOT NULL,
  `courseId` int(10) unsigned NOT NULL,
  `questiontype` int(10) unsigned NOT NULL,
  `question` varchar(1000) NOT NULL,
  `options` varchar(1000) NOT NULL,
  `correctAnswer` varchar(500) NOT NULL,
  `marks` int(10) unsigned NOT NULL,
  `explanation` varchar(500) default NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `updatedBy` varchar(500) NOT NULL,
  `updatedDate` datetime NOT NULL,
  PRIMARY KEY  (`questionId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` (`questionId`,`subjectId`,`courseId`,`questiontype`,`question`,`options`,`correctAnswer`,`marks`,`explanation`,`createdBy`,`createdDate`,`updatedBy`,`updatedDate`) VALUES 
 (1,1,1,1,'Which one of these lists contains only Java programming language keywords?','class, if, void, long, Int, continue| goto, instanceof, native, finally, default, throws| try, virtual, throw, final, volatile, transient |strictfp, constant, super, implements, do|byte, break, assert, switch, include','class, if, void, long, Int, continue',1,NULL,'admin','2011-11-18 00:00:00','faculty1','2012-01-01 00:00:00'),
 (2,1,1,1,'Which will legally declare, construct, and initialize an array?','int [] myList = {\"1\", \"2\", \"3\"};|int [] myList = (5, 8, 2);|int myList [] [] = {4,9,7,0};|int myList [] = {4, 3, 7};','int myList [] = {4, 3, 7};',1,NULL,'admin','2011-11-18 00:00:00','admin','2011-11-18 00:00:00'),
 (3,1,1,1,'Which is a reserved word in the Java programming language?','method|	native|subclasses|reference|array','native',1,NULL,'admin','2011-11-18 00:00:00','admin','2011-11-18 00:00:00'),
 (4,1,1,1,'Which is a valid keyword in java?','interface|string|Float|unsigned','interface',1,NULL,'admin','2011-11-18 00:00:00','admin','2011-11-18 00:00:00'),
 (5,1,1,1,'Which one of the following will declare an array and initialize it with five numbers?','Array a = new Array(5);|int [] a = {23,22,21,20,19};|int a [] = new int[5];|int [5] array;','int [] a = {23,22,21,20,19};',1,NULL,'admin','2011-11-24 00:00:00','admin','2011-11-18 00:00:00'),
 (6,1,1,1,'Which is the valid declarations within an interface definition?','public double methoda();|public final double methoda();|static void methoda(double d1);|protected void methoda(double d1);','public double methoda();',1,NULL,'admin','2011-11-24 00:00:00','admin','2011-11-24 00:00:00'),
 (7,1,1,1,'Which one is a valid declaration of a boolean?','boolean b1 = 0;|boolean b2 = \'false\';|boolean b3 = false;|boolean b4 \r\r\n= Boolean.false();|boolean b5 = no;','boolean b3 = false;',1,NULL,'admin','2011-11-24 00:00:00','admin','2011-11-24 00:00:00'),
 (8,1,1,1,'Which is a valid declarations of a String?','String s1 = null;|String s2 = \'null\';|String s3 = (String) \'abc\';|String s4 = (String) \'\\ufeed\';','String s1 = null;',1,NULL,'admin','2011-11-24 00:00:00','admin','2011-11-24 00:00:00'),
 (9,1,1,1,'Suppose that you would like to create an instance of a new Map that has an iteration order that is the same as the iteration order of an existing instance of a Map. Which concrete implementation of the Map interface should be used for the new insta','TreeMap|HashMap|LinkedHashMap|The answer depends on the implementation of the existing instance.','LinkedHashMap',1,NULL,'admin','2011-11-24 00:00:00','admin','2011-11-24 00:00:00'),
 (10,1,1,1,'Which class does not override the equals() and hashCode() methods, inheriting them directly from class Object?','java.lang.String|java.lang.Double|java.lang.StringBuffer|java.lang.Character','java.lang.StringBuffer',1,NULL,'admin','2011-11-24 00:00:00','admin','2011-11-24 00:00:00'),
 (11,1,1,1,'Which collection class allows you to grow or shrink its size and provides indexed access to its elements, but whose methods are not synchronized?','java.util.HashSet|java.util.LinkedHashSet|java.util.List|java.util.ArrayList','java.util.ArrayList',1,NULL,'admin','2011-11-24 00:00:00','admin','2011-11-24 00:00:00'),
 (12,1,1,1,'You need to store elements in a collection that guarantees that no duplicates are stored and all elements can be accessed in natural order. Which interface provides that capability?','java.util.Map|java.util.Set|java.util.List|java.util.Collection','java.util.Set',1,NULL,'admin','2011-11-24 00:00:00','admin','2011-11-24 00:00:00'),
 (13,4,1,1,'The DBMS acts as an interface between what two components of an enterprise-class database system?','Database application and the database|Data and the database|The user and the database application|Database application and SQL','Database application and the database',1,NULL,'admin','2011-11-24 00:00:00','admin','2011-11-24 00:00:00'),
 (14,4,1,1,'Which of the following projects illustrates a database being designed from existing data?','Database using the Production Department\'s spreadsheets|A database designed to produce production reports for a new Production Department manufacturing process|A database that will combine two databases currently used by the Production Department|None of the above is correct.','A database using the Production Department\'s spreadsheets',1,NULL,'admin','2011-11-24 00:00:00','admin','2011-11-24 00:00:00'),
 (15,4,1,1,'Which of the following projects illustrates a database being designed as a new systems development project?','A database using the Production Department\'s spreadsheets|A database designed to produce production reports for a new Production Department manufacturing process|A database that will combine two databases currently used by the Production Department|None of the above is correct.','A database designed to produce production reports for a new Production Department manufacturing process',1,NULL,'admin','2011-11-24 00:00:00','admin','2011-11-24 00:00:00'),
 (16,4,1,1,'Which of the following products was an early implementation of the relational model developed by E.F. Codd of IBM?','IDMS|DB2|dBase-II|R:base','DB2',1,NULL,'admin','2011-11-24 00:00:00','admin','2011-11-24 00:00:00'),
 (17,4,1,1,'The following are components of a database except ________','user data|metadata|reports|indexes','reports',1,NULL,'admn','2011-11-24 00:00:00','admin','2011-11-24 00:00:00'),
 (18,4,1,1,'Which of the following projects illustrates a database being designed as a redesign of an existing database?','A database using the Production Department\'s spreadsheet|A database designed to produce production reports for a new Production Department manufacturing process|A database that will combine two databases currently used by the Production Department|None of the above is correct.','A database that will combine two databases currently used by the Production Department',1,NULL,'admin','2011-11-24 00:00:00','admin','2011-11-24 00:00:00'),
 (19,4,2,1,'SQL stands for ________ .','Structured Query Language|Sequential Query Language|Structured Question Language Sequential Question Language','Structured Query Language',1,NULL,'admin','2011-11-24 00:00:00','admin','2011-11-24 00:00:00'),
 (20,4,2,1,'Because it contains a description of its own structure, a database is considered to be ________ .','described|metadata compatible|self-describing|an application program','self-describing',1,NULL,'admin','2011-11-24 00:00:00','admin','2011-11-24 00:00:00');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;


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
 (1,'student1','Suresh','1984-07-27 00:00:00','venu.2703@gmail.com','suresh.v@yahoo.com',123456789,123456789,'afdsjfd','Private Emp',1,'Mahesh','2012-12-31 00:00:00',12345678,'2010-01-01 00:00:00');
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
-- Definition of table `studentexamstatus`
--

DROP TABLE IF EXISTS `studentexamstatus`;
CREATE TABLE `studentexamstatus` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `examId` int(10) unsigned NOT NULL,
  `subjectId` int(10) unsigned NOT NULL,
  `courseId` int(10) unsigned NOT NULL,
  `userId` varchar(100) NOT NULL,
  `score` int(10) unsigned NOT NULL,
  `result` varchar(25) NOT NULL,
  `completionDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studentexamstatus`
--

/*!40000 ALTER TABLE `studentexamstatus` DISABLE KEYS */;
INSERT INTO `studentexamstatus` (`id`,`examId`,`subjectId`,`courseId`,`userId`,`score`,`result`,`completionDate`) VALUES 
 (1,1,1,1,'student1',0,'enrolled','2012-01-08 00:00:00');
/*!40000 ALTER TABLE `studentexamstatus` ENABLE KEYS */;


--
-- Definition of table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
CREATE TABLE `subjects` (
  `SUBJECTID` int(10) unsigned NOT NULL auto_increment,
  `SUBJECTNAME` varchar(500) NOT NULL,
  PRIMARY KEY  (`SUBJECTID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

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
 (8,'Action Script 3.0'),
 (9,'SAP');
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
 (2,2,1,'AdvJava'),
 (3,7,4,'Flex3'),
 (4,8,4,'ActionScript3');
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

