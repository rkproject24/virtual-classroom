package com.ignou.vcs.commons.beans;

public class generateReport {
	
	String subjectName;
	int maxMarks;
	String totalMarks;
	int highestMarks;
	int testId;
	
	public int getHighestMarks() {
		return highestMarks;
	}
	public void setHighestMarks(int highestMarks) {
		this.highestMarks = highestMarks;
	}
	public int getMaxMarks() {
		return maxMarks;
	}
	public void setMaxMarks(int maxMarks) {
		this.maxMarks = maxMarks;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public int getTestId() {
		return testId;
	}
	public void setTestId(int testId) {
		this.testId = testId;
	}
	public String getTotalMarks() {
		return totalMarks;
	}
	public void setTotalMarks(String totalMarks) {
		this.totalMarks = totalMarks;
	}
	
}

