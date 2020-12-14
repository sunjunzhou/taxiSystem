package com.snowsoft.bean;

public class Company {
	private Integer id;
	private String shortName;
	private String fullName;
	private String businessNum;
	private String leaderName;
	private String tel;
	private String address;
	private Integer user_id;
	private String user_name;
	
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getShortName() {
		return shortName;
	}
	public void setShortName(String shortName) {
		this.shortName = shortName;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getBusinessNum() {
		return businessNum;
	}
	public void setBusinessNum(String businessNum) {
		this.businessNum = businessNum;
	}
	public String getLeaderName() {
		return leaderName;
	}
	public void setLeaderName(String leaderName) {
		this.leaderName = leaderName;
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
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public Company(Integer id, String shortName, String fullName, String businessNum, String leaderName, String tel,
			String address, Integer user_id, String user_name) {
		super();
		this.id = id;
		this.shortName = shortName;
		this.fullName = fullName;
		this.businessNum = businessNum;
		this.leaderName = leaderName;
		this.tel = tel;
		this.address = address;
		this.user_id = user_id;
		this.user_name = user_name;
	}
	
}
