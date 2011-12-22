package com.ignou.vcs.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.ignou.vcs.commons.SendMailUsingAuthentication;
import com.ignou.vcs.commons.database.CommonsDatabaseActivities;
import com.ignou.vcs.forms.ForgotPasswordForm;

/**
 * @version 1.0
 * @author Pradeepthi S
 */
public class ApproveExamAction extends Action

{

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ActionErrors errors = new ActionErrors();
		ActionForward forward = new ActionForward(); // return value
		ForgotPasswordForm forgotPasswordForm = (ForgotPasswordForm) form;

		try {
			CommonsDatabaseActivities dbObject = new CommonsDatabaseActivities();
			String userName = forgotPasswordForm.getUserName();
			String email = forgotPasswordForm.getEmail();
			String password = dbObject.getPassword(userName);
			

			if (password!="") 
			{
				SendMailUsingAuthentication sm = new SendMailUsingAuthentication();
				String[] recepients = {email};
			    String subject = "VCS - your password";
			    String message = "Hi "+ userName+"\n"
			    			+ "Your password for "+userName +" is "+password+"\n\n\n"
			    			+"Password instructions:\n" +
			    			"1. Please donot share your password with any known/unknown persons.\n" +
			    			"2.DO NOT USE birthdays, names or other passwords which would be easy to guess, " +
			    			"the idea is to choose something which does not reside in any dictionary or in any language. \n" +
			    			"3. Never write your password down on paper or anything else which could be read by another person, " +
			    			"i.e., DO NOT PUT A POST-IT WITH YOUR PASSWORD WRITTEN ON IT AND ATTACH IT TO YOUR MONITOR (or under your mouse pad).\n" +
			    			"\n" +
			    			"- - -\n" +
			    			"Regards,\n" +
			    			"VCS - Administrator";
			    String from = "";

			    sm.postMail(recepients,subject,message,from);
			} else 
			{
				errors.add("forgotPassword", new ActionError("error.forgotPassword"));
			}
			// do something here

		} catch (Exception e) {

			// Report the error using the appropriate name and ID.
			errors.add("name", new ActionError("id"));

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
