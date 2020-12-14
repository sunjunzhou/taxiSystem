package com.snowsoft.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.snowsoft.bean.User;
@Repository
public interface UserDao {
	public int getAllCount();
	public List<Map<String,Object>> getAllInfo();
	public List<Map<String, Object>> getAllDeptInfo();
	public void editUser(User user);
	public void deleteUserById(int parseInt);
	public Map<String, Object> getUserById(int id);
	public void saveUser(User user);
	public List<Map<String, Object>> getAllCompanyInfo();
	public List<Map<String, Object>> getAllMenuInfo();
	public void saveMenu(Map<String, Object> map);
	public List<Map<String, Object>> getOwnMenuInfo(int id);
	public void updateMenu(Map<String, Object> map);
	public void deleteOwnMenu(Integer id);
}
