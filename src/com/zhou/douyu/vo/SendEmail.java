package com.zhou.douyu.vo;

public class SendEmail {
	private boolean state;
	private String msg;
	
	public boolean isState() {
		return state;
	}

	public void setState(boolean state) {
		this.state = state;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public SendEmail(boolean state, String msg) {
		super();
		this.state = state;
		this.msg = msg;
	}
	
	
}
