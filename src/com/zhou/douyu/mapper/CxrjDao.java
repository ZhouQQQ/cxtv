package com.zhou.douyu.mapper;

import java.util.List;

import com.zhou.douyu.pojo.Cxrj;

public interface CxrjDao {
	
	List<Cxrj> getAllCxrj();

	int getCountCxrj();

	void add(Cxrj cxrj);

	void deleteCxrjById(int id);

	Cxrj getCxrjById(int id);	

	void update(Cxrj cxrj);
}
