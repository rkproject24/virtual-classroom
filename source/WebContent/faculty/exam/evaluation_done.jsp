
<%@page import="com.ignou.vcs.report.beans.ReportBean"%>
<%@page import="com.ignou.vcs.report.database.ReportDatabaseActivities"%>
<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%>
<%@page import="com.ignou.vcs.xml.addXML"%><%@page import="com.ignou.vcs.xml.addXML"%>

<%
	String marks = request.getParameter("marks");
	String quesNo = request.getParameter("quesno");
	String Ques = request.getParameter("ques");
	String Answer = request.getParameter("answer");
	System.out.println(marks + " " + quesNo + " " +Answer); 
	com.ignou.vcs.beans.Answersheet answerBean = new com.ignou.vcs.beans.Answersheet();
	answerBean.setAnswer(Answer);
	answerBean.setQuesno(quesNo);
	answerBean.setMarks(marks);
	answerBean.setQues(Ques);
	
	java.util.ArrayList list = (java.util.ArrayList)request.getSession().getAttribute("list");
	list.add(answerBean);
	String testid = (String)request.getSession().getAttribute("testid");
	String studentid = (String)request.getSession().getAttribute("studentid");
	
	String filename = "C:\\" + "sheet_" + testid + "_" + studentid+  ".xml";
	addXML xmlObj = new addXML();
	
	VCSDatabaseActivities db_obj = new VCSDatabaseActivities();
	xmlObj.AnswersheetXML(list,filename);
	String xmlDoc = xmlObj.readXML(filename);
	
	ReportDatabaseActivities db_ob = new ReportDatabaseActivities();
	db_ob.updateAnswerSheet(xmlDoc,testid,studentid);
	String total_marks = (String)request.getSession().getAttribute("total_marks");
	int marks1 = Integer.parseInt(marks);
	int total_marks1 = Integer.parseInt(total_marks);
	total_marks1 = total_marks1 + marks1;
	
	db_obj.updateTest(total_marks1,testid,studentid);
	response.sendRedirect("http://localhost:8080/VCS/Success.jsp");
%>