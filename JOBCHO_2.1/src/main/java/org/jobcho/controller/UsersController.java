package org.jobcho.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jobcho.domain.AuthVO;
import org.jobcho.domain.CustomUser;
import org.jobcho.domain.UsersVO;
import org.jobcho.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@RestController
@AllArgsConstructor
@NoArgsConstructor
@RequestMapping("/users/*")
public class UsersController {

	@Autowired
	private UsersService service;
	
//	@Autowired
//	AuthenticationManager authenticationManager;
	
	// 회원가입
	
	@PostMapping("/register")
	public ResponseEntity<Integer> register(@RequestBody UsersVO users) {
		System.out.println(users);
		// 비밀번호 암호화 (인코더)
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		users.setUser_pw(passwordEncoder.encode(users.getUser_pw()));
		// 회원가입
		int re = service.insertUsers(users);
		// 권한부여
		service.insertAuth(users.getUser_email());
		return new ResponseEntity<Integer>(re, HttpStatus.OK);
	}

	// 비밀번호 찾기 첫번째
	@PostMapping("/findPw_1")
	public ResponseEntity<UsersVO> findPw_1(String user_email, HttpServletRequest request) {
		HttpSession session = request.getSession();
		// 이메일 받아서 나온 UsersVO 객체를 다음 페이지에 넘기기 위해 session에 저장
		UsersVO users = service.findUsers(user_email);
		session.setAttribute("users", users);

		System.out.println("비밀번호 찾기" + users);
		return new ResponseEntity<>(users, HttpStatus.OK);
	}

	
	// 비밀번호 찾기 두번째 비동기
	@PostMapping("/findPw_2")
	public ResponseEntity<Integer> findPw_2(HttpServletRequest request, @RequestParam("user_pwHint") String user_pwHint) {
		HttpSession session = request.getSession();
		UsersVO users = (UsersVO) session.getAttribute("users");

		int re = 0;

		if (users.getUser_pwHint().equals(user_pwHint)) {
			re = 1;
		}
		return new ResponseEntity<Integer>(re, HttpStatus.OK);
	}
	
	
	// 비밀번호 찾기 세번째 비동기
	@PostMapping("/findPw_3")
	public ResponseEntity<Integer> findPw_3(HttpServletRequest request, @RequestParam("user_pw") String user_pw) {
		// 비밀번호 암호화 (인코더)
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

		HttpSession session = request.getSession();
		UsersVO users = (UsersVO) session.getAttribute("users");
		users.setUser_pw(passwordEncoder.encode(user_pw));
		int re = service.updatePw(users);
		// 세션 초기화
		session.invalidate();

		return new ResponseEntity<Integer>(re, HttpStatus.OK);
	}
	
	
	//회원수정 -> 비동기 
	@PostMapping("/update")
	public ResponseEntity<Integer> update(@RequestBody UsersVO users, 
		  HttpSession session){
		
		int re = service.updateUsers(users);
		System.out.println("수정완료여부 : " + re);
		
//		Authentication authentication = 
//				authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(users.getUser_name(), users.getUser_pw()));
//		SecurityContextHolder.getContext().setAuthentication(authentication);
//		
		//principal가져오기 
		/*String user_email = principal.getName();
		System.out.println(user_email);
		UsersVO users2 = service.findUsers(user_email);*/

		
		// 비밀번호 암호화 (인코더)
		// BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		// users.setUser_pw(passwordEncoder.encode(users.getUser_pw()));
		
//		Authentication authentication = new UsernamePasswordAuthenticationToken(principal, null, principal.getAuthorities());
//		SecurityContext securityContext = SecurityContextHolder.getContext();
//		securityContext.setAuthentication(authentication);
//		
//		session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
		
		System.out.println(users);
		/*int re = service.updateUsers(users);
		System.out.println("수정완료여부 : " + re);*/
		
		return new ResponseEntity<Integer>(re, HttpStatus.OK);
		
	}
	
	// 아이디 중복체크
	@PostMapping("/idCheck")
	public ResponseEntity<Integer> idCheck(UsersVO users) throws Exception {
		System.out.println(users);
		int re = service.idCheck(users);
		System.out.println(re);
		return new ResponseEntity<Integer>(re, HttpStatus.OK);
	}
	
	
	
	
	
}// endController












