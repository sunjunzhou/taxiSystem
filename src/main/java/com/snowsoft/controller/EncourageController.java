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

import com.snowsoft.bean.Encourage;
import com.snowsoft.bean.User;
import com.snowsoft.service.EncourageService;

@Controller
@RequestMapping("encourage")
public class EncourageController {
	@Autowired
	private EncourageService encourageService;
	@RequestMapping("toencouragelist")
	public String toencouragelist(){
		return "encourage/encouragelist";
	}
	 
	@RequestMapping("getAllEncourageList")
	@ResponseBody
	public Map<String, Object>getAllEncourageList(Integer page,Integer limit){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("page", (page-1)*limit);
		map.put("limit", limit);
		List<Map<String,Object>> list = encourageService.getAllEncourageList(map);
		int count = encourageService.getCount();
		Map<String,Object> map2 = new HashMap<String,Object>();
		map2.put("data", list);
		map2.put("count", count);
		map2.put("code", 0);
		map2.put("msg", "");
		return map2;
	}
	
	@RequestMapping("getAllCarInfo")
	@ResponseBody
	public List<Map<String, Object>> getAllCarInfo(){
		List<Map<String, Object>> list = encourageService.getAllCarInfo();
		return list;
	}
	
	@RequestMapping("getAllEncourageInfo")
	@ResponseBody
	public List<Map<String, Object>> getAllEncourageInfo(){
		List<Map<String, Object>> list = encourageService.getAllEncourageInfo();
		return list;
	}
	
	@RequestMapping("editencourage")
	@ResponseBody
	int EditEncourage(Encourage encourage,HttpServletRequest request,HttpSession session) {
		try {
			encourage.setWho_send(((User)session.getAttribute("user")).getuId());
			encourage.setSendTime(new Date());
			encourageService.editEncourage(encourage);
		} catch (Exception e) {
			// TODO: handle exception
			return 1;
		}
		return 0;
	}
	
	@ResponseBody
	@RequestMapping("getEncourageInfoById")
	Map<String, Object>getEncourageInfoById(HttpServletRequest request){
		String id = request.getParameter("id");
		Map<String, Object>Info = encourageService.getEncourageInfoById(Integer.parseInt(id));
		List<Map<String, Object>> list = encourageService.getAllEncourageInfo();
		List<Map<String, Object>> list1 = encourageService.getAllCarInfo();
		Info.put("encouragelist", list);
		Info.put("carlist", list1);
		return Info;
	}
	
	@RequestMapping("sendEncourage")
	@ResponseBody
	int sendEncourage(HttpServletRequest request) {
		try {
			String res=request.getParameter("res");
			encourageService.sendEncourage(res);
		}catch (Exception e) {
			return 1;
		}
		return 0;
	}
	
	@RequestMapping("deleteEncourageById")
	@ResponseBody
	public int deleteEncourageById(HttpServletRequest request) {
		try {
			String res=request.getParameter("res");
			encourageService.deleteEncourageById(res);
		}catch (Exception e) {
			return 1;
		}
		return 0;
	}
}

