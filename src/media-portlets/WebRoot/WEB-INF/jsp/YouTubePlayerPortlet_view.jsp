<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ page import="javax.portlet.*"%>
<%@ taglib uri="http://java.sun.com/portlet" prefix="portlet"%>

<portlet:defineObjects />
<%--<%PortletPreferences prefs = renderRequest.getPreferences();%>--%> 
<h1>${requestScope.feed["title"]}</h1>
<object width="620" height="375">
	<param name="movie" value='http://www.youtube.com/v/${requestScope.feed["v"]}&amp;hl=es_ES&amp;fs=1&amp;autoplay=1'></param>
	<param name="allowFullScreen" value="true"></param>
	<param name="allowscriptaccess" value="always"></param>
	<embed src='http://www.youtube.com/v/${requestScope.feed["v"]}&amp;hl=es_ES&amp;fs=1&amp;autoplay=1' type="application/x-shockwave-flash" allowscriptaccess="always" allowfullscreen="true" width="620" height="375"></embed>
</object>
<c:if test='${requestScope.showDescription == "true"}'>
	<div class="youtube_player_description">
		<p>${requestScope.feed["description"]}</p>
	</div>
</c:if>
<div>${requestScope.feed["viewCount"]}</div>