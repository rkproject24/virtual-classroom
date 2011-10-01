<%@page import="java.util.ArrayList"%>
<%@page import="com.ignou.vcs.forms.Test_paper"%>
<%@page import="com.ignou.vcs.xml.addXML"%>
<%@page import="com.ignou.vcs.beans.AnswerBean"%>
<div class="left">
			<div class="left_articles">
				
<%
	int flag_ans[] = (int[])request.getSession().getAttribute("flag");
				
				String quesno2 = request.getParameter("quesno1");
				String ques = request.getParameter("ques") ;
				String ans  = request.getParameter("ans");
				int quesno1 = Integer.parseInt(quesno2);
				
				AnswerBean soln = new AnswerBean();
				ans = addXML.unescapeForXML(ans);
				soln.setAnswer(ans);
				soln.setQuesno(quesno1);
				
				ArrayList ques_list = (ArrayList)request.getSession().getAttribute("ques_list");
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
				
	
	String quesno = request.getParameter("quesno");
	int iquesno = Integer.parseInt(quesno);
	ques_list = (ArrayList)request.getSession().getAttribute("ques_list");
	soln_list = (ArrayList)request.getSession().getAttribute("soln_list");
	int flag[] = (int[])request.getSession().getAttribute("flag");
	String answer = "";
	Test_paper test_paper = (Test_paper)ques_list.get(iquesno - 1);
	ques = test_paper.getQues();
	String marks = test_paper.getQuesmarks();
	ques = addXML.unescapeForXML1(ques);
	System.out.println("FLAG " + flag[iquesno - 1]);
	for(int i = 0;i< soln_list.size();i++)
	{
		
			soln = (AnswerBean)soln_list.get(i); 
			int tempQuesno = soln.getQuesno();
			if(tempQuesno == iquesno)
			{
				answer = soln.getAnswer();
				answer = addXML.unescapeForXML1(answer);
			}
	}
%>

<form method = "post" action = "done_soln.jsp">
			<table>
			<tr>
				<td>
					<b> Ques No:</b></td><td><b> <%=iquesno %> </b>
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
					<textarea rows="5" cols="30" name="answer" id = "answer1"><%=answer%></textarea>
				</td>
			</tr>
			
			<input type = "hidden" name = "quesno" id = "quesno" value = "<%=(quesno)%>" >
			<input type = "hidden" name = "ques" id = "ques" value = "<%= ques %>" >
			
			
			<tr><td>
			<input type="submit" name="mode" value="Done" id = "mode">	
			</form>
			<form>
			
			</td><td><%if(iquesno < ques_list.size())
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
			flag_ans = (int[])request.getSession().getAttribute("flag"); 
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
			
	