package com.ignou.vcs.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.ignou.vcs.database.VCSDatabaseActivities;
import com.ignou.vcs.forms.AddCourseForm;

/**
 * @version 1.0
 * @author Pradeepthi S
 */
public class AddcourseAction extends Action
{

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception 
	{

		ActionErrors errors = new ActionErrors();
		ActionForward forward = new ActionForward(); // return value
		AddCourseForm courseform = (AddCourseForm) form;

		try {

			VCSDatabaseActivities dbObj = new VCSDatabaseActivities();
			String courseid = dbObj.insertCourse(courseform);
			if(courseid==null || courseid.equalsIgnoreCase(""))
			{
				errors.add("ServerError", new ActionError("error.server.error"));
			}
		} 
		catch (Exception e) 
		{

			// Report the error using the appropriate name and ID.
			errors.add("ServerError", new ActionError("error.server.error"));

		}

		// If a message is required, save the specified key(s)
		// into the request for use by the <struts:errors> tag.

		if (!errors.isEmpty()) {
			saveErrors(request, errors);

			// Forward control to the appropriate 'failure' URI (change name as
			// desired)
			 forward = mapping.findForward("failure");

		} else {

			// Forward control to the appropriate 'success' URI (change name as
			// desired)
			forward = mapping.findForward("success");

		}

		// Finish with
		return (forward);

	}
}
