package com.kh.semi.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.semi.advice.RequirePermissionException;
import com.kh.semi.dao.QaDao;
import com.kh.semi.dto.QaDto;
import com.kh.semi.service.QaService;
import com.kh.semi.vo.QaPaginationVO;

@CrossOrigin(origins = {"http://127.0.0.1:5500/"})
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
		
		//게시글
		List<QaDto>list = qaDao.selectList(vo);
		model.addAttribute("list",list);
		return "/WEB-INF/views/qa/list.jsp";
	}
	
	
	@PostMapping("/list")
	public String QaList(Model model,
			@RequestParam(required = false, defaultValue = "name")String column,
			@RequestParam(required = false, defaultValue = "")String keyword) {
		if(keyword.equals("")) {
			model.addAttribute("list", qaDao.selectList());
		}
		else {//키워드가 있다면 -> 검색
			model.addAttribute("column", column);
			model.addAttribute("keyword", keyword);
			model.addAttribute("list", qaDao.selectList(column, keyword));
		}
//		검색 여부와 관계없이 공지사항을 3개 조회해서 Model에 첨부
//		model.addAttribute("noticeList", qaDao.selectNoticeList(1, 3));
			return "/WEB-INF/views/qa/list.jsp";
	}
	
	

	@GetMapping("/detail")
	public String detail(Model model, @RequestParam int qaNo, HttpSession session) {
	    boolean cnt = qaDao.updateReadCount(qaNo);
	    QaDto qaDto = qaDao.selectOne(qaNo);
	    model.addAttribute("qaDto", qaDto);
	    
	    // 게시글 작성자 확인 코드
	    String writerId = qaDto.getMemberId();
	    String memberId = (String)session.getAttribute("memberId");
	    boolean isOwner = memberId != null && memberId.equals(writerId);
	    
	    String qaSecret = qaDto.getQaSecret();
	    
	    String memberRole = (String)session.getAttribute("memberRole");
	    boolean isAdmin = memberRole != null && memberRole.equals("관리자");
	    
	    if (qaSecret.equals("Y")) {
	        // 작성자 본인이거나 관리자라면
	        if (isAdmin || isOwner) {
	        	return "/WEB-INF/views/qa/detail.jsp";
	        }
	        // 조건에 해당하지 않는 경우 모두 차단
	        throw new RequirePermissionException("권한이 없습니다.");
	    } else {
	        // 모두 페이지 이동 가능
	        return "/WEB-INF/views/qa/detail.jsp";
	    }
	}
	

	@PostMapping("/detail")
	public void detailPost(Model model, @RequestParam int qaGroup,HttpServletResponse response) throws JSONException {
	
	//	model.addAttribute("qaDto",qaDao.selectOne(qaNo));
		JSONObject jsonObj = new JSONObject();
		 List<QaDto> list = qaDao.selectGroup(qaGroup);
		
		 //질문
		QaDto qa = list.get(0);		
		jsonObj.put("qaTitle", qa.getQaTitle() );
		jsonObj.put("qaContent", qa.getQaContent());
		jsonObj.put("qaHead", qa.getQaHead());
		jsonObj.put("qaDepth", qa.getQaDepth());
		
		if(list.size() > 1) {
			 QaDto qaAnswer = list.get(1);

			 jsonObj.put("qaAnswerNo", qaAnswer.getQaNo());
			 jsonObj.put("qaAnswer", qaAnswer.getQaAnswer());
			 jsonObj.put("qaAnswerTitle", qaAnswer.getQaTitle());
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter writer;
		try {
			writer = response.getWriter();
			writer.print(jsonObj);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// PUT 요청 처리
	@PutMapping("/update")
	public ResponseEntity<String> updateQa(
			@RequestParam("qaNo") int qaNo,
			 @RequestParam("qaContent")String qaContent) {
	    int count = qaService.updateQa(qaNo,qaContent);
	    if (count > 0) {
	        return ResponseEntity.ok("");
	    } else {
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("");
	    }
	}
	
	// 요청 처리
	@PutMapping("/repleWrite")
	public ResponseEntity<String> repleWrite(
			@RequestParam("qaNo") int qaNo,
			 @RequestParam("replyContent")String replyContent) {
		
		
	    int count = qaService.insertQaReple(qaNo,replyContent);
	    
	    if (count > 0) {
	        return ResponseEntity.ok("");
	    } else {
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("");
	    }
	}

	
	
	@GetMapping("/write")
	public String write(@RequestParam(required = false)Integer qaParent,
								Model model, HttpSession session) {
		 String memberId = (String) session.getAttribute("memberId");
		    if (memberId == null) {
		        throw new RequirePermissionException("권한이 없습니다.");
		    }
		model.addAttribute("qaParent",qaParent);
		
		return"/WEB-INF/views/qa/write.jsp";
	}
	
	@PostMapping("/write")
	public String write(@ModelAttribute QaDto qaDto,
					
					HttpSession session, RedirectAttributes attr) {
		
		String memberId = (String)session.getAttribute("memberId");
		qaDto.setMemberId(memberId);
		
		int qaNo = qaService.write(qaDto);
		
		attr.addAttribute("qaNo",qaNo);
		return "redirect:detail";

	}
	
	
	@GetMapping("/delete")
	public String delete(@RequestParam int qaNo) {
		qaDao.delete(qaNo);
		return "redirect:qa/list";
	}
}