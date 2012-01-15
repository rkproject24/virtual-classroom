<jsp:useBean id="Connector" class="jChatBox.Service.XMLConnector" scope="application" /><%
	Connector.setLoginModule("jChatBox.Service.UserLogin");
	Connector.setXMLEncoding("ISO-8859-1");
	Connector.setDTDEnabled(false);
	Connector.setXSLGetManager(null);
	Connector.setXSLGetChatroom(null);
	Connector.setXSLGetChat(null);
	Connector.setXSLError(null);
	String xml = Connector.execute(request, session);
	if (xml != null)
	{
		response.setContentType("text/xml");
		out.println(xml);
	}
	else
	{
		out.println("XMLConnetor Error");
	}%>