<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ page import="javax.portlet.*"%>
<%@ taglib uri="http://java.sun.com/portlet" prefix="portlet"%>

<portlet:defineObjects />
<%--<%PortletPreferences prefs = renderRequest.getPreferences();%>--%> 
<div class="youtubeplaylistportlet">
<c:forEach var="video" items="${requestScope.videos}">
<div>
	<a href='${video["url"]}'>
		<img style="float:left; margin:10px 10px 10px 10px" src='http://i4.ytimg.com/vi/${video["v"]}/default.jpg' />
	</a>
	<h2><a href='${video["url"]}'>
		${video["title"]}
	</a></h2>
	${video["description"]}
	<div style="clear:both;"></div>
</div>

</c:forEach>


<c:if test="${requestScope.anteriorUrl != null}" >
	<a href="${requestScope.anteriorUrl}">Anterior</a>
</c:if>
P&aacute;gina&nbsp;${requestScope.paginaActual}
<c:if test="${requestScope.siguienteUrl != null}" >
	<a href="${requestScope.siguienteUrl}">Siguiente</a>
</c:if>
</div>  