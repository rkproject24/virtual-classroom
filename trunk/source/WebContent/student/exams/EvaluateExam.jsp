<%@page import="com.ignou.vcs.exams.beans.StudentExamStatusBean"%>
<%@page import="com.ignou.vcs.exams.database.ExamsDatabaseActivities"%>
<%@page import="com.ignou.vcs.exams.beans.ExamBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ignou.vcs.exams.beans.QuestionBean"%>
<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	String exam = request.getParameter("exam");
	String answersSelected = request.getParameter("selectedAnswers");
	String userName = request.getParameter("userName");
	String result = "failed";
	int marks = 0;
	int totalMarks = 0;
	int examId = Integer.parseInt(exam);
	ServletContext ctx = getServletContext();
	ExamsDatabaseActivities eda = new ExamsDatabaseActivities();
	ExamBean eb = eda.getExamDetails(examId);
	
	ArrayList<QuestionBean> questions = (ArrayList<QuestionBean>) session.getAttribute("ExamQuestions"); 	
	if(eb!=null && questions!=null) 	
	{ 		
		if (questions.size() > 0)  		
		{ 			
			StringTokenizer st = new StringTokenizer(answersSelected, "|"); 			
			int quest = 0; 	 			
			
			while (st.hasMoreTokens())  			
			{ 				
				QuestionBean qb = questions.get(quest); 				
				String ans = st.nextToken().trim(); 				
				if (qb.getCorrectAnswer().equals(ans))  				
				{ 					
					marks = marks + qb.getMarks(); 					
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
			int passMarks = eb.getPassMarks();
			if(marks>=passMarks)
			{
				result= "pass";
			}
			else
			{
				result="fail";
			}
			
			//TODO: update student exam status table and moe page to examresults.jsp page. 		
			session.setAttribute("MarksSecured",marks+""); 		
			session.setAttribute("TotalMarks",totalMarks+""); 
			session.setAttribute("Percentage",calPer+""); 
			session.setAttribute("Result",result);
			
			StudentExamStatusBean sesb = new StudentExamStatusBean();
			sesb.setExamId(examId);
			sesb.setExamName(eb.getExamName());
			sesb.setSubjectId(eb.getSubjectId());
			sesb.setCourseId(eb.getCourseId());
			sesb.setResult(result);
			sesb.setScore(marks);
			sesb.setUserName(userName);
			
			Boolean b = eda.updateExamStatus(sesb);
			if(b)
			{
				getServletContext().getRequestDispatcher("/student/exams/ExamResults.jsp").forward(request,response);
			}else
			{
				out.println("<center><font color='red'>We are sorry. We are not able to evaluate your question paper."+
						"</font><br>Please contact your faculty immadiately.</center>");
				//Thread.sleep(5000);
				//response.sendRedirect("/logout.jsp");
			}
		}
	else 	
	{ 		
		out.println("<center><b><font color='red'>Unable to evaluate exam. "+ 				
			"</font></b><br>Please contact your faculty to take re-test."+
			"<br><br><br>Please <a href='/logout.jsp'>Logout</a> and login again."+
			"</center>"); 	
	} 	
	/*if (calPer > 35 && calPer < 50) { 		result = "passed"; 	} else if (calPer > 51 && calPer < 60) { 		result = "good"; 	} else if (calPer > 61 && calPer < 80) { 		result = "very good"; 	} else if (calPer > 81) { 		result = "excellent"; 	}*/
%>
