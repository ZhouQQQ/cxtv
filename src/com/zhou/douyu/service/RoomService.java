package com.zhou.douyu.service;

import java.io.IOException;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhou.douyu.pojo.Room;
import com.zhou.douyu.utils.RequestJ;
@Transactional
@Service
public class RoomService {

	public static final String DY_6324_ROOM_API = "http://open.douyucdn.cn/api/RoomApi/room/6324";
	
	public Room getRoom(){
		ObjectMapper objectMapper = new ObjectMapper();
		Room room = null;
		try {
			room= objectMapper.readValue(RequestJ.requestReturnJson(DY_6324_ROOM_API), Room.class);
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return room;
		
	}
	
		
}
