package com.ignou.vcs.beans;

public class major_studentBase {
	
	String userid;
	int subjectid;
	int testid;
	int maxmarks;
	int passmarks;
	int marksObtained;
	int highestMarks;
	String Test_name;
	public int getHighestMarks() {
		return highestMarks;
	}
	public void setHighestMarks(int highestMarks) {
		this.highestMarks = highestMarks;
	}
	public int getMarksObtained() {
		return marksObtained;
	}
	public void setMarksObtained(int marksObtained) {
		this.marksObtained = marksObtained;
	}
	public int getMaxmarks() {
		return maxmarks;
	}
	public void setMaxmarks(int maxmarks) {
		this.maxmarks = maxmarks;
	}
	public int getPassmarks() {
		return passmarks;
	}
	public void setPassmarks(int passmarks) {
		this.passmarks = passmarks;
	}
	public String getTest_name() {
		return Test_name;
	}
	public void setTest_name(String test_name) {
		Test_name = test_name;
	}
	public int getTestid() {
		return testid;
	}
	public void setTestid(int testid) {
		this.testid = testid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getSubjectid() {
		return subjectid;
	}
	public void setSubjectid(int subjectid) {
		this.subjectid = subjectid;
	}
}