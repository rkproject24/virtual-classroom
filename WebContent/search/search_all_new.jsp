<%-- tpl:insert page="/theme/VCSTemplate.jtpl" --%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ignou.vcs.commons.beans.UserBean"%>
<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%>
<html:html>
<head>
<script type="text/javascript" language="javascript" >
function loadCss() {
	var browser = navigator.appName.toLowerCase();
	// document.write(browser);
	var stylesheet = document.getElementById("pagestyle");
	var menusheet = document.getElementById("menustyle");
	if(browser.indexOf("microsoft internet explorer") != -1) {
		stylesheet.href="${pageContext.request.contextPath}/theme/css/style_ie.css";
		menusheet.href="${pageContext.request.contextPath}/theme/css/menu_ie.css";
	}
	else {
		stylesheet.href="${pageContext.request.contextPath}/theme/css/style1.css";
		menusheet.href="${pageContext.request.contextPath}/theme/css/menu.css";		
	}
}
</script> 
<link id="pagestyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/style1.css" />
<link id="menustyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/menu.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/transmenu_Packed.js"></script>

<!-- LightBox css and scripts -->
<%
	String usid = (String) request.getSession().getAttribute("userId");
	if(usid != null) {
 %>
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/lightbox_vid.css" media="screen,projection" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/prototype.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/lightbox.js"></script>
 	
 
 <%
 }
 
  %>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
<%-- tpl:put name="headarea" --%>
<title>Virtual Classroom System</title>
	<script src="${pageContext.request.contextPath}/theme/js/slider/jquery-1.2.1.pack.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/theme/js/slider/jquery-easing.1.2.pack.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/theme/js/slider/jquery-easing-compatibility.1.2.pack.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/theme/js/slider/coda-slider.1.1.1.pack.js" type="text/javascript"></script>
	
		<style type="text/css">
		
		* { margin: 0; padding: 0 }
		/* I've used a hard CSS reset above, but you should consider a more sophisticated reset, such as this one: http://meyerweb.com/eric/thoughts/2007/05/01/reset-reloaded/ */
		
		
		
		p.intro { border-bottom: 1px solid #ccc; margin-bottom: 20px; padding: 20px 0 30px 0; text-align: center; width: 100% }
		
		p#cross-links { text-align: center }
		
		p#cross-links { border-bottom: 1px solid #ccc; margin-bottom: 30px; padding-bottom: 30px }
		
		noscript p, noscript ol { color: #a00; font-size: 13px; line-height: 1.4em; text-align: left }
		noscript a { color: #a00; text-decoration: underline }
		noscript ol { margin-left: 25px; }
		
		
		
		img { border: 0 }
		
		h3 { border-bottom: 1px solid silver; margin-bottom: 5px; padding-bottom: 3px; text-align: left }
		
		
		
		.stripViewer .panelContainer .panel ul {
			text-align: left;
			margin: 0 15px 0 30px;
		}
		
		.slider-wrap { /* This div isn't entirely necessary but good for getting the side arrows vertically centered */
			margin: 0px 0;
			position: relative;
			width: 100%;
		}

		/* These 2 lines specify style applied while slider is loading */
		.csw {width: 100%; height: 460px; background: #fff; overflow: scroll}
		.csw .loading {margin: 200px 0 300px 0; text-align: center}

		.stripViewer { /* This is the viewing window */
			position: relative;
			overflow: hidden; 
			border: 0px solid #000; /* this is the border. should have the same value for the links */
			margin: auto;
			width: 650px; /* Also specified in  .stripViewer .panelContainer .panel  below */
			
			clear: both;
			background: #fff;
		}
		
		.stripViewer .panelContainer { /* This is the big long container used to house your end-to-end divs. Width is calculated and specified by the JS  */
			position: relative;
			left: 0; top: 0;
			width: 100%;
			list-style-type: none;
			/* -moz-user-select: none; // This breaks CSS validation but stops accidental (and intentional - beware) panel highlighting in Firefox. Some people might find this useful, crazy fools. */
		}
		
		.stripViewer .panelContainer .panel { /* Each panel is arranged end-to-end */
			float:left;
			height: 100%;
			position: relative;
			width: 620px; /* Also specified in  .stripViewer  above */
		}
		
		.stripViewer .panelContainer .panel .wrapper { /* Wrapper to give some padding in the panels, without messing with existing panel width */
			padding: 30px;
		}
		
		.stripNav { /* This is the div to hold your nav (the UL generated at run time) */
			margin: auto;
		}
		
		.stripNav ul { /* The auto-generated set of links */
			list-style: none;
		}
		
		.stripNav ul li {
			float: left;
			margin-right: 2px; /* If you change this, be sure to adjust the initial value of navWidth in coda-slider.1.1.1.js */
		}
		
		.stripNav a { /* The nav links */
			font-size: 12px;
			font-weight: bold;
			text-align: center;
			line-height: 32px;
			background: #c6e3ff;
			color: #fff;
			text-decoration: none;
			display: block;
			padding: 0 15px;
		}
		
		.stripNav li.tab1 a { background: #C0C0C0 }
		.stripNav li.tab2 a { background: #C0C0C0}
		.stripNav li.tab3 a { background: #C0C0C0}
		.stripNav li.tab4 a { background: #C0C0C0 }
		.stripNav li.tab5 a { background: #C0C0C0}
		.stripNav li.tab6 a { background: #C0C0C0}
		
		.stripNav li a:hover {
			background: #333;
		}
		
		.stripNav li a.current {
			background: #808080;
			color: #fff;
		}
		.stripNavL, .stripNavR { /* The left and right arrows */
			position: absolute;
			top: 230px;
			text-indent: -9000em;
		}
		
		.stripNavL a, .stripNavR a {
			display: block;
			height: 40px;
			width: 40px;
		}
		
		.stripNavL {
			left: 0;
		}
		
		.stripNavR {
			right: 0;
		}
		
		.stripNavL {
			background: url("images/arrow-left.gif") no-repeat center;
		}
		
		.stripNavR {
			background: url("images/arrow-right.gif") no-repeat center;
		}
		
	</style>
	
		<script type="text/javascript">
		jQuery(window).bind("load", function() {
			jQuery("div#slider1").codaSlider()
			// jQuery("div#slider2").codaSlider()
			// etc, etc. Beware of cross-linking difficulties if using multiple sliders on one page.
		});
	</script>
	
<%-- /tpl:put --%>
</head>
<body onLoad="javascript:loadCss()">
<%@include file="../header.jsp" %>								
		
		<div class="left">
			<div class="left_articles">
				<div class="buttons">
				</div>
				<%@include file="../DisplayCalendar.jsp"%>
				<h2><a href="#"><u>Search Results</u></a></h2>
				<p class="description">Please Click on different tabs to view respective results.</p>
				<%-- /tpl:put --%>
				<%-- tpl:put name="centre_content" --%>
				<script src="${pageContext.request.contextPath}/search/ajax.js"></script>
				<noscript>
					<p>Unfortunately your browser does not hava JavaScript capabilities which are required to exploit full functionality of our site. This could be the result of two possible scenarios:</p>
					<ol>
						<li>You are using an old web browser, in which case you should upgrade it to a newer version. We recommend the latest version of <a href="http://www.getfirefox.com">Firefox</a>.</li>
						<li>You have disabled JavaScript in you browser, in which case you will have to enable it to properly use our site. <a href="http://www.google.com/support/bin/answer.py?answer=23852">Information on enabling JavaScript</a>.</li>
					</ol>
				</noscript>
				
				<div class="slider-wrap">
					<div id="slider1" class="csw">
						<div class="panelContainer">
							
							<div class="panel" title="Lecture">
								<div class="wrapper">
									<h3>Lectures</h3>
									<%@ include file = "search_lecture.jsp" %>
									
								</div>
							</div>
							<div class="panel" title="Notice">
								<div class="wrapper">
									<h3>Notices</h3>
									<%@ include file = "search_notice.jsp"%>
									
								</div>
							</div>		
							<div class="panel" title="Exams">
								<div class="wrapper">
									<h3>Examinations</h3>
									<%@ include file = "search_test.jsp" %>
									
								</div>
							</div>
							<div class="panel" title="Faculty">
								<div class="wrapper">
									<h3>Faculty</h3>
									<%@ include file = "search_faculty.jsp" %>
									
								</div>
							</div>
							<div class="panel" title="Student">
								<div class="wrapper">
									
									<h3>Students</h3>
									<div id = "id1">
									<%@ include file = "search_student.jsp" %>
									</div>
								</div>
							</div>
							<div class="panel" title="Assignments">
								<div class="wrapper">
									<h3>Assignments</h3>
									<div id = "id3">
									<%@ include file = "search_assignment.jsp" %>
									</div>
								</div>
							</div>
						
						</div><!-- .panelContainer -->
					</div><!-- #slider1 -->
				</div><!-- .slider-wrap -->

				<%-- /tpl:put --%>
			</div>
			
			
			<%-- tpl:put name="bottom_box" --%>
			
			
			<%-- /tpl:put --%>
		</div>	
		
		
		<div id="right">
			<%-- tpl:put name="right_boxes" --%>
			<div class="boxtop"></div>
			<div class="box">
				<!-- 
				 <p>
					<%@ include file = "top_box.jsp" %>
				</p>-->
			</div>
			
			<div id = "id2">
			
			</div>
			
			<%-- /tpl:put --%>
		</div>	
		<%@include file="../footer.jsp" %>
	</div>
</body>
</html:html>
<%-- /tpl:insert --%>