package com.snowsoft.dao;

import java.util.List;
import java.util.Map;

import com.snowsoft.bean.CarOwner;

public interface CarOwnerDao {

	int getCount();

	List<Map<String, Object>> getCarOwnerList(Map<String, Object> map);

	void saveCarOwner(CarOwner carOwner);

	void deleteCarOwnerById(int parseInt);

	Map<String, Object> getcarownerById(int id);

	void editCarOwner(CarOwner carOwner);

	void sendCarOwner(int parseInt);

}
