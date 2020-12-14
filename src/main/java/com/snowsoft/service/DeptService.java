package com.snowsoft.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.snowsoft.bean.Dept;
import com.snowsoft.dao.DeptDao;

@Service
@Transactional
public class DeptService {
	@Autowired
	private DeptDao deptDao;

	public List<Map<String, Object>> getDeptList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return deptDao.getDeptList(map);
	}

	public int getCount() {
		// TODO Auto-generated method stub
		return deptDao.getCount();
	}
	
	public Map<String,Object> getdeptById(int id){
		return deptDao.getdeptById(id);
	}
	
	public void updateDeptInfo(Dept dept){
		deptDao.updateDeptInfo(dept);
	}
	
	public void deleteDeptById(String res) {
		String [] ids =res.split(",");
		for(int i=0;i<ids.length;i++) {
			System.out.println(ids[i]);
			deptDao.deleteDeptById(Integer.parseInt(ids[i]));
		}
		
	}

	public void insertDeptInfo(Dept dept) {
		deptDao.insertDeptInfo(dept);
	}
}
