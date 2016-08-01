package com.zhou.douyu.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhou.douyu.mapper.BannedDao;
import com.zhou.douyu.pojo.BannedRecord;

@Transactional
@Service
public class BannedService {
	
	
	private BannedDao bannedDao;
	
	
	public void save(BannedRecord bannedRecord){
		bannedDao.save(bannedRecord);
	}
	
	public List<BannedRecord> getAllBannedRecord(){
		return bannedDao.getAllBannedRecord();
	}
	
	public List<BannedRecord> getBannedRecordByName(String name){
		return bannedDao.getBannedRecordByName(name);
	}

	public BannedDao getBannedDao() {
		return bannedDao;
	}

	@Resource
	public void setBannedDao(BannedDao bannedDao) {
		this.bannedDao = bannedDao;
	}
}
