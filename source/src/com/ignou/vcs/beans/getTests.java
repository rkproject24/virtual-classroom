package com.ignou.vcs.beans;

public class getTests {
	String testid;
	String test_type;
	String test_name;
	String prereq;
	String syllabus;
	String taken_by;
	String max_marks;
	String pass_marks;
	String courseid;
	String subjectid;
	String duration;
	
	public String getMax_marks() {
		return max_marks;
	}
	public void setMax_marks(String max_marks) {
		this.max_marks = max_marks;
	}
	public String getPass_marks() {
		return pass_marks;
	}
	public void setPass_marks(String pass_marks) {
		this.pass_marks = pass_marks;
	}
	public String getPrereq() {
		return prereq;
	}
	public void setPrereq(String prereq) {
		this.prereq = prereq;
	}
	public String getSyllabus() {
		return syllabus;
	}
	public void setSyllabus(String syllabus) {
		this.syllabus = syllabus;
	}
	public String getTaken_by() {
		return taken_by;
	}
	public void setTaken_by(String taken_by) {
		this.taken_by = taken_by;
	}
	public String getTest_name() {
		return test_name;
	}
	public void setTest_name(String test_name) {
		this.test_name = test_name;
	}
	public String getTest_type() {
		return test_type;
	}
	public void setTest_type(String test_type) {
		this.test_type = test_type;
	}
	public String getTestid() {
		return testid;
	}
	public void setTestid(String testid) {
		this.testid = testid;
	}
	public String getCourseid() {
		return courseid;
	}
	public void setCourseid(String courseid) {
		this.courseid = courseid;
	}
	public String getSubjectid() {
		return subjectid;
	}
	public void setSubjectid(String subjectid) {
		this.subjectid = subjectid;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	
}
