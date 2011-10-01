<%@page import="com.ignou.vcs.report.beans.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ignou.vcs.report.database.ReportDatabaseActivities"%>
<%@page import="com.ignou.vcs.chartGenerators.JFreeBarChartGenerator"%>
<%@page import="java.io.OutputStream"%>
<%
	String courseid = request.getParameter("courseid");
	int icourseid = Integer.parseInt(courseid);
	ReportDatabaseActivities dbObj = new ReportDatabaseActivities();
	
	ArrayList list = (ArrayList)dbObj.getTests(icourseid);
	ArrayList studentList = new ArrayList();
	ArrayList finalList = new ArrayList();
	
	for(int i = 0;i<list.size();i++)
	{
		TestReport bean = (TestReport)list.get(i);
		String testid = (String)bean.getTestid();
		int itestid = Integer.parseInt(testid);
		
	  	String maxmarks = (String)bean.getTotalmarks();
		studentList = (ArrayList)dbObj.getStudentList(itestid);  	
	 	double doubleMaxMarks = (Double.valueOf(maxmarks)).doubleValue();
	 	
	 	for(int j = 0;j < studentList.size();j++)
	 	{
	 		StudentBean studentBean = (StudentBean)studentList.get(j);
	 		String totalMarks = studentBean.getTotalMarks();
	 		String studentid = studentBean.getStudentid();
	 		String name = studentBean.getName();
	 		double doubleTotalMarks = (Double.valueOf(totalMarks)).doubleValue();
	 		double perc = (doubleTotalMarks/doubleMaxMarks) * 100;
	 		if(finalList.size() == 0)
	 		{
	 			
	 			studentBean.setMaxmarks((Double.valueOf(maxmarks)).doubleValue());
	 			studentBean.setPerc(perc);
	 			finalList.add(studentBean);
	 			
	 		}
	 		else
	 		{
		 		int k = 0;
		 		for(k = 0;k < finalList.size();k++)
		 		{
		 			StudentBean tempBean = (StudentBean)finalList.get(k);
		 			String tempstudentid = tempBean.getStudentid();
		 			String tempstudentname = tempBean.getName();
		 			double tempPerc = tempBean.getPerc();
		 			double tempMaxMarks = tempBean.getMaxmarks();
		 			double marksScored = (tempPerc * tempMaxMarks)/100;
		 			
		 			if(tempstudentid.equals(studentid))
		 			{
	 					
	 					double newMaxMarks = doubleMaxMarks + tempMaxMarks;
	 					double newTotalMarks = marksScored + doubleTotalMarks;
	 					
	 					double newPerc = (newTotalMarks/newMaxMarks)*100;
	 					StudentBean bean1 = new StudentBean();
	 					bean1.setName(tempstudentname);
	 					bean1.setStudentid(tempstudentid);
	 					bean1.setPerc(newPerc);
	 					bean1.setMaxmarks(newMaxMarks);
	 					finalList.set(k,bean1);
	 					break;
					}
				}
				if(k == finalList.size())
				{
					studentBean.setPerc(perc);
	 				finalList.add(studentBean);	
	 			} 					
	 		}		
	 	}	
	 }
		ArrayList seriesMembers = new ArrayList();
		ArrayList categoryMembers = new ArrayList();
		ArrayList data = new ArrayList();
		seriesMembers.add("Percentage");
		
	 for(int i = 0;i < finalList.size();i++)
	 {
	 	StudentBean bean = (StudentBean)finalList.get(i);
	 	String name = bean.getName();
	 	double perc = bean.getPerc();
	 	String studentid = bean.getStudentid();
	 	System.out.println(name + " " + perc + " " + studentid);
	 	categoryMembers.add(name);
	 	String sperc = Double.toString(perc); 
	 	data.add(sperc);
	 }
	 	
	 	JFreeBarChartGenerator chartObject = new JFreeBarChartGenerator();
		
		chartObject.setChartData(seriesMembers,categoryMembers,data);
		
		OutputStream outStream = response.getOutputStream();
		response.setContentType("image/png");
		
		chartObject.createFinalChart("Class Performance" , "Students" , "Percentage Scored" , outStream);
%>