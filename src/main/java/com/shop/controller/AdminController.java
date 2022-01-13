package com.shop.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.entity.Item;
import com.shop.entity.ItemGroup;
import com.shop.entity.ItemSize;
import com.shop.entity.ItemSize.Id;
import com.shop.entity.Order;
import com.shop.entity.Size;
import com.shop.service.ItemService;
import com.shop.service.OrderService;
import com.shop.service.SizeService;
import com.shop.util.FirebaseUtil;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private int CONFIRURABLE_RECORDS_PER_PAGE = 6;

	@Autowired
	private ItemService itemService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private SizeService sizeService;

	@Autowired
	private FirebaseUtil firebaseUtil;

	@GetMapping(path = { "/items" })
	public String getItems(@RequestParam(name = "name", defaultValue = "") String name,
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "id", defaultValue = "-1") int id,
			@RequestParam(name = "type", defaultValue = "null") String type, Model model) {

		int totalRecords = itemService.getTotalPage(name);

		int recordsPerPage = CONFIRURABLE_RECORDS_PER_PAGE;

		int totalPages = (int) Math.ceil((float) totalRecords / recordsPerPage);

		int offset = (page - 1) * recordsPerPage;

		List<Item> items = itemService.getItems(name, offset, recordsPerPage);
		System.out.println(totalRecords + "===" + items.size());
		model.addAttribute("items", items);
		model.addAttribute("page", page);
		model.addAttribute("id", id);
		model.addAttribute("type", type);
		model.addAttribute("sizePage", totalPages);

		return "itemsAdmin";
	}

	@GetMapping("/items/update")
	public String updateItem(@RequestParam("id") int id, Model model) {
		Item item = itemService.getById(id);
		System.out.println(item.getId() + " : " + item.getLinkImage() + " : " + item.getImage());
		model.addAttribute("item", item);
		model.addAttribute("itemGroupCurrent", item.getItemGroup().getName());
		List<ItemGroup> itemGroups = itemService.getAllItemGroup();
		List<ItemSize> itemSizes = item.getItemSizes();
		model.addAttribute("itemSizes", itemSizes);
		model.addAttribute("itemGroups", itemGroups);
		List<Size> sizes = sizeService.getAll();
		model.addAttribute("sizes", sizes);
		model.addAttribute("type", "update");
		return "addItem";
	}

	@GetMapping("/items/add")
	public String addItem(Model model) {
		model.addAttribute("item", new Item());
		List<ItemGroup> itemGroups = itemService.getAllItemGroup();
		model.addAttribute("itemGroups", itemGroups);
		List<Size> sizes = sizeService.getAll();
		model.addAttribute("sizes", sizes);
		model.addAttribute("type", "add");
		return "addItem";
	}

	@PostMapping(value = "/items/save")
	public String saveItem(@Valid @ModelAttribute("item") Item item, BindingResult bindingResult,
			@RequestParam(name = "itemGroupId") Integer itemGroupId,
			@RequestParam(name = "type") String type,
			@RequestParam(name = "sizeId") List<String> sizeIds,
			@RequestParam(name = "quantity") List<Integer> quantities,
			@RequestParam(name = "imageFile", required = false) MultipartFile file, Model model) {

		if (bindingResult.hasErrors()) {
			System.out.println("ERROR" + bindingResult);
			System.out.println("ERROR");
			List<ItemGroup> itemGroups = itemService.getAllItemGroup();
			model.addAttribute("itemGroups", itemGroups);
			List<Size> sizes = sizeService.getAll();
			model.addAttribute("sizes", sizes);
			return "addItem";
		}

		try {
			System.out.println("FILE: " + file.isEmpty());
			if (!file.isEmpty()) {
				String filename = firebaseUtil.uploadFile(file);
				item.setImage(filename);
			}
			
			System.out.println("ITEM: " + item.getImage() + " : " + item.getLinkImage());

			ItemGroup itemGroup = new ItemGroup();
			itemGroup.setId(itemGroupId);
			item.setItemGroup(itemGroup);
			List<ItemSize> itemSizes = new ArrayList<>();
			for (int i = 0; i < sizeIds.size(); i++) {
				ItemSize itemSize = new ItemSize();
				Id id = new Id(item.getId(), sizeIds.get(i));
				Size size = new Size();
				size.setId(sizeIds.get(i));
				itemSize.setQuantity(quantities.get(i));
				itemSize.setId(id);
				itemSize.setItem(item);
				itemSize.setSize(size);
				itemSizes.add(itemSize);
			}
			item.setItemSizes(itemSizes);
			System.out.println("HHH: " + item.getDiscount());
			itemService.insertAndUpdate(item);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "redirect:/admin/items?id=" + item.getId() + "&type=" + type;
	}

	@GetMapping("/orders")
	public String getAllOrders(Model model, @RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "search", defaultValue = "") String search,
			@RequestParam(value = "id", defaultValue = "-1") int id,
			@RequestParam(value = "type", defaultValue = "null") String type) {

		int totalRecords = orderService.getTotalPage(search);
		System.out.println("SIZE: " + totalRecords);

		int recordsPerPage = CONFIRURABLE_RECORDS_PER_PAGE;

		int totalPages = (int) Math.ceil((float) totalRecords / recordsPerPage);

		int offset = (page - 1) * recordsPerPage;
		List<Order> orders = orderService.getOrderPerPage(search, offset, recordsPerPage);
		model.addAttribute("orders", orders);
		model.addAttribute("page", page);
		model.addAttribute("sizePage", totalPages);
		model.addAttribute("id", id);
		model.addAttribute("type", type);
		return "ordersAdmin";
	}

	@GetMapping("orders/add/{id}")
	public String addOrder(RedirectAttributes redirectAttributes, @PathVariable("id") int id) {
		orderService.addOrder(id);
		redirectAttributes.addAttribute("id", id);
		redirectAttributes.addAttribute("type", "add");
		return "redirect:/admin/orders";
	}

	@GetMapping("orders/delete/{id}")
	public String deleteOrder(RedirectAttributes redirectAttributes, @PathVariable("id") int id) {
		orderService.deletOrder(id);
		redirectAttributes.addAttribute("id", id);
		redirectAttributes.addAttribute("type", "delete");
		return "redirect:/admin/orders";
	}

	@GetMapping("items/delete/{id}")
	public String deleteItem(RedirectAttributes redirectAttributes, @PathVariable("id") int id) {
		itemService.deleteItem(id);
		redirectAttributes.addAttribute("id", id);
		redirectAttributes.addAttribute("type", "delete");
		return "redirect:/admin/items";
	}
}
