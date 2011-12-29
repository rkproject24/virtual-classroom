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
				qb.setMarks(rs.getInt(7)); // marks for individual question
				qb.setCorrectAnswer(rs.getString(8)); // correct answer
				qb.setCreatedBy(rs.getString(9)); // question created by
				qb.setCreatedDate(rs.getDate(10)); //creation date
				qb.setUpdatedBy(rs.getString(11)); //updated by
				qb.setUpdatedDate(rs.getDate(12)); //updated date
				
				allCourseQues.add(qb); 
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
			
		return allCourseQues;
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
	
	public ArrayList<ExamBean> getExamDetails(int examId)
	{
		ArrayList<ExamBean> examDetails = new ArrayList<ExamBean>();
		return examDetails;
	}
	
	public ArrayList<ExamBean> getExamDetailsForApproval()
	{
		ArrayList<ExamBean> approvalExams = new ArrayList<ExamBean>();
		
		try
		{
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from exams where examApprovelStatus=1");
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
	
	public boolean approveExam(int examId, String approvedBy,String approvalComments, int status)
	{
		Boolean isApproved = false;
		
		try
		{
			Calendar cal = Calendar.getInstance();
			Date dd = new Date(cal.getTimeInMillis());

			String query = "update exams (examAppovalComments,examAppovalStatus," +
					"approvedBy,approvalDate) values (?,?,?,?,?,?,?,?,?) where examId="+examId;
			
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, approvalComments);
			pstmt.setInt(2, status);
			pstmt.setString(3, approvedBy);
			pstmt.setDate(4, dd);
			
			int i = pstmt.executeUpdate();
			
			if(i>1)
			{
				isApproved = true;
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
	
	public ArrayList<QuestionBean> getExamPaper(int examId)
	{
		ArrayList<QuestionBean> questions = new ArrayList<QuestionBean>();
		
		try
		{
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select questionIds from exam where examid="+examId);
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
						qb.setQuestionType(rs.getInt(3));
						qb.setQuestion(rs.getString(4));
						
						ArrayList<String> options = new ArrayList<String>();
						String opt = rs.getString(5);
						StringTokenizer stt = new StringTokenizer(opt,"|");
						while(stt.hasMoreTokens())
						{
							options.add(stt.nextToken());
						}
						qb.setOptions(options);
						qb.setCorrectAnswer(rs.getString(6));
						qb.setMarks(rs.getInt(7));
						qb.setCreatedBy(rs.getString(8));
						qb.setCreatedDate(rs.getDate(9));
						qb.setUpdatedBy(rs.getString(10));
						qb.setUpdatedDate(rs.getDate(11));
					}
					questions.add(qb);
				}
			}else
			{
				
			}
		}
		catch(Exception e)
		{
			
		}
		
		return questions;
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
	
	//SELECT * FROM subjects ORDER BY subjectId LIMIT 5;  to get 5 records from first
	//SELECT * FROM subjects ORDER BY subjectId DESC LIMIT 5;  to get 5 records from last
	
}
