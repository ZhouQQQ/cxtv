package com.zhou.douyu.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zhou.douyu.mapper.CommentsDao;

@Service
public class CommentsService {


	private CommentsDao commentsDao;
	
	
	public void getCommentsByVideoId(int id){
		commentsDao.getCommentsByVideoId();
	}
	
	public CommentsDao getCommmentsDao() {
		return commentsDao;
	}

	@Resource
	public void setCommmentsDao(CommentsDao commentsDao) {
		this.commentsDao = commentsDao;
	}
}
