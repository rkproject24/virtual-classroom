package com.ignou.vcs.beans;

public class discussionBean {
	String organizedBy;
	String organizedFor;
	String subjectid;
	String courseid;
	String date;
	String time;
	String title;
	String description;
	String duration;
	
	public String getCourseid() {
		return courseid;
	}
	public void setCourseid(String courseid) {
		this.courseid = courseid;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getOrganizedBy() {
		return organizedBy;
	}
	public void setOrganizedBy(String organizedBy) {
		this.organizedBy = organizedBy;
	}
	public String getOrganizedFor() {
		return organizedFor;
	}
	public void setOrganizedFor(String organizedFor) {
		this.organizedFor = organizedFor;
	}
	public String getSubjectid() {
		return subjectid;
	}
	public void setSubjectid(String subjectid) {
		this.subjectid = subjectid;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
}
