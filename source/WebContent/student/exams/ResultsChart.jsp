
<%@page import="com.ignou.vcs.exams.database.ExamsDatabaseActivities"%>
<%@page import="com.ignou.vcs.exams.beans.StudentExamBean"%>
<%@page import="com.ignou.vcs.exams.beans.ExamBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.jfree.chart.axis.CategoryLabelPositions"%>
<%@page import="org.jfree.chart.axis.CategoryAxis"%>
<%@page import="org.jfree.chart.plot.CategoryPlot"%>
<%@page import="org.jfree.chart.plot.PlotOrientation"%>
<%@page import="org.jfree.data.category.DefaultCategoryDataset"%>
<%@page import="org.jfree.chart.ChartFactory"%><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*" %>
	<%@ page import="org.jfree.chart.JFreeChart" %>
	<%@ page import="org.jfree.chart.ChartUtilities" %>
	 
	<%
	 try
	 {
		 String exam = request.getParameter("e");
		 int examId = Integer.parseInt(exam);
		 String totalMarks = request.getParameter("t");
		 String passMarks = request.getParameter("p");
		 String marksSecured = request.getParameter("m");
		DefaultCategoryDataset dataset;
		ArrayList<String> seriesMembers = new ArrayList<String>();
		ArrayList<String> categoryMembers = new ArrayList<String>();
		ArrayList<String> data = new ArrayList<String>();
		
		ExamsDatabaseActivities eda = new ExamsDatabaseActivities();
		ExamBean eb = eda.getExamDetails(examId);
		
		seriesMembers.add("Max. Marks");
		seriesMembers.add("Pass Marks");
		seriesMembers.add("Your Marks");
		
		categoryMembers.add(eb.getExamName());
		
		data.add(totalMarks);
		data.add(passMarks);
		data.add(marksSecured);
		
		 int count =0;
		 dataset = new DefaultCategoryDataset ();
		 for (int i = 0; i < seriesMembers.size(); i++) 
		 {
			for (int j = 0; j < categoryMembers.size(); j++) 
			{
				dataset.addValue(Double.valueOf((String)data.get(count)).doubleValue(), (String)seriesMembers.get(i),(String)categoryMembers.get(j));
				count ++;
			}
			
		}
		 
		 
		 JFreeChart chart = ChartFactory.createBarChart3D(
		            eb.getExamName()+"'s Result",         // chart title
		            "",               // domain axis label
		            "Marks Scored",                  // range axis label
		            dataset,                  // data
		            PlotOrientation.HORIZONTAL, // orientation
		            true,                     // include legend
		            true,                     // tooltips?
		            true                     // URLs?
		        );
			CategoryPlot plot = chart.getCategoryPlot();
			
			CategoryAxis domainAxis = plot.getDomainAxis();
	        domainAxis.setCategoryLabelPositions(
	            CategoryLabelPositions.createUpRotationLabelPositions(Math.PI / 6.0)
	        );
	 File image = File.createTempFile("image", "tmp");
	 
	 // Assume that we have the chart
	 ChartUtilities.saveChartAsPNG(image, chart, 500, 300);
	 
	 FileInputStream fileInStream = new FileInputStream(image);
	 OutputStream outStream = response.getOutputStream();   
	 
	 long fileLength;
	 byte[] byteStream;
	 
	 fileLength = image.length();
	 byteStream = new byte[(int)fileLength];
	 fileInStream.read(byteStream, 0, (int)fileLength);
	 
	 response.setContentType("image/png");
	 response.setContentLength((int)fileLength);
	 response.setHeader("Cache-Control",
	     "no-store,no-cache, must-revalidate, post-check=0, pre-check=0");
	 response.setHeader("Pragma", "no-cache");
	 
	 fileInStream.close();
	 outStream.write(byteStream);
	 outStream.flush();
	 outStream.close();
	 
	 }
	 catch (IOException e)
	 {
	 System.err.println("Problem occurred creating chart.");
	 }
	 
	%>