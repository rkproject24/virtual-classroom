package com.ignou.vcs.actions;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
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
import com.ignou.vcs.commons.beans.UserBean;
import com.ignou.vcs.files.database.FilesDatabaseActivities;
import com.ignou.vcs.forms.UploadFileForm;

/**
 * @version 1.0
 * @author Pradeepthi S
 */
public class UploadFileAction extends Action
{
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ActionErrors errors = new ActionErrors();
		ActionForward forward = new ActionForward(); // return value

		UploadFileForm uploadForm = (UploadFileForm) form;

		String userId = (String) request.getSession().getAttribute("userId");
		ArrayList formValues = new ArrayList();

		String title = uploadForm.getTitle();
		String description = uploadForm.getDescription();
		// LEFT FILE HERE
		String uploadedBy = userId;
		String topics = uploadForm.getTopics();
		String fileType = uploadForm.getFileType();
		String syllabus = uploadForm.getSyllabus();
		// LEFT SOLUTION FILE HERE
		String uploadedTo = "0";

		String courseID = request.getParameter("crsID");
		String subjectID = null;
		if (courseID.equals("0")) {
			courseID = request.getParameter("courseIDValues");
			subjectID = request.getParameter("subjectIDValues");
			System.out.println("COurse ID:" + courseID);
			System.out.println("Subject ID:" + subjectID);
			if (courseID == null) {
				subjectID = subjectID.substring(0, (subjectID.length() - 1));
			} else if (subjectID == null) {
				courseID = courseID.substring(0, (courseID.length() - 1));
			}
			uploadedTo = uploadForm.getUploadedTo();
			if (uploadedTo.equals("2") || uploadedTo.equals("3")) {
				courseID = null;
				subjectID = null;
			}
		} else {
			com.ignou.vcs.commons.database.CommonsDatabaseActivities obj = new com.ignou.vcs.commons.database.CommonsDatabaseActivities();
			UserBean userBean = obj.getUserInfo(userId);
			subjectID = userBean.getSubjectID();
		}

		try {
			FormFile uploadedFile = uploadForm.getTheFile();
			FormFile solutionFile = uploadForm.getSolutionFile();
			FormFile imageFile = uploadForm.getImageFile();

			FilesDatabaseActivities dbObject = new FilesDatabaseActivities();
			String fileId = dbObject.getFileID();
			System.out.println("FileId:" + fileId);

			UploadFileAction object = new UploadFileAction();
			String uploadedFileName = object.getNewFileName(uploadedFile,
					fileId);
			String solutionFileName = null;
			if (solutionFile != null) {
				solutionFileName = object.getNewFileName(solutionFile, fileId);
			}
			String imageFileName = null;
			if (imageFile != null) {
				imageFileName = object.getNewFileName(imageFile, fileId);
			}

			if ((uploadForm.getFileType()).equals("0")) {
				object.saveUploadedFile(uploadedFile, uploadedFileName,
						Utilities.GENERAL_FILES_UPLOAD_PATH);
			} else if ((uploadForm.getFileType()).equals("1")) {
				object.saveUploadedFile(uploadedFile, uploadedFileName,
						Utilities.LECTURE_FILES_UPLOAD_PATH);

				object.saveUploadedFile(imageFile, imageFileName,
						Utilities.LECTURE_IMAGES_PATH);
			} else if ((uploadForm.getFileType()).equals("2")) {
				object.saveUploadedFile(uploadedFile, uploadedFileName,
						Utilities.ASSIGNMENT_FILES_UPLOAD_PATH);
				object.saveUploadedFile(solutionFile, solutionFileName,
						Utilities.SOLUTION_FILES_UPLOAD_PATH);
			}

			formValues.add(title);
			formValues.add(description);
			formValues.add(uploadedFileName);
			formValues.add(uploadedBy);
			formValues.add(topics);
			formValues.add(Integer.parseInt(uploadForm.getFileType()));
			formValues.add(syllabus);
			formValues.add(solutionFileName);
			formValues.add(uploadedTo);
			formValues.add(courseID);
			formValues.add(subjectID);
			formValues.add(imageFileName);

			dbObject.insertFile(formValues);
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
			forward = mapping.findForward("failure");

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
