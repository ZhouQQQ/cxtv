package com.zhou.douyu.mapper;

import java.util.List;

import com.zhou.douyu.pojo.GiftRecord;

public interface GiftDao {

	void save(GiftRecord giftRecord);

	int getTodayGift(String type);

	List<GiftRecord> getAllGiftRecord();

	List<GiftRecord> getGiftRecord(int page);

	int getThisWeekGift(String type, int day);

	List<GiftRecord> getGiftRecordByName(String name);
	
	int getRecentDaysGiftCount(String type,int dayAgo);

	List<GiftRecord> getGiftRecordCount();

	List<GiftRecord> getGiftRecordCountByName(String name);
}
