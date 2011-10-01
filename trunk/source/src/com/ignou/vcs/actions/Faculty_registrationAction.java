package com.ignou.vcs.actions;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;
import com.ignou.vcs.commons.Utilities;
import com.ignou.vcs.forms.FacultyregistrationBean;
import com.ignou.vcs.registration.database.*;

/**
 * @version 1.0
 * @author Pradeepthi S
 */
public class Faculty_registrationAction extends Action

{

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ActionErrors errors = new ActionErrors();
		ActionForward forward = new ActionForward(); // return value

		FacultyregistrationBean facultyRegistrationForm = (FacultyregistrationBean) form;
		String name = facultyRegistrationForm.getName();
		String password = facultyRegistrationForm.getPassword();
		String specializationId = facultyRegistrationForm.getSpecializtion();
		String day = facultyRegistrationForm.getDayBirth();
		String month = facultyRegistrationForm.getMonthBirth();
		String year = facultyRegistrationForm.getYearBirth();
		String emailP = facultyRegistrationForm.getEmail_id_primary();
		String emailS = facultyRegistrationForm.getEmail_id_secondary();
		String contactP = facultyRegistrationForm.getContact_no_primary();
		// String contactS = facultyRegistrationForm.getContact_no_secondary();
		String address = facultyRegistrationForm.getAddress();
		String qualification = facultyRegistrationForm
				.getHighest_qualification();
		String passyear = facultyRegistrationForm.getYear();
		String birthDate = year + "-" + month + "-" + day;

		System.out.println("Name:" + name);
		System.out.println("Specialization" + specializationId);
		System.out.println("birthDate" + birthDate);

		try {

			FormFile resumeFile = facultyRegistrationForm.getResume();
			RegistrationDatabaseActivities dbObject = new RegistrationDatabaseActivities();
			String appointmentId = dbObject.getAppointmentID();
			System.out.println("Appointment Id:" + appointmentId);
			int appointmentid = Integer.parseInt(appointmentId);
			appointmentid = appointmentid + 1;
			System.out.println("appointmentid:" + appointmentid);
			String id = appointmentid + "";
			System.out.println(id);

			Faculty_registrationAction object = new Faculty_registrationAction();
			String uploadedFileName = object.getNewFileName(resumeFile, id);
			object.saveUploadedFile(resumeFile, uploadedFileName,
					Utilities.RESUME_FILES_UPLOAD_PATH);
			dbObject.insertFile(name, password, specializationId,
					uploadedFileName, emailP, emailS, contactP, address,
					qualification, passyear, birthDate);

		} catch (Exception e) {
			e.printStackTrace();
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

	public void saveUploadedFile(FormFile fileToUpload, String newFileName,
			String storagePath) {

		try {
			if (!newFileName.equals("")) {
				// Create file
				File fileToCreate = new File(storagePath, newFileName);
				// If file does not exists create file
				if (!fileToCreate.exists()) {
					FileOutputStream fileOutStream = new FileOutputStream(
							fileToCreate);
					fileOutStream.write(fileToUpload.getFileData());
					fileOutStream.flush();
					fileOutStream.close();
				}
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String getNewFileName(FormFile fileToUpload, String fileId) {

		String uploadedFileName = fileToUpload.getFileName();
		System.out.println("Uploaded File Name:" + uploadedFileName);
		int i = 0;
		for (i = 0; i < uploadedFileName.length(); i++) {
			if (uploadedFileName.charAt(i) == '.') {
				break;
			}
		}
		System.out.println("i:" + i);
		String newFileName = fileId + "."
				+ uploadedFileName.substring(i + 1, uploadedFileName.length());

		System.out.println("New File Name:" + newFileName);
		return newFileName;
	}
}
