package com.josephcalver.olderly.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.josephcalver.olderly.models.Client;
import com.josephcalver.olderly.service.ClientsService;

@Controller
public class ClientsController {

	private ClientsService clientsService;

	@Autowired
	public void setClientsService(ClientsService clientsService) {
		this.clientsService = clientsService;
	}

	@RequestMapping("/clients")
	public String showClients(Model model) {
		List<Client> clients = clientsService.getAllClients();
		model.addAttribute("clients", clients);
		return "clients";
	}

	@RequestMapping("/newclient")
	public String showNewClient(Model model) {
		model.addAttribute("client", new Client());
		return "newclient";
	}

	@RequestMapping(value = "/createclient", method = RequestMethod.POST)
	public String createClient(@Valid Client client, BindingResult result) {

		if (result.hasErrors()) {
			return "newclient";
		}
		clientsService.create(client);
		return "redirect:clients";
	}

	@RequestMapping(value = "/editclient/{id}", method = RequestMethod.GET)
	public String editClient(@PathVariable("id") int id, Model model) {
		Client client = clientsService.getClient(id);
		model.addAttribute("client", client);
		return "editclient";
	}

	@RequestMapping(value = "/updateclient", method = RequestMethod.POST)
	public String updateClient(@Valid Client client, BindingResult result,
			@RequestParam(value = "delete", required = false) String delete) {

		if (delete != null) {
			clientsService.delete(client.getId());
			return "redirect:clients";
		}
		if (result.hasErrors()) {
			return "editclient";
		}
		clientsService.update(client);
		return "redirect:clients";
	}
}