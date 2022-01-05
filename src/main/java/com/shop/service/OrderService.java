package com.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.dao.OrderDao;
import com.shop.entity.Order;
import com.shop.entity.OrderDetail;

@Service
public class OrderService {
	
	@Autowired
	private OrderDao orderDao;

	@Transactional
	public List<Order> getAll() {
		return orderDao.getAll(Order.class);
	}

	@Transactional
	public int getTotalPage() {
		
		return orderDao.getTotalPage();
	}

	@Transactional
	public List<Order> getOrderPerPage(int offset, int recordsPerPage) {
		return orderDao.getOrderPerPage(offset, recordsPerPage);
	}

	@Transactional
	public void addOrder(int id) {
		orderDao.addOrder(id);
	}

	public void deletOrder(int id) {
		orderDao.deleteOrder(id);
		
	}

}
