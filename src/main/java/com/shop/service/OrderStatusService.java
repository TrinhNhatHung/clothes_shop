package com.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.OrderStatusDao;
import com.shop.entity.OrderStatus;

@Service
public class OrderStatusService {

	@Autowired
	private OrderStatusDao orderStatusDao;

	public OrderStatus findByStatus(String status) {
		return orderStatusDao.findByStatus(status);
	}

	public List<OrderStatus> getAll() {
		return orderStatusDao.getAll(OrderStatus.class);
	}

}
