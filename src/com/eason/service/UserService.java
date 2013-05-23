package com.eason.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eason.dao.AdminDao;
import com.eason.dao.UserDao;
import com.eason.pojo.Admin;
import com.eason.pojo.User;

@Service
@Transactional
public class UserService {

	private UserDao userDao;

	@Autowired
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public void save(User user) {
		userDao.save(user);
	}

	public User findById(String id) {
		return userDao.findById(id);
	}

	public User findByIdentity(String id) {
		return userDao.findByIdentity(id);
	}
	
}
