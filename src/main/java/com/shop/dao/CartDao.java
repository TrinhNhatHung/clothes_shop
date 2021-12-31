package com.shop.dao;

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
}
