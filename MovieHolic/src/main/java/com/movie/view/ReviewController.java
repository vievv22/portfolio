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
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.biz.dto.MemberVO;
import com.movie.biz.dto.ReviewVO;
import com.movie.biz.service.MemberService;
import com.movie.biz.service.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private MemberService memberService;
	
	// 리뷰 등록 화면 가기
	@GetMapping("/reviewInsertForm")
	public String reviewInsertView(Model model, HttpSession session,
			@RequestParam(value = "movie_numb") int movie_numb,
			@RequestParam(value = "ticketing_numb") int ticketing_numb) {
		
		System.out.println("리뷰작성");
		
		model.addAttribute("movie_numb",movie_numb);
		model.addAttribute("ticketing_numb", ticketing_numb);
		System.out.println(movie_numb);
		
		return "review/r_insert";
	}

	// 리뷰 등록 처리
	@PostMapping("/reviewInsert")
	@ResponseBody
	public String reviewInsert(ReviewVO vo) {
		
		reviewService.inseretReview(vo);
		
		return "success";
	}
	
	// 리뷰 리스트 id별 전체
	@RequestMapping("/reviewList2")
	public String reviewList2(HttpSession session, Model model){
			
		MemberVO member = new MemberVO();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		member = memberService.getMember(loginUser.getId());
		List<ReviewVO> reviewList2 = reviewService.reviewList2(loginUser.getId());
			
		model.addAttribute("userDetail", member);
		model.addAttribute("reviewList2",reviewList2);
		
		return "review/r_list";
	}
	
	// 리뷰 삭제
	@RequestMapping("/deleteReview")
	public String deleteReview(@RequestParam("numb") int numb) {
		reviewService.deleteReview(numb);
		
		return "redirect:reviewList2";
	}
}
