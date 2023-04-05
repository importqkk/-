package com.kh.semi.advice;

// 401번 상황을 처리하기 위한 예외 클래스
public class RequireLoginException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public RequireLoginException(String message) {
		super(message);
	}

}
