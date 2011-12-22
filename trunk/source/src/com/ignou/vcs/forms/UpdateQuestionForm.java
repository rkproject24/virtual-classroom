package com.ignou.vcs.forms;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.servlet.http.HttpServletRequest;
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
public class UpdateQuestionForm extends ActionForm
{
	int questionId;
	String question;
	ArrayList<String> options;
	int marks;
	String correctAnswer;
	String updatedBy;
	
	public int getQuestionId() 
	{
		return questionId;
	}
	public void setQuestionId(int questionId) 
	{
		this.questionId = questionId;
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
	
	public String getUpdatedBy() 
	{
		return updatedBy;
	}
	public void setUpdatedBy(String updatedBy) 
	{
		this.updatedBy = updatedBy;
	}

    public void reset(ActionMapping mapping, HttpServletRequest request) 
    {
	// Reset values are provided as samples only. Change as appropriate.
    	question = null;
    	options = null;
    	marks = 0;
    	correctAnswer = null;
    	updatedBy = null;
    }

    public ActionErrors validate(ActionMapping mapping,
	    HttpServletRequest request) {

	ActionErrors errors = new ActionErrors();
	// Validate the fields in your form, adding
	// adding each error to this.errors as found, e.g.

	/* if ((getUserName() == null) || (getUserName().length() == 0)) 
	 {
	   errors.add("forgotPassword", new org.apache.struts.action.ActionError("error.forgotPassword.userName.required"));
	 }else if ((getEmail() == null) || (getEmail().length() == 0)) 
	 {
	   errors.add("forgotPassword", new org.apache.struts.action.ActionError("error.forgotPassword.email.required"));
	 }else if(isValidEmail(getEmail())==false)
	 {
		 errors.add("forgotPassword", new org.apache.struts.action.ActionError("error.forgotPassword.validEmail.required")); 
	 }*/
	 
	return errors;

    }
    
}
