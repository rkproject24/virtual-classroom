package com.ignou.vcs.report.beans;

public class StudentBean {
	String studentid;
	String name;
	String totalMarks;
	double perc;
	double maxmarks;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStudentid() {
		return studentid;
	}
	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}
	public String getTotalMarks() {
		return totalMarks;
	}
	public void setTotalMarks(String totalMarks) {
		this.totalMarks = totalMarks;
	}
	public double getPerc() {
		return perc;
	}
	public void setPerc(double perc) {
		this.perc = perc;
	}
	public double getMaxmarks() {
		return maxmarks;
	}
	public void setMaxmarks(double maxmarks) {
		this.maxmarks = maxmarks;
	}
	
	
}
