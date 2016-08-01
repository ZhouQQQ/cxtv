package com.zhou.douyu.controller;

/**
 * GeetestWeb配置文件
 * 
 *
 */
public class GeetestConfig {

	// 填入自己的captcha_id和private_key
	private static final String captcha_id = "faf37a2569a157d61c3e377d0ecab000";
	private static final String private_key = "255695fabf94ab727ae46c5d6af9472b";

	public static final String getCaptcha_id() {
		return captcha_id;
	}

	public static final String getPrivate_key() {
		return private_key;
	}

}
