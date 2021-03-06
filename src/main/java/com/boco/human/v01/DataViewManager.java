package com.boco.human.v01;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import com.boco.human.v01.handler.ViewHandler;

public class DataViewManager{
	
	private static Map<String,ViewHandler> handlers = new ConcurrentHashMap<String, ViewHandler>();

	public static void registerHanlder(ViewHandler handler) {
		handlers.put(handler.getHanderlerId(), handler);
		System.out.println("register handler :"+handler.getHanderlerId());
	}

	public static ViewHandler findViewHandler(String handlerId) {
		return handlers.get(handlerId);
	}

}
