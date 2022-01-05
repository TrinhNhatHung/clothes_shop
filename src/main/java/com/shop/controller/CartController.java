package com.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.entity.Cart;
import com.shop.entity.Order;
import com.shop.entity.User;
import com.shop.service.CartService;
import com.shop.service.OrderService;
import com.shop.service.UserService;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;

	@Autowired
	private UserService userService;

	@Autowired
	private OrderService orderService;

	@GetMapping("/cart")
	public String cart(Model model, HttpSession session) {

		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		int quantityCart = cartService.getQuantityCartByUsername(username);
		session.setAttribute("quantityCart", quantityCart);
		List<Cart> carts = cartService.getCartsByUsername(username);
		int totalBill = cartService.getTotalBill(carts);
		model.addAttribute("totalBill", totalBill);
		model.addAttribute("carts", carts);
		return "cart";
	}

	@GetMapping("/pay")
	public String pay(Model model, HttpSession session) {

		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		int quantityCart = cartService.getQuantityCartByUsername(username);
		session.setAttribute("quantityCart", quantityCart);

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
	public String changeQuantityCart(@RequestParam(name = "itemId") Integer itemId,
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

	@PostMapping("/addToCart")
	public String addToCart(@RequestParam(name = "itemId") Integer itemId, @RequestParam(name = "url") String url,
			@RequestParam(name = "queryString") String queryString) {
		if (!queryString.equals("null")) {
			int indexOfMessage = queryString.indexOf("message");
			if (indexOfMessage != -1) {
				int indexOfEndMessage = queryString.indexOf("&", indexOfMessage);
				indexOfEndMessage = indexOfEndMessage == -1 ? queryString.length() : indexOfEndMessage;
				System.out.println(indexOfMessage + " " + indexOfEndMessage);
				queryString = queryString.substring(0, indexOfMessage) + queryString.substring(indexOfEndMessage);
			}
		}

		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		try {
			boolean result = cartService.addItemNotExistInCart(username, itemId);
			if (!result) {
				return "redirect:" + url + "?" + queryString + "&message=Mặt hàng đã tồn tại trong giỏ hàng";
			}

			return "redirect:" + url + "?" + queryString;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:" + url + "?" + queryString + "&message=Thêm vào giỏ hàng lỗi";
	}

	@PostMapping("/buy")
	public String buy(@ModelAttribute(name = "order") Order order,
			@RequestParam(name = "carts") List<Integer> itemIds) {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();

		try {
			orderService.insert(order, username, itemIds);
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
			return "redirect:/pay?error";
		}
		return "redirect:/pay";
	}

}
