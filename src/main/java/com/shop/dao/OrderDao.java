package com.shop.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.type.IntegerType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shop.entity.Order;
import com.shop.entity.OrderStatus;

@Repository
public class OrderDao extends EntityDao<Order>{
	
	@Autowired
	private OrderStatusDao orderStatusDao;
	
	public int getTotalPage() {
		return (int)getCurrentSession().createNativeQuery("SELECT COUNT(*) counter FROM donhang")
					.addScalar("counter", IntegerType.INSTANCE)
					.uniqueResult();
	}

	public List<Order> getOrderPerPage(int offset, int recordsPerPage) {
		final String sql = "SELECT * FROM donhang " + "ORDER BY ma_ttdh, ngay_tao DESC" + " LIMIT :offset, :rowcount";
		return openSession()
				.createNativeQuery(sql, Order.class)
				.setParameter("offset", offset, IntegerType.INSTANCE)
				.setParameter("rowcount", recordsPerPage, IntegerType.INSTANCE)
				.getResultList();
	}
		
	public void addOrder(int id) {
		final String sql = "UPDATE donhang SET ma_ttdh = 2 WHERE ma_dh = "+ id;
		Session session = openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.createNativeQuery(sql).executeUpdate();
			transaction.commit();
			System.out.println("SQL: " + sql);
		} catch (Exception e) {
			transaction.rollback();
		}
	}
	
	public void deleteOrder(int id) {
		final String sql = "UPDATE donhang SET ma_ttdh = 4 WHERE ma_dh = "+ id;
		Session session = openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.createNativeQuery(sql).executeUpdate();
			transaction.commit();
			System.out.println("SQL: " + sql);
		} catch (Exception e) {
			transaction.rollback();
		}
	}
	
	public void insert(Order order) {
		
		OrderStatus orderStatus = orderStatusDao.findByStatus(OrderStatus.WAITING);
		order.setStatus(orderStatus);
		
		super.insert(order);
	}

}
