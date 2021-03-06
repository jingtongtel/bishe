package com.boco.human.v01.handler;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.InitializingBean;

import com.boco.human.v01.DataViewManager;

public abstract class AbstractViewHandler implements ViewHandler,InitializingBean{

	
	protected static final String DATAVIEW_DEF_NAME = "default";

	protected abstract String getMetricName();

	protected abstract String getDataViewName();

	protected abstract Object formatData(Map<?,?> paraMap);
	
	/*private static final List<String> fieldsFilterList = new ArrayList<String>();
	static{
		fieldsFilterList.add("no_use");
	}*/
	

	protected AbstractViewHandler(){
	}


	/**
	 * @see com.example.gd.ViewHandler#getHanderlerId()
	 * 
	 *  
	 */
	public String getHanderlerId() {
		return this.getMetricName()+"."+this.getDataViewName();
	}
	
	@Override
	public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub
		DataViewManager.registerHanlder(this);
	}


	/**
	 * @see com.example.gd.ViewHandler#getDataMap(java.util.Map)
	 * 
	 *  
	 */
	public Map getDataMap(Map paraMap){
		HashMap dataMap = new HashMap();
		dataMap.put("data", this.formatData(paraMap));
		dataMap.put("server timestamp", System.currentTimeMillis());
		return dataMap;
	}

}
