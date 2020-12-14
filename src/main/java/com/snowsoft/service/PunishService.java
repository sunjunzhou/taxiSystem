package com.snowsoft.service;

import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.snowsoft.bean.Punish;
import com.snowsoft.dao.PunishDao;

@Service
@Transactional
public class PunishService {
	@Autowired
	PunishDao punishDao;

	public List<Map<String, Object>> getAllPunishList(Map<String, Object> map) {
		return punishDao.getAllPunishList(map);
	}

	public int getCount() {
		// TODO Auto-generated method stub
		return punishDao.getCount();
	}

	public List<Map<String, Object>> getAllCarInfo() {
		// TODO Auto-generated method stub
		return punishDao.getAllCarInfo();
	}

	public List<Map<String, Object>> getAllPunishInfo() {
		// TODO Auto-generated method stub
		return punishDao.getAllPunishInfo();
	}

	public void editPunish(Punish punish) {
		if(punish.getId() == null) {
			try {
				punish.setCreateTime(new Date());
				punishDao.savePunish(punish);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			try {
				punishDao.editPunish(punish);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
	}

	public Map<String, Object> getPunishInfoById(int parseInt) {
		return punishDao.getPunishInfoById(parseInt);
	}

	public void sendPunish(String res) {
		String [] ids =res.split(",");
		for(int i=0;i<ids.length;i++) {
			punishDao.sendPunish(Integer.parseInt(ids[i]));
		}
	}

	public void deletePunishById(String res) {
		String[] idStrings = res.split(",");
		for(String i: idStrings) {
			punishDao.deletePunishById(Integer.parseInt(i));
		}
		
	}

}
