package com.movie.view;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.movie.biz.dto.MemberVO;
import com.movie.biz.dto.MovieVO;
import com.movie.biz.dto.ReviewVO;
import com.movie.biz.dto.ScheduleVO;
import com.movie.biz.dto.SeatVO;
import com.movie.biz.dto.TheaterVO;
import com.movie.biz.dto.TicketingVO;
import com.movie.biz.service.MemberService;
import com.movie.biz.service.MovieService;
import com.movie.biz.service.ReviewService;
import com.movie.biz.service.ScheduleService;
import com.movie.biz.service.SeatService;
import com.movie.biz.service.TheaterService;
import com.movie.biz.service.TicketingService;

import utils.Criteria;
import utils.PageMaker;

@Controller
@SessionAttributes({ "startTime", "endTime", "room", "schedule_numb", "scnt", "title, movie_numb" })
public class TicketingController {

	@Autowired
	private TicketingService ticketingService;

	@Autowired
	private MovieService movieService;

	@Autowired
	private SeatService seatService;

	@Autowired
	private ScheduleService scheduleService;

	@Autowired
	private TheaterService theaterService;
	
	@Autowired
	private ReviewService reviewService;

	@Autowired
	private MemberService memberService;
	/*
	 * 작성자: 허장욱
	 */
	// !!!!!! 예매하기
	@PostMapping("/insert_ticketing")
	public void insertTicketingAction(TicketingVO vo) {
		
		ticketingService.insertTicketing(vo);
	}
	
	/*
	 * 1. 마이페이지
	 */

	// (1) 사용자 마이페이지 메인화면 이동

	/*
	 * // (2) 사용자 예매 내역 출력
	 * 
	 * @GetMapping("/my_ticketing_list") public String ticketingListById(Criteria
	 * criteria, HttpSession session, Model model) { MemberVO member = (MemberVO)
	 * session.getAttribute("loginUser");
	 * 
	 * if(member != null ) { String user_id = member.getId(); List<TicketingVO>
	 * ticketingList = ticketingService.getTicketingListById(criteria, user_id);
	 * 
	 * // (2) 화면에 표시할 페이지 버튼 정보 설정 PageMaker pageMaker = new PageMaker();
	 * pageMaker.setCri(criteria);
	 * pageMaker.setTotalCount(ticketingService.getcountTicketingList(user_id)); //
	 * 총 게시글의 수 저장
	 * 
	 * for (int i=0; i<ticketingList.size(); i++) { ReviewVO review =
	 * reviewService.reviewCheck(user_id, ticketingList.get(i).getNumb());
	 * 
	 * if(review == null) { ticketingList.get(i).setReviewCheck(0); } else {
	 * ticketingList.get(i).setReviewCheck(1); } }
	 * 
	 * model.addAttribute("ticketingList", ticketingList);
	 * model.addAttribute("pageMaker", pageMaker);
	 * 
	 * return "mypage/ticketingList"; } else { return "redirect:login_form"; } }
	 */
	
	// (2) 사용자 예매 상세 내용 출력
	@GetMapping("/my_ticketing_detail")
	public String ticketingDetail(TicketingVO vo, HttpSession session, Model model) {

		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return "redirect:login_form";
		} else {
		
			TicketingVO ticketing = ticketingService.getTicketingDetail(vo.getNumb(),loginUser.getId());
	
			model.addAttribute("ticketingVO", ticketing);
	
			return "mypage/ticketingDetail";
		}
	}

	// (3) 사용자 예매 취소
	@GetMapping("/cancel_ticketing")
	public String cancelTicketing(HttpSession session, TicketingVO vo) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return "redirect:login_form";
		} else {
			ticketingService.cancelTicketing(vo.getNumb());
	
			return "redirect:mypage";
		}
	}

	/*
	 * 2. 예매 페이지
	 */
	// (1) 예매 페이지 출력
	@GetMapping("/ticketing_form")
	public String ticketingView(HttpSession session) {

		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return "redirect:login_form";
		} else {
			return "ticketing/ticketing";
		}
	}

	// (2-1) 모든 지역 목록 출력
	@GetMapping("/get_local_list_ticketing")
	@ResponseBody
	public List<String> ticketingLocalListView(Model model) {

		List<TheaterVO> localList = theaterService.getTheaterLocal();
		List<String> localNames = localList.stream().map(TheaterVO::getLocal).collect(Collectors.toList());
		return localNames;
	}

	// (2-2) 지역 선택 시 지역에 해당하는 극장 목록 출력
	@GetMapping("/get_theater_list_ticketing")
	@ResponseBody
	public ResponseEntity<List<TheaterVO>> theaterListView(@RequestParam("local") String local) {

		List<TheaterVO> theaterList = theaterService.getTheaterList(local);
		return ResponseEntity.ok(theaterList);
	}

	// (2-3) 극장 선택 시 극장에 상영 중인 영화 목록 출력
	@GetMapping("/get_movie_list")
	@ResponseBody
	public ResponseEntity<List<MovieVO>> theaterMovieListView(@RequestParam("theater_numb") int theater_numb) {

		List<MovieVO> movieList = scheduleService.getMovieList(theater_numb);
		return ResponseEntity.ok(movieList);
	}

	// (2-4) 영화 선택시 그 정보에 해당하는 상영 스케줄 출력
	@GetMapping("/get_schedule_list")
	@ResponseBody
	public List<ScheduleVO> getScheduleList(@RequestParam("s_day") String s_day,
			@RequestParam("theater") int theater_numb, @RequestParam("movie_numb") int movie_numb) {
		

		List<ScheduleVO> scheduleList = scheduleService.getScheduleList(s_day, theater_numb, movie_numb);
		for (int i = 0; i < scheduleList.size(); i++) {
			List<Integer> ecnt = scheduleService.getEmptyCntList(scheduleList.get(i).getMovie_numb(),
					scheduleList.get(i).getNumb());
			StringBuilder ecntString = new StringBuilder();
			for (int j = 0; j < ecnt.size(); j++) {
				ecntString.append(ecnt.get(j));
				if (j < ecnt.size() - 1) {
					ecntString.append(", ");
				}
			}
			scheduleList.get(i).setEcnt(ecntString.toString());
		}
		return scheduleList;
	}

	// (3) 좌석 선택 페이지 이동

	// (4) 결제 창 이동
	@GetMapping("go_payments")
	public String goPaymentsView(HttpSession session) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return "redirect:login_form";
		} else {
			return "pay";
		}
	}

	/*
	 * 작성자: 양리나
	 */

	// (3-1) 좌석, 연령안내 출력 팝업
	@RequestMapping(value = "/ticketing_popup", method = RequestMethod.GET)
	public String ticketingFormView(@RequestParam("age") int age, @RequestParam("movie") int movie_numb, @RequestParam("numb") int schedule_numb,
			@RequestParam("scnt") String scnt, @RequestParam("room") String room,
			@RequestParam("startTime") String startTime, @RequestParam("endTime") String endTime,
			@RequestParam("rnumb") int rnumb, Model model, HttpSession session) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return "redirect:login_form";
		} else {
			System.out.println(movie_numb);
			MovieVO movieName = movieService.getMovieName(movie_numb); // 영화 제목
	
			TicketingVO ticketingSummary = ticketingService.getTicketingSummary(schedule_numb); // 예매인원 총합
			List<SeatVO> roomseats = seatService.getSeatList(room); // 해당 상영관의 총 좌석번호
			List<TicketingVO> alreadySeatList = ticketingService.getAlreadySeatList(schedule_numb); // 예약된 좌석 리스트
	
			List<String> alreadySeats = new ArrayList<>(); // 자른 토큰들 배열
	
			for (TicketingVO ticketing : alreadySeatList) { // 리스트 들어올 때 마다
				String seatName = ticketing.getSeat_name(); // 티케팅에 저장된 예매좌석을 seatName에 넣고
				String[] seatToken = seatName.split(","); // ","를 빼서 분할
	
				for (String seat : seatToken) { // 분할 된 토큰
					alreadySeats.add(seat.trim()); // 토큰을 앞뒤 공백 제거하고 배열에 추가
				}
			}
			System.out.println(movieName);
			// 받아온 값들을 모델에 추가
			model.addAttribute("age", age);
			model.addAttribute("movie_numb", movie_numb);
			model.addAttribute("movieName", movieName);
			model.addAttribute("schedule_numb", schedule_numb);
			model.addAttribute("alreadySeats", alreadySeats);
			model.addAttribute("roomseats", roomseats);
			model.addAttribute("scnt", scnt);
			model.addAttribute("room", room);
			model.addAttribute("startTime", startTime);
			model.addAttribute("endTime", endTime);
			model.addAttribute("ticketingSummary", ticketingSummary);
			model.addAttribute("rnumb", rnumb);
	
			return "ticketing/ticketingInfo";
		}
	}

	// (3-2) 예매 인원, 좌석 선택화면
	@RequestMapping(value = "/ticketingChoice", method = RequestMethod.GET)
	public String ticketingChoicePage(Model model, @SessionAttribute("startTime") String startTime,
			@SessionAttribute("endTime") String endTime, @SessionAttribute("room") String room,
			@SessionAttribute("schedule_numb") int schedule_numb, @SessionAttribute("scnt") String scnt,
			@SessionAttribute("title") String title,
			@SessionAttribute("rnumb") int rnumb, HttpSession session) {

		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return "redirect:login_form";
		} else {
			TicketingVO ticketingSummary = ticketingService.getTicketingSummary(schedule_numb); // 예매인원 총합
			List<SeatVO> roomseats = seatService.getSeatList(room); // 해당 상영관의 총 좌석번호
			List<TicketingVO> alreadySeatList = ticketingService.getAlreadySeatList(schedule_numb); // 예약된 좌석 리스트
	
			List<String> alreadySeats = new ArrayList<>(); // 자른 토큰들 배열
	
			for (TicketingVO ticketing : alreadySeatList) { // 리스트 들어올 때 마다
				String seatName = ticketing.getSeat_name(); // 티케팅에 저장된 예매좌석을 seatName에 넣고
				String[] seatToken = seatName.split(","); // ","를 빼서 분할
	
				for (String seat : seatToken) { // 분할 된 토큰
					alreadySeats.add(seat.trim()); // 토큰을 앞뒤 공백 제거하고 배열에 추가
				}
			}
	
			model.addAttribute("alreadySeats", alreadySeats);
			model.addAttribute("roomseats", roomseats);
			model.addAttribute("ticketingSummary", ticketingSummary);
			model.addAttribute("rnumb", rnumb);
			
			return "ticketing/ticketingChoice";
		}
	}

	// (3-3) 결제 전 확인 정보 출력
	@PostMapping("/payment")
	public String paymentPage(Model model, @SessionAttribute("startTime") String startTime,
			@SessionAttribute("endTime") String endTime, @SessionAttribute("room") String room,
			@SessionAttribute("schedule_numb") int schedule_numb, @SessionAttribute("scnt") String scnt,
			@SessionAttribute("title") String title, @SessionAttribute("movie_numb") int movie_numb,
			@RequestParam String selectedSeatsString, @RequestParam String totalPrice,
			@RequestParam (value="totalCount") int p_num, @SessionAttribute("rnumb") int rnumb,
			HttpSession session) {

		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if(loginUser ==null) {
			return "member/login";
		} else {
		
			MovieVO poster = movieService.getPayPoster(movie_numb); // 결제 페이지 영화 포스터
			ScheduleVO theater_numb = scheduleService.getTheaterNumb(schedule_numb);
			TheaterVO theater_name = theaterService.theaterName(theater_numb);
	
			System.out.println(totalPrice);
	
			model.addAttribute("theater_name", theater_name);
			model.addAttribute("totalPrice", totalPrice);
			model.addAttribute("poster", poster);
			model.addAttribute("selectedSeatsString", selectedSeatsString);
			model.addAttribute("rnumb", rnumb);
			
			// 결제 정보 설정
			TicketingVO vo = new TicketingVO();
			vo.setP_num(p_num);
			vo.setPrice(Integer.parseInt(totalPrice));
			vo.setSeat_name(selectedSeatsString);
			vo.setUser_id(loginUser.getId());
			vo.setSchedule_numb(schedule_numb);
			vo.setMovie_numb(movie_numb);
			System.out.println(vo);
			
			model.addAttribute("ticketingVO", vo);
			model.addAttribute("memberVO", loginUser);
			
			return "ticketing/paymentPage";
		}
	}
	
	// (3-4) 결제 및 예매 테이블 등록 진행
		@RequestMapping("/go_payment")
		public String paymentPage(Model model,TicketingVO vo, HttpSession session) {
			MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
			
			if (loginUser == null) {
				return "redirect:login_form";
			} else {
				ticketingService.insertTicketing(vo);
				memberService.insertPoint(loginUser.getId(), vo.getPrice()*0.01);
	
				return "redirect:mypage";
			}
		}
}
