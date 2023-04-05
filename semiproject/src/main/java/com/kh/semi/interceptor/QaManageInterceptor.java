package com.kh.semi.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.semi.dao.QaDao;
import com.kh.semi.dto.QaDto;

@Service
public class QaManageInterceptor implements HandlerInterceptor {
	@ Autowired
	private QaDao qaDao;

	@Override
	public boolean preHandle(
			HttpServletRequest request, 		//사용자가 보낸 정보
			HttpServletResponse response, 	//사용자에게 보낼 정보
			Object handler)
			throws Exception {
		
//		게시글 작성자 확인 코드
		int qaNo= Integer.parseInt(request.getParameter("qaNo"));
		QaDto qaDto = qaDao.selectOne(qaNo);
		String writerId = qaDto.getMemberId();
		String qaSecret = qaDto.getQaSecret();
		
		if (qaSecret == null) {
	        qaSecret = "N";
	    }
		
//		현재 로그인 회원 확인 코드
		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("memberId");
		boolean isOwner = memberId != null && memberId.equals(writerId);
		
//		현재 로그인 회원의 등급 확인 코드
		String memberRole = (String)session.getAttribute("memberRole");
		boolean isAdmin = memberRole != null && memberRole.equals("관리자");
		
			if (qaSecret.equals("Y")) {
		        if (isAdmin || isOwner) {
		            return true;
		        } else if (request.getRequestURI().equals("/qa/detail")) {
		            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
		            request.getRequestDispatcher("/error/403.jsp").forward(request, response);
		            return false;
		        } else {
		            return true;
		        }
		    } else { // qaSecret가 "N"인 경우
		        return true;
		    }
		}
	}