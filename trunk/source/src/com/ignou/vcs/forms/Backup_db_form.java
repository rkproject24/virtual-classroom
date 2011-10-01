package com.ignou.vcs.forms;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 * Form bean for a Struts application.
 * Users may access 1 field on this form:
 * <ul>
 * <li>location - [your comment here]
 * </ul>
 * @version 	1.0
 * @author
 */
public class Backup_db_form extends ActionForm

{

    private String location = null;

    /**
     * Get location
     * @return String
     */
    public String getLocation() {
	return location;
    }

    /**
     * Set location
     * @param <code>String</code>
     */
    public void setLocation(String l) {
	this.location = l;
    }

    public void reset(ActionMapping mapping, HttpServletRequest request) {

	// Reset values are provided as samples only. Change as appropriate.

	location = null;

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
}
