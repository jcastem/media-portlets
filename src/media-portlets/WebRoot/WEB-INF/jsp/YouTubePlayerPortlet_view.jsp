<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ page import="javax.portlet.*"%>
<%@ taglib uri="http://java.sun.com/portlet" prefix="portlet"%>

<portlet:defineObjects />
<%--<%PortletPreferences prefs = renderRequest.getPreferences();%>--%> 
<c:if test='${requestScope.showTitle == "true"}'>
	<div class="youtube_player_title">
		<h1>${requestScope.feed["title"]}</h1>
	</div>
</c:if>
<div width="${requestScope.width}" height="${requestScope.height}" class="youtube_player_player">
	<object width="${requestScope.width}" height="${requestScope.height}">
		<param name="movie" value='http://www.youtube.com/v/${requestScope.feed["v"]}&amp;hl=es_ES&amp;fs=1&amp;autoplay=1'></param>
		<param name="allowFullScreen" value="true"></param>
		<param name="allowscriptaccess" value="always"></param>
		<embed src='http://www.youtube.com/v/${requestScope.feed["v"]}&amp;hl=es_ES&amp;fs=1&amp;autoplay=1' type="application/x-shockwave-flash" allowscriptaccess="always" allowfullscreen="true" width="${requestScope.width}" height="${requestScope.height}"></embed>
	</object>
</div>
<c:if test='${requestScope.showDescription == "true"}'>
	<div class="youtube_player_description">
		${requestScope.feed["description"]}
	</div>
</c:if>
<c:if test='${requestScope.showViewCount == "true"}'>
<div class="youtube_player_view_count"> 
	Reproducciones: ${requestScope.feed["viewCount"]}
</div>
</c:if>