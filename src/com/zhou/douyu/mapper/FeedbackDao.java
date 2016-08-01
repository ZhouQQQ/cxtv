package com.zhou.douyu.mapper;

import java.util.List;

import com.zhou.douyu.pojo.Feedback;

public interface FeedbackDao {

	void add(Feedback feedback);

	List<Feedback> getAllFeedback();
}
