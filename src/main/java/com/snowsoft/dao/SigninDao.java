package com.snowsoft.dao;

import org.springframework.stereotype.Repository;

import com.snowsoft.bean.User;
@Repository
public interface SigninDao {
	public void sign(User user);

}
