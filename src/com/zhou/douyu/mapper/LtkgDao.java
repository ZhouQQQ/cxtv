package com.zhou.douyu.mapper;

import java.util.List;

import com.zhou.douyu.pojo.Ltkg;

public interface LtkgDao {
	
	List<Ltkg> getAllLtkg();

	Ltkg getVideoById(int videoid);
	
	Ltkg getLatestVideo();

	void add(Ltkg ltkg);

	void deleteLtkgById(int id);

	void update(Ltkg newLtkg);

	int getCountLtkg();

}
