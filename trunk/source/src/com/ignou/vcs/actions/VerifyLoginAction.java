package com.ignou.vcs.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.ignou.vcs.commons.beans.UserBean;
import com.ignou.vcs.commons.database.CommonsDatabaseActivities;
import com.ignou.vcs.forms.LoginForm;

/**
 * @version 1.0
 * @author Pradeepthi S
 */
public class VerifyLoginAction extends Action

{

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ActionErrors errors = new ActionErrors();
		ActionForward forward = new ActionForward(); // return value

		LoginForm loginForm = (LoginForm) form;
		String username = loginForm.getUsername();
		String password = loginForm.getPassword();
		boolean archived = false;
		try {
			
			CommonsDatabaseActivities cbs = new CommonsDatabaseActivities();
			String dbPassword = cbs.getPassword(username);

			//String encrypedInputPassword = PasswordService.getInstance()
			//		.encrypt(password);
			if (dbPassword.equals("")) {

				errors.add("username", new ActionError("error.username"));
			} else if (!password.equals(dbPassword)) {
				errors.add("password", new ActionError("error.password"));
				System.out.println("Not equal");
			} else {
				// Check if user is archived
				archived = cbs.isArchived(username);

				if (!archived) {
					System.out.println("Equal");
					request.getSession().setAttribute("userId", username);
					UserBean userBean = new UserBean();
					userBean = cbs.getUserInfo(username);
					request.getSession().setAttribute("UserBean", userBean);
				}

			}

		} catch (Exception e) {

			// Report the error using the appropriate name and ID.
			errors.add("username", new ActionError("error.username"));

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

			if (archived) {
				forward = mapping.findForward("archived");
			} else {
				forward = mapping.findForward("success");
			}

		}

		// Finish with
		return (forward);

	}
}
