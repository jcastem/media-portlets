<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ page import="javax.portlet.*"%>
<%@ page import="com.devportal.portlet.media.controller.YouTubePlayerPortlet"%>
<%@ taglib uri="http://java.sun.com/portlet" prefix="portlet"%>

<portlet:defineObjects />
<%--<%PortletPreferences prefs = renderRequest.getPreferences();%>--%> 

<form action="${requestScope.saveActionURL}" method="POST">
	Tipo de reproducci&oacute;n:
	<select name="tipo_reproduccion">
		<option value="dinamica" {requestScope.tipoReproduccion.equals("dinamica")?"selected='selected'": "" }>Din&aacute;mica</option>
		<option value="estatica">Est&aacute;tica</option>
	</select>
	ID del video de youtube:
	<input type="text" name="video_id" />
	<input type="submit" />
</form>