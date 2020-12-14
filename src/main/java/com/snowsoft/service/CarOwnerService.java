package com.snowsoft.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.snowsoft.bean.CarOwner;
import com.snowsoft.dao.CarOwnerDao;

@Service
@Transactional
public class CarOwnerService {
	@Autowired
	private CarOwnerDao carownerDao;
	
	public List<Map<String, Object>> getCarOwnerList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return carownerDao.getCarOwnerList(map);
	}

	public int getCount() {
		// TODO Auto-generated method stub
		return carownerDao.getCount();
	}

	public void editCarOwner(CarOwner carOwner) {
		if(carOwner.getId() == null) {
			try {
				carOwner.setisType(0);
				carOwner.setIsSend(0);
				carownerDao.saveCarOwner(carOwner);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}else {
			carownerDao.editCarOwner(carOwner);
		}
		
	}

	public void deleteCarOwnerById(String res) {
		String [] ids =res.split(",");
		for(int i=0;i<ids.length;i++) {
			carownerDao.deleteCarOwnerById(Integer.parseInt(ids[i]));
		}
	}

	public Map<String, Object> getcarownerById(int id) {
		return carownerDao.getcarownerById(id);
	}

	public void sendCarOwner(String res) {
		String [] ids =res.split(",");
		for(int i=0;i<ids.length;i++) {
			carownerDao.sendCarOwner(Integer.parseInt(ids[i]));
		}
	}

}
