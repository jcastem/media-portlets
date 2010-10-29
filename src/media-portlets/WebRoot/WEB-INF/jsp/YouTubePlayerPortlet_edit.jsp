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
		<option value="dinamica" ${requestScope.tipoReproduccion == "dinamica"? 'selected="selected"': '' }>Din&aacute;mica</option>
		<option value="estatica" ${requestScope.tipoReproduccion == "estatica"? 'selected="selected"': '' }>Est&aacute;tica</option>
	</select>
	ID del video de youtube:
	<input type="text" name="video_id" value="${requestScope.videoId}"/>
	Mostrar t&iacute;tulo: <input type="checkbox" name="show_title"  ${requestScope.showTitle == "true"? 'checked="checked"': ''}  /> 
	Mostrar descripci&oacute;n: <input type="checkbox" name="show_description"  ${requestScope.showDescription == "true"? 'checked="checked"': ''}  />
	Mostrar reproducciones: <input type="checkbox" name="show_view_count"  ${requestScope.showViewCount == "true"? 'checked="checked"': ''}  /> 
	 
	<input type="submit" />
</form>