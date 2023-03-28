package com.kh.semi.controller;

import java.io.File;
import java.io.IOException;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.semi.configuration.FileUploadProperties;
import com.kh.semi.dao.ImgDao;
import com.kh.semi.dto.ImgDto;

@CrossOrigin
@Controller
public class ImgController {
	
	@Autowired
	private ImgDao imgDao;
	
	private File dir; 
	
	@Autowired
	private FileUploadProperties fileUploadProperties;
	
	@PostConstruct
	public void init() {
		// 파일경로 - D:/upload 폴더
		dir = new File(fileUploadProperties.getPath()); 
	}
	
	@GetMapping("/uphome")
	public String main() {
		
		return "/WEB-INF/views/product/uphome.jsp";
	}
	
	@PostMapping("/upload")
	public String upload(@RequestParam MultipartFile attach) throws IllegalStateException, IOException {
		
		if(!attach.isEmpty()) {//파일이 있을 경우
			//번호 생성
			int imgNo = imgDao.sequence();
			
			//파일 저장(저장 위치는 임시로 생성)
			File target = new File(dir, String.valueOf(imgNo));//파일명=시퀀스
			attach.transferTo(target);
			
			//DB 저장
			imgDao.insert(ImgDto.builder()
							.imgNo(imgNo)
							.imgName(attach.getOriginalFilename())
							.imgType(attach.getContentType())
							.imgSize(attach.getSize())
						.build());
		}
		return "redirect:/uphome";
	}
	
}
