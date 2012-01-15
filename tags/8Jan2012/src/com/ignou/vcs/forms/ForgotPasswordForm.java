package com.ignou.vcs.forms;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
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
public class ForgotPasswordForm extends ActionForm
{
    private String email = null;
    private String userName = null;
    private Pattern pattern;
	private Matcher matcher;

	private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";


    /**
     * Get username
     * @return String
     */
    public String getEmail() {
    	return email;
    }

    /**
     * Set username
     * @param <code>String</code>
     */
    public void setUserName(String u) {
    	this.userName = u;
    }

    /**
     * Get username
     * @return String
     */
    public String getUserName() {
		return userName;
    }

    /**
     * Set username
     * @param <code>String</code>
     */
    public void setEmail(String u) {
    	pattern = Pattern.compile(EMAIL_PATTERN);
    	this.email = u;
    }

    public void reset(ActionMapping mapping, HttpServletRequest request) {

	// Reset values are provided as samples only. Change as appropriate.

    	email = null;
    }

    public ActionErrors validate(ActionMapping mapping,
	    HttpServletRequest request) {

	ActionErrors errors = new ActionErrors();
	// Validate the fields in your form, adding
	// adding each error to this.errors as found, e.g.

	 if ((getUserName() == null) || (getUserName().length() == 0)) 
	 {
	   errors.add("forgotPassword", new org.apache.struts.action.ActionError("error.forgotPassword.userName.required"));
	 }else if ((getEmail() == null) || (getEmail().length() == 0)) 
	 {
	   errors.add("forgotPassword", new org.apache.struts.action.ActionError("error.forgotPassword.email.required"));
	 }else if(isValidEmail(getEmail())==false)
	 {
		 errors.add("forgotPassword", new org.apache.struts.action.ActionError("error.forgotPassword.validEmail.required")); 
	 }
	 
	return errors;

    }
    
    private Boolean isValidEmail(String emailAdd)
    {
    	 matcher = pattern.matcher(emailAdd);
		 return matcher.matches();
    }
}
