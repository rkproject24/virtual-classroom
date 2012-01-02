package com.ignou.vcs.exams.beans;

import java.util.Date;

/**
 **/

public class StudentExamBean 
{
	private String examName="";
	private int examId;
	private int subjectId;
	private int courseId;
	String result="";
	int score;
	Date completionDate;
	String userName = "";
	
	public String getExamName() 
	{
		return examName;
	}
	public void setExamName(String examName) 
	{
		this.examName = examName;
	}
	
	public int getExamId() 
	{
		return examId;
	}
	public void setExamId(int examId) 
	{
		this.examId = examId;
	}
	
	public int getSubjectId() 
	{
		return subjectId;
	}
	public void setSubjectId(int subjectId) 
	{
		this.subjectId = subjectId;
	}
	
	public int getCourseId() 
	{
		return courseId;
	}
	public void setCourseId(int courseId) 
	{
		this.courseId = courseId;
	}
	
	public int getScore() 
	{
		return score;
	}
	public void setScore(int score) 
	{
		this.score = score;
	}
	
	public String getUserName()
	{
		return userName;
	}
	
	public Date getCompletionDate() 
	{
		return completionDate;
	}
	public void setCompletionDate(Date completionDate) 
	{
		this.completionDate = completionDate;
	}
	
	public void setUserName(String userName)
	{
		this.userName = userName;
	}
	
	public String getResult()
	{
		return result;
	}
	
	public void setResult(String result)
	{
		this.result = result;
	}

}
