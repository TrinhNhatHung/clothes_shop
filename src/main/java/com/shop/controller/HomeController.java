package com.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.entity.Item;
import com.shop.entity.ItemGroup;
import com.shop.service.ItemService;

@Controller
public class HomeController {

	@Autowired
	private ItemService itemService;

	@GetMapping("/")
	public String home(@RequestParam(name = "page", required = false) Integer page,
			@RequestParam(name = "sort", required = false) String sort, Model model) {

//		List<Item> items = itemService.getAll(Item.class);
		if (page == null) {
			page = 0;
		}
		List<Item> items = itemService.getItemsInPage(sort, page);
		List<ItemGroup> itemGroups = itemService.getAll(ItemGroup.class);
		int sizePage = itemService.getSizePage("", "", "", "", 0, sort, "");
		System.out.println(items.size() + " ==== " + itemGroups.size());
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
			@RequestParam(name = "sort", required = false) String sort, Model model) {
		System.out.println("itemGroup = " + itemGroup);

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
		System.out.println("SIZE = " + items.size());
		List<ItemGroup> itemGroups = itemService.getAll(ItemGroup.class);
		int sizePage = itemService.getSizePage(from, to, itemGroup, search, page, sort, "search");
		System.out.println(items.size() + " ==== " + itemGroups.size());
		model.addAttribute("items", items);
		model.addAttribute("itemGroups", itemGroups);
		model.addAttribute("sizePage", sizePage);
		model.addAttribute("page", page);
		return "home";
	}

}
