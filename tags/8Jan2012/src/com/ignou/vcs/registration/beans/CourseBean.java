package com.ignou.vcs.registration.beans;
import java.util.ArrayList;
public class CourseBean {
	String courseId;
	String name;
	String duration;
	String fees;
	//ArrayList AllSubjects;
	
	public String getFees() {
		return fees;
	}
	public void setFees(String fees) {
		this.fees = fees;
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
	/*public ArrayList getAllSubjects() {
		return AllSubjects;
	}
	public void setAllSubjects(ArrayList allSubjects) {
		AllSubjects = allSubjects;
	}*/
	
}
