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

import com.snowsoft.bean.Driver;
import com.snowsoft.bean.User;
import com.snowsoft.service.DriverService;

@Controller
@RequestMapping("driver")
public class DriverController {
	@Autowired
	private DriverService driverService;
	@RequestMapping("todriverlist")
	public String todriverlist(){
		return "driver/driverlist";
	}
	 
	@RequestMapping("driverlist")
	@ResponseBody
	public Map<String, Object> getDriverList(Integer page,Integer limit,HttpSession session){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("page", (page-1)*limit);
		map.put("limit", limit);
		map.put("companyId", ((User)session.getAttribute("user")).getCompanyId());
		List<Map<String,Object>> driverlist = driverService.getDriverList(map);
		int count = driverService.getCount();
		Map<String,Object> map2 = new HashMap<String,Object>();
		map2.put("data", driverlist);
		map2.put("count", count);
		map2.put("code", 0);
		map2.put("msg", "");
		return map2;
	}
	
	@RequestMapping("getAllCarInfo")
	@ResponseBody
	public List<Map<String, Object>> getAllCarInfo(HttpSession session){
		List<Map<String, Object>> list = driverService.getAllCarInfo(((User)session.getAttribute("user")).getCompanyId());
		return list;
	}
	
	@RequestMapping("editdriver")
	@ResponseBody
	public int editDriver(Driver driver,HttpServletRequest request,HttpSession session) {
		try {
			driver.setCompany_id(((User)session.getAttribute("user")).getCompanyId());
			driverService.editDriver(driver);
		} catch (Exception e) {
			// TODO: handle exception
			return 1;
		}
		return 0;
	}
	
	@RequestMapping("deleteDriverById")
	@ResponseBody
	public int deleteCarById(HttpServletRequest request) {
		try {
			String res=request.getParameter("res");
			driverService.deleteDriverById(res);
		}catch (Exception e) {
			return 1;
		}
		return 0;
	}
	
	@RequestMapping("sendDriver")
	@ResponseBody
	public int sendDriver(HttpServletRequest request) {
		try {
			String res=request.getParameter("res");
			driverService.sendDriver(res);
		}catch (Exception e) {
			return 1;
		}
		return 0;
	}
	
	@RequestMapping("getDriverInfoById")
	@ResponseBody
	public Map<String, Object> getDriverInfoById(HttpServletRequest request,HttpSession session){
		String id = request.getParameter("id");
		Map<String, Object>carInfo = driverService.getDriverInfoById(Integer.parseInt(id));
		List<Map<String, Object>> list = driverService.getAllCarInfo(((User)session.getAttribute("user")).getCompanyId());
		carInfo.put("carlist", list);
		return carInfo;
	}
}

