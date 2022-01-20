package com.shop.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

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
	public int getTotalPage(String search) {

		return orderDao.getTotalPage(search);
	}

	@Transactional
	public List<Order> getOrderPerPage(int offset, int recordsPerPage) {
		return orderDao.getOrderPerPage(offset, recordsPerPage);
	}

	@Transactional
	public List<Order> getOrderPerPage(String search, int offset, int recordsPerPage) {
		return orderDao.getOrderPerPage(search, offset, recordsPerPage);
	}

	@Transactional
	public void changeStatusOrder(int orderId, int statusId, String username) {
		orderDao.changeStatusOrder(orderId, statusId, username);
	}
	
	@Transactional
	public void customerConfirmDelevery (int orderId, int statusId) {
		orderDao.customerConfirmDelevery(orderId, statusId);
	}

	public int getTotalOrderByMonth(LocalDate time) {
		return orderDao.getTotalOrderByMonth(time);
	}

	public List<Order> getOrderByMonth(LocalDate time) {
		List<Order> orders = orderDao.getOrderByMonth(time);
		return orders.stream().map(order -> {
			int total = 0;
			for (OrderDetail orderDetail : order.getOrderDetails()) {
				total += orderDetail.getPrice() * orderDetail.getQuantity();
			}
			order.setTotalMoney(total);
			return order;
		}).collect(Collectors.toList());
	}

	public int getTotalRevenueByMonth(LocalDate time) {

		List<Order> orders = orderDao.getDeliveredOrderByMonth(time);
		int result = 0;
		for (Order order : orders) {
			List<OrderDetail> orderDetails = order.getOrderDetails();
			result += orderDetails.stream().mapToInt(orderDetail -> orderDetail.getQuantity() * orderDetail.getPrice())
					.sum();
		}

		return result;
	}

	public int getTotalIncomeByMonth(LocalDate time) {

		List<Order> orders = orderDao.getDeliveredOrderByMonth(time);
		int result = 0;
		for (Order order : orders) {
			List<OrderDetail> orderDetails = order.getOrderDetails();
			result += orderDetails.stream().mapToInt(orderDetail -> orderDetail.getQuantity()
					* (orderDetail.getPrice() - orderDetail.getItem().getInPrice())).sum();
		}
		return result;
	}

	@Transactional
	public void addOrder(int id) {
		orderDao.addOrder(id);
	}

	public void deletOrder(int id) {
		orderDao.deleteOrder(id);

	}
}
