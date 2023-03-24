package com.kh.semi.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.semi.dao.MemberDao;
import com.kh.semi.dto.MemberDto;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberDao memberDao;

//	회원가입
	@GetMapping("/join")
	public String join() {
		return "/WEB-INF/views/member/join.jsp";
	}
	 @PostMapping("/join")
	 public String join(@ModelAttribute MemberDto memberDto) throws IllegalStateException, IOException {
		 //회원가입!
		 
		 return "redirect:joinFinish";
	 }
	
	@GetMapping("/joinFinish")
	public String joinFinish() {
		return "/WEB-INF/views/member/joinFinish.jsp";
	}
//	 로그인
	@GetMapping("/login")  
	public String login() {  
		return "/WEB-INF/views/member/login.jsp";
	}

	@PostMapping("/login")
	public String login(@ModelAttribute MemberDto userDto, RedirectAttributes attr, HttpSession session) {
		MemberDto findDto = memberDao.selectOne(userDto.getMemberId());

		if (findDto == null) {
			attr.addAttribute("mode", "error");
			return "redirect:login";
		}

		if (!userDto.getMemberPw().equals(findDto.getMemberPw())) {
			attr.addAttribute("mode", "error");
			return "redirect:login";
		}

		session.setAttribute("memberId", findDto.getMemberId());
		session.setAttribute("memberRole", findDto.getMemberRole());

		// 최종 로그인 ?? 보류
//		memberDao.updateMemberLogin(findDto.getMemberId());

		return "redirect:/";
	}

//	 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("memberId");
		session.removeAttribute("memberRole");
		return "redirect:/";
	}
	
}