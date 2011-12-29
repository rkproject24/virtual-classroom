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

import com.ignou.vcs.commons.SendMailUsingAuthentication;
import com.ignou.vcs.commons.database.CommonsDatabaseActivities;
import com.ignou.vcs.exams.beans.QuestionBean;
import com.ignou.vcs.exams.database.ExamsDatabaseActivities;
import com.ignou.vcs.forms.AddQuestionForm;
import com.ignou.vcs.forms.ForgotPasswordForm;

/**
 * @version 1.0
 * @author Pradeepthi S
 */
public class AddQuestionAction extends Action

{

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ActionErrors errors = new ActionErrors();
		ActionForward forward = new ActionForward(); // return value
		AddQuestionForm addQuestionForm = (AddQuestionForm) form;
		String userName = (String) request.getSession().getAttribute("userId");
		
		try 
		{
			String opt = addQuestionForm.getOptions();
			StringTokenizer st = new StringTokenizer(opt,"|");
			ArrayList<String> options = new ArrayList<String>();
			while(st.hasMoreTokens())
			{
				options.add(st.nextToken());
			}
			QuestionBean qb = new QuestionBean();
			qb.setQuestionType(addQuestionForm.getQuestionType());
			qb.setQuestion(addQuestionForm.getQuestion());
			qb.setCorrectAnswer(addQuestionForm.getCorrectAnswer());
			qb.setOptions(options);
			qb.setCreatedBy(userName);
			qb.setSubjectId(addQuestionForm.getSubjectId());
			qb.setCourseId(addQuestionForm.getCourseId());
			
			ExamsDatabaseActivities eda = new ExamsDatabaseActivities();
			Boolean isCreated = eda.createQuestion(qb);
			if(!isCreated)
			{
				errors.add("ServerError", new ActionError("error.server.error"));
			}

		} catch (Exception e) {

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
