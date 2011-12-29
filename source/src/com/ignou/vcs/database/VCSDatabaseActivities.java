package com.ignou.vcs.database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.ignou.vcs.beans.SubjectBean;
import com.ignou.vcs.beans.courseBean;
import com.ignou.vcs.commons.*;
import com.ignou.vcs.datasource.DataSourceFactory;
import com.ignou.vcs.forms.AddnewsForm;
import com.ignou.vcs.forms.Test;
import com.ignou.vcs.notices.beans.Notice;

public class VCSDatabaseActivities {
	
	Connection con = null;
	
	public VCSDatabaseActivities()
	{
		if(con==null)
		{
			con = DataSourceFactory.getConnection();
		}
	}

	/**
	 * Function to upload Test to a database.
	 * @param form
	 * @param subjectid
	 * @return testid of inserted test
	 * @author Pradeepthi S
	 */
	public String uploadTest(com.ignou.vcs.forms.Test form,int subjectid,String facultyid) {
		ResultSet res = null;
		Statement state = null;
		Statement stmt = null;
		Statement stmt1 = null;
		ResultSet res1 = null;
		
		String test_name = form.getTest_name();
		String course = form.getCourse();
		String prereq = form.getPrereq();
		String syllabus = form.getSyllabus();
		String course_id = "";
		String time = form.getTime(); 
		int pass_marks = form.getPass_marks();
		int max_marks = form.getMax_marks();
		String testid = "";
		int test_type = 0;
		
		
		System.out.println("CourSENMAE :" + course + " " + prereq);
		try {
			if(prereq == null)
				test_type = 1;
			else
				test_type = 0;
			
			String sql2 = "select courseid from COURSE where name LIKE '"
				+ course + "'";
			System.out.println(sql2);
			stmt1 = con.createStatement();
			res1 = stmt1.executeQuery(sql2);
			while(res1.next())
			{
				course_id = res1.getString("courseid");
			}
			state = con.createStatement();
			String sql = "insert into TEST(testtype,testname,prerequisites,syllabus,testpaper,takenby,courseid,subjectid,maxmarks,passmarks,duration) values("+ test_type + ",'"
				+ test_name
				+ "','"
				+ prereq
				+ "','"
				+ syllabus
				+ "',null,'"
				+ facultyid
				+ "',"+ course + ","+ subjectid+","
				+ max_marks
				+ ","
				+ pass_marks +
				",' "+ time + "')";
			System.out.println(sql);
			int rowsAffected = state.executeUpdate(sql);
			String sql1 = "select testid from TEST where testname = '"
					+ test_name + "'";

			stmt = con.createStatement();
			res = stmt.executeQuery(sql1);
			while (res.next()) {
				testid = res.getString("testid");

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return testid;
	}
	public void insertXML(String xmlDoc,String testid)
	{
		int testid1 = Integer.parseInt(testid);
		ResultSet res=null;
		Statement state=null;
		
			try {
				String sql = "update TEST set testpaper = '" + xmlDoc + "' where testid = " +  testid1;
				System.out.println(sql);
				state=con.createStatement();
				int rowsAffected = state.executeUpdate(sql);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
	public ArrayList getTest(String subjectid,String courseid)
	{
		ArrayList testList = new ArrayList();
		ResultSet res=null;
		Statement state=null;
		String testname = "";
		String testtype = "";
		String prerequisites = "";
		String syllabus = "";
		String takenby = "";
		String maxmarks = "";
		String passmarks = "";
		String duration = "";
		String testid;
			try {
				String sql = "select * from TEST where courseid = " + courseid + " and subjectid = " + subjectid;
				System.out.println(sql);
				state=con.createStatement();
				res = state.executeQuery(sql);
			
				while(res.next())
				{
					com.ignou.vcs.beans.getTests test_obj = new com.ignou.vcs.beans.getTests();
					testid = res.getString("testid"); 
					testname = res.getString("testname");
					 testtype = res.getString("testtype");
					 prerequisites = res.getString("prerequisites");
					 syllabus = res.getString("syllabus");
					 takenby = res.getString("takenby");
					 maxmarks = res.getString("maxmarks");
					 passmarks = res.getString("passmarks");
					 duration = res.getString("duration");
					 	test_obj.setTestid(testid);	
					 	test_obj.setTest_type(testtype);
						test_obj.setTest_name(testname);
						test_obj.setTaken_by(takenby);
						test_obj.setSyllabus(syllabus);
						test_obj.setPrereq(prerequisites);
						test_obj.setMax_marks(maxmarks);
						test_obj.setPass_marks(passmarks);
						test_obj.setDuration(duration);
						testList.add(test_obj);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return testList;
	}
	
	public com.ignou.vcs.beans.StudentBean getStudentDetails(String userID) {
		ResultSet res=null;
		Statement state=null;
		com.ignou.vcs.beans.StudentBean studentBean = new com.ignou.vcs.beans.StudentBean();
		String sql = "SELECT * FROM STUDENT WHERE userid='" + userID + "'";
		
		try {
			state=con.createStatement();
			res=state.executeQuery(sql);
			
			while(res.next()) {
				studentBean.setStudentID(res.getString("studentID"));
				studentBean.setUserID(res.getString("userID"));
				studentBean.setName(res.getString("name"));
				//studentBean.setDob(res.getDate("dob"));
				studentBean.setEmailP(res.getString("emailprimary"));
				studentBean.setEmailS(res.getString("emailsecondary"));
				studentBean.setContactP(res.getString("contactnoprimary"));
				studentBean.setContactS(res.getString("CONTACTNOSECONDARY"));
				studentBean.setAddress(res.getString("address"));
				studentBean.setFatherName(res.getString("fatherName"));
				studentBean.setOccupation(res.getString("occupation"));
				System.out.println("course id : " + res.getString("courseid"));
				studentBean.setCourseId(res.getString("courseid"));
				studentBean.setStartDate(res.getDate("startdate").toString());
				studentBean.setEndDate(res.getDate("completiondate").toString());
				studentBean.setPaymentId(res.getString("paymentID"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return studentBean;
	}
	
	public com.ignou.vcs.beans.FacultyBean getFacultyDetails(String userID) {
		ResultSet res=null;
		Statement state=null;
		com.ignou.vcs.beans.FacultyBean facultyBean = new com.ignou.vcs.beans.FacultyBean();
		String sql = "SELECT * FROM FACULTY WHERE userid='" + userID + "'";
		System.out.println("sql :" + sql);
		try {
			state=con.createStatement();
			res=state.executeQuery(sql);
			
			while(res.next()) {
				facultyBean.setFacultyID(res.getString("facultyID"));
				facultyBean.setUserID(res.getString("userID"));
				facultyBean.setName(res.getString("name"));
				facultyBean.setDob(res.getString("dob"));
				facultyBean.setEmailP(res.getString("emailprimary"));
				facultyBean.setEmailS(res.getString("emailsecondary"));
				facultyBean.setContactP(res.getString("contactnoprimary"));
				facultyBean.setContactS(res.getString("contactnosecondary"));
				facultyBean.setAddress(res.getString("address"));
				facultyBean.setQualification(res.getString("qualification"));
				facultyBean.setAppointedBy(res.getString("appointedby"));
				facultyBean.setCourseID(res.getString("courseid"));
				facultyBean.setSubjectID(res.getString("subjectid"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return facultyBean;
	}
	
	public com.ignou.vcs.beans.MgmtBean getMgmDetails(String userID) {
		ResultSet res=null;
		Statement state=null;
		com.ignou.vcs.beans.MgmtBean managementbean = new com.ignou.vcs.beans.MgmtBean();
		String sql = "SELECT * FROM MANAGEMENT WHERE userid='" + userID + "'";
		System.out.println("sql :" + sql);
		try {
			state=con.createStatement();
			res=state.executeQuery(sql);
			
			while(res.next()) {
				managementbean.setMgmtID(res.getString("managementid"));
				managementbean.setUserID(res.getString("userid"));
				managementbean.setName(res.getString("name"));
				managementbean.setDob(res.getString("dob"));
				managementbean.setEmailP(res.getString("emailp"));
				managementbean.setEmailS(res.getString("emails"));
				managementbean.setContactP(res.getString("contactp"));
				managementbean.setContactS(res.getString("contacts"));
				managementbean.setAddress(res.getString("address"));
				managementbean.setDesignation(res.getString("designation"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return managementbean;
	}
	public ArrayList getSubjects(String courseId, boolean getSyllabus) {
		ResultSet res=null;
		Statement state=null;
		ArrayList allSubjects = new ArrayList();
		String sql = "";
		
		if(getSyllabus) {
			sql = "SELECT * FROM SYLLABUS A,SUBJECTS B WHERE COURSEID = "+ courseId + " AND A.SUBJECTID=B.SUBJECTID"; 
		} else {
			sql = "SELECT B.SUBJECTID,B.SUBJECTNAME FROM SYLLABUS A,SUBJECTS B WHERE COURSEID = "+ courseId + " AND A.SUBJECTID=B.SUBJECTID";
		}
		System.out.println("Subject Query:" + sql);
		
		try {
			state=con.createStatement();
			res=state.executeQuery(sql);
			
			while(res.next()) {
				com.ignou.vcs.beans.SubjectBean subjectBean = new com.ignou.vcs.beans.SubjectBean();
				subjectBean.setCourseId(courseId);
				subjectBean.setSubjectId(res.getString("SUBJECTID"));
				subjectBean.setSubjectName(res.getString("SUBJECTName"));
				allSubjects.add(subjectBean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return allSubjects;
	}

	public ArrayList getPaper(String testid)
	{
		ArrayList paper = new ArrayList();
		ArrayList ques_list = new ArrayList();
		ArrayList marks_list = new ArrayList();
		ResultSet res=null;
		Statement state=null;
		int iTestid = Integer.parseInt(testid);
		
		try {
			String sql = "SELECT TESTPAPER FROM TEST WHERE testid=" + iTestid;
			state = con.createStatement();
			res = state.executeQuery(sql);
		
			while(res.next())
			{
				 com.ibm.db2.jcc.DB2Xml data=(com.ibm.db2.jcc.DB2Xml)
				res.getObject(1);
//				 Print the result as DB2 XML String
				System.out.println();
				System.out.println(data.getDB2String());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			Statement stmt = con.createStatement();
			String query = "XQUERY for $ques in db2-fn:sqlquery('SELECT TESTPAPER FROM TEST WHERE TESTID = " + iTestid + "')/questionpaper return $ques/ques/text()";
			
			System.out.println();
			System.out.println(query);
			ResultSet rs = stmt.executeQuery(query);
//		 retrieve and display the result from the query
			while (rs.next())
			{
				
//		 retrieve the data as binary stream
			String ques=rs.getString(1);
			
			ques_list.add(ques);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			Statement stmt = con.createStatement();
			String query = "XQUERY for $marks in db2-fn:sqlquery('SELECT TESTPAPER FROM TEST WHERE TESTID = " + iTestid + "')/questionpaper return $marks/marks/text()";
			
			System.out.println();
			System.out.println(query);
			ResultSet rs = stmt.executeQuery(query);
//		 retrieve and display the result from the query
			while (rs.next())
			{
				
//		 retrieve the data as binary stream
			String marks = rs.getString(1);
			
			marks_list.add(marks);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		for(int i = 0;i<ques_list.size();i++)
		{
			com.ignou.vcs.forms.Test_paper testpaper = new com.ignou.vcs.forms.Test_paper();
			String marks = (String)marks_list.get(i);
			String ques = (String)ques_list.get(i);
			testpaper.setQues(ques);
			testpaper.setQuesmarks(marks);
			paper.add(testpaper);
		}
		return paper;
	}
	
	public void insertSolution(String xmlDoc,String testid,String studentid)
	{
		ResultSet res=null;
		Statement state=null;
		int itestid = Integer.parseInt(testid);
			try {
				String sql = "insert into ANSWERSHEETS(testid,studentid,answers,evaluated,totalmarks) values("+
				itestid + 
				",'" + studentid + "','"
				+ xmlDoc + "'," +
				0 + "," +
				null + ")";
				
				System.out.println(sql);
				state=con.createStatement();
				int rowsAffected = state.executeUpdate(sql);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
	}
	public int check(int testid,String studentid)
	{
		ResultSet res=null;
		Statement state=null;
		int value = 0;
		try {
			String sql = "select * from ANSWERSHEETS where testid = "
				+ testid + " and studentid = '"
				+  studentid + "'";
			
			System.out.println(sql);
			state = con.createStatement();
			res = state.executeQuery(sql);
			
			if(res.next())
				value = 1;
			else
				value = 0;
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return value;
		
	}
	public String getCourseName(String courseID) {
		ResultSet res=null;
		Statement state=null;
		String courseName = "";
		int icourseid = 1;
		try {
			icourseid = Integer.parseInt(courseID);
		} catch (NumberFormatException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String sql = "SELECT name FROM COURSE WHERE courseID = " + icourseid;
		
		System.out.println(sql);		
		try {
			state=con.createStatement();
			res=state.executeQuery(sql);
			
			while(res.next()) {
				courseName = res.getString("name");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return courseName;
	}
	
	public ArrayList getTestID(String courseid,String facultyid)
	{
		ArrayList testid = new ArrayList();
		ResultSet res=null;
		Statement state=null;
		int icourseid = 0;
		try {
			icourseid = Integer.parseInt(courseid);
		} catch (NumberFormatException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String sql = "SELECT testid,testname,passmarks FROM TEST WHERE courseid = " + icourseid +
		" and takenby = '" + facultyid + "'";
		System.out.println("SQL: " + sql);
		try {
			state=con.createStatement();
			res=state.executeQuery(sql);
			
			while(res.next()) {
				com.ignou.vcs.forms.Test form = new com.ignou.vcs.forms.Test(); 
				String testID = res.getString("testid");
				String testname = res.getString("testname");
				int passmarks = res.getInt("passmarks");
				form.setTest_name(testname);
				form.setTestid(testID);
				form.setPass_marks(passmarks);
				testid.add(form);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return testid;
	}
	
	public String getTestName(String testid)
	{
		String name = "";
		ResultSet res=null;
		Statement state=null;
		int itestid = 0;
		try {
			itestid = Integer.parseInt(testid);
		} catch (NumberFormatException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String sql = "SELECT testname FROM TEST WHERE testid = " + itestid;
		System.out.println("SQL: " + sql);
		try {
			state=con.createStatement();
			res=state.executeQuery(sql);
			
			while(res.next()) {
				name = res.getString("testname");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return name;
	}
	public ArrayList getStu(String testid)
	{
		ResultSet res=null;
		Statement state=null;
		ArrayList stu_list = new ArrayList();
		String sql = "SELECT studentid,evaluated FROM ANSWERSHEETS WHERE testid = " + testid;
		String stuID;
		try {
			state=con.createStatement();
			res=state.executeQuery(sql);
			
			while(res.next()) {
				com.ignou.vcs.beans.evaluation evaluationBean = new com.ignou.vcs.beans.evaluation();
				evaluationBean.setStudentid(res.getString("studentid"));
				evaluationBean.setEvaluated(res.getInt("evaluated"));
				stu_list.add(evaluationBean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return stu_list;
	}
	public ArrayList getSolution(String testid,String studentid)
	{
		ArrayList soln_list = new ArrayList();
		ResultSet res=null;
		Statement state=null;
		int iTestid = Integer.parseInt(testid);
		ArrayList answer_list = new ArrayList();
		ArrayList quesno_list = new ArrayList();
		
		try {
			String sql = "SELECT ANSWERS FROM ANSWERSHEETS WHERE testid=" + iTestid +
			" and studentid = '" + studentid+ "'";
			state = con.createStatement();
			res = state.executeQuery(sql);
		
			while(res.next())
			{
				 com.ibm.db2.jcc.DB2Xml data=(com.ibm.db2.jcc.DB2Xml)
				res.getObject(1);
//				 Print the result as DB2 XML String
				System.out.println();
				System.out.println(data.getDB2String());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			Statement stmt = con.createStatement();
			String sql = "\"SELECT ANSWERS FROM ANSWERSHEETS WHERE TESTID = " + iTestid + " AND STUDENTID = '" + studentid +"'\"";
			String query = "XQUERY for $ans in db2-fn:sqlquery("+sql+")/solution return $ans/ans/text()";

			ResultSet rs = stmt.executeQuery(query);
//		 retrieve and display the result from the query
			while (rs.next())
			{
//		 retrieve the data as binary stream
			String answer=rs.getString(1);
			System.out.println(answer);
//		 Print the result
			answer_list.add(answer);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			Statement stmt = con.createStatement();
			String sql = "\"SELECT ANSWERS FROM ANSWERSHEETS WHERE TESTID = " + iTestid + " AND STUDENTID = '" + studentid +"'\"";
			String query = "XQUERY for $quesno in db2-fn:sqlquery("+sql+")/solution return $quesno/quesno/text()";
			ResultSet rs = stmt.executeQuery(query);
//		 retrieve and display the result from the query
			while (rs.next())
			{
//		 retrieve the data as binary stream
			String quesno=rs.getString(1);
			System.out.println(quesno);
//		 Print the result
			quesno_list.add(quesno);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for(int i = 0;i<answer_list.size();i++)
		{
			com.ignou.vcs.beans.AnswerBean solution = new com.ignou.vcs.beans.AnswerBean();
			String answer = (String)answer_list.get(i);
			String quesno = (String)quesno_list.get(i);
			solution.setAnswer(answer);
			solution.setQuesno(Integer.parseInt(quesno));
			soln_list.add(solution);
		}
		return soln_list;
	}
	
	public void updateTest(int totalMarks,String testid,String studentid)
	{
		ResultSet res=null;
		Statement state=null;
		int itestid = Integer.parseInt(testid);
		try {
			String sql = "update ANSWERSHEETS set totalmarks = " + totalMarks +
			" , evaluated = " + 1 + " where testid = " +  itestid + 
				" and studentid = '" + studentid + "'";
			System.out.println(sql);
			state=con.createStatement();
			int rowsAffected = state.executeUpdate(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int getLevel(String userid)
	{
		ResultSet res=null;
		Statement state=null;
		int level = 0;
		try {
			String sql = "SELECT level FROM USER WHERE userid = '" + userid +"'";
			state=con.createStatement();
			ResultSet rs = state.executeQuery(sql);
		
			while(rs.next())
			{
				level = rs.getInt("level");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return level;
	}
	
	public ArrayList<courseBean> getAllCourses()
	{
		Statement state=null;
		ArrayList<courseBean> course_list = new ArrayList<courseBean>();
		
		try {
			String sql = "SELECT name,courseid FROM COURSE";
			state=con.createStatement();
			ResultSet rs = state.executeQuery(sql);
		
			while(rs.next())
			{
				com.ignou.vcs.beans.courseBean course = new com.ignou.vcs.beans.courseBean();
				
				course.setCoursename(rs.getString("name"));
				course.setCourseid(rs.getInt("courseid"));
				course_list.add(course);
				System.out.println(rs.getInt("courseid") + rs.getString("name"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return course_list;
	}
	public ArrayList<SubjectBean> getAllSubjects()
	{
		ResultSet res=null;
		Statement state=null;
		ArrayList subject_list = new ArrayList();
		
		try {
			String sql = "SELECT SUBJECTNAME,SUBJECTID FROM SUBJECTS";
			state=con.createStatement();
			ResultSet rs = state.executeQuery(sql);
		
			while(rs.next())
			{
				com.ignou.vcs.beans.SubjectBean subBean = new com.ignou.vcs.beans.SubjectBean();
				
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

	public String getFacultySubject(String userid)
	{
		ResultSet res=null;
		Statement state=null;
		String subjectid = "";
		
		try {
			String sql = "SELECT SUBJECTID FROM FACULTY WHERE USERID = '" + userid + "'";
			System.out.println(sql);
			state=con.createStatement();
			ResultSet rs = state.executeQuery(sql);
		
			while(rs.next())
			{
				subjectid = rs.getString("subjectid");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return subjectid;
	}
	
	public void insertSchedule(com.ignou.vcs.forms.Schedule form)
	{
		ResultSet res=null;
		Statement state=null;
		
		String organizedFor = form.getOrganizedFor();
		String organizedBy = form.getOrganizedBy();
		String subject = form.getSubject();
		String course = form.getCourse();
		String Date = form.getDate();
		String time = form.getTime();
		String title = form.getTitle();
		String description = form.getDescription();
		try {
			String sql = "insert into DISCUSSION(organizedby,organizedfor,courseid,subjectid,date,time,title,description,duration) values('" +
							organizedBy + "','" 
							+ organizedFor + "','"
							+ course + "','" 
							+ subject + "','" 
							+ Date + "','"
							+ time + "','"
							+ title + "','"
							+ description + "',"
							+ 1 +")";
			
			System.out.println(sql);
			state=con.createStatement();
			int rowsAffected = state.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<com.ignou.vcs.forms.Schedule> getSchedule(String subjectid,String courseid,String organizedfor)
	{
		Statement state=null;
		ArrayList schedule = new ArrayList();
		String sql = "SELECT * FROM DISCUSSION WHERE COURSEID = '" + courseid +
					"' and subjectid = '" + subjectid +
					"' and organizedfor = '" + organizedfor +
					"' ORDER BY DATE DESC";
		try {
			state=con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			
			while(rs.next())
			{
				com.ignou.vcs.forms.Schedule scheduleForm = new com.ignou.vcs.forms.Schedule();
				scheduleForm.setDate(rs.getString("date"));
				scheduleForm.setDescription(rs.getString("description"));
				scheduleForm.setTitle(rs.getString("title"));
				scheduleForm.setTime(rs.getString("time"));
				scheduleForm.setOrganizedBy(rs.getString("organizedby"));
				scheduleForm.setDuration(rs.getString("duration"));
				schedule.add(scheduleForm);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(sql);
		
		return schedule;
	}
	
	public ArrayList<com.ignou.vcs.forms.Schedule> getStudentSchedule(String courseid,String organizedfor)
	{
		Statement state=null;
		ArrayList schedule = new ArrayList();
		String sql = "SELECT * FROM DISCUSSION WHERE COURSEID = '" + courseid +
					
					"' and organizedfor = '" + organizedfor +
					"' ORDER BY DATE DESC";
		
		try {
			state=con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			
			while(rs.next())
			{
				com.ignou.vcs.forms.Schedule scheduleForm = new com.ignou.vcs.forms.Schedule();
				scheduleForm.setDate(rs.getString("date"));
				scheduleForm.setDescription(rs.getString("description"));
				scheduleForm.setTitle(rs.getString("title"));
				scheduleForm.setTime(rs.getString("time"));
				scheduleForm.setOrganizedBy(rs.getString("organizedby"));
				scheduleForm.setDuration(rs.getString("duration"));
				schedule.add(scheduleForm);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(sql + " " + schedule.size());
		
		return schedule;
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
		return subjectname;
	}
	
	public ArrayList<com.ignou.vcs.forms.Schedule> getMgmtSchedule(String type,String userid)
	{
		Statement state=null;
		ArrayList schedule = new ArrayList();
		String sql = "";
		
		if(type.equals("Courses"))
		{
		sql = "SELECT * FROM DISCUSSION WHERE ORGANIZEDBY = '" + userid + 
					"' and subjectid = '" + null + "' ORDER BY DATE DESC";
		}
		else
		{
			if(type.equals("Subjects"))
			{	
				sql = "SELECT * FROM DISCUSSION WHERE ORGANIZEDBY = '" + userid + 
				"' and courseid = '" + null + "' ORDER BY DATE DESC";
			}
			else
			{
				if(type.equals("All"))
				{
					sql = "SELECT * FROM DISCUSSION WHERE ORGANIZEDBY = '" + userid + "' ORDER BY DATE DESC";
				}
			}
		}
		try {
			state=con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			
			while(rs.next())
			{
				com.ignou.vcs.forms.Schedule scheduleForm = new com.ignou.vcs.forms.Schedule();
				scheduleForm.setDate(rs.getString("date"));
				scheduleForm.setDescription(rs.getString("Organizedfor"));
				scheduleForm.setTitle(rs.getString("title"));
				//scheduleForm.setTime(rs.getString("time"));
				scheduleForm.setOrganizedBy(rs.getString("organizedby"));
				scheduleForm.setDuration(rs.getString("duration"));
				schedule.add(scheduleForm);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(sql);
		
		return schedule;
	}
	public ArrayList<com.ignou.vcs.forms.Schedule> getFacultySchedule(String type,String userid)
	{
		Statement state=null;
		ArrayList schedule = new ArrayList();
		String sql = "";
		
		if(type.equals("Self"))
		{
		sql = "SELECT * FROM DISCUSSION WHERE ORGANIZEDBY = '" + userid + "' ORDER BY DATE DESC";
		try {
			state=con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			
			while(rs.next())
			{
				com.ignou.vcs.forms.Schedule scheduleForm = new com.ignou.vcs.forms.Schedule();
				scheduleForm.setDate(rs.getString("date"));
				scheduleForm.setDescription(rs.getString("description"));
				scheduleForm.setTitle(rs.getString("title"));
				scheduleForm.setTime(rs.getString("time"));
				scheduleForm.setOrganizedBy(rs.getString("organizedby"));
				scheduleForm.setDuration(rs.getString("duration"));
				schedule.add(scheduleForm);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		else
		{
			com.ignou.vcs.database.VCSDatabaseActivities db_obj = new com.ignou.vcs.database.VCSDatabaseActivities();
			com.ignou.vcs.beans.FacultyBean facultyBean = db_obj.getFacultyDetails(userid);
			String courseid = facultyBean.getCourseID();
			String subjectid = facultyBean.getSubjectID();
			com.ignou.vcs.commons.Utilities obj = new com.ignou.vcs.commons.Utilities();
			ArrayList course_list = obj.getSeparateValue(courseid);
			
			sql = "SELECT * FROM DISCUSSION WHERE ORGANIZEDFOR = '" + 1 + 
			"' ORDER BY DATE DESC"; 
			
			try {
				state=con.createStatement();
				ResultSet rs = state.executeQuery(sql);
				
				while(rs.next())
				{
					String course = rs.getString("courseid");
					String subject = rs.getString("subjectid");
					
					if(!subject.equals("null"))
					{	
						if(subject.indexOf(subjectid) != -1)
						{	
							com.ignou.vcs.forms.Schedule scheduleForm = new com.ignou.vcs.forms.Schedule();
							scheduleForm.setDate(rs.getString("date"));
							scheduleForm.setDescription(rs.getString("description"));
							scheduleForm.setTitle(rs.getString("title"));
							scheduleForm.setTime(rs.getString("time"));
							scheduleForm.setOrganizedBy(rs.getString("organizedby"));
							scheduleForm.setDuration(rs.getString("duration"));
							schedule.add(scheduleForm);
						}
					}
					else
					{
						for(int i = 0;i < course_list.size();i++)
						{
							String temp = (String)course_list.get(i);
							if(course.indexOf(temp) != -1)
							{
								com.ignou.vcs.forms.Schedule scheduleForm = new com.ignou.vcs.forms.Schedule();
								scheduleForm.setDate(rs.getString("date"));
								scheduleForm.setDescription(rs.getString("description"));
								scheduleForm.setTitle(rs.getString("title"));
								scheduleForm.setTime(rs.getString("time"));
								scheduleForm.setOrganizedBy(rs.getString("organizedby"));
								scheduleForm.setDuration(rs.getString("duration"));
								schedule.add(scheduleForm);
								break;
							}
						}
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return schedule;
	}
	public ArrayList getFaculty(String keyword,String level)
	{
		ArrayList list = new ArrayList();
		ArrayList tempList = new ArrayList();
		ResultSet res=null;
		Statement state=null;
		ArrayList courseList = new ArrayList();
		com.ignou.vcs.commons.Utilities obj = new com.ignou.vcs.commons.Utilities();
		com.ignou.vcs.database.VCSDatabaseActivities dbObj = new com.ignou.vcs.database.VCSDatabaseActivities();
		
		try {
			String query = "SELECT * FROM FACULTY A,SUBJECTS B where A.SUBJECTID = B.SUBJECTID";
			state=con.createStatement();
			res = state.executeQuery(query);
		
			while(res.next())
			{
				com.ignou.vcs.beans.FacultyBean facultyBean = new com.ignou.vcs.beans.FacultyBean();
				facultyBean.setFacultyID(res.getString("facultyID"));
				facultyBean.setUserID(res.getString("userID"));
				facultyBean.setName(res.getString("name"));
				facultyBean.setDob(res.getString("dob"));
				facultyBean.setEmailP(res.getString("emailprimary"));
				facultyBean.setEmailS(res.getString("emailsecondary"));
				facultyBean.setContactP(res.getString("contactnoprimary"));
				facultyBean.setContactS(res.getString("contactnosecondary"));
				facultyBean.setAddress(res.getString("address"));
				facultyBean.setQualification(res.getString("qualification"));
				facultyBean.setAppointedBy(res.getString("appointedby"));
				facultyBean.setCourseID(res.getString("courseid"));
				String name = res.getString("name");
				String qualification = res.getString("qualification");
				String courseid = res.getString("courseid");
				String subjectid = res.getString("subjectid");
				String subjectname = res.getString("subjectname");
				facultyBean.setSubjectID(subjectname);
				subjectname = subjectname.toLowerCase();
				qualification = qualification.toLowerCase();
				name = name.toLowerCase();
				courseList.add(courseid);
				tempList.add(facultyBean);
				
				if(subjectname.indexOf(keyword) != -1)
				{
					list.add(facultyBean);
				}
				else
				{
					if(qualification.indexOf(keyword) != -1)
					{
						list.add(facultyBean);
					}
					else
					{
						if(name.indexOf(keyword) != -1)
						{
							list.add(facultyBean);
						}
					}
				}	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(list.size() == 0)
		{
			for(int i = 0;i< courseList.size();i++)
			{
				ArrayList temp = obj.getSeparateValue((String)courseList.get(i));
				for(int j = 0;j < temp.size();j++)
				{
					String cid = (String)temp.get(j);
					System.out.println("CID" + cid);
					String cname = dbObj.getCourseName(cid);
					cname = cname.toLowerCase();
					
					if(cname.indexOf(keyword) != -1)
					{
						list.add(tempList.get(i));
						break;
					}
				}
			}
		}
		System.out.println("LISTSIZE:" + list.size());
		return list;
	}
	
	public ArrayList getTests(String keyword,String level)
	{
		ArrayList list = new ArrayList();
		ResultSet res=null;
		Statement state=null;
		
		try {
			String query = "SELECT A.*,B.NAME AS COURSENAME,C.*,D.* FROM TEST A,COURSE B,SUBJECTS C,FACULTY D WHERE A.COURSEID = B.COURSEID AND A.SUBJECTID = C.SUBJECTID AND A.TAKENBY = D.USERID";
			state=con.createStatement();
			res = state.executeQuery(query);
			System.out.println("QUery " + query);
			
			while(res.next())
			{
				String testtype = res.getString("testtype");
				String testname = res.getString("testname");
				String takenby = res.getString("takenby");
				String courseid = res.getString("courseid");
				String subjectid = res.getString("subjectid");
				String prerequisites = res.getString("prerequisites");
				String syllabus = res.getString("syllabus");
				String maxmarks = res.getString("maxmarks");
				String passmarks = res.getString("passmarks");
				com.ignou.vcs.beans.getTests test_obj = new com.ignou.vcs.beans.getTests();
			 	test_obj.setTest_type(testtype);
				test_obj.setTest_name(testname);
				test_obj.setSyllabus(syllabus);
				test_obj.setPrereq(prerequisites);
				test_obj.setMax_marks(maxmarks);
				test_obj.setPass_marks(passmarks);
				testname = testname.toLowerCase();
				String coursename = res.getString("coursename");
				String subjectname = res.getString("subjectname");
				test_obj.setCourseid(coursename);
				test_obj.setSubjectid(subjectname);
				String name = res.getString("name");
				test_obj.setTaken_by(name);
				name = name.toLowerCase();
				testtype = testtype.toLowerCase();
				testname = testname.toLowerCase();
				coursename = coursename.toLowerCase();
				subjectname = subjectname.toLowerCase();
				if(testtype.indexOf(keyword) != -1)
				{
					list.add(test_obj);
				}
				else
				{
					if(testname.indexOf(keyword) != -1)
					{
						list.add(test_obj);
					}
					else
					{
						if(name.indexOf(keyword) != -1)
						{
							list.add(test_obj);
						}
						else
						{
							if(coursename.indexOf(keyword) != -1)
							{
								list.add(test_obj);
							}
							else
							{
								if(subjectname.indexOf(keyword) != -1)
								{
									list.add(test_obj);
								}
							}
						}
					}
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<Notice> getNotices(String keyword,String level)
	{
		ArrayList<Notice> list = new ArrayList<Notice>();
		ResultSet res=null;
		Statement state=null;
		
		try {
			String query = "SELECT A.*,B.*,D.* FROM NOTICES A,FACULTY B,SUBJECTS D WHERE  A.POSTEDBY = B.USERID AND B.SUBJECTID = D.SUBJECTID";
			state=con.createStatement();
			res = state.executeQuery(query);
			
			while(res.next())
			{
				String postedto = res.getString("postedto");
				Utilities obj = new Utilities();
				ArrayList list1 = obj.getSeparateValue(postedto);
				String title = res.getString("title");
				String desc = res.getString("description");
				String postedby = res.getString("NAME");
				String key = res.getString("keyword");
				String subject = res.getString("subjectname");
				
				for(int i = 0;i<list1.size();i++)
				{
					String value = (String)list1.get(i);
					if(value.equals(level))
					{
						Notice notice = new Notice();
						notice.setNoticeID(res.getString("noticeID"));
						notice.setKeyword(key);
						notice.setDescription(desc);
						notice.setPostedTo(postedto);
						notice.setPostingDate(res.getString("postingDate"));
						notice.setExpiresOn(res.getString("expiresOn"));
						notice.setTitle(title);
						notice.setPostedBy(postedby);
						desc = desc.toLowerCase();
						title = title.toLowerCase();
						key = key.toLowerCase();
						postedby = postedby.toLowerCase();
						subject = subject.toLowerCase();
						if(key.indexOf(keyword) != -1)
						{
							list.add(notice);
						}
						else
						{
							if(desc.indexOf(keyword) != -1)
							{
								list.add(notice);
							}
							else
							{
								if(title.indexOf(keyword) != -1)
								{
									list.add(notice);
								}
								else
								{
									if(postedby.indexOf(keyword) != -1)
									{
										list.add(notice);
									}
									else
									{
										if(subject.indexOf(keyword) != -1)
										{
											list.add(notice);
										}
									}
								}
							}
						}
					}
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList getCourse(String keyword)
	{
		ArrayList list = new ArrayList();
		ResultSet res=null;
		Statement state=null;
		
		try {
			String query = "SELECT * FROM COURSE";
			state=con.createStatement();
			res = state.executeQuery(query);
		
			while(res.next())
			{
				com.ignou.vcs.beans.courseBean course = new com.ignou.vcs.beans.courseBean();
				String name = res.getString("name");
				int duration = res.getInt("duration");
				int courseid = res.getInt("courseid");
				String fees = res.getString("fees");
				course.setCourseid(courseid);
				course.setCoursename(name);
				course.setDuration(duration);
				course.setFees(fees);
				name = name.toLowerCase();
				if(name.indexOf(keyword) != -1)
				{	
					list.add(course);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList student(String keyword)
	{
		ResultSet res=null;
		Statement state=null;
		ArrayList list = new ArrayList();
		
		try {
			String query = "SELECT A.*,B.NAME AS COURSENAME FROM STUDENT A,COURSE AS B WHERE A.COURSEID = B.COURSEID";
			state=con.createStatement();
			res = state.executeQuery(query);
			
			while(res.next())
			{
				String name = res.getString("name");
				String courseid = res.getString("courseid");
				String email = res.getString("emailprimary");
				String studentid = res.getString("studentid");
				String userid = res.getString("userid");
				com.ignou.vcs.beans.StudentBean studentBean = new com.ignou.vcs.beans.StudentBean();
				studentBean.setName(name);
				studentBean.setDob(res.getDate("dob"));
				studentBean.setEmailP(email);
				studentBean.setStudentID(studentid);
				studentBean.setUserID(userid);
				studentBean.setContactP(res.getString("contactnoprimary"));
				String coursename = res.getString("coursename");
				studentBean.setCourseId(coursename);
				coursename = coursename.toLowerCase();
				name = name.toLowerCase();
				if(coursename.indexOf(keyword) != -1)
				{
					list.add(studentBean);
				}
				else
				{
					if(email.indexOf(keyword) != -1)
					{
						list.add(studentBean);
					}
					else
					{
						if(name.indexOf(keyword) != -1)
						{
							list.add(studentBean);
						}
					}
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList getFiles(String keyword,String level,int filetype)
	{
		ResultSet res=null;
		Statement state=null;
		ArrayList list = new ArrayList();
		System.out.println("level" + level);
		
		try {
			String query = "SELECT A.*,B.*,D.* FROM FILES A,FACULTY B,SUBJECTS D WHERE  A.UPLOADEDBY = B.USERID AND B.SUBJECTID = D.SUBJECTID AND A.FILETYPE =" + filetype;
			state=con.createStatement();
			res = state.executeQuery(query);
		
			while(res.next())
			{
				String uploadedto = res.getString("uploadedto");
				Utilities obj = new Utilities();
				ArrayList list1 = obj.getSeparateValue(uploadedto);
				String title = res.getString("title");
				String uploadedby = res.getString("name");
				String desc = res.getString("description");
				String filepath = res.getString("filepath");
				String courseid = res.getString("courseid");
				String subject = res.getString("subjectname");
				System.out.println("MY Subjects :" + subject + " " + uploadedby);
				for(int i = 0;i<list1.size();i++)
				{
					String value = (String)list1.get(i);
					
					if(!value.equals(level))
					{
						com.ignou.vcs.beans.FileBean fileBean = new com.ignou.vcs.beans.FileBean();
						fileBean.setTitle(title);
						fileBean.setUploadedby(uploadedby);
						fileBean.setSubjectid(subject);
						fileBean.setDescription(desc);
						fileBean.setFilepath(filepath);
						int fileid = res.getInt("fileid");
						fileBean.setFileid(fileid);
						desc = desc.toLowerCase();
						title = title.toLowerCase();
						uploadedby = uploadedby.toLowerCase();
						subject = subject.toLowerCase();
						System.out.println("uploadedby " + uploadedby);
						if(title.indexOf(keyword) != -1)
						{
							list.add(fileBean);
						}
						else
						{
							if(desc.indexOf(keyword) != -1)
							{
								list.add(fileBean);
							}
							else
							{
									if(subject.indexOf(keyword) != -1)
									{
										list.add(fileBean);
									}
									else
									{
										if(uploadedby.indexOf(keyword) != -1)
										{
											list.add(fileBean);
										}
									}
								}
							}
						}
					}
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public String Name(int level,String userid)
	{
		String name = "";
		ResultSet res=null;
		Statement state=null;
		String query = "";
		if(level == 1)
		{
			query = "SELECT NAME FROM FACULTY WHERE USERID = '" + userid + "'";
		}
		else
		{
			if(level == 2)
			{
				query = "SELECT NAME FROM MANAGEMENT WHERE USERID = '" + userid + "'";
			}
			else
			{
				if(level == 3)
				{
					name = "Admin";
					return name;
				}
			}
		}
		try {
			state=con.createStatement();
			res = state.executeQuery(query);
			
			while(res.next())
			{
				name = res.getString("name");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return name;
	}
	
	public ArrayList StudentReport(String userid)
	{
		ArrayList list = new ArrayList();
		ResultSet res=null;
		Statement state=null;
		String query = "SELECT 	A.SUBJECTNAME,B.SUBJECTID,B.TESTNAME,C.TOTALMARKS FROM SUBJECTS A,TEST B,ANSWERSHEETS C WHERE C.STUDENTID = '" + userid + "' AND C.TESTID = B.TESTID AND B.SUBJECTID = A.SUBJECTID";
		
		try {
			state=con.createStatement();
			res = state.executeQuery(query);
		
			while(res.next())
			{
				com.ignou.vcs.beans.StudentReport reportbean = new com.ignou.vcs.beans.StudentReport();
				String subjectid = res.getString("subjectid");
				String subjectname = res.getString("subjectname");
				reportbean.setSubjectname(subjectname);
				reportbean.setTest_name(res.getString("testname"));
				reportbean.setMarks(res.getInt("totalmarks"));
				list.add(reportbean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public void insertNews(AddnewsForm form)
	{
		ResultSet res=null;
		Statement state=null;
		String date = form.getDate();
		String subject = form.getSubject();
		String description = form.getDescription();
		String query = "insert into NEWS(subject,date,description) values('"
			+ subject + "','"
			+ date + "','"
			+ description + "')";
		
		try {
			state=con.createStatement();
			int rowsAffected = state.executeUpdate(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String getSyllabu(String courseId, String subjectid) {
		ResultSet res=null;
		Statement state=null;
		String syllabus = "";
		String sql = "";
		sql = "SELECT SYLLABUS FROM SYLLABUS WHERE courseID = " + courseId + " and subjectID = " + subjectid; 
		
		try {
			state=con.createStatement();
			res=state.executeQuery(sql);
			
			while(res.next()) {
				syllabus = res.getString("syllabus");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return syllabus;
	}
	
	public ArrayList getStudentlist(String courseid)
	{
		ResultSet res=null;
		Statement state=null;
		ArrayList list = new ArrayList();
		String query = "SELECT * FROM STUDENT WHERE COURSEID = " + courseid;
		
		try {
			state=con.createStatement();
			res=state.executeQuery(query);
			
			while(res.next())
			{
				com.ignou.vcs.beans.StudentBean studentBean = new com.ignou.vcs.beans.StudentBean();
				studentBean.setStudentID(res.getString("studentID"));
				studentBean.setUserID(res.getString("userID"));
				studentBean.setName(res.getString("name"));
				studentBean.setDob(res.getDate("dob"));
				studentBean.setEmailP(res.getString("emailprimary"));
				studentBean.setEmailS(res.getString("emailsecondary"));
				studentBean.setContactP(res.getString("contactnoprimary"));
				studentBean.setContactS(res.getString("contatcnosecondary"));
				studentBean.setAddress(res.getString("address"));
				studentBean.setFatherName(res.getString("fatherName"));
				studentBean.setOccupation(res.getString("occupation"));
				studentBean.setCourseId(res.getString("courseid"));
				studentBean.setStartDate(res.getString("startdate"));
				studentBean.setEndDate(res.getString("completiondate"));
				studentBean.setPaymentId(res.getString("paymentID"));
				list.add(studentBean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public String insertCourse(com.ignou.vcs.forms.AddCourseForm form)
	{
		ResultSet res=null;
		Statement state=null;
		String courseid = "";
		int duration = form.getDuration();
		String name = form.getName();
		String fees = form.getFees();
		
		String query = "insert into COURSE(name,duration,fees) values('"
			+ name + "',"
			+ duration + ",'"
			+ fees + "')";
		
		try {
			state=con.createStatement();
			int rowsAffected = state.executeUpdate(query);
			
			String sql = "SELECT COURSEID FROM COURSE WHERE NAME LIKE '" + name + "'";
			Statement stmt = con.createStatement();
			res = stmt.executeQuery(sql);
			while(res.next())
			{
				courseid = res.getString("courseid");
			}
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("courseid : " + courseid);
		return courseid;
	}
	
	public void syllabusXML(String xmlDoc,String courseid,String subjectid)
	{
		ResultSet res=null;
		Statement state=null;
		int icourseid = Integer.parseInt(courseid);
		int isubjectid = Integer.parseInt(subjectid);
		
			try {
				String sql = "insert into SYLLABUS(courseid,subjectid,syllabus) values("
					+ icourseid + ","
					+ isubjectid + ",xmlparse(document '"
					+ xmlDoc + "'))";
				System.out.println(sql);
				state=con.createStatement();
				int rowsAffected = state.executeUpdate(sql);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
	public ArrayList getSyllabus(String courseid,String subjectid)
	{
		ArrayList syllabus = new ArrayList();
		ArrayList unitnamelist = new ArrayList();
		ArrayList topicslist = new ArrayList();
		ResultSet res=null;
		Statement state=null;
		int icourseid = Integer.parseInt(courseid);
		int isubjectid = Integer.parseInt(subjectid);
		
		try {
			String sql = "SELECT SYLLABUS FROM SYLLABUS WHERE courseid=" + icourseid + " and subjectid = " + isubjectid;
			state = con.createStatement();
			res = state.executeQuery(sql);
		
			while(res.next())
			{
				 com.ibm.db2.jcc.DB2Xml data=(com.ibm.db2.jcc.DB2Xml)
				res.getObject(1);
//				 Print the result as DB2 XML String
				System.out.println();
				System.out.println(data.getDB2String());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			Statement stmt = con.createStatement();
			String query = "XQUERY for $unitname in db2-fn:sqlquery('SELECT SYLLABUS FROM SYLLABUS WHERE courseid=" + icourseid + " and subjectid = " + isubjectid +"')/syllabus return $unitname/unitname/text()";
			
			System.out.println();
			System.out.println(query);
			ResultSet rs = stmt.executeQuery(query);
//		 retrieve and display the result from the query
			while (rs.next())
			{
//		 retrieve the data as binary stream
				String unitname =rs.getString(1);
//		 Print the result
				unitnamelist.add(unitname);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			Statement stmt1 = con.createStatement();
			String query1 = "XQUERY for $topics in db2-fn:sqlquery('SELECT SYLLABUS FROM SYLLABUS WHERE courseid=" + icourseid + " and subjectid = " + isubjectid +"')/syllabus return $topics/topics/text()";
			
			System.out.println();
			
			ResultSet rs1 = stmt1.executeQuery(query1);
//		 retrieve and display the result from the query
			while (rs1.next())
			{
				
//		 retrieve the data as binary stream
				String topics =rs1.getString(1);
			
//		 Print the result
				topicslist.add(topics);
			
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		for(int i = 0;i<unitnamelist.size();i++)
		{
			com.ignou.vcs.beans.Syllabus syllabusbean = new com.ignou.vcs.beans.Syllabus();
			String unitname = (String)unitnamelist.get(i);
			String topics = (String)topicslist.get(i);
			syllabusbean.setUnitname(unitname);
			syllabusbean.setTopics(topics);
			syllabus.add(syllabusbean);
		}
		return syllabus;
	}

	public int CheckTimeslot(String date,String time,String courseid,String userid)
	{
		int flag = 0;
		Connection con = null;
		ResultSet res=null;
		ResultSet res1=null;
		Statement state=null;
		
		String query = "SELECT * FROM DISCUSSION WHERE DATE = '" + date + "' AND TIME = '" + time + "'  AND ORGANIZEDBY = '" + userid + "'";
		try {
			state = con.createStatement();
			res = state.executeQuery(query);
			
			if(res.next())
				flag = 1;
			else
			{
				String query1 = "SELECT * FROM DISCUSSION WHERE DATE = '" + date + "' AND TIME = '" + time + "'  AND COURSEID = '" + courseid + "'";
				res1 = state.executeQuery(query1);
				if(res1.next())
					flag = 1;
				else
					flag = 0;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	public int CheckTimeslotMgmt(String date,String time,int type,String id,String userid)
	{
		int flag = 0;
		ResultSet res=null;
		ResultSet res1=null;
		Statement state=null;
		Statement state1=null;
		String query = "";
		String query1 = "";
		query = "SELECT *  FROM DISCUSSION WHERE DATE = '" + date + "' AND TIME = '" + time + "' AND ORGANIZEDBY = '" + userid + "'";
		
		try {
			state = con.createStatement();
			res = state.executeQuery(query);
			
			if(res.next())
			{
				flag = 1;
			}
			else
			{
				if(type == 1)
				{
					query1 = "SELECT COURSEID AS ID FROM DISCUSSION WHERE DATE = '" + date + "' AND TIME = '" + time + "'";
				}
				else
				{
					query1 = "SELECT SUBJECTID AS ID FROM DISCUSSION WHERE DATE = '" + date + "' AND TIME = '" + time + "'";
				}
				System.out.println(query1);
				
				state1 = con.createStatement();
				res1 = state1.executeQuery(query1);
				
					while(res1.next())
					{
						String id1 = res1.getString("ID");
						
						if(id1.indexOf(id) != -1)
						{
							flag = 1;
							break;
						}
						else
						{
							flag  = 0;
						}
					}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return flag;
	}
	
	public ArrayList getTestList(String facultyid,int testType)
	{
		ArrayList testList = new ArrayList();
		ResultSet res=null;
		Statement state=null;
		
		String query = "SELECT A.TESTID,A.TESTNAME,B.NAME,A.MAXMARKS,A.PASSMARKS,A.DURATION  FROM TEST A,COURSE B WHERE TAKENBY = '" + facultyid + "' AND TESTTYPE =" + testType + " AND A.COURSEID = B.COURSEID";
		System.out.println("SQL " + query);
		
		try {
			state=con.createStatement();
			res=state.executeQuery(query);
			
			while(res.next()) {
				com.ignou.vcs.beans.getTests testBean = new com.ignou.vcs.beans.getTests();
				testBean.setDuration(res.getString("duration"));
				testBean.setTest_name(res.getString("testname"));
				testBean.setCourseid(res.getString("name"));
				testBean.setMax_marks(res.getString("maxmarks"));
				testBean.setPass_marks(res.getString("passmarks"));
				testBean.setTestid(res.getString("testid"));
				testList.add(testBean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return testList;
	}
	
	public String checkMajorTest(int courseid,int subjectid)
	{
		String testId = "";
		ResultSet res=null;
		Statement state=null;
		
		String query = "SELECT TESTID FROM TEST WHERE COURSEID = " + courseid + " AND SUBJECTID = " + subjectid + " AND TESTTYPE = 0";
		System.out.println("Query " + query);
		
		try {
			state=con.createStatement();
			res=state.executeQuery(query);
			
			while(res.next())
			{
				testId = res.getString("testid");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return testId;
	}
	public String getTotalMarks(int testid)
	{
		String totalMarks = "";
		ResultSet res=null;
		Statement state=null;
		
		String query = "SELECT MAXMARKS FROM TEST WHERE TESTID = " + testid;
		System.out.println("Query " + query);
		
		try {
			state=con.createStatement();
			res=state.executeQuery(query);
			
			while(res.next())
			{
				totalMarks = res.getString("maxmarks");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return totalMarks;
	}
	public void updateXML(String xmlDoc,String testid,String facultyid)
	{
		int testid1 = Integer.parseInt(testid);
		ResultSet res=null;
		Statement state=null;
		
			try {
				String sql = "update TEST set testpaper = '" + xmlDoc + "',takenby = '" + facultyid + "' where testid = " +  testid1;
				System.out.println(sql);
				state=con.createStatement();
				int rowsAffected = state.executeUpdate(sql);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
	public ArrayList getMinorTest(String facultyid,int courseid)
	{
		ArrayList list = new ArrayList();
		ResultSet res=null;
		Statement state=null;
		
		String query = "SELECT TESTID,TESTNAME FROM TEST WHERE TAKENBY = '" + facultyid + "' AND COURSEID = " + courseid + " AND TESTTYPE = 1";
		System.out.println(query);
		try {
			state=con.createStatement();
			res=state.executeQuery(query);
			
			while(res.next())
			{
				Test testBean = new Test();
				testBean.setTestid(res.getString("testid"));
				testBean.setTest_name(res.getString("testname"));
				list.add(testBean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	public String getPrereq(int testid)
	{
		String prereq = "";
		ResultSet res=null;
		Statement state=null;
		
		String query = "SELECT prerequisites FROM TEST WHERE TESTID = " + testid;
		System.out.println("Query " + query);
		
		try {
			state=con.createStatement();
			res=state.executeQuery(query);
			
			while(res.next())
			{
				prereq = res.getString("prerequisites");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return prereq;
		
	}
	public int checkConstraint(String testid,String studentid)
	{
		int flag = 0;
		ResultSet res=null;
		Statement state=null;
		int itestid = Integer.parseInt(testid);
		String query = "SELECT * FROM ANSWERSHEETS WHERE TESTID = " + itestid + " AND STUDENTID = '" + studentid + "'";
		System.out.println("Query " + query);
		
		try {
			state=con.createStatement();
			res=state.executeQuery(query);
			
			while(res.next())
			{
				flag = 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return flag;
	}
	
	public ArrayList getResults(String queryString)
	{
		ArrayList list = new ArrayList();
		ResultSet res=null;
		Statement state=null;
		
		String query = "SELECT distinct(title) as suggest FROM SEARCH WHERE title like('" + 
				queryString + "%') ORDER BY title";
		System.out.println(query);
		try {
			state=con.createStatement();
			res=state.executeQuery(query);
			
			while(res.next())
			{
				list.add(res.getString("suggest"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
}