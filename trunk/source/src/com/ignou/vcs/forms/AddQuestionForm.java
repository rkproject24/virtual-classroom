package com.ignou.vcs.forms;

import java.util.ArrayList;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 * Form bean for a Struts application.
 * Users may access 2 fields on this form:
 * <ul>
 * <li>username - [your comment here]
 * <li>password - [your comment here]
 * </ul>
 * @version 	1.0
 * @author
 */
public class AddQuestionForm extends ActionForm
{
	int subjectId;
	int courseId;
	int questionType;
	String question;
	String options;
	int marks;
	String correctAnswer;
	
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
	
	public String getOptions() 
	{
		return options;
	}
	public void setOptions(String options) 
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

    public void reset(ActionMapping mapping, HttpServletRequest request) 
    {

	// Reset values are provided as samples only. Change as appropriate.
    	subjectId = 0;
    	courseId = 0;
    	questionType = 0;
    	question = null;
    	options = null;
    	marks = 0;
    	correctAnswer = null;
    }

    public ActionErrors validate(ActionMapping mapping,
	    HttpServletRequest request) {

	ActionErrors errors = new ActionErrors();
	// Validate the fields in your form, adding
	// adding each error to this.errors as found, e.g.

	 if (getQuestionType() < 0) 
	 {
	   errors.add("questionType", new ActionError("error.questions.questionType"));
	 }else if ((getQuestion() == null) || (getQuestion().length() == 0)) 
	 {
	   errors.add("question", new ActionError("error.questions.question"));
	 }else if (getQuestionType()==0 && (getOptions() == null) || (getOptions().length() == 0)) 
	 {
		   errors.add("options", new ActionError("error.questions.options"));
	 }else if (getMarks() == 0) 
	 {
		   errors.add("marks", new ActionError("error.questions.marks"));
	 }else if ((getCorrectAnswer() == null) || (getCorrectAnswer().length() == 0)) 
	 {
		   errors.add("correctAnswer", new ActionError("error.questions.correctAnswer"));
	 }	 
	return errors;

    }
}
