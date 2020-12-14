package com.snowsoft.dao;

import java.util.List;
import java.util.Map;

import com.snowsoft.bean.Rule;

public interface RuleDao {
	List<Map<String, Object>>getRuleList(Map<String, Object>map);
	
	int getCount();

	void saveRule(Rule rule);

	Map<String, Object> getRuleById(int parseInt);
	
	void eidtRule(Rule rule);
	
	void deleteRule(int id);
}
