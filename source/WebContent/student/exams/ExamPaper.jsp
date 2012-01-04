<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.ignou.vcs.exams.beans.StudentExamBean"%>
<%@page import="com.ignou.vcs.exams.database.ExamsDatabaseActivities"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.ignou.vcs.exams.beans.QuestionBean"%>
<%@page import="java.util.Iterator"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
<title>Virtual Classroom System Examination</title>
<script type="text/javascript"> 
var timer = {
		minutes : 0,
		seconds : 0,
		elm : null,
		samay : null,
		sep : ':',
		init : function(m, s, elm) {
			m = parseInt(m, 10);
			s = parseInt(s, 10);
			if (m < 0 || s < 0 || isNaN(m) || isNaN(s)) {
				alert('Invalid Values');
				return;
			}
			this.minutes = m;
			this.seconds = s;
			this.elm = document.getElementById(elm);
			timer.start();
		},
		start : function() {
			this.samay = setInterval((this.doCountDown), 1000);
		},
		doCountDown : function() {
			if (timer.seconds == 0) {
				if (timer.minutes == 0) {
					clearInterval(timer.samay);
					timerComplete();
					return;
				} else {
					timer.seconds = 60;
					timer.minutes--;
				}
			}
			timer.seconds--;
			timer.updateTimer(timer.minutes, timer.seconds);
		},
		updateTimer : function(min, secs) {
			min = (min < 10 ? '0' + min : min);
			secs = (secs < 10 ? '0' + secs : secs);
			(this.elm).innerHTML = "Time left: <b>"+min + (this.sep) + secs+"</b>";
		}
	}
	function timerComplete() 
	{
		//alert('Exam Time is up click on end exam to get result');
		var ques = document.getElementById("noOfQues").value;
		endExam(ques);
		window.location = "EvaluateExam.jsp";
	}
	
	function startExam(mins,secs)
	{
		for(var i=0;i<document.forms['fm'].elements.length;i++)
		{
			var str = document.forms['fm'].elements[i].name;
			if(str == "startButton")
			{
				document.forms['fm'].elements[i].disabled = true;
			}else
			{
				document.forms['fm'].elements[i].disabled = false;
			}
		}
		timer.init(mins,secs,'container');
	}
	
	function endExam(noOfQues)
	{
		var answers = [];
		
		for (var x = 1; x <= noOfQues; x ++) 
        {
			var optName = "option"+x;
			var radioButtons = document.getElementsByName(optName);
	        for (var xx = 0; xx < radioButtons.length; xx++) 
	        {
	            if(radioButtons[xx].checked)
            	{
	            	answers.push(radioButtons[xx].value);
            	}
	       	}
        }
		document.fm.selectedAnswers.value = answers.join('| ');	    
	}
	
	function init()
	{
		for(var i=0;i<document.forms['fm'].elements.length;i++)
		{
			var str = document.forms['fm'].elements[i].name;
			if(str!= "startButton")
			{
				document.forms['fm'].elements[i].disabled = true;
			}else
			{
				document.forms['fm'].elements[i].disabled = false;
			}
		}
	}
</script>

</head>
<body onload="javascript:window.history.forward(1);init()">
<%@include file="../../PopupHeader.jsp"%>		
<%
		if(userBeanForName==null)
		{
			response.sendRedirect("./NewLogin.jsp");
		}
		String exam = request.getParameter("exam");
		int examId = 0;
		examId = Integer.parseInt(exam);
		ExamsDatabaseActivities eda = new ExamsDatabaseActivities();
		StudentExamBean seb = eda.getExamPaper(examId, userName);
		session.setAttribute("StudentExam", seb);
		
		if(seb!=null)
		{
			%>
			<center><u><b><%=seb.getExamName() %></b></u><hr>
				<table>
					<tr><td>Name: </td><td><%=userBeanForName.getName() %> </td><td></td><td> </td><td></td></tr>
					<tr><td>Course: </td><td><%=seb.getCourseName()%></td><td></td><td>Subject: </td><td><%=seb.getSubjectName() %></td></tr>
				</table>
				<table>
					<tr><td>Exam Id: </td><td><%=seb.getExamId() %> </td><td></td><td>Exam Name: </td><td><%=seb.getExamName() %></td></tr>
					<tr><td>Exam Duration: </td><td><%=seb.getDuration() %> Minute(s)</td><td></td><td>Number of Questions: </td><td><%=seb.getQuestions().size() %></td></tr>
				</table>
			</center>
			
			<div align="right" id="container"></div>
			<hr>
			<input type="hidden" id="noOfQues" value="<%=seb.getQuestions().size() %>">
			<form action="EvaluateExam.jsp" method="post" name="fm" onsubmit="endExam(<%=seb.getQuestions().size()%>)">
			<table>
				<%
					ArrayList<QuestionBean> questions = seb.getQuestions();
					session.setAttribute("ExamQuestions",questions);
					if(questions.size()>0)
					{
						Iterator<QuestionBean> itr = questions.iterator();
						int quesNo = 1;
						while(itr.hasNext()) 
						{
							QuestionBean question = (QuestionBean)itr.next();
							%>
							<tr><td>Question:<%=quesNo %></td><td><b><%=question.getQuestion() %></b></td></tr>
							<%	
								ArrayList<String> st = question.getOptions();
								Iterator<String> it = st.iterator();
								while(it.hasNext()) 
								{
									String option = (String) it.next();
									out.println("<tr><td></td><td><input type='radio' name='option"+quesNo+"' value='" + option+"'>" + option+"</input></td></tr>");
								}
							%>
							<%
							quesNo++;
						}
					}else
					{
						
					}
			%>
			
			</table>

			<input type="hidden" name="exam" value="<%=examId%>"/>
			<input type="hidden" name="selectedAnswers"/>
			<input type="hidden" name="subjectId" value="<%=seb.getSubjectId()%>"/>
			<input type="hidden" name="userName" value="<%=userName%>"/>
			<center>
				<input type="button" name="startButton" value="Start Exam" onclick="javascript: startExam(<%=seb.getDuration()%>,0)"/>
				<input type="submit" name="submit" value="End Exam" disabled="disabled"/>
			</center>
			</form>
			<%
		}

%>
<br><br>
<br><br>
<center>&copy; Copyright 2012 Virtual Classroom Systems. Designed by <b>Pradeepthi Savaram</b></center>							
</body>
</html>
