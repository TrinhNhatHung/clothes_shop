package com.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.entity.Item;
import com.shop.entity.ItemGroup;
import com.shop.entity.ItemSize;
import com.shop.service.CartService;
import com.shop.service.ItemService;

@Controller
public class HomeController {

	@Autowired
	private ItemService itemService;

	@Autowired
	private CartService cartService;

	@GetMapping("/")
	public String home(@RequestParam(name = "page", required = false) Integer page,
			@RequestParam(name = "sort", required = false) String sort, Model model, HttpSession session) {
		model.addAttribute("url", "/");
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		int quantityCart = cartService.getQuantityCartByUsername(username);
		session.setAttribute("quantityCart", quantityCart);

		if (page == null) {
			page = 0;
		}
		List<Item> items = itemService.getItemsInPage(sort, page);
		items.forEach(item -> {
			System.out.println(item.getStatus());
		});
		List<ItemGroup> itemGroups = itemService.getAllItemGroup();
		int sizePage = itemService.getSizePage("", "", "", "", 0, sort, "");
		model.addAttribute("items", items);
		model.addAttribute("itemGroups", itemGroups);
		model.addAttribute("sizePage", sizePage);
		model.addAttribute("page", page);
		return "home";
	}

	@GetMapping("/search")
	public String search(@RequestParam(name = "page", required = false) Integer page,
			@RequestParam(name = "price", required = false) String price,
			@RequestParam(name = "itemGroup", required = false) String itemGroup,
			@RequestParam(name = "search", required = false) String search,
			@RequestParam(name = "sort", required = false) String sort, Model model, HttpSession session) {
		model.addAttribute("url", "/search");
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		int quantityCart = cartService.getQuantityCartByUsername(username);
		session.setAttribute("quantityCart", quantityCart);

		String from = "0";
		String to = "100000000";
		if (price != "" && price != null) {
			from = price.split("-")[0];
			to = price.split("-")[1];
		}

		if (itemGroup == null) {
			itemGroup = "";
		}

		if (page == null) {
			page = 0;
		}

		List<Item> items = itemService.getSearchedItems(from, to, itemGroup, search, sort, page);
		List<ItemGroup> itemGroups = itemService.getAllItemGroup();
		int sizePage = itemService.getSizePage(from, to, itemGroup, search, page, sort, "search");
		System.out.println(items.size() + " ==== " + itemGroups.size());
		model.addAttribute("items", items);
		model.addAttribute("itemGroups", itemGroups);
		model.addAttribute("sizePage", sizePage);
		model.addAttribute("page", page);
		return "home";
	}

	@GetMapping("/item-detail/{id}")
	public String getItemDetail(@PathVariable int id, Model model, HttpSession session) {

		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		int quantityCart = cartService.getQuantityCartByUsername(username);
		session.setAttribute("quantityCart", quantityCart);

		Item item = itemService.getById(id);

		List<ItemSize> itemSizes = item.getItemSizes();
		Map<String, Integer> sizes = new HashMap<String, Integer>();
		String status = "Hết hàng";
		for (int i = 0; i < itemSizes.size(); i++) {
			sizes.put(itemSizes.get(i).getId().getSizeId(), itemSizes.get(i).getQuantity());
			if (itemSizes.get(i).getQuantity() > 0) {
				status = "Còn Hàng";
			}
		}

		model.addAttribute("item", item);
		model.addAttribute("sizes", sizes);
		model.addAttribute("status", status);
		return "itemDetail";

	}

}
