package com.snowsoft.service;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.snowsoft.bean.Encourage;
import com.snowsoft.dao.EncourageDao;

@Service
@Transactional
public class EncourageService {
	@Autowired
	EncourageDao encourageDao;

	public List<Map<String, Object>> getAllEncourageList(Map<String, Object> map) {
		return encourageDao.getAllEncourageList(map);
	}

	public int getCount() {
		// TODO Auto-generated method stub
		return encourageDao.getCount();
	}

	public List<Map<String, Object>> getAllCarInfo() {
		// TODO Auto-generated method stub
		return encourageDao.getAllCarInfo();
	}

	public List<Map<String, Object>> getAllEncourageInfo() {
		// TODO Auto-generated method stub
		return encourageDao.getAllEncourageInfo();
	}

	public void editEncourage(Encourage encourage) {
		if(encourage.getId() == null) {
			try {
				encourageDao.saveEncourage(encourage);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			try {
				encourageDao.editEncourage(encourage);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
	}

	public Map<String, Object> getEncourageInfoById(int parseInt) {
		return encourageDao.getEncourageInfoById(parseInt);
	}

	public void sendEncourage(String res) {
		String [] ids =res.split(",");
		for(int i=0;i<ids.length;i++) {
			encourageDao.sendEncourage(Integer.parseInt(ids[i]));
		}
	}

	public void deleteEncourageById(String res) {
		String[] idStrings = res.split(",");
		for(String i: idStrings) {
			encourageDao.deleteEncourageById(Integer.parseInt(i));
		}
		
	}

}
