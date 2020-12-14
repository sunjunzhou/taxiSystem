package com.snowsoft.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.snowsoft.dao.DriverCheckDao;

@Service
@Transactional
public class DriverCheckService {
	@Autowired
	private DriverCheckDao driverCheckDao;

	public int getCount() {
		// TODO Auto-generated method stub
		return driverCheckDao.getCount();
	}

	public List<Map<String, Object>> getDriverList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return driverCheckDao.getDriverList(map);
	}

	public void sendDriver(String res) {
		String [] ids =res.split(",");
		for(int i=0;i<ids.length;i++) {
			driverCheckDao.sendDriver(Integer.parseInt(ids[i]));
		}
	}
}
