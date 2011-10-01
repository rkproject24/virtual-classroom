
<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%><%@page import="com.ignou.vcs.xml.addXML"%>
<%@page import="com.ignou.vcs.forms.Test_paper"%>
<%@page import="java.util.ArrayList"%>
<%
	String xmlDoc;
	ArrayList ques_list = (ArrayList)request.getSession().getAttribute("old_list");
	String quesno_new = request.getParameter("quesNo");
	System.out.println("QUESN" + quesno_new);
	String ques_new = request.getParameter("ques");
	String marks_new = request.getParameter("marks");
	int iQuesNo = Integer.parseInt(quesno_new);
	
	Test_paper paperBean = new Test_paper();
	ques_new = addXML.unescapeForXML(ques_new); 
	paperBean.setQues(ques_new);
	paperBean.setQuesno(Integer.parseInt(quesno_new));
	paperBean.setQuesmarks(marks_new);
	
	System.out.println("iQuesNo " + iQuesNo + " ques_list.size() " + ques_list.size()); 
	if((iQuesNo - 1) == ques_list.size())
		ques_list.add(paperBean);
	else
		ques_list.set((iQuesNo - 1),paperBean);
	String testid = (String)request.getSession().getAttribute("testid");
	String filename = "C:\\" + "file_" + testid + ".xml";
	VCSDatabaseActivities dbObj = new VCSDatabaseActivities();
	
	
	
	addXML ob = new addXML();
	ob.generateXML(ques_list,filename);
	String facultyid = (String)request.getSession().getAttribute("userId");
	xmlDoc = ob.readXML(filename);
	dbObj.updateXML(xmlDoc,testid,facultyid);
	response.sendRedirect("http://localhost:8080/VCS/home.jsp");
%>	
	