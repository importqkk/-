package com.kh.semi.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.semi.advice.RequirePermissionException;

@Service
public class AdminInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String memberRole = (String) session.getAttribute("memberRole");
		
		if(memberRole != null && memberRole.equals("관리자")) {
			return true;
		}
		else {
			throw new RequirePermissionException("관리자만 이용 가능합니다");
		}
	}

}
