package com.shop.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EntityDao<E> {

	@Autowired
	private SessionFactory sessionFactory;

	public Session openSession() {
		return sessionFactory.openSession();
	}

	public Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	public E getById(Class<E> clazz, Serializable id) {
		Session session = openSession();
		return session.get(clazz, id);
	}

	@SuppressWarnings({ "deprecation", "unchecked" })
	public List<E> getAll(Class<E> clazz) {
		return openSession().createCriteria(clazz).list();
	}
	
	public void delete(E e) {
		Session session = getCurrentSession();
		session.delete(e);
	}
	
	public void insertOrUpdate(E e) {
		Session session = getCurrentSession();
		session.saveOrUpdate(e);
	}
}
