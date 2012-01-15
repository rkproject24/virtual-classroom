
<%@page import="java.util.ArrayList"%><%@ page import="com.ignou.vcs.registration.code.*,com.ignou.vcs.registration.beans.*,com.ignou.vcs.registration.database.*,com.ignou.vcs.commons.*,com.ignou.vcs.commons.database.*,com.ignou.vcs.commons.beans.*;" %>
<% 
RegistrationBean regBean = (RegistrationBean)request.getSession().getAttribute("regBean");
String courseId=(String)request.getSession().getAttribute("cid");
String duration=(String)request.getSession().getAttribute("duration");
String fees=(String)request.getSession().getAttribute("fees");
System.out.println("final courseid:"+courseId);
String details=request.getParameter("details");
String name=regBean.getName();
String dayBirth=regBean.getDayBirth();
String monthBirth=regBean.getMonthBirth();
String yearBirth=regBean.getYearBirth();
String dob=yearBirth + "-" + monthBirth +"-" +dayBirth;
String email_id_primary=regBean.getEmailP();
String email_id_secondary=regBean.getEmailS();
String contact_no_primary=regBean.getContactP();
String contact_no_secondary=regBean.getContactS();
String address=regBean.getAddress();
String father_name=regBean.getFatherName();
String occupation=regBean.getOccupation();
String password=regBean.getPassword();
System.out.println(password);
System.out.println("Contact No Secondary:" + contact_no_secondary);
if(contact_no_secondary.equals("")) {
	contact_no_secondary = "NULL";
}
System.out.println("Contact No Secondary:" + contact_no_secondary);
RegistrationDatabaseActivities db = new RegistrationDatabaseActivities();
CommonsDatabaseActivities db1 = new CommonsDatabaseActivities();
int level=0;
String encryptedPassword = PasswordService.getInstance().encrypt(password);
String userId=db1.generateId(encryptedPassword,level);
db.insertValue(userId,courseId,duration,fees,details,name,dob,email_id_primary,email_id_secondary,contact_no_primary,contact_no_secondary,address,father_name,occupation);

	  ArrayList<String> recepients = new ArrayList<String>();
	  recepients.add(email_id_primary);
	  ArrayList<String> ccRecepients = db1.getAdminMailIds();
	  
	  String subject = "Welcome to Virtual Classroom System";
	  String message = "Congratulations, You are now a part of VCS. Your Login Details are as follows:\n Username:" + userId + " \n Password:" + password + "." ;
	  MailBean mb = new MailBean();
	  mb.setMailSubject(subject);
	  mb.setMsgContent(message);
	  mb.setToRecipients(recepients);
	  mb.setCCRecipients(ccRecepients);
	  
	  EMailUtilities.sendMail(mb);
%>
You have been succesfully registered!!!