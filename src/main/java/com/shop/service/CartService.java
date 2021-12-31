package com.shop.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.dao.CartDao;
import com.shop.dao.UserDao;
import com.shop.entity.Cart;
import com.shop.entity.Item;
import com.shop.entity.User;
import com.shop.entity.Cart.Id;
import com.shop.util.FirebaseUtil;

@Service
public class CartService {

	@Autowired
	private UserDao userDao;

	@Autowired
	private CartDao cartDao;

	@Autowired
	private FirebaseUtil firebaseUtil;

	public List<Cart> getCartsByUsername(String username) {
		User user = userDao.getById(User.class, username);
		if (user == null) {
			return new ArrayList<>();
		}
		List<Cart> carts = user.getCarts();
		carts.forEach(cart -> {
			Item item = cart.getItem();
			cart.getItem().setLinkImage(firebaseUtil.getFileUrl(item.getImage()));
		});

		return carts;
	}

	@Transactional
	public void delete(String username, Integer itemId) {
		Id id = new Id(username, itemId);
		Cart cart = new Cart();
		cart.setId(id);
		cartDao.delete(cart);
	}

	@Transactional
	public void insertOrUpdate(String username, Integer itemId, Integer quantity) {
		Id id = new Id(username, itemId);
		Item item = new Item();
		item.setId(itemId);
		User user = new User();
		user.setUsername(username);
		Cart cart = new Cart(id, quantity, item, user);
		cart.setQuantity(quantity);
		
		if (quantity == 0) {
			cartDao.delete(cart);
		} else {
			cartDao.insertOrUpdate(cart);
		}
	}

	public int getTotalBill(List<Cart> carts) {
		return carts.stream().mapToInt(cart -> cart.getItem().getOutPrice() * cart.getQuantity()).sum();
	}
}
