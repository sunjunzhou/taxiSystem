package com.snowsoft.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.snowsoft.bean.Company;
import com.snowsoft.bean.User;
import com.snowsoft.service.CompanyService;

@Controller
@RequestMapping("company")
public class CompanyController {
	private String id;
	@Autowired
	private CompanyService comService;
	@RequestMapping("tocompanylist")
	public String tocompanylist(){
		return "company/companylist";
	}
	@RequestMapping("companylist")
	@ResponseBody
	public Map<String, Object> getCompanyList(Integer page,Integer limit){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("page", (page-1)*limit);
		map.put("limit", limit);
		List<Map<String,Object>> companylist = comService.getCompanyList(map);
		int count = comService.getCount();
		Map<String,Object> map2 = new HashMap<String,Object>();
		map2.put("data", companylist);
		map2.put("count", count);
		map2.put("code", 0);
		map2.put("msg", "");
		return map2;
	}
	
	@RequestMapping("getCompanyById")
	@ResponseBody
	public Map<String,Object> getCompanyById(HttpServletRequest request){
		id=request.getParameter("id");
		Map<String,Object> map=comService.getCompanyById(Integer.parseInt(id));
		return map;
	}
	
	@RequestMapping("insertCompanyInfo")
	@ResponseBody
	public int insertCompanyInfo(Company com,HttpServletRequest request,HttpSession session) {
		try {
			User user = (User)session.getAttribute("user");
			com.setUser_id(user.getuId());
			com.setUser_name(user.getuName());
			comService.insertCompanyInfo(com);
		} catch (Exception e) {
			return 1;
		}
		return 0;
	}
	
	@RequestMapping("updateCompanyInfo")
	@ResponseBody
	public int updateCompanyInfo(Company com,HttpServletRequest request,HttpSession session){
		try{
			User user = (User)session.getAttribute("user");
			com.setId(Integer.parseInt(id));
			com.setUser_id(user.getuId());
			com.setUser_name(user.getuName());
			comService.updateCompanyInfo(com);
		}catch(Exception e){
			return 1;
		}
		return 0;
	}
	
	@ResponseBody
	@RequestMapping("deleteCompanyById")
	public int deleteCompanyById(HttpServletRequest request) {
		try {
			String res=request.getParameter("res");
			comService.deleteCompanyById(res);
		}catch (Exception e) {
			return 1;
		}
		return 0;
	}

}
