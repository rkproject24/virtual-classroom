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
import com.ignou.vcs.commons.SendMailUsingAuthentication;
import com.ignou.vcs.commons.beans.StudentBean;
import com.ignou.vcs.commons.beans.UserBean;
import com.ignou.vcs.commons.database.CommonsDatabaseActivities;

/**
 * @version 1.0
 * @author Pradeepthi S
 */
public class ScheduleAction extends Action

{

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ActionErrors errors = new ActionErrors();
		ActionForward forward = new ActionForward(); // return value

		com.ignou.vcs.forms.Schedule scheduleForm = (com.ignou.vcs.forms.Schedule) form;
		System.out.println("detaisl:");
		System.out.println(scheduleForm.getDate() + " "
				+ scheduleForm.getDescription() + " "
				+ scheduleForm.getDuration() + " " + scheduleForm.getTitle()
				+ " " + scheduleForm.getCourse() + " "
				+ scheduleForm.getSubject());
		String course = request.getParameter("courseValues");
		System.out.println("COURSE AT CODE:" + course);
		String subject = request.getParameter("subjectValues");
		System.out.println(subject);

		String userid = (String) request.getSession().getAttribute("userid");

		com.ignou.vcs.database.VCSDatabaseActivities db_ob = new com.ignou.vcs.database.VCSDatabaseActivities();
		int level = db_ob.getLevel(userid);
		String organizedFor = "0";
		if (level == 1) {
			com.ignou.vcs.database.VCSDatabaseActivities db_obj = new com.ignou.vcs.database.VCSDatabaseActivities();

			String subject_faculty = db_obj.getFacultySubject(userid);
			System.out.println(subject_faculty);
			organizedFor = "0";
			scheduleForm.setOrganizedBy(userid);
			scheduleForm.setOrganizedFor(organizedFor);
			scheduleForm.setSubject(subject_faculty);

			// Code for sending Email Notifications to all Students
			// Modofied by Ankit Kumar 10-02-2009
			CommonsDatabaseActivities dbObject = new CommonsDatabaseActivities();
			UserBean userBean = dbObject.getUserInfo(userid);

			String facName = userBean.getName();
			String subjectId = userBean.getSubjectID();

			String subjectName = dbObject.getSubjectName(subjectId);
			ArrayList<StudentBean> allStudents = dbObject
					.getStudents(scheduleForm.getCourse());

			SendMailUsingAuthentication smtpMailSender = new SendMailUsingAuthentication();

			String[] recepients = new String[allStudents.size()];
			String subject_mail = subjectName + " Discussion Scheduled";
			String message = "A Discussion has been scheduled for your standard. Discussion Information - \n Title:"
					+ scheduleForm.getTitle()
					+ "\n Time Slot: "
					+ scheduleForm.getTime()
					+ "\n Description:"
					+ scheduleForm.getDescription() + "\n Faculty:" + facName;
			String from = "teamcoderZ@gmail.com";

			for (int i = 0; i < allStudents.size(); i++) {
				StudentBean studentBean = (StudentBean) allStudents.get(i);
				System.out.println("Email :" + studentBean.getEmailP());
				recepients[i] = studentBean.getEmailP();

			}

			try {
				smtpMailSender
						.postMail(recepients, subject_mail, message, from);
			} catch (RuntimeException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else {
			if (level == 2) {
				organizedFor = "1";
				scheduleForm.setCourse(course);
				scheduleForm.setSubject(subject);
				scheduleForm.setOrganizedBy(userid);
				scheduleForm.setOrganizedFor(organizedFor);

			}
		}

		try {

			com.ignou.vcs.database.VCSDatabaseActivities db_ob1 = new com.ignou.vcs.database.VCSDatabaseActivities();
			db_ob1.insertSchedule(scheduleForm);
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
			// forward = mapping.findForward(failure");

		} else {

			// Forward control to the appropriate 'success' URI (change name as
			// desired)
			forward = mapping.findForward("success");

		}

		// Finish with
		return (forward);

	}
}
