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
	private String approvedBy = "";
	
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
		examAppovalComments = null;
		examAppovalStatus = 0; 
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
