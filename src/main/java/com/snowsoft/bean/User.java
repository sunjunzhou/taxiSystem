package com.snowsoft.bean;

import java.util.Arrays;
import java.util.Date;

public class User {
	private Integer uId;
	private String uName;
	private String mobile;
	private String uPassword;
	private String uSex;
	private String uBirth;
	private String uAddress;
	private Integer uDeptId;
	private Integer uType;
	private Integer uOperate;
	private Date uOperateTime;
	private Integer companyId;
	private String company;
	private String[] menu_id;
	private String uOperate_name;
	public String getuOperate_name() {
		return uOperate_name;
	}
	public void setuOperate_name(String name) {
		this.uOperate_name = name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public Integer getuId() {
		return uId;
	}
	public void setuId(Integer uId) {
		this.uId = uId;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuPassword() {
		return uPassword;
	}
	public void setuPassword(String uPassword) {
		this.uPassword = uPassword;
	}
	public String getuSex() {
		return uSex;
	}
	public void setuSex(String uSex) {
		this.uSex = uSex;
	}
	public String getuBirth() {
		return uBirth;
	}
	public void setuBirth(String uBirth) {
		this.uBirth = uBirth;
	}
	public String getuAddress() {
		return uAddress;
	}
	public void setuAddress(String uAddress) {
		this.uAddress = uAddress;
	}
	public Integer getuDeptId() {
		return uDeptId;
	}
	public void setuDeptId(Integer uDeptId) {
		this.uDeptId = uDeptId;
	}
	public Integer getuType() {
		return uType;
	}
	public void setuType(Integer uType) {
		this.uType = uType;
	}
	public Integer getuOperate() {
		return uOperate;
	}
	public void setuOperate(Integer uOperate) {
		this.uOperate = uOperate;
	}
	public Date getuOperateTime() {
		return uOperateTime;
	}
	public void setuOperateTime(Date uOperateTime) {
		this.uOperateTime = uOperateTime;
	}
	public Integer getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	
	public User(Integer uId, String uName, String mobile, String uPassword, String uSex, String uBirth, String uAddress,
			Integer uDeptId, Integer uType, Integer uOperate, Date uOperateTime, Integer companyId, String company,
			String[] menu_id,String name) {
		super();
		this.uId = uId;
		this.uName = uName;
		this.mobile = mobile;
		this.uPassword = uPassword;
		this.uSex = uSex;
		this.uBirth = uBirth;
		this.uAddress = uAddress;
		this.uDeptId = uDeptId;
		this.uType = uType;
		this.uOperate = uOperate;
		this.uOperateTime = uOperateTime;
		this.companyId = companyId;
		this.company = company;
		this.menu_id = menu_id;
		this.uOperate_name = name;
	}
	
	public User(String uName, String uPassword) {
		super();
		this.uName = uName;
		this.uPassword = uPassword;
	}
	public User() {
		super();
	}
	
	public String[] getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(String[] menu_id) {
		this.menu_id = menu_id;
	}
	@Override
	public String toString() {
		return "User [uId=" + uId + ", uName=" + uName + ", mobile=" + mobile + ", uPassword=" + uPassword + ", uSex="
				+ uSex + ", uBirth=" + uBirth + ", uAddress=" + uAddress + ", uDeptId=" + uDeptId + ", uType=" + uType
				+ ", uOperate=" + uOperate + ", uOperateTime=" + uOperateTime + ", companyId=" + companyId
				+ ", company=" + company + ", menu_id=" + Arrays.toString(menu_id) + ", uOperate_name=" + uOperate_name
				+ "]";
	}
	
	
}
