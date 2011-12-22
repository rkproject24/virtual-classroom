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
	private int examType;
	private int subjectId;
	private int courseId;
	private String questionIds="";
	private int maxMarks;
	private int passMarks;
	private int duration;
	
	public String getExamName() 
	{
		return examName;
	}
	public void setExamName(final String examName) 
	{
		this.examName = examName;
	}
	
	public int getMaxMarks() 
	{
		return maxMarks;
	}
	public void setMaxMarks(final int maxMarks) 
	{
		this.maxMarks = maxMarks;
	}
	
	public int getPassMarks() 
	{
		return passMarks;
	}
	public void setPassMarks(final int passMarks) 
	{
		this.passMarks = passMarks;
	}
	
	public int getDuration() 
	{
		return duration;
	}
	public void setDuration(final int duration) 
	{
		this.duration = duration;
	}
	
	public String getQuestionIds() 
	{
		return questionIds;
	}
	public void setQuestionIds(final String questionIds) 
	{
		this.questionIds = questionIds;
	}
	
	public int getExamType() 
	{
		return examType;
	}
	public void setExamType(final int examType) 
	{
		this.examType = examType;
	}
	
	public int getSubjectId() 
	{
		return subjectId;
	}
	public void setSubjectId(final int subjectId) 
	{
		this.subjectId = subjectId;
	}
	
	public int getCourseId() 
	{
		return courseId;
	}
	public void setCourseId(final int courseId) 
	{
		this.courseId = courseId;
	}

    public void reset(final ActionMapping mapping, final HttpServletRequest request) 
    {

	// Reset values are provided as samples only. Change as appropriate.
    	examName = null;
    	examType=0;
    	subjectId=0;
    	courseId=0;
    	questionIds = null;
    	maxMarks=0;
    	passMarks=0;
    	duration=0;
    }

    public ActionErrors validate(final ActionMapping mapping,
	    final HttpServletRequest request) 
    {

	final ActionErrors errors = new ActionErrors();
	// Validate the fields in your form, adding
	// adding each error to this.errors as found, e.g.

	if ((getExamName() == null) || (getExamName().length() == 0)) 
	 {
	   errors.add("exams", new ActionError("error.exams.examName"));
	 }else if ((getSubjectId() == 0)) 
	 {
	   errors.add("exams", new ActionError("error.exams.subjectId"));
	 }else if(getCourseId()==0)
	 {
		 errors.add("exams", new ActionError("error.exams.courseId")); 
	 }
	 else if(getExamType()==0)
	 {
		 errors.add("exams", new ActionError("error.exams.examType")); 
	 }else if ((getQuestionIds() == null) || (getQuestionIds().length() == 0)) 
	 {
	   errors.add("exams", new ActionError("error.exams.questions"));
	 }else if ((getMaxMarks() == 0)) 
	 {
	   errors.add("exams", new ActionError("error.exams.maxMarks"));
	 }else if ((getPassMarks() == 0)) 
	 {
	   errors.add("exams", new ActionError("error.exams.passMarks"));
	 }else if(getDuration()==0)
	 {
		 errors.add("exams", new ActionError("error.exams.examDuration")); 
	 }
	 
	return errors;

    }
}
