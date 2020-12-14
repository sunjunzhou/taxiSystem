package com.snowsoft.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.snowsoft.bean.User;
import com.snowsoft.service.SigninService;
@Controller

public class SigninController {
	@Autowired
	private SigninService signService;
	
	@RequestMapping("/signin")
	public String signin(String username,String password){
		User user = new User(username,password);
		signService.sign(user);
		return "redirect:index.jsp";
	}
	
	@RequestMapping("/to_signin")
	public String to_signin(){
		return "signin";
	}
		

//		System.out.println("username="+username);
		
		
	}

