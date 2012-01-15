package com.ignou.vcs.exams.beans;

import java.util.ArrayList;
import java.util.Date;
/**
 * questionType: This will store the type of question. Values: 0 - Multi choice   1 - fill in the blanks
 * Options column will be null in case of questionType=1
 * 
 * 
 * */
public class QuestionBean 
{
	int questionId;
	int subjectId;
	int courseId;
	int questionType;
	String question;
	ArrayList<String> options;
	int marks;
	String correctAnswer;
	String createdBy;
	String updatedBy;
	Date createdDate;
	Date updatedDate;
	
	public int getQuestionId() 
	{
		return questionId;
	}
	public void setQuestionId(int questionId) 
	{
		this.questionId = questionId;
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
	
	public int getQuestionType() 
	{
		return questionType;
	}
	public void setQuestionType(int questionType) 
	{
		this.questionType = questionType;
	}
	
	public String getCorrectAnswer() 
	{
		return correctAnswer;
	}
	public void setCorrectAnswer(String correctAnswer) 
	{
		this.correctAnswer = correctAnswer;
	}
	
	public String getQuestion() 
	{
		return question;
	}
	public void setQuestion(String question) 
	{
		this.question = question;
	}
	
	public ArrayList<String> getOptions() 
	{
		return options;
	}
	public void setOptions(ArrayList<String> options) 
	{
		this.options = options;
	}
	
	public int getMarks() 
	{
		return marks;
	}
	public void setMarks(int marks) 
	{
		this.marks = marks;
	}
	
	public String getCreatedBy() 
	{
		return createdBy;
	}
	public void setCreatedBy(String createdBy) 
	{
		this.createdBy = createdBy;
	}
	
	public String getUpdatedBy() 
	{
		return updatedBy;
	}
	public void setUpdatedBy(String updatedBy) 
	{
		this.updatedBy = updatedBy;
	}
	
	public Date getCreatedDate() 
	{
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) 
	{
		this.createdDate = createdDate;
	}
	
	public Date getUpdatedDate() 
	{
		return updatedDate;
	}
	public void setUpdatedDate(Date updatedDate) 
	{
		this.updatedDate = updatedDate;
	}

}
