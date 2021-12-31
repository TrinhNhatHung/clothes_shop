package com.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.dao.UserDao;
import com.shop.entity.User;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;

	public User findByUsername(String username) {
		return userDao.getById(User.class, username);
	}
	
	@Transactional
	public void insertOrUpdate(User user) {
		userDao.insertOrUpdate(user);
	}

}
