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

import com.snowsoft.bean.CarOwner;
import com.snowsoft.bean.User;
import com.snowsoft.service.CarOwnerService;

@Controller
@RequestMapping("carowner")
public class CarOwnerController {
	@Autowired
	private CarOwnerService carownerService;
	@RequestMapping("tocarownerlist")
	public String tocarownerlist(){
		return "carowner/carownerlist";
	}
	 
	@RequestMapping("carownerlist")
	@ResponseBody
	public Map<String, Object> getCarOwnerList(Integer page,Integer limit,HttpSession session){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("page", (page-1)*limit);
		map.put("limit", limit);
		map.put("companyId", ((User)session.getAttribute("user")).getCompanyId());
		List<Map<String,Object>> carownerlist = carownerService.getCarOwnerList(map);
		int count = carownerService.getCount();
		Map<String,Object> map2 = new HashMap<String,Object>();
		map2.put("data", carownerlist);
		map2.put("count", count);
		map2.put("code", 0);
		map2.put("msg", "");
		return map2;
	}
	
	@RequestMapping("editCarOwner")
	@ResponseBody
	public int editCarOwner(CarOwner carOwner,HttpSession session, HttpServletRequest request) {
		try {
			User user = (User)session.getAttribute("user");
			carOwner.setCompany_id(user.getCompanyId());
			carOwner.setOperator(user.getuId());
			carOwner.setOperator_time(new Date());
			carownerService.editCarOwner(carOwner);
		} catch (Exception e) {
			return 1;
		}
		return 0;
	}
	
	@RequestMapping("deleteCarOwnerById")
	@ResponseBody
	public int deleteCarOwnerById(HttpServletRequest request) {
		try {
			String res=request.getParameter("res");
			carownerService.deleteCarOwnerById(res);
		}catch (Exception e) {
			return 1;
		}
		return 0;
	}
	
	@RequestMapping("getcarownerById")
	@ResponseBody
	public Map<String, Object> getcarownerById(HttpServletRequest request){
		String id = request.getParameter("id");
		Map<String, Object> carownerList = carownerService.getcarownerById(Integer.parseInt(id));
		return carownerList;
	}
	
	@RequestMapping("sendCarOwner")
	@ResponseBody
	public int sendCarOwner(HttpServletRequest request) {
		try {
			String res=request.getParameter("res");
			carownerService.sendCarOwner(res);
		}catch (Exception e) {
			return 1;
		}
		return 0;
	}
}
