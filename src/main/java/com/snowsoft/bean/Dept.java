package com.snowsoft.bean;

import java.util.Date;

public class Dept {
	private Integer id;
	private String name;
	private String describe;
	private String leader;
	private Date createtime;
	private Integer operator;
	private String operator_name;
	private Date operator_time;
	
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
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public String getLeader() {
		return leader;
	}
	public void setLeader(String leader) {
		this.leader = leader;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	public Integer getOperator() {
		return operator;
	}
	public void setOperator(Integer operator) {
		this.operator = operator;
	}
	public String getOperator_name() {
		return operator_name;
	}
	public void setOperator_name(String operator_name) {
		this.operator_name = operator_name;
	}
	public Date getOperator_time() {
		return operator_time;
	}
	public void setOperator_time(Date operator_time) {
		this.operator_time = operator_time;
	}
	
	public Dept(Integer id, String name, String describe, String leader, Date createtime, Integer operator,
			String operator_name, Date operator_time) {
		super();
		this.id = id;
		this.name = name;
		this.describe = describe;
		this.leader = leader;
		this.createtime = createtime;
		this.operator = operator;
		this.operator_name = operator_name;
		this.operator_time = operator_time;
	}
	
}