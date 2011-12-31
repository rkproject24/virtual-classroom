package com.ignou.vcs.exams.beans;

import java.util.Date;

/**
 * examType: There are two types of exams: Major/Minor.
 * Major exam means, an exam at the end of course(contains questions from all subjects in a course.
 * Minor exam means, an exam at the end of each subject.
 * Indications: 0 - Major Exam    1 - Minor Exam
 * 
 * examApprovalStatus: Each exam should be approved by management. Status will be stored and only approved
 * exams will be displayed in students exams page. Values: 0 - Approved  1 - Not Approved.
 * 
 * examAppovalComments: These comments will be given by management. There are some comments that will be given
 * by management when he/she rejects the exam. Generally there may not be any comments for "approved" status.
 * 
 * duration: This stores the value of the "exam duration" in minutes.[e.g.: 2 hrs - 120 minutes]
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
