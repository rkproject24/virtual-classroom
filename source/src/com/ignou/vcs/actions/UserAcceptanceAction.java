package com.ignou.vcs.actions;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.ignou.vcs.commons.EMailUtilities;
import com.ignou.vcs.commons.beans.MailBean;
import com.ignou.vcs.commons.database.CommonsDatabaseActivities;
import com.ignou.vcs.forms.ForgotPasswordForm;
import com.ignou.vcs.forms.UserAcceptanceForm;

/**
 * @version 1.0
 * @author Pradeepthi S
 */
public class UserAcceptanceAction extends Action

{

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ActionErrors errors = new ActionErrors();
		ActionForward forward = new ActionForward(); // return value
		UserAcceptanceForm acceptance = (UserAcceptanceForm) form;

		String userStatus = request.getParameter("userstatus");

		if(userStatus.equalsIgnoreCase("accepted"))
		{
			
		}
		else
		{
			
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
