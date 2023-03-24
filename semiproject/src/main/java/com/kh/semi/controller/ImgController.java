package com.kh.semi.controller;

import java.io.File;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.semi.configuration.FileUploadProperties;
import com.kh.semi.dao.ImgDao;

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
	
	@GetMapping("/")
	public String home(Model model) {
		model.addAttribute("list", imgDao.selectList());
		return "/WEB-INF/views/home.jsp";
	}
	
}
