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
import com.snowsoft.service.CarOwnerCheckService;

@Controller
@RequestMapping("carownerCheck")
public class CarOwnerCheckControllel {
	@Autowired
	private CarOwnerCheckService carOwnerCheckService;
	@RequestMapping("tocarownerChecklist")
	public String tocarownerChecklist(){
		return "carownerCheck/carownerChecklist";
	}
	
	@RequestMapping("carownerChecklist")
	@ResponseBody
	public Map<String, Object> getCarOwnerList(Integer page,Integer limit){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("page", (page-1)*limit);
		map.put("limit", limit);
		List<Map<String,Object>> carlist = carOwnerCheckService.getCarOwnerList(map);
		int count = carOwnerCheckService.getCount();
		Map<String,Object> map2 = new HashMap<String,Object>();
		map2.put("data", carlist);
		map2.put("count", count);
		map2.put("code", 0);
		map2.put("msg", "");
		return map2;
	}
	
	@RequestMapping("sendCarOwner")
	@ResponseBody
	public int sendCarOwner(HttpServletRequest request,HttpSession session) {
		try {
			Map<String, Object>map = new HashMap<String, Object>();
			User user = (User)session.getAttribute("user");
			String res=request.getParameter("res");
			map.put("checkPeople", user.getuId());
			map.put("checkPeople_name", user.getuName());
			map.put("check_time", new Date());
			map.put("check_suggestion", "ÉóºËÒÑÍ¨¹ý");
			carOwnerCheckService.sendCarOwner(res,map);
		} catch (Exception e) {
			return 1;
		}
		return 0;
	}
}
