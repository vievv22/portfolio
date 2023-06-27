package com.movie.view;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.movie.biz.dto.MovieVO;
import com.movie.biz.dto.PosterVO;
import com.movie.biz.dto.ReviewVO;
import com.movie.biz.service.MovieService;
import com.movie.biz.service.PosterService;
import com.movie.biz.service.ReviewService;


@Controller
public class MovieController {

	@Autowired
	private MovieService movieService;
	
	@Autowired
	private PosterService posterService;
	
	@Autowired
	private ReviewService reviewService;
	
	// 영화 목록 조회 예매건수 순
	@RequestMapping("/getMovieList")
	public String getMovieList(MovieVO vo, Model model) {
		
		// (1) 전체 상품목록 조회
		List<MovieVO> getMovieList = movieService.getMovieList(vo);

		// (2) 내장 객체에 상품 목록 저장
		model.addAttribute("getMovieList", getMovieList);
	
		System.out.println(getMovieList);
		// (3) 화면 호출: m_list.jsp"
		return "movie/m_list";
	}
	
	
	// 영화 상세 정보 조회
	@RequestMapping("/movieDetail")
	public String movieDetail(MovieVO vo, Model model) {
		
		// 영화 상세조회
		MovieVO movie = movieService.getMovieDetail(vo.getNumb());
		// 스틸컷 조회
		List<String> stillcut = posterService.stillcutView(vo.getNumb());
		// 리뷰 조회
		List<ReviewVO> reviewVO = reviewService.reviewList(vo.getNumb());
		List<Map<String, Object>> reviewList = new ArrayList<>();
		int totalStars = 0;
		int reviewCount = reviewVO.size();
		
		for (ReviewVO review : reviewVO) {
		    int stars = review.getStars();
		    String userId = review.getUser_id();
		    String comments = review.getComments();

		    totalStars += stars;
		    
		    Map<String, Object> reviewMap = new HashMap<>();
		    reviewMap.put("stars", stars);
		    reviewMap.put("userId", userId);
		    reviewMap.put("comments", comments);

		    reviewList.add(reviewMap);
		}
		double averageStars = 0.0;
		if (reviewCount > 0) {
		    averageStars = (double) totalStars / reviewCount; // 평균 별점 계산
		    averageStars = Math.round(averageStars * 10) / 10.0; // 소수점 첫 번째 자리까지 반올림
		}

		// 값들의 ,를 띄어쓰기+로 바꾸기
	    String director = movie.getDirector().replace(",", ", ");
	    String caster = movie.getCaster().replace(",", ", ");
	    String genre = movie.getGenre().replace(",", ", ");
	    String story = movie.getStory().replace("\r\n", "<br>");
	    String trailer = movie.getTrailer().replace("560", "950").replace("315", "580").replace("\" title", "?autoplay=1&mute=1\" title");

	    System.out.println(director);
	    System.out.println(caster);
	    System.out.println(genre);
	    System.out.println(trailer);
	    System.out.println(story);
	    
	    // model에 수정된 값을 추가합니다.
	    model.addAttribute("director", director);
	    model.addAttribute("caster", caster);
	    model.addAttribute("genre", genre);
	    model.addAttribute("trailer", trailer);
	    model.addAttribute("movieVO", movie);
	    model.addAttribute("stillcut", stillcut);
	    model.addAttribute("reviewList", reviewList);	
	    model.addAttribute("averageStars", averageStars);
	    model.addAttribute("story", story);
	 
		return "movie/m_detail";
	}
	
	// 현재상영/개봉예정 영화 셀렉용
		@RequestMapping("/getMovieList3")
		public String getMovieList3(MovieVO vo, Model model) {

		List<MovieVO> getMovieList3 = movieService.getMovieList3(vo);

		model.addAttribute("getMovieList3", getMovieList3);

		return "movie/allList";
	}
}
