package com.shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.entity.Role;
import com.shop.entity.User;
import com.shop.service.RoleService;
import com.shop.service.UserDetailServiceImpl;
import com.shop.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private RoleService roleService;

	@Autowired
	private UserDetailServiceImpl userDetailService;

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
		return "accessDenied";
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

		user.setEnable(true);
		user.setRole(roleService.findByName("ROLE_CUSTOMER"));
		userService.insertOrUpdate(user);

		return "redirect:/";
	}

	@GetMapping("/adminLogin")
	public String adminLogin() {
		return "adminLogin";
	}

	@PostMapping("/processAdminLogin")
	public String processAdminLogin(@RequestParam(name = "username") String username,
			@RequestParam(name = "password") String password, @RequestParam(name = "role") String roleName,
			Model model, HttpServletRequest request) {
		String redirectUrl = "admin";
		if (roleName.equals(Role.ROLE_STAFF)) {
			redirectUrl = "employee";
		}
		
		try {
			UserDetails userDetails = userDetailService.loadAdminOrStaffByUserName(username, roleName);
			if (userDetails.getPassword().equals(password)) {
				UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(
						userDetails, null, userDetails.getAuthorities());
				usernamePasswordAuthenticationToken
						.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
				SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);
			}
			
			return "redirect:/" + redirectUrl;
		} catch (Exception e) {
			return "redirect:/adminLogin?error";
		}
	}

}