<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>

<%@page
	import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%>

<%@page import="com.ignou.vcs.commons.DatabaseBackupManager"%><html:html>
	<head>
		<title>backed_up</title>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="GENERATOR" content="Rational Application Developer">
	</head>
	<body>
		<center>
			<p>
			<%
				Boolean isBackupSuccess = DatabaseBackupManager.takeBackUp();
					if (isBackupSuccess) {
			%> <font color="#7ab149"><b>Database backup successful.</b></font><br>
						Please check the below path:<br>
			<%
				out.println(DatabaseBackupManager.backupName + "");
					} else {
			%> <font color="#ff0000"><b>Unable to backup.</b></font><br>
			<%
				}
			%>
			</p>
		</center>
	</body>
</html:html>
