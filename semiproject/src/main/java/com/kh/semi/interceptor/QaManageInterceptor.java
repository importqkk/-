//package com.kh.semi.interceptor;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import org.springframework.web.servlet.HandlerInterceptor;
//
//import com.kh.semi.dao.QaDao;
//import com.kh.semi.dto.QaDto;
//
//@Service
//public class QaManageInterceptor implements HandlerInterceptor {
//
//    
//	@Autowired
//	private QaDao qaDao;
//
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//	    String path = request.getRequestURI();
//	    int qaNo = Integer.parseInt(path.substring(path.lastIndexOf("/") + 1));
//	    QaDto qaDto = qaDao.selectOne(qaNo);
//	    String memberId = qaDto.getMemberId();
//	    String qaSecret = qaDto.getQaSecret();
//
//	    if (qaSecret == null) {
//	        qaSecret = "N";
//	    }
//
//	    HttpSession session = request.getSession();
//	    String sessionMemberId = (String) session.getAttribute("memberId");
//	    String memberRole = (String) session.getAttribute("memberRole");
//
//	    boolean isAdmin = memberRole != null && memberRole.equals("관리자");
//	    boolean isOwner = sessionMemberId != null && sessionMemberId.equals(memberId);
//
//	    if (qaSecret.equals("Y")) {
//	        if (isAdmin || isOwner) {
//	            return true;
//	        } else if (path.startsWith("/qa/detail")) {
//	            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
//	            request.getRequestDispatcher("/error/403.jsp").forward(request, response);
//	            return false;
//	        } else {
//	            return true;
//	        }
//	    } else { // qaSecret가 "N"인 경우
//	        return true;
//	    }
//	}
//}