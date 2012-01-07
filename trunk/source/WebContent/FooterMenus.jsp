
<%@page import="java.util.ArrayList"%>
<%@page import="com.ignou.vcs.commons.beans.NewsBean"%>

<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%><div class="boxtop"></div>
<div class="box">
	<p><center><b><u>News</u></b></center><br />
		<%
			/*ArrayList<NewsBean> news = new ArrayList<NewsBean>();
			CommonsDatabaseActivities cda = new CommonsDatabaseActivities();
			news = cda.getNews(true);
		
			if(news.size()>0)
			{
				for(int i=0;i<news.size();i++)
				{
					NewsBean nb = news.get(i);
					String link = "news/"+nb.getExternalLinks();
					
					if(link != null || link != "")
					{
					%>
						<a href="" accesskey="m">New Java Courses launched. </a><br />
					<%
					}
					else
					{
					%>
					
					<%
					}
				}
			}*/
		%>
		<p>
		1. <a href="news/AdobeSummit.jsp" accesskey="m">New Java Courses launched. </a><br />
		2. <a href="news/AdobeSummit.jsp" accesskey="m">Exclusive video	training offered for all adobe courses.</a><br />
		3. <a href="news/SunTechDays.jsp" accesskey="m">Sun Tech days here back again for 2011.</a><br />
		4. <a href="news/AdobeSummit.jsp" accesskey="m">Watch out this space for more up coming courses.</a><br />
		5. <a href="news/AdobeSummit.jsp" accesskey="m">Ansca Mobile offers special subscription pricing for current students and educators. </a><br />
		6. <a href="news/AdobeSummit.jsp" accesskey="m">Adobe is back again with Dev Summit on mobile platform.</a><br />
		</p>
	<div class="buttons">
		<p><a href="News.jsp" class="bluebtn"><span>More</span></a></p>
	</div>
</div>