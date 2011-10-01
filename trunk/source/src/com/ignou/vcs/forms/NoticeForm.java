package com.ignou.vcs.forms;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 * Form bean for a Struts application.
 * Users may access 6 fields on this form:
 * <ul>
 * <li>Keyword - [your comment here]
 * <li>Description - [your comment here]
 * <li>PostedTo - [your comment here]
 * <li>ExpiryDate - [your comment here]
 * <li>Title - [your comment here]
 * <li>CourseID - [your comment here]
 * </ul>
 * @version 	1.0
 * @author
 */
public class NoticeForm extends ActionForm

{

    private String Keyword = null;

    private String Description = null;

    private String PostedTo = null;

    private String ExpiryDate = null;

    private String Title = null;

    private String CourseID = null;
    
    private String Email = null; 

    /**
     * Get Keyword
     * @return String
     */
    public String getKeyword() {
	return Keyword;
    }

    /**
     * Set Keyword
     * @param <code>String</code>
     */
    public void setKeyword(String k) {
	this.Keyword = k;
    }

    /**
     * Get Description
     * @return String
     */
    public String getDescription() {
	return Description;
    }

    /**
     * Set Description
     * @param <code>String</code>
     */
    public void setDescription(String d) {
	this.Description = d;
    }

    /**
     * Get PostedTo
     * @return String
     */
    public String getPostedTo() {
	return PostedTo;
    }

    /**
     * Set PostedTo
     * @param <code>String</code>
     */
    public void setPostedTo(String p) {
	this.PostedTo = p;
    }

    /**
     * Get ExpiryDate
     * @return String
     */
    public String getExpiryDate() {
	return ExpiryDate;
    }

    /**
     * Set ExpiryDate
     * @param <code>String</code>
     */
    public void setExpiryDate(String e) {
	this.ExpiryDate = e;
    }

    /**
     * Get Title
     * @return String
     */
    public String getTitle() {
	return Title;
    }

    /**
     * Set Title
     * @param <code>String</code>
     */
    public void setTitle(String t) {
	this.Title = t;
    }

    /**
     * Get CourseID
     * @return String
     */
    public String getCourseID() {
	return CourseID;
    }

    /**
     * Set CourseID
     * @param <code>String</code>
     */
    public void setCourseID(String c) {
	this.CourseID = c;
    }

    public void reset(ActionMapping mapping, HttpServletRequest request) {

	// Reset values are provided as samples only. Change as appropriate.

	Keyword = null;
	Description = null;
	PostedTo = null;
	ExpiryDate = null;
	Title = null;
	CourseID = null;

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

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}
}
