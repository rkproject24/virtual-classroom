<%@page import="java.awt.Window"%>
<%@page import="com.ignou.vcs.forms.Test_paper"%>
<%@page import="com.ignou.vcs.xml.addXML"%>
<%@page import = "java.util.*,javax.servlet.*,javax.naming.*,javax.servlet.http.*,java.sql.*" %>

<%
	String i1 = request.getParameter("quesno");
	int quesno = Integer.parseInt(i1);
	String ques = request.getParameter("ques");
	String marks = request.getParameter("marks");
	String oldmarks = request.getParameter("oldmarks");
	String marksCount = (String)request.getSession().getAttribute("marksCount");
	int imarksCount = Integer.parseInt(marksCount);
	int ioldmarks = Integer.parseInt(oldmarks);
	int imarks = Integer.parseInt(marks);
	System.out.println(imarksCount + " " + imarks + " " + ioldmarks);
	imarksCount = imarksCount + imarks - ioldmarks;
	request.getSession().setAttribute("marksCount",Integer.toString(imarksCount));
	System.out.println("ANKIT AGARWAL" + imarksCount); 
	ques = addXML.unescapeForXML(ques);
	ArrayList list = (ArrayList)request.getSession().getAttribute("list");
	Test_paper test_paper = new Test_paper();
	test_paper.setQuesno(quesno);
	test_paper.setQues(ques);
	test_paper.setQuesmarks(marks);
	list.set((quesno-1),test_paper);
	System.out.println("ques no " + test_paper.getQuesno());
	System.out.println("ques " + test_paper.getQues());
	System.out.println("MARKS " + test_paper.getQuesmarks());
%>