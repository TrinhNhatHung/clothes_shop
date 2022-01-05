package com.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.entity.Order;
import com.shop.entity.OrderDetail;
import com.shop.service.OrderService;


@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	private int CONFIRURABLE_RECORDS_PER_PAGE = 6;
	
	@GetMapping("/employee")
	public String getAllOrders(Model model, @RequestParam(value = "page", defaultValue = "1") int page, 
			@RequestParam(value = "id", defaultValue = "-1") int id,
			@RequestParam(value = "type", defaultValue = "null") String type) {
//		List<Order> orders = orderService.getAll();
		
		int totalRecords = orderService.getTotalPage();

		int recordsPerPage = CONFIRURABLE_RECORDS_PER_PAGE;

		int totalPages = (int) Math.ceil((float) totalRecords / recordsPerPage);

		int offset = (page - 1) * recordsPerPage;
		List<Order> orders = orderService.getOrderPerPage(offset, recordsPerPage);
		model.addAttribute("orders", orders);
		model.addAttribute("page", page);
		model.addAttribute("sizePage", totalPages);
		model.addAttribute("id", id);
		model.addAttribute("type", type);
		return "employeeHome";
	}
	
	@GetMapping("employee/add/{id}")
	public String addOrder(RedirectAttributes redirectAttributes, @PathVariable("id") int id) {
		orderService.addOrder(id);
		redirectAttributes.addAttribute("id", id);
		redirectAttributes.addAttribute("type", "add");
		return "redirect:/employee";
	}
	
	@GetMapping("employee/delete/{id}")
	public String deleteOrder(RedirectAttributes redirectAttributes, @PathVariable("id") int id) {
		orderService.deletOrder(id);
		redirectAttributes.addAttribute("id", id);
		redirectAttributes.addAttribute("type", "delete");
		return "redirect:/employee";
	}
	
}
