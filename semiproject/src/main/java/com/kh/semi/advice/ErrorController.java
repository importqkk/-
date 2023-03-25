package com.kh.semi.advice;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;
import org.springframework.web.servlet.mvc.Controller;

//예외만 전문적으로 처리하는 컨트롤러(사용자가 부를 수 없음)
//어노테이션 이름도 다름
//(주의)컨트롤러만 감시가 가능

@ControllerAdvice 

//@ControllerAdvice(annotations = {Controller.class}) //@Controller에 대한 catch 블록
//@ControllerAdvice(basePackages = {"com.kh.semi.controller"})
public class ErrorController {

	//	- @ExceptionHandler(처리할 예외 클래스 정보)
	
	@ExceptionHandler(Exception.class)
	public String error(Exception ex) {
		return"/WEB-INF/views/error/sorry.jsp";
	}
	
//	404예외만 따로 처리할 수 있도록 추가 메소드를 구성
	@ExceptionHandler(NoHandlerFoundException.class)
	public String notFound(Exception ex) {
//		ex.printStackTrace();		(오류추적)
		return"/WEB-INF/views/error/404.jsp";
	}

//	403 - 권한이 없음 : 직접 만든 RequirePermissionException으로 대체하여 처리
	@ExceptionHandler(RequirePermissionException.class)
	public String forbidden(Exception ex) {
		return "/WEB-INF/views/error/403.jsp";
	}
	
//	401 - 자격이 없음 : 직접 만든 RequireLoginException으로 대체처리
//	- 사용자가 봐야하는 페이지는 로그인 페이지
	@ExceptionHandler(RequireLoginException.class)
	public String unAuthorizes(Exception ex) {
	return"/WEB-INF/views/member/login.jsp";		// 주소는 유지하고 화면만 변경
//	return"redirect:/member/login";						//재접속을 지시
	}
}
