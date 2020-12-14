package com.snowsoft.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.snowsoft.dao.CarCheckDao;

@Service
@Transactional
public class CarCheckService {
	@Autowired
	private CarCheckDao carCheckDao;

	public int getCount() {
		// TODO Auto-generated method stub
		return carCheckDao.getCount();
	}

	public List<Map<String, Object>> getCarList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return carCheckDao.getCarList(map);
	}

	public void sendCar(String res, Map<String, Object> map) {
		String [] ids =res.split(",");
		for(int i=0;i<ids.length;i++) {
			map.put("id",Integer.parseInt(ids[i]));
			carCheckDao.sendCar(map);
		}
	}
}
