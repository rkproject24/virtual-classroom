
<%@page import="com.ignou.vcs.commons.EMailUtilities"%>
<%@page import="com.ignou.vcs.commons.beans.MailBean"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.util.ArrayList"%><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
String fromAddr = request.getParameter("fromAddr");
String toAddr = request.getParameter("toAddr");
String ccAddr = request.getParameter("ccAddr");
String bccAddr = request.getParameter("bccAddr");
String sub = request.getParameter("subject");
String msg = request.getParameter("msgContent");

ArrayList<String> toAddresses = new ArrayList<String>();
ArrayList<String> ccAddresses = new ArrayList<String>();
ArrayList<String> bccAddresses = new ArrayList<String>();

StringTokenizer toTokens = new StringTokenizer(toAddr,";");
StringTokenizer ccTokens = new StringTokenizer(ccAddr,";");
StringTokenizer bccTokens = new StringTokenizer(bccAddr,";");

while(toTokens.hasMoreTokens())
{
	String st = toTokens.nextToken();
	toAddresses.add(st);
}

while(ccTokens.hasMoreTokens())
{
	String st = ccTokens.nextToken();
	ccAddresses.add(st);
}

while(bccTokens.hasMoreTokens())
{
	String st = bccTokens.nextToken();
	bccAddresses.add(st);
}


MailBean mb = new MailBean();
mb.setMailFrom(fromAddr);
mb.setToRecipients(toAddresses);
mb.setCCRecipients(ccAddresses);
mb.setBCCRecipients(bccAddresses);
mb.setMailSubject(sub);
mb.setMsgContent(msg);

EMailUtilities.sendMail(mb);

response.sendRedirect("./home.jsp");
%>