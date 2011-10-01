package com.ignou.vcs.beans;

public class Syllabus {
	
	int unitno;
	String unitname;
	String topics;
	String subject;
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getTopics() {
		return topics;
	}
	public void setTopics(String topics) {
		this.topics = topics;
	}
	public String getUnitname() {
		return unitname;
	}
	public void setUnitname(String unitname) {
		this.unitname = unitname;
	}
	public int getUnitno() {
		return unitno;
	}
	public void setUnitno(int unitno) {
		this.unitno = unitno;
	}
}
