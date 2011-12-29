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
	
	public void reset(ActionMapping mapping, HttpServletRequest request) 
    {
		// Reset values are provided as samples only. Change as appropriate.
		examId = 0;
		examName = null;
		questionIds = null;
		maxMarks = 0;
		passMarks = 0;
		duration = 0;
    }
	
    public ActionErrors validate(ActionMapping mapping,
	    HttpServletRequest request) 
    {

	ActionErrors errors = new ActionErrors();
	// Validate the fields in your form, adding
	// adding each error to this.errors as found, e.g.
	if ((getExamName() == null) || (getExamName().length() == 0)) 
	 {
	   errors.add("examName", new ActionError("error.exams.examName"));
	 } else
	 if ((getMaxMarks() == 0)) 
	 {
	   errors.add("maxMarks", new ActionError("error.exams.maxMarks"));
	 }else
	 if ((getPassMarks() == 0)) 
	 {
	   errors.add("passMarks", new ActionError("error.exams.passMarks"));
	 }else
	 if(getDuration()==0)
	 {
		 errors.add("examDuration", new ActionError("error.exams.examDuration")); 
	 }
	
		return errors;

    }
   
}
