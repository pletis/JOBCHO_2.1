package org.jobcho.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ViewsController {

	//로그인페이지 
	@GetMapping("/users/login")
	public void loginForm(){
	}
	
	//로그인다음페이지
	@GetMapping("/users/main")
	public void mainForm(){
	}
	
	//회원가입페이지
	@GetMapping("/users/register")
	public void register(){
	}
	
	//비밀번호 찾기 첫번쨰 페이지
	@GetMapping("/users/findPw_1")
	public void findPw_1(){
	}
	
	//비밀번호 찾기 두번째 페이지
	@GetMapping("/users/findPw_2")
	public void findPw_2(){
	}
	
	//비밀번호 찾기 세번째 페이지
	@GetMapping("/users/findPw_3")
	public void findPw_3(){
	}
	
	//회원가입 수정 페이지 
	@GetMapping("/users/update")
	public void updateForm(){
	}
	
	
}
