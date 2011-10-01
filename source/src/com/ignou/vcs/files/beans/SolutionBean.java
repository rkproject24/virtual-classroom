package com.ignou.vcs.files.beans;

public class SolutionBean {
	
	private String fileId = null;
	
	private String userID = null;
	
	private String approved = null;
	
	private String feedback = null;
	
	private String answerFile = null;

	private boolean solutionExists = false;
	
	private String submitDate = null;
	
	private String solutionID = null;
	
	public String getAnswerFile() {
		return answerFile;
	}

	public void setAnswerFile(String answerFile) {
		this.answerFile = answerFile;
	}

	public String getApproved() {
		return approved;
	}

	public void setApproved(String approved) {
		this.approved = approved;
	}

	public String getFeedback() {
		return feedback;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}

	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public boolean isSolutionExists() {
		return solutionExists;
	}

	public void setSolutionExists(boolean solutionExists) {
		this.solutionExists = solutionExists;
	}

	public String getSubmitDate() {
		return submitDate;
	}

	public void setSubmitDate(String submitDate) {
		this.submitDate = submitDate;
	}

	public String getSolutionID() {
		return solutionID;
	}

	public void setSolutionID(String solutionID) {
		this.solutionID = solutionID;
	}
}
