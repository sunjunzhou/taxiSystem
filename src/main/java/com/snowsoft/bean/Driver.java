package com.snowsoft.bean;

public class Driver {
	private Integer id;
	private String name;
	private String sex;
	private String tel;
	private String card_Id;
	private String address;
	private String Native;
	private String carId;
	private Integer score;
	private Integer isType;
	private Integer isSend;
	private Integer company_id;
	
	public Integer getCompany_id() {
		return company_id;
	}
	public void setCompany_id(Integer company_id) {
		this.company_id = company_id;
	}
	public Integer getIsSend() {
		return isSend;
	}
	public void setIsSend(Integer is) {
		this.isSend = is;
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
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getCard_Id() {
		return card_Id;
	}
	public void setCard_Id(String card_id) {
		this.card_Id = card_id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getNative() {
		return Native;
	}
	public void setNative(String native1) {
		Native = native1;
	}
	public String getCarId() {
		return carId;
	}
	public void setCarId(String carId) {
		this.carId = carId;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public Integer getIsType() {
		return isType;
	}
	public void setIsType(Integer isType) {
		this.isType = isType;
	}
	
	public Driver(Integer id, String name, String sex, String tel, String card_Id, String address, String native1,
			String carId, Integer score, Integer isType, Integer isSend, Integer company_id) {
		super();
		this.id = id;
		this.name = name;
		this.sex = sex;
		this.tel = tel;
		this.card_Id = card_Id;
		this.address = address;
		Native = native1;
		this.carId = carId;
		this.score = score;
		this.isType = isType;
		this.isSend = isSend;
		this.company_id = company_id;
	}
	public Driver() {
		
	}
}
