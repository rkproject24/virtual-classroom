<%@page import="java.util.ArrayList"%>
<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%>
<%@page import="com.ignou.vcs.commons.beans.SubjectBean"%>
<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="org.w3c.dom.Document"%>


<%@page import="org.w3c.dom.Node"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import="org.w3c.dom.Element"%>
<html>
<head></head>
<%!
	private static String getTagValue(String sTag, Element eElement) {
		NodeList nlList = eElement.getElementsByTagName(sTag).item(0).getChildNodes();
	 
	        Node nValue = (Node) nlList.item(0);
	 
		return nValue.getNodeValue();
    }
%>
<body>
<%
	//String subjectId=request.getParameter("sid");
	
	String courseId=request.getParameter("cid");
	String subjectId=request.getParameter("sid");

	CommonsDatabaseActivities dbObj= new CommonsDatabaseActivities();
	ArrayList subjects= dbObj.getSubjects(courseId,true);
	String file = "";
	String subjectName = "";
	
	for(int i=0;i<subjects.size();i++)
  	{
		SubjectBean sb = (SubjectBean) subjects.get(i);
		if(sb.getSubjectId().equals(subjectId))
		{
			file = sb.getSyllabus();
			subjectName = sb.getSubjectName();
			break;
		}
  	}
	%>
	<center>
		<h2><%=subjectName %>'s Syllabus</h2>
	</center>
	<hr><br>
	<%
	if(!file.equals("na"))
	{
		DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
	  	DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
	  	Document doc = docBuilder.parse("http://localhost:8080/VCS/DATA/syllabus/"+file+".xml");
	  	NodeList chapters = doc.getElementsByTagName("chapter");
	  	NodeList contents = doc.getElementsByTagName("contents");
	  	
	  	for (int temp = 0; temp < chapters.getLength(); temp++) 
	  	{
	  		 
			   Node nNode = chapters.item(temp);
			   if (nNode.getNodeType() == Node.ELEMENT_NODE) 
			   {
			      Element eElement = (Element) nNode;
			      out.println("<b>Chapter</b>:  " + getTagValue("chapterId", eElement)+"<br>");
			      out.println("<b>Title</b>:  " + getTagValue("title", eElement)+"<br>");
			      out.println("<b>Contents</b>: <br>");
			      for (int temp1 = 1; temp1 <= chapters.getLength(); temp1++) 
			  	  {
				      Node cNode = contents.item(temp);
				      Element cElement = (Element) cNode;
				      out.println( "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "+temp1 + " &nbsp;&nbsp; "+getTagValue("content", cElement)+"<br>");
			  	  }
		          out.println("<br><br>");
	 
			   }
	  	}
	}else
	{
		out.println("<center><font color='red'>We are Sorry. we are unable to fine syllabus for <b>"+subjectName+"</b> subject.</font></center>");
	}
	
 %>
</body>
</html>			
