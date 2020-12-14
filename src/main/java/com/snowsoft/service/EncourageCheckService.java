package com.snowsoft.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.snowsoft.dao.EncourageCheckDao;

@Service
@Transactional
public class EncourageCheckService {
	@Autowired
	EncourageCheckDao encourageCheckDao;
	
	public List<Map<String, Object>>getEncourageList(Map<String, Object>map) {
		return encourageCheckDao.getEncourageList(map);
	}
	
	public int getCount() {
		return encourageCheckDao.getCount();
	}

	public void sendEncourage(Map<String, Object> map) {
		try {
			encourageCheckDao.sendEncourage(map);
			Map<String, Object>map1 = new HashMap<String, Object>();
			map1 = encourageCheckDao.selectDriver((String)map.get("carId"));
			int score = (Integer)map1.get("score") + (Integer)map.get("score");
			int id = (Integer)map1.get("driver");
			map1.clear();
			map1.put("score", score);
			map1.put("driver", id);
			encourageCheckDao.updateDriverAndScore(map1);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
