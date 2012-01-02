package com.ignou.vcs.forms;

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
public class AddExamForm extends ActionForm
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String examName="";
	private int subjectId;
	private String questionIds="";
	private int maxMarks;
	private int passMarks;
	private int duration;
	
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
	
	public int getDuration() 
	{
		return duration;
	}
	public void setDuration(int duration) 
	{
		this.duration = duration;
	}
	
	public String getQuestionIds() 
	{
		return questionIds;
	}
	public void setQuestionIds(String questionIds) 
	{
		this.questionIds = questionIds;
	}
	
	public int getSubjectId() 
	{
		return subjectId;
	}
	public void setSubjectId(int subjectId) 
	{
		this.subjectId = subjectId;
	}
	
    public void reset(ActionMapping mapping, HttpServletRequest request) 
    {

	// Reset values are provided as samples only. Change as appropriate.
    	examName = null;
    	questionIds = null;
    	maxMarks=0;
    	passMarks=0;
    	duration=0;
    	subjectId=0;
    }

    public ActionErrors validate(ActionMapping mapping,
	    final HttpServletRequest request) 
    {

	final ActionErrors errors = new ActionErrors();
	// Validate the fields in your form, adding
	// adding each error to this.errors as found, e.g.

	if ((getExamName() == null) || (getExamName().length() == 0)) 
	 {
	   errors.add("examName", new ActionError("error.exams.examName"));
	 } 
	 if ((getSubjectId() == 0)) 
	 {
	   errors.add("subjectId", new ActionError("error.exams.subjectId"));
	 }
	 if ((getMaxMarks() == 0)) 
	 {
	   errors.add("maxMarks", new ActionError("error.exams.maxMarks"));
	 }
	 if ((getPassMarks() == 0)) 
	 {
	   errors.add("passMarks", new ActionError("error.exams.passMarks"));
	 }
	 if(getDuration()==0)
	 {
		 errors.add("examDuration", new ActionError("error.exams.examDuration")); 
	 }
	 
	return errors;

    }
}
