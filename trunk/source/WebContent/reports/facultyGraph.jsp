
<%@page import="com.ignou.vcs.forms.Test"%>
<%@page import="com.ignou.vcs.report.database.ReportDatabaseActivities"%><%@page import="com.ignou.vcs.report.beans.TestReport"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%>
<%@page import="com.ignou.vcs.chartGenerators.JFreePieChartGenerator"%>
<%@page import="com.ignou.vcs.commons.Utilities"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.IOException"%>
<%
	String facultyid = request.getParameter("facultyid");
	String courseid = request.getParameter("courseid");
	
	VCSDatabaseActivities dbObj = new VCSDatabaseActivities();
	ArrayList testList = (ArrayList)dbObj.getTestID(courseid,facultyid);
	ReportDatabaseActivities dbOb = new ReportDatabaseActivities();
	int pass = 0;
	int fail = 0;
	int total = 0;
	for(int i = 0;i < testList.size();i++)
	{
		Test testBean = (Test)testList.get(i);
		int passmarks = testBean.getPass_marks();
		String testid = testBean.getTestid();
		int itestid = Integer.parseInt(testid);
		ArrayList studentList = dbOb.getTotalMarks(itestid); 
		System.out.println(itestid + " " + passmarks); 
		for(int j = 0;j < studentList.size();j++)
		{
			TestReport bean = (TestReport)studentList.get(j);
			int tempmarks = Integer.parseInt(bean.getTotalmarks());
			System.out.println("Tempmarks " + tempmarks);
			if(tempmarks >= passmarks)
			{
				System.out.println("PASS");
				pass++;
			}	
			else
				fail++;
		}	
		
	}
	ArrayList chartMembers = new ArrayList();
	ArrayList percentages = new ArrayList();

	total = pass + fail;
	double doublepass = (double)pass;
	double doubletotal = (double)total;
	double passperc = (doublepass / doubletotal) * 100;
	double failperc = 100 - passperc;
	
		
	
	String passPerc = passperc + "";
	String failPerc = failperc + "";
	
	System.out.println(passPerc + " " + failPerc);
	percentages.add(passPerc);
	percentages.add(failPerc);
	
	chartMembers.add("Pass");
	chartMembers.add("Fail");
	OutputStream outStream = response.getOutputStream();
	JFreePieChartGenerator chartGenerator = new JFreePieChartGenerator();
	chartGenerator.setChartMembersAndPercentages(chartMembers,
			percentages);
	
	response.setContentType("image/png");
	chartGenerator.generateFinalChart(outStream , "sampleChart");
%>  
	