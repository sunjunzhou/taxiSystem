package com.snowsoft.bean;

import java.util.Date;

public class Car {
	private Integer id;
	private String carId;
	private String name;
	private String color;
	private Integer count_passenger;
	private String oilType;
	private Integer ownerId;
	private String car_type;
	private Integer isType;
	private String Engine_num;
	private String  date_production;
	private String vender;
	private Integer operator;
	private Date oper_time;
	private Integer isSend;
	private Integer driverId;
	private String check_suggestion;
	private Integer check_People;
	private String check_People_name;
	private Date sendTime;
	private Date sendSuccessTime;
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
	public void setIsSend(Integer isSend) {
		this.isSend = isSend;
	}
	public Integer getDriverId() {
		return driverId;
	}
	public void setDriverId(Integer driverId) {
		this.driverId = driverId;
	}
	public String getCheck_suggestion() {
		return check_suggestion;
	}
	public void setCheck_suggestion(String check_suggestion) {
		this.check_suggestion = check_suggestion;
	}
	public Integer getCheck_People() {
		return check_People;
	}
	public void setCheck_People(Integer check_People) {
		this.check_People = check_People;
	}
	public String getCheck_People_name() {
		return check_People_name;
	}
	public void setCheck_People_name(String check_People_name) {
		this.check_People_name = check_People_name;
	}
	public Date getSendTime() {
		return sendTime;
	}
	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}
	public Date getSendSuccessTime() {
		return sendSuccessTime;
	}
	public void setSendSuccessTime(Date sendSuccessTime) {
		this.sendSuccessTime = sendSuccessTime;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCar_type() {
		return car_type;
	}
	public void setCar_type(String car_type) {
		this.car_type = car_type;
	}
	public Integer getIsType() {
		return isType;
	}
	public void setIsType(Integer isType) {
		this.isType = isType;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCarId() {
		return carId;
	}
	public void setCarId(String carId) {
		this.carId = carId;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public Integer getCount_passenger() {
		return count_passenger;
	}
	public void setCount_passenger(Integer count_passenger) {
		this.count_passenger = count_passenger;
	}
	public String getOilType() {
		return oilType;
	}
	public void setOilType(String oilType) {
		this.oilType = oilType;
	}
	public Integer getOwnerId() {
		return ownerId;
	}
	public void setOwnerId(Integer ownerId) {
		this.ownerId = ownerId;
	}
	public String getEngine_num() {
		return Engine_num;
	}
	public void setEngine_num(String engin_num) {
		Engine_num = engin_num;
	}
	public String getDate_production() {
		return date_production;
	}
	public void setDate_production(String date_production) {
		this.date_production = date_production;
	}
	public String getVender() {
		return vender;
	}
	public void setVender(String vender) {
		this.vender = vender;
	}
	public Integer getOperator() {
		return operator;
	}
	public void setOperator(Integer operator) {
		this.operator = operator;
	}
	public Date getOper_time() {
		return oper_time;
	}
	public void setOper_time(Date oper_time) {
		this.oper_time = oper_time;
	}
	
	public Car(){
		
	}
	public Car(Integer id, String carId, String name, String color, Integer count_passenger, String oilType,
			Integer ownerId, String car_type, Integer isType, String engine_num, String date_production, String vender,
			Integer operator, Date oper_time, Integer isSend, Integer driverId, String check_suggestion,
			Integer check_People, String check_People_name, Date sendTime, Date sendSuccessTime, Integer company_id) {
		super();
		this.id = id;
		this.carId = carId;
		this.name = name;
		this.color = color;
		this.count_passenger = count_passenger;
		this.oilType = oilType;
		this.ownerId = ownerId;
		this.car_type = car_type;
		this.isType = isType;
		Engine_num = engine_num;
		this.date_production = date_production;
		this.vender = vender;
		this.operator = operator;
		this.oper_time = oper_time;
		this.isSend = isSend;
		this.driverId = driverId;
		this.check_suggestion = check_suggestion;
		this.check_People = check_People;
		this.check_People_name = check_People_name;
		this.sendTime = sendTime;
		this.sendSuccessTime = sendSuccessTime;
		this.company_id = company_id;
	}
	
	
}
