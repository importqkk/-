package com.kh.semi.advice;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class ErrorController {

	@ExceptionHandler(Exception.class)
	public String error(Exception ex) {
		return "/WEB-INF/views/error/error.jsp";
	}
	
	@ExceptionHandler(NoHandlerFoundException.class)
	public String notFound(Exception ex) {
		ex.printStackTrace();
		return "/WEB-INF/views/error/404.jsp";
	}
	
	@ExceptionHandler(RequirePermissionException.class)
	public String forbidden(Exception ex) {
		return "/WEB-INF/views/error/403.jsp";
	}
	
	@ExceptionHandler(RequireLoginException.class)
	public String unAuthorized(Exception ex) {
		return "redirect:${pageContext.request.contextPath}/member/login";
	}
	
}
