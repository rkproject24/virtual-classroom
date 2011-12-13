package com.ignou.vcs.commons.database;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.mail.MessagingException;
import javax.sql.DataSource;

import com.ignou.vcs.commons.SendMailUsingAuthentication;
import com.ignou.vcs.commons.Utilities;
import com.ignou.vcs.commons.beans.FacultyBean;
import com.ignou.vcs.commons.beans.StudentBean;
import com.ignou.vcs.commons.beans.SubjectBean;
import com.ignou.vcs.commons.beans.UserBean;
import com.ignou.vcs.datasource.DataSourceFactory;
import com.ignou.vcs.registration.beans.CourseBean;


public class CommonsDatabaseActivities {
	
	Connection con;
	
	public CommonsDatabaseActivities()
	{
		if(con == null)
		{
			con = DataSourceFactory.getConnection();
		}
	}

	/**
	 * Method to get All Subjects corresponding to a Course.
	 * @param courseId
	 * @param getSyllabus
	 * @return
	 */
	public ArrayList getSubjects(String courseId, boolean getSyllabus) {
		ResultSet res=null;
		Statement state=null;
		ArrayList<SubjectBean> allSubjects = new ArrayList<SubjectBean>();
		String sql = "";
		
		if(getSyllabus) {
			sql = "SELECT * FROM SYLLABUS A,SUBJECTS B WHERE COURSEID = "+ courseId + " AND A.SUBJECTID=B.SUBJECTID"; 
		} else {
			sql = "SELECT B.SUBJECTID,B.SUBJECTNAME FROM SYLLABUS A,SUBJECTS B WHERE COURSEID = "+ courseId + " AND A.SUBJECTID=B.SUBJECTID";
		}
		System.out.println("Subject Query:" + sql);
		
		try {
			state=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			res=state.executeQuery(sql);
			
			while(res.next()) {
				SubjectBean subjectBean = new SubjectBean();
				
				subjectBean.setCourseId(courseId);
				subjectBean.setSubjectId(res.getString("SUBJECTID"));
				subjectBean.setSubjectName(res.getString("SUBJECTName"));
				if(getSyllabus) {
					subjectBean.setSyllabus(res.getString("syllabusfile"));
				}
				//System.out.println("Name of subject:" + subjectBean.getSubjectName());
				allSubjects.add(subjectBean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return allSubjects;
	}

	/**
	 * Method to get all details of Student
	 * @param userID
	 * @return
	 */
	public StudentBean getStudentDetails(String userID) {
		ResultSet res=null;
		Statement state=null;
		StudentBean studentBean = new StudentBean();
		String sql = "SELECT * FROM STUDENT WHERE userid='" + userID + "'";
		
		try {
			//DataSource ds = DataSourceFactory.getDataSource();
			state=con.createStatement();
			res=state.executeQuery(sql);
			
			while(res.next()) {
				studentBean.setStudentID(res.getString(1));
				studentBean.setUserID(res.getString(2));
				studentBean.setName(res.getString(3));
				//studentBean.setDob(res.getDate(4));
				studentBean.setEmailP(res.getString(5));
				studentBean.setEmailS(res.getString(6));
				studentBean.setContactP(res.getString(7));
				studentBean.setContactS(res.getString(8));
				studentBean.setAddress(res.getString(9));
				studentBean.setOccupation(res.getString(10));
				studentBean.setCourseId(res.getString(11));
				studentBean.setFatherName(res.getString(12));
				studentBean.setEndDate(res.getDate(13));
				studentBean.setPaymentId(res.getString(14));		
				studentBean.setStartDate(res.getDate(15));
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return studentBean;
	}
	
	
	/**
	 * Method to fetch generic User Information as User Level, User Name, Course ID and Subject ID
	 * @param UserID
	 * @return
	 */
	public UserBean getUserInfo(String UserID) {
		ResultSet res=null;
		Statement state=null;
		UserBean userBean = new UserBean();
		String sql = "SELECT LEVEL,IMAGE FROM USER WHERE userid='" + UserID + "'";
		//System.out.println("QUERY:" + sql);
		try {
			state=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			res=state.executeQuery(sql);
			
			while(res.next()) {
				String level = res.getString("level");
				String image = res.getString("image");
				userBean.setLevel(level);
				userBean.setImage(image); 
				String sqlQuery = "";
				String name = "";
				String courseID = "";
				String subjectID = "";
				switch(Integer.parseInt(level)) {
				case 0 : {
					sqlQuery = "SELECT name, courseid FROM STUDENT WHERE userID='" + UserID + "'";
					//System.out.println("Student Query:" + sqlQuery);
					Statement state1 = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
					ResultSet res1 = state1.executeQuery(sqlQuery);
					while(res1.next()) {
						name = res1.getString("NAME");
						//System.out.println("Name:" + name);
						courseID = res1.getString("COURSEID");
						userBean.setName(name);
						userBean.setCourseID(courseID);
					}
					break;
				}
				case 1 : {
					//System.out.println("It comes Here");
					sqlQuery = "SELECT name, courseid, subjectid FROM FACULTY WHERE userID='" + UserID + "'";
					Statement state1 = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
					ResultSet res1 = state1.executeQuery(sqlQuery);
					while(res1.next()) {
						name = res1.getString("NAME");
						courseID = res1.getString("COURSEID");
						subjectID = res1.getString("SUBJECTID");
						
					}
					break;
				}
				case 2 : {
					sqlQuery = "SELECT name FROM MANAGEMENT WHERE userID='" + UserID + "'";
					Statement state1 = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
					ResultSet res1 = state1.executeQuery(sqlQuery);
					while(res1.next()) {
						name = res1.getString("NAME");
					}
					break;
				}
				case 3 : {
					//YET TO WRITE CODE
					name = "Administrator";
				}
				default : {
					break;
				}
				}
				userBean.setName(name);
				userBean.setCourseID(courseID);
				userBean.setSubjectID(subjectID);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return userBean;
	}

	public String getCourseName(String courseID) {
		ResultSet res=null;
		Statement state=null;
		String courseName = "";
		String sql = "SELECT name FROM COURSE WHERE courseID = " + courseID;
				
		try {
			state=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			res=state.executeQuery(sql);
			
			while(res.next()) {
				courseName = res.getString("NAME");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return courseName;
	}
	
	public String getPassword(String username) {
		ResultSet res=null;
		Statement state=null;
		//ActionErrors errors = new ActionErrors();
		
		String sql = "SELECT password FROM USER WHERE userid = '" + username + "' AND BLOCKED= 0";
		String encryptedPassword = "";
		try {
			state=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			res=state.executeQuery(sql);
			
			while(res.next()) {
				encryptedPassword = res.getString("password");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Exception encountered");
			e.printStackTrace();
		}
		return encryptedPassword;
	}
	
	public ArrayList getAllSubjects()
	{
		ResultSet rs=null;
		Statement state=null;
		ArrayList<SubjectBean> subject_list = new ArrayList<SubjectBean>();
		
		try {
			String sql = "SELECT SUBJECTNAME,SUBJECTID FROM SUBJECTS";
			state=con.createStatement();
			rs = state.executeQuery(sql);
		
			while(rs.next())
			{
				SubjectBean subBean = new SubjectBean();
				
				subBean.setSubjectName(rs.getString("subjectname"));
				subBean.setSubjectId(rs.getString("subjectid"));
				subject_list.add(subBean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return subject_list;
	}
	
	public void updatePassword(String userId, String newPassword) {
		Statement state=null;
		
		try {
			String sql = "UPDATE USER SET PASSWORD='" + newPassword + "' WHERE userID='" + userId + "'";
			state=con.createStatement();
			state.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public String generateId(String password,int level)
	{
		String sql="";
		String id1="";
		String idLevel="";
		int max;
		ResultSet res=null;
		Statement state=null;
		Statement state1=null;
		if(level==0)
		{
			sql="SELECT USERID FROM USER WHERE USERID LIKE 'STU%'";
		}
		else if(level==1)
		{
			sql="SELECT USERID FROM USER WHERE USERID LIKE 'FAC%'";
		}
		else if(level==2)
		{
			sql="SELECT USERID FROM USER WHERE USERID LIKE 'MGT%'";
		}
		System.out.println(sql);
		ArrayList userid=new ArrayList();
		// Extracting the userid's to an arraylist
		try {
			state=con.createStatement();
			res=state.executeQuery(sql);
			
			while(res.next()) {
				String userId = res.getString("USERID");
				System.out.println(userId);
				int length=userId.length();
				int id=Integer.parseInt(userId.substring(3,length));
				idLevel=(userId.substring(0,3));
				System.out.println("idLevel in while block:"+idLevel);
				userid.add(id);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int length=userid.size();
		max=(Integer)userid.get(0);
		for(int j=1;j<length;j++)
		{
			
			if(max<((Integer)userid.get(j)))
			{
				max=(Integer)userid.get(j);
				System.out.println(max);
			}
		}
		max=max+1;
		System.out.println(max);
		System.out.println("idLevel outside while block:"+idLevel);
		id1=idLevel+max;	
		System.out.println(id1);
		String sql1="INSERT INTO USER (USERID,PASSWORD,LEVEL) VALUES('"+id1+"','"+password+"',"+level+")";
		
		try {
			state1=con.createStatement();
			state1.execute(sql1);
			}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id1;
	}
	
	public String getSubjectName(String subjectid)
	{
		ResultSet res=null;
		Statement state=null;
		int isubjectid = 0;
		try {
			isubjectid = Integer.parseInt(subjectid);
		} catch (NumberFormatException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String subjectname = "";
		
		try {
			String sql = "SELECT SUBJECTNAME FROM SUBJECTS WHERE SUBJECTID = " + isubjectid;
			System.out.println(sql);
			state=con.createStatement();
			ResultSet rs = state.executeQuery(sql);
		
			while(rs.next())
			{
				subjectname = rs.getString("subjectname");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("SUBJect name:" + subjectname);
		return subjectname;
	}

	/*public void backupDatabase() {
		try {
			System.out.println("It comes here");
			RunDB2Script run = new RunDB2Script("C:\\db2backup.db2");
			run.run();
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/
	
	public ArrayList<StudentBean> getStudents(String courseId) {
		ResultSet res=null;
		Statement state=null;
		ArrayList allStudents = new ArrayList<StudentBean>();
		try {
			String sql = "SELECT USERID,NAME,DOB,EMAILPRIMARY,CONTACTNOPRIMARY,STARTDATE,COMPLETIONDATE FROM STUDENT WHERE COURSEID = " + courseId;
			System.out.println(sql);
			state=con.createStatement();
			ResultSet rs = state.executeQuery(sql);
		
			while(rs.next())
			{
				StudentBean studentBean = new StudentBean();
				String userID = rs.getString(1);
				System.out.println("From Db:" + userID);
				studentBean.setUserID(rs.getString(1));
				studentBean.setName(rs.getString(2));
				studentBean.setDob(rs.getDate(3));
				studentBean.setEmailP(rs.getString(4));
				studentBean.setContactP(rs.getString(5));
				studentBean.setStartDate(rs.getDate(6));
				studentBean.setEndDate(rs.getDate(7));
				
				allStudents.add(studentBean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return allStudents;
		
	}
	
	
	public ArrayList<FacultyBean> getFaculties(String subjectId) {
		ResultSet res=null;
		Statement state=null;
		ArrayList allFaculties = new ArrayList<FacultyBean>();
		try {
			String sql = "SELECT USERID,NAME,DOB,EMAILPRIMARY,CONTACTNOPRIMARY,QUALIFICATION,COURSEID FROM FACULTY WHERE SUBJECTID = " + subjectId;
			System.out.println(sql);
			state=con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			CommonsDatabaseActivities obj = new CommonsDatabaseActivities();
			
			while(rs.next())
			{
				FacultyBean facultyBean = new FacultyBean();
				String userID = rs.getString("userID");
				System.out.println("From Db:" + userID);
				facultyBean.setUserID(rs.getString("userID"));
				facultyBean.setName(rs.getString("name"));
				facultyBean.setDob(rs.getString("dob"));
				facultyBean.setEmailP(rs.getString("emailPrimary"));
				facultyBean.setContactP(rs.getString("contactNoPrimary"));
				facultyBean.setQualification(rs.getString("qualification"));
				String courseID = rs.getString("courseID");
				String courseNames = "";
				Utilities util = new Utilities();
				ArrayList<String> courses = (ArrayList<String>)util.getSeparateValue(courseID);
				courseNames = obj.getCourseName(courses.get(0));
				for(int i = 1 ; i < courses.size(); i++) {
					
					courseNames = courseNames + " , " + obj.getCourseName(courses.get(i));
				}
				facultyBean.setCourseID(courseNames);
				allFaculties.add(facultyBean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return allFaculties;
	}
	
	/**
	 * Method to block a user
	 * @param userId UserId of user to be blocked
	 */
	public void blockUser(String userId) {
		Statement state=null;
		
		try {
			String sql = "UPDATE USER SET BLOCKED = 1 WHERE USERID = '" + userId + "'";
			System.out.println(sql);
			state=con.createStatement();
			state.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * Method to get list of users who have to be archived.
	 * @return
	 */
	public ArrayList getUsersToBeArchived() {
		Statement state=null;
		ResultSet res = null;
		Utilities util = new Utilities();
		String currDate = util.getCurrentDateInDB2Format();
		ArrayList<StudentBean> allStudents = new ArrayList<StudentBean>();
		
		try {
			String sql = "SELECT A.NAME,A.COMPLETIONDATE FROM STUDENT A  WHERE A.COMPLETIONDATE < '" + currDate + "'  AND A.USERID IN( SELECT B.USERID FROM USER B WHERE B.ARCHIVED = 0)";
			System.out.println(sql);
			state=con.createStatement();
			res = state.executeQuery(sql);
		
			while(res.next()) {
				StudentBean studentBean = new StudentBean();
				studentBean.setName(res.getString("name"));
				studentBean.setEndDate(res.getDate("completionDate"));
				allStudents.add(studentBean);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return allStudents;
	}
	
	/**
	 * Method to archive all Students whose Course Completion Date has passed.
	 *
	 */
	public void archiveUsers() {
		Statement state=null;
		Utilities util = new Utilities();
		String currDate = util.getCurrentDateInDB2Format();
		try {
			String sql = "UPDATE USER SET ARCHIVED = 1 WHERE USERID IN (SELECT USERID FROM STUDENT WHERE COMPLETIONDATE < '" + currDate + "')";
			System.out.println(sql);
			state=con.createStatement();
			state.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public boolean isArchived(String userId) {
		Statement state=null;
		ResultSet res = null;
		boolean archived = false;
		try {
			String sql = "SELECT ARCHIVED FROM USER WHERE USERID='" + userId + "'";
			System.out.println(sql);
			state=con.createStatement();
			res = state.executeQuery(sql);
			
			while(res.next()) {
				if (res.getString("archived").equals("1")) {
					archived = true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return archived;
	}
	
	public ArrayList getReport(String courseId,String studentId){
		ArrayList allSubject = new ArrayList();
		ArrayList test = new ArrayList();
		
		com.ignou.vcs.commons.database.CommonsDatabaseActivities dbObj = new com.ignou.vcs.commons.database.CommonsDatabaseActivities();
		com.ignou.vcs.report.database.ReportDatabaseActivities dbObj1 = new com.ignou.vcs.report.database.ReportDatabaseActivities();
		//com.ignou.vcs.report.beans.testBean testBean = new com.ignou.vcs.report.beans.testBean();
		//.mshome.vcs.report.beans.TestReport report= new com.ignou.vcs.report.beans.TestReport();
		//com.ignou.vcs.commons.beans.SubjectBean subjectBean = new com.ignou.vcs.commons.beans.SubjectBean();
		
		allSubject = dbObj.getSubjects(courseId,false);	
		String marks="";
		int testId;
		String id="";
		
		
		for(int i=0;i<allSubject.size();i++)
		{
			com.ignou.vcs.commons.beans.generateReport generateReport = new com.ignou.vcs.commons.beans.generateReport();
			com.ignou.vcs.commons.beans.SubjectBean subjectBean = (com.ignou.vcs.commons.beans.SubjectBean)allSubject.get(i);
			String subjectId = subjectBean.getSubjectId();
			System.out.println(i+"subjectname=" +subjectBean.getSubjectName());
			generateReport.setSubjectName(subjectBean.getSubjectName());
			
			com.ignou.vcs.report.beans.testBean testBean = dbObj1.getMajorTest(courseId,subjectId);
			System.out.println(i+"maxmarks=" +testBean.getMaxMarks());
			generateReport.setMaxMarks(testBean.getMaxMarks());
			System.out.println(i+"highestmarks=" +testBean.getHighestMarks());
			generateReport.setHighestMarks(testBean.getHighestMarks());
			System.out.println(i+"testid=" +testBean.getTestId());
			generateReport.setTestId(testBean.getTestId());
			
			testId = testBean.getTestId();
			id = Integer.toString(testId);
			System.out.println("testID in string form" +testId);
			//marks = dbObj1.getTotalMarks(studentId,id);
			//int m = Integer.parseInt(marks);
			
			marks = dbObj1.getTotalMarks(studentId,id);
			System.out.println(i+"totalmarks=" +marks);
			generateReport.setTotalMarks(marks);
			test.add(generateReport);
		}
		
		return test;
	}
	
 public ArrayList getNews()
 {
	 ArrayList list = new ArrayList();
	 Statement state=null;
	 ResultSet res = null;
	 String sql="";
	 try{
		 
		 sql = "SELECT * FROM NEWS";
		 state=con.createStatement();
		 res=state.executeQuery(sql);
		 while(res.next()){
		 com.ignou.vcs.commons.beans.NewsBean news = new com.ignou.vcs.commons.beans.NewsBean();
		 news.setNewsId(res.getInt("NEWSID"));
		 news.setSubject(res.getString("SUBJECT"));
		 news.setDescription(res.getString("DESCRIPTION"));
		 news.setDate(res.getString("DATE"));
		 
		 list.add(news);
		}
	 }
	 	catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
 }
 
	public static void main(String args[]) {
		CommonsDatabaseActivities obj = new CommonsDatabaseActivities();
	//	bj.backupDatabase("C:\\");
	}

}
