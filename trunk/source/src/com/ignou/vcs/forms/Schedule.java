package com.ignou.vcs.forms;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 * Form bean for a Struts application.
 * Users may access 6 fields on this form:
 * <ul>
 * <li>course - [your comment here]
 * <li>date - [your comment here]
 * <li>time - [your comment here]
 * <li>title - [your comment here]
 * <li>description - [your comment here]
 * <li>duration - [your comment here]
 * </ul>
 * @version 	1.0
 * @author
 */
public class Schedule extends ActionForm

{

	private String organizedBy = null;
	
	private String organizedFor = null;
	
	
	
	private String course = null;

    private String date = null;

    private String time = null;

    private String title = null;

    private String description = null;

    private String duration = null;
    private String subject = null;
    private String course1 = null;

    /**
     * Get course
     * @return String
     */
    public String getCourse() {
	return course;
    }

    /**
     * Set course
     * @param <code>String</code>
     */
    public void setCourse(String c) {
	this.course = c;
    }

    /**
     * Get date
     * @return String
     */
    public String getDate() {
	return date;
    }

    /**
     * Set date
     * @param <code>String</code>
     */
    public void setDate(String d) {
	this.date = d;
    }

    /**
     * Get time
     * @return String
     */
    public String getTime() {
	return time;
    }

    /**
     * Set time
     * @param <code>String</code>
     */
    public void setTime(String t) {
	this.time = t;
    }

    /**
     * Get title
     * @return String
     */
    public String getTitle() {
	return title;
    }

    /**
     * Set title
     * @param <code>String</code>
     */
    public void setTitle(String t) {
	this.title = t;
    }

    /**
     * Get description
     * @return String
     */
    public String getDescription() {
	return description;
    }

    /**
     * Set description
     * @param <code>String</code>
     */
    public void setDescription(String d) {
	this.description = d;
    }

    /**
     * Get duration
     * @return String
     */
    public String getDuration() {
	return duration;
    }

    /**
     * Set duration
     * @param <code>String</code>
     */
    public void setDuration(String d) {
	this.duration = d;
    }

    public void reset(ActionMapping mapping, HttpServletRequest request) {

	// Reset values are provided as samples only. Change as appropriate.

	course = null;
	date = null;
	time = null;
	title = null;
	description = null;
	duration = null;

    }

    public ActionErrors validate(ActionMapping mapping,
	    HttpServletRequest request) {

	ActionErrors errors = new ActionErrors();
	// Validate the fields in your form, adding
	// adding each error to this.errors as found, e.g.

	// if ((field == null) || (field.length() == 0)) {
	//   errors.add("field", new org.apache.struts.action.ActionError("error.field.required"));
	// }
	return errors;

    }

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getOrganizedBy() {
		return organizedBy;
	}

	public void setOrganizedBy(String organizedBy) {
		this.organizedBy = organizedBy;
	}

	public String getOrganizedFor() {
		return organizedFor;
	}

	public void setOrganizedFor(String organizedFor) {
		this.organizedFor = organizedFor;
	}

	public String getCourse1() {
		return course1;
	}

	public void setCourse1(String course1) {
		this.course1 = course1;
	}

	
}
