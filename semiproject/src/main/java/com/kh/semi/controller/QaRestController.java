package com.kh.semi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.semi.dao.QaDao;
import com.kh.semi.dto.QaDto;
import com.kh.semi.service.QaService;

@CrossOrigin(origins= {"http://127.0.0.1:5500"})
@RestController
@RequestMapping("/rest/qa")
public class QaRestController {

	@Autowired
	private QaDao qaDao;
	
	@Autowired
	private QaService qaService;
	
	@GetMapping("/")
	public List<QaDto>list(){
		return qaDao.selectList();
	}
	
	
	// PUT 요청 처리
//	@PutMapping("/qa/{qaNo}")
//	public ResponseEntity<String> updateQa(@PathVariable("qaNo") int qaNo, @RequestBody String qaContent) {
//	    QaDto qaDto = new QaDto();
//	    qaDto.setQaNo(qaNo);
//	    qaDto.setQaContent(qaContent);
//
//	    int count = qaService.update(qaDto);
//
//	    if (count > 0) {
//	        return ResponseEntity.ok("수정 성공");
//	    } else {
//	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("수정 실패");
//	    }
//	}
}
