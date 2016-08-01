package com.zhou.douyu.client;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.net.InetAddress;
import java.net.Socket;
import java.text.ParseException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

import com.zhou.douyu.msg.DyMessage;
import com.zhou.douyu.msg.MsgView;
import com.zhou.douyu.pojo.BannedRecord;
import com.zhou.douyu.pojo.Gift;
import com.zhou.douyu.pojo.GiftRecord;
import com.zhou.douyu.service.BannedService;
import com.zhou.douyu.service.GiftService;
import com.zhou.douyu.service.RoomService;
import com.zhou.douyu.utils.FormatTransfer;

/**
 * @Summary: 弹幕客户端类
 * @author: FerroD
 * @date: 2016-3-12
 * @version V1.0
 */

@Component
public class DyBulletScreenClient {

	private static HashMap<String, String> giftType = new HashMap<String, String>();

	private GiftService giftService;
	private BannedService bannedService;
	private RoomService roomservice;

	// 第三方弹幕协议服务器地址
	private static final String hostName = "openbarrage.douyutv.com";

	// 第三方弹幕协议服务器端口
	private static final int port = 8601;

	// 设置字节获取buffer的最大值
	private static final int MAX_BUFFER_LENGTH = 4096;

	// socket相关配置
	private Socket sock;
	private BufferedOutputStream bos;
	private BufferedInputStream bis;

	// 获取弹幕线程及心跳线程运行和停止标记
	private boolean readyFlag = false;

	/**
	 * 解析从服务器接受的协议，并根据需要订制业务需求
	 * 
	 * @param msg
	 * @throws ParseException
	 */
	private void parseServerMsg(Map<String, Object> msg) throws ParseException {
		if (msg.get("type") != null) {
			// 服务器反馈错误信息
			if (msg.get("type").equals("error")) {
				// System.out.println(msg.toString());
				// 结束心跳和获取弹幕线程
				this.readyFlag = false;
			}

			/*** @TODO 根据业务需求来处理获取到的所有弹幕及礼物信息 ***********/

			// 判断消息类型
			if (msg.get("type").equals("chatmsg")) {// 弹幕消息
				

			} else if (msg.get("type").equals("dgb")) {// 赠送礼物信息
				System.out.println("礼物消息===>" + msg.toString());
				GiftRecord giftRecord = new GiftRecord();
				// 先去集合里面找 有集合里面有直接取出 避免发送请求
				if (giftType.containsKey(msg.get("gfid"))) {
					String gt = giftType.get(msg.get("gfid"));
					giftRecord.setType(gt);
				} else {
					List<Gift> gifts = roomservice.getRoom().getData().getGift();
					Collections.reverse(gifts);
					for (Iterator<Gift> iterator = gifts.iterator(); iterator.hasNext();) {
						Gift gift = (Gift) iterator.next();
						giftType.put(gift.getId(), gift.getName());
					}
					String gfid = (String) msg.get("gfid");

					if (gfid != null) {
						for (Gift gift : gifts) {
							if (gfid.equals(gift.getId())) {
								String nowType = gift.getType();
								int nowGx = gift.getGx();
								if (nowType.equals("1") && nowGx == 1) {
									giftRecord.setType("鱼丸");
									break;
								} else if (nowType.equals("2") && nowGx == 1) {
									giftRecord.setType("赞");
									break;
								} else if (nowType.equals("2") && nowGx == 2) {
									giftRecord.setType("弱鸡");
									break;
								} else if (nowType.equals("2") && nowGx == 60) {
									giftRecord.setType("神探赣");
									break;
								} else if (nowType.equals("2") && nowGx == 1000) {
									giftRecord.setType("飞机");
									break;
								} else if (nowType.equals("2") && nowGx == 5000) {
									giftRecord.setType("火箭");
									break;
								}

							}
						}

					}

				}
				giftRecord.setName((String) msg.get("nn"));
				giftService.add(giftRecord);
			} else if (msg.get("type").equals("1")) {
				BannedRecord bannedRecord = new BannedRecord();
				bannedRecord.setName((String) msg.get("dnic"));
				bannedRecord.setOperator((String) msg.get("snic"));
				bannedRecord.setUnlockTime(FormatTransfer.TimeStamp2Date((String) msg.get("endtime")));
				bannedService.save(bannedRecord);
			} else {
				// System.out.println("其他消息===>" + msg.toString());
			}

		}
	}

	/**
	 * 客户端初始化，连接弹幕服务器并登陆房间及弹幕池
	 * 
	 * @param roomId
	 *            房间ID
	 * @param groupId
	 *            弹幕池分组ID
	 */
	public void init(int roomId, int groupId) {
		// 连接弹幕服务器
		this.connectServer();
		// 登陆指定房间
		this.loginRoom(roomId);
		// 加入指定的弹幕池
		this.joinGroup(roomId, groupId);
		// 设置客户端就绪标记为就绪状态
		readyFlag = true;
	}

	/**
	 * 获取弹幕客户端就绪标记
	 * 
	 * @return
	 */
	public boolean getReadyFlag() {
		return readyFlag;
	}

	/**
	 * 连接弹幕服务器
	 */
	private void connectServer() {
		try {
			// 获取弹幕服务器访问host
			String host = InetAddress.getByName(hostName).getHostAddress();
			// 建立socke连接
			sock = new Socket(host, port);
			// 设置socket输入及输出
			bos = new BufferedOutputStream(sock.getOutputStream());
			bis = new BufferedInputStream(sock.getInputStream());
		} catch (Exception e) {
			e.printStackTrace();
		}

		// System.out.println("服务连接成功");
	}

	/**
	 * 登录指定房间
	 * 
	 * @param roomId
	 */
	private void loginRoom(int roomId) {
		// 获取弹幕服务器登陆请求数据包
		byte[] loginRequestData = DyMessage.getLoginRequestData(roomId);

		try {
			// 发送登陆请求数据包给弹幕服务器
			bos.write(loginRequestData, 0, loginRequestData.length);
			bos.flush();

			// 初始化弹幕服务器返回值读取包大小
			byte[] recvByte = new byte[MAX_BUFFER_LENGTH];
			// 获取弹幕服务器返回值
			bis.read(recvByte, 0, recvByte.length);

			// 解析服务器返回的登录信息
			if (DyMessage.parseLoginRespond(recvByte)) {
				// System.out.println("服务器返回登录信息成功");
			} else {
				System.out.println("服务器返回登录信息失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 加入弹幕分组池
	 * 
	 * @param roomId
	 * @param groupId
	 */
	private void joinGroup(int roomId, int groupId) {
		// 获取弹幕服务器加弹幕池请求数据包
		byte[] joinGroupRequest = DyMessage.getJoinGroupRequest(roomId, groupId);

		try {
			// 向弹幕服务器发送加入弹幕池请求数据
			bos.write(joinGroupRequest, 0, joinGroupRequest.length);
			bos.flush();
			// System.out.println("向弹幕服务器发送加入弹幕池请求数据成功");

		} catch (Exception e) {
			e.printStackTrace();
			// System.out.println("向弹幕服务器发送加入弹幕池请求数据失败");
		}
	}

	/**
	 * 服务器心跳连接
	 */
	public void keepAlive() {
		// 获取与弹幕服务器保持心跳的请求数据包
		byte[] keepAliveRequest = DyMessage.getKeepAliveData((int) (System.currentTimeMillis() / 1000));

		try {
			// 向弹幕服务器发送心跳请求数据包
			bos.write(keepAliveRequest, 0, keepAliveRequest.length);
			bos.flush();
			// System.out.println("发送心跳请求数据包成功");

		} catch (Exception e) {
			e.printStackTrace();
			// System.out.println("发送心跳请求数据包失败");
		}
	}

	/**
	 * 获取服务器返回信息
	 */
	public void getServerMsg() {
		// 初始化获取弹幕服务器返回信息包大小
		byte[] recvByte = new byte[MAX_BUFFER_LENGTH];
		// 定义服务器返回信息的字符串
		String dataStr;
		try {
			// 读取服务器返回信息，并获取返回信息的整体字节长度
			int recvLen = bis.read(recvByte, 0, recvByte.length);

			// 根据实际获取的字节数初始化返回信息内容长度
			byte[] realBuf = new byte[recvLen];
			// 按照实际获取的字节长度读取返回信息
			System.arraycopy(recvByte, 0, realBuf, 0, recvLen);
			// 根据TCP协议获取返回信息中的字符串信息
			dataStr = new String(realBuf, 12, realBuf.length - 12);

			// 循环处理socekt黏包情况
			while (dataStr.lastIndexOf("type@=") > 5) {
				// 对黏包中最后一个数据包进行解析
				MsgView msgView = new MsgView(StringUtils.substring(dataStr, dataStr.lastIndexOf("type@=")));
				// 分析该包的数据类型，以及根据需要进行业务操作
				parseServerMsg(msgView.getMessageList());
				// 处理黏包中的剩余部分
				dataStr = StringUtils.substring(dataStr, 0, dataStr.lastIndexOf("type@=") - 12);
			}
			// 对单一数据包进行解析
			MsgView msgView = new MsgView(StringUtils.substring(dataStr, dataStr.lastIndexOf("type@=")));
			// 分析该包的数据类型，以及根据需要进行业务操作
			parseServerMsg(msgView.getMessageList());

		} catch (Exception e) {
			e.printStackTrace();
		}
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

	public RoomService getRoomservice() {
		return roomservice;
	}

	@Resource
	public void setRoomservice(RoomService roomservice) {
		this.roomservice = roomservice;
	}

}
