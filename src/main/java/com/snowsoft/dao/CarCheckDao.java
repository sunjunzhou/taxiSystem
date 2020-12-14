package com.snowsoft.dao;

import java.util.List;
import java.util.Map;

public interface CarCheckDao {

	List<Map<String, Object>> getCarList(Map<String, Object> map);

	int getCount();

	void sendCar(Map<String, Object> map);

}
