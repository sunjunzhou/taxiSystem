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

import com.snowsoft.bean.Rule;
import com.snowsoft.bean.User;
import com.snowsoft.service.RuleService;
@Controller
@RequestMapping("rule")
public class RuleController {
	@Autowired
	private RuleService ruleService;
	@RequestMapping("torulelist")
	public String torulelist(){
		return "rule/rulelist";
	}
	 
	@RequestMapping("rulelist")
	@ResponseBody
	public Map<String, Object> getRuleList(Integer page,Integer limit){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("page", (page-1)*limit);
		map.put("limit", limit);
		List<Map<String,Object>> rulelist = ruleService.getRuleList(map);
		int count = ruleService.getCount();
		Map<String,Object> map2 = new HashMap<String,Object>();
		map2.put("data", rulelist);
		map2.put("count", count);
		map2.put("code", 0);
		map2.put("msg", "");
		return map2;
	}
	
	@RequestMapping("editRuleInfo")
	@ResponseBody
	public int editRuleInfo(Rule rule,HttpServletRequest request,HttpSession session) {
		try {
			User user = (User)session.getAttribute("user");
			rule.setOperator(user.getuId());
			ruleService.editRuleInfo(rule);
		} catch (Exception e) {
			return 1;
		}
		return 0;
	}
	
	@RequestMapping("getruleById")
	@ResponseBody
	public Map<String, Object>getRuleById(HttpServletRequest request) {
		String id = (String) request.getParameter("id");
		return ruleService.getRuleById(Integer.parseInt(id));
	}
	
	@ResponseBody
	@RequestMapping("deleteRule")
	public int deleteRule(HttpServletRequest request) {
		try {
			String res = request.getParameter("res");
			ruleService.deleteRuleById(res);
		} catch (Exception e) {
			return 1;
		}
		return 0;
	}
	
}
