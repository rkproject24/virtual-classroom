package com.ignou.vcs.forms;

import java.util.ArrayList;
import java.util.Date;
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
public class UpdateExamForm extends ActionForm
{
	private int examId;
	private String examName="";
	private String examAppovalComments;
	private String questionIds="";
	private int maxMarks;
	private int passMarks;
	private int examAppovalStatus; 
	private int duration;
	private String approvedBy = "";
	
	public int getExamId() 
	{
		return examId;
	}
	public void setExamId(int examId) 
	{
		this.examId = examId;
	}
	
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
	
	public String getApprovedBy() 
	{
		return approvedBy;
	}
	public void setApprovedBy(String approvedBy) 
	{
		this.approvedBy = approvedBy;
	}
	
	public void reset(ActionMapping mapping, HttpServletRequest request) 
    {
		// Reset values are provided as samples only. Change as appropriate.
		examId = 0;
		examName = null;
		examAppovalComments = null;
		questionIds = null;
		maxMarks = 0;
		passMarks = 0;
		examAppovalStatus = 0; 
		duration = 0;
		approvedBy = null;
    }
	
    public ActionErrors validate(ActionMapping mapping,
	    HttpServletRequest request) 
    {

	ActionErrors errors = new ActionErrors();
	// Validate the fields in your form, adding
	// adding each error to this.errors as found, e.g.

	 /*if ((getUserName() == null) || (getUserName().length() == 0)) 
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
