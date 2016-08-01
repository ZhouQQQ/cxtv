package com.zhou.douyu.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhou.douyu.mapper.UsersDao;
import com.zhou.douyu.pojo.User;
@Transactional
@Service
public class UsersService {
	private UsersDao usersDao;

	public boolean checkUsernameIsNotExist(String name) {
		if(usersDao.checkUsernameIsNotExist(name)>0){
			return false;
		}else{
			return true;
		}
		
	}
	
	
	public void addUser(User user){
		this.usersDao.add(user);
	}
	
	public boolean checkUser(String username,String password){
		if(usersDao.checkUser(username, password)>0){
			return true;
		}else{
			return false;
		}
	}
	
	
	public List<User> getAllUsers(){
		return usersDao.getAllUsers();
		
	}

	public UsersDao getUsersDao() {
		return usersDao;
	}

	@Resource
	public void setUsersDao(UsersDao usersDao) {
		this.usersDao = usersDao;
	}

	public User getUserByUsername(String username) {
		// TODO Auto-generated method stub
		return usersDao.getUserByUsername(username);
	}


	public User getUserById(int id) {
		// TODO Auto-generated method stub
		return usersDao.getUserById(id);
	}


	public void updateUser(User user) {
		// TODO Auto-generated method stub
		usersDao.updateUser(user);
	}


	public void deleteUserById(int id) {
		// TODO Auto-generated method stub
		usersDao.deleteUserById(id);
	}

}
