package com.movie.view;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.movie.biz.dto.MemberVO;
import com.movie.biz.dto.QnaVO;
import com.movie.biz.service.QnaService;

import utils.Criteria;
import utils.PageMaker;

@Controller
@SessionAttributes("loginUser")
public class QnaController {

	@Autowired
	private QnaService qnaService;

	
	
	@GetMapping("/qna_view")
	public String qnaView(QnaVO vo, HttpSession session, Model model) {
		
		
		// 로그인이 되어 있는지 확인.
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
				
		// 로그인이 안되어 있는 경우 로그인 페이지로 이동
		if(loginUser == null) {
					
			return "member/login";
				
		} else {
			
			// Service 파일에 있는 getQna를 가져오면 vo에 담겨있는 qseq를 가지고 조회함
			QnaVO qna = qnaService.getQna(vo.getNumb());
			
			// 화면에 전달할 Qna 목록 저장
			model.addAttribute("qnaVO", qna);
			
			return "qna/qnaView";
		}
		
	}
	
	@GetMapping("/qna_write_form")
	public String qna_write_form(HttpSession session) {
		
		
		// 로그인이 되어 있는지 확인.
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
						
		// 로그인이 안되어 있는 경우 로그인 페이지로 이동
		if(loginUser == null) {
							
			return "member/login";
			
		} else {
			return "qna/qnaWrite";
			
		}
		
		
	}
	
	
	
	@PostMapping("/qna_write")
	public String qnaWriteAction(QnaVO vo, HttpSession session) {
		
		
		// 로그인이 되어 있는지 확인.
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
								
		// 로그인이 안되어 있는 경우 로그인 페이지로 이동
		if(loginUser == null) {
									
			return "member/login";
					
		} else {
		
			// vo에 id정보가 없기 때문에 로그인 되어있는 id를 vo에 저장.
			vo.setUser_id(loginUser.getId());			
			
			// service파일에서 insertqna 실행
			qnaService.insertQna(vo);
				
			
			
			return "redirect:qna_list";
		
		
		}
		
		
	}
	
	
	
	// Qna 리스트 페이징 처리
	@RequestMapping("/qna_list")
	public String adminQnaList(Model model, Criteria criteria, 
		@RequestParam(value="key", defaultValue="") String name, HttpSession session) {
				
		// 로그인이 되어 있는지 확인.
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
				
		// 로그인이 안되어 있는 경우 로그인 페이지로 이동
		if(loginUser == null) {
					
			return "member/login";
				
		} else {
			
		// (1) 페이지별 상품목록 조회
		String userId = loginUser.getId(); // 로그인된 사용자의 아이디 가져오기	
		List<QnaVO> qnaList = qnaService.getListQnaWithPagingUser(criteria, name, userId);
				
				
		// (2) 화면에 표시할 페이지 버튼 정보 설정
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		pageMaker.setTotalCount(qnaService.countQnaListUser(name, userId));

			
		// (2) 내장 객체에 상품 목록 저장
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("qnaListSize", qnaList.size());
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("userDetail", loginUser);
				
				
				
						
		return "qna/qnaList";
		}	
	}
		
	
	// 공지사항 삭제
	@PostMapping("/qna_delete")
	public String qnaDelete(@RequestParam(value="numb") int numb) {
		
		qnaService.deleteQna(numb);
		
		return "redirect:list_admin_qna";
	}
	

	// 공지사항 삭제
	@PostMapping("/qna_delete_member")
	public String memberQnaDelete(@RequestParam(value="numb") int numb) {
		
		qnaService.memberQnaDelete(numb);
		
		return "redirect:qna_list";
	}
	

	
	
	
}

