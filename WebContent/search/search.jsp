<%@page import = "java.util.*,com.ignou.vcs.database.*" %>
<%
		
		String querySearch = request.getParameter("search");
		VCSDatabaseActivities dbObject = new VCSDatabaseActivities();
		String userid = (String)request.getSession().getAttribute("userId");
		int ilevel = 0;
		if(userid != null)
			ilevel = dbObject.getLevel(userid);
		else
			ilevel = 5;
		ArrayList list = new ArrayList();
		String level = Integer.toString(ilevel);
		
		ArrayList lectureList = new ArrayList();
		ArrayList noticeList = new ArrayList();
		ArrayList testList = new ArrayList();
		ArrayList assignmentList = new ArrayList();
		ArrayList studentList = new ArrayList();
		ArrayList facultyList = new ArrayList();
		
		if(!querySearch.equals(""))
		{
			try{
				
				String type = querySearch.substring(0,querySearch.indexOf(':'));
				String keyword = querySearch.substring(querySearch.indexOf(':') + 1,querySearch.length());
				
				
				type = type.toLowerCase();
				keyword = keyword.toLowerCase();
				
				System.out.println(keyword + "level: " + level + "Type "+ type );
				if(type.equals("file"))
				{
						list = dbObject.getFiles(keyword,"5",0);
						
						request.getSession().setAttribute("fileList",list);
						response.sendRedirect("search_file.jsp");
				}
				else
				{
					if(type.equals("notice"))
					{
						list = dbObject.getNotices(keyword,level);
						
						request.getSession().setAttribute("noticeList",list);
						response.sendRedirect("search_notice.jsp");
					}
					else
					{
						if(type.equals("test"))
						{
							list = dbObject.getTests(keyword,level);
							request.getSession().setAttribute("testList",list);
							response.sendRedirect("search_test.jsp");
						}
						else
						{
							if(type.equals("student"))
							{
								
								list = dbObject.student(keyword);
								request.getSession().setAttribute("studentList",list);
								response.sendRedirect("search_student.jsp");
								
							}
							else
							{
								if(type.equals("faculty"))
								{
									list = dbObject.getFaculty(keyword,level);
									request.getSession().setAttribute("facultyList",list);
									response.sendRedirect("search_faculty.jsp");
								}
								else
								{
									if(type.equals("course"))
									{
										list = dbObject.getCourse(keyword);
										request.getSession().setAttribute("courseList",list);
										response.sendRedirect("search_course.jsp");
									}
									else
									{
										
										%>Invalid Query String<%
										
									}
								}
							}
						}
					}
				}				
			
		}catch(StringIndexOutOfBoundsException e)
		{
			querySearch = querySearch.toLowerCase();
			if(ilevel != 5)
			{
				
				lectureList = dbObject.getFiles(querySearch,"5",1);
				assignmentList = dbObject.getFiles(querySearch,"5",2);
				noticeList = dbObject.getNotices(querySearch,level);
				testList = dbObject.getTests(querySearch,level);
				
				studentList = dbObject.student(querySearch);
				facultyList = dbObject.getFaculty(querySearch,level);
				
				request.getSession().setAttribute("lectureList",lectureList);
				request.getSession().setAttribute("noticeList",noticeList);
				request.getSession().setAttribute("testList",testList);
				request.getSession().setAttribute("assignmentList",assignmentList);
				request.getSession().setAttribute("studentList",studentList);
				request.getSession().setAttribute("facultyList",facultyList);
				response.sendRedirect("search_all_new.jsp");
			}
			else
			{
				list = dbObject.getCourse(querySearch);
				request.getSession().setAttribute("courseList",list);
				response.sendRedirect("search_course.jsp");	
			}
		}
	}
		
%>