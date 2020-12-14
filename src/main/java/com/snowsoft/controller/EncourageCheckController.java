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
import com.snowsoft.service.EncourageCheckService;

@Controller
@RequestMapping("encourageCheck")
public class EncourageCheckController {
	@Autowired
	private EncourageCheckService encourageCheckService;
	@RequestMapping("toencourageChecklist")
	public String toencourageChecklist(){
		return "encourageCheck/encourageChecklist";
	}
	
	@RequestMapping("encourageChecklist")
	@ResponseBody
	public Map<String, Object> getEncourageList(Integer page,Integer limit){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("page", (page-1)*limit);
		map.put("limit", limit);
		List<Map<String,Object>> encouragelist = encourageCheckService.getEncourageList(map);
		int count = encourageCheckService.getCount();
		Map<String,Object> map2 = new HashMap<String,Object>();
		map2.put("data", encouragelist);
		map2.put("count", count);
		map2.put("code", 0);
		map2.put("msg", "");
		return map2;
	}
	
	@RequestMapping("sendEncourage")
	@ResponseBody
	public int sendEncourage(HttpServletRequest request,HttpSession session) {
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
			encourageCheckService.sendEncourage(map);
		} catch (Exception e) {
			return 1;
		}
		return 0;
	}
}
