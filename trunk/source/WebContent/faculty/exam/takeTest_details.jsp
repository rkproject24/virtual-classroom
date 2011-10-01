<%@page import = "com.ignou.vcs.xml.addXML" %>
<%@page import = "java.util.*" %>
<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%>
<%@page import="com.ignou.vcs.commons.Utilities"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/lightbox.css" media="screen,projection" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/prototype.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/lightbox.js"></script>
<%
	
	
	String testtype = request.getParameter("testtype");
	String testid =  request.getParameter("testid");
	int itestid = Integer.parseInt(testid);
	String userid = (String)request.getSession().getAttribute("userId");
	VCSDatabaseActivities dbObj = new VCSDatabaseActivities();
	
	int flag_check1 = 1;
		
	String testname = "";
	if(testtype.equals("Major"))
	{
		String prereq = dbObj.getPrereq(itestid);
		System.out.println("PREREQUISU:" + prereq);
		Utilities ob = new Utilities();
		ArrayList prereqList = ob.getSeparateValue(prereq);
		
		
		
		for(int i = 0;i<prereqList.size();i++)
		{
			System.out.println("ankit :" + (String)prereqList.get(i));
			testname = dbObj.getTestName((String)prereqList.get(i)) + " " + testname;
			
			System.out.println("TEST NAME:" + testname);
		}		
		for(int i = 0;i<(prereqList.size());i++)
		{
			
			flag_check1 = dbObj.checkConstraint((String)prereqList.get(i),userid);
			if(flag_check1 == 0)
			{
				break;
			}
		}		 
		
	
	}
	String syllabus = request.getParameter("syllabus");
	String maxmarks = request.getParameter("maxmarks");
	String passmarks = request.getParameter("passmarks");
	String duration = request.getParameter("duration");
	request.getSession().setAttribute("testid",testid);
	System.out.println("DURATION" + duration + " " + passmarks);
	ArrayList soln_list = new ArrayList();
	request.getSession().setAttribute("soln_list",soln_list);
	
	syllabus = addXML.unescapeForXML1(syllabus);
	duration = addXML.unescapeForXML1(duration);
	int flag[] = new int[50];
	for(int i = 0;i<50;i++)
		flag[i] = 0;
		
	int flag_check = dbObj.check(itestid,userid);	
	System.out.println("flag_check" + flag_check + " flag_check1" + flag_check1);
	%>
	<div class="boxtop"></div>
		<div class="box">
		<p><b><u>Test Details</u></b><br />
		<script src="${pageContext.request.contextPath}/faculty/exam/ajax_student.js"></script>
			<b>Test Type : </b> <%=testtype %><br>
			<%if(testtype.equals("Minor"))
			{ %>
			
			<b>Syllabus : </b> <%=syllabus %><br>
			<%}
			 %>
			<%if(testtype.equals("Major"))
			{ %>
			
			<b>Pre requisites: </b> <%=testname %><br>
			<%}
			 %>
			
			<b>Max Marks : </b> <%=maxmarks %><br>
			<b>Pass Marks : </b> <%=passmarks %><br>
			<b>Duration : </b> <%=duration  + " Minutes"%><br><br>
			<% 
				request.getSession().setAttribute("flag",flag);
				request.getSession().setAttribute("quesno","0");
				request.getSession().setAttribute("duration",duration);	
			%>
			<form>
			<%
			if((flag_check == 0) && (flag_check1 == 1))
			{
			%>
			<a href = "instructions.jsp" class = "greenbtn"><span>Give</span></a>  
			</form>
			<%} %>

		</div>