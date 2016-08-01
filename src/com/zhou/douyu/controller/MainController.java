package com.zhou.douyu.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhou.douyu.pojo.Feedback;
import com.zhou.douyu.pojo.Room;
import com.zhou.douyu.service.BannedService;
import com.zhou.douyu.service.CxrjService;
import com.zhou.douyu.service.FeedbackService;
import com.zhou.douyu.service.GiftService;
import com.zhou.douyu.service.LtkgService;
import com.zhou.douyu.service.RoomService;
import com.zhou.douyu.service.UsersService;



@Controller
public class MainController {
		
	private RoomService roomService;
	private GiftService giftService;
	private BannedService bannedService;
	private LtkgService ltkgService;
	private CxrjService cxrjService;
	private UsersService usersService;
	private FeedbackService feedbackService;

	@RequestMapping("/")
	public String mainc(ModelMap map, HttpServletRequest request, HttpServletResponse response) {
		
		// 获取房间信息封装为room
		Room room = roomService.getRoom();

		map.addAttribute("room", room);
		map.addAttribute("todayYw", giftService.getTodayGift("鱼丸"));
		map.addAttribute("todayZ", giftService.getTodayGift("赞"));
		map.addAttribute("todayRj", giftService.getTodayGift("弱鸡"));
		map.addAttribute("todayStg", giftService.getTodayGift("神探赣"));
		map.addAttribute("todayFj", giftService.getTodayGift("飞机"));
		map.addAttribute("todayHj", giftService.getTodayGift("火箭"));
		return "main";
	}

	@RequestMapping("/zbsj")
	public String Zbsj(ModelMap map) {
		for (int i = 0; i <= 6; i++) {
			map.addAttribute("dayAgo" + i + "Yw", giftService.getRecentDaysGiftCount("鱼丸", i) * 100);
			map.addAttribute("dayAgo" + i + "Z", (int) (giftService.getRecentDaysGiftCount("赞", i) * 0.1));
			map.addAttribute("dayAgo" + i + "Rj", (int) (giftService.getRecentDaysGiftCount("弱鸡", i) * 0.2));
			map.addAttribute("dayAgo" + i + "Stg", giftService.getRecentDaysGiftCount("神探赣", i) * 6);
			map.addAttribute("dayAgo" + i + "Fj", giftService.getRecentDaysGiftCount("飞机", i) * 100);
			map.addAttribute("dayAgo" + i + "Hj", giftService.getRecentDaysGiftCount("火箭", i) * 500);

		}

		return "zbsj";
	}

	@RequestMapping("/zbsj/lwjl")
	public String lwjl(ModelMap map, HttpServletRequest request) {
		String page = request.getParameter("page");
		map.addAttribute("pageNow", page);
		int pagenow = Integer.parseInt(page);
		pagenow = (pagenow - 1) * 500;
		map.addAttribute("isShowFenYe", true);
		map.addAttribute("giftRecord", giftService.getGiftRecord(pagenow));
		map.addAttribute("giftRecordCount", giftService.getGiftRecordCount());
		return "lwjl";
	}

	@RequestMapping(value = "/zbsj/lwjl", method = RequestMethod.POST)
	public String lwjlById(ModelMap map, @RequestParam(value = "inputname") String inputname) {
		if ("" == inputname) {
			return "redirect:/zbsj/lwjl?page=1";
		}
		map.addAttribute("giftRecord", giftService.getGiftRecordByName(inputname.trim()));
		map.addAttribute("giftRecordCount", giftService.getGiftRecordCountByName(inputname.trim()));
		map.addAttribute("isShowFenYe", false);
		return "lwjl";

	}

	@RequestMapping("/zbsj/fjjl")
	public String fjjl(ModelMap map) {
		map.addAttribute("bannedRecord", bannedService.getAllBannedRecord());
		return "fjjl";
	}

	@RequestMapping(value = "/zbsj/fjjl", method = RequestMethod.POST)
	public String fjjuById(ModelMap map, @RequestParam("inputname") String name) {

		if ("" == name) {
			return "redirect:/zbsj/fjjl";
		}

		map.addAttribute("bannedRecord", bannedService.getBannedRecordByName(name.trim()));
		map.addAttribute("isShowFenYe", false);
		return "fjjl";
	}

	@RequestMapping(value = "/ltkg")
	public String ltkg(ModelMap map) {
		map.addAttribute("video", ltkgService.getLatestVideo());
		map.addAttribute("ltkg", ltkgService.getAllLtkg());
		return "ltkg";
	}

	@RequestMapping(value = "/ltkg/detail")
	public String ltkgVideo(ModelMap map, int videoid) {
		map.addAttribute("video", ltkgService.getVideoById(videoid));
		map.addAttribute("ltkg", ltkgService.getAllLtkg());
		return "ltkg";
	}

	@RequestMapping(value = "/cxrj")
	public String cxrj(ModelMap map, HttpServletRequest request) {
		map.addAttribute("allCxrj", cxrjService.getAllCxrj());
		return "cxrj";

	}

	@RequestMapping(value = "/checkUsernameIsNotExist")
	@ResponseBody
	public String checkUsernameIsNotExist(String username) {
		
		if (usersService.checkUsernameIsNotExist(username)) {
			return "{\"valid\":true}";
		} else {
			return "{\"valid\":false}";
		}

	}
	
	@RequestMapping(value = "/addFeedback")
	@ResponseBody
	public String addFeedback(Feedback feedback){
		feedbackService.addFeedback(feedback);
		return "<script>window.history.back(-1);</script>";
		
	}
	
	@RequestMapping(value="/autoSendMsg")
	public String autoSendMsg(){
		return "autoSendMsg";
	}
	
	

	public RoomService getRoomService() {
		return roomService;
	}

	@Resource
	public void setRoomService(RoomService roomService) {
		this.roomService = roomService;
	}

	public GiftService getGiftService() {
		return giftService;
	}

	@Resource
	public void setGiftService(GiftService giftService) {
		this.giftService = giftService;
	}

	public BannedService getBannedService() {
		return bannedService;
	}

	@Resource
	public void setBannedService(BannedService bannedService) {
		this.bannedService = bannedService;
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

	public UsersService getUsersService() {
		return usersService;
	}

	@Resource
	public void setUsersService(UsersService usersService) {
		this.usersService = usersService;
	}

	public FeedbackService getFeedbackService() {
		return feedbackService;
	}

	@Resource
	public void setFeedbackService(FeedbackService feedbackService) {
		this.feedbackService = feedbackService;
	}
}
