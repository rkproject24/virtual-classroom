package com.ignou.vcs.actions;

import java.util.ArrayList;
import java.util.StringTokenizer;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.ignou.vcs.forms.InsertPollForm;
import com.ignou.vcs.forums.ForumDatabaseOperations;
import com.ignou.vcs.forums.beans.PollBean;

/**
 * @version 1.0
 * @author Pradeepthi S
 */
public class InsertPollAction extends Action

{

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ActionErrors errors = new ActionErrors();
		ActionForward forward = new ActionForward(); // return value
		InsertPollForm insertPoll = (InsertPollForm) form;

		try 
		{
			String pollQues = insertPoll.getPollQuestion();
			String pollOpt = insertPoll.getPollOptions();
			StringTokenizer st = new StringTokenizer(pollOpt,"|");
			ArrayList<String> pollOptions = new ArrayList<String>();
			while(st.hasMoreTokens())
			{
				String str = st.nextToken();
				pollOptions.add(str);
			}
			PollBean pb = new PollBean();
			pb.setPollQuestion(pollQues);
			pb.setPollCreatedBy(insertPoll.getUserName());
			pb.setPollOptions(pollOptions);
			
			Boolean b = ForumDatabaseOperations.insertPoll(pb);
			
		} catch (Exception e) 
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
