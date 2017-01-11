package com.josephcalver.olderly.controllers;

import java.security.Principal;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.josephcalver.olderly.models.User;
import com.josephcalver.olderly.service.UsersService;
import com.josephcalver.olderly.service.VolunteersService;

@Controller
public class UsersController {

	private UsersService usersService;

	@Autowired
	public void setUsersService(UsersService usersService) {
		this.usersService = usersService;
	}

	private VolunteersService volunteersService;

	@Autowired
	public void setVolunteersService(VolunteersService volunteersService) {
		this.volunteersService = volunteersService;
	}

	@RequestMapping("/login")
	public String showLogin() {
		return "login";
	}

	@RequestMapping("/logout")
	public String logout() {
		return "loggedout";
	}
	
	@RequestMapping("/loggedout")
	public String showLoggedOut() {
		return "loggedout";
	}

	@RequestMapping("/accessdenied")
	public String showAccessDenied() {
		return "accessdenied";
	}

	@RequestMapping("/accountcreated")
	public String showAccountCreated() {
		return "accountcreated";
	}
	
	@RequestMapping("/accountupdated")
	public String showAccountUpdated() {
		return "accountupdated";
	}
	
	@RequestMapping("/accountdeleted")
	public String showAccountDeleted() {
		return "accountdeleted";
	}

	@RequestMapping("/newaccount")
	public String showNewAccount(Model model) {
		model.addAttribute("user", new User());
		return "newaccount";
	}

	@RequestMapping(value = "/createaccount", method = RequestMethod.POST)
	public String createAccount(@Valid User user, BindingResult result) {

		if (result.hasErrors()) {
			return "newaccount";
		}

		user.setAuthority("ROLE_USER");
		user.setEnabled(true);

		if (usersService.exists(user.getUsername())) {
			result.rejectValue("username", "DuplicateKey.user.username");
			return "newaccount";
		}

		try {
			usersService.create(user);
		} catch (DuplicateKeyException e) {
			result.rejectValue("username", "DuplicateKey.user.username");
			return "newaccount";
		}

		return "login";
	}

	@RequestMapping("/myaccount")
	public String showMyAccount(Model model, Principal principal) {

		String username = principal.getName();
		User user = usersService.getCurrentUser(username);
		model.addAttribute("user", user);

		return "myaccount";
	}

	@RequestMapping(value = "/updateaccount", method = RequestMethod.POST)
	public String updateAccount(@Valid User user, BindingResult result, Principal principal,
			@RequestParam(value = "delete", required = false) String delete) {

		String currentUser = principal.getName();

		if (result.hasErrors()) {
			return "myaccount";
		}

		if (delete == null) {
			try {
				usersService.updateAccount(user, currentUser);
			} catch (DuplicateKeyException e) {
				result.rejectValue("username", "DuplicateKey.user.username");
				return "myaccount";
			}
			return "redirect:accountupdated";
		}
		volunteersService.cancelAllAssignments(currentUser);
		usersService.delete(currentUser);

		return "accountdeleted";
	}

	@RequestMapping(value = "/volunteers")
	public String showVolunteers(Model model) {
		List<User> volunteers = usersService.getAllVolunteers();
		model.addAttribute("volunteers", volunteers);
		return "volunteers";
	}

	@RequestMapping(value = "/deletevolunteer", method = RequestMethod.POST)
	public String deleteVolunteer(@RequestParam("username") String username) {

		volunteersService.cancelAllAssignments(username);
		usersService.deleteVolunteer(username);

		return "redirect:volunteers";
	}
}
