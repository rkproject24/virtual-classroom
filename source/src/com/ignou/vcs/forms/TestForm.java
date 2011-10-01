package com.ignou.vcs.forms;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 * Form bean for a Struts application.
 * Users may access 1 field on this form:
 * <ul>
 * <li>name - [your comment here]
 * </ul>
 * @version 	1.0
 * @author
 */
public class TestForm extends ActionForm

{

    private String name = null;

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

    public void reset(ActionMapping mapping, HttpServletRequest request) {

	// Reset values are provided as samples only. Change as appropriate.

	name = null;

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
