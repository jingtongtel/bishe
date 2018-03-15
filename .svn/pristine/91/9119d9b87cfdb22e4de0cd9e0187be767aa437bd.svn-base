package com.boco.human.exceptions.rest;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

public class ParameterException extends Exception implements RESTException{
	
	private static final HttpHeaders HEARDERS = new HttpHeaders();
	private static final String htmlStr = "<h1>入参错误:</h1></ br>";
	static{
		HEARDERS.set("Content-Type", "text/html;charset=utf-8");
	}
	
	
	public ParameterException(String errString){
		super(errString);
	}
	

	@Override
	public ResponseEntity<?> getResponseEntity() {
		HttpHeaders responseHeaders = new HttpHeaders();
		
		ResponseEntity re = new ResponseEntity(htmlStr+this.getMessage(),HEARDERS,HttpStatus.BAD_REQUEST);
		return re;
	}

}
