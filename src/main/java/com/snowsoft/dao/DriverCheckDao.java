package com.snowsoft.dao;

import java.util.List;
import java.util.Map;

public interface DriverCheckDao {

	List<Map<String, Object>> getDriverList(Map<String, Object> map);

	int getCount();

	void sendDriver(int id);

}
