package com.zhou.douyu.mapper;

import java.util.List;

import com.zhou.douyu.pojo.BannedRecord;

public interface BannedDao {
	void save(BannedRecord bannedRecord);
	List<BannedRecord> getAllBannedRecord();
	List<BannedRecord> getBannedRecordByName(String name);
}
