<%
	//String subjectId=request.getParameter("sid");
	
	String courseId=request.getParameter("cid");
	String duration=request.getParameter("duration");
    String fees=request.getParameter("fees");
	String link="payment.jsp?cid="+courseId+"&duration="+duration+"&fees="+fees;
	request.getSession().setAttribute("cid",courseId);
	request.getSession().setAttribute("duration",duration);
	request.getSession().setAttribute("fees",fees);
	System.out.println("link:"+link);
 %>
<html>
<head></head>
<body>
<form action="javascript:jah('options.jsp','id1')">
<br/><b>Unit I</b><br/>
<b>Pure Arithmetic</b>
<p>Irrational Numbers,Significant Figures,Indices/ Exponents,Logarithms
</p>
<b>Unit II</b><br/>
<b>Commercial Mathematics</b>
<p>Percentage,Simple Interest
</p>
<b>Unit III</b><br/>
<b>Algebra</b>
<p>Expansions,Factorisation,Framing of Formulae,Linear Equations and Simultaneous (linear)
Equations,Indices/ Exponents,Logarithms</p>
<b>Unit IV</b><br/>
<b>Geometry</b>
<p>Angles formed at a point by two
intersecting lines and parallel lines and a
transversal,Triangles,Similarity,Constructions (using ruler and compass),Mid Point Theorem
<br/>
<br/>
<br/>

</form>
</body>
</html>			
