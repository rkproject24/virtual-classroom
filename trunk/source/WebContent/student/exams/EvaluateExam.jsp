<%@page import="com.ignou.vcs.exams.beans.ExamBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ignou.vcs.exams.beans.QuestionBean"%>
<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	String exam = request.getParameter("exam");
	String subject = request.getParameter("subjectId");
	String answersSelected = request.getParameter("selectedAnswers");
	String userName = request.getParameter("userName");
	String result = "";

	int marks = 0;
	int totalMarks = 0;
	ServletContext ctx = getServletContext();
	//ExamBean eb = (ExamBean) session.getAttribute("ExamDetails");
	ArrayList<QuestionBean> questions = (ArrayList<QuestionBean>) session.getAttribute("ExamQuestions");
	if( questions!=null)
	{
		if (questions.size() > 0) 
		{
			StringTokenizer st = new StringTokenizer(answersSelected, "|");
			System.out.println(answersSelected + "  ANSWERS from JSP");
			int quest = 0;
	
			while (st.hasMoreTokens()) 
			{
				QuestionBean qb = questions.get(quest);
				String ans = st.nextToken().trim();
				System.out.println("Ans: "+ ans + "    correct ans "+ qb.getCorrectAnswer() );
				if (qb.getCorrectAnswer().equals(ans)) 
				{
					marks = marks + qb.getMarks();
					System.out.println("Marks: "+ marks);
				}
				quest++;
			}
			for (int i = 0; i < questions.size(); i++) 
			{
				QuestionBean qbb = questions.get(i);
				totalMarks = totalMarks+ qbb.getMarks();
			}
		}
		int calPer = (marks * 100) / totalMarks;
		//TODO: update student exam status table and moe page to examresults.jsp page.
		session.setAttribute("MarksSecured",marks+"");
		session.setAttribute("TotalMarks",totalMarks+"");
		
		getServletContext().getRequestDispatcher("/student/exams/ExamResults.jsp").forward(request,response);
	}else
	{
		out.println("<center><b><font color='red'>Unable to evaluate exam. "+
				"</font></b><br>Please contact your faculty to take re-test.</center>");
	}
	/*if (calPer > 35 && calPer < 50) {
		result = "passed";
	} else if (calPer > 51 && calPer < 60) {
		result = "good";
	} else if (calPer > 61 && calPer < 80) {
		result = "very good";
	} else if (calPer > 81) {
		result = "excellent";
	}*/
	
	
%>

