<%
	String name = request.getParameter("name");
	String dob = request.getParameter("dob");
	String emailp = request.getParameter("emailp");
	String contactp = request.getParameter("contactp");
	String address = request.getParameter("address");
	String level = request.getParameter("level");

%>
	
<form action = "update_profile.jsp" method = "post">
<input type = "hidden" name = "level" value = "<%=level%>">
<table border="0">
	<tbody>
				
		<tr>
			<td><b>Primary Email</b>:</td>
			<td><input type="text" name="emailp" size="20" value = "<%=emailp%>"></td>
		</tr>
		<tr>
			<td><b>Contact No:</b></td>
			<td><input type="text" name="contactp" size="20" value = "<%=contactp %>"></td>
		</tr>
		<tr>
			<td><b>Address</b></td>
			<td><textarea rows="5" cols="35" name="address"><%=address %></textarea></td>
		</tr>
		<tr>
			<td><input type="submit" name="Update" value="Update"></td>
			<td></td>
		</tr>
	</tbody>
</table>

</form>	