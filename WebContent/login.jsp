<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<html>
<head>
<title>login</title>
</head>
<body>


<html:errors></html:errors>
<html:form action="/verifyLogin">

	<b><u><font style='font-family: "Times New Roman"; font-weight: bold'>Please enter your Login Details.</u></b>
	<br /><br />
	<TABLE>
		<TBODY>
			<TR>
				<TD style='font-family: "Times New Roman"; font-weight: bold'>Username</TD>
				<TD><html:text property="username"></html:text></TD>
			</TR>
			<TR>
				<TD style='font-family: "Times New Roman"; font-weight: bold'>Password</TD>
				<TD><html:password property="password"></html:password></TD>
			</TR>
			<TR>
				<TD colspan="2" align="center"><html:submit property="Submit" value="Submit"></html:submit>
				<a href="#" class="lbAction" rel="deactivate"><button>Cancel</button></a>
				</TD>
			</TR>
		</TBODY>
	</TABLE>

</html:form>


</body>
</html>
