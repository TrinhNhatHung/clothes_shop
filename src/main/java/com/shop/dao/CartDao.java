package com.shop.dao;

import java.math.BigInteger;

import org.hibernate.Session;
import org.hibernate.query.NativeQuery;
import org.springframework.stereotype.Repository;

import com.shop.entity.Cart;

@Repository
public class CartDao extends EntityDao<Cart> {

	public void delete(Cart cart) {
		super.delete(cart);
	}

	public void insertOrUpdate(Cart cart) {
		super.insertOrUpdate(cart);
	}

	@SuppressWarnings("unchecked")
	public int getQuantityCartByUsername(String username) {
		Session session = openSession();
		String sql = "SELECT count(ma_mh) FROM giohang WHERE username = :username";
		NativeQuery<BigInteger> query = session.createNativeQuery(sql);
		query.setParameter("username", username);
		return query.uniqueResult().intValue();
	}
}
