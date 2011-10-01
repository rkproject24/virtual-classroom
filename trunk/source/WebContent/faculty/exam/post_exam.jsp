<%@page import="java.awt.Window"%>
<%@page import="com.ignou.vcs.forms.Test_paper"%>
<%@page import="com.ignou.vcs.xml.addXML"%>
<%@page
	import="java.util.*,javax.servlet.*,javax.naming.*,javax.servlet.http.*,java.sql.*"%>
<%
	String xmlDoc;
	String flag;
	String quesno = request.getParameter("quesno");
	String ques = request.getParameter("ques");
	String mode = request.getParameter("mode");
	int quesno1 = Integer.parseInt(quesno);
	String marks = request.getParameter("marks");
	String marksCount = (String)request.getSession().getAttribute("marksCount");
	int imarksCount = Integer.parseInt(marksCount);
	int imarks = Integer.parseInt(marks);
	imarksCount = imarksCount + imarks;
	request.getSession().setAttribute("marksCount",Integer.toString(imarksCount));
	System.out.println("IMARKSCOUNT  " + imarksCount); 
	String testid = (String) request.getSession()
			.getAttribute("testid");
	String filename = "C:\\" + "file_" + testid + ".xml";
	request.getSession().setAttribute("filename", filename);


	Test_paper test_paper = new Test_paper();
	//start
	
	String ques1 = addXML.unescapeForXML(ques);
	//end
	test_paper.setQuesno(quesno1);
	test_paper.setQues(ques1);
	test_paper.setQuesmarks(marks);
	request.getSession().setAttribute("quesno", quesno);

	ArrayList list = (ArrayList) request.getSession().getAttribute(
			"list");

	list.add(test_paper);

	request.getSession().setAttribute("list", list);
	String maxmarks = (String)request.getSession().getAttribute("maxmarks");
	System.out.println("Max Marks :"+ maxmarks);
%>

<div class="left">
<div class="left_articles">
<div class="buttons"></div>
<div class="calendar">
<p>NOV<br>
13th</p>
</div>
<h2><a href="#"><u>Test Paper</u></a></h2>
<p class="description">Set the Question Paper</p>
<p>
<div><a href= "paperPreview.jsp"  target = "_blank"><span><b>Preview</b></span></a><div align = "right"><b>Total marks till now: <%=imarksCount %></b></div></div>

<form method="post" action="done_test.jsp" name = "examForm">

<table border="0">
	<tbody>
		<tr>
			<td width="200px"><b>Question No:</b></td>
			<td><input type="text" name="quesno" size="20" id="quesno"
				value="<%=((quesno1)+1)%>"></td>
		</tr>
		<tr>
					<td width="200px"><b>Marks : </b></td>
					<td><input type="text" name="marks" size="20" id="marks"></td>
		</tr>
		<tr>
			<td width="200px"><b>Question :</b></td>
			<td><textarea rows="10" cols="40" name="ques" id="ques"></textarea></td>
		</tr>


	</tbody>
	</table><br>
	<center>
	<input type="submit" name="mode" value="Done" id="mode" onclick = "return checkMarks(<%=imarksCount%>,<%=maxmarks%>)">
	<input type="submit" name="mode" value="Next" id="mode"
			onclick="javascript:jah3('post_exam.jsp','insert_response')">
	</center>	

</form>
</div>
</div>





<div id="right">


<div class="boxtop"></div>
<div class="box">
<p><b><u>Questions</u></b><br>
<%
		for (int i = 1; i < 25; i++) {

		if (i <= list.size()) {
%> <a
	href="javascript:jah('post_exam2.jsp','inner_response','<%=i%>');">

<font color="red"><%=i%></font> </a> &nbsp&nbsp&nbsp&nbsp <%
 			} else {
 			if (i == (list.size() + 1)) {
 %> <a href="#"> <font color="blue"><%=i%></font> </a>
&nbsp&nbsp&nbsp&nbsp <%
} else {
%> <a href="#"> <font color="green"><%=i%></font> </a>
&nbsp&nbsp&nbsp&nbsp <%
		}
		}
		if (((i + 1) % 5) == 0) {
%> <br>
<%
	}
	}
%>
</p>


</div>
<div id="inner_response"></div>
</div>
