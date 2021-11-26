package org.jobcho.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ViewsController {

	@GetMapping("/users/login")
	public void loginForm(){
	}
	
	
	@GetMapping("/users/main")
	public void mainForm(){
	}
	
}
