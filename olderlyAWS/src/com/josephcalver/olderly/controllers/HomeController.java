package com.josephcalver.olderly.controllers;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.josephcalver.olderly.models.User;
import com.josephcalver.olderly.service.UsersService;

@Controller
public class HomeController {

	private UsersService usersService;

	@Autowired
	public void setUsersService(UsersService usersService) {
		this.usersService = usersService;
	}

	@RequestMapping(value = "/")
	public String showHome(Model model, Principal principal) {

		if (principal != null) {
			String username = principal.getName();
			User user = usersService.getCurrentUser(username);
			model.addAttribute("user", user);
		}

		return "home";
	}

	@RequestMapping("/about")
	public String showAbout() {
		return "about";
	}

	@RequestMapping("/preview")
	public String showPreview() {
		return "preview";
	}

}
