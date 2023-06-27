package com.movie.view;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.multipart.MultipartFile;

import com.movie.biz.dto.MemberVO;
import com.movie.biz.dto.MovieVO;
import com.movie.biz.dto.PosterVO;
import com.movie.biz.dto.QnaVO;
import com.movie.biz.dto.RoomVO;
import com.movie.biz.dto.ScheduleVO;
import com.movie.biz.dto.SeatVO;
import com.movie.biz.dto.TheaterVO;
import com.movie.biz.dto.TicketingVO;
import com.movie.biz.service.AdminService;
import com.movie.biz.service.MemberService;
import com.movie.biz.service.MovieService;
import com.movie.biz.service.PosterService;
import com.movie.biz.service.QnaService;
import com.movie.biz.service.RoomService;
import com.movie.biz.service.ScheduleService;
import com.movie.biz.service.SeatService;
import com.movie.biz.service.TheaterService;
import com.movie.biz.service.TicketingService;

import utils.Criteria;
import utils.PageMaker;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private MemberService memberService;

	@Autowired
	private TheaterService theaterService;

	@Autowired
	private ScheduleService scheduleService;

	@Autowired
	private MovieService movieService;

	@Autowired
	private TicketingService ticketingService;

	@Autowired
	private RoomService roomService;

	@Autowired
	private SeatService seatService;

	@Autowired
	private PosterService posterService;

	
	/*
	 * 1. 예매 (O)
	 */
	// (1) 모든 예매 목록 출력
	@GetMapping("/get_all_ticketing_list")
	public String getAllTicketingView(HttpSession session, Criteria criteria, Model model,
			@RequestParam(value="select", defaultValue = "10") int select,
			@RequestParam(value="id", defaultValue = "") String id) {
		
		System.out.println(select);
		System.out.println(id);

		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return "redirect:login_form";
		} else {
			
			criteria.setRowsPerPage(select);
			List<TicketingVO> allTicketingList = 
					ticketingService.getAllTicketingList(criteria, id);
			
			// 화면에 표시할 페이지 버튼 정보 설정
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(criteria);
			pageMaker.setTotalCount(ticketingService.getAllcountTicketingList(id)); // 총 게시글의 수 저장
	
			model.addAttribute("allTicketingList", allTicketingList);
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("selectedValue", select);
			model.addAttribute("id", id);
	
			return "admin/ticketing/allTicketingList";
		}
	}

	/*
	 * 2. 극장
	 */
	// (1-1) 극장 등록 화면 이동
	@GetMapping("/insert_theater_form")
	public String insertTheaterView(HttpSession session) {

		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return "redirect:login_form";
		} else {
			return "admin/theater/theaterInsert";
		}
	}

	// (1-2) 극장명 중복확인
	@GetMapping("/get_check_theater_name")
	@ResponseBody
	public boolean checkTheaterName(@RequestParam("name") String name) {

		return theaterService.getTheaterNumbById(name) != null;
	}

	// (1-3) 극장 등록 액션
	@PostMapping("/insert_theater")
	public String insertTheaterAction(HttpSession session, TheaterVO vo, @RequestParam("seats") int[] seats) {

		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return "redirect:login_form";
		} else {
			// (1) 최초 극장 등록: 관의 수와, 좌석의 수 합계 계산하여 관 등록
			int totalSeat = 0;
	
			for (int seat : seats) {
				totalSeat += seat;
			}
			vo.setRoom(seats.length);
			vo.setSeat(totalSeat);
	
			theaterService.insertTheater(vo);
	
			// (2) 관 등록: 최초 1관부터 입력받은 행만큼 +1로 반복등록, 좌석 수 입력
			// theater_numb는 db에서 local 이름으로 조회해서 가져와서 등록
			int theater_numb = theaterService.getTheaterNumbById(vo.getName()).getNumb();
	
			for (int i = 0; i < seats.length; i++) {
				RoomVO room = new RoomVO();
				room.setNumb(i + 1);
				room.setCnt(seats[i]);
				room.setTheater_numb(theater_numb);
				roomService.insertRoom(room);
			}
			/*
			 * (3) 좌석 등록: id=seq 자동주입 name=입력받은 수만큼 12개씩 끊어서 자동증가 room_id= 가져오기
			 */
	
			List<Integer> room_id = roomService.getRoomNumbByTheater(theater_numb);
	
			String[] alphabet = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L" };
			int rowsPerSet = 12; // 한 세트당 행 개수
			int set = 0;
	
			for (int i = 0; i < room_id.size(); i++) {
				int setCount = seats[i] / rowsPerSet;
				int remainingRows = seats[i] % rowsPerSet;
	
				for (set = 0; set < setCount; set++) {
					for (int row = 1; row <= rowsPerSet; row++) {
						SeatVO seat = new SeatVO();
						seat.setRoom_id(room_id.get(i));
						String setName = alphabet[set] + row;
						seat.setName(setName);
						seatService.insertSeat(seat);
					}
				}
	
				for (int row = 1; row <= remainingRows; row++) {
					SeatVO seat = new SeatVO();
					seat.setRoom_id(room_id.get(i));
					String setName = alphabet[set] + row;
					seat.setName(setName);
					seatService.insertSeat(seat);
				}
			}
	
			return "redirect:admin_theater_list";
		}
	}

	// (2) 극장 목록 화면 이동
	@GetMapping("admin_theater_list_view")
	public String getAdminTheaterList(HttpSession session) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return "redirect:login_form";
		} else {
			return "admin/theater/theaterDetail";
		}
	}

	// (3-1) 극장 상세 정보 출력
	@GetMapping("get_admin_theater_detail")
	@ResponseBody
	public TheaterVO getTheaterDetail(@RequestParam("numb") int numb) {

		return theaterService.getTheaterDetail(numb);
	}

	// (4) 극장 폐점 처리
	@GetMapping("get_admin_update_theater")
	@ResponseBody
	public void updateTheaterStatus(@RequestParam("numb") int numb) {

		theaterService.updateTheater(numb);
	}

	/*
	 * 3. 룸
	 */
	// 극장의 룸 정보 조회
	@GetMapping("/get_admin_room_list")
	@ResponseBody
	public List<RoomVO> getRoomListByTheater(@RequestParam("numb") int t_numb) {

		List<RoomVO> roomList = roomService.getRoomListByTheater(t_numb);

		return roomList;
	}

	/*
	 * 4. 스케쥴
	 */
	// (1-1) 상영 일정 등록페이지 이동
	@GetMapping("/insert_schedule_form")
	public String insertScheduleView(HttpSession session) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return "redirect:login_form";
		} else {
			return "admin/schedule/scheduleInsert";
		}
	}

	// (1-2) 개봉일 영화 목록 출력
	@GetMapping("/get_open_movie_list")
	@ResponseBody
	public List<MovieVO> getOpenMovieList() {

		return movieService.getAllMovieList();
	}

	// (1-3) 모든 지역 목록 출력
	@GetMapping("/get_admin_local_list")
	@ResponseBody
	public List<TheaterVO> getLocalList() {

		List<TheaterVO> local = theaterService.getTheaterLocal();
		return local;
	}

	// (1-4) 지역에 속한 극장 목록 출력
	@GetMapping("/get_admin_theater_list")
	@ResponseBody
	public List<TheaterVO> getAdminTheaterListByLocal(@RequestParam("local") String local) {

		List<TheaterVO> theaterList = theaterService.getTheaterList(local);
		return theaterList;
	}

	// (1-5) 극장에 존재하는 관 목록 출력
	// 합쳐야할지 확인 필요
	@GetMapping("/get_admin_room_lists")
	@ResponseBody
	public List<RoomVO> getAdminRoomListByTheater(@RequestParam("theater") int theater) {

		List<RoomVO> roomList = theaterService.getRoomListByTheater(theater);
		return roomList;
	}

	// (1-6) 입력받은 날짜 중복확인
	@PostMapping("/get_check_schedule")
	@ResponseBody
	public String checkSchedule(ScheduleVO vo) {

		System.out.println(vo);
		String result = null;
		if (vo.getStart_day().equals("")) {
			ScheduleVO scheduleList = scheduleService.getCheckSchedule(vo);

			System.out.println(scheduleList);
			if (scheduleList != null) {
				result = "1";
			} else {
				result = "0";
			}
		} else if (vo.getS_day().equals("")) {
			// 시작일과 종료일 가져오기
			String startDay = vo.getStart_day();
			String endDay = vo.getEnd_day();

			// 시작일과 종료일 사이의 일수 계산
			LocalDate startDate = LocalDate.parse(startDay);
			LocalDate endDate = LocalDate.parse(endDay);
			int numOfDays = Period.between(startDate, endDate).getDays() + 1;

			for (int i = 0; i < numOfDays; i++) {
				LocalDate currentDate = startDate.plusDays(i);
				String currentDateString = currentDate.toString();
				vo.setS_day(currentDateString);

				ScheduleVO scheduleList = scheduleService.getCheckSchedule(vo);

				if (scheduleList != null) {
					result = "1";
				} else {
					result = "0";
				}
			}
		}
		System.out.println(result);
		return result;
	}

	// (1-7) 일정 등록 처리
	@PostMapping("/insert_schedule")
	public String insertSchedule(ScheduleVO vo,HttpSession session) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return "redirect:login_form";
		} else {
			if (vo.getStart_day().equals("")) {
				for (int i = 0; i < vo.getStart_times().length; i++) {
					vo.setStart_time(vo.getStart_times()[i]);
					vo.setEnd_time(vo.getEnd_times()[i]);
	
					System.out.println("단일등록:" + vo);
					scheduleService.insertSchedule(vo);
				}
			} else if (vo.getS_day().equals("")) {
				// 시작일과 종료일 가져오기
				String startDay = vo.getStart_day();
				String endDay = vo.getEnd_day();
	
				// 시작일과 종료일 사이의 일수 계산
				LocalDate startDate = LocalDate.parse(startDay);
				LocalDate endDate = LocalDate.parse(endDay);
				int numOfDays = Period.between(startDate, endDate).getDays() + 1;
	
				for (int i = 0; i < numOfDays; i++) {
					LocalDate currentDate = startDate.plusDays(i);
					String currentDateString = currentDate.toString();
					vo.setS_day(currentDateString);
	
					for (int j = 0; j < vo.getStart_times().length; j++) {
						vo.setStart_time(vo.getStart_times()[j]);
						vo.setEnd_time(vo.getEnd_times()[j]);
	
						scheduleService.insertSchedule(vo);
	
						System.out.println("다중등록:" + vo);
					}
				}
			}
	
			String theaterName = vo.getTheater_name();
			String encodedTheaterName = null;
			try {
				encodedTheaterName = URLEncoder.encode(theaterName, StandardCharsets.UTF_8.toString());
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			String redirectURL = "redirect:theater_schedule_list?theater_name=" + encodedTheaterName;
	
	
			return redirectURL;
		}
	}

	// (2-1) 상영 일정 목록 출력: 극장 리스트 출력
	@GetMapping("/admin_theater_list")
	public String getTheaterListForSchedule(HttpSession session, Model model) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return "redirect:login_form";
		} else {

			List<TheaterVO> theaterList = theaterService.getTheaterList("");
	
			model.addAttribute("theaterList", theaterList);
	
			return "admin/theater/theaterList";
		}
	}

	// (2-2) 극장별 상영 일정 목록 출력
	@GetMapping("/theater_schedule_list")
	public String getScheduleListbyTheater(HttpSession session, Criteria criteria, Model model, 
			@RequestParam("theater_name") String theater_name,
			@RequestParam(value="select", defaultValue = "10") int select,
			@RequestParam(value="title", defaultValue = "") String title) throws ParseException {

		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return "redirect:login_form";
		} else {
			System.out.println("select : " + select);
			int count = scheduleService.getScheduleListByTheaterCount(theater_name, title);
			criteria.setRowsPerPage(select);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(criteria);
			pageMaker.setTotalCount(count);
			
			List<ScheduleVO> scheduleList = scheduleService.getScheduleListByTheater(criteria, theater_name, title);
			
	
			
			
			for (int i=0; i<scheduleList.size(); i++) {
				int result = scheduleService.checkDeleteSchedule(scheduleList.get(i).getNumb());
				scheduleList.get(i).setCount(result);
			}
			
			model.addAttribute("scheduleList", scheduleList);
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("selectedValue", select);
			model.addAttribute("title", title);
	
	
			return "admin/schedule/scheduleList";
		}
	}

	// (2-3) 상영 일정 삭제
	@GetMapping("/delete_schedule")
	public String deleteSchedule(HttpSession session, @RequestParam("numb") int numb, @RequestParam("theater_name") String theater_name) {
		
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return "redirect:login_form";
		} else {
			scheduleService.deleteSchedule(numb);
			
			String theaterName =theater_name;
			String encodedTheaterName = null;
			try {
				encodedTheaterName = URLEncoder.encode(theaterName, StandardCharsets.UTF_8.toString());
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			String redirectURL = "redirect:theater_schedule_list?theater_name=" + encodedTheaterName;
	
			return redirectURL;
		}
	}

	/*
	 * 작성자: 조윤서
	 */
	// 영화 등록 화면 가기
		@GetMapping("/movieInsertForm")
		public String movieInsertView(HttpSession session) {
			MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
			
			if (loginUser == null) {
				return "redirect:login_form";
			} else {
				return "admin/movie/m_insert";
			}
		}

		// 영화 등록 처리
		@PostMapping("/movieInsert")
		public String movieInsertAction(MovieVO vo, PosterVO vo2, HttpSession session,
				@RequestParam(value = "story", defaultValue = "") String story,
				@RequestParam(value = "poster", defaultValue = "") MultipartFile uploadFile,
				@RequestParam(value = "stillcut_name", defaultValue = "") MultipartFile[] uploadFiles) {

			story = story.replace("\r\n","<br>");
			System.out.println(story);
			
			MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
			
			if (loginUser == null) {
				return "redirect:login_form";
			} else {

				// 업로드 파일이 업로드 되었는지 확인
				if (!uploadFile.isEmpty()) {
					String poster_url = uploadFile.getOriginalFilename();
					System.out.println(poster_url);
					vo.setPoster_url(poster_url);// 파일명을 추출하여 저장
		
					// 이미지를 저장할 위치 지정
					String image_path = session.getServletContext().getRealPath("WEB-INF/resources/movie_images/");
					System.out.println("image_path = " + image_path);
		
					try {
						uploadFile.transferTo(new File(image_path + poster_url));
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
		
				}
		
				// 입력한 영화정보 저장
				movieService.movieInsert(vo);
				System.out.println(vo.getStory());

				int numb = movieService.numbselect2();
		
				for (MultipartFile uploadFile2 : uploadFiles) {
					if (!uploadFile2.isEmpty()) {
						String stillcut = uploadFile2.getOriginalFilename();
						System.out.println(stillcut);
		
						vo2.setMovie_numb(numb);
						vo2.setStillcut(stillcut);
		
						String image_path = session.getServletContext().getRealPath("WEB-INF/resources/stillcut_images/");
						System.out.println("image_path = " + image_path);
		
						try {
							uploadFile2.transferTo(new File(image_path + stillcut));
						} catch (IllegalStateException | IOException e) {
							e.printStackTrace();
						}
					}
		
					posterService.stillcutInsert(vo2);
		
				}
				return "redirect:admin_movie_list";
			}

		}// movieInsertAction

		// 영화 리스트
		@RequestMapping("/admin_movie_list")
		public String adminMovieList(HttpSession session, @RequestParam(value = "key", defaultValue = "") String title, Criteria criteria,
				Model model) {
			MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
			
			if (loginUser == null) {
				return "redirect:login_form";
			} else {

				List<MovieVO> movList = movieService.getListMovieWithPaging(criteria, title);
		
				PageMaker pageMaker = new PageMaker();
				pageMaker.setCri(criteria);
				pageMaker.setTotalCount(movieService.countMovieList(title)); // 총 게시글 수 저장
		
				model.addAttribute("movieList", movList);
				model.addAttribute("movieListSize", movList.size());
				model.addAttribute("pageMaker", pageMaker);
		
				return "admin/movie/m_list";
			}

		}

		// 영화 상세 정보 조회
		@RequestMapping("/admin_movie_detail")
		public String adminMovieDetail(HttpSession session, Criteria cri, MovieVO vo, Model model) {
			MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
			
			if (loginUser == null) {
				return "redirect:login_form";
			} else {

				MovieVO movie = movieService.getMovieDetail2(vo);
				List<String> stillcut = posterService.stillcutView(vo.getNumb());
		
				// 값들의 ,를 띄어쓰기+로 바꾸기
				String director = movie.getDirector().replace(",", ", ");
				String caster = movie.getCaster().replace(",", ", ");
				String genre = movie.getGenre().replace(",", ", ");
				String story = movie.getStory().replace("<br>", "\r\n");
		
				model.addAttribute("director", director);
				model.addAttribute("caster", caster);
				model.addAttribute("genre", genre);
				model.addAttribute("movieVO", movie);
				model.addAttribute("criteria", cri);
				model.addAttribute("stillcut", stillcut);
				model.addAttribute("story", story);
		
				return "admin/movie/m_detail";
			}
		}

		// 영화 정보 수정폼 가기
		@RequestMapping("/admin_movie_update_form")
		public String adminMovieUpdateView(HttpSession session, MovieVO vo, Model model) {
			MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
			
			if (loginUser == null) {
				return "redirect:login_form";
			} else {

				MovieVO movie = movieService.getMovieDetail(vo.getNumb());
				List<String> stillcut = posterService.stillcutView(vo.getNumb());
		
				String[] casterArray = movie.getCaster().split(",");
				List<String> casterList = new ArrayList<>();
				for (String value : casterArray) {
					casterList.add(value.trim());
				}
		
				String[] genreArray = movie.getGenre().split(",");
				List<String> genreList = new ArrayList<>();
				for (String value : genreArray) {
					genreList.add(value.trim());
				}
		
				System.out.println(genreList);
		
				// 영화 개봉일을 yyyy-MM-dd 형식의 문자열로 변환
				SimpleDateFormat targetFormat = new SimpleDateFormat("yyyy-MM-dd");
				String formattedOpendate = targetFormat.format(movie.getOpendate());
		
				model.addAttribute("movieVO", movie);
				model.addAttribute("stillcut", stillcut);
				model.addAttribute("casterArray", casterArray);
				model.addAttribute("genreList", genreList);
				model.addAttribute("formattedOpendate", formattedOpendate);
		
				return "admin/movie/m_update";
			}
		}

		// 영화 수정 처리
		@RequestMapping("/movieUpdate")
		public String movieUpdate(MovieVO vo, HttpSession session, @RequestParam(value = "nonmakeImage") String org_image,
				@RequestParam(value = "poster_image") MultipartFile uploadFile,
				@RequestParam(value = "story", defaultValue = "") String story,
				@RequestParam(value = "stillcut_image", defaultValue = "") MultipartFile[] uploadFiles,
				@RequestParam(value = "deletedStillcuts", required = false) String deletedStillcuts, PosterVO vo2) {
			story = story.replace("\r\n","<br>");
			MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
			
			if (loginUser == null) {
				return "redirect:login_form";
			} else {

				// 업로드 파일이 업로드 되었는지 확인
				if (!uploadFile.isEmpty()) {
					String poster_url = uploadFile.getOriginalFilename();
					System.out.println(poster_url);
					vo.setPoster_url(poster_url);// 파일명을 추출하여 저장
		
					// 이미지를 저장할 위치 지정
					String image_path = session.getServletContext().getRealPath("WEB-INF/resources/movie_images/");
					System.out.println("image_path = " + image_path);
		
					try {
						uploadFile.transferTo(new File(image_path + poster_url));
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
		
				} else {
					vo.setPoster_url(org_image);
				}
		
				movieService.movieUpdate(vo);
		
				int movie_numb = movieService.numbselect(vo.getTitle());
				System.out.println(movie_numb);
		
				for (MultipartFile uploadFile2 : uploadFiles) {
					if (!uploadFile2.isEmpty()) {
						String stillcut = uploadFile2.getOriginalFilename();
						System.out.println(stillcut);
		
						vo2.setMovie_numb(movie_numb);
						vo2.setStillcut(stillcut);
		
						String image_path = session.getServletContext().getRealPath("WEB-INF/resources/stillcut_images/");
						System.out.println("image_path = " + image_path);
		
						try {
							uploadFile2.transferTo(new File(image_path + stillcut));
						} catch (IllegalStateException | IOException e) {
							e.printStackTrace();
						}
					}
		
					posterService.stillcutInsert(vo2);
		
				}
		
				if (deletedStillcuts != null && !deletedStillcuts.isEmpty()) {
					String[] deletedStillcutsArray = deletedStillcuts.split(",");
		
					for (String stillcut : deletedStillcutsArray) {
						String trimmedStillcut = stillcut.trim();
						posterService.stillcutdelete(movie_numb, trimmedStillcut);
					}
				}
		
				return "redirect:admin_movie_list";
			}

		}

		@RequestMapping("/getMovieListP")
		public String getMovieListP(HttpSession session, MovieVO vo, Model model) {
			MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
			
			if (loginUser == null) {
				return "redirect:login_form";
			} else {
		
				List<MovieVO> getMovieList = movieService.getMovieList2(vo);
		
				model.addAttribute("getMovieList", getMovieList);
		
				return "admin/poster/p_insert";
			}
		}
	/*
	 * 작성자: 정영훈
	 */
	// admin페이지 표시
		@GetMapping("/adminPage")
		public String myPageView(HttpSession session, Model model) {
			
			// 로그인이 되어 있는지 확인.
			MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
			
			// 로그인이 안되어 있는 경우 로그인 페이지로 이동
			if(loginUser == null) {
				
				return "member/login";
			
			}  else if ("admin".equals(loginUser.getId())) { // 아이디가 "admin"인 경우
				TicketingVO ticketing = ticketingService.getTotalCount();
				MemberVO member = memberService.getTotalUserCount();
				QnaVO qna = qnaService.getTotalQnaCount();
				List<TicketingVO> ticketingList = ticketingService.getTicketingCountByMovie();
				
				List<TicketingVO> ticketingMonthList = new ArrayList<>();
				
				for(int i=1; i<=12; i++) {
					ticketingMonthList.add(ticketingService.getTotalPriceByMonth(i));
				}
				
				
				System.out.println(ticketingMonthList);
				
				model.addAttribute("ticketingVO", ticketing);
				model.addAttribute("memberVO", member);
				model.addAttribute("qnaVO", qna);
				model.addAttribute("ticketingList", ticketingList);
				model.addAttribute("ticketingMonthList", ticketingMonthList);
				
		        return "admin/main";
		    } else {
		        //고객이라면 홈으로 이동
		        return "index";
		    }
		}
		
		

		
		// Qna = admin - qnaList에서 상세보기 
		@GetMapping("/admin_qna_detail")
		public String adminQnaDetail(HttpSession session, @RequestParam("numb") int numb, QnaVO vo, Model model) {
			// 로그인이 되어 있는지 확인.
			MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
			
			// 로그인이 안되어 있는 경우 로그인 페이지로 이동
			if(loginUser == null) {
				
				return "member/login";
			
			} else {
				QnaVO qna = qnaService.getQna(numb);
				
				model.addAttribute("qnaVO", qna);
				
				return "admin/qna/qnaDetail";
			}
		}
		
		
		
		
		/*
		 *  QnA = 게시글 답변 작성
		 * 
		 */
		@PostMapping("/admin_qna_repsave")
		public String adminQnaRepsave(HttpSession session, QnaVO vo) {
			MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
			
			if (loginUser == null) {
				return "redirect:login_form";
			} else {
				qnaService.updateQna(vo);
						
				return "redirect:list_admin_qna";
			}
			
		}
		
		
		
		// 회원 리스트 페이징 처리(관리자) 
		@RequestMapping("/member_admin_list")
		public String adminMemberList(HttpSession session, MemberVO vo, Model model, Criteria criteria, 
				@RequestParam(value="key", defaultValue="") String name) {
			MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
			
			if (loginUser == null) {
				return "redirect:login_form";
			} else {
		
				// (1) 페이지별 상품목록 조회
				List<MemberVO> memberList = memberService.getListMemberWithPaging(criteria, name);
				
				
				// (2) 화면에 표시할 페이지 버튼 정보 설정
				PageMaker pageMaker = new PageMaker();
				pageMaker.setCri(criteria);
				pageMaker.setTotalCount(memberService.countMemberList(name));
	
				
				// (2) 내장 객체에 상품 목록 저장
				model.addAttribute("memberList", memberList);
				model.addAttribute("memberListSize", memberList.size());
				model.addAttribute("pageMaker", pageMaker);
				
				
				
						
				return "admin/member/memberList";
			}
			
		}
		
		
		// Qna 리스트 페이징 처리(관리자) 
			@RequestMapping("/list_admin_qna")
			public String adminQnaList(HttpSession session, Model model, Criteria criteria, 
					@RequestParam(value="key", defaultValue="") String name) {
				MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
				
				if (loginUser == null) {
					return "redirect:login_form";
				} else {
			
					// (1) 페이지별 상품목록 조회
					List<QnaVO> qnaList = qnaService.getListQnaWithPaging(criteria, name);
					
					
					// (2) 화면에 표시할 페이지 버튼 정보 설정
					PageMaker pageMaker = new PageMaker();
					pageMaker.setCri(criteria);
					pageMaker.setTotalCount(qnaService.countQnaList(name));
	
					
					// (2) 내장 객체에 상품 목록 저장
					model.addAttribute("qnaList", qnaList);
					model.addAttribute("qnaListSize", qnaList.size());
					model.addAttribute("pageMaker", pageMaker);
					
							
					return "admin/qna/qnaList";
				}
				
			}
			
			// footer
			@RequestMapping("/megaboxinfo")
			public String megaboxinfo() {
				
				return "etc/megaboxinfo";
			}
			
			@RequestMapping("/recruit")
			public String recruit() {
				
				return "etc/recruit";
			}
			
			@RequestMapping("/socialcontribution")
			public String socialcontribution() {
				
				return "etc/socialcontribution";
			}
			
			@RequestMapping("/partner")
			public String partner() {
				
				return "etc/partner";
			}
			
			@RequestMapping("/support_terms")
			public String support_terms() {
				
				return "etc/support_terms";
			}
			
			@RequestMapping("/support_lcinfo")
			public String support_lcinfo() {
				
				return "etc/support_lcinfo";
			}
			
			@RequestMapping("/privacy")
			public String privacy() {
				
				return "etc/privacy";
			}
		
}
