<!--contents of download.jsp-->
<%@ page import="java.io.*"%>
<!--Assumes that file name is in the request objects query Parameter -->
<%
	String fileName = 	request.getParameter("fileName");
	
	String filePath = request.getParameter("filePath");
	
	String fileExtension = "";
	
	int i = 0;
	for(i = 0 ; i < fileName.length() ; i++) {
		if(fileName.charAt(i) == '.') {
			break;
		}
	}
	
	fileExtension = fileName.substring(i+1,fileName.length());
	
	File f = new File (filePath);

	response.setContentType ("application/" + fileExtension);

	response.setHeader ("Content-Disposition", "attachment;filename =\""+fileName+"\"");
	
	String name = f.getName().substring(f.getName().lastIndexOf("/") + 1,f.getName().length());

	InputStream in = new FileInputStream(f);

	ServletOutputStream outs = response.getOutputStream();
		
	int bit = 256;
	
	try {
		while ((bit) >= 0) {
			bit = in.read();
			outs.write(bit);
		}
		//System.out.println("" +bit);
	} catch (IOException ioe) {
		//ioe.printStackTrace(System.out);
		out.println("Ooops.. There is an error while opening this file.\n Please contact system administrator.");
	}
	outs.flush();
	outs.close();
	in.close();	
%>
            