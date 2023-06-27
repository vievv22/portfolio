package com.movie.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.biz.dto.TheaterVO;
import com.movie.biz.service.TheaterService;

@Controller
public class TheaterController {
	
	@Autowired
	private TheaterService theaterService;

	// (1-1) 극장 목록 화면 이동
	@GetMapping("/get_theater_view")
	public String getTheaterList() {
		
		return "theater/theaterInfo";
	}
	
	
	// (1-2) 지역 목록 출력
	@GetMapping("/get_local_list")
	@ResponseBody
	public List<TheaterVO> getLocalList(){
		
		List<TheaterVO> local = theaterService.getTheaterLocal();
		return local;
	}
	
	// (1-3) 지역에 속한 극장 목록 출력
	@GetMapping("/get_theater_list")
	@ResponseBody
	public List<TheaterVO> getTheaterListByLocal(@RequestParam("local") String local){
		
		List<TheaterVO> theaterList = theaterService.getTheaterList(local);
		return theaterList;
	}
	

	// (1-4) 극장 상세 정보 출력
	@GetMapping("get_theater_detail")
	@ResponseBody
	public TheaterVO getTheaterDetail(@RequestParam("numb") int numb) {
		
		return theaterService.getTheaterDetail(numb);
	}
	
	// (1-5) 극장 선택 시 지도 정보 출력
	@RequestMapping("get_address_map")
	public String getAddressMap(@RequestParam("address") String address, Model model) {
	   
		model.addAttribute("address", address);
	    
	    return "theater/addressMap";
	}
}
