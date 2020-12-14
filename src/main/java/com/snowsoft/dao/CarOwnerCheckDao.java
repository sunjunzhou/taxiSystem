package com.snowsoft.dao;

import java.util.List;
import java.util.Map;

public interface CarOwnerCheckDao {

	int getCount();

	List<Map<String, Object>> getCarOwnerList(Map<String, Object> map);

	void sendCarOwner(Map<String, Object> map);

}
