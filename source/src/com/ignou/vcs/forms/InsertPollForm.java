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
public class InsertPollForm extends ActionForm
{
    private String pollQuestion = null;
    private String pollOptions = null;
    private String userName = null;



    /**
     * Get pollQuestion
     * @return String
     */
    public String getPollQuestion() {
    	return pollQuestion;
    }

    /**
     * Set pollQuestion
     * @param <code>String</code>
     */
    public void setPollQuestion(String u) {
    	this.pollQuestion = u;
    }
    
    /**
     * Get pollOptions
     * @return String
     */
    public String getPollOptions() {
    	return pollOptions;
    }

    /**
     * Set pollOptions
     * @param <code>String</code>
     */
    public void setPollOptions(String u) {
    	this.pollOptions = u;
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
    public void setUserName(String u) {
    	this.userName = u;
    }

    

    public void reset(ActionMapping mapping, HttpServletRequest request) {

	// Reset values are provided as samples only. Change as appropriate.

    }

    public ActionErrors validate(ActionMapping mapping,
	    HttpServletRequest request) {

	ActionErrors errors = new ActionErrors();
	// Validate the fields in your form, adding
	// adding each error to this.errors as found, e.g.

	 
	return errors;

    }
    
}
