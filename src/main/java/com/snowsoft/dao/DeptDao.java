package com.snowsoft.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.snowsoft.bean.Dept;

@Repository
public interface DeptDao {

	List<Map<String, Object>> getDeptList(Map<String, Object> map);

	int getCount();
	
	Map<String,Object> getdeptById(int id);

	void updateDeptInfo(Dept dept);
	
	void deleteDeptById(int parseInt);

	void insertDeptInfo(Dept dept);

}
