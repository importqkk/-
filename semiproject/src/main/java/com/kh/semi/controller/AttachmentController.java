package com.kh.semi.controller;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

import javax.annotation.PostConstruct;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.semi.configuration.FileUploadProperties;
import com.kh.semi.dao.AttachmentDao;
import com.kh.semi.dto.AttachmentDto;

//첨부파일의 다운로드를 처리하는 컨트롤러
@RestController		//@Controller + @ResponseBody(화면을 쓰지 않겠다)
@RequestMapping("/attachment")
public class AttachmentController {
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private FileUploadProperties fileUploadProperties;
	
	private File dir;
	@PostConstruct
	public void init() {
		dir = new File(fileUploadProperties.getPath());
		dir.mkdirs();
	}
	
	
	@GetMapping("/download")
	public ResponseEntity<ByteArrayResource> download(
			@RequestParam int attachmentNo) throws IOException{
		
//			DB조회
			AttachmentDto attachmentDto = attachmentDao.selectOne(attachmentNo);
			if(attachmentDto == null) {			// 없으면 404
				return ResponseEntity.notFound().build();
			}
			
//		파일찾기
			File target = new File(dir, String.valueOf(attachmentNo));
			
//			보낼 데이터 생성
			byte[]data = FileUtils.readFileToByteArray(target);
			ByteArrayResource resource = new ByteArrayResource(data);
			
			
//			제공되는 모든 상수와 명령을 동원해서 최대한 오류없이 변환없이 작성
			return ResponseEntity.ok()
//						.header(HttpHeaders.CONTENT_TYPE, 
//								MediaType.APPLICATION_OCTET_STREAM_VALUE)
						.contentType(MediaType.APPLICATION_OCTET_STREAM)
						.contentLength(attachmentDto.getAttachmentSize())
						.header(HttpHeaders.CONTENT_ENCODING,
											StandardCharsets.UTF_8.name())
						.header(HttpHeaders. CONTENT_DISPOSITION,
											ContentDisposition.attachment()
												.filename(	
													attachmentDto.getAttachmentName(),
													StandardCharsets.UTF_8
													).build().toString()
						)
						.body(resource);
		}
	}

