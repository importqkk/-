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
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kh.semi.configuration.CustomFileUploadProperties;
import com.kh.semi.dao.ImgDao;
import com.kh.semi.dto.ImgDto;

@CrossOrigin
@RestController
@RequestMapping("/rest/img")
public class ImgRestController {
	
	@Autowired
	private ImgDao imgDao;
	
	@Autowired
	private CustomFileUploadProperties fileUploadProperties;
	
	private File dir;
	
	@PostConstruct
	public void init() {
		dir = new File(fileUploadProperties.getPath());
		dir.mkdirs();
	}
	
	//업로드
	@PostMapping("/upload")
	public ImgDto upload(@RequestParam MultipartFile img) throws IllegalStateException, IOException {
		if(!img.isEmpty()) {
			int imgNo = imgDao.sequence();
			
			File target = new File(dir, String.valueOf(imgNo));
			img.transferTo(target);
			
			imgDao.insert(ImgDto.builder()
									.imgNo(imgNo)
									.imgName(img.getOriginalFilename())
									.imgType(img.getContentType())
									.imgSize(img.getSize())
					.build());
			return imgDao.selectOne(imgNo);
		}
		return null;
	}
	
	//다운로드
		@GetMapping("/download/{imgNo}")
		public ResponseEntity<ByteArrayResource> download(
										@PathVariable int imgNo) throws IOException {
			//DB 조회
			ImgDto imgDto = imgDao.selectOne(imgNo);
			if(imgDto == null) {//없으면 404
				return ResponseEntity.notFound().build();
			}
			
			//파일 찾기
			File target = new File(dir, String.valueOf(imgNo));
			
			//보낼 데이터 생성
			byte[] data = FileUtils.readFileToByteArray(target);
			ByteArrayResource resource = new ByteArrayResource(data);
			
//			제공되는 모든 상수와 명령을 동원해서 최대한 오류 없이 편하게 작성
			return ResponseEntity.ok()
//						.header(HttpHeaders.CONTENT_TYPE, 
//								MediaType.APPLICATION_OCTET_STREAM_VALUE)
						.contentType(MediaType.APPLICATION_OCTET_STREAM)
						.contentLength(imgDto.getImgSize())
						.header(HttpHeaders.CONTENT_ENCODING, 
													StandardCharsets.UTF_8.name())
						.header(HttpHeaders.CONTENT_DISPOSITION,
							ContentDisposition.attachment()
										.filename(
												imgDto.getImgName(), 
												StandardCharsets.UTF_8
										).build().toString()
						)
						.body(resource);
		}
		

}