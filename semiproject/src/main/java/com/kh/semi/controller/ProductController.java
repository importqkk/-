package com.kh.semi.controller;
import java.io.File;
import java.io.IOException;
import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.kh.semi.configuration.FileUploadProperties;
import com.kh.semi.dao.ImgDao;
import com.kh.semi.dao.ProductDao;
import com.kh.semi.dao.ProductImgDao;
import com.kh.semi.dto.ImgDto;
import com.kh.semi.dto.ProductDto;
import com.kh.semi.dto.ProductImgDto;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductDao productDao;
	@Autowired
	private ImgDao imgDao;
	@Autowired
	private ProductImgDao productImgDao;
	@Autowired
	private FileUploadProperties fileUploadProperties;
	private File dir;
	@PostConstruct
	public void init() {
		dir = new File(fileUploadProperties.getPath());
	}

	// 상품 상세
	@GetMapping("/detail")
	public String list(@RequestParam int productNo,
						Model model) {
		ProductDto productDto = productDao.selectOne(productNo);
		model.addAttribute("productDto",productDto); 
		return "/WEB-INF/views/product/detail.jsp";
	}
	
	// 상품 등록
	@GetMapping("/register")
	public String register() {
		return "/WEB-INF/views/product/register.jsp";
	}
	@PostMapping("/register")
	public String register(ProductDto productDto, MultipartFile img) 
			throws IllegalStateException, IOException {
		// 상품 정보 등록
		int productNo = productDao.sequence();
		productDto.setProductNo(productNo);
		productDao.insert(productDto);
		// 상품 대표이미지 저장 및 등록
		if(!img.isEmpty()) {
			// 사진 번호 뽑기
			int imgNo = imgDao.sequence();
			// 파일 이름 설정
			File target = new File(dir, String.valueOf(imgNo));
			img.transferTo(target);
			// db에 저장
			imgDao.insert(ImgDto.builder()
						.imgNo(imgNo)
						.imgName(img.getOriginalFilename())
						.imgType(img.getContentType())
						.imgSize(img.getSize())
					.build());
			// 상품 번호와 사진 번호 연결
			productImgDao.insert(ProductImgDto.builder()
						.productNo(productDto.getProductNo())
						.imgNo(imgNo)
					.build());
		}
		return "redirect:registerFinish";
	}
	@GetMapping("/registerFinish")
	public String registerFinish() {
		return "/WEB-INF/views/product/registerFinish.jsp";
	}
	
}