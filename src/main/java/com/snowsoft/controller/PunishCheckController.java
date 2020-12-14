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
import com.snowsoft.service.PunishCheckService;

@Controller
@RequestMapping("punishCheck")
public class PunishCheckController {
	@Autowired
	private PunishCheckService punishCheckService;
	@RequestMapping("topunishChecklist")
	public String topunishChecklist(){
		return "punishCheck/punishChecklist";
	}
	
	@RequestMapping("punishChecklist")
	@ResponseBody
	public Map<String, Object> getPunishCheckList(Integer page,Integer limit){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("page", (page-1)*limit);
		map.put("limit", limit);
		List<Map<String,Object>> punishlist = punishCheckService.getPunishList(map);
		int count = punishCheckService.getCount();
		Map<String,Object> map2 = new HashMap<String,Object>();
		map2.put("data", punishlist);
		map2.put("count", count);
		map2.put("code", 0);
		map2.put("msg", "");
		return map2;
	}
	
	@RequestMapping("sendPunish")
	@ResponseBody
	public int sendPunish(HttpServletRequest request,HttpSession session) {
		try {
			Map<String, Object>map = new HashMap<String, Object>();
			User user = (User)session.getAttribute("user");
			String res=request.getParameter("res");
			String res1=request.getParameter("res1");
			String res2=request.getParameter("res2");
			map.put("who_check", user.getuId());
			map.put("successTime", new Date());
			map.put("id", res);
			map.put("carId", res1);
			map.put("score", Integer.parseInt(res2));
			punishCheckService.sendPunish(map);
		} catch (Exception e) {
			return 1;
		}
		return 0;
	}
}
