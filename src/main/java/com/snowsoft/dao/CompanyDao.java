package com.snowsoft.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.snowsoft.bean.Company;
@Repository
public interface CompanyDao {

	List<Map<String, Object>> getCompanyList();
	int getCount();
	
	Map<String,Object> getCompanyById(int id);

	void updateCompanyInfo(Company com);

	void saveCompanyInfo(Company com);
	
	void deleteCompanyById(int parseInt);

	void insertCompanyInfo(Company com);
}
