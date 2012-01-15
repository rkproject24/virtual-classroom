package com.ignou.vcs.forms;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 * Form bean for a Struts application.
 * @version 	1.0
 * @author
 */
public class AddSubjectForm extends ActionForm

{
	private String subjectName = "";
	
	public String getSubjectName()
	{
		return subjectName;
	}
	
	public void setSubjectName(String value)
	{
		this.subjectName = value;
	}
	 
    public void reset(ActionMapping mapping, HttpServletRequest request) {

	// Reset field values here.
    	subjectName = "";
    }

    public ActionErrors validate(ActionMapping mapping,
	    HttpServletRequest request) {

	ActionErrors errors = new ActionErrors();
	// Validate the fields in your form, adding
	// adding each error to this.errors as found, e.g.

	 if ((getSubjectName() == null) || (getSubjectName().length() == 0)) 
	 {
	   errors.add("subjectName", new org.apache.struts.action.ActionError("error.subjectName.required"));
	 }
	return errors;

    }
}
