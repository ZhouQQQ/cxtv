package com.zhou.douyu.service;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.zhou.douyu.mapper.CxrjDao;
import com.zhou.douyu.pojo.Cxrj;
@Transactional
@Service
public class CxrjService {

	private CxrjDao cxrjDao;

	public List<Cxrj> getAllCxrj() {
		return cxrjDao.getAllCxrj();
	}
	
	public int getCountCxrj(){
		return cxrjDao.getCountCxrj();
	}

	public CxrjDao getCxrjDao() {
		return cxrjDao;
	}

	@Resource
	public void setCxrjDao(CxrjDao cxrjDao) {
		this.cxrjDao = cxrjDao;
	}

	public void add(Cxrj cxrj) {
		cxrjDao.add(cxrj);
		
	}

	
	public void deleteCxrjById(int id) {
		// TODO Auto-generated method stub
		cxrjDao.deleteCxrjById(id);
		
	}

	public Cxrj getCxrjById(int id) {
		
		return cxrjDao.getCxrjById(id);
	}

	
	public void update(Cxrj cxrj) {
		// TODO Auto-generated method stub
		cxrjDao.update(cxrj);
	}
	
	public void saveCoverFile(HttpServletRequest request,CommonsMultipartFile file){
		String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() +request.getContextPath()+"/img/cxrj/cover/";
		
		
	}
}
