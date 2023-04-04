package com.kh.semi.advice;

public class RequirePermissionException extends RuntimeException {
	public RequirePermissionException(String message) {
		super(message);
	}
}
