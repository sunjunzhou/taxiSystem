package com.snowsoft.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.snowsoft.bean.Car;
import com.snowsoft.dao.CarDao;

@Service
@Transactional
public class CarService {
	@Autowired
	private CarDao carDao;
	
	public List<Map<String, Object>> getCarList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return carDao.getCarList(map);
	}

	public int getCount() {
		// TODO Auto-generated method stub
		return carDao.getCount();
	}

	public List<Map<String, Object>> getAllCarOwnerInfo(int id) {
		return carDao.getAllCarOwnerInfo(id);
	}

	public void editCar(Car car) {
		if(car.getId() == null) {
			try {
				car.setOper_time(new Date());
				car.setDriverId(1);
				car.setIsSend(0);
				car.setIsType(0);
				carDao.saveCar(car);
				carDao.saveCarAndOwner(car);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			carDao.editCar(car);
		}
		
	}

	public Map<String, Object> getCarInfoById(int parseInt) {
		// TODO Auto-generated method stub
		return carDao.getCarInfoById(parseInt);
	}

	public void sendCar(String res) {
		String [] ids =res.split(",");
		Map<String,Object> map = new HashMap<String, Object>();
		for(int i=0;i<ids.length;i++) {
			map.put("id", ids[i]);
			map.put("sendTime",new Date());
			carDao.sendCar(map);
			map.clear();
		}
	}

	public void deleteCarById(String res) {
		String [] ids =res.split(",");
		for(int i=0;i<ids.length;i++) {
			carDao.deleteCarById(Integer.parseInt(ids[i]));
		}
	}
}
