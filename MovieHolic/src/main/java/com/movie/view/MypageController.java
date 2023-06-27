package com.movie.view;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.movie.biz.dto.MemberVO;
import com.movie.biz.dto.ReviewVO;
import com.movie.biz.dto.TicketingVO;
import com.movie.biz.service.MemberService;
import com.movie.biz.service.ReviewService;
import com.movie.biz.service.TicketingService;

import utils.Criteria;
import utils.PageMaker;

@Controller
public class MypageController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private TicketingService ticketingService;
	
	// 마이페이지 표시
	@GetMapping("/mypage")
	public String myPageView(Criteria criteria, HttpSession session, Model model) {
		
		// 로그인이 되어 있는지 확인.
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		// 로그인이 안되어 있는 경우 로그인 페이지로 이동
		if(loginUser == null) {
			
			return "member/login";
		
		}  else {
		
			MemberVO member = new MemberVO();
			
			member = memberService.getMember(loginUser.getId());
			
			model.addAttribute("userDetail", member);
			
			String user_id = member.getId();
			List<TicketingVO> ticketingList = ticketingService.getTicketingListById(criteria, user_id);
	
			// (2) 화면에 표시할 페이지 버튼 정보 설정
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(criteria);
			pageMaker.setTotalCount(ticketingService.getcountTicketingList(user_id)); // 총 게시글의 수 저장
	
			for (int i=0; i<ticketingList.size(); i++) {
				ReviewVO review = 
						reviewService.reviewCheck(user_id, ticketingList.get(i).getNumb());
				
				if(review == null) {
					ticketingList.get(i).setReviewCheck(0);
				} else {
					ticketingList.get(i).setReviewCheck(1);
				}
		}
		System.out.println("리스트: " +ticketingList);
		for (TicketingVO vo : ticketingList) {
			System.out.println(vo);
		}
		
		model.addAttribute("ticketingList", ticketingList);
		model.addAttribute("pageMaker", pageMaker);
			
			return "mypage/mypage";
			
			
		}	
		
	}
	
	
	
	// 회원정보조회 페이지 이동
	@GetMapping("/memberInfo")
	public String memberInfoView(HttpSession session, Model model) {
		
		// 로그인이 되어 있는지 확인.
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
				
		
		
		// 로그인이 안되어 있는 경우 로그인 페이지로 이동
		if(loginUser == null) {
					
			return "member/login";
				
		}  else {
			MemberVO vo = new MemberVO();
			
			vo = memberService.getMember(loginUser.getId());
			
			model.addAttribute("userDetail", vo);
			
			
			return "mypage/memberInfo";
					
					
		}	
				
		
		
		
		
	}
	
	
	
	

	
	
}




