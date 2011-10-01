package com.ignou.vcs.profile.database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.DataSource;



import com.ibm.db2.jcc.DB2Xml;
import com.ignou.vcs.commons.*;
import com.ignou.vcs.datasource.DataSourceFactory;
import com.ignou.vcs.notices.beans.Notice;
import com.ignou.vcs.profile.beans.profilebean;

public class ProfileDatabaseOperations {
	
	Connection con = null;
	
	public ProfileDatabaseOperations()
	{
		if(con == null)
		{
			con = DataSourceFactory.getConnection();
		}
	}
		
	public profilebean Profile(String userid,String level)
	{
		profilebean bean = new profilebean();
		ResultSet res = null;
		Statement state = null;
		String query = "";
		if(level.equals("0"))
		{
			query = "SELECT NAME,DOB,EMAILPRIMARY AS EMAILP,EMAILSECONDARY AS EMAILS,CONTACTNOPRIMARY AS CONTACTP,CONTACTNOSECONDARY AS CONTACTS,ADDRESS,COURSEID,COMPLETIONDATE FROM VCS_SCHEMA.STUDENT WHERE USERID = '" + userid +"'";
		}
		else
		{
			if(level.equals("1"))
			{
				query = "SELECT NAME,DOB,EMAILPRIMARY AS EMAILP,EMAILSECONDARY AS EMAILS,CONTACTNOPRIMARY AS CONTACTP,CONTACTNOSECONDARY AS CONTACTS,ADDRESS,SUBJECTID FROM VCS_SCHEMA.FACULTY WHERE USERID = '" + userid +"'";
			} 
			else if(level.equals("2"))
			{
				query = "SELECT NAME,DOB,EMAILP,EMAILS,CONTACTP,CONTACTS,ADDRESS FROM VCS_SCHEMA.MANAGEMENT WHERE USERID = '" + userid +"'";
			}
			else
			{
				query = "SELECT NAME,DOB,EMAILP,EMAILS,CONTACTP,CONTACTS,ADDRESS FROM VCS_SCHEMA.admin WHERE USERID = '" + userid +"'";
			}
		}
		System.out.println("SQL: " + query);
		try {
			state=con.createStatement();
			res = state.executeQuery(query);
			
			while(res.next())
			{
				bean.setName(res.getString("name"));
				bean.setDob(res.getString("dob"));
				bean.setAddress(res.getString("address"));
				bean.setEmailp(res.getString("emailp"));
				bean.setEmails(res.getString("emails"));
				bean.setContactp(res.getString("contactp"));
				bean.setContacts(res.getString("contacts"));
				
				com.ignou.vcs.commons.database.CommonsDatabaseActivities dbObj = new com.ignou.vcs.commons.database.CommonsDatabaseActivities();
				com.ignou.vcs.registration.database.RegistrationDatabaseActivities dbObject =new com.ignou.vcs.registration.database.RegistrationDatabaseActivities();
				
				if(level.equals("0")) {
					bean.setCourseName(dbObj.getCourseName(res.getString("courseID")));
					bean.setPendingCourseDuration(res.getString("completionDate"));
				} else if(level.equals("1")) {
					bean.setSubjectName(dbObject.getSubjectName(res.getString("subjectId")));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bean;
	}
	
	public void updateProfile(profilebean bean,String level,String userid)
	{
		ResultSet res = null;
		Statement state = null;
		String query = "";
		String emailp = bean.getEmailp();
		String contactp = bean.getContactp();
		String address = bean.getAddress();
		
		if(level.equals("0"))
		{
			query = "UPDATE VCS_SCHEMA.STUDENT SET EMAILPRIMARY = '" + emailp + "' , CONTACTNOPRIMARY = " + contactp + " , ADDRESS = '" + address + "' WHERE USERID = '" + userid + "'";
		}
		else
		{
			if(level.equals("1"))
			{
				query = "UPDATE VCS_SCHEMA.FACULTY SET EMAILPRIMARY = '" + emailp + "' , CONTACTNOPRIMARY = " + contactp + " , ADDRESS = '" + address + "' WHERE USERID = '" + userid + "'";
			}
			else
			{
				if(level.equals("2"))
				{
					query = "UPDATE VCS_SCHEMA.MANAGEMENT SET EMAILP = '" + emailp + "' , CONTACTP = " + contactp + " , ADDRESS = '" + address + "' WHERE USERID = '" + userid + "'";
				}
			}
		}
		System.out.println("QUERY" + query);
		try {
			state=con.createStatement();
			int rowsAffected = state.executeUpdate(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
