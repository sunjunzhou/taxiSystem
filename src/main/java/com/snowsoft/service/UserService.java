package com.snowsoft.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.snowsoft.bean.User;
import com.snowsoft.dao.UserDao;
@Service
@Transactional
public class UserService {
	@Autowired
	private UserDao userDao;
	public int getAllCount(){
		return userDao.getAllCount();
	}
	public List<Map<String,Object>> getAllInfo(Map<String, Object> map){
		return userDao.getAllInfo();
	}
	public List<Map<String, Object>> getAllDeptInfo() {
		List<Map<String, Object>> list = userDao.getAllDeptInfo();
		return list;
	}

	public void editUser(User user) {
		if(user.getuId() == null) {
			String[] menu_id = user.getMenu_id();
			int length = menu_id.length;
			userDao.saveUser(user);
			if(length != 0) {
				Map<String, Object> map = new HashMap<String, Object>();
				for(int i=0; i<length; i++) {
					map.put("user_id", user.getuId());
					map.put("menu_id", menu_id[i]);
					userDao.saveMenu(map);
					map.clear();
				}
			}
			
		}else {
			userDao.deleteOwnMenu(user.getuId());
			String[] menu_id = user.getMenu_id();
			int length = menu_id.length;
			if(length != 0) {
				Map<String, Object> map = new HashMap<String, Object>();
				for(int i=0; i<length; i++) {
					map.put("user_id", user.getuId());
					map.put("menu_id", menu_id[i]);
					userDao.saveMenu(map);
					map.clear();
				}
		}
			userDao.editUser(user);
		}
	}
	
	public void deleteUserById(String res) {
		String [] ids =res.split(",");
		for(int i=0;i<ids.length;i++) {
			userDao.deleteOwnMenu(Integer.parseInt(ids[i]));
			userDao.deleteUserById(Integer.parseInt(ids[i]));
			
		}
		
	}
	
	public Map<String,Object> getUserById(int id){
		return userDao.getUserById(id);
	}
	public List<Map<String, Object>> getAllCompanyInfo() {
		List<Map<String, Object>> list = userDao.getAllCompanyInfo();
		return list;
	}
	public List<Map<String, Object>> getAllMenuInfo() {
		List<Map<String, Object>> list = userDao.getAllMenuInfo();
		return list;
	}
	public List<Map<String, Object>> getOwnMenuInfo(int id) {
		return userDao.getOwnMenuInfo(id);
	}

	
}
