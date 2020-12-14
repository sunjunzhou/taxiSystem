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

import com.snowsoft.bean.Dept;
import com.snowsoft.bean.User;
import com.snowsoft.service.DeptService;
@Controller
@RequestMapping("dept")
public class DeptController {
	@Autowired
	private DeptService deptService;
	@RequestMapping("todeptlist")
	public String todeptlist(){
		return "dept/deptlist";
	}
	 
	@RequestMapping("deptlist")
	@ResponseBody
	public Map<String, Object> getDeptList(Integer page,Integer limit){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("page", (page-1)*limit);
		map.put("limit", limit);
		List<Map<String,Object>> deptlist = deptService.getDeptList(map);
		int count = deptService.getCount();
		Map<String,Object> map2 = new HashMap<String,Object>();
		map2.put("data", deptlist);
		map2.put("count", count);
		map2.put("code", 0);
		map2.put("msg", "");
		return map2;
	}
	
	@RequestMapping("getdeptById")
	@ResponseBody
	public Map<String,Object> getdeptById(HttpServletRequest request){
		String id=request.getParameter("id");
		Map<String,Object> map=deptService.getdeptById(Integer.parseInt(id));
		return map;
	}
	
	@RequestMapping("insertDeptInfo")
	@ResponseBody
	public int insertDeptInfo(Dept dept,HttpServletRequest request,HttpSession session) {
		try {
			User user = (User)session.getAttribute("user");
			dept.setOperator(user.getuId());
			dept.setOperator_name(user.getuName());
			dept.setCreatetime(new Date());
			dept.setOperator_time(new Date());
			deptService.insertDeptInfo(dept);
		} catch (Exception e) {
			return 1;
		}
		return 0;
	}
	
	@RequestMapping("updateDeptInfo")
	@ResponseBody
	public int updateDeptInfo(Dept dept,HttpServletRequest request,HttpSession session){
		try{
			User user = (User)session.getAttribute("user");
			dept.setOperator(user.getuId());
			dept.setOperator_name(user.getuName());
			dept.setOperator_time(new Date());
			deptService.updateDeptInfo(dept);
		}catch(Exception e){
			return 1;
		}
		return 0;
	}
	
	@ResponseBody
	@RequestMapping("deleteDeptById")
	public int deleteDeptById(HttpServletRequest request) {
		try {
			String res=request.getParameter("res");
			deptService.deleteDeptById(res);
		}catch (Exception e) {
			return 1;
		}
		return 0;
	}

}
