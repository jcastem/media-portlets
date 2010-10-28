<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ page import="javax.portlet.*"%>
<%@ taglib uri="http://java.sun.com/portlet" prefix="portlet"%>

<portlet:defineObjects />
<%--<%PortletPreferences prefs = renderRequest.getPreferences();%>--%> 

<form action="${requestScope.savePlaylistURL}" method="POST">
	C&oacute;digo del playlist <input name = "playlist" value="${requestScope.playlist}" type="text" />
	<input type="submit" value="Guardar">  
</form>