package com.snowsoft.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.snowsoft.bean.User;
import com.snowsoft.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private UserService userService;
	@RequestMapping("/touserlist")
	public String todeptlist(){
		return "user/userlist";
	}
	@RequestMapping("userlist")
	@ResponseBody
	public Map<String,Object> userList(Integer page,Integer limit){
		Map<String,Object> map1 = new HashMap<String,Object>();
		map1.put("page", (page-1)*limit);
		map1.put("limit", limit);
		List<Map<String,Object>> list = userService.getAllInfo(map1);
		int count = userService.getAllCount();
		Map<String,Object> map2 = new HashMap<String,Object>();
		map2.put("data", list);
		map2.put("count", count);
		map2.put("code", 0);
		map2.put("msg", "");
		return map2;
	}

	@ResponseBody
	@RequestMapping("getAllDeptInfo")
	public List<Map<String, Object>> getAllDeptInfo(){
		List<Map<String, Object>> list = userService.getAllDeptInfo();
		return list;
	}
	
	@ResponseBody
	@RequestMapping("getAllCompanyInfo")
	public List<Map<String, Object>> getAllCompanyInfo(){
		List<Map<String, Object>> list = userService.getAllCompanyInfo();
		return list;
	}
	
	@ResponseBody
	@RequestMapping("getAllMenuInfo")
	public List<Map<String, Object>> getAllMenuInfo(){
		List<Map<String, Object>> list = userService.getAllMenuInfo();
		return list;
	}
	
	@ResponseBody
	@RequestMapping("edituser")
	public int editUser(User user,HttpSession session,HttpServletRequest request){
		try{
			user.setCompanyId(1);	
			user.setuType(1);
			user.setuPassword("111111");
			user.setuOperateTime(new Date());
			user.setuOperate(((User)session.getAttribute("user")).getuId());
			user.setuOperate_name(((User)session.getAttribute("user")).getuName());
			userService.editUser(user);
		}catch (Exception e) {
			return 0;
		}
		return 1;
	}
	
	@ResponseBody
	@RequestMapping("editcompany_user")
	public int editCompanyUser(User user,HttpSession session,HttpServletRequest request){
		try{
			user.setuDeptId(1);
			user.setuType(2);
			user.setuPassword("111111");
			user.setuOperateTime(new Date());
			user.setuOperate(((User)session.getAttribute("user")).getuId());
			user.setuOperate_name(((User)session.getAttribute("user")).getuName());
			userService.editUser(user);
		}catch (Exception e) {
			return 0;
		}
		return 1;
	}
	
	@ResponseBody
	@RequestMapping("deleteUserById")
	public int deleteUserById(HttpServletRequest request) {
		try {
			String res=request.getParameter("res");
			userService.deleteUserById(res);
		}catch (Exception e) {
			return 1;
		}
		return 0;
	}
	
	@RequestMapping("getUserById")
	@ResponseBody
	public Map<String,Object> getUserById(HttpServletRequest request){
		String id=request.getParameter("id");
		Map<String,Object> map=userService.getUserById(Integer.parseInt(id));
		List<Map<String, Object>> deptList = userService.getAllDeptInfo();
		List<Map<String, Object>> companyList = userService.getAllCompanyInfo();
		List<Map<String, Object>> menuList = userService.getAllMenuInfo();
		List<Map<String, Object>> ownMenu = userService.getOwnMenuInfo(Integer.parseInt(id));
		map.put("ownMenu", ownMenu);
		map.put("menulist", menuList);
		map.put("deptlist", deptList);
		map.put("companylist",companyList);
		return map;
	}
}
