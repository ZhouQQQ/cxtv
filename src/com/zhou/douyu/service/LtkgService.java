package com.zhou.douyu.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhou.douyu.mapper.LtkgDao;
import com.zhou.douyu.pojo.Ltkg;
@Transactional
@Service
public class LtkgService {

	private LtkgDao ltkgDao;
	
	public List<Ltkg> getAllLtkg(){
		 return ltkgDao.getAllLtkg();
	}

	public Ltkg getVideoById(int videoid) {
		return ltkgDao.getVideoById(videoid);
	}
	
	public Ltkg getLatestVideo(){
		return ltkgDao.getLatestVideo();
	}
	
	public LtkgDao getLkDao() {
		return ltkgDao;
	}

	@Resource
	public void setLkDao(LtkgDao lkDao) {
		this.ltkgDao = lkDao;
	}

	
	public void add(Ltkg ltkg) {
		ltkgDao.add(ltkg);
		
	}

	
	public void deleteLtkgById(int id) {
		// TODO Auto-generated method stub
		ltkgDao.deleteLtkgById(id);
	}

	
	public void update(Ltkg newLtkg) {
		// TODO Auto-generated method stub
		ltkgDao.update(newLtkg);
	}
	
	public int getCountLtkg(){
		return ltkgDao.getCountLtkg();
	}

	
	
	
}
