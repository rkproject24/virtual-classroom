<%
	String subjectid = request.getParameter("q");
	request.getSession().setAttribute("subjectid",subjectid);
	VCSDatabaseActivities dbObj = new VCSDatabaseActivities();
	String subjectname = dbObj.getSubjectName(subjectid);
	java.util.ArrayList list = new java.util.ArrayList();
	request.getSession().setAttribute("list",list);
%>

<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%><form  method = "post">
<table border="0">
	<tbody>
		<tr>
			<td width = "150"><p><b><u> Subject : </u></b></td>
			<td><b><%=subjectname%></b></td>
		</tr>
		<tr>
			<td width = "150"><b><u> Unit No:</u></b></td>
			<td><input type="text" name="unitno" id = "unitno" size="33"></td>
		</tr>
		<tr>
			<td width = "150"><b><u>Unit Name :</u></b></td>
			<td><input type="text" name="unitname" id = "unitname" size="33"></td>
		</tr>
		<tr>
			<td width = "150"><b><u>Topics: </u></b></td>
			<td><textarea rows="10" cols="33" id = "topics" name="topics"></textarea></td>
		</tr>
		<tr>
			<td width = "150"><input type="submit" name="Done" value="Done" id = "mode" onclick = "javascript:jah1('done_syllabus.jsp','inner')"></td>
			
			<td><input type="submit" name="Next Unit" id = "mode" value="Next Unit" onclick = "javascript:jah1('more_unit.jsp','inner')"></td>
			
		</tr>
	</tbody>
</table>
</form>