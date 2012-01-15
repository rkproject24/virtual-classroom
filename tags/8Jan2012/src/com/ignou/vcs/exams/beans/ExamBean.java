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

public class ExamBean 
{
	private String examName="";
	private int examId;
	private int examType;
	private int subjectId;
	private int courseId;
	private String examAppovalComments;
	private String questionIds="";
	private int maxMarks;
	private int passMarks;
	private int examAppovalStatus; 
	private int duration;
	private String examCreatedBy = "";
	private Date examCreationDate;
	private String approvedBy = "";
	private Date approvalDate;
	
	public String getExamName() 
	{
		return examName;
	}
	public void setExamName(String examName) 
	{
		this.examName = examName;
	}
	
	public int getMaxMarks() 
	{
		return maxMarks;
	}
	public void setMaxMarks(int maxMarks) 
	{
		this.maxMarks = maxMarks;
	}
	
	public int getPassMarks() 
	{
		return passMarks;
	}
	public void setPassMarks(int passMarks) 
	{
		this.passMarks = passMarks;
	}
	
	public int getExamAppovalStatus() 
	{
		return examAppovalStatus;
	}
	public void setExamAppovalStatus(int examAppovalStatus) 
	{
		this.examAppovalStatus = examAppovalStatus;
	}
	
	public int getDuration() 
	{
		return duration;
	}
	public void setDuration(int duration) 
	{
		this.duration = duration;
	}
	
	public String getExamAppovalComments() 
	{
		return examAppovalComments;
	}
	public void setExamAppovalComments(String examAppovalComments) 
	{
		this.examAppovalComments = examAppovalComments;
	}
	
	public String getQuestionIds() 
	{
		return questionIds;
	}
	public void setQuestionIds(String questionIds) 
	{
		this.questionIds = questionIds;
	}
	
	public int getExamId() 
	{
		return examId;
	}
	public void setExamId(int examId) 
	{
		this.examId = examId;
	}
	
	public int getExamType() 
	{
		return examType;
	}
	public void setExamType(int examType) 
	{
		this.examType = examType;
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
	
	public String getExamCreatedBy() 
	{
		return examCreatedBy;
	}
	public void setExamCreatedBy(String examCreatedBy) 
	{
		this.examCreatedBy = examCreatedBy;
	}
	
	public Date getExamCreationDate() 
	{
		return examCreationDate;
	}
	public void setExamCreationDate(Date examCreationDate) 
	{
		this.examCreationDate = examCreationDate;
	}
	
	public String getApprovedBy() 
	{
		return approvedBy;
	}
	public void setApprovedBy(String approvedBy) 
	{
		this.approvedBy = approvedBy;
	}
	
	public Date getApprovalDate() 
	{
		return approvalDate;
	}
	public void setApprovalDate(Date approvalDate) 
	{
		this.approvalDate = approvalDate;
	}


}
