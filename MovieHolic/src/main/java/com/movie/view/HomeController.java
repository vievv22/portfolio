package com.movie.view;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.movie.biz.dto.NoticeVO;
import com.movie.biz.service.NoticeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private NoticeService noticeService;

	// ���� ȭ������ �̵�
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String home(Model model, NoticeVO vo) {
		
		if(noticeService.getListNoticecustomer().isEmpty()) {
			model.addAttribute("notice", 0);
		} else {
			System.out.println("들어왔냐?");
			NoticeVO noticeVO = noticeService.getListNoticecustomer().get(0);
		
			model.addAttribute("notice", 1);
			model.addAttribute("noticeVO", noticeVO);
		}
		
		return "index";
	}
}
