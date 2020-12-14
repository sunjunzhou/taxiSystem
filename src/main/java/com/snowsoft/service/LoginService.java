package com.snowsoft.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.snowsoft.bean.User;
import com.snowsoft.dao.LoginDao;
@Service
@Transactional
public class LoginService {
	@Autowired
	private LoginDao loginDao;
//	public boolean login(User user){
//		User user1 = loginDao.login(user);
//		if(user1!=null){
//			return true;
//		}else{
//			return false;
//		}
//	}
	public User login(String username,String password){
		Map<String,Object> map =new HashMap<String,Object>(); 
		map.put("username", username);
		map.put("password", password);
		User user = loginDao.login(map);
		return user;
	}
	public List<Map<String,Object>> getMenuListById(User u){
		return loginDao.getMenuById(u.getuId());
	}

}
