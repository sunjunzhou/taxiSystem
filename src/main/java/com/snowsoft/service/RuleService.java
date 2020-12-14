package com.snowsoft.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.snowsoft.bean.Rule;
import com.snowsoft.dao.RuleDao;

@Service
@Transactional
public class RuleService {
	@Autowired
	private RuleDao ruleDao;

	public List<Map<String, Object>> getRuleList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return ruleDao.getRuleList(map);
	}

	public int getCount() {
		// TODO Auto-generated method stub
		return ruleDao.getCount();
	}
	
	public void deleteRuleById(String res) {
		String [] ids =res.split(",");
		for(int i=0;i<ids.length;i++) {
			ruleDao.deleteRule(Integer.parseInt(ids[i]));
		}
		
	}

	public void editRuleInfo(Rule rule) {
		if(rule.getId() == null) {
			try {
				rule.setCreateTime(new Date());
				ruleDao.saveRule(rule);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try {
				ruleDao.eidtRule(rule);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
	}

	public Map<String, Object> getRuleById(int parseInt) {
		return ruleDao.getRuleById(parseInt);
	}
}
