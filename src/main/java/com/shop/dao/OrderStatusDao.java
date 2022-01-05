package com.shop.dao;

import org.hibernate.Session;
import org.hibernate.query.NativeQuery;
import org.springframework.stereotype.Repository;

import com.shop.entity.OrderStatus;

@Repository
public class OrderStatusDao extends EntityDao<OrderStatus> {
	
	public OrderStatus findByStatus(String status) {
		Session session = openSession();
		String sql = "SELECT * FROM tinhtrangdonhang WHERE tinhtrang = :status";
		
		NativeQuery<OrderStatus> query = session.createNativeQuery(sql, OrderStatus.class);
		query.setParameter("status", status);
		return query.uniqueResult();
	}
}
