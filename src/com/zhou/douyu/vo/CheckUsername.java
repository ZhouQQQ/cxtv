package com.zhou.douyu.vo;

public class CheckUsername {
	private boolean valid;

	public boolean isValid() {
		return valid;
	}

	public void setValid(boolean valid) {
		this.valid = valid;
	}

	public CheckUsername(boolean valid) {
		super();
		this.valid = valid;
	}
}
