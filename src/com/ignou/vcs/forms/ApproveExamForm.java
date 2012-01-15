package com.ignou.vcs.forms;

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
public class ApproveExamForm extends ActionForm
{
	private int examId;
	private String examAppovalComments;
	private int examAppovalStatus; 
	
	public int getExamId() 
	{
		return examId;
	}
	public void setExamId(int examId) 
	{
		this.examId = examId;
	}
	
	public int getExamAppovalStatus() 
	{
		return examAppovalStatus;
	}
	public void setExamAppovalStatus(int examAppovalStatus) 
	{
		this.examAppovalStatus = examAppovalStatus;
	}
	
	public String getExamAppovalComments() 
	{
		return examAppovalComments;
	}
	public void setExamAppovalComments(String examAppovalComments) 
	{
		this.examAppovalComments = examAppovalComments;
	}
	
	
	public void reset(ActionMapping mapping, HttpServletRequest request) 
    {
		// Reset values are provided as samples only. Change as appropriate.
		examId = 0;
		examAppovalComments = null;
		examAppovalStatus = 0; 
    }
	
    public ActionErrors validate(ActionMapping mapping,
	    HttpServletRequest request) 
    {

	ActionErrors errors = new ActionErrors();
	// Validate the fields in your form, adding
	// adding each error to this.errors as found, e.g.
	System.out.println(getExamAppovalStatus() + "");
	if ((getExamAppovalComments() == null || getExamAppovalComments().length() == 0)) 
	 {
		if(getExamAppovalStatus()==1)
		{
			errors.add("examAppovalComments", new org.apache.struts.action.ActionError("error.exams.examAppovalComments"));
		}
	
	 }
	 
		return errors;

    }
   
}
