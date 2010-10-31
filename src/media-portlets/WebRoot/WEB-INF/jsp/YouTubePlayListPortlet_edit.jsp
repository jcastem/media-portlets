<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ page import="javax.portlet.*"%>
<%@ taglib uri="http://java.sun.com/portlet" prefix="portlet"%>

<portlet:defineObjects />
<%--<%PortletPreferences prefs = renderRequest.getPreferences();%>--%> 

<form action="${requestScope.savePlaylistURL}" method="POST">
	Tipo de lista de reproducci&oacute;n:
	<select name="playlist_type" onchange="mostrarVideoId(this.value, 'div_video_id')"> 
		<option value="playlist" ${requestScope.playlistType == "playlist"? 'selected="selected"': '' }>Playlist</option>
		<option value="search" ${requestScope.playlistType == "search"? 'selected="selected"': '' }>Busqueda</option>
	</select>
	C&oacute;digo del playlist <input name = "playlist" value="${requestScope.playlist}" type="text" />
	Usuario: <input name = "user" value="${requestScope.user}" type="text" />
	Etiquetas: <input name = "tags" value="${requestScope.tags}" type="text" />
	<input type="submit" value="Guardar">  
</form>