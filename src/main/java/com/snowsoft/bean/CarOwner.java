package com.snowsoft.bean;

import java.util.Date;

public class CarOwner {
	private Integer id;
	private String name;
	private String sex;
	private String cardId;
	private String tel;
	private String address;
	private Integer operator;
	private Date operator_time;
	private Integer company_id;
	private String shortName;
	private Integer checkPeople;
	private String checkPeople_name;
	private Date check_time;
	private Integer isType;
	private String check_suggestion;
	private Integer isSend;
	
	public Integer getIsSend() {
		return isSend;
	}
	public void setIsSend(Integer is) {
		this.isSend = is;
	}
	public String getCheck_suggestion() {
		return check_suggestion;
	}
	public void setCheck_suggestion(String check_suggestion) {
		this.check_suggestion = check_suggestion;
	}
	public String getShortName() {
		return shortName;
	}
	public void setShortName(String shortName) {
		this.shortName = shortName;
	}
	public Integer getCheckPeople() {
		return checkPeople;
	}
	public void setCheckPeople(Integer checkPeople) {
		this.checkPeople = checkPeople;
	}
	public String getCheckPeople_name() {
		return checkPeople_name;
	}
	public void setCheckPeople_name(String checkPeople_name) {
		this.checkPeople_name = checkPeople_name;
	}
	public Date getCheck_time() {
		return check_time;
	}
	public void setCheck_time(Date check_time) {
		this.check_time = check_time;
	}
	public Integer getisType() {
		return isType;
	}
	public void setisType(Integer istype) {
		this.isType = istype;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getCarId() {
		return cardId;
	}
	public void setCardId(String cardId) {
		this.cardId = cardId;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getOperator() {
		return operator;
	}
	public void setOperator(Integer operator) {
		this.operator = operator;
	}
	public Date getOperator_time() {
		return operator_time;
	}
	public void setOperator_time(Date operator_time) {
		this.operator_time = operator_time;
	}
	public Integer getCompany_id() {
		return company_id;
	}
	public void setCompany_id(Integer company_id) {
		this.company_id = company_id;
	}
	
	
	public CarOwner(Integer id, String name, String sex, String cardId, String tel, String address, Integer operator,
			Date operator_time, Integer company_id, String shortName, Integer checkPeople, String checkPeople_name,
			Date check_time, Integer isType,String str,Integer is) {
		super();
		this.id = id;
		this.name = name;
		this.sex = sex;
		this.cardId = cardId;
		this.tel = tel;
		this.address = address;
		this.operator = operator;
		this.operator_time = operator_time;
		this.company_id = company_id;
		this.shortName = shortName;
		this.checkPeople = checkPeople;
		this.checkPeople_name = checkPeople_name;
		this.check_time = check_time;
		this.isType = isType;
		this.check_suggestion = str;
		this.isSend = is;
	}
	public CarOwner() {
		
	}
}
