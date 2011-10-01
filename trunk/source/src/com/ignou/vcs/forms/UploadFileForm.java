package com.ignou.vcs.forms;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

/**
 * Form bean for a Struts application.
 * Users may access 10 fields on this form:
 * <ul>
 * <li>title - [your comment here]
 * <li>description - [your comment here]
 * <li>filePath - [your comment here]
 * <li>topics - [your comment here]
 * <li>fileType - [your comment here]
 * <li>syllabus - [your comment here]
 * <li>solutionFile - [your comment here]
 * <li>uploadedTo - [your comment here]
 * <li>courseID - [your comment here]
 * <li>subjectID - [your comment here]
 * </ul>
 * @version 	1.0
 * @author
 */
public class UploadFileForm extends ActionForm

{

    private String title = null;

    private String description = null;

    private String filePath = null;

    private String topics = null;

    private String fileType = null;

    private String syllabus = null;

    private FormFile solutionFile = null;

    private String uploadedTo = null;

    private String courseID = null;

    private String subjectID = null;
    
    private FormFile theFile = null;
    
    private FormFile imageFile = null;

    /**
     * Get title
     * @return String
     */
    public String getTitle() {
	return title;
    }

    /**
     * Set title
     * @param <code>String</code>
     */
    public void setTitle(String t) {
	this.title = t;
    }

    /**
     * Get description
     * @return String
     */
    public String getDescription() {
	return description;
    }

    /**
     * Set description
     * @param <code>String</code>
     */
    public void setDescription(String d) {
	this.description = d;
    }

    /**
     * Get filePath
     * @return String
     */
    public String getFilePath() {
	return filePath;
    }

    /**
     * Set filePath
     * @param <code>String</code>
     */
    public void setFilePath(String f) {
	this.filePath = f;
    }

    /**
     * Get topics
     * @return String
     */
    public String getTopics() {
	return topics;
    }

    /**
     * Set topics
     * @param <code>String</code>
     */
    public void setTopics(String t) {
	this.topics = t;
    }

    /**
     * Get fileType
     * @return String
     */
    public String getFileType() {
	return fileType;
    }

    /**
     * Set fileType
     * @param <code>String</code>
     */
    public void setFileType(String f) {
	this.fileType = f;
    }

    /**
     * Get syllabus
     * @return String
     */
    public String getSyllabus() {
	return syllabus;
    }

    /**
     * Set syllabus
     * @param <code>String</code>
     */
    public void setSyllabus(String s) {
	this.syllabus = s;
    }

   
    /**
     * Get uploadedTo
     * @return String
     */
    public String getUploadedTo() {
	return uploadedTo;
    }

    /**
     * Set uploadedTo
     * @param <code>String</code>
     */
    public void setUploadedTo(String u) {
	this.uploadedTo = u;
    }

    /**
     * Get courseID
     * @return String
     */
    public String getCourseID() {
	return courseID;
    }

    /**
     * Set courseID
     * @param <code>String</code>
     */
    public void setCourseID(String c) {
	this.courseID = c;
    }

    /**
     * Get subjectID
     * @return String
     */
    public String getSubjectID() {
	return subjectID;
    }

    /**
     * Set subjectID
     * @param <code>String</code>
     */
    public void setSubjectID(String s) {
	this.subjectID = s;
    }

    public void reset(ActionMapping mapping, HttpServletRequest request) {

	// Reset values are provided as samples only. Change as appropriate.

	title = null;
	description = null;
	filePath = null;
	topics = null;
	fileType = null;
	syllabus = null;
	solutionFile = null;
	uploadedTo = null;
	courseID = null;
	subjectID = null;

    }

    public ActionErrors validate(ActionMapping mapping,
	    HttpServletRequest request) {

	ActionErrors errors = new ActionErrors();
	// Validate the fields in your form, adding
	// adding each error to this.errors as found, e.g.

	// if ((field == null) || (field.length() == 0)) {
	//   errors.add("field", new org.apache.struts.action.ActionError("error.field.required"));
	// }
	return errors;

    }

	public FormFile getTheFile() {
		return theFile;
	}

	public void setTheFile(FormFile theFile) {
		this.theFile = theFile;
	}

	public FormFile getSolutionFile() {
		return solutionFile;
	}

	public void setSolutionFile(FormFile solutionFile) {
		this.solutionFile = solutionFile;
	}

	public FormFile getImageFile() {
		return imageFile;
	}

	public void setImageFile(FormFile imageFile) {
		this.imageFile = imageFile;
	}
}
