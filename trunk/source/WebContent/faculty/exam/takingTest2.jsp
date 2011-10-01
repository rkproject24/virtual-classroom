<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.awt.Window"%>
<%@page import="com.ignou.vcs.forms.Test_paper"%>
<%@page import="com.ignou.vcs.xml.addXML"%>
<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%>
<%@page import="java.util.*,javax.servlet.*,javax.naming.*,javax.servlet.http.*,java.sql.*"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ignou.vcs.commons.beans.UserBean"%>

<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%>
<%@page import="com.ignou.vcs.beans.AnswerBean"%><div class="left">
			<div class="left_articles">
				
				<script src="${pageContext.request.contextPath}/faculty/exam/js/ajax_student.js"></script>
				<script src="${pageContext.request.contextPath}/faculty/exam/js/exam_student_js.js"></script>		
				
		<%
		String quesno = request.getParameter("quesno");	
			
			System.out.println("QUESNO:" + quesno);
			int quesno1 = Integer.parseInt(quesno);
		String userid = (String)request.getSession().getAttribute("studentid");
		
		String testid = (String)request.getSession().getAttribute("testid");
		System.out.println("TESTID HERE:joj " + testid);
		int itestid = Integer.parseInt(testid);
		System.out.println("TESTID HERE: " + itestid);
		VCSDatabaseActivities db_obj = new VCSDatabaseActivities();
		
		int flag = 0;
		
		flag = db_obj.check(itestid,userid);
		
		if(flag == 1)
		{
		%> 	<br><br>
			<b>You have given this test</b>
		<%
		
		}
		else
		{
			
			VCSDatabaseActivities testPaper = new VCSDatabaseActivities();
			com.ignou.vcs.forms.Test_paper test_Paper = new com.ignou.vcs.forms.Test_paper();
			System.out.println(testid);
			ArrayList ques_list = testPaper.getPaper(testid); 
			
			request.getSession().setAttribute("ques_list",ques_list);
			String ques ="";
			String marks = "";
			String solnFile = "C:\\" + "file_" + testid +"_" + userid +  ".xml";
			request.getSession().setAttribute("solnFile",solnFile);
			String answer = "";
			
			
			
			if(quesno1 == 0)
			{	
				test_Paper = (com.ignou.vcs.forms.Test_paper)ques_list.get(quesno1);
				
				ques = test_Paper.getQues();
				marks = test_Paper.getQuesmarks();
				ques = addXML.unescapeForXML1(ques);
			}
			if(quesno1 > 0)
			{
				
				int flag_ans[] = (int[])request.getSession().getAttribute("flag");
				
				ques = request.getParameter("ques") ;
				String ans  = request.getParameter("ans");
				quesno1 = Integer.parseInt(quesno);
				
				com.ignou.vcs.beans.AnswerBean soln = new com.ignou.vcs.beans.AnswerBean();
				ans = addXML.unescapeForXML(ans);
				soln.setAnswer(ans);
				soln.setQuesno(quesno1);
				
				ques_list = (ArrayList)request.getSession().getAttribute("ques_list");
				ArrayList soln_list = (ArrayList)request.getSession().getAttribute("soln_list");
				
				for(int i = 0;i<ques_list.size();i++)
					System.out.println("ank" + flag_ans[i]);
				if(flag_ans[quesno1 - 1] == 1)
				{
					System.out.println(quesno1);
					for(int i = 0;i< soln_list.size();i++)
					{
						
							AnswerBean soln1 = (AnswerBean)soln_list.get(i); 
							int tempQuesno = soln1.getQuesno();
							System.out.println(i + " " + tempQuesno + " " + quesno1);
							if(tempQuesno == quesno1)
							{
								soln_list.set(i,soln);
							}
					}
					
				}
				else
				{
					if(soln_list.size() > 0)
					{
						for(int i = 0;i< soln_list.size();i++)
						{
							
								AnswerBean soln1 = (AnswerBean)soln_list.get(i); 
								int tempQuesno = soln1.getQuesno();
								System.out.println(i + " " + tempQuesno + " " + quesno1);
								if(tempQuesno == quesno1)
								{
									if(!(ans.equals("")))
									soln_list.set(i,soln);
									break;
								}
								if(i == (soln_list.size() - 1))
									soln_list.add(soln);	
						}
					}
					else
						soln_list.add(soln);
				}
				
				if(ans.equals(""))
				{
					
					flag_ans[quesno1 - 1] = 0;
				}
				else
				{
					System.out.println("else");
					flag_ans[quesno1 - 1] = 1;	
				}
				System.out.println("");
				request.getSession().setAttribute("flag",flag_ans);
				for(int i = 0;i<ques_list.size();i++)
					System.out.println("ank" + flag_ans[i]);
				request.getSession().setAttribute("soln_list",soln_list);
				
				for(int i = 0;i< soln_list.size();i++)
				{
					
						AnswerBean soln1 = (AnswerBean)soln_list.get(i); 
						int tempQuesno = soln1.getQuesno();
							
						if(tempQuesno == (quesno1 + 1))
						{
							answer = soln1.getAnswer();
							answer = addXML.unescapeForXML1(answer);
						}
				}
				
				
				
				test_Paper = (Test_paper)ques_list.get(quesno1);

				ques = test_Paper.getQues();
				marks = test_Paper.getQuesmarks();
				ques = addXML.unescapeForXML1(ques);
				
				for(int i = 0;i<soln_list.size();i++)
				{
					AnswerBean tempBean = (AnswerBean)soln_list.get(i);
					System.out.println(tempBean.getQuesno() + " " + tempBean.getAnswer());
				}
			}
			
			%>
			
			<form method = "post" action = "done_soln.jsp">
			<table>
			<tr>
				<td>
					<b> Ques No:</b></td><td><b> <%=(Integer.parseInt(quesno)+1) %> </b>
				</td>
			</tr>
			<tr>
				<td>
					<b> Marks</b></td><td><b> <%=marks %> </b>
				</td>
			</tr>
			<tr>
				<td>
					<b> Question: </b> </td><td><b> <%= ques %></b>
				</td>
			</tr>
			<tr>
				<td>
					<b> Answer: </b> </td><td>
					<textarea rows="5" cols="30" name="answer" id = "answer1"><%=answer %></textarea>
				</td>
			</tr>
			
			<input type = "hidden" name = "quesno" id = "quesno" value = "<%=(quesno1 + 1)%>" >
			<input type = "hidden" name = "ques" id = "ques" value = "<%= ques %>" >
			
			
			<tr><td>
			<input type="submit" name="mode" value="Done" id = "mode">	
			</form>
			<form>
			
			</td><td><%if(quesno1 < (ques_list.size()-1))
			{
				 %><input type="submit" name="mode" id = "mode" value="Next" onclick = "javascript:jah1('takingTest2.jsp','inner_response','Next');" >
			</td></tr>
			<%} %>
				</table>
				</form>
			
			
	
		</div>	
		</div>
		
		
			<div id = "right">
			<div class="boxtop"></div>
			
			<div class="box">
			<p><b><u>Questions</u></b><br />
			<%
			int flag_ans[] = (int[])request.getSession().getAttribute("flag"); 
			String color = "";
			for(int i = 1;i <= ques_list.size();i++)
			{
				
				System.out.println(flag_ans[i - 1] + " ");
				String url = "takingTest3.jsp?quesno=" + i; 
				if(flag_ans[i - 1] == 1)
				{
					color = "red";
				}
				else
					color = "green";
			%>
				
			<a href = "javascript:jah2('<%=url %>','inner_response')"><font color = "<%=color%>"><%=i %></font></a>
			&nbsp&nbsp&nbsp&nbsp&nbsp
			<%} %>
			</div>
		
		</div>
	<%
	} 
	%>	