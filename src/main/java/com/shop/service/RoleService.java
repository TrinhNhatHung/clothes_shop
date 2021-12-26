package com.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.RoleDao;
import com.shop.entity.Role;

@Service
public class RoleService {

	@Autowired
	private RoleDao roleDao;

	public Role findByName(String name) {
		return roleDao.findRoleByName(name);
	}
}
