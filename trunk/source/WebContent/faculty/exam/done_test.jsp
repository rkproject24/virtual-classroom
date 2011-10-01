
<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%><%@page import="java.awt.Window"%>
<%@page import="com.ignou.vcs.forms.Test_paper"%>
<%@page import="com.ignou.vcs.xml.addXML"%>
<%@page import = "java.util.*,javax.servlet.*,javax.naming.*,javax.servlet.http.*,java.sql.*" %>
<%
	
	String xmlDoc;
	String flag;
	String quesno = request.getParameter("quesno");
	String ques = request.getParameter("ques");
	String mode = request.getParameter("mode");
	int quesno1 = Integer.parseInt(quesno);
	String marks = request.getParameter("marks");
	
	
	String testid = (String)request.getSession().getAttribute("testid");
	String filename = "C:\\" + "file_" + testid + ".xml";
	request.getSession().setAttribute("filename",filename);
	
	Test_paper test_paper = new Test_paper();
	//start
	addXML obj2 = new addXML();
	String ques1 = addXML.unescapeForXML(ques);
	//end
	test_paper.setQuesno(quesno1);
	test_paper.setQues(ques1);
	test_paper.setQuesmarks(marks);
	request.getSession().setAttribute("quesno",quesno);
	
	ArrayList list = (ArrayList)request.getSession().getAttribute("list");
	
	list.add(test_paper);
	
	request.getSession().setAttribute("list",list);
	
	
		
		addXML obj1 = new addXML();
        
        obj1.generateXML(list,filename);
		addXML obj3 = new addXML();
		
		xmlDoc = obj3.readXML(filename);
		
		VCSDatabaseActivities dbObj = new VCSDatabaseActivities();
		dbObj.insertXML(xmlDoc,testid);
		HttpSession getSession = request.getSession();
		getSession.removeAttribute("list");
		getSession.removeAttribute("quesno");
		getSession.removeAttribute("filename");
		response.sendRedirect("test.jsp");
		
	
	
	
%>