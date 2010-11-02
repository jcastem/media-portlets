<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ page import="javax.portlet.*"%>
<%@ taglib uri="http://java.sun.com/portlet" prefix="portlet"%>

<portlet:defineObjects />
<%--<%PortletPreferences prefs = renderRequest.getPreferences();%>--%> 
<script type="text/javascript">
function videoPlayer(title, video) {
AUI().use('aui-dialog', 'liferay-portlet-url', function(A) {

        var dialog = new A.Dialog({
        title: title,
        centered: true,
        modal: false,
        width: 650,
        height: 435,
        resizable: false,
        bodyContent:'<object width="620" height="375"><param name="movie" value="http://www.youtube.com/v/' + video + '&amp;hl=es_ES&amp;fs=1&amp;autoplay=1"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><embed src="http://www.youtube.com/v/' + video + '&amp;hl=es_ES&amp;fs=1&amp;autoplay=1" type="application/x-shockwave-flash" allowscriptaccess="always" allowfullscreen="true" width="620" height="375"></embed></object>',

        }).render();

    });

}
</script>
<div class="youtubeplaylistportlet">
<c:forEach var="video" items="${requestScope.videos}">
<div>
	<c:choose>
	  <c:when test='${requestScope.playerType != "embedded"}'>
	    <a href='${video["url"]}' ${requestScope.playerType == "youtube"? 'target="_blank"':''} >
			<img style="float:left; margin:10px 10px 10px 10px" src='http://i4.ytimg.com/vi/${video["v"]}/default.jpg' />
		</a>
	  </c:when>
	  <c:otherwise>
	    <span style="cursor:pointer" onclick='videoPlayer(&quot;${video["title"]}&quot;,&quot;${video["v"]}&quot;)'>
			<img style="float:left; margin:10px 10px 10px 10px" src='http://i4.ytimg.com/vi/${video["v"]}/default.jpg' />
		</span>
	  </c:otherwise>
	</c:choose>
	<h3>
		<c:choose>
		  <c:when test='${requestScope.playerType != "embedded"}'>
		    <a href='${video["url"]}' ${requestScope.playerType == "youtube"? 'target="_blank"':''} >
				${video["title"]}
			</a>
		  </c:when>
		  <c:otherwise>
		    <span style="cursor:pointer" onclick='videoPlayer(&quot;${video["title"]}&quot;,&quot;${video["v"]}&quot;)'>
				${video["title"]}
			</span>
		  </c:otherwise>
		</c:choose>
	</h3>
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