<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ page import="javax.portlet.*"%>
<%@ taglib uri="http://java.sun.com/portlet" prefix="portlet"%>

<portlet:defineObjects />
<%--<%PortletPreferences prefs = renderRequest.getPreferences();%>--%> 
<div class="youtubeplaylistportlet">
<c:forEach var="video" items="${requestScope.videos}">
<div style="width:140px; float:left">
<a href='${video["url"]}' style='background: url(&quot;http://i4.ytimg.com/vi/${video["v"]}/default.jpg&quot;) no-repeat scroll 12px -12px transparent; width: 120px; height: 62px; display: block; padding: 70px 10px 0pt;'>
<br>${video["title"]}</a>
</div>

</c:forEach>

<div style="clear:both;"></div>
<div>
<c:if test="${requestScope.anteriorUrl != null}" >
	<a href="${requestScope.anteriorUrl}">Anterior</a>
</c:if>
P&aacute;gina&nbsp;${requestScope.paginaActual}
<c:if test="${requestScope.siguienteUrl != null}" >
	<a href="${requestScope.siguienteUrl}">Siguiente</a>
</c:if>
</div>
</div>  