package com.boco.human.exceptions.rest;

import org.springframework.http.ResponseEntity;

public interface RESTException {
	public ResponseEntity<?> getResponseEntity();
}
