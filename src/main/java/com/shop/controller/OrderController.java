package com.shop.controller;

import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.entity.Item;
import com.shop.entity.Order;
import com.shop.entity.OrderDetail;
import com.shop.entity.OrderStatus;
import com.shop.entity.User;
import com.shop.service.CartService;
import com.shop.service.OrderService;
import com.shop.service.OrderStatusService;
import com.shop.service.UserService;
import com.shop.util.FirebaseUtil;

@Controller
public class OrderController {

	@Autowired
	private UserService userService;

	@Autowired
	private OrderStatusService orderStatusService;

	@Autowired
	private CartService cartService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private FirebaseUtil firebaseUtil;

	@GetMapping("/purchase")
	public String purchase(Model model, HttpSession session,
			@RequestParam(name = "status", required = false) Integer statusId) {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		int quantityCart = cartService.getQuantityCartByUsername(username);
		session.setAttribute("quantityCart", quantityCart);

		User user = userService.findByUsername(username);
		List<Order> orders = null;

		orders = user.getCustomerOrders();
		if (statusId != null) {
			orders = orders.stream().filter(order -> order.getStatus().getId().equals(statusId))
					.collect(Collectors.toList());
		}
		model.addAttribute("orders", orders);

		List<OrderStatus> orderStatuses = orderStatusService.getAll();
		model.addAttribute("orderStatuses", orderStatuses);
		model.addAttribute("size", orders.size());
		return "purchase";
	}

	@GetMapping("/purchase/order/{orderId}")
	public String detailOrder(@PathVariable(name = "orderId") Integer orderId, Model model, HttpSession session) {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		int quantityCart = cartService.getQuantityCartByUsername(username);
		session.setAttribute("quantityCart", quantityCart);

		Order order = orderService.getById(orderId);
		List<OrderDetail> orderDetails = order.getOrderDetails();
		orderDetails = orderDetails.stream().map(orderDetail -> {
			Item item = orderDetail.getItem();
			orderDetail.getItem().setLinkImage(firebaseUtil.getFileUrl(item.getImage()));
			return orderDetail;
		}).collect(Collectors.toList());
		order.setOrderDetails(orderDetails);

		int totalBill = orderDetails.stream()
				.mapToInt(orderDetail -> orderDetail.getPrice() * orderDetail.getQuantity()).sum();
		model.addAttribute("totalBill", totalBill);

		model.addAttribute("order", order);
		return "detailOrder";
	}
	
	@PostMapping("/purchase/deliveryConfirm")
	public String deliveriedConfirmation(@RequestParam(name = "orderId") Integer orderId,
							@RequestParam(name="url", defaultValue = "purchase") String url, RedirectAttributes redirectAttributes) {
		
		OrderStatus orderStatus = orderStatusService.findByStatus(OrderStatus.DELIVERED);
		try {
			orderService.customerConfirmDelevery(orderId, orderStatus.getId());
			redirectAttributes.addAttribute("confirm", "success");
		} catch (Exception e) {
			redirectAttributes.addAttribute("confirm", "fail");
			e.printStackTrace();
		}
		return "redirect:/" + url;
	}

	private int CONFIRURABLE_RECORDS_PER_PAGE = 6;

	@GetMapping("/employee")
	public String getAllOrders(Model model, @RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "id", defaultValue = "-1") int id,
			@RequestParam(value = "type", defaultValue = "null") String type) {

		int totalRecords = orderService.getTotalPage();

		int recordsPerPage = CONFIRURABLE_RECORDS_PER_PAGE;

		int totalPages = (int) Math.ceil((float) totalRecords / recordsPerPage);

		int offset = (page - 1) * recordsPerPage;
		List<Order> orders = orderService.getOrderPerPage(offset, recordsPerPage);
		model.addAttribute("orders", orders);
		model.addAttribute("size", orders.size());
		model.addAttribute("page", page);
		model.addAttribute("sizePage", totalPages);
		model.addAttribute("id", id);
		model.addAttribute("type", type);
		return "employeeHome";
	}

	@GetMapping("employee/add/{orderId}")
	public String addOrder(RedirectAttributes redirectAttributes, @PathVariable("orderId") int orderId) {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		OrderStatus orderStatus = orderStatusService.findByStatus(OrderStatus.DELIVERING);
		orderService.changeStatusOrder(orderId, orderStatus.getId(), username);
		redirectAttributes.addAttribute("id", orderId);
		redirectAttributes.addAttribute("type", "add");
		return "redirect:/employee";
	}

	@GetMapping("employee/delete/{orderId}")
	public String deleteOrder(RedirectAttributes redirectAttributes, @PathVariable("orderId") int orderId) {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		OrderStatus orderStatus = orderStatusService.findByStatus(OrderStatus.CANCLED);
		orderService.changeStatusOrder(orderId, orderStatus.getId(), username);
		redirectAttributes.addAttribute("id", orderId);
		redirectAttributes.addAttribute("type", "delete");
		return "redirect:/employee";
	}
	
}
