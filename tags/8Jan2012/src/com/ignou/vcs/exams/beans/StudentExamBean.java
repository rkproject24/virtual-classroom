package com.ignou.vcs.exams.beans;

import java.util.ArrayList;

/**
 **/

public class StudentExamBean 
{
	private String examName="";
	private int examId;
	private int subjectId;
	private int courseId;
	String userName = "";
	ArrayList<QuestionBean> questions;
	String courseName = "";
	String subjectName = "";
	private int maxMarks;
	private int passMarks;
	private int duration;
	/*String studentName = "";
	String address;
	String email;
	String contactNumber;*/
	
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
	
	public String getSubjectName() 
	{
		return subjectName;
	}
	public void setSubjectName(String subjectName) 
	{
		this.subjectName = subjectName;
	}
	
	public int getCourseId() 
	{
		return courseId;
	}
	public void setCourseId(int courseId) 
	{
		this.courseId = courseId;
	}
	
	public String getCourseName() 
	{
		return courseName;
	}
	public void setCourseName(String courseName) 
	{
		this.courseName = courseName;
	}

	public String getUserName()
	{
		return userName;
	}
	public void setUserName(String userName)
	{
		this.userName = userName;
	}
	
	public ArrayList<QuestionBean> getQuestions()
	{
		return questions;
	}
	public void setQuestions(ArrayList<QuestionBean> questions)
	{
		this.questions = questions;
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

	public int getDuration() 
	{
		return duration;
	}
	public void setDuration(int duration) 
	{
		this.duration = duration;
	}
	
	/*public String getStudentName() 
	{
		return studentName;
	}
	public void setStudentName(String studentName) 
	{
		this.studentName = studentName;
	}
	
	public String getAddress() 
	{
		return address;
	}
	public void setAddress(String address) 
	{
		this.address = address;
	}
	
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactP) {
		this.contactNumber = contactP;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}*/

}
