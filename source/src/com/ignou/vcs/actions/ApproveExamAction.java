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
import com.ignou.vcs.exams.database.ExamsDatabaseActivities;
import com.ignou.vcs.forms.ApproveExamForm;

/**
 * @version 1.0
 * @author Pradeepthi S
 */
public class ApproveExamAction extends Action

{

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception 
	{

		ActionErrors errors = new ActionErrors();
		ActionForward forward = new ActionForward(); // return value
		ApproveExamForm approveExamForm = (ApproveExamForm) form;
		String approvedBy = (String) request.getSession().getAttribute("userId");
		String ex = request.getParameter("examId");
		String sub = request.getParameter("subjectId");
		String crs = request.getParameter("courseId");
		try 
		{
			int subjectId = Integer.parseInt(sub);
			int courseId = Integer.parseInt(crs);
			int examId = Integer.parseInt(ex);
			ExamsDatabaseActivities eda = new ExamsDatabaseActivities();
			Boolean b = eda.approveExam(examId, approvedBy, approveExamForm.getExamAppovalComments(), approveExamForm.getExamAppovalStatus(),subjectId,courseId);
			if(b)
			{
				int approvalStatus = approveExamForm.getExamAppovalStatus();
				String subject = "";
				String message = "";
				
				if(approvalStatus==0)
				{
					subject = "Your exam has been approved.";
					message = "Hi,/n" +
							"The exam with id : " + approveExamForm.getExamId()+
							" created by you has been APPROVED./n" +
							"" +
							"------/n" +
							"Regards,/n" +
							""+approvedBy;
				}else
				{
					subject = "Your exam has been rejected.";
					message = "Hi,/n" +
							"The exam with id : " + approveExamForm.getExamId()+
							" created by you has been REJECTED./n" +
							"Please revisit the exam, modify and resubmit for approval." +
							"------/n" +
							"Regards,/n" +
							""+approvedBy;
				}
				
				CommonsDatabaseActivities cba = new CommonsDatabaseActivities();
				ArrayList<String> toList = cba.getFacultyIds(subjectId);
				ArrayList<String> ccList = cba.getManagementMailIds();
				
				MailBean mb = new MailBean();
				mb.setToRecipients(toList);
				mb.setCCRecipients(ccList);
				mb.setMailSubject(subject);
				mb.setMsgContent(message);
				
				EMailUtilities.sendMail(mb);
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
