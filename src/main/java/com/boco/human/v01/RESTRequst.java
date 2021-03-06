package com.boco.human.v01;

import java.util.Map;

import com.boco.human.util.Asserts;

/**
 * 客户端请求的封装类
 * @author 张晨
 */
public class RESTRequst {
	
	private final static String DEF_VIEW_NAME = "default",PARA="para",DATA_VIEW="dataView",DOT=".";
	private Map<String,Map<String,?>> paraJsonMap;
	private Map<String,?> paraMap = null;
	private String dataViewName = DEF_VIEW_NAME;
	private String metricName;;

	private RESTRequst(){}
	
	/**
	 * 客户端请求封装类的构造方法
	 * @param paraJsonMap 客户端提交的入参集合
	 * @param metricName 指标唯一标识
	 */
	public RESTRequst(Map<String,Map<String,?>> paraJsonMap,String metricName){
		this.paraJsonMap = paraJsonMap;
		this.metricName = metricName;
		Asserts.notNull(paraJsonMap, "参数对象 para不能为空");
		Asserts.notNull(paraJsonMap.get(PARA), "参数对象 para不能为空");
		if(paraJsonMap != null && paraJsonMap.get(PARA) != null){
			this.paraMap = paraJsonMap.get(PARA);
			String dataView = (String) this.paraMap.get(DATA_VIEW);
			if(dataView != null){
				this.dataViewName = dataView;
			}
		}
	}
	
	public  String getHandlerId(){
		return this.metricName+DOT+this.dataViewName;
	}

	public  Map<String,?> getRequestMap(){
		return this.paraMap;
	}

	/*public  Map getResponseMap(){
		return null;
	}*/

}
