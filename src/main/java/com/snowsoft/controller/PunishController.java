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

import com.snowsoft.bean.Punish;
import com.snowsoft.bean.User;
import com.snowsoft.service.PunishService;

@Controller
@RequestMapping("punish")
public class PunishController {
	@Autowired
	private PunishService punishService;
	@RequestMapping("topunishlist")
	public String topunishlist(){
		return "punish/punishlist";
	}
	 
	@RequestMapping("getAllPunishList")
	@ResponseBody
	public Map<String, Object>getAllPunishList(Integer page,Integer limit){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("page", (page-1)*limit);
		map.put("limit", limit);
		List<Map<String,Object>> list = punishService.getAllPunishList(map);
		int count = punishService.getCount();
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
		List<Map<String, Object>> list = punishService.getAllCarInfo();
		return list;
	}
	
	@RequestMapping("getAllPunishInfo")
	@ResponseBody
	public List<Map<String, Object>> getAllPunishInfo(){
		List<Map<String, Object>> list = punishService.getAllPunishInfo();
		return list;
	}
	
	@RequestMapping("editpunish")
	@ResponseBody
	int Editpunish(Punish punish,HttpServletRequest request,HttpSession session) {
		try {
			punish.setWho_send(((User)session.getAttribute("user")).getuId());
			punish.setSendTime(new Date());
			punishService.editPunish(punish);
		} catch (Exception e) {
			// TODO: handle exception
			return 1;
		}
		return 0;
	}
	
	@ResponseBody
	@RequestMapping("getPunishInfoById")
	Map<String, Object>getpunishInfoById(HttpServletRequest request){
		String id = request.getParameter("id");
		Map<String, Object>Info = punishService.getPunishInfoById(Integer.parseInt(id));
		List<Map<String, Object>> list = punishService.getAllPunishInfo();
		List<Map<String, Object>> list1 = punishService.getAllCarInfo();
		Info.put("punishlist", list);
		Info.put("carlist", list1);
		return Info;
	}
	
	@RequestMapping("sendpunish")
	@ResponseBody
	int sendpunish(HttpServletRequest request) {
		try {
			String res=request.getParameter("res");
			punishService.sendPunish(res);
		}catch (Exception e) {
			return 1;
		}
		return 0;
	}
	
	@RequestMapping("deletepunishById")
	@ResponseBody
	public int deletePunishById(HttpServletRequest request) {
		try {
			String res=request.getParameter("res");
			punishService.deletePunishById(res);
		}catch (Exception e) {
			return 1;
		}
		return 0;
	}
}

