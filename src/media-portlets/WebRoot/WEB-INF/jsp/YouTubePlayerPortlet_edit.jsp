<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ page import="javax.portlet.*"%>
<%@ page import="com.devportal.portlet.media.controller.YouTubePlayerPortlet"%>
<%@ taglib uri="http://java.sun.com/portlet" prefix="portlet"%>

<portlet:defineObjects />
<%--<%PortletPreferences prefs = renderRequest.getPreferences();%>--%> 

<script type="text/javascript">
      function mostrarVideoId(valor, idControl){
         var control = document.getElementById(idControl);
         if(valor=="estatica"){
            control.style.visibility = "visible";
         }
         else{
        	 control.style.visibility = "hidden";
         }
      }
      
</script>

<form action="${requestScope.saveActionURL}" method="POST">
	Tipo de reproducci&oacute;n:
	<select name="tipo_reproduccion" onchange="mostrarVideoId(this.value, 'div_video_id')"> 
		<option value="dinamica" ${requestScope.tipoReproduccion == "dinamica"? 'selected="selected"': '' }>Din&aacute;mica</option>
		<option value="estatica" ${requestScope.tipoReproduccion == "estatica"? 'selected="selected"': '' }>Est&aacute;tica</option>
	</select>
	<div id="div_video_id" style="visibility:${requestScope.tipoReproduccion=="estatica"?'visible':'hidden' }">
	ID del video de youtube:
	<input type="text" name="video_id" value="${requestScope.videoId}"/>
	</div>
	Mostrar t&iacute;tulo: <input type="checkbox" name="show_title"  ${requestScope.showTitle == "true"? 'checked="checked"': ''}  /> 
	Mostrar descripci&oacute;n: <input type="checkbox" name="show_description"  ${requestScope.showDescription == "true"? 'checked="checked"': ''}  />
	Mostrar reproducciones: <input type="checkbox" name="show_view_count"  ${requestScope.showViewCount == "true"? 'checked="checked"': ''}  /> 
	 
	<input type="submit" />
</form>