package com.snowsoft.service;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.snowsoft.bean.Company;
import com.snowsoft.dao.CompanyDao;

@Service
@Transactional
public class CompanyService {
	@Autowired
	private CompanyDao companyDao;

	public List<Map<String, Object>> getCompanyList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return companyDao.getCompanyList();
	}

	public int getCount() {
		// TODO Auto-generated method stub
		return companyDao.getCount();
	}
	
	public Map<String,Object> getCompanyById(int id){
		return companyDao.getCompanyById(id);
	}
	
	public void updateCompanyInfo(Company com){
		companyDao.updateCompanyInfo(com);
	}
	
	public void deleteCompanyById(String res) {
		String [] ids =res.split(",");
		for(int i=0;i<ids.length;i++) {
			companyDao.deleteCompanyById(Integer.parseInt(ids[i]));
		}
		
	}

	public void insertCompanyInfo(Company com) {
		companyDao.insertCompanyInfo(com);
	}

}
