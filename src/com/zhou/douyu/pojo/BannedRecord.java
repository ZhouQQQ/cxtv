package com.zhou.douyu.pojo;

import java.util.Date;

public class BannedRecord {
	private int id;
	private String name;
	private String operator;
	private Date banTime;
	private Date unlockTime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	public Date getBanTime() {
		return banTime;
	}
	public void setBanTime(Date banTime) {
		this.banTime = banTime;
	}
	public Date getUnlockTime() {
		return unlockTime;
	}
	public void setUnlockTime(Date date) {
		this.unlockTime = date;
	}
	
	@Override
	public String toString() {
		return "BannedRecord [id=" + id + ", name=" + name + ", operator=" + operator + ", banTime=" + banTime
				+ ", unlockTime=" + unlockTime + "]";
	}
}
