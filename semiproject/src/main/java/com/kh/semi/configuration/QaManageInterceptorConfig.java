package com.kh.semi.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.kh.semi.interceptor.QaManageInterceptor;

@Configuration
	public class QaManageInterceptorConfig implements WebMvcConfigurer{
		@Autowired
		private QaManageInterceptor qaManageInterceptor;
	
		@Override
		public void addInterceptors(InterceptorRegistry registry) {
		    registry.addInterceptor(qaManageInterceptor)
		        .addPathPatterns("/qa/write") // 관리자 권한이 필요한 경로
		        .excludePathPatterns(			// 관리자 권한이 필요없는 경로
		        		"/member/join",
						"/member/joinFinish",
						"/member/login",
						"/member/find",
						"/member/exitFinish",
						"/qa/list");
		}
	}