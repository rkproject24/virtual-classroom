package com.ignou.vcs.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.ignou.vcs.commons.PasswordService;
import com.ignou.vcs.commons.database.CommonsDatabaseActivities;
import com.ignou.vcs.forms.ChangePasswordForm;

/**
 * @version 1.0
 * @author Pradeepthi S
 */
public class Change_passwordAction extends Action

{

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ActionErrors errors = new ActionErrors();
		ActionForward forward = new ActionForward(); // return value
		ChangePasswordForm changePasswordForm = (ChangePasswordForm) form;

		try {
			String userId = (String) request.getSession()
					.getAttribute("userId");
			CommonsDatabaseActivities dbObject = new CommonsDatabaseActivities();
			String oldEncryptedPasswordInDb = dbObject.getPassword(userId);
			String oldEncryptedPasswordFromUser = PasswordService.getInstance()
					.encrypt(changePasswordForm.getOldPassword());

			if (oldEncryptedPasswordFromUser.equals(oldEncryptedPasswordInDb)) {
				String encryptedNewPassword = PasswordService.getInstance()
						.encrypt(changePasswordForm.getNewPassword());
				dbObject.updatePassword(userId, encryptedNewPassword);
			} else {
				errors.add("oldPassword", new ActionError("error.oldPassword"));
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
