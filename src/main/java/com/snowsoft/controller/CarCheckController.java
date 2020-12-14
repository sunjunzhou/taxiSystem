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
import com.snowsoft.service.CarCheckService;

@Controller
@RequestMapping("carCheck")
public class CarCheckController {
	@Autowired
	private CarCheckService carCheckService;
	@RequestMapping("tocarChecklist")
	public String tocarChecklist(){
		return "carCheck/carChecklist";
	}
	
	@RequestMapping("carChecklist")
	@ResponseBody
	public Map<String, Object> getCarList(Integer page,Integer limit){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("page", (page-1)*limit);
		map.put("limit", limit);
		List<Map<String,Object>> carlist = carCheckService.getCarList(map);
		int count = carCheckService.getCount();
		Map<String,Object> map2 = new HashMap<String,Object>();
		map2.put("data", carlist);
		map2.put("count", count);
		map2.put("code", 0);
		map2.put("msg", "");
		return map2;
	}
	
	@RequestMapping("sendCar")
	@ResponseBody
	public int sendCar(HttpServletRequest request,HttpSession session) {
		try {
			Map<String, Object>map = new HashMap<String, Object>();
			User user = (User)session.getAttribute("user");
			String res=request.getParameter("res");
			map.put("checkPeople", user.getuId());
			map.put("checkPeople_name", user.getuName());
			map.put("sendSuccessTime", new Date());
			map.put("check_suggestion", "ÉóºËÒÑÍ¨¹ý");
			carCheckService.sendCar(res,map);
		} catch (Exception e) {
			return 1;
		}
		return 0;
	}
}
