package com.zhou.douyu.app;

import javax.annotation.Resource;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;
import com.zhou.douyu.client.DyBulletScreenClient;

/**
 * @summary: 弹幕Demo程序启动类
 * @author: FerroD
 * @date: 2016-3-12
 * @version V1.0
 */

@Component
public class DyBulletScreenApplication implements InitializingBean {

	// 设置需要访问的房间ID信息
	private static final int roomId = 6324;

	// 弹幕池分组号，海量模式使用-9999
	private static final int groupId = -9999;

	private DyBulletScreenClient dyBulletScreenClient;

	@Override
	public void afterPropertiesSet() throws Exception {		
		// 设置需要连接和访问的房间ID，以及弹幕池分组号
		this.getDyBulletScreenClient().init(roomId, groupId);

		// 保持弹幕服务器心跳
		// KeepAlive keepAlive = new KeepAlive();
		// keepAlive.start();

		new Thread(new Runnable() {
			@Override
			public void run() {
				// TODO Auto-generated method stub
				while (DyBulletScreenApplication.this.getDyBulletScreenClient().getReadyFlag()) {
					// 发送心跳保持协议给服务器端
					DyBulletScreenApplication.this.getDyBulletScreenClient().keepAlive();
					try {
						// 设置间隔45秒再发送心跳协议
						Thread.sleep(45000); // keep live at least once per
												// minute
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}).start();

		// 获取弹幕服务器发送的所有信息
		// KeepGetMsg keepGetMsg = new KeepGetMsg();
		// keepGetMsg.start();
		new Thread(new Runnable() {

			@Override
			public void run() {
				// TODO Auto-generated method stub

				// 判断客户端就绪状态
				while (DyBulletScreenApplication.this.getDyBulletScreenClient().getReadyFlag()) {
					// 获取服务器发送的弹幕信息
					DyBulletScreenApplication.this.getDyBulletScreenClient().getServerMsg();

				}
			}
		}).start();
	}

	public DyBulletScreenClient getDyBulletScreenClient() {
		return dyBulletScreenClient;
	}

	@Resource
	public void setDyBulletScreenClient(DyBulletScreenClient dyBulletScreenClient) {
		this.dyBulletScreenClient = dyBulletScreenClient;
	}

}
