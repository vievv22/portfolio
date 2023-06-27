package com.movie.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.movie.biz.dto.NoticeVO;
import com.movie.biz.service.NoticeService;

import utils.Criteria;
import utils.PageMaker;

@Controller
public class NoticeController {


	@Autowired
	private NoticeService noticeService;
	
	
	// 공지사항 리스트 페이징 처리
	@RequestMapping("/notice_list")
	public String adminQnaList(Model model, Criteria criteria, 
		@RequestParam(value="key", defaultValue="") String name) {
					
	
				
		// (1) 페이지별 상품목록 조회
		List<NoticeVO> noticeList = noticeService.getListNoticeWithPaging(criteria, name);
					
					
		// (2) 화면에 표시할 페이지 버튼 정보 설정
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		pageMaker.setTotalCount(noticeService.countNoticeList(name));

				
		// (2) 내장 객체에 상품 목록 저장
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("noticeListSize", noticeList.size());
		model.addAttribute("pageMaker", pageMaker);
					
					
					
							
		return "notice/noticeList";
			
	}
			
	

	// 공지사항 리스트 admin
	@GetMapping("/notice_list_admin")
	public String noticeListadmin(Model model, NoticeVO vo) {
					
	
				
		// (1) 페이지별 상품목록 조회
		List<NoticeVO> noticeList = noticeService.getListNoticeAdmin(vo);
					
		
				
		// (2) 내장 객체에 상품 목록 저장
		model.addAttribute("noticeList", noticeList);
					
					
							
		return "admin/notice/noticeListadmin";
			
	}
	
	
	
	// 공지사항 상세보기
	@GetMapping("/notice_view")
	public String noticeView(NoticeVO vo, Model model) {
		
		// Service 파일에 있는 getNotice를 가져오면 vo에 담겨있는 Numb를 가지고 조회함
		NoticeVO notice = noticeService.getNotice(vo.getNumb());
			
		// 화면에 전달할  목록 저장
		model.addAttribute("noticeVO", notice);
			
		return "notice/noticeView";
		
		
	}
	
	
	// 공지사항 admin 상세보기
	@GetMapping("/notice_view_admin")
	public String noticeViewAdmin(NoticeVO vo, Model model) {
		
		// Service 파일에 있는 getNotice를 가져오면 vo에 담겨있는 Numb를 가지고 조회함
		NoticeVO notice = noticeService.getNotice(vo.getNumb());
			
		// 화면에 전달할  목록 저장
		model.addAttribute("noticeVO", notice);
			
		return "admin/notice/noticeViewadmin";
		
		
	}
	
	
	
	
	// 공지사항 등록 폼으로 넘어가기
	@GetMapping("notice_write_form")
	public String noticeWriteForm() {
		
	
		return "admin/notice/noticeWrite"; // 내용처리 후 넘어가는 페이지 
		
		
		
	}
	
	// 공지사항 등록
	@PostMapping("/notice_write")
	public String noticeWrite(NoticeVO vo) {
		
		noticeService.insertnotice(vo); // 입력값을 데이터베이스에 저장

		return "redirect:notice_list_admin"; // 내용처리 후 넘어가는 페이지 
		
	
	}
	
	// 공지사항 삭제
	@PostMapping("/notice_delete")
	public String noticeDelete(@RequestParam(value="numb") int numb) {
		
		noticeService.deleteNotice(numb);
		
		return "redirect:notice_list_admin";
	}
	
	// 공지사항 수정 폼 이동
	@RequestMapping("/notice_update")
	public String noticeUpdateForm(@RequestParam(value="numb") int numb, Model model) {
		
		// Service 파일에 있는 getNotice를 가져오면 vo에 담겨있는 Numb를 가지고 조회함
			NoticeVO notice = noticeService.getNotice(numb);
				
			// 화면에 전달할  목록 저장
			model.addAttribute("noticeVO", notice);
				
			return "admin/notice/noticeUpdate";
	}
	
	@PostMapping("/notice_update_action")
	public String noticeUpdateAction(NoticeVO vo) {
		System.out.println(vo);
		noticeService.updateNotice(vo);
		
		return "redirect:notice_list_admin";
	}
	

	// 고객센터 홈(공지 최신 5개 표시)
	@GetMapping("/customer")
	public String customerForm(NoticeVO vo, Model model) {

		List<NoticeVO> noticeList = noticeService.getListNoticecustomer();
		

			
		// 화면에 전달할  목록 저장
		model.addAttribute("noticeVO", noticeList);
		
			
		System.out.println(noticeList);
		
		
		return "notice/customer";
		
		
	}
	
	

	
	
	
	
	
}
