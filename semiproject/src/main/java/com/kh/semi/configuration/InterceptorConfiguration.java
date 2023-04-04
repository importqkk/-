package com.kh.semi.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.kh.semi.interceptor.AdminInterceptor;

@Configuration
public class InterceptorConfiguration implements WebMvcConfigurer {
	
	@Autowired
	private AdminInterceptor adminInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		//관리자 전용 인터셉터
		registry.addInterceptor(adminInterceptor)
								.addPathPatterns(
											"/admin/**"
								 );
	}
	

}
