<%@page import="java.util.ArrayList"%>
<%@page import="com.ignou.vcs.forums.beans.PollBean"%>
<%@page import="com.ignou.vcs.forums.ForumDatabaseOperations"%>
<script type="text/javascript">
<!--
function onchangeOf()
{
	document.fm.submit.disabled = false;
}
//-->
</script>
<div class="box">
<p><center><b><u>Polls</u></b></center><br />
<form action="SubmitPoll.jsp" method="post" name="fm">
<table>
	<%
		PollBean poll = ForumDatabaseOperations.getPollQuestion();
		if (poll != null) {
	%>
	<tr>
		<td><b><%=poll.getPollQuestion()%></b></td>
	</tr>
	<%
		ArrayList<String> options = poll.getPollOptions();

			for (int i = 0; i < options.size(); i++) {
	%>
	<tr>
		<td><input type="radio" name="selectedOption"
			value="<%=options.get(i)%>" onchange="onchangeOf()"><%=options.get(i)%></td>
	</tr>
	<%
		}
	%>
	<tr>
		<td><br>
		<br>
		<input type="hidden" name="pollId" value="<%=poll.getPollId()%>">
		<input type="hidden" name="userId" value="admin"> <input
			type="submit" name="submit" value="Submit Poll" disabled="disabled"></td>
	</tr>

	<%
		} else {
			out.println("<font color='red'><b>No polls found.</b></font>");
		}
	%>

</table>
</form>
</div>