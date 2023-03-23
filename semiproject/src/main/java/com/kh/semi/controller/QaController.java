package com.kh.semi.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.semi.dao.QaDao;
import com.kh.semi.dto.QaDto;
import com.kh.semi.service.QaService;
import com.kh.semi.vo.QaPaginationVO;

@Controller
@RequestMapping("/qa")
public class QaController {
	
	@Autowired
	private QaDao qaDao;
	
	@Autowired
	private QaService qaService;
	
	@GetMapping("/list")
	public String list(@ModelAttribute("vo") QaPaginationVO vo,
			Model model) {
		
		int totalCount = qaDao.selectCount(vo);
		vo.setCount(totalCount);
		
		// 공지사항 띄울시
//		model.addAttribute("noticeList",qaDao.selectNoticeList(1,2));
		
		//게시글
		List<QaDto>list = qaDao.selectList(vo);
		model.addAttribute("list",list);
		
		return "/WEB-INF/views/qa/list.jsp";
	}
	
	@GetMapping("/detail")
	public String detail(@RequestParam int qaNo,
							Model model, HttpSession session) {
		
		//사용자가 작성자인지 판정 후 전달(JSP)
		QaDto qaDto = qaDao.selectOne(qaNo);
		String memberId = (String)session.getAttribute("memberId");
		
		boolean owner = qaDto.getMemberId() != null
				&& qaDto.getMemberId().equals(memberId);
		model.addAttribute("owner",owner);
		
		String memberRole = (String)session.getAttribute("memberRole");
//		boolean admin = memberRole != null && memberRole.equals("관리자");
//		model.addAttribute("admin",admin);
		
		//조회수 증가
		if(!owner) {
			Set<Integer>memory = (Set<Integer>)session.getAttribute("memory");
			if(memory == null) {
				memory = new HashSet<>();
			}
			if(!memory.contains(qaNo)) {
				qaDao.updateReadCount(qaNo);
				qaDto.setQaRead(qaDto.getQaRead()+1);
				memory.add(qaNo);
			}
			session.setAttribute("memory", memory);
		}
		model.addAttribute("qaDto",qaDto);
		return"/WEB-INF/views/qa/detail.jsp";
	}
	
	@GetMapping("/detail/{qaNo}")
	public String detail2(@PathVariable int qaNo, Model model) {
		model.addAttribute("qaDto",qaDao.selectOne(qaNo));
		return "/WEB-INF/views/qa/detail.jsp";
	}
	
	@GetMapping("/write")
	public String write(@RequestParam(required = false)Integer qaParent,
								Model model) {
		model.addAttribute("qaParent",qaParent);
		return"/WEB-INF/views/qa/write.jsp";
	}
	
	@PostMapping("/write")
	public String write(@ModelAttribute QaDto qaDto,
					@RequestParam List<Integer>attachmentNo,
					HttpSession session, RedirectAttributes attr) {
		
		String memberId = (String)session.getAttribute("memberId");
		qaDto.setMemberId(memberId);
		
		int qaNo = qaService.write(qaDto,  attachmentNo);
		
		attr.addAttribute("qaNo",qaNo);
		return "redirect:detail";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam int qaNo) {
		qaDao.delete(qaNo);
		return "redirect:/qa/list";
	}
	
	@GetMapping("/delete.{boardNo")
	public String delete2(@PathVariable int qaNo) {
		qaDao.delete(qaNo);
		return"redirect:/qa/list";
	}
	
	@GetMapping("/edit")
	public String edit(@RequestParam int qaNo, Model model) {
		model.addAttribute("qaDto",qaDao.selectOne(qaNo));
		return"/WEB-INF/views/qa/edit.jsp";
	}
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute QaDto qaDto,
								RedirectAttributes attr) {
		qaDao.update(qaDto);
		attr.addAttribute("qaNo",qaDto.getQaNo());
		return"redirect:detail";
	}
	
}
