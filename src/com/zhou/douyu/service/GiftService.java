package com.zhou.douyu.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhou.douyu.mapper.GiftDao;
import com.zhou.douyu.pojo.GiftRecord;
@Transactional
@Service
public class GiftService {

	private GiftDao giftDao;

	@Transactional
	public void add(GiftRecord giftRecord) {
		this.giftDao.save(giftRecord);
	}

	public int getTodayGift(String type) {
		return giftDao.getTodayGift(type);
	}

	public List<GiftRecord> getGiftRecord(int page) {
		return giftDao.getGiftRecord(page);
	}

	public List<GiftRecord> getAllGiftRecord() {
		return giftDao.getAllGiftRecord();
	}

	public List<GiftRecord> getGiftRecordByName(String name) {
		return giftDao.getGiftRecordByName(name);
	}

	public int getThisWeekGift(String type, int day) {
		return giftDao.getThisWeekGift(type, day);
	}
	
	public int getRecentDaysGiftCount(String type,int dayAgo){
		return giftDao.getRecentDaysGiftCount(type, dayAgo);
	}

	public GiftDao getGiftDao() {
		return giftDao;
	}
	

	@Resource
	public void setGiftDao(GiftDao giftDao) {
		this.giftDao = giftDao;
	}

	public List<GiftRecord> getGiftRecordCount() {
		// TODO Auto-generated method stub
		return giftDao.getGiftRecordCount();
	}

	public  List<GiftRecord> getGiftRecordCountByName(String name) {
		// TODO Auto-generated method stub
		return giftDao.getGiftRecordCountByName(name);
	}

	

}
