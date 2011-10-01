package com.ignou.vcs.beans;

public class StudentReport {
	
	String userid;
	int testid;
	int marks;
	String name;
	String Test_name;
	
	String subjectname;
	public int getMarks() {
		return marks;
	}
	public void setMarks(int marks) {
		this.marks = marks;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubjectname() {
		return subjectname;
	}
	public void setSubjectname(String subjectname) {
		this.subjectname = subjectname;
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
	
}
