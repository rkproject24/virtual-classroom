package com.ignou.vcs.exams.database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.StringTokenizer;

import com.ignou.vcs.datasource.DataSourceFactory;
import com.ignou.vcs.exams.beans.ExamBean;
import com.ignou.vcs.exams.beans.QuestionBean;
import com.ignou.vcs.exams.beans.StudentExamBean;
import com.ignou.vcs.exams.beans.StudentExamStatusBean;

public class ExamsDatabaseActivities 
{
	Connection conn;
	
	public ExamsDatabaseActivities()
	{
		if(conn == null)
		{
			conn = DataSourceFactory.getConnection();
		}
	}
	
	public ArrayList<QuestionBean> getSubjectQuestions(int subjectId)
	{
		ArrayList<QuestionBean> allSubjectQues = new ArrayList<QuestionBean>();
		try
		{
			String query = "select * from questions where subjectId="+subjectId;
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next())
			{
				QuestionBean qb = new QuestionBean();
				qb.setQuestionId(rs.getInt(1)); //question id
				qb.setSubjectId(rs.getInt(2)); //subject id
				qb.setCourseId(rs.getInt(3)); // course id
				qb.setQuestionType(rs.getInt(4)); //question type(multi choice/blanks
				qb.setQuestion(rs.getString(5)); //question
				ArrayList<String> options = new ArrayList<String>();
				String opt = rs.getString(6);
				StringTokenizer st = new StringTokenizer(opt,"|");
				while(st.hasMoreTokens())
				{
					options.add(st.nextToken());
				}
				qb.setOptions(options); // options
				qb.setCorrectAnswer(rs.getString(7)); // correct answer
				qb.setMarks(rs.getInt(8)); // marks for individual question
				//qb.setCorrectAnswer(rs.getString(9)); // explanation
				qb.setCreatedBy(rs.getString(10)); // question created by
				qb.setCreatedDate(rs.getDate(11));
				qb.setUpdatedBy(rs.getString(12));
				qb.setUpdatedDate(rs.getDate(13));
				
				allSubjectQues.add(qb); 
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return allSubjectQues;
	}
	
	public ArrayList<QuestionBean> getCourseQuestions(int courseId)
	{
		ArrayList<QuestionBean> allCourseQues = new ArrayList<QuestionBean>();
		try
		{
			String query = "select * from questions where courseId="+courseId;
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next())
			{
				QuestionBean qb = new QuestionBean();
				qb.setQuestionId(rs.getInt(1)); //question id
				qb.setSubjectId(rs.getInt(2)); //subject id
				qb.setCourseId(rs.getInt(3)); // course id
				qb.setQuestionType(rs.getInt(4)); //question type(multiple choice/blanks
				qb.setQuestion(rs.getString(5)); //question
				ArrayList<String> options = new ArrayList<String>();
				String opt = rs.getString(6);
				StringTokenizer st = new StringTokenizer(opt,"|");
				while(st.hasMoreTokens())
				{
					options.add(st.nextToken());
				}
				qb.setOptions(options); // options
				qb.setCorrectAnswer(rs.getString(8)); // correct answer
				qb.setMarks(rs.getInt(8)); // marks for individual question
				// 9th - explanation
				qb.setCreatedBy(rs.getString(10)); // question created by
				qb.setCreatedDate(rs.getDate(11)); //creation date
				qb.setUpdatedBy(rs.getString(12)); //updated by
				qb.setUpdatedDate(rs.getDate(13)); //updated date
				
				allCourseQues.add(qb); 
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
			
		return allCourseQues;
	}
	
	public QuestionBean getQuestionDetails(int questionId)
	{
		QuestionBean questionDetails = new QuestionBean();
		try
		{
			String query = "select * from questions where questionId="+questionId;
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			if(rs.next())
			{
				questionDetails.setQuestionId(rs.getInt(1)); //question id
				questionDetails.setSubjectId(rs.getInt(2)); //subject id
				questionDetails.setCourseId(rs.getInt(3)); // course id
				questionDetails.setQuestionType(rs.getInt(4)); //question type(multiple choice/blanks
				questionDetails.setQuestion(rs.getString(5)); //question
				ArrayList<String> options = new ArrayList<String>();
				String opt = rs.getString(6);
				StringTokenizer st = new StringTokenizer(opt,"|");
				while(st.hasMoreTokens())
				{
					options.add(st.nextToken());
				}
				questionDetails.setOptions(options); // options
				questionDetails.setCorrectAnswer(rs.getString(7)); // correct answer
				questionDetails.setMarks(rs.getInt(8)); // marks for individual question
				// 9th - explanation
				questionDetails.setCreatedBy(rs.getString(10)); // question created by
				questionDetails.setCreatedDate(rs.getDate(11)); //creation date
				questionDetails.setUpdatedBy(rs.getString(12)); //updated by
				questionDetails.setUpdatedDate(rs.getDate(13)); //updated date
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
			
		return questionDetails;
	}
	
	public boolean createQuestion(QuestionBean qb)
	{
		Boolean isCreated = false;
		try
		{
			Calendar cal = Calendar.getInstance();
			Date dd = new Date(cal.getTimeInMillis());

			String query = "insert into questions (subjectId,courseId," +
					"questiontype,question,options,marks,correctAnswer," +
					"createdBy,createdDate,updatedBy,updatedDate)" +
					"values (?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, qb.getSubjectId());
			pstmt.setInt(2, qb.getCourseId());
			pstmt.setInt(3, qb.getQuestionType());
			pstmt.setString(4, qb.getQuestion());
			String options = "";
			for(int i=0;i<qb.getOptions().size();i++)
			{
				if(i==qb.getOptions().size()-1)
				{
					options = options+ qb.getOptions().get(i);
				}else
				{
					options = options+ qb.getOptions().get(i)+"|";
				}
			}
			pstmt.setString(5, options);
			pstmt.setInt(6, qb.getMarks());
			pstmt.setString(7, qb.getCorrectAnswer());
			pstmt.setString(8, qb.getCreatedBy());
			pstmt.setDate(9,dd );
			pstmt.setString(10, "");
			pstmt.setDate(11,dd);
			
			int i = pstmt.executeUpdate();
			if(i>1)
			{
				isCreated = true;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return isCreated;
	}
	
	public boolean updateQuestion(QuestionBean qb)
	{
		Boolean isUpdated = false;
		
		Calendar cal = Calendar.getInstance();
		Date dd = new Date(cal.getTimeInMillis());

		String query = "update questions set question=?,options=?," +
				"correctAnswer=?,marks=?,updatedBy=?,updatedDate=? where questionid="+qb.getQuestionId();

		try {
			String options = "";
			for(int i=0;i<qb.getOptions().size();i++)
			{
				if(i==qb.getOptions().size()-1)
				{
					options = options+ qb.getOptions().get(i);
				}else
				{
					options = options+ qb.getOptions().get(i)+"|";
				}
			}
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, qb.getQuestion());
			pstmt.setString(2, options);
			pstmt.setString(3, qb.getCorrectAnswer());
			pstmt.setInt(4, qb.getMarks());
			pstmt.setString(5, qb.getUpdatedBy());
			pstmt.setDate(6, dd);
			
			int i = pstmt.executeUpdate();
			if(i>1)
			{
				isUpdated = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return isUpdated;
	}
	
	public boolean deleteQuestion(int questionId)
	{
		Boolean isDeleted = false;
		
		try
		{
			String query = "delete from questions where questionId=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,questionId);
			
			int i = pstmt.executeUpdate();
			if(i==1)
			{
				isDeleted = true;
			}
			else
			{
				isDeleted = false;
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	
		
		return isDeleted;
	}

//--------------------------------------- Exam Related Queries -------------------------------------------	
	
	public ExamBean getExamDetails(int examId)
	{
		ExamBean examDetails = new ExamBean();
		try
		{
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from exams where examId="+examId);
			while(rs.next())
			{
				examDetails.setExamId(rs.getInt(1));
				examDetails.setExamName(rs.getString(2));
				examDetails.setSubjectId(rs.getInt(3));
				examDetails.setCourseId(rs.getInt(4));
				examDetails.setQuestionIds(rs.getString(5));
				examDetails.setMaxMarks(rs.getInt(6));
				examDetails.setPassMarks(rs.getInt(7));
				examDetails.setDuration(rs.getInt(8));
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return examDetails;
	}

	
	public ArrayList<ExamBean> getExamDetailsForApproval()
	{
		ArrayList<ExamBean> approvalExams = new ArrayList<ExamBean>();
		
		try
		{
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from exams where examAppovalStatus=1");
			while(rs.next())
			{
				ExamBean eb = new ExamBean();
				eb.setExamId(rs.getInt(1));
				eb.setExamName(rs.getString(2));
				eb.setSubjectId(rs.getInt(3));
				eb.setCourseId(rs.getInt(4));
				eb.setQuestionIds(rs.getString(5));
				eb.setMaxMarks(rs.getInt(6));
				eb.setPassMarks(rs.getInt(7));
				eb.setDuration(rs.getInt(8));
				
				approvalExams.add(eb);
			}
			
			
			
		}catch(Exception e)
		{
			
		}
		return approvalExams;
	}
	
	public ArrayList<StudentExamStatusBean> getStudentExamDetails(int courseId)
	{
		ArrayList<StudentExamStatusBean> studentExams = new ArrayList<StudentExamStatusBean>();
		try
		{
			String query = "select a.examId,a.examName,a.subjectId,b.result,b.score from exams as a, studentexamstatus as b where a.courseId=b.courseId";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next())
			{
				StudentExamStatusBean seb = new StudentExamStatusBean();
				seb.setCourseId(courseId);
				seb.setExamId(rs.getInt(1));
				seb.setExamName(rs.getString(2));
				seb.setSubjectId(rs.getInt(3));
				seb.setResult(rs.getString(4));
				seb.setScore(rs.getInt(5));
				
				studentExams.add(seb);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return studentExams;
	}


	
	public boolean createExam(ExamBean eb, String createdBy)
	{
		Boolean isCreated = false;
		
		try
		{
			Calendar cal = Calendar.getInstance();
			Date dd = new Date(cal.getTimeInMillis());

			String query = "insert into exams (examName,subjectId,courseId," +
					"examAppovalComments,questionIds,maxMarks," +
					"passMarks,examAppovalStatus,duration,examCreatedBy," +
					"examCreationDate,approvedBy,approvalDate) values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, eb.getExamName());
			pstmt.setInt(2,eb.getSubjectId() );
			pstmt.setInt(3, eb.getCourseId());
			pstmt.setString(4, "");
			pstmt.setString(5, eb.getQuestionIds());
			pstmt.setInt(6, eb.getMaxMarks());
			pstmt.setInt(7, eb.getPassMarks());
			pstmt.setInt(8, 1);// approval status should be 1. Not approved by default.
			pstmt.setInt(9, eb.getDuration());
			pstmt.setString(10, createdBy);
			pstmt.setDate(11, dd);
			pstmt.setString(12, "");
			pstmt.setDate(13, dd);
			
			int i = pstmt.executeUpdate();
			if(i>1)
			{
				isCreated = true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return isCreated;
	}
	
	public boolean updateExam(ExamBean eb,String approvedBy)
	{
		Boolean isUpdated = false;
		
		try
		{
			Calendar cal = Calendar.getInstance();
			Date dd = new Date(cal.getTimeInMillis());

			String query = "update exams set examName=?" +
					"examAppovalComments=?,questionIds=?,maxMarks=?," +
					"passMarks=?,examAppovalStatus=?,duration=?," +
					"approvedBy=?,approvalDate=? where examId="+eb.getExamId();
			
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, eb.getExamName());
			pstmt.setString(2, eb.getExamAppovalComments());
			pstmt.setString(3, eb.getQuestionIds());
			pstmt.setInt(4, eb.getMaxMarks());
			pstmt.setInt(5, eb.getPassMarks());
			pstmt.setInt(6, eb.getExamAppovalStatus());
			pstmt.setInt(7, eb.getDuration());
			pstmt.setString(8, approvedBy);
			pstmt.setDate(9, dd);
			
			int i = pstmt.executeUpdate();
			if(i>1)
			{
				isUpdated = true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return isUpdated;
	}
	
	public boolean approveExam(int examId, String approvedBy,String approvalComments, int status,int subjectId, int courseId)
	{
		Boolean isApproved = false;
		
		try
		{
			Calendar cal = Calendar.getInstance();
			Date dd = new Date(cal.getTimeInMillis());

			String query = "update exams set examAppovalComments=?,examAppovalStatus=?," +
					"approvedBy=?,approvalDate=? where examId="+examId;
			
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, approvalComments);
			pstmt.setInt(2, status);
			pstmt.setString(3, approvedBy);
			pstmt.setDate(4, dd);
			
			int i = pstmt.executeUpdate();
			
			if(i>0)
			{
				isApproved = true;
				if(status==0)
				{
					StudentExamBean sb = new StudentExamBean();
					sb.setSubjectId(subjectId);
					sb.setCourseId(courseId);
					sb.setExamId(examId);
					
					Boolean b = updateCourseStudents(sb);
				}
			}else
			{
				isApproved = false;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return isApproved;
	}
	
	private boolean updateCourseStudents(StudentExamBean sb)
	{
		Boolean isUpdated = false;
		try
		{
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select userId from student where courseId="+sb.getCourseId());
			
			while(rs.next())
			{
				String userId = rs.getString(1);
				System.out.println(userId + " user for course "+sb.getCourseId());
				String query = "insert into studentexamstatus (" +
						"examId,subjectId,courseId,userId,score,result) values " +
						"(?,?,?,?,?,?)";
				PreparedStatement pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, sb.getExamId());
				pstmt.setInt(2, sb.getSubjectId());
				pstmt.setInt(3, sb.getCourseId());
				pstmt.setString(4, userId);
				pstmt.setInt(5, 0);
				pstmt.setString(6, "enrolled");
				
				int i = pstmt.executeUpdate();
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return isUpdated;
	}
	
	public boolean deleteExam(int examId)
	{
		Boolean isDeleted = false;
		
		try
		{
			String query = "delete from exam where examid=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,examId);
			
			int i = pstmt.executeUpdate();
			if(i>1)
			{
				isDeleted = true;
			}
			else
			{
				isDeleted = false;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return isDeleted;
	}
	
	public StudentExamBean getExamPaper(int examId,String userName)
	{
		StudentExamBean seb = new StudentExamBean();
		ArrayList<QuestionBean> questions = getExamQuestions(examId);
		System.out.println(questions.size() + "  No of questions");
		try
		{
			Statement stmt = conn.createStatement();
			int subjectId = 0;
			int courseId = 0;
			String subjectName = "";
			String courseName = "";
			
			seb.setExamId(examId);
			seb.setQuestions(questions);
			
			ResultSet rs = stmt.executeQuery("select subjectId,courseId,examName," +
					"maxMarks,passMarks,duration from exams where examId=" + examId);
			if(rs.next())
			{
				subjectId = rs.getInt(1);
				seb.setSubjectId(subjectId);
				courseId = rs.getInt(2);
				seb.setCourseId(courseId);
				seb.setExamName(rs.getString(3));
				seb.setMaxMarks(rs.getInt(4));
				seb.setPassMarks(rs.getInt(5));
				seb.setDuration(rs.getInt(6));
			}
			
			if(courseId!=0)
			{
				courseName = getCourseName(courseId);
			}
			
			if(subjectId!=0)
			{
				subjectName = getSubjectName(subjectId);
			}
			
			seb.setCourseName(courseName);
			seb.setSubjectName(subjectName);
			seb.setUserName(userName);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return seb;
	}
	
	public String getSubjectName(int subjectId)
	{
		String subjectName = "";
		try
		{
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select subjectName from subjects");
			if(rs.next())
			{
				subjectName = rs.getString(1);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return subjectName;
	}
	
	public String getCourseName(int courseId)
	{
		String courseName = "";
		try
		{
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select Name from course");
			if(rs.next())
			{
				courseName = rs.getString(1);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return courseName;
	}

	public ArrayList<QuestionBean> getExamQuestions(int examId)
	{
		ArrayList<QuestionBean> questions = new ArrayList<QuestionBean>();
		
		try
		{
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select questionIds from exams where examid="+examId);
			if(rs.next())
			{
				String qIds = rs.getString(1);
				StringTokenizer st = new StringTokenizer(qIds,"|");
				while(st.hasMoreTokens())
				{
					QuestionBean qb = new QuestionBean();
					rs = stmt.executeQuery("select * from questions where questionId="+st.nextToken());
					if(rs.next())
					{
						qb.setQuestionId(rs.getInt(1));
						qb.setSubjectId(rs.getInt(2));
						qb.setCourseId(rs.getInt(3));
						qb.setQuestionType(rs.getInt(4));
						qb.setQuestion(rs.getString(5));
						
						ArrayList<String> options = new ArrayList<String>();
						String opt = rs.getString(6);
						StringTokenizer stt = new StringTokenizer(opt,"|");
						while(stt.hasMoreTokens())
						{
							options.add(stt.nextToken());
						}
						qb.setOptions(options);
						qb.setCorrectAnswer(rs.getString(7));
						qb.setMarks(rs.getInt(8));
						//9th explanation
						qb.setCreatedBy(rs.getString(10));
						qb.setCreatedDate(rs.getDate(11));
						qb.setUpdatedBy(rs.getString(12));
						qb.setUpdatedDate(rs.getDate(13));
					}
					questions.add(qb);
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return questions;
	}

	public Boolean updateExamStatus(StudentExamStatusBean sesb)
	{
		Boolean isUpdated = true;
		try
		{
			Calendar cal = Calendar.getInstance();
			Date dd = new Date(cal.getTimeInMillis());
			
			String query = "update studentexamstatus set result=?,score=?, completionDate=? where userid=? AND examId=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, sesb.getResult());
			pstmt.setInt(2, sesb.getScore());
			pstmt.setDate(3, dd);
			pstmt.setString(4, sesb.getUserName());
			pstmt.setInt(5, sesb.getExamId());
			
			int i = pstmt.executeUpdate();
			if(i==1)
			{
				isUpdated = true;
			}
			else
			{
				isUpdated = false;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return isUpdated;
	}

	
	public ArrayList<ExamBean> getAllSubjectExams(int subjectId)
	{
		ArrayList<ExamBean> allExams = new ArrayList<ExamBean>();
		
		try
		{
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from exams where subjectid="+subjectId);
			while(rs.next())
			{
				ExamBean eb = new ExamBean();
				eb.setExamId(rs.getInt(1));
				eb.setExamName(rs.getString(2));
				eb.setSubjectId(rs.getInt(3));
				eb.setCourseId(rs.getInt(4));
				eb.setQuestionIds(rs.getString(5));
				eb.setMaxMarks(rs.getInt(6));
				eb.setPassMarks(rs.getInt(7));
				eb.setDuration(rs.getInt(8));
				
				allExams.add(eb);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return allExams;
	}
	
	public StudentExamStatusBean getStudentExamResults(int examId,String userName)
	{
		StudentExamStatusBean studentExamResult = new StudentExamStatusBean();
		try
		{
			String query = "select * from studentexamstatus where examId="+examId+" AND userid='"+userName+"'";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next())
			{
				studentExamResult.setExamId(rs.getInt(2));
				studentExamResult.setSubjectId(rs.getInt(3));
				studentExamResult.setCourseId(rs.getInt(4));
				studentExamResult.setUserName(rs.getString(5));
				studentExamResult.setScore(rs.getInt(6));
				studentExamResult.setResult(rs.getString(7));
				studentExamResult.setCompletionDate(rs.getDate(8));
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return studentExamResult;
	}
	
	
	//SELECT * FROM subjects ORDER BY subjectId LIMIT 5;  to get 5 records from first
	//SELECT * FROM subjects ORDER BY subjectId DESC LIMIT 5;  to get 5 records from last
	
}
