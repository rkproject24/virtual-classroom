package com.ignou.vcs.beans;

public class MgmtBean {
	String mgmtID;
	String userID;
	String name;
	String dob;
	String emailP;
	String emailS;
	String contactP;
	String contactS;
	String address;
	
	String photograph;
	
	String designation;
	String userLevel;
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getContactP() {
		return contactP;
	}
	public void setContactP(String contactP) {
		this.contactP = contactP;
	}
	public String getContactS() {
		return contactS;
	}
	public void setContactS(String contactS) {
		this.contactS = contactS;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getEmailP() {
		return emailP;
	}
	public void setEmailP(String emailP) {
		this.emailP = emailP;
	}
	public String getEmailS() {
		return emailS;
	}
	public void setEmailS(String emailS) {
		this.emailS = emailS;
	}
	public String getMgmtID() {
		return mgmtID;
	}
	public void setMgmtID(String mgmtID) {
		this.mgmtID = mgmtID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhotograph() {
		return photograph;
	}
	public void setPhotograph(String photograph) {
		this.photograph = photograph;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserLevel() {
		return userLevel;
	}
	public void setUserLevel(String userLevel) {
		this.userLevel = userLevel;
	}
}
