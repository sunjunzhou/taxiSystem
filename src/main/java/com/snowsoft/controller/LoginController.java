package com.snowsoft.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//import org.apache.catalina.connector.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.snowsoft.bean.User;
import com.snowsoft.service.LoginService;

@Controller
@RequestMapping("loginCtr")
public class LoginController {
	@Autowired
	private LoginService logservice;
	
	@RequestMapping("index")
	public ModelAndView login(String username,String password,HttpServletRequest request,HttpSession session){
//		User user = new User(username,password);
//		boolean flag = logservice.login(username,password);
		User user = logservice.login(username,password);
		ModelAndView model = new ModelAndView();
		if(user != null){
			List<Map <String,Object>> menulist = logservice.getMenuListById(user);
			request.setAttribute("menulist", menulist);
			request.setAttribute("uName", username);
			session.setAttribute("user", user);
			model.setViewName("success");
		}else{
			model.setViewName("fail");
		}
//		System.out.println("username="+username);
		
		return model;
	}

}
