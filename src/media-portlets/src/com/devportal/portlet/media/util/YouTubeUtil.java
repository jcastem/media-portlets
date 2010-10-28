package com.devportal.portlet.media.util;

import java.util.HashMap;
import java.util.Map;

import com.google.gdata.client.youtube.YouTubeService;

public class YouTubeUtil {

	/**
	 * Retorna un map que contiene todos los parametros del query string
	 * @param query 
	 * @return
	 */
	public static Map<String, String> getQueryMap(String query)  
	{  
	    String[] params = query.split("&");  
	    Map<String, String> map = new HashMap<String, String>();  
	    for (String param : params)  
	    {  
	        String name = param.split("=")[0];  
	        String value = param.split("=")[1];  
	        map.put(name, value);  
	    }  
	    return map;  
	} 
	
	public static YouTubeService getYouTubeServiceInstance() {
		return new YouTubeService("mycompany-myapp-1");
	}
}
