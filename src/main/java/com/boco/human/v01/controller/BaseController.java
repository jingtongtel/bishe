package com.boco.human.v01.controller;

import java.util.Map;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.boco.human.v01.DataViewManager;
import com.boco.human.v01.RESTRequst;
import com.boco.human.v01.handler.ViewHandler;

/**
 * 需要重构！
 *
 */
class BaseController {
	private static final HttpHeaders HEARDERS = new HttpHeaders();
	private static final String htmlStr = "<h1>入参错误:</h1></ br>";
	static{
		HEARDERS.set("Content-Type", "text/html;charset=utf-8");
	}
	
	
	@ExceptionHandler
	ResponseEntity<?> mappingExcption(Exception ex) throws Exception{
        if(ex instanceof IllegalArgumentException) {
            return getResponseEntity(htmlStr+ex.getMessage());  
        }
        else if(ex instanceof HttpMessageNotReadableException){
        	//return getResponseEntity(htmlStr+ex.getMessage());
        	return getResponseEntity(htmlStr+"传入的入参对象不是结构良好的JSON格式.");
        }
        else if(ex instanceof ClassCastException) {
        	if (ex.getMessage().equals("java.lang.String cannot be cast to java.util.List")) {
        		System.out.println(ex.getMessage());
                return getResponseEntity("输入日期格式异常"+ex.getMessage());  

			}else  {
				return getResponseEntity(htmlStr+ex.getMessage());  
			}
        }
        else {  
        	System.out.println("TTTTTTTTTT");
        	System.out.println("in other exception");
        	throw ex;  
        }		
	}
	
	private ResponseEntity<?> getResponseEntity(String message){
		ResponseEntity re = new ResponseEntity(message,HEARDERS,HttpStatus.BAD_REQUEST);
		return re;
	}
	
	Map<?,?> doHandle(Map<String, Map<String, ?>> paraMap,String metricName){
		RESTRequst dg = new RESTRequst(paraMap, metricName);
		ViewHandler vh = DataViewManager.findViewHandler(dg.getHandlerId());
		return vh.getDataMap(dg.getRequestMap());
	}
}
