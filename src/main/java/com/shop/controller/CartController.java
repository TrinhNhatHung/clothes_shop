package com.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.entity.Cart;
import com.shop.entity.User;
import com.shop.service.CartService;
import com.shop.service.UserService;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	
	@Autowired
	private UserService userService;

	@GetMapping("/cart")
	public String cart(Model model) {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		List<Cart> carts = cartService.getCartsByUsername(username);
		int totalBill = cartService.getTotalBill(carts);
		model.addAttribute("totalBill", totalBill);
		model.addAttribute("carts", carts);
		return "cart";
	}
	
	@GetMapping("/pay")
	public String pay(Model model) {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		List<Cart> carts = cartService.getCartsByUsername(username);
		model.addAttribute("carts", carts);
		int totalBill = cartService.getTotalBill(carts);
		model.addAttribute("totalBill", totalBill);
		
		User user = userService.findByUsername(username);
		model.addAttribute("user", user);
		return "pay";
	}
	
	@PostMapping("/deleteCart")
	public String deleteCart(@RequestParam(name = "itemId") Integer itemId) {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		try {
			cartService.delete(username, itemId);
			return "redirect:cart";
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:cart?error=";
	}
	
	@PostMapping("/changeQuantityCart")
	public String changeQuantityCart (@RequestParam(name = "itemId") Integer itemId,
							@RequestParam(name = "action", required = false) String action,
							@RequestParam(name = "quantity") Integer quantity) {
		action = action == null ? "-" : action;
		switch (action) {
		case "+":
			quantity++;
			break;
		case "-":
			quantity--;
			break;
		default:
			break;
		}
		
		if (quantity < 0) {
			quantity = 0;
		}
		
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		try {
			cartService.insertOrUpdate(username, itemId, quantity);
			return "redirect:cart";
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:cart?error";
	}
}
