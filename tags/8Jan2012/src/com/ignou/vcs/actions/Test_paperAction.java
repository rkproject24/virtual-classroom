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

/**
 * @version 1.0
 * @author Pradeepthi S
 */
public class Test_paperAction extends Action
{
	static ArrayList list = new ArrayList();
	static int count = 0;

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ActionErrors errors = new ActionErrors();
		ActionForward forward = new ActionForward(); // return value
		String testid = (String) request.getSession().getAttribute("testid");

		String mode = request.getParameter("finish");
		com.ignou.vcs.forms.Test_paper test_paper = (com.ignou.vcs.forms.Test_paper) form;

		System.out.println(count);

		request.getSession().setAttribute("count", count);
		list.add(count, test_paper);

		com.ignou.vcs.forms.Test_paper test_paper1 = (com.ignou.vcs.forms.Test_paper) form;
		test_paper1 = (com.ignou.vcs.forms.Test_paper) list.get(count);
		String ques1 = test_paper1.getQues();

		System.out.println(ques1);

		if (mode.equals("Previous")) {

			try {

				count--;
			} catch (Exception e) {

				// Report the error using the appropriate name and ID.
				errors.add("name", new ActionError("id"));

			}

			// If a message is required, save the specified key(s)
			// into the request for use by the <struts:errors> tag.

			if (!errors.isEmpty()) {
				saveErrors(request, errors);

				// Forward control to the appropriate 'failure' URI (change name
				// as desired)
				// forward = mapping.findForward(failure");

			} else {

				// Forward control to the appropriate 'success' URI (change name
				// as desired)
				forward = mapping.findForward("previous");

			}
		} else {
			if (mode.equals("Next")) {
				try {
					count++;

				} catch (Exception e) {

					// Report the error using the appropriate name and ID.
					errors.add("name", new ActionError("id"));

				}

				// If a message is required, save the specified key(s)
				// into the request for use by the <struts:errors> tag.

				if (!errors.isEmpty()) {
					saveErrors(request, errors);

					// Forward control to the appropriate 'failure' URI (change
					// name as desired)
					// forward = mapping.findForward(failure");

				} else {

					// Forward control to the appropriate 'success' URI (change
					// name as desired)
					forward = mapping.findForward("next");

				}

			} else {
				if (mode.equals("Done")) {
					try {

						com.ignou.vcs.xml.addXML obj = new com.ignou.vcs.xml.addXML();
						obj.generateXML(list, testid);
						System.out.println("abhishke");
					} catch (Exception e) {

						// Report the error using the appropriate name and ID.
						errors.add("name", new ActionError("id"));

					}

					// If a message is required, save the specified key(s)
					// into the request for use by the <struts:errors> tag.

					if (!errors.isEmpty()) {
						saveErrors(request, errors);

						// Forward control to the appropriate 'failure' URI
						// (change name as desired)
						// forward = mapping.findForward(failure");

					} else {

						// Forward control to the appropriate 'success' URI
						// (change name as desired)
						forward = mapping.findForward("success");

					}

				}
			}
		}

		// Finish with
		return (forward);

	}
}
