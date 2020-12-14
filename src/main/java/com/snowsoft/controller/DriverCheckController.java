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

import com.snowsoft.service.DriverCheckService;

@Controller
@RequestMapping("driverCheck")
public class DriverCheckController {
	@Autowired
	private DriverCheckService driverCheckService;
	@RequestMapping("todriverChecklist")
	public String todriverChecklist(){
		return "driverCheck/driverChecklist";
	}
	
	@RequestMapping("driverChecklist")
	@ResponseBody
	public Map<String, Object> getDriverList(Integer page,Integer limit){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("page", (page-1)*limit);
		map.put("limit", limit);
		List<Map<String,Object>> driverlist = driverCheckService.getDriverList(map);
		int count = driverCheckService.getCount();
		Map<String,Object> map2 = new HashMap<String,Object>();
		map2.put("data", driverlist);
		map2.put("count", count);
		map2.put("code", 0);
		map2.put("msg", "");
		return map2;
	}
	
	@RequestMapping("sendDriver")
	@ResponseBody
	public int sendDriver(HttpServletRequest request,HttpSession session) {
		try {
			String res=request.getParameter("res");
			driverCheckService.sendDriver(res);
		} catch (Exception e) {
			return 1;
		}
		return 0;
	}
}
