
<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%>
<%@page import="com.ignou.vcs.beans.AnswerBean"%><%@ page import = "com.ignou.vcs.xml.addXML" %>
<%@ page import = "java.util.*" %>

<%
	String xmlDoc;
	ArrayList ques_list = (ArrayList)request.getSession().getAttribute("ques_list");
	ArrayList soln_list = (ArrayList)request.getSession().getAttribute("soln_list");
	int k =0;
	for(k = 0;k < soln_list.size();k++)
	{
		AnswerBean answerBean = (AnswerBean)soln_list.get(k);
		String tempAnswer = answerBean.getAnswer();
		int tempQuesno = answerBean.getQuesno();
		if(tempAnswer.equals(""))
		{
			answerBean.setQuesno(tempQuesno);
			answerBean.setAnswer("Not Attempted");
			soln_list.set(k,answerBean);
		}
	}
	for(int i = 0;i < ques_list.size();i++)
	{
		int j = 0;
		for(j = 0;j < soln_list.size();j++)
		{
			AnswerBean answerBean = (AnswerBean)soln_list.get(j);
			int tempQuesno = answerBean.getQuesno();
			if(tempQuesno == (i + 1))
				break;
		}	 
		if(j == soln_list.size())
		{
			AnswerBean answerBean = new AnswerBean();
			answerBean.setQuesno(i+1);
			answerBean.setAnswer("Not Attempted");
			soln_list.add(answerBean);
		}
	}	
		
	String studentid = (String)request.getSession().getAttribute("studentid");
	
	String testid = (String)request.getSession().getAttribute("testid");
	System.out.println("testid  " + testid);
	
	
	String soln_file = (String)request.getSession().getAttribute("solnFile");
	addXML obj1 = new addXML();
        
        obj1.solutionXML(soln_list,soln_file);
		addXML obj3 = new addXML();
		
		xmlDoc = obj3.readXML(soln_file);
		VCSDatabaseActivities db_obj = new VCSDatabaseActivities();
		db_obj.insertSolution(xmlDoc,testid,studentid);
		
		response.sendRedirect("http://localhost:8080/VCS/home.jsp");
		%>
		