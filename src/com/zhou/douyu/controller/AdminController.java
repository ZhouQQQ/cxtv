package com.zhou.douyu.controller;

import java.io.File;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.zhou.douyu.pojo.Cxrj;
import com.zhou.douyu.pojo.Ltkg;
import com.zhou.douyu.pojo.User;
import com.zhou.douyu.service.CxrjService;
import com.zhou.douyu.service.FeedbackService;
import com.zhou.douyu.service.LtkgService;
import com.zhou.douyu.service.UsersService;
import com.zhou.douyu.utils.FormatTransfer;
import com.zhou.douyu.vo.SendEmail;

/** 
 * @author Administrator * 
 *	管理界面的请求控制器
 */

@Controller
public class AdminController {

	private LtkgService ltkgService;
	private CxrjService cxrjService;
	private UsersService userService;
	private FeedbackService feedbackService;

	/**
	 * 映射管理主界面的请求
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/admin")
	public String admin(ModelMap map) {
		map.addAttribute("countLtkg", ltkgService.getCountLtkg());
		map.addAttribute("countCxrj", cxrjService.getCountCxrj());
		map.addAttribute("allFeedback", feedbackService.getAllFeedback());
		return "admin";
	}
	
	
	/**
	 * 映射管理K歌的请求
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/admin/ltkg")
	public String manageLtkg(ModelMap map) {
		map.addAttribute("ltkg", ltkgService.getAllLtkg());
		map.addAttribute("countLtkg", ltkgService.getCountLtkg());
		map.addAttribute("countCxrj", cxrjService.getCountCxrj());
		return "manageLtkg";
	}
	
	/**
	 * 映射增加K歌的请求
	 * @param request
	 * @param session
	 * @return 跳转到管理k歌界面
	 */

	@RequestMapping(value = "/admin/addLtkg", method = RequestMethod.POST)
	public String addLtkg(HttpServletRequest request, HttpSession session) {
		Ltkg ltkg = new Ltkg();
		ltkg.setDate(FormatTransfer.String2Date(request.getParameter("date")));
		ltkg.setCode(request.getParameter("code"));
		ltkg.setTitle(request.getParameter("title"));
		User user = (User) session.getAttribute("user");
		if (user != null) {
			ltkg.setAddUser(user.getUsername());
		}
		ltkgService.add(ltkg);
		return "redirect:/admin/ltkg";
	}

	/**
	 * 映射根据ID删除K歌的请求
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/admin/deleteLtkgById/{id}")
	public String deleteLtkgById(@PathVariable int id) {
		ltkgService.deleteLtkgById(id);
		return "redirect:/admin/ltkg";
	}

	/**
	 * 映射通过ID获取K歌的ajax请求
	 * @param id
	 * @return 返回json
	 */
	@RequestMapping(value = "/admin/getLtkgInfo")
	@ResponseBody
	public Ltkg getLtkgInfo(int id) {
		return ltkgService.getVideoById(id);
	}

	/**
	 *映射更改K歌的请求
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/admin/updateLtkg")
	public String updateLtkg(HttpServletRequest request) {
		String newTitle = request.getParameter("updatetitle");
		String newdate = request.getParameter("updatedate");
		String id = request.getParameter("id");
		String newCode = request.getParameter("updatecode");
		Ltkg newLtkg = new Ltkg();
		newLtkg.setId(Integer.valueOf(id));
		newLtkg.setTitle(newTitle);
		newLtkg.setCode(newCode);
		newLtkg.setDate(FormatTransfer.String2Date(newdate));
		ltkgService.update(newLtkg);

		return "redirect:/admin/ltkg";
	}

	/**
	 * 映射日记管理界面的请求
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/admin/cxrj")
	public String manageCxrj(ModelMap map) {
		map.addAttribute("countLtkg", ltkgService.getCountLtkg());
		map.addAttribute("countCxrj", cxrjService.getCountCxrj());
		map.addAttribute("cxrj", cxrjService.getAllCxrj());
		return "manageCxrj";
	}

	/**
	 * 映射日记内容框上传图片的请求
	 * @param request
	 * @param file
	 * @return 返回图片link的json字符串
	 * @throws JSONException
	 */
	@RequestMapping(value = "/admin/cxrj/uploadimage", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public Object handlerImageUpload(HttpServletRequest request, @RequestParam("file") CommonsMultipartFile file)
			throws JSONException {

		Date date = new Date();
		String time = String.valueOf(date.getTime());
		String uploadPath = "D:/apache-tomcat-8.0.36/wtpwebapps/upload_cxrj/content/"
				+ time + file.getOriginalFilename();
		File newFile = new File(uploadPath);
		
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/upload_cxrj/cover/" + time + file.getOriginalFilename();
		try {
			file.getFileItem().write(newFile);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return "";
		}
		String returnStr = "{\"link\":\"" + basePath + "\"}";
		return returnStr;
	}
	
	/*
	 * 映射管理增加日记的请求
	 * 
	 */
	@RequestMapping(value = "/admin/addCxrj", method = RequestMethod.POST)
	public String addCxrj(HttpServletRequest request,
			@RequestParam(value = "cover", required = false) CommonsMultipartFile file) {
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() +request.getContextPath()+"/img/cxrj/cover/";
		
		
		String fileType = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		String path = request.getServletContext().getRealPath("img/cxrj/cover");
		String unixTimeStamp = String.valueOf(new Date().getTime());		
		String fileName = unixTimeStamp + request.getParameter("date") + fileType;
		File newFile = new File(path,fileName);
		if(!newFile.exists()){
			newFile.mkdirs();
		}
		try {						
				file.transferTo(newFile);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Cxrj cxrj = new Cxrj();
		cxrj.setDate(FormatTransfer.String2Date(request.getParameter("date")));
		cxrj.setContent(request.getParameter("content"));
		cxrj.setCover(basePath+fileName);
		cxrj.setTitle(request.getParameter("title"));
		cxrjService.add(cxrj);
		return "redirect:/admin/cxrj";
	}
	
	/**
	 * 映射删除日记的请求
	 * @param id 日记的id
	 * @return
	 */
	@RequestMapping(value = "/admin/deleteCxrjById/{id}")
	public String deleteCxrjById(@PathVariable int id) {
		cxrjService.deleteCxrjById(id);
		return "redirect:/admin/cxrj";
	}

	/**
	 * 映射更新日记的请求
	 * @param request
	 * @param file
	 * @return
	 */
	@RequestMapping(value = "/admin/updateCxrj")
	public String updateCxrj(HttpServletRequest request,
			@RequestParam(value = "editCover", required = false) CommonsMultipartFile file) {
		String newTitle = request.getParameter("editTitle");
		String newdate = request.getParameter("editDate");
		int id = Integer.valueOf(request.getParameter("id"));
		String newContent = request.getParameter("editContent");
		
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() +request.getContextPath()+"/img/cxrj/cover/";
		Cxrj cxrj = new Cxrj();
		if (!file.isEmpty()) {
			String fileType = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			String unixTimeStamp = String.valueOf(new Date().getTime());
			String path = request.getServletContext().getRealPath("img/cxrj/cover");
			String fileName = unixTimeStamp + newdate + fileType;
			File newFile = new File(path,fileName);
			if (!newFile.exists()) {
				try {
					file.transferTo(newFile);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();					
				}
			}

			cxrj.setCover(basePath+fileName);
		}

		cxrj.setId(id);
		cxrj.setTitle(newTitle);
		cxrj.setDate(FormatTransfer.String2Date(newdate));
		cxrj.setContent(newContent);
		cxrjService.update(cxrj);

		return "redirect:/admin/cxrj";
	}

	/**
	 * 映射ajax请求返回日记实体json数据
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/admin/getCxrjById")
	@ResponseBody
	public Cxrj getCxrjById(int id) {
		return cxrjService.getCxrjById(id);
	}

	/**
	 * 映射管理用户界面的请求
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/admin/users")
	public String manageUsers(ModelMap map) {
		map.addAttribute("countLtkg", ltkgService.getCountLtkg());
		map.addAttribute("countCxrj", cxrjService.getCountCxrj());
		map.addAttribute("users", userService.getAllUsers());
		return "manageUsers";
	}

	/**
	 * ajax请求 返回用户信息json对象
	 * @param map
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/admin/getUserInfo")
	@ResponseBody
	public User getUserInfo(ModelMap map, int id) {
		return userService.getUserById(id);
	}

	/**
	 * 映射更新用户信息请求
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/admin/updateUser", method = RequestMethod.POST)
	public String updateUser(HttpServletRequest request) {
		int id = Integer.valueOf(request.getParameter("id"));
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String whosFans = request.getParameter("whosFans");
		String userType = request.getParameter("userType");
		Date registerTime = FormatTransfer.String2DateTime(request.getParameter("registerTime"));
		User user = new User();
		user.setId(id);
		user.setUsername(username);
		user.setPassword(password);
		user.setWhosFans(whosFans);
		user.setUserType(userType);
		user.setRegisterTime(registerTime);
		userService.updateUser(user);
		return "redirect:/admin/users";
	}
	
	/**
	 * 映射同伙用户ID删除用户数据的请求
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/admin/deleteUserById/{id}")
	public String deleteUserById(@PathVariable int id) {
		userService.deleteUserById(id);
		return "redirect:/admin/users";
	}
	
	/**
	 * 映射发邮件的请求
	 * @param email
	 * @param content
	 * @return
	 */
	@RequestMapping(value="/admin/sendEmailWindow")
	@ResponseBody
	public SendEmail sendEmailWindow(String email,String content){		
		try {
			feedbackService.SendEmailToUser(email, "CXTV给您的反馈", content);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new SendEmail(false, "发送失败");
		}
		return new SendEmail(true, "发送成功");
	}
	
	

	public LtkgService getLtkgService() {
		return ltkgService;
	}

	@Resource
	public void setLtkgService(LtkgService ltkgService) {
		this.ltkgService = ltkgService;
	}

	public CxrjService getCxrjService() {
		return cxrjService;
	}

	@Resource
	public void setCxrjService(CxrjService cxrjService) {
		this.cxrjService = cxrjService;
	}

	public UsersService getUserService() {
		return userService;
	}

	@Resource
	public void setUserService(UsersService userService) {
		this.userService = userService;
	}


	public FeedbackService getFeedbackService() {
		return feedbackService;
	}


	@Resource
	public void setFeedbackService(FeedbackService feedbackService) {
		this.feedbackService = feedbackService;
	}

}
