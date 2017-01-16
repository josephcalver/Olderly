package com.josephcalver.olderly.controllers;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.josephcalver.olderly.models.Assignment;
import com.josephcalver.olderly.service.VolunteersService;

@Controller
public class VolunteersController {

	private VolunteersService volunteersService;

	@Autowired
	public void setVolunteersService(VolunteersService volunteersService) {
		this.volunteersService = volunteersService;
	}

	@RequestMapping(value = "/volunteer", method = RequestMethod.POST)
	public String signUp(@RequestParam("id") int id, Principal principal) {
		String username = principal.getName();
		volunteersService.signUp(username, id);
		return "redirect:myassignments";
	}

	@RequestMapping(value = "/cancel", method = RequestMethod.POST)
	public String cancelAssignment(@RequestParam("id") int id) {
		volunteersService.cancel(id);
		return "redirect:myassignments";
	}

	@RequestMapping(value = "/myassignments")
	public String showMyAssignments(Model model, Principal principal) {
		String username = principal.getName();
		List<Assignment> myAssignments = volunteersService.getMyAssignments(username);
		model.addAttribute("myAssignments", myAssignments);
		return "myassignments";
	}
	
}
