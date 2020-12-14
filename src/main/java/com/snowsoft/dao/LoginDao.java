package com.snowsoft.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.snowsoft.bean.User;
@Repository
public interface LoginDao {

	public List<Map<String, Object>> getMenuById(Integer uId);
	public User login(Map<String, Object> map);

}
