package com.snowsoft.bean;

import java.util.Date;

public class Rule {
	private Integer id;
	private String name;
	private String scription;
	private Integer score;
	private Integer type;
	private Date createTime;
	private Integer operator;
	public Integer getOperator() {
		return operator;
	}
	public void setOperator(Integer operator) {
		this.operator = operator;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
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
	public String getScription() {
		return scription;
	}
	public void setScription(String scription) {
		this.scription = scription;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Rule(Integer id, String name, String scription, Integer score, Integer type, Date createTime,
			Integer operator) {
		super();
		this.id = id;
		this.name = name;
		this.scription = scription;
		this.score = score;
		this.type = type;
		this.createTime = createTime;
		this.operator = operator;
	}

}
