<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<% 
			Date date = new Date();
			DateFormat formatterYear = new SimpleDateFormat("yyyy");
			DateFormat formatterMonth = new SimpleDateFormat("MMM");
			DateFormat formatterDay = new SimpleDateFormat("dd");
			
			String year = formatterYear.format(date);
			String month = formatterMonth.format(date);
			String day = formatterDay.format(date);
			month = month.toUpperCase();
			
			if(day.equals("1") || day.equals("21") || day.equals("31")) {
				day = day + "st";
			} else if(day.equals("2") || day.equals("22")) {
				day = day + "nd";						
			} else if(day.equals("3") || day.equals("23")) {
				day = day + "rd";						
			} else {
				day = day + "th";						
			} 
			
	%>
				
	<div class="calendar">
		<p><%=month %><br /><%=day %></p>
	</div>
	<br>
	<br>