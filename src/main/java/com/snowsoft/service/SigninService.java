package com.snowsoft.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.snowsoft.bean.User;
import com.snowsoft.dao.SigninDao;
@Service
@Transactional
public class SigninService {
	@Autowired
	private SigninDao signDao;
	
	public void sign(User user){
		signDao.sign(user);
	
		
	}

}
