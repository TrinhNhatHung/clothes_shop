package com.shop.controller;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.PostMapping;

import com.shop.entity.User;
import com.shop.service.RoleService;
import com.shop.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private RoleService roleService;

	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}

	@GetMapping("/login")
	public String login(HttpServletRequest request) {
		return "login";
	}

	@GetMapping("/access-denied")
	public String accessDenied() {
		return "access-denied";
	}

	@GetMapping("/signup")
	public String signup(Model model) {
		model.addAttribute("user", new User());
		return "signup";
	}

	@PostMapping("/processSignup")
	public String processSignup(@Valid @ModelAttribute("user") User user, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			return "signup";
		}

		User existingUser = userService.findByUsername(user.getUsername());
		if (existingUser != null) {
			model.addAttribute("user", user);
			model.addAttribute("registrationError", "Username đã tồn tại.");
			return "signup";
		}

		user.setRole(roleService.findByName("ROLE_CUSTOMER"));
		userService.insertOrUpdate(user);

		return "redirect:/";
	}

}