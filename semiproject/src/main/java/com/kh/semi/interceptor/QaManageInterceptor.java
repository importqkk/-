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
		
//		현재 로그인 회원 확인 코드
		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("memberId");
		
		boolean isOwner = memberId.equals(writerId);
		
//		현재 로그인 회원의 등급 확인 코드
		String memberRole = (String)session.getAttribute("memberRole");
		
		
		boolean isAdmin = memberRole.equals("관리자");
		
//		작성자 본인이거나 관리자라면
		if(isAdmin) {
//			삭제 페이지로 가는것이라면
			if(request.getRequestURI().equals("/qa/delete")) {	
			return true;
			}
		}
		if(isOwner) {	//작성자 본인
			return true;
		}
//		조건에 해당하지 않는 경우 모두 차단
		response.sendError(403);
		return false;
	}
}