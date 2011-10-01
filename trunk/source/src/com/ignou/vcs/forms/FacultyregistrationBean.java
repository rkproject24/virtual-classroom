package com.ignou.vcs.forms;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

/**
 * Form bean for a Struts application.
 * Users may access 3 fields on this form:
 * <ul>
 * <li>name - [your comment here]
 * <li>password - [your comment here]
 * <li>specializtion - [your comment here]
 * </ul>
 * @version 	1.0
 * @author
 */
public class FacultyregistrationBean extends ActionForm

{

    private String name = null;
    private String password = null;  
    private String dayBirth = null;
    private String monthBirth = null;
    private String yearBirth = null;
    private String email_id_primary = null;
    private String email_id_secondary = null;
    private String contact_no_primary = null;
    private String contact_no_secondary = null;
    private String address = null;
    private String highest_qualification = null;
    private String year = null;
    private String specializtion = null;
    private FormFile resume=null;

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
     * Get password
     * @return String
     */
    public String getPassword() {
	return password;
    }

    /**
     * Set password
     * @param <code>String</code>
     */
    public void setPassword(String p) {
	this.password = p;
    }

    /**
     * Get specializtion
     * @return String
     */
    public String getSpecializtion() {
	return specializtion;
    }

    /**
     * Set specializtion
     * @param <code>String</code>
     */
    public void setSpecializtion(String s) {
	this.specializtion = s;
    }

    public void reset(ActionMapping mapping, HttpServletRequest request) {

	// Reset values are provided as samples only. Change as appropriate.

	name = null;
	password = null;
	specializtion = null;

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

	public FormFile getResume() {
		return resume;
	}

	public void setResume(FormFile resume) {
		this.resume = resume;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContact_no_primary() {
		return contact_no_primary;
	}

	public void setContact_no_primary(String contact_no_primary) {
		this.contact_no_primary = contact_no_primary;
	}

	public String getContact_no_secondary() {
		return contact_no_secondary;
	}

	public void setContact_no_secondary(String contact_no_secondary) {
		this.contact_no_secondary = contact_no_secondary;
	}

	public String getDayBirth() {
		return dayBirth;
	}

	public void setDayBirth(String dayBirth) {
		this.dayBirth = dayBirth;
	}

	public String getEmail_id_primary() {
		return email_id_primary;
	}

	public void setEmail_id_primary(String email_id_primary) {
		this.email_id_primary = email_id_primary;
	}

	public String getEmail_id_secondary() {
		return email_id_secondary;
	}

	public void setEmail_id_secondary(String email_id_secondary) {
		this.email_id_secondary = email_id_secondary;
	}

	public String getHighest_qualification() {
		return highest_qualification;
	}

	public void setHighest_qualification(String highest_qualification) {
		this.highest_qualification = highest_qualification;
	}

	public String getMonthBirth() {
		return monthBirth;
	}

	public void setMonthBirth(String monthBirth) {
		this.monthBirth = monthBirth;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getYearBirth() {
		return yearBirth;
	}

	public void setYearBirth(String yearBirth) {
		this.yearBirth = yearBirth;
	}
}
