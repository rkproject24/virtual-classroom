package com.ignou.vcs.beans;

public class FileBean {
	int fileid;
	String title;
	String description;
	String uploadedby;
	String uploadedto;
	String filetype;
	String filepath;
	String courseid;
	String subjectid;
	String name;
	String imageFilePath;
	
	public String getCourseid() {
		return courseid;
	}
	public void setCourseid(String courseid) {
		this.courseid = courseid;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getFileid() {
		return fileid;
	}
	public void setFileid(int fileid) {
		this.fileid = fileid;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getFiletype() {
		return filetype;
	}
	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}
	public String getSubjectid() {
		return subjectid;
	}
	public void setSubjectid(String subjectid) {
		this.subjectid = subjectid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUploadedby() {
		return uploadedby;
	}
	public void setUploadedby(String uploadedby) {
		this.uploadedby = uploadedby;
	}
	public String getUploadedto() {
		return uploadedto;
	}
	public void setUploadedto(String uploadedto) {
		this.uploadedto = uploadedto;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImageFilePath() {
		return imageFilePath;
	}
	public void setImageFilePath(String imageFilePath) {
		this.imageFilePath = imageFilePath;
	}
	
}
