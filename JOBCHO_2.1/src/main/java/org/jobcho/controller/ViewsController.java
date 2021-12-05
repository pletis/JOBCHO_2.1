package org.jobcho.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ViewsController {

	//濡쒓렇�씤�럹�씠吏� 
	@GetMapping("/users/login")
	public void loginForm(){
	}
	
	//濡쒓렇�씤�떎�쓬�럹�씠吏�
	@GetMapping("/users/main")
	public void mainForm(){
	}
	
	//�쉶�썝媛��엯�럹�씠吏�
	@GetMapping("/users/register")
	public void register(){
	}
	
	//鍮꾨�踰덊샇 李얘린 泥ル쾲夷� �럹�씠吏�
	@GetMapping("/users/findPw_1")
	public void findPw_1(){
	}
	
	//鍮꾨�踰덊샇 李얘린 �몢踰덉㎏ �럹�씠吏�
	@GetMapping("/users/findPw_2")
	public void findPw_2(){
	}
	
	//鍮꾨�踰덊샇 李얘린 �꽭踰덉㎏ �럹�씠吏�
	@GetMapping("/users/findPw_3")
	public void findPw_3(){
	}
	
	//�쉶�썝媛��엯 �닔�젙 �럹�씠吏� 
	@GetMapping("/users/update")
	public void updateForm(){
	}
	
	//이메일로 비밀번호 찾기 
	@GetMapping("/users/emailFindPw")
	public void emailFindPw(){
	}
	
	@GetMapping("/team/choose")
	public String teamChoose(){
		return "/team/team";
	}
	
	@GetMapping("/team/main")
	public String teamMain(){
		return "/main";
	}
	
	@GetMapping("/calendar/calendar")
	public String calendar(){
		return "/calendar/calendar";
	}
	
}
