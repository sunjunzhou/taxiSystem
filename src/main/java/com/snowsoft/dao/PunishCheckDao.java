package com.snowsoft.dao;

import java.util.List;
import java.util.Map;

public interface PunishCheckDao {
	List<Map<String, Object>> getPunishList(Map<String, Object> map);
	
	int getCount();

	void updateDriverAndScore(Map<String, Object> map);
	
	void sendPunish(Map<String, Object>map);
	
	Map<String, Object>selectDriver(String carId);
}
