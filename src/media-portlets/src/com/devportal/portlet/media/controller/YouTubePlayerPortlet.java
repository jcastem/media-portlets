package com.devportal.portlet.media.controller;

import java.io.IOException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.portlet.GenericPortlet;
import javax.portlet.PortletException;
import javax.portlet.PortletRequestDispatcher;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import com.devportal.portlet.media.util.YouTubeUtil;
import com.google.gdata.client.youtube.YouTubeService;
import com.google.gdata.data.youtube.VideoEntry;
import com.google.gdata.data.youtube.YouTubeMediaGroup;
import com.google.gdata.util.ServiceException;

public class YouTubePlayerPortlet extends GenericPortlet {

	/**
	 * Helper method to serve up the mandatory view mode.
	 */
	protected void doHelp(RenderRequest request, RenderResponse response)
			throws PortletException, IOException {
		response.setContentType("text/html");
		PortletRequestDispatcher dispatcher = getPortletContext()
				.getRequestDispatcher(
						"/WEB-INF/jsp/YouTubePlayerPortlet_help.jsp");
		dispatcher.include(request, response);
	}

	/**
	 * Helper method to serve up the mandatory view mode.
	 */
	protected void doEdit(RenderRequest request, RenderResponse response)
			throws PortletException, IOException {
		response.setContentType("text/html");
		PortletRequestDispatcher dispatcher = getPortletContext()
				.getRequestDispatcher(
						"/WEB-INF/jsp/YouTubePlayerPortlet_edit.jsp");
		dispatcher.include(request, response);
	}

	/**
	 * Helper method to serve up the mandatory view mode.
	 */
	protected void doView(RenderRequest request, RenderResponse response)
			throws PortletException, IOException {
		String idVideo = request.getParameter("video");
		if(idVideo != null && !idVideo.trim().isEmpty()) {
			Map<String, String> feed = new HashMap<String,String>();
			YouTubeService service = YouTubeUtil.getYouTubeServiceInstance();
			String videoEntryUrl = "http://gdata.youtube.com/feeds/api/videos/" + idVideo;
			try {
				VideoEntry videoEntry = service.getEntry(new URL(videoEntryUrl), VideoEntry.class);
				YouTubeMediaGroup mediaGroup = videoEntry.getMediaGroup();
				feed.put("v", idVideo);
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

}
