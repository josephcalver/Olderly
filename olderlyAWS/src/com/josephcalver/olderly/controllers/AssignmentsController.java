package com.josephcalver.olderly.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.josephcalver.olderly.models.Assignment;
import com.josephcalver.olderly.models.Client;
import com.josephcalver.olderly.service.AssignmentsService;

@Controller
public class AssignmentsController {

	private AssignmentsService assignmentsService;

	@Autowired
	public void setAssignmentsService(AssignmentsService assignmentsService) {
		this.assignmentsService = assignmentsService;
	}

	@InitBinder
	public void initBinder(final WebDataBinder binder) {
		final SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	@RequestMapping("/assignments")
	public String showAssignments(Model model) {
		List<Assignment> assignments = assignmentsService.getAssignments();
		model.addAttribute("assignments", assignments);
		return "assignments";
	}

	@RequestMapping("/createassignment")
	public String createAssignment(Model model) {
		List<Client> clients = assignmentsService.getAllClients();
		model.addAttribute("clients", clients);
		model.addAttribute("assignment", new Assignment());
		return "createassignment";
	}

	@RequestMapping(value = "/docreate", method = RequestMethod.POST)
	public String doCreate(@Valid Assignment assignment, BindingResult result) {

		if (result.hasErrors()) {
			return "createassignment";
		}
		assignmentsService.create(assignment);
		return "redirect:assignments";
	}

	@RequestMapping(value = "/editassignment/{id}", method = RequestMethod.GET)
	public String editAssignment(@PathVariable("id") int id, Model model) {
		Assignment assignment = assignmentsService.getAssignment(id);
		model.addAttribute("assignment", assignment);
		return "editassignment";
	}

	@RequestMapping(value = "/updateassignment", method = RequestMethod.POST)
	public String updateAssignment(@Valid Assignment assignment, BindingResult result,
			@RequestParam(value = "delete", required = false) String delete) {

		if (delete != null) {
			assignmentsService.delete(assignment.getId());
			return "redirect:assignments";
		}

		if (result.hasErrors()) {
			return "editassignment";
		}
		assignmentsService.update(assignment);
		return "redirect:assignments";
	}
}
