<%@ page import = "com.ignou.vcs.xml.addXML" %>
<%@page import = "java.lang.*" %>
<%	
	
	String quesno = request.getParameter("i");
	int quesno1 = Integer.parseInt(quesno);
	
	java.util.ArrayList list = (java.util.ArrayList)request.getSession().getAttribute("list");
	Test_paper test_paper = (Test_paper)list.get((quesno1 - 1));
	String ques = test_paper.getQues();
	String marks = test_paper.getQuesmarks();
	String oldmarks = marks;
	System.out.println("MARKS here" + marks);
	System.out.println("ques :" + ques);
	ques = addXML.unescapeForXML1(ques);
 %>

<%@page import="com.ignou.vcs.forms.Test_paper"%><script src="${pageContext.request.contextPath}/faculty/exam/js/exam_js.js"></script>
<div class = "boxtop"></div>
			<div class="box">
				
					<form method = "post">
					<b><u>Question No:<%=quesno %></u></b><br />
					<input type = "hidden" id = "quesno1" value = <%=quesno %>>
					<b><u>Marks:</u></b>
					<input type = "hidden" id = "oldmarks" value = "<%=oldmarks %>">
					<input type = "text" id = "marks1" value = "<%=marks%>"> 
					 <br> <b>Question : </b><textarea rows="3" cols="30" name="ques1" id = "ques1"><%=ques %></textarea> 
					<br>
					<input type = "submit" onclick = "javascript:update()" value = "Update">
					</form>
			
</div>