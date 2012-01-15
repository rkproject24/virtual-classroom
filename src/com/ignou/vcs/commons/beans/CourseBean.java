package com.ignou.vcs.commons.beans;
import java.util.ArrayList;
public class CourseBean {
	String courseId;
	String name;
	String duration;
	String assignments;
	ArrayList<String> AllSubjects;
	
	public String getAssignments() {
		return assignments;
	}
	public void setAssignments(String assignments) {
		this.assignments = assignments;
	}
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public ArrayList<String> getAllSubjects() {
		return AllSubjects;
	}
	public void setAllSubjects(ArrayList<String> allSubjects) {
		AllSubjects = allSubjects;
	}
	
}
