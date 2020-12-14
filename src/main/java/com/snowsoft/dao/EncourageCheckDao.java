package com.snowsoft.dao;

import java.util.List;
import java.util.Map;

public interface EncourageCheckDao {
	List<Map<String, Object>> getEncourageList(Map<String, Object> map);
	
	int getCount();

	void updateDriverAndScore(Map<String, Object> map);
	
	void sendEncourage(Map<String, Object>map);
	
	Map<String, Object>selectDriver(String carId);
}
