package com.devportal.portlet.media.controller;

import java.io.IOException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.GenericPortlet;
import javax.portlet.PortletException;
import javax.portlet.PortletPreferences;
import javax.portlet.PortletRequestDispatcher;
import javax.portlet.PortletURL;
import javax.portlet.ProcessAction;
import javax.portlet.ReadOnlyException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ValidatorException;

import com.devportal.portlet.media.util.YouTubeUtil;
import com.google.gdata.client.youtube.YouTubeService;
import com.google.gdata.data.youtube.VideoEntry;
import com.google.gdata.data.youtube.YouTubeMediaGroup;
import com.google.gdata.data.youtube.YtIncomplete;
import com.google.gdata.util.ServiceException;

public class YouTubePlayerPortlet extends GenericPortlet {

	private static final String TIPO_REPRODUCCION_DINAMICA = "dinamica";
	private static final String TIPO_REPRODUCCION_ESTATICA = "estatica"; 
	
	/**
	 * Helper method to serve up the mandatory view mode.
	 */
	protected void doHelp(RenderRequest request, RenderResponse response)
			throws PortletException, IOException {
		response.setContentType("text/html");
		PortletRequestDispatcher dispatcher = getPortletContext().getRequestDispatcher("/WEB-INF/jsp/YouTubePlayerPortlet_help.jsp");
		dispatcher.include(request, response);
	}

	/**
	 * Helper method to serve up the mandatory view mode.
	 */
	protected void doEdit(RenderRequest request, RenderResponse response)
			throws PortletException, IOException {
		// Cargamos la configuracion del portlet
		PortletPreferences prefs = request.getPreferences();
		String tipoReproduccion = prefs.getValue("tipoReproduccion", "");
		String videoId = prefs.getValue("videoId", "");
		if(tipoReproduccion.equals("")) {
			tipoReproduccion = YouTubePlayerPortlet.TIPO_REPRODUCCION_DINAMICA;
		}
		
		response.setContentType("text/html");
		PortletRequestDispatcher dispatcher = getPortletContext().getRequestDispatcher("/WEB-INF/jsp/YouTubePlayerPortlet_edit.jsp");
		
		request.setAttribute("tipoReproduccion", tipoReproduccion);
		PortletURL saveActionUrl = response.createActionURL();
		saveActionUrl.setParameter(ActionRequest.ACTION_NAME, "saveAction");
		request.setAttribute("saveActionURL", saveActionUrl);
		
		System.out.println("TIPO: " + tipoReproduccion);
		System.out.println("V: " + videoId);
		
		dispatcher.include(request, response);
	}

	/**
	 * Helper method to serve up the mandatory view mode.
	 */
	protected void doView(RenderRequest request, RenderResponse response)
			throws PortletException, IOException {
		
		// Cargamos la configuracion del portlet
		PortletPreferences prefs = request.getPreferences();
		String tipoReproduccion = prefs.getValue("tipoReproduccion", "");
		String videoId = prefs.getValue("videoId", "");
		if(tipoReproduccion.equals("")) {
			tipoReproduccion = YouTubePlayerPortlet.TIPO_REPRODUCCION_DINAMICA;
		}
		if(tipoReproduccion.equals(YouTubePlayerPortlet.TIPO_REPRODUCCION_DINAMICA)) {
			videoId = request.getParameter("video");
		}		
		
		if(videoId != null && !videoId.trim().isEmpty()) {
			Map<String, String> feed = new HashMap<String,String>();
			YouTubeService service = YouTubeUtil.getYouTubeServiceInstance();
			String videoEntryUrl = "http://gdata.youtube.com/feeds/api/videos/" + videoId;
			try {
				VideoEntry videoEntry = service.getEntry(new URL(videoEntryUrl), VideoEntry.class);
				YouTubeMediaGroup mediaGroup = videoEntry.getMediaGroup();
				feed.put("v", videoId);
				feed.put("title", videoEntry.getTitle().getPlainText());
				feed.put("description", mediaGroup.getDescription().getPlainTextContent());
				feed.put("viewCount", Long.toString((videoEntry.getStatistics().getViewCount())));

				
			} catch (ServiceException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			request.setAttribute("feed", feed);
			//request.setAttribute("video", idVideo);
			
			
			response.setContentType("text/html");			
			PortletRequestDispatcher dispatcher = getPortletContext()
			.getRequestDispatcher(
					"/WEB-INF/jsp/YouTubePlayerPortlet_view.jsp");
			dispatcher.include(request, response);
		}		
	}
	
	@ProcessAction(name="saveAction") 
	public void saveAction(ActionRequest actionRequest, ActionResponse actionResponse) {
		String tipoReproduccion = actionRequest.getParameter("tipo_reproduccion");
		PortletPreferences prefs = actionRequest.getPreferences();
		try {
			prefs.setValue("tipoReproduccion", tipoReproduccion);
			if(tipoReproduccion.equals(YouTubePlayerPortlet.TIPO_REPRODUCCION_ESTATICA)) {
				String videoId = actionRequest.getParameter("video_id");
				if(videoId != null && !videoId.trim().isEmpty()) {
					prefs.setValue("videoId", videoId);
				}
			}
			prefs.store();
		} catch (ReadOnlyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ValidatorException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
