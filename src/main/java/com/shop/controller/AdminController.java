package com.shop.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.dto.ItemDto;
import com.shop.dto.UserDto;
import com.shop.entity.Item;
import com.shop.entity.ItemGroup;
import com.shop.entity.ItemSize;
import com.shop.entity.ItemSize.Id;
import com.shop.entity.Order;
import com.shop.entity.Size;
import com.shop.entity.User;
import com.shop.service.ItemService;
import com.shop.service.OrderService;
import com.shop.service.RoleService;
import com.shop.service.SizeService;
import com.shop.service.UserService;
import com.shop.util.DateUtil;
import com.shop.util.FirebaseUtil;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private int CONFIRURABLE_RECORDS_PER_PAGE = 6;

	@Autowired
	private UserService userService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private SizeService sizeService;

	@Autowired
	private RoleService roleService;

	@Autowired
	private FirebaseUtil firebaseUtil;

	@GetMapping(path = { "/items" })
	public String getItems(@RequestParam(name = "name", defaultValue = "") String name,
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "id", defaultValue = "-1") int id,
			@RequestParam(name = "type", defaultValue = "null") String type, Model model) {
		model.addAttribute("url", "items");

		name = name == null ? "" : name;

		int totalRecords = itemService.getTotalPage(name);

		int recordsPerPage = CONFIRURABLE_RECORDS_PER_PAGE;

		int totalPages = (int) Math.ceil((float) totalRecords / recordsPerPage);

		int offset = (page - 1) * recordsPerPage;

		List<Item> items = itemService.getItems(name, offset, recordsPerPage);
		model.addAttribute("items", items);
		model.addAttribute("page", page);
		model.addAttribute("id", id);
		model.addAttribute("type", type);
		model.addAttribute("sizePage", totalPages);

		return "itemsAdmin";
	}

	@GetMapping("/items/update")
	public String updateItem(@RequestParam("id") int id, Model model) {
		model.addAttribute("url", "items");
		Item item = itemService.getById(id);
		model.addAttribute("linkImage", item.getLinkImage());
		model.addAttribute("item", item);
		model.addAttribute("itemGroupCurrent", item.getItemGroup().getName());
		List<ItemGroup> itemGroups = itemService.getAllItemGroup();
		List<ItemSize> itemSizes = item.getItemSizes();
		model.addAttribute("itemSizes", itemSizes);
		model.addAttribute("itemGroups", itemGroups);
		List<Size> sizes = sizeService.getAll();
		model.addAttribute("sizes", sizes);
		model.addAttribute("type", "update");
		return "updateItem";
	}

	@GetMapping("/items/add")
	public String addItem(Model model) {
		model.addAttribute("url", "items");
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
			@RequestParam(name = "itemGroupId") Integer itemGroupId, @RequestParam(name = "type") String type,
			@RequestParam(name = "sizeId") List<String> sizeIds,
			@RequestParam(name = "quantity") List<Integer> quantities,
			@RequestParam(name = "imageFile", required = false) MultipartFile file, Model model) {
		model.addAttribute("url", "items");

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
		model.addAttribute("url", "orders");
		int totalRecords = orderService.getTotalPage(search);
		search = search == null ? "" : search;

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
	public String addOrder(Model model, RedirectAttributes redirectAttributes, @PathVariable("id") int id) {
		model.addAttribute("url", "orders");
		orderService.addOrder(id);
		redirectAttributes.addAttribute("id", id);
		redirectAttributes.addAttribute("type", "add");
		return "redirect:/admin/orders";
	}

	@GetMapping("orders/delete/{id}")
	public String deleteOrder(Model model, RedirectAttributes redirectAttributes, @PathVariable("id") int id) {
		model.addAttribute("url", "orders");
		orderService.deletOrder(id);
		redirectAttributes.addAttribute("id", id);
		redirectAttributes.addAttribute("type", "delete");
		return "redirect:/admin/orders";
	}

	@GetMapping("items/delete/{id}")
	public String deleteItem(Model model, RedirectAttributes redirectAttributes, @PathVariable("id") int id) {
		model.addAttribute("url", "items");
		itemService.deleteItem(id);
		redirectAttributes.addAttribute("id", id);
		redirectAttributes.addAttribute("type", "delete");
		return "redirect:/admin/items";
	}

	@Autowired
	private ItemService itemService;

	@GetMapping({ "", "/" })
	public String overview(Model model, @RequestParam(name = "time", required = false) String time) {
		model.addAttribute("url", "");
		LocalDate duration = null;
		if (time == null) {
			duration = LocalDate.now();
		} else {
			time = time + "-01";
			duration = DateUtil.convertToLocalDate(time, "yyyy-MM-dd");
		}
		int totalNewUser = userService.getTotalNewUserByMonth(duration);
		model.addAttribute("totalNewUser", totalNewUser);

		int totalOrder = orderService.getTotalOrderByMonth(duration);
		model.addAttribute("totalOrder", totalOrder);

		int totalRevenue = orderService.getTotalRevenueByMonth(duration);
		model.addAttribute("totalRevenue", totalRevenue);

		int totalIncome = orderService.getTotalIncomeByMonth(duration);
		model.addAttribute("totalIncome", totalIncome);

		List<Order> orders = orderService.getOrderByMonth(duration);
		model.addAttribute("orders", orders);
		model.addAttribute("sizeOrders", orders.size());

		List<UserDto> userDtos = userService.getCustomerOrderedInMonth(duration);
		model.addAttribute("userDtos", userDtos);
		model.addAttribute("sizeCustomers", userDtos.size());

		List<ItemDto> itemDtos = itemService.getSoldItemInMonth(duration);
		model.addAttribute("itemDtos", itemDtos);
		model.addAttribute("sizeItems", itemDtos.size());
		
		return "overview";
	}

	@GetMapping("/customer")
	public String customer(Model model, @RequestParam(name = "page", defaultValue = "1") Integer page,
			@RequestParam(name = "searchText", defaultValue = "") String searchText,
			@RequestParam(name = "field", defaultValue = "username") String field) {
		model.addAttribute("url", "customer");
		searchText = searchText == null ? "" : searchText;
		List<User> users = userService.getUserByRoleAndSearchCondition("ROLE_CUSTOMER", field, searchText, page);
		model.addAttribute("users", users);

		int totalCustomer = userService.getTotalUserByRoleAndSeachCondition("ROLE_CUSTOMER", field, searchText);
		int surplus = totalCustomer % 10;
		int totalPage = (totalCustomer / 10) + (surplus == 0 ? 0 : 1);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("currentPage", page);

		int nextPage = page + 1;

		if (nextPage > totalPage || nextPage < 1) {
			nextPage = totalPage;
		}
		model.addAttribute("nextPage", nextPage);

		int previousPage = page - 1;
		if (previousPage > totalPage || previousPage < 1) {
			previousPage = 1;
		}
		model.addAttribute("previousPage", previousPage);
		return "adminCustomer";
	}

	@GetMapping("/employee")
	public String employee(Model model, @RequestParam(name = "page", defaultValue = "1") Integer page,
			@RequestParam(name = "searchText", defaultValue = "") String searchText,
			@RequestParam(name = "field", defaultValue = "username") String field) {
		model.addAttribute("url", "employee");
		searchText = searchText == null ? "" : searchText;
		List<User> users = userService.getUserByRoleAndSearchCondition("ROLE_STAFF", field, searchText, page);
		model.addAttribute("users", users);

		int totalCustomer = userService.getTotalUserByRoleAndSeachCondition("ROLE_STAFF", field, searchText);
		int surplus = totalCustomer % 10;
		int totalPage = (totalCustomer / 10) + (surplus == 0 ? 0 : 1);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("currentPage", page);

		int nextPage = page + 1;

		if (nextPage > totalPage || nextPage < 1) {
			nextPage = totalPage;
		}
		model.addAttribute("nextPage", nextPage);

		int previousPage = page - 1;
		if (previousPage > totalPage || previousPage < 1) {
			previousPage = 1;
		}
		model.addAttribute("previousPage", previousPage);
		return "adminEmployee";
	}

	@GetMapping("/employee/delete/{username}")
	public String deleteEmployee(@PathVariable(name = "username") String username) {

		try {
			userService.disableUser(username);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/employee";
	}

	@GetMapping("/employee/add")
	public String addEmployee(Model model) {
		model.addAttribute("url", "employee");
		model.addAttribute("user", new User());
		model.addAttribute("type", "add");
		return "addEmployee";
	}

	@GetMapping("/employee/update/{username}")
	public String updateEmployee(Model model, @PathVariable(name = "username") String username) {
		model.addAttribute("url", "employee");
		User user = userService.findByUsername(username);
		user.setPasswordConfirmation(user.getPassword());
		model.addAttribute("user", user);
		model.addAttribute("type", "update");
		return "addEmployee";
	}

	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}

	@PostMapping("/employee/save")
	public String saveEmployee(@Valid @ModelAttribute(name = "user") User user, BindingResult bindingResult,
			Model model) {
		model.addAttribute("url", "employee");
		if (bindingResult.hasErrors()) {
			return "addEmployee";
		}

		User existingUser = userService.findByUsername(user.getUsername());
		if (existingUser != null) {
			model.addAttribute("user", user);
			model.addAttribute("registrationError", "Username đã tồn tại.");
			return "addEmployee";
		}

		user.setRole(roleService.findByName("ROLE_STAFF"));
		userService.insertOrUpdate(user);
		return "redirect:/admin/employee";
	}

	@PostMapping("/employee/saveUpdate")
	public String updateEmployee(@Valid @ModelAttribute(name = "user") User user, BindingResult bindingResult,
			Model model) {
		model.addAttribute("url", "employee");
		if (bindingResult.hasErrors()) {
			return "addEmployee";
		}

		user.setRole(roleService.findByName("ROLE_STAFF"));
		userService.insertOrUpdate(user);
		return "redirect:/admin/employee";
	}
}
