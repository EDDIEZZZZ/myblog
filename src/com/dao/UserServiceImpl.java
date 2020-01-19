package com.dao;

import com.dao.*;
import com.dao.UserDao;

public class UserServiceImpl {
	UserDao UserDao = new UserDao();
	
	public boolean zhaohuiUser(User user) {
		if(UserDao.UserId(user)) {
			return UserDao.zhaohui(user);
		}
			return false;
	}
	public User queryUserId(User user) {
		return UserDao.queryUserId(user);
	}
	public User queryUserName(User user){
		return UserDao.queryUserName(user);
	}
}
