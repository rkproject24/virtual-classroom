package com.ignou.vcs.report.database;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import javax.sql.DataSource;

import com.ibm.db2.jcc.b.be;
import com.ignou.vcs.datasource.DataSourceFactory;



public class ReportDatabaseActivities {
	
	Connection con = null;
	
	public ReportDatabaseActivities()
	{
		if(con == null)
		{
			con = DataSourceFactory.getConnection();
		}
	}
	
	public ArrayList getMinorReport(String userid,int flag)
	{
		ArrayList list = new ArrayList();
		ResultSet res=null;
		Statement state=null;
		String query = "";
		if(flag == 0)
		{
			query = "SELECT B.SUBJECTID,B.TESTNAME,C.EVALUATED,C.TESTID,D.SUBJECTNAME FROM VCS_SCHEMA.TEST B,VCS_SCHEMA.ANSWERSHEETS C,VCS_SCHEMA.SUBJECTS D WHERE C.STUDENTID = '" + userid + "' AND C.TESTID = B.TESTID AND B.TESTTYPE = 0 AND B.SUBJECTID = D.SUBJECTID";
		}
		else
		{
			if(flag == 1)
			{
				query = "SELECT B.SUBJECTID,B.TESTNAME,C.EVALUATED,C.TESTID,D.SUBJECTNAME FROM VCS_SCHEMA.TEST B,VCS_SCHEMA.ANSWERSHEETS C,VCS_SCHEMA.SUBJECTS D WHERE C.STUDENTID = '" + userid + "' AND C.TESTID = B.TESTID AND B.TESTTYPE = 1 AND B.SUBJECTID = D.SUBJECTID";
			}
		}
		
		try {
			state=con.createStatement();
			res = state.executeQuery(query);
			
			while(res.next())
			{
				com.ignou.vcs.report.beans.ReportBean rbean = new com.ignou.vcs.report.beans.ReportBean();
				String subjectid = res.getString("subjectid");
				rbean.setSubject(res.getString("subjectname"));
				rbean.setEvaluated(res.getString("evaluated"));
				rbean.setTestname(res.getString("testname"));
				rbean.setTestid(res.getString("testid"));
				list.add(rbean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	public com.ignou.vcs.beans.getTests getTest(String testid)
	{
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
		int itestid = Integer.parseInt(testid);
		com.ignou.vcs.beans.getTests test_obj = new com.ignou.vcs.beans.getTests();
		
			try {
				String sql = "select * from VCS_SCHEMA.TEST where testid = " + itestid;
				System.out.println(sql);
				state=con.createStatement();
				res = state.executeQuery(sql);
			
				while(res.next())
				{
					testname = res.getString("testname");
					 testtype = res.getString("testtype");
					 prerequisites = res.getString("prerequisites");
					 syllabus = res.getString("syllabus");
					 takenby = res.getString("takenby");
					 maxmarks = res.getString("maxmarks");
					 passmarks = res.getString("passmarks");
					 duration = res.getString("duration");
					 
					 	test_obj.setTest_type(testtype);
						test_obj.setTest_name(testname);
						test_obj.setTaken_by(takenby);
						test_obj.setSyllabus(syllabus);
						test_obj.setPrereq(prerequisites);
						test_obj.setMax_marks(maxmarks);
						test_obj.setPass_marks(passmarks);
						test_obj.setDuration(duration);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return test_obj;
	}
	
	public void updateAnswerSheet(String xmldoc,String testid,String studentid)
	{
		ResultSet res=null;
		Statement state=null;
		int itestid = Integer.parseInt(testid);
		
		String query = "update VCS_SCHEMA.ANSWERSHEETS set ANSWERS = '" + xmldoc + "' where testid = " +  itestid + " AND STUDENTID = '" + studentid +"'";	
		System.out.println(query);
		try {
			state=con.createStatement();
			int rowsAffected = state.executeUpdate(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList getReport(String testid,String studentid)
	{
		ArrayList list = new ArrayList();
		ArrayList quesnolist = new ArrayList();
		ArrayList markslist = new ArrayList();
		Connection con = null;
		ResultSet res=null;
		Statement state=null;
		int itestid = Integer.parseInt(testid);
		System.out.println("asdasd:" + studentid);
		try {
			String sql = "SELECT ANSWERS FROM VCS_SCHEMA.ANSWERSHEETS WHERE testid=" + itestid + " and studentid = '" + studentid + "'";
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
			String sql = "\"SELECT ANSWERS FROM VCS_SCHEMA.ANSWERSHEETS WHERE TESTID = " + itestid + " AND STUDENTID = '" + studentid +"'\"";
			String query = "XQUERY for $quesno in db2-fn:sqlquery(" + sql+")/answersheet return $quesno/quesno/text()";
			
			System.out.println();
			System.out.println(query);
			ResultSet rs = stmt.executeQuery(query);
//		 retrieve and display the result from the query
			while (rs.next())
			{
				
//		 retrieve the data as binary stream
				String quesno =rs.getString(1);
			
//		 Print the result
				quesnolist.add(quesno);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			Statement stmt1 = con.createStatement();
			String sql = "\"SELECT ANSWERS FROM VCS_SCHEMA.ANSWERSHEETS WHERE TESTID = " + itestid + " AND STUDENTID = '" + studentid +"'\"";
			String query1 = "XQUERY for $marks in db2-fn:sqlquery("+sql+")/answersheet return $marks/marks/text()";
			
			System.out.println();
			
			ResultSet rs1 = stmt1.executeQuery(query1);
//		 retrieve and display the result from the query
			while (rs1.next())
			{
				
//		 retrieve the data as binary stream
				String marks =rs1.getString(1);
			
//		 Print the result
				markslist.add(marks);
			
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		for(int i = 0;i<quesnolist.size();i++)
		{
			com.ignou.vcs.report.beans.minorBean bean = new com.ignou.vcs.report.beans.minorBean();
			String quesno = (String)quesnolist.get(i);
			String marks = (String)markslist.get(i);
			bean.setMarks(marks);
			bean.setQuesno(quesno);
			list.add(bean);
		}
		
		return list;
	}
	
	public String getTotalMarks(String studentId, String testId) {
		ResultSet res=null;
		Statement state=null;
		String sql = "SELECT TOTALMARKS FROM VCS_SCHEMA.ANSWERSHEETS WHERE STUDENTID='" + studentId + "' AND TESTID=" + testId;
		System.out.println(sql);
		String totalMarks = "";
		try {
			state = con.createStatement();
			res = state.executeQuery(sql);
			while(res.next()) {
				totalMarks = res.getString("TOTALMARKS");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return totalMarks;
	}
	
	public ArrayList classReport(String testid)
	{
		ArrayList list = new ArrayList();
		ResultSet res=null;
		Statement state=null;
		
		String query = "SELECT A.STUDENTID,B.NAME,A.TOTALMARKS FROM VCS_SCHEMA.ANSWERSHEETS A,VCS_SCHEMA.STUDENT B WHERE A.TESTID = " + testid + " AND A.STUDENTID = B.USERID";
		System.out.println("SQL Query:" + query);
		try {
			state = con.createStatement();
			res = state.executeQuery(query);
			while(res.next())
			{
				com.ignou.vcs.report.beans.classReport bean = new com.ignou.vcs.report.beans.classReport();
				bean.setStudentname(res.getString("name"));
				bean.setUserid(res.getString("studentid"));
				bean.setTotalmarks(res.getString("totalmarks"));
				list.add(bean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
		
	}
	public ArrayList getTests(int courseid)
	{
		ArrayList list = new ArrayList();
		ResultSet res=null;
		Statement state=null;
		
		String sql = "SELECT TESTID,MAXMARKS FROM VCS_SCHEMA.TEST WHERE COURSEID = " + courseid;
		System.out.println("QUERY: " + sql);
		
		try {
			state = con.createStatement();
			res = state.executeQuery(sql);
			while(res.next())
			{
				com.ignou.vcs.report.beans.TestReport bean = new com.ignou.vcs.report.beans.TestReport();
				bean.setTestid(res.getString("testid"));
				bean.setTotalmarks(res.getString("maxmarks"));
				
				list.add(bean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
		
	}
	public ArrayList getStudentList(int testid)
	{
		ArrayList list = new ArrayList();
		ResultSet res=null;
		Statement state=null;
		
		String sql = "SELECT A.STUDENTID,B.NAME,A.TOTALMARKS FROM VCS_SCHEMA.ANSWERSHEETS A,VCS_SCHEMA.STUDENT B WHERE TESTID = " + testid + " AND EVALUATED = 1 AND A.STUDENTID = B.USERID";
		
		try {
			state = con.createStatement();
			res = state.executeQuery(sql);
			
			while(res.next())
			{
				com.ignou.vcs.report.beans.StudentBean bean = new com.ignou.vcs.report.beans.StudentBean();
				bean.setStudentid(res.getString("studentid"));
				bean.setTotalMarks(res.getString("totalmarks"));
				bean.setName(res.getString("name"));
				list.add(bean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList getFaculty(int subjectid)
	{
		ArrayList list = new ArrayList();
		ResultSet res=null;
		Statement state=null;
		
		String sql = "SELECT USERID,NAME,COURSEID,EMAILPRIMARY FROM VCS_SCHEMA.FACULTY WHERE SUBJECTID = " + subjectid;
		System.out.println("QUERY: " + sql);
		
		try {
			state = con.createStatement();
			res = state.executeQuery(sql);
			
			while(res.next())
			{
				com.ignou.vcs.beans.FacultyBean bean = new com.ignou.vcs.beans.FacultyBean();
				bean.setUserID(res.getString("userid"));
				bean.setName(res.getString("name"));
				bean.setCourseID(res.getString("courseid"));
				bean.setEmailP(res.getString("emailprimary"));
				list.add(bean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	public ArrayList getTotalMarks(int testid)
	{
		ArrayList list = new ArrayList();
		ResultSet res=null;
		Statement state=null;
		
		String sql = "SELECT TOTALMARKS FROM VCS_SCHEMA.ANSWERSHEETS WHERE TESTID = " + testid;
		System.out.println("QUERY: " + sql);
		
		try {
			state = con.createStatement();
			res = state.executeQuery(sql);
			
			while(res.next())
			{
				com.ignou.vcs.report.beans.TestReport bean = new com.ignou.vcs.report.beans.TestReport();
				bean.setTotalmarks(res.getString("totalmarks"));
				list.add(bean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	public ArrayList getMinorTest(String facId,String courseId,String studId,String testType){
		
		ArrayList list = new ArrayList();
		ResultSet res=null;
		Statement state=null;
		String testname = "";
		int maxmarks;
		int passmarks;
		int subjectid;
		int testid;
		int type=0;
		String sql= "";
		String name= "";
		
		if((testType).equals("1")){
			
			sql = "SELECT A.*,B.* FROM VCS_SCHEMA.TEST A,VCS_SCHEMA.ANSWERSHEETS B WHERE A.TAKENBY = '" + facId + "' AND A.COURSEID= "+courseId+" AND A.TESTTYPE=1 AND A.TESTID = B.TESTID AND B.STUDENTID= '"+studId+"' AND B.EVALUATED= 1";
		}
		else if((testType).equals("0")){
			
			sql = "SELECT A.*,B.* FROM VCS_SCHEMA.TEST A,VCS_SCHEMA.ANSWERSHEETS B WHERE A.TAKENBY = '" + facId + "' AND A.COURSEID= "+courseId+" AND A.TESTTYPE=0 AND A.TESTID = B.TESTID AND B.STUDENTID= '"+studId+"' AND B.EVALUATED= 1";
		}
		
		try {
				state=con.createStatement();
				res = state.executeQuery(sql);
			
				while(res.next())
				{
					 testname = res.getString("testname");
					 maxmarks = res.getInt("maxmarks");
					 passmarks = res.getInt("passmarks");
					 subjectid = res.getInt("subjectid");
					 testid = res.getInt("testid");	
					 int total = res.getInt("totalmarks");
					 com.ignou.vcs.beans.major_studentBase rbean = new com.ignou.vcs.beans.major_studentBase();	
						
					rbean.setSubjectid(subjectid);
					rbean.setMaxmarks(maxmarks);
					rbean.setTestid(testid);	
					rbean.setPassmarks(passmarks);
					rbean.setTest_name(testname);
					rbean.setMarksObtained(total);
					list.add(rbean);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try{
				for (int i=0;i<list.size();i++)
				{
					com.ignou.vcs.beans.major_studentBase r= (com.ignou.vcs.beans.major_studentBase)list.get(i);
					String sql1="select MAX(TOTALMARKS)from VCS_SCHEMA.ANSWERSHEETS where TESTID ="+r.getTestid()+"";
					state=con.createStatement();
					res = state.executeQuery(sql1);
					while(res.next())
					{
						r.setHighestMarks(res.getInt(1));
					}
				}		
			}
			catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return list;
}

	public com.ignou.vcs.report.beans.testBean getMajorTest(String courseid,String subId)
	{
		ResultSet res=null;
		Statement state=null;
		com.ignou.vcs.report.beans.testBean bean = new com.ignou.vcs.report.beans.testBean();
		String sql1= "";
		
		String sql = "SELECT A.TESTID,A.MAXMARKS,A.PASSMARKS,A.TESTNAME,A.SYLLABUS FROM VCS_SCHEMA.TEST A, VCS_SCHEMA.ANSWERSHEETS B WHERE B.TESTID=A.TESTID AND A.TESTTYPE=0 AND A.COURSEID =" + courseid +" AND A.SUBJECTID = "+subId+" AND B.EVALUATED=1 ";
		System.out.println("test sql=" +sql);
		try {
			state = con.createStatement();
			res = state.executeQuery(sql);
			while(res.next())
			{
				bean.setTestId(res.getInt("testid"));
				bean.setMaxMarks(res.getInt("maxmarks"));
				bean.setTestName(res.getString("testname"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		sql1 = "SELECT MAX(TOTALMARKS) FROM VCS_SCHEMA.ANSWERSHEETS WHERE TESTID ="+bean.getTestId()+"";
		System.out.println("highest marks sql=" +sql1);
		try {
				state = con.createStatement();
				res = state.executeQuery(sql1);
				while(res.next())
				{
					bean.setHighestMarks(res.getInt(1));
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return bean;
	}
	
	public com.ignou.vcs.report.beans.testBean getTest(String courseid,String subId)
	{
		ResultSet res=null;
		Statement state=null;
		com.ignou.vcs.report.beans.testBean bean = new com.ignou.vcs.report.beans.testBean();
		String sql1= "";
		
		String sql = "SELECT A.TESTID,A.MAXMARKS,A.PASSMARKS,A.TESTNAME,A.SYLLABUS FROM VCS_SCHEMA.TEST A, VCS_SCHEMA.ANSWERSHEETS B WHERE B.TESTID=A.TESTID AND A.TESTTYPE=0 AND A.COURSEID =" + courseid +" AND A.SUBJECTID = "+subId+" AND B.EVALUATED=1 ";
		
		try {
			state = con.createStatement();
			res = state.executeQuery(sql);
			while(res.next())
			{
				bean.setTestId(res.getInt("testid"));
				bean.setMaxMarks(res.getInt("maxmarks"));
				bean.setPassMarks(res.getInt("passmarks"));
				bean.setSyllabus(res.getString("syllabus"));
				bean.setTestName(res.getString("testname"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		sql1 = "SELECT MAX(TOTALMARKS) FROM VCS_SCHEMA.ANSWERSHEETS WHERE TESTID ="+bean.getTestId()+"";
		
		try {
				state = con.createStatement();
				res = state.executeQuery(sql1);
				while(res.next())
				{
					bean.setHighestMarks(res.getInt(1));
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return bean;
	}
}