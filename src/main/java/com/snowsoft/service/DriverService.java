package com.snowsoft.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.snowsoft.bean.Driver;
import com.snowsoft.dao.DriverDao;

@Service
@Transactional
public class DriverService {
	@Autowired
	private DriverDao driverDao;
	
	public List<Map<String, Object>> getDriverList(Map<String, Object> map) {
		return driverDao.getDriverList(map);
	}

	public int getCount() {
		return driverDao.getCount();
	}
	
	public List<Map<String, Object>> getAllCarInfo(int id) {
		return driverDao.getAllCarInfo(id);
	}

	public void editDriver(Driver driver) {
		if(driver.getId() == null) {
			try {
				driver.setScore(0);
				driver.setIsSend(0);
				driver.setIsType(0);
				driverDao.saveDriver(driver);
				driverDao.saveDriverAndCar(driver);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			try {
				driverDao.editDriver(driver);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}

	public void deleteDriverById(String res) {
		String [] ids =res.split(",");
		for(int i=0;i<ids.length;i++) {
			driverDao.deleteDriverById(Integer.parseInt(ids[i]));
			driverDao.updateDriverAndCar(Integer.parseInt(ids[i]));
		}
	}

	public void sendDriver(String res) {
		String [] ids =res.split(",");
		for(int i=0;i<ids.length;i++) {
			driverDao.sendDriver(Integer.parseInt(ids[i]));
		}
	}

	public Map<String, Object> getDriverInfoById(int parseInt) {
		return driverDao.getDriverInfoById(parseInt);
	}

}

