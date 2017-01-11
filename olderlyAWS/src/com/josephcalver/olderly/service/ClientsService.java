package com.josephcalver.olderly.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;

import com.josephcalver.olderly.dao.ClientsDao;
import com.josephcalver.olderly.models.Client;

@Service("clientsService")
public class ClientsService {

	private ClientsDao clientsDao;

	@Autowired
	public void setClientsDao(ClientsDao clientsDao) {
		this.clientsDao = clientsDao;
	}

	@Secured("ROLE_ADMIN")
	public void create(Client client) {
		clientsDao.create(client);
	}

	@Secured("ROLE_ADMIN")
	public void update(Client client) {
		clientsDao.update(client);
	}

	public boolean exists(String telephone) {
		return clientsDao.exists(telephone);
	}

	@Secured("ROLE_ADMIN")
	public List<Client> getAllClients() {
		return clientsDao.getAllClients();
	}

	@Secured("ROLE_ADMIN")
	public Client getClient(int id) {
		return clientsDao.getClient(id);
	}

	@Secured("ROLE_ADMIN")
	public void delete(int id) {
		clientsDao.delete(id);
	}

}
