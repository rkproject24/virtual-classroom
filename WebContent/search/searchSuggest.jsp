
<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%><%@page import="java.util.ArrayList"%>
<%

	String searchString = request.getParameter("search");
	VCSDatabaseActivities dbObj = new VCSDatabaseActivities();
	
	ArrayList searchResults = (ArrayList)dbObj.getResults(searchString);
	
	for(int i = 0;i<searchResults.size();i++)
	{
		String option = (String)searchResults.get(i); 
		System.out.println(option);
	%>
		<%=option %>
	<%} %>		