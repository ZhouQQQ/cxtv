package com.zhou.douyu.mapper;

import java.util.List;

import com.zhou.douyu.pojo.User;

public interface UsersDao {
	int checkUsernameIsNotExist(String name);
	void add(User user);
	int checkUser(String username, String password);
	User getUserByUsername(String username);
	List<User> getAllUsers();
	User getUserById(int id);
	void updateUser(User user);
	void deleteUserById(int id);
	
}
