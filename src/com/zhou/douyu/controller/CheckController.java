package com.zhou.douyu.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.geetest.sdk.java.GeetestLib;
import com.zhou.douyu.pojo.User;
import com.zhou.douyu.service.UsersService;

@Controller
public class CheckController {

	private UsersService usersService;

	@RequestMapping(value = "/startCaptcha")
	public void startCaptcha(HttpServletRequest request, HttpServletResponse response) throws IOException {
		GeetestLib gtSdk = new GeetestLib(GeetestConfig.getCaptcha_id(), GeetestConfig.getPrivate_key());

		String resStr = "{}";
		// 自定义userid
		String userid = "test";
		// 进行验证预处理
		int gtServerStatus = gtSdk.preProcess(userid);
		// 将服务器状态设置到session中
		request.getSession().setAttribute(gtSdk.gtServerStatusSessionKey, gtServerStatus);
		// 将userid设置到session中
		request.getSession().setAttribute("userid", userid);
		resStr = gtSdk.getResponseStr();
		PrintWriter out = response.getWriter();
		out.println(resStr);

	}

	@RequestMapping(value = "/verifyRegister")
	public String verifyLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {

		GeetestLib gtSdk = new GeetestLib(GeetestConfig.getCaptcha_id(), GeetestConfig.getPrivate_key());

		String challenge = request.getParameter(GeetestLib.fn_geetest_challenge);
		String validate = request.getParameter(GeetestLib.fn_geetest_validate);
		String seccode = request.getParameter(GeetestLib.fn_geetest_seccode);

		// 从session中获取gt-server状态
		int gt_server_status_code = (Integer) request.getSession().getAttribute(gtSdk.gtServerStatusSessionKey);

		// 从session中获取userid
		String userid = (String) request.getSession().getAttribute("userid");

		int gtResult = 0;

		if (gt_server_status_code == 1) {
			// gt-server正常，向gt-server进行二次验证
			gtResult = gtSdk.enhencedValidateRequest(challenge, validate, seccode, userid);
			// System.out.println(gtResult);
		} else {
			// gt-server非正常情况下，进行failback模式验证
			// System.out.println("failback:use your own server captcha
			// validate");
			gtResult = gtSdk.failbackValidateRequest(challenge, validate, seccode);
			// System.out.println(gtResult);
		}

		if (gtResult == 1) {
			// 验证成功
			String userName = request.getParameter("username");
			String passWord = request.getParameter("password");
			String whosFans = request.getParameter("inlineRadioOptions");
			User user = new User();
			user.setUsername(userName);
			user.setPassword(passWord);
			if (whosFans == null) {
				user.setWhosFans("新司机");
			} else {
				user.setWhosFans(whosFans);
			}
			usersService.addUser(user);
			request.getSession().setAttribute("user", user);
			return "redirect:/verifyRegister/registerSuccess";
		} else {
			// 验证失败
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/verifyRegister/registerSuccess")
	public String registerSuccess(HttpServletRequest request, HttpServletResponse response) {
		response.setHeader("refresh", "3;URL=/cxtv");		
		return "registerSuccess";
	}

	@RequestMapping(value = "/verifyLogin", method = RequestMethod.POST)
	@ResponseBody
	public String CheckUser(HttpServletRequest request, HttpServletResponse response) {
		GeetestLib gtSdk = new GeetestLib(GeetestConfig.getCaptcha_id(), GeetestConfig.getPrivate_key());

		String challenge = request.getParameter(GeetestLib.fn_geetest_challenge);
		String validate = request.getParameter(GeetestLib.fn_geetest_validate);
		String seccode = request.getParameter(GeetestLib.fn_geetest_seccode);

		// 从session中获取gt-server状态
		int gt_server_status_code = (Integer) request.getSession().getAttribute(gtSdk.gtServerStatusSessionKey);

		// 从session中获取userid
		String userid = (String) request.getSession().getAttribute("userid");

		int gtResult = 0;

		if (gt_server_status_code == 1) {
			// gt-server正常，向gt-server进行二次验证
			gtResult = gtSdk.enhencedValidateRequest(challenge, validate, seccode, userid);
			// System.out.println(gtResult);
		} else {
			// gt-server非正常情况下，进行failback模式验证
			// System.out.println("failback:use your own server captcha
			// validate");
			gtResult = gtSdk.failbackValidateRequest(challenge, validate, seccode);
			// System.out.println(gtResult);
		}

		if (gtResult == 1) {
			// 验证成功
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			if (usersService.checkUser(username, password)) {
				// 根据用户名获取User对象 并放入Session
				User user = usersService.getUserByUsername(username);
				request.getSession().setAttribute("user", user);
				return "true";
			} else {
				return "false";
			}
		} else {
			// 验证失败
			return "error";
		}

	}

	@RequestMapping(value = "/logout")
	public void logout(HttpSession session) {
		session.removeAttribute("user");
	}

	public UsersService getUsersService() {
		return usersService;
	}

	@Resource
	public void setUsersService(UsersService usersService) {
		this.usersService = usersService;
	}
}
