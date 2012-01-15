package com.ignou.vcs.forms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 * Form bean for a Struts application.
 * Users may access 3 fields on this form:
 * <ul>
 * <li>name - [your comment here]
 * <li>duration - [your comment here]
 * <li>fees - [your comment here]
 * </ul>
 * @version 	1.0
 * @author
 */
public class AddCourseForm extends ActionForm

{

    private String name = null;

    private int duration;

    private String fees = null;
    
    private String subject = null;

    /**
     * Get name
     * @return String
     */
    public String getName() {
	return name;
    }

    /**
     * Set name
     * @param <code>String</code>
     */
    public void setName(String n) {
	this.name = n;
    }

    /**
     * Get duration
     * @return int
     */
    public int getDuration() {
	return duration;
    }

    /**
     * Set duration
     * @param <code>int</code>
     */
    public void setDuration(int d) {
	this.duration = d;
    }

    /**
     * Get fees
     * @return String
     */
    public String getFees() {
	return fees;
    }

    /**
     * Set fees
     * @param <code>String</code>
     */
    public void setFees(String f) {
	this.fees = f;
    }

    public void reset(ActionMapping mapping, HttpServletRequest request) {

	// Reset values are provided as samples only. Change as appropriate.

	name = null;
	duration = 0;
	fees = null;
	subject = null;
    }

    public ActionErrors validate(ActionMapping mapping,
	    HttpServletRequest request) {

	ActionErrors errors = new ActionErrors();
	if(getName()==null || getName().equalsIgnoreCase(""))
	{
		errors.add("courseName", new ActionError("error.addCourse.name"));
	}
	if(getDuration()==0)
	{
		errors.add("courseDuration", new ActionError("error.addCourse.courseDuration"));
	}
	if(getFees()==null || getFees().equalsIgnoreCase(""))
	{
		errors.add("courseFees", new ActionError("error.addCourse.courseFees"));
	}
	
	return errors;

    }

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}
}
