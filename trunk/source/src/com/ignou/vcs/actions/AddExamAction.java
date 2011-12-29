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
import com.ignou.vcs.exams.beans.ExamBean;
import com.ignou.vcs.exams.database.ExamsDatabaseActivities;
import com.ignou.vcs.forms.AddExamForm;

/**
 * @version 1.0
 * @author Pradeepthi S
 */
public class AddExamAction extends Action

{

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception 
			{

		ActionErrors errors = new ActionErrors();
		ActionForward forward = new ActionForward(); // return value
		AddExamForm addExam = (AddExamForm) form;
		String questionIds = request.getParameter("questionIds");
		String crs = request.getParameter("courseId");
		String sub = request.getParameter("subjectId");
		String userName = (String) request.getSession().getAttribute("userId");
		
		try 
		{
			int subjectId = Integer.parseInt(sub);
			int courseId = Integer.parseInt(crs);
			ExamBean eb = new ExamBean();
			eb.setCourseId(courseId);
			eb.setSubjectId(subjectId);
			eb.setExamName(addExam.getExamName());
			eb.setExamType(addExam.getExamType());
			eb.setMaxMarks(addExam.getMaxMarks());
			eb.setPassMarks(addExam.getPassMarks());
			eb.setQuestionIds(questionIds);
			
			ExamsDatabaseActivities eda = new ExamsDatabaseActivities();
			if(userName!=null)
			{
				Boolean b = eda.createExam(eb, userName);
				if(b)
				{
					ArrayList<String> toList = new ArrayList<String>();
					ArrayList<String> ccList = new ArrayList<String>();
					CommonsDatabaseActivities cbs = new CommonsDatabaseActivities();
					toList = cbs.getManagementMailIds();
					ccList = cbs.getFacultyIds(subjectId);
					
					MailBean mb = new MailBean();
					mb.setMailSubject("Need Approval for "+addExam.getExamName() + " exam.");
					String msg = "Hi,/n"+
							"A Exam has created by " +userName+
							"./n Please have look into it and approve./n" +
							"You need to log in to VCS application --> Exams --> Approvals." +
							"------" +
							"Regards," +
							"VCS - Administrator";
					mb.setMsgContent(msg);
					mb.setToRecipients(toList);
					mb.setCCRecipients(ccList);
					
					EMailUtilities.sendMail(mb);
				}
			}
		} 
		catch (Exception e) 
		{

			// Report the error using the appropriate name and ID.
			errors.add("ServerError", new ActionError("error.server.error"));
		}

		// If a message is required, save the specified key(s)
		// into the request for use by the <struts:errors> tag.

		if (!errors.isEmpty()) 
		{
			saveErrors(request, errors);

			// Forward control to the appropriate 'failure' URI (change name as
			// desired)
			forward = mapping.findForward("failure");

		} 
		else 
		{

			// Forward control to the appropriate 'success' URI (change name as
			// desired)
			forward = mapping.findForward("success");

		}

		// Finish with
		return (forward);

	}
}
