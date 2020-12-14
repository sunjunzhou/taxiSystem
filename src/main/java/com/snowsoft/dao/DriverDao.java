package com.snowsoft.dao;

import java.util.List;
import java.util.Map;

import com.snowsoft.bean.Driver;

public interface DriverDao {
	List<Map<String, Object>> getDriverList(Map<String, Object> map);

	int getCount();

	List<Map<String, Object>> getAllCarInfo(int id);

	void saveDriver(Driver driver);

	void saveDriverAndCar(Driver driver);

	void deleteDriverById(int parseInt);
	
	void updateDriverAndCar(int parseInt);

	void sendDriver(int parseInt);

	Map<String, Object> getDriverInfoById(int parseInt);
	
	void editDriver(Driver driver);
}
