package com.kh.semi.advice;


// 403번 대신 사용할 예외 클래스
public class RequirePermissionException extends RuntimeException {

//	private static final long serialVersionUID = 1L;	// 안해도 됨

	public RequirePermissionException(String message) {
		super(message);
	}

}
