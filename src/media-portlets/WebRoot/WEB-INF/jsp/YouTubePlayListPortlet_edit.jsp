<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ page import="javax.portlet.*"%>
<%@ taglib uri="http://java.sun.com/portlet" prefix="portlet"%>

<portlet:defineObjects />
<%--<%PortletPreferences prefs = renderRequest.getPreferences();%>--%> 
 

<div>
<form action="${requestScope.savePlaylistURL}" method="POST">
	<p>
	<label for="max_results">Resultados por p&aacute;gina</label>
	<input id="max_results" type="text" name="max_results" value="${requestScope.maxResults}" maxlength="3">
	</p>
	<p>
	<label for="template">Plantilla:</label>
	<select id="template" name="template" onchange="mostrarVideoId(this.value, 'div_video_id')"> 
		<option value="full" ${requestScope.template == "full"? 'selected="selected"': '' }>Full</option>
		<option value="1column" ${requestScope.template == "1column"? 'selected="selected"': '' }>Una columna</option>
		<option value="2column" ${requestScope.template == "2column"? 'selected="selected"': '' }>Dos columnas</option>
	</select>
	</p>
	<p>
	<label for="playlist_type">Tipo de lista de reproducci&oacute;n:
	</label>
	<select id="playlist_type" name="playlist_type" onchange="mostrarVideoId(this.value, 'div_video_id')"> 
		<option value="playlist" ${requestScope.playlistType == "playlist"? 'selected="selected"': '' }>Playlist</option>
		<option value="search" ${requestScope.playlistType == "search"? 'selected="selected"': '' }>Busqueda</option>
	</select>
	</p>
	<p>
	<label for="playlist">C&oacute;digo del playlist</label> <input id="playlist" name = "playlist" value="${requestScope.playlist}" type="text" />
	</p>
	<p>
	<label for="user">Usuario:</label> <input id="user" name = "user" value="${requestScope.user}" type="text" />
	</p>
	<p>
	<label for="tags">Etiquetas:</label> <input id="tags" name = "tags" value="${requestScope.tags}" type="text" />
	</p>
	<p>
	<input type="submit" value="Guardar">  
	</p>
</form>
</div>