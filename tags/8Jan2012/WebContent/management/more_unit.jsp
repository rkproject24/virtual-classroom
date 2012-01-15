<%@page import="java.util.ArrayList"%>
<%@ page import = "com.ignou.vcs.xml.addXML" %>
<%
	String unitno = request.getParameter("unitno");
	String unitname = request.getParameter("unitname");
	String topics = request.getParameter("topics");
	
	String subjectid = (String)request.getSession().getAttribute("subjectid");
	
	VCSDatabaseActivities dbObj = new VCSDatabaseActivities();
	String subjectname = dbObj.getSubjectName(subjectid);
	
	int iunitno = Integer.parseInt(unitno);
	addXML obj = new addXML();
	
	unitname = addXML.unescapeForXML(unitname);
	topics = addXML.unescapeForXML(topics);
	
	Syllabus syllabusbean = new Syllabus();
	syllabusbean.setUnitno(iunitno);
	syllabusbean.setUnitname(unitname);
	syllabusbean.setTopics(topics);
	
	ArrayList list = (ArrayList)request.getSession().getAttribute("list");
	list.add(syllabusbean);
	
%>



<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%>
<%@page import="com.ignou.vcs.beans.Syllabus"%><form  method = "post">
<table border="0">
	<tbody>
		<tr>
			<td><p><b><u> Subject : </u></b></td>
			<td><b><%=subjectname%></b></td>
		</tr>
		<tr>
			<td><b><u> Unit No:</u></b></td>
			<td><input type="text" name="unitno" id = "unitno" size="33"></td>
		</tr>
		<tr>
			<td><b><u>Unit Name :</u></b></td>
			<td><input type="text" name="unitname" id = "unitname" size="33"></td>
		</tr>
		<tr>
			<td><b><u>Topics: </u></b></td>
			<td><textarea rows="5" cols="25" id = "topics" name="topics"></textarea></td>
		</tr>
		<tr>
			<td><input type="submit" name="Done" value="Done" id = "mode" onclick = "javascript:jah1('done_syllabus.jsp','inner')"></td>
			
			<td><input type="submit" name="Next Unit" id = "mode" value="Next Unit" onclick = "javascript:jah1('more_unit.jsp','inner')"></td>
			
		</tr>
	</tbody>
</table>
</form>