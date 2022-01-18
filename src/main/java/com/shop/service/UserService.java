package com.shop.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.dao.UserDao;
import com.shop.dto.UserDto;
import com.shop.entity.Order;
import com.shop.entity.OrderDetail;
import com.shop.entity.User;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;

	public User findByUsername(String username) {
		return userDao.getById(User.class, username);
	}

	@Transactional
	public void insertOrUpdate(User user) {
		userDao.insertOrUpdate(user);
	}

	public List<User> getCustomer() {
		return userDao.getCustomer();
	}

	public List<User> getCustomerByPage(int page) {
		return userDao.getCustomeByPage(page);
	}

	public int getTotalCustomer() {
		return userDao.getTotalCustomer();
	}

	public List<User> getUserByRoleAndSearchCondition(String roleName, String field, String searchText, int page) {
		return userDao.getUserByRoleAndSearchCondition(roleName, field, searchText, page);
	}

	public int getTotalUserByRoleAndSeachCondition(String roleName, String field, String searchText) {
		return userDao.getTotalUserByRoleAndSeachCondition(roleName, field, searchText);
	}
	
	public int getTotalNewUserByMonth(LocalDate time) {
		return userDao.getTotalNewUserByMonth(time);
	}
	
	public List<UserDto> getCustomerOrderedInMonth(LocalDate time){
		int month = time.getMonthValue();
		int year = time.getYear();
		
		List<User> users = userDao.getCustomerOrderedInMonth(time);
		List<UserDto> userDtos = new ArrayList<>();
		for (User user : users) {
			UserDto userDto = new UserDto();
			userDto.setFullname(user.getFullname());
			userDto.setUsername(user.getUsername());
			userDto.setGender(user.getGender());
			userDto.setPhone(user.getPhone());
			
			List<Order> customerOrders = user.getCustomerOrders()
											 .stream()
											 .filter(order-> order.getCreateAt().getMonthValue() == month && order.getCreateAt().getYear() == year)
											 .collect(Collectors.toList());
			userDto.setOrderQuantityByTime(customerOrders.size());
			int totalMoney = 0;
			for (Order order : customerOrders) {
				List<OrderDetail> orderDetails = order.getOrderDetails();
				for (OrderDetail orderDetail : orderDetails) {
					totalMoney += orderDetail.getPrice() + orderDetail.getQuantity();
				}
			}
			
			userDto.setTotalMoneyByTime(totalMoney);
			userDtos.add(userDto);
		}
		return userDtos;
	}
	
	@Transactional
	public void disableUser(String username) {
		userDao.disableUser(username);
	}
}
