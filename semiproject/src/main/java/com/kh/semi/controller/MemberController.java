package com.kh.semi.controller;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.semi.component.RandomComponent;
import com.kh.semi.dao.MemberDao;
import com.kh.semi.dto.MemberDto;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private RandomComponent RandomComponent;
	@Autowired
	private JavaMailSender sender;




//	회원가입
	@GetMapping("/join")
	public String join() {
		return "/WEB-INF/views/member/join.jsp";
	}
	 @PostMapping("/join")
	 public String join(@ModelAttribute MemberDto memberDto,
			 			@RequestParam(name = "agreePromotion", required = false) String agreePromotion) {
		if (agreePromotion == null) {
		   memberDto.setAgreePromotion("N");
		 }
		else {
		 memberDto.setAgreePromotion("Y");
		}
		 memberDao.insert(memberDto);
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


		return "redirect:/";
	}

//	 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("memberId");
		session.removeAttribute("memberRole");
		return "redirect:/";
	}
//	 아이디 찾기
	 @GetMapping("/findId")
	 public String findId() { 
		 return "/WEB-INF/views/member/findId.jsp";
	 }
	 
	 @PostMapping("/findId")
	 public String findId(@ModelAttribute MemberDto memberDto, 
			 Model model, RedirectAttributes attr) {
		 try {
			 String memberId = memberDao.findId(memberDto);
			 model.addAttribute("findId", memberId);
			 return "/WEB-INF/views/member/findIdResult.jsp";
		 }
		 catch(Exception e) {
			 attr.addAttribute("mode", "error");
			 return "redirect:findId";
		 }
	 }
//	 비밀번호 찾기
	 @GetMapping("/findPw")
	 public String findPw() { 
		 return "/WEB-INF/views/member/findPw.jsp";
	 }
	 
	 @PostMapping("/findPw")
	 public String findPW(RedirectAttributes attr,
		@RequestParam String memberId,
		@RequestParam String memberEmail) {
//		String memberId = memberId;
		MemberDto memberDto = memberDao.selectOne(memberId);
		if(memberDto==null || !memberDto.getMemberEmail().equals(memberEmail)) {
			attr.addAttribute("mode", "error");
			return "redirect:findPw";
		}
		// 이메일이 일치 시 임시 비밀번호 생성
		String temporaryPW = RandomComponent.generateString();
		memberDao.changePassword(memberId, temporaryPW);
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(memberDto.getMemberEmail());
		message.setSubject("[SEMI] 임시 비밀번호 발급");
		message.setText("발급된 임시 비밀번호는 "+temporaryPW+" 입니다. 로그인 후 비밀번호를 반드시 변경해주시길 바랍니다.");
		sender.send(message);
		return "redirect:findPwResult";
		}
		@GetMapping("/findPwResult")
		public String findPwResult() {
			return "/WEB-INF/views/member/findPwResult.jsp";
		}
		
//mypage
	 @GetMapping("/mypage")
	 public String mypage(HttpSession session, Model model) {
		 String memberId = (String) session.getAttribute("memberId");
		 MemberDto memberDto = memberDao.selectOne(memberId);
		 model.addAttribute("memberDto", memberDto);
		 return "/WEB-INF/views/member/mypage.jsp";
	 }
	
	 //비밀번호 변경 기능
	 @GetMapping("/password")
	 public String password() {
		 return "/WEB-INF/views/member/password.jsp";
	 }
	 
	 @PostMapping("/password")
	 public String password(
			 HttpSession session,
			 @RequestParam String currentPw, 
			 @RequestParam String changePw,
			 RedirectAttributes attr) {
		 String memberId = (String)session.getAttribute("memberId");
		 MemberDto memberDto = memberDao.selectOne(memberId);
		 
		 if(!memberDto.getMemberPw().equals(currentPw)) {
			 attr.addAttribute("mode", "error");
			 return "redirect:password";
		 }
		 memberDao.changePassword(memberId, changePw);
		 return "redirect:passwordFinish";		 
	 }
	 
	 
	 @GetMapping("/passwordFinish")
	 public String passwordFinish() {
		 return "/WEB-INF/views/member/passwordFinish.jsp";
	 }
// 회원정보 수정 전 페이지
	 @GetMapping("/pwVf")
	 public String passwordVerify() {
	     return "/WEB-INF/views/member/pwVf.jsp";
	 }

	 @PostMapping("/pwVf")
	 public String verifyPassword(
	         HttpSession session,
	         @RequestParam String password,
	         RedirectAttributes attr) {
	     String memberId = (String)session.getAttribute("memberId");
	     MemberDto memberDto = memberDao.selectOne(memberId);

	     if(!memberDto.getMemberPw().equals(password)) {
	         attr.addAttribute("mode", "error");
	         return "redirect:pwVf";
	     }
	     
	     return "redirect:edit";
	 }

	 
//	 비밀번호를 제외한 나머지 개인정보 변경
	 @GetMapping("/edit")
	 public String edit(
			 HttpSession session,
			 Model model
			) {
		 String memberId = (String) session.getAttribute("memberId");
		 MemberDto memberDto = memberDao.selectOne(memberId);
		 model.addAttribute("memberDto", memberDto);
		 return "/WEB-INF/views/member/edit.jsp";
	 }
	 
	 @PostMapping("/edit")
	 public String edit(
			 @ModelAttribute MemberDto memberDto,
			 HttpSession session,
			 RedirectAttributes attr
		 ) {
		 String memberId = (String)session.getAttribute("memberId");
		 
		 memberDto.setMemberId(memberId);
		 memberDao.changeInformation(memberDto);
		 return "redirect:editFinish";
	 }
	 
	 @GetMapping("/editFinish")
	 public String editFinish() {
		 return "/WEB-INF/views/member/editFinish.jsp";
	 }
	 
//	 회원 탈퇴
	 @GetMapping("/delete")
	 public String delete(HttpSession session) {
		 return "/WEB-INF/views/member/delete.jsp";
	 }
	 
	 @PostMapping("/delete")
	 public String delete(
			 	HttpSession session, 
			 	@RequestParam String memberPw,
			 	RedirectAttributes attr
			 ) {
		 String memberId = (String)session.getAttribute("memberId");
		 MemberDto memberDto = memberDao.selectOne(memberId);
		 
		
		 if(!memberDto.getMemberPw().equals(memberPw)) {
			 attr.addAttribute("mode", "error");
			 return "redirect:delete";
		 }
		 
		
		 memberDao.delete(memberId);
		 
		 session.removeAttribute("memberId");
		 session.removeAttribute("memberRole");
		 
		 return "redirect:deleteFinish";
	 }
	 
	 @GetMapping("/deleteFinish")
	 public String deleteFinish() {
		 return "/WEB-INF/views/member/deleteFinish.jsp";
	 }

}