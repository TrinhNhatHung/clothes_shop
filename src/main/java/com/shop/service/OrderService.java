package com.shop.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.dao.CartDao;
import com.shop.dao.OrderDao;
import com.shop.entity.Cart;
import com.shop.entity.Cart.Id;
import com.shop.entity.Item;
import com.shop.entity.Order;
import com.shop.entity.OrderDetail;
import com.shop.entity.User;

@Service
public class OrderService {

	@Autowired
	private OrderDao orderDao;

	@Autowired
	private UserService userService;

	@Autowired
	private CartDao cartDao;

	@Transactional
	public void insert(Order order, String username, List<Integer> itemIds) throws CloneNotSupportedException {
		User customer = userService.findByUsername(username);
		order.setCustomer(customer);

		List<OrderDetail> orderDetails = new ArrayList<>();

		for (Integer itemId : itemIds) {
			Id cartId = new Id(username, itemId);
			Cart cart = cartDao.getById(Cart.class, cartId);

			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setQuantity(cart.getQuantity());

			orderDetail.setPrice(cart.getItem().getOutPrice() * (100 - cart.getItem().getDiscount()) / 100);

			com.shop.entity.OrderDetail.Id orderDetailId = new com.shop.entity.OrderDetail.Id(itemId, order.getId());
			orderDetail.setId(orderDetailId);
			Item item = cart.getItem().clone();
			orderDetail.setItem(item);

			orderDetail.setOrder(order);
			orderDetails.add(orderDetail);
		}
		order.setOrderDetails(orderDetails);
		orderDao.insert(order);
	}

	public Order getById(Integer orderId) {
		return orderDao.getById(Order.class, orderId);
	}

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
