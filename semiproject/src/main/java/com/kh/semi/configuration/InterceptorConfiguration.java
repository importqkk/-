package com.kh.semi.configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import com.kh.semi.interceptor.AdminInterceptor;
import com.kh.semi.interceptor.MemberInterceptor;

@Configuration
public class InterceptorConfiguration implements WebMvcConfigurer{
	
	
	// 인터셉터 등록
	@Autowired
	private MemberInterceptor memberInterceptor; 
	
	//관리자
	@Autowired
	private AdminInterceptor adminInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// 인터셉터 등록 메소드
				// - 매개변수에 있는 registry를 사용하여 원하는 인터셉터를 원하는 주소에 설정
				
				// 주소 패턴 설정
				// spring표현식 사용
				// *가 1개면 해당 엔드포인트와 모든 내용을 의미
				// *가 2개면 해당 엔드포인트와 그 이하의 모든 내용을 의미 
			
				
				//[1] MemberInterceptor를 마이페이지에 설정하겠다.
				//- /member로 시작하는 주소 중에서 /join, /joinFinish, /login  
				// /find 제외
				registry.addInterceptor(memberInterceptor)
						.addPathPatterns(// 세션이 맴버인 경우에만 접근
								"${pageContext.request.contextPath}/member/**",// 맴버를 모두 추가 후 제외할 항목을 밑에 추가
								"${pageContext.request.contextPath}/cart/**", // 장바구니
								"${pageContext.request.contextPath}/order/**",// 주문
								"${pageContext.request.contextPath}/review/list",// 내 리뷰 리스트
								"${pageContext.request.contextPath}/admin/**"
								)
						.excludePathPatterns(// 세션이 맴버가 아니여도 접근 가능
						"${pageContext.request.contextPath}/member/join",
						"${pageContext.request.contextPath}/member/login",
						"${pageContext.request.contextPath}/member/findId",
						"${pageContext.request.contextPath}/member/findPw",
						"${pageContext.request.contextPath}/member/delete",
						"${pageContext.request.contextPath}/member/joinFinish",
						"${pageContext.request.contextPath}/member/deleteFinish"
				);
				
				//관리자 전용 인터셉터
				registry.addInterceptor(adminInterceptor)
										.addPathPatterns(
													"${pageContext.request.contextPath}/admin/**"
										 );
	
	}

}