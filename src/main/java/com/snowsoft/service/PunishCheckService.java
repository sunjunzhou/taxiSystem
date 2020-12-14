package com.snowsoft.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.snowsoft.dao.PunishCheckDao;

@Service
@Transactional
public class PunishCheckService {
	@Autowired
	PunishCheckDao punishCheckDao;
	
	public List<Map<String, Object>>getPunishList(Map<String, Object>map) {
		return punishCheckDao.getPunishList(map);
	}
	
	public int getCount() {
		return punishCheckDao.getCount();
	}

	public void sendPunish(Map<String, Object> map) {
		try {
			punishCheckDao.sendPunish(map);
			Map<String, Object>map1 = new HashMap<String, Object>();
			map1 = punishCheckDao.selectDriver((String)map.get("carId"));
			int score = (Integer)map1.get("score") !=0 ? ((Integer)map1.get("score") - (Integer)map.get("score")) : 0;
			int id = (Integer)map1.get("driver");
			map1.clear();
			map1.put("score", score);
			map1.put("driver", id);
			punishCheckDao.updateDriverAndScore(map1);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
