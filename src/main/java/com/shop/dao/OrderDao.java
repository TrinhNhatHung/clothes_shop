package com.shop.dao;

import java.math.BigInteger;
import java.time.LocalDate;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.NativeQuery;
import org.hibernate.type.IntegerType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shop.entity.Order;
import com.shop.entity.OrderStatus;

@Repository
public class OrderDao extends EntityDao<Order> {

	@Autowired
	private OrderStatusDao orderStatusDao;

	public int getTotalPage() {
		return (int) getCurrentSession().createNativeQuery("SELECT COUNT(*) counter FROM donhang")
				.addScalar("counter", IntegerType.INSTANCE).uniqueResult();
	}

	public int getTotalPage(String search) {
		return (int) getCurrentSession()
				.createNativeQuery("SELECT COUNT(*) counter FROM donhang WHERE ten_nguoi_nhan LIKE '%" + search + "%'")
				.addScalar("counter", IntegerType.INSTANCE).uniqueResult();
	}

	public List<Order> getOrderPerPage(int offset, int recordsPerPage) {
		final String sql = "SELECT * FROM donhang " + "ORDER BY ma_ttdh, ngay_tao DESC" + " LIMIT :offset, :rowcount";
		return openSession().createNativeQuery(sql, Order.class).setParameter("offset", offset, IntegerType.INSTANCE)
				.setParameter("rowcount", recordsPerPage, IntegerType.INSTANCE).getResultList();
	}

	public List<Order> getOrderPerPage(String search, int offset, int recordsPerPage) {
		final String sql = "SELECT * FROM donhang WHERE ten_nguoi_nhan LIKE '%" + search + "%'"
				+ " ORDER BY ma_ttdh, ngay_tao DESC" + " LIMIT :offset, :rowcount";
		return openSession().createNativeQuery(sql, Order.class).setParameter("offset", offset, IntegerType.INSTANCE)
				.setParameter("rowcount", recordsPerPage, IntegerType.INSTANCE).getResultList();
	}

	public void addOrder(int id) {
		final String sql = "UPDATE donhang SET ma_ttdh = 2 WHERE ma_dh = " + id;
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
		final String sql = "UPDATE donhang SET ma_ttdh = 4 WHERE ma_dh = " + id;
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

	public void changeStatusOrder(int orderId, int statusId, String username) {
		final String sql = "UPDATE donhang SET ma_ttdh = :statusId, nhan_vien = :username WHERE ma_dh = :orderId";
		getCurrentSession().createNativeQuery(sql)
						   .setParameter("orderId", orderId)
						   .setParameter("statusId", statusId)
						   .setParameter("username", username)
						   .executeUpdate();
	}
	
	public void customerConfirmDelevery (int orderId, int statusId) {
		final String sql = "UPDATE donhang SET ma_ttdh = :statusId WHERE ma_dh = :orderId";
		getCurrentSession().createNativeQuery(sql)
		   .setParameter("orderId", orderId)
		   .setParameter("statusId", statusId)
		   .executeUpdate();
	}

	@SuppressWarnings("unchecked")
	public int getTotalOrderByMonth(LocalDate time) {
		int month = time.getMonthValue();
		int year = time.getYear();
		String sql = "SELECT COUNT(*) FROM donhang WHERE month(ngay_tao) = :month AND year(ngay_tao) = :year ";
		NativeQuery<BigInteger> query = openSession().createNativeQuery(sql);
		query.setParameter("month", month).setParameter("year", year);
		return query.uniqueResult().intValue();
	}

	public List<Order> getOrderByMonth(LocalDate time) {
		int month = time.getMonthValue();
		int year = time.getYear();
		String sql = "SELECT * FROM donhang WHERE month(ngay_tao) = :month AND year(ngay_tao) = :year ";
		NativeQuery<Order> query = openSession().createNativeQuery(sql, Order.class);
		query.setParameter("month", month).setParameter("year", year);
		return query.getResultList();
	}

	public List<Order> getDeliveredOrderByMonth(LocalDate time) {
		int month = time.getMonthValue();
		int year = time.getYear();

		OrderStatus orderStatus = orderStatusDao.findByStatus(OrderStatus.DELIVERED);
		String sql = "SELECT * FROM donhang WHERE month(ngay_tao) = :month AND year(ngay_tao) = :year AND ma_ttdh = :status";
		NativeQuery<Order> query = openSession().createNativeQuery(sql, Order.class);
		query.setParameter("month", month).setParameter("year", year).setParameter("status", orderStatus.getId());
		return query.getResultList();
	}
}
