package com.snowsoft.dao;

import java.util.List;
import java.util.Map;

import com.snowsoft.bean.Encourage;

public interface EncourageDao {

	List<Map<String, Object>> getAllEncourageList(Map<String, Object> map);

	int getCount();

	List<Map<String, Object>> getAllCarInfo();

	List<Map<String, Object>> getAllEncourageInfo();

	void saveEncourage(Encourage encourage);

	Map<String, Object> getEncourageInfoById(int parseInt);

	void editEncourage(Encourage encourage);

	void sendEncourage(int id);

	void deleteEncourageById(int parseInt);

}
