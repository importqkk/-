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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.kh.semi.configuration.FileUploadProperties;
import com.kh.semi.dao.ImgDao;
import com.kh.semi.dto.ImgDto;

@CrossOrigin
@RestController
@RequestMapping("/img")
public class ImgController {
	
	@Autowired
	private ImgDao imgDao;
	@Autowired
	private FileUploadProperties fileUploadProperties;
	private File dir;
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
	
	// 이미지 불러오기
	@GetMapping("/download")
	public ResponseEntity<ByteArrayResource> download(@RequestParam int imgNo) throws IOException {
		// 헤더
		ImgDto imgDto = imgDao.selectOne(imgNo);
		// 파일이 없으면 낫파운드
		if(imgDto == null) {
			return ResponseEntity.notFound().build();
		}
		// 파일이 있으면 파일 찾기
		File target = new File(dir, String.valueOf(imgNo));
		// 보낼 데이터 생성
		// 바디
		byte[] data = FileUtils.readFileToByteArray(target);
		ByteArrayResource resource = new ByteArrayResource(data);
		// 헤더와 바디 설정하면서 responseEntity 만들어 반환
		return ResponseEntity.ok()
					.contentType(MediaType.APPLICATION_OCTET_STREAM)
					.contentLength(imgDto.getImgSize())
					.header(HttpHeaders.CONTENT_ENCODING, StandardCharsets.UTF_8.name())
					.header(HttpHeaders.CONTENT_DISPOSITION, 
							ContentDisposition.attachment()
								.filename(imgDto.getImgName(), StandardCharsets.UTF_8)
								.build().toString())
				.body(resource);
	}
	
}
