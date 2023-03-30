package com.kh.semi.controller;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.semi.configuration.FileUploadProperties;
import com.kh.semi.dao.DetailImgDao;
import com.kh.semi.dao.ImgDao;
import com.kh.semi.dao.ProductDao;
import com.kh.semi.dao.ProductImgDao;
import com.kh.semi.dto.DetailImgDto;
import com.kh.semi.dto.ImgDto;
import com.kh.semi.dto.ProductDto;
import com.kh.semi.dto.ProductImgDto;
import com.kh.semi.vo.ProductListPaginationVo;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private ProductDao productDao;
	@Autowired
	private ImgDao imgDao;
	@Autowired
	private ProductImgDao productImgDao;
	@Autowired
	private DetailImgDao detailImgDao;
	@Autowired
	private FileUploadProperties fileUploadProperties;
	private File dir;
	@PostConstruct
	public void init() {
		dir = new File(fileUploadProperties.getPath());
	}
	
	// 상품 등록
	@GetMapping("/productManage/register")
	public String register() {
		return "/WEB-INF/views/admin/productManage/register.jsp";
	}
	@PostMapping("/productManage/register")
	public String register(ProductDto productDto, MultipartFile img1, MultipartFile img2) 
			throws IllegalStateException, IOException {
		// 상품 정보 등록
		int productNo = productDao.sequence();
		productDto.setProductNo(productNo);
		productDao.insert(productDto);
		// 상품 대표이미지 저장 및 등록
		if(!img1.isEmpty()) {
			// 대표사진 번호 뽑기
			int imgNo1 = imgDao.sequence();
			// 대표사진 파일 이름 설정
			File target1 = new File(dir, String.valueOf(imgNo1));
			img1.transferTo(target1);
			// 대표사진 db에 저장
			imgDao.insert(ImgDto.builder()
						.imgNo(imgNo1)
						.imgName(img1.getOriginalFilename())
						.imgType(img1.getContentType())
						.imgSize(img1.getSize())
					.build());
			// 상품 번호와 대표사진 번호 연결
			productImgDao.insert(ProductImgDto.builder()
						.productNo(productDto.getProductNo())
						.imgNo(imgNo1)
					.build());

		}
		// 상품 상세이미지 저장 및 등록
		if(!img2.isEmpty()) {
			// 상세사진 번호 뽑기
			int imgNo2 = imgDao.sequence();
			// 상세사진 파일 이름 설정
			File target2 = new File(dir, String.valueOf(imgNo2));
			img2.transferTo(target2);
			// 상세사진 db에 저장
			imgDao.insert(ImgDto.builder()
					.imgNo(imgNo2)
					.imgName(img2.getOriginalFilename())
					.imgType(img2.getContentType())
					.imgSize(img2.getSize())
				.build());
			// 상품 번호와 상세사진 번호 연결
			detailImgDao.insert(DetailImgDto.builder()
						.productNo(productDto.getProductNo())
						.imgNo(imgNo2)
					.build());
		}
		return "redirect:registerFinish";
	}
	@GetMapping("/productManage/registerFinish")
	public String registerFinish() {
		return "/WEB-INF/views/admin/productManage/registerFinish.jsp";
	}
	
	// 상품 목록
	@GetMapping("/productManage/list")
	public String list(Model model,
			@ModelAttribute("vo") ProductListPaginationVo vo) {
		int totalCount = productDao.selectCount(vo);
		vo.setCount(totalCount);
		List<ProductDto> list = productDao.list(vo);
		model.addAttribute("list", list);
		return "/WEB-INF/views/admin/productManage/list.jsp";
	}
	
	// 상품 삭제
	@GetMapping("/productManage/delete")
	public String delete(@RequestParam int productNo) {
		productDao.delete(productNo);
		return "redirect:list";
	}
	
	// 선택 상품 삭제
	@PostMapping("/productManage/deleteAll")
	public String deleteAll(@RequestParam(value="productNo") List<Integer> list) {
		for(int productNo : list) {
			productDao.delete(productNo);
		}
		return "redirect:list";
	}
	
}
