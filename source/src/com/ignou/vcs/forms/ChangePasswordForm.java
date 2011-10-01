package com.ignou.vcs.forms;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 * Form bean for a Struts application.
 * Users may access 3 fields on this form:
 * <ul>
 * <li>oldPassword - [your comment here]
 * <li>newPassword - [your comment here]
 * <li>newPassword2 - [your comment here]
 * </ul>
 * @version 	1.0
 * @author
 */
public class ChangePasswordForm extends ActionForm

{

    private String oldPassword = null;

    private String newPassword = null;

    private String newPassword2 = null;

    /**
     * Get oldPassword
     * @return String
     */
    public String getOldPassword() {
	return oldPassword;
    }

    /**
     * Set oldPassword
     * @param <code>String</code>
     */
    public void setOldPassword(String o) {
	this.oldPassword = o;
    }

    /**
     * Get newPassword
     * @return String
     */
    public String getNewPassword() {
	return newPassword;
    }

    /**
     * Set newPassword
     * @param <code>String</code>
     */
    public void setNewPassword(String n) {
	this.newPassword = n;
    }

    /**
     * Get newPassword2
     * @return String
     */
    public String getNewPassword2() {
	return newPassword2;
    }

    /**
     * Set newPassword2
     * @param <code>String</code>
     */
    public void setNewPassword2(String n) {
	this.newPassword2 = n;
    }

    public void reset(ActionMapping mapping, HttpServletRequest request) {

	// Reset values are provided as samples only. Change as appropriate.

	oldPassword = null;
	newPassword = null;
	newPassword2 = null;

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
