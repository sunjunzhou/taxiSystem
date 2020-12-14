package com.snowsoft.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.snowsoft.dao.CarOwnerCheckDao;

@Service
@Transactional
public class CarOwnerCheckService {
	@Autowired
	private CarOwnerCheckDao carOwnerCheckDao;

	public int getCount() {
		// TODO Auto-generated method stub
		return carOwnerCheckDao.getCount();
	}

	public List<Map<String, Object>> getCarOwnerList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return carOwnerCheckDao.getCarOwnerList(map);
	}

	public void sendCarOwner(String res, Map<String, Object> map) {
		String [] ids =res.split(",");
		for(int i=0;i<ids.length;i++) {
			map.put("id",Integer.parseInt(ids[i]));
			carOwnerCheckDao.sendCarOwner(map);
		}
	}
}
