package com.movie.view;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.movie.biz.dto.MemberVO;
import com.movie.biz.service.MailSendService;
import com.movie.biz.service.MemberService;

@Controller
@SessionAttributes("loginUser")
public class MemberController {

	@Autowired
	private MemberService memberService;

	// 약관화면 표시
	@GetMapping(value = "/contract")
	public String contractView() {

		// member 파일 밑에 contract.jsp 라는 뜻
		return "member/contract";
	}

	// 회원가입 화면 표시
	@PostMapping("/join_form")
	public String joinView() {

		return "member/join";
	}

	/*
	 * 로그인 화면표시
	 */
	@GetMapping("/login_form")
	public String loginView() {

		return "member/login";

	}

	/*
	 * 로그인 처리
	 */
	@PostMapping("/login")
	public String loginAction(MemberVO vo, Model model) {

		int result = memberService.loginID(vo);

		if (result == -1) {

			System.out.println("id없음");

		} else if (result == 1) {

			System.out.println("비번 맞음");

		} else if (result == 0) {

			System.out.println("비번이 다름");

		}

		if (result == 1) {// 로그인 성공
			model.addAttribute("loginUser", memberService.getMember(vo.getId())); // 모델에 객체 넣어서 세션에 "loginUser"저장?
			
			if (vo.getId().equals("admin")) {
				return "redirect:adminPage";
			} else {
				return "redirect:index";
			}
		} else {
			return "member/login_fail"; // 로그인 실패	
		}

	}

	/*
	 * 로그아웃 처리
	 */
	@GetMapping("/logout")
	public String logout(SessionStatus status) { // 스프링에서는 세션없앨때 SessionStatus 로 써야됨.

		status.setComplete();

		return "member/login";
	}

	/*
	 * ID 중복체크 화면 표시 및 결과 전송
	 */
	@GetMapping(value = "/id_check_form")
	public String idCheckView(MemberVO vo, Model model) {

		// id 중복확인 조회 , DAO로 가서 id값을 확인
		int result = memberService.confirmID(vo.getId());

		model.addAttribute("message", result);
		model.addAttribute("id", vo.getId());

		return "member/idcheck";

	}
	

	/*
	 * ID 중복체크 작은창에서 한번더 확인 할때
	 */
	@PostMapping("/id_check_form")
	public String idCheckAString(MemberVO vo, Model model) {
		
		
		// id 중복확인 조회 , DAO로 가서 id값을 확인
		int result = memberService.confirmID(vo.getId());

		model.addAttribute("message", result);
		model.addAttribute("id", vo.getId());

		return "member/idcheck";

	}

	// 회원가입 처리
//  <form id="join" action="join" method="post" name="formm"> id 부분
	@PostMapping("/join")
	public String joinAction(MemberVO vo,
			@RequestParam(value="email1") String email1,
			@RequestParam(value="email2") String email2) {
		vo.setEmail(email1 + email2);
		
		memberService.insertMember(vo); // 입력값을 데이터베이스에 저장

		return "member/login"; // 내용처리 후 넘어가는 페이지 login.jsp
	}

	@RequestMapping("/check_email")
	@ResponseBody
	public String checkEmail(@RequestParam(value="email") String email) {
		System.out.println("이메일 확인");
		System.out.println(email);
		String member = memberService.checkEmail(email);
		
		System.out.println("이메일은 과연??" + member);
		if (member == null) {
			System.out.println("사용 가능");
			return "1";
		} else {
			System.out.println("사용 불가");
			return "0";
		}
	}

	
	
	// 아이디 찾기
	@GetMapping("/find_id_form")
	public String findIdFormView() {

		return "member/findId";
	}

	// 비밀번호 찾기
	@GetMapping("find_pwd_form")
	public String findPwdFormView() {

		return "member/findPassword";
	}
	
	
	// 정보입력 후 아이디 찾기 버튼 클릭
	@PostMapping("/find_id")
	public String findIdAction(MemberVO vo, Model model) {

		String id = memberService.selectIdByNameEmail(vo);

		if (id != null) { // 아이디 존재

			model.addAttribute("id", id);
			model.addAttribute("message", 1);

		} else {

			model.addAttribute("message", -1);

		}

		return "member/findResult";
	}

	
	
	
	@PostMapping("/find_pwd")
	public String findPwdAction(MemberVO vo, Model model) {

		String pwd = memberService.selectPwdByIdNameEmail(vo);

		if (pwd != null) {

			model.addAttribute("id", vo.getId());
			model.addAttribute("message", 1);

		} else {

			model.addAttribute("message", -1);

		}

		return "member/findPwdResult";

	}

	
	
	@PostMapping("/change_pwd")
	public String changePwdAction(MemberVO vo) {

		memberService.changePwd(vo);

		return "member/changePwdOk";
	}

	
	// 회원수정 페이지
	@PostMapping("/userUpdate_form")
	public String memberUpdateView(HttpSession session, Model model) {
				
		// 로그인이 되어 있는지 확인.
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
						
				
				
		// 로그인이 안되어 있는 경우 로그인 페이지로 이동
		if(loginUser == null) {
							
			
			
			return "member/login";
						
		}  else {
			MemberVO vo = new MemberVO();
					
			vo = memberService.getMember(loginUser.getId());
					
			model.addAttribute("userDetail", vo);
					
			
			return "mypage/memberUpdate";
							
							
		}	
						
				
				
				
				
	}
	
	// 회원수정 저장
	@PostMapping("/userUpdate")
	public String memberUpdate(HttpSession session, Model model, MemberVO vo) {
					
		// 로그인이 되어 있는지 확인.
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
							
					
					
		// 로그인이 안되어 있는 경우 로그인 페이지로 이동
		if(loginUser == null) {
								
			return "member/login";
							
		}  else {
			
			// 아이디는 위에서 작성된걸로 사용 나머지 값들은 jsp에서 입력된값들을 vo에 저장
			vo.setId(loginUser.getId());

	        	        
			memberService.updateMember(vo);
				
				
			return "redirect:memberInfo";
								
								
		}	
			
		
	}	
		
		// 비밀번호 수정 저장
		@PostMapping("/userPwdUpdate")
		public String memberUpdate2(HttpSession session, Model model, MemberVO vo) {
						
			// 로그인이 되어 있는지 확인.
			MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
								
						
						
			// 로그인이 안되어 있는 경우 로그인 페이지로 이동
			if(loginUser == null) {
									
				return "member/login";
								
			}  else {
				
				// 아이디는 위에서 작성된걸로 사용 나머지 값들은 jsp에서 입력된값들을 vo에 저장
				vo.setId(loginUser.getId());
		        	        
				memberService.updatePwdMember(vo);
					
				
					
				return "redirect:memberInfo";
									
									
			}	
								
						
									
					
					
					
	}
	
	
	
	
	// 회원탈퇴
	@PostMapping("/userDelete_form")
	public String memberDeleteView(HttpSession session, SessionStatus status) {
			
		// 로그인이 되어 있는지 확인.
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
						
				
				
		// 로그인이 안되어 있는 경우 로그인 페이지로 이동
		if(loginUser == null) {
							
			return "member/login";
					
		}  else {
			
				
			memberService.deleteMember(loginUser.getId());
					
			status.setComplete();
					
			return "redirect:index";
							
							
		}	
	
				
				
	}
	
	
	
	
	
	
	// 회원 수정 전 비밀번호 체크
	@PostMapping("/pwdCheck")
	public String memberpwdCheck(HttpSession session, MemberVO vo, Model model) {
						
		// 로그인이 되어 있는지 확인.
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
								
						
						
		// 로그인이 안되어 있는 경우 로그인 페이지로 이동
		if(loginUser == null) {
									
			return "member/login";
								
		}  else {
			
				model.addAttribute("userDetail", loginUser);
					
				return "mypage/memberUpdate";
			}
				
					
			
									
									
	}	

					
	// 회원 수정 전 비밀번호 체크
	@PostMapping("/gopwdCheck")
	public String memberpwdCheck2(HttpSession session, MemberVO vo, Model model) {
						
		// 로그인이 되어 있는지 확인.
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
								
						
						
		// 로그인이 안되어 있는 경우 로그인 페이지로 이동
		if(loginUser == null) {
									
			return "member/login";
								
		}  else {
				
				return "mypage/memberPwdUpdate";
			}
				
					
			
									
									
	}				
				
	
	
	@Autowired
	private MailSendService mailService;
	
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		
		return mailService.joinEmail(email);
	}
	
	
	
	
}

