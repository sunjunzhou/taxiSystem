package com.snowsoft.bean;

import java.util.Date;

public class Encourage {
	private Integer id;
	private Integer carId;
	private Integer isType;
	private Date sendTime;
	private Integer why;
	private Integer who_send;
	private Integer who_check;
	private Date successTime;
	private Integer isSend;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getCarId() {
		return carId;
	}
	public void setCarId(Integer carId) {
		this.carId = carId;
	}
	public Integer getIsType() {
		return isType;
	}
	public void setIsType(Integer isType) {
		this.isType = isType;
	}
	public Date getSendTime() {
		return sendTime;
	}
	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}
	public Integer getWhy() {
		return why;
	}
	public void setWhy(Integer why) {
		this.why = why;
	}
	public Integer getWho_send() {
		return who_send;
	}
	public void setWho_send(Integer who_send) {
		this.who_send = who_send;
	}
	public Integer getWho_check() {
		return who_check;
	}
	public void setWho_check(Integer who_check) {
		this.who_check = who_check;
	}
	public Date getSuccessTime() {
		return successTime;
	}
	public void setSuccessTime(Date successTime) {
		this.successTime = successTime;
	}
	public Integer getIsSend() {
		return isSend;
	}
	public void setIsSend(Integer isSend) {
		this.isSend = isSend;
	}
	public Encourage(Integer id, Integer carId, Integer isType, Date sendTime, Integer why, Integer who_send,
			Integer who_check, Date successTime, Integer isSend) {
		super();
		this.id = id;
		this.carId = carId;
		this.isType = isType;
		this.sendTime = sendTime;
		this.why = why;
		this.who_send = who_send;
		this.who_check = who_check;
		this.successTime = successTime;
		this.isSend = isSend;
	}
	
}
