package com.shop.service;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.shop.dao.UserDao;
import com.shop.entity.Role;
import com.shop.entity.User;

@Service
public class UserDetailServiceImpl implements UserDetailsService {

	@Autowired
	private UserDao userDao;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = userDao.getById(User.class, username);

		if (user == null || user.getEnable() == false || !user.getRole().getName().equals(Role.ROLE_CUSTOMER)) {
			throw new UsernameNotFoundException("Invalid username or password");
		}

		return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(),
				Arrays.asList(new SimpleGrantedAuthority(user.getRole().getName())));
	}

	public UserDetails loadAdminOrStaffByUserName(String username, String roleName) {
		User user = userDao.getById(User.class, username);

		if (user == null || user.getEnable() == false || !user.getRole().getName().equals(roleName)) {
			throw new UsernameNotFoundException("Invalid username or password");
		}
		
		return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(),
				Arrays.asList(new SimpleGrantedAuthority(user.getRole().getName())));
	}
}
