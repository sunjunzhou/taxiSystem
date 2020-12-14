package com.snowsoft.dao;

import java.util.List;
import java.util.Map;

import com.snowsoft.bean.Car;

public interface CarDao {
	List<Map<String, Object>> getCarList(Map<String, Object> map);

	int getCount();

	List<Map<String, Object>> getAllCarOwnerInfo(int id);

	void editCar(Car car);

	void saveCar(Car car);

	Map<String, Object> getCarInfoById(int parseInt);

	void sendCar(Map<String, Object> map);
	
	void deleteCarById(int id);
	
	void saveCarAndOwner(Car car);
}
