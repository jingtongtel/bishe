package com.boco.human.util;

import org.springframework.util.Assert;

public  class Asserts extends Assert{
	
	public static void isTrue(boolean expression, String message) {
		if (!expression) {
			throw new IllegalArgumentException(message);
		}
	}
		
}
