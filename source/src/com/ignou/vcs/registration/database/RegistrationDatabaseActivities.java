package com.ignou.vcs.registration.database;
import java.sql.Connection;
import java.util.Calendar;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.mail.MessagingException;
import javax.sql.DataSource;

import com.ignou.vcs.commons.PasswordService;
import com.ignou.vcs.commons.SendMailUsingAuthentication;
import com.ignou.vcs.commons.beans.SubjectBean;
import com.ignou.vcs.datasource.DataSourceFactory;
import com.ignou.vcs.registration.beans.*;
import com.mysql.jdbc.jdbc2.optional.ConnectionWrapper;

import java.util.ArrayList;


public class RegistrationDatabaseActivities {
	
	Connection con = null;
	
	public RegistrationDatabaseActivities()
	{
		if(con == null)
		{
			con = DataSourceFactory.getConnection();
		}
	}
 
	public ArrayList<CourseBean> getAllCourse(){
		ResultSet res=null;
		Statement state=null;
		ArrayList<CourseBean> allCourses= new ArrayList<CourseBean>();
		String sqlQuery ="SELECT COURSEID,NAME,DURATION,FEES FROM VCS_SCHEMA.COURSE";
		try {
			state=con.createStatement();
			res=state.executeQuery(sqlQuery);
			
			while(res.next()) {
				CourseBean courseBean = new CourseBean();
				String cId = res.getString("COURSEID");
				String name = res.getString("NAME");
				String duration = res.getString("DURATION");
				String fees = res.getString("FEES");
				RegistrationDatabaseActivities obj= new RegistrationDatabaseActivities();
				//ArrayList<SubjectBean> allSubjects = obj.getAllSubject(cId);
				courseBean.setName(name);
				courseBean.setCourseId(cId);
				courseBean.setDuration(duration);
				courseBean.setFees(fees);
				//courseBean.setAllSubjects(allSubjects);		
				allCourses.add(courseBean);
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return allCourses;
	}
	
	public ArrayList<SubjectBean> getAllSubject(String cId)
	{
		ResultSet res1=null;
		Statement state1=null;
		ArrayList<SubjectBean> allSubjects= new ArrayList<SubjectBean>();
		String sqlQuery1 ="SELECT A.SUBJECTNAME FROM VCS_SCHEMA.SUBJECTS A, VCS_SCHEMA.SYLLABUS B WHERE B.SUBJECTID=A.SUBJECTID AND B.COURSEID="+cId;
		try {
			state1=con.createStatement();
			res1=state1.executeQuery(sqlQuery1);
			
			while(res1.next()) {
				SubjectBean subject = new SubjectBean();
				subject.setSubjectId(res1.getString("SUBJECTID"));
				subject.setSubjectName(res1.getString("SUBJECTNAME"));
				allSubjects.add(subject);	
	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return allSubjects;
	}
	
	public void insertValue(String userId,String courseId,String duration,String fees,String details,String name,String dob,String email_id_primary,String email_id_secondary,String contact_no_primary,String contact_no_secondary,String address,String father_name,String occupation)
	{
		String paymentid="";
		ResultSet res=null;
		Statement state=null;
		Statement state1=null;	
		Statement state2=null;
		String sql="INSERT INTO VCS_SCHEMA.PAYMENT(AMOUNT,TIME,DETAILS) VALUES('"+fees+"','"+duration+"','"+details+"')";
		System.out.println(sql);
		try
		{
			state=con.createStatement();
			state.execute(sql);
		}
		catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		
		String sql1="SELECT MAX(PAYMENTID) FROM VCS_SCHEMA.PAYMENT";
		System.out.println(sql1);
		try
		{
			state1=con.createStatement();
			res=state1.executeQuery(sql1);		
					
			while(res.next()) 
			{
				paymentid=res.getString(1);
				
			}
			System.out.print(paymentid);
		}
		catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	 }
		System.out.println("Contact No Secondary:" + contact_no_secondary);
		com.ignou.vcs.commons.Utilities obj = new com.ignou.vcs.commons.Utilities();
		String date = obj.getCurrentDateInDB2Format();
		String newDate = obj.getNewDateInDB2Format(duration);
		System.out.println("current date:"+date);
		System.out.println("new date:"+newDate);
		//String d1="1987-09-09";
		//String d2="1234-07-09";
		if(contact_no_secondary.equals(null)) {
			contact_no_secondary = "NULL";
		}
		String sql2="INSERT INTO VCS_SCHEMA.STUDENT(USERID,NAME,DOB,EMAILPRIMARY,EMAILSECONDARY,CONTACTNOPRIMARY,CONTATCNOSECONDARY,ADDRESS,FATHERNAME,OCCUPATION,COURSEID,STARTDATE,COMPLETIONDATE,PAYMENTID) VALUES('"+userId+"','"+name+"','"+dob+"','"+email_id_primary+"','"+email_id_secondary+"',"+contact_no_primary+","+contact_no_secondary+",'"+address+"','"+father_name+"','"+occupation+"',"+courseId+",'"+date+"','"+newDate+"',"+paymentid+")";
		System.out.println(sql2);
		try
		{
			state2=con.createStatement();
			state2.execute(sql2);		
		}
		catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	 }
   }
	
	public String getAppointmentID()
	{
		String appointmentid="0";
		ResultSet res=null;
		Statement state=null;
		String sql = "SELECT MAX(APPOINTMENTID) FROM VCS_SCHEMA.APPOINTMENT";
		System.out.println(sql);
		try
		{
			state=con.createStatement();
			res=state.executeQuery(sql);		
					
			while(res.next()) 
			{
				appointmentid=res.getString(1);
			}
			if(appointmentid == null) {
				appointmentid="0";
			}
			System.out.println(appointmentid);
		}
		catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	 }
		return appointmentid;
	}
	
	public void insertFile(String name,String password,String specializationId,String uploadedFileName,String emailP,String emailS,String contactP,String address,String qualification,String passyear,String birthDate )
	{
		ResultSet res=null;
		Statement state=null;
		String sql="INSERT INTO VCS_SCHEMA.APPOINTMENT(NAME,PASSWORD,SUBJECTID,RESUME,EMAILPRIMARY,EMAILSECONDARY,CONTACTNOPRIMARY,ADDRESS,QUALIFICATION,PASSYEAR,DOB)VALUES('"+name+"','"+password+"',"+specializationId+",'"+uploadedFileName+"','"+emailP+"','"+emailS+"',"+contactP+",'"+address+"','"+qualification+"',"+passyear+",'"+birthDate+"')";
		System.out.println(sql);
		try
		{
			state = con.createStatement();
			state.execute(sql);		
		}
		catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	 }
	}
	
	public String getSubjectName(String subjectID) {
		ResultSet res=null;
		Statement state=null;
		String subjectName = "";
		String sql = "SELECT SUBJECTNAME FROM VCS_SCHEMA.SUBJECTS WHERE SUBJECTID = " + subjectID;
		try {
			state=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			res=state.executeQuery(sql);
			
			while(res.next()) {
				subjectName = res.getString("SUBJECTNAME");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return subjectName;
	}
	
	public ArrayList getAllRequest()
	
	{
		ResultSet res=null;
		Statement state=null;
		ArrayList<FacultyBean> allRequest = new ArrayList<FacultyBean>();
		String sql = "";
		sql = "SELECT APPOINTMENTID,NAME,SUBJECTID,QUALIFICATION,RESUME FROM VCS_SCHEMA.APPOINTMENT WHERE APPROVED="+0; 
		
		System.out.println("Subject Query:" + sql);
		
		try {
			state=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			res=state.executeQuery(sql);
			
			while(res.next()) {
				FacultyBean facultyBean = new FacultyBean();
				facultyBean.setAppointmentid(res.getString("APPOINTMENTID"));
				facultyBean.setQualification(res.getString("QUALIFICATION"));
				facultyBean.setName(res.getString("NAME"));
				facultyBean.setSubjectId(res.getString("SUBJECTID"));
				String subject= (String)getSubjectName(res.getString("SUBJECTID"));
				System.out.println("Name of subject:" + subject);
				facultyBean.setSubjectName(subject);
				facultyBean.setResume(res.getString("RESUME"));
				System.out.println("resume:" +facultyBean.getResume());
				allRequest.add(facultyBean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return allRequest;
	}
	
	public void insertFaculty(String appointmentId,String subjectId,String userId,String courses)
	{
		String name="";
		String password="";
		String emailP="";
		String emailS="";
		String address="";
		String qualification="";
		String dob="";
		String contact="";
		int level=1;
		ResultSet res=null;
		Statement state=null;
		ResultSet res1=null;
		Statement state1=null;
		Connection con2 = null;
		ResultSet res2=null;
		Statement state2=null;
		String sql="SELECT NAME,DOB,PASSWORD,EMAILPRIMARY,EMAILSECONDARY,CONTACTNOPRIMARY,ADDRESS,QUALIFICATION FROM VCS_SCHEMA.APPOINTMENT WHERE APPOINTMENTID="+appointmentId;
		System.out.println(sql);
		try {
			state=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			res=state.executeQuery(sql);
			
			while(res.next()) {
				name= res.getString("NAME");
				password= res.getString("PASSWORD");
				dob= res.getString("DOB");
				emailP= res.getString("EMAILPRIMARY");
				emailS= res.getString("EMAILSECONDARY");
				contact= res.getString("CONTACTNOPRIMARY");
				address= res.getString("ADDRESS");
				qualification= res.getString("QUALIFICATION");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String encryptedPassword = PasswordService.getInstance().encrypt(password);
		com.ignou.vcs.commons.database.CommonsDatabaseActivities db = new com.ignou.vcs.commons.database.CommonsDatabaseActivities();
		String id=db.generateId(encryptedPassword,level);
		String sql1="INSERT INTO VCS_SCHEMA.FACULTY(USERID,DOB,EMAILPRIMARY,EMAILSECONDARY,CONTACTNOPRIMARY,ADDRESS,QUALIFICATION,APPOINTEDBY,COURSEID,SUBJECTID,NAME) VALUES('"+id+"','"+dob+"','"+emailP+"','"+emailS+"',"+contact+",'"+address+"','"+qualification+"','"+userId+"','"+courses+"',"+subjectId+",'"+name+"')";
		System.out.println("Sql query:" + sql1);
		try
		{
			state1 = con.createStatement();
			state1.execute(sql1);
		}
		catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	 }
		int s=1;
		String sql2="UPDATE VCS_SCHEMA.APPOINTMENT SET APPROVED= "+s+" WHERE APPOINTMENTID="+appointmentId;
		System.out.println(sql2);
		try
		{
			state2 = con2.createStatement();
			state2.executeUpdate(sql2);
		}
		catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	 }
		try {
			SendMailUsingAuthentication smtpMailSender = new SendMailUsingAuthentication();

			  String[] recepients = {emailP};
			  String subject = "Welcome to Virtual Classroom System";
			  String message = "Congratulations, You are now a part of VCS. Your Login Details are as follows:\n Username:" + id + " \n Password:" + password + "." ;
			  String from = "";

			  smtpMailSender.postMail(recepients,subject,message,from);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void deleteFaculty(String appointmentId)
	{
		ResultSet res=null;
		Statement state=null;
		String sql="DELETE FROM VCS_SCHEMA.APPOINTMENT WHERE APPOINTMENTID="+appointmentId;
		System.out.println(sql);
		try
		{
			state = con.createStatement();
			state.executeUpdate(sql);
		}
		catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	 }
	}
}