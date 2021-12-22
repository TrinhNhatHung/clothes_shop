package com.shop.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.EntityDao;

@Service
public class EntityService<T> {

	@Autowired
	private EntityDao<T> entityDao;

	public T getById(Class<T> clazz, Serializable id) {
		return entityDao.getById(clazz, id);
	}

	public List<T> getAll(Class<T> clazz) {
		return entityDao.getAll(clazz);
	}

	public void insertOrUpdate(T t) {
		entityDao.insertOrUpdate(t);
	}
	
	public void delete(T t) {
		entityDao.delete(t);
	}
}
