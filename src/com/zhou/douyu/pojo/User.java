package com.zhou.douyu.pojo;

import java.util.Date;

public class User {
	private int id;
	private String username;
	private String password;
	private String whosFans;	
	
	private Date registerTime;
	private String userType;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getWhosFans() {
		return whosFans;
	}

	public void setWhosFans(String whosFans) {
		this.whosFans = whosFans;
	}

	public Date getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

}
