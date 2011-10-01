<%@ page import="com.ignou.vcs.registration.code.*,com.ignou.vcs.registration.beans.*,com.ignou.vcs.registration.database.*;" %>
<%
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String dayBirth = request.getParameter("dayBirth");
	String monthBirth= request.getParameter("monthBirth");
	String yearBirth = request.getParameter("yearBirth");
	String emailP = request.getParameter("email_id_primary");
	String emailS = request.getParameter("email_id_secondary");
	String contactP =request.getParameter("contact_no_primary");
	String contactS = request.getParameter("contact_no_secondary");
	String address = request.getParameter("address");
	String fatherName = request.getParameter("father_name");
	String occupation = request.getParameter("occupation");
	String image = request.getParameter("image");
	String imageCode = (String)session.getAttribute(nl.captcha.servlet.Constants.SIMPLE_CAPCHA_SESSION_KEY) ;
	try {
	
		if(imageCode.equals(image)) {
			Register r=new Register();
		//DatabaseAccess db = new DatabaseAccess();
		RegistrationBean regBean = r.setRegFormData(name,dayBirth,monthBirth,yearBirth,emailP,emailS,contactP,contactS,address,fatherName,occupation,password);
		request.getSession().setAttribute("regBean",regBean);
		} else {
			throw new Exception();
		}
	} catch(Exception e) {
		response.sendRedirect("invalidText.jsp");
	}
	
	//java.util.ArrayList course = db.getAllCourse();
	//request.getSession().setAttribute("course",course);
	//response.sendRedirect("");	
%>

<br/><br/>&nbsp;&nbsp;
<a font size="10" href="javascript:jah('course.jsp','id1')"><b>SELECT COURSE</b></a>