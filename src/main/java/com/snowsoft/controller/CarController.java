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

import com.snowsoft.bean.Car;
import com.snowsoft.bean.User;
import com.snowsoft.service.CarService;

@Controller
@RequestMapping("car")
public class CarController {
	@Autowired
	private CarService carService;
	@RequestMapping("tocarlist")
	public String tocarlist(){
		return "car/carlist";
	}
	 
	@RequestMapping("carlist")
	@ResponseBody
	public Map<String, Object> getCarList(Integer page,Integer limit,HttpSession session){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("page", (page-1)*limit);
		map.put("limit", limit);
		map.put("companyId", ((User)session.getAttribute("user")).getCompanyId());
		List<Map<String,Object>> carlist = carService.getCarList(map);
		int count = carService.getCount();
		Map<String,Object> map2 = new HashMap<String,Object>();
		map2.put("data", carlist);
		map2.put("count", count);
		map2.put("code", 0);
		map2.put("msg", "");
		return map2;
	}
	
	@RequestMapping("getAllCarOwnerInfo")
	@ResponseBody
	public List<Map<String, Object>> getAllCarOwnerInfo(HttpSession session){
		List<Map<String, Object>> list = carService.getAllCarOwnerInfo(((User)session.getAttribute("user")).getCompanyId());
		return list;
	}
	
	@RequestMapping("editcar")
	@ResponseBody
	public int editCar(Car car,HttpServletRequest request,HttpSession session) {
		try {
			User user = (User)session.getAttribute("user");
			car.setOperator(user.getuId());
			car.setCompany_id(user.getCompanyId());
			carService.editCar(car);
		} catch (Exception e) {
			// TODO: handle exception
			return 1;
		}
		return 0;
	}
	
	@RequestMapping("getCarInfoById")
	@ResponseBody
	public Map<String, Object> getCarInfoById(HttpServletRequest request, HttpSession session){
		String id = request.getParameter("id");
		Map<String, Object>carInfo = carService.getCarInfoById(Integer.parseInt(id));
		List<Map<String, Object>> list = carService.getAllCarOwnerInfo(((User)session.getAttribute("user")).getCompanyId());
		carInfo.put("ownerlist", list);
		return carInfo;
	}
	
	@RequestMapping("sendCar")
	@ResponseBody
	public int sendCar(HttpServletRequest request) {
		try {
			String res=request.getParameter("res");
			carService.sendCar(res);
		}catch (Exception e) {
			return 1;
		}
		return 0;
	}
	
	@RequestMapping("deleteCarById")
	@ResponseBody
	public int deleteCarById(HttpServletRequest request) {
		try {
			String res=request.getParameter("res");
			carService.deleteCarById(res);
		}catch (Exception e) {
			return 1;
		}
		return 0;
	}
}

